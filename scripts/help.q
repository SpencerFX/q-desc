// INFO ====================================================
// Purpose: Unified lookup - given a symbol, find its description,
// category (for keywords), and run its example, across all topics
//==========================================================
/ Requires the standard Quick Start .kdb.init calls to have already
/ been run (description/, dictionary/, data/, example/) - this file
/ only adds a lookup layer on top of what they populate.
/ -
/ Internal helpers live under .kdb.helpx.* rather than .kdb.help.* -
/ .kdb.help itself is the single callable entry point, and a q
/ variable can't also be a namespace containing sub-entries, so the
/ helpers need a distinct prefix.

// Author: Spencer
//==========================================================

/ --------------------------------------------------
/ topic -> (description namespace; example namespace), matching the
/ conventions mapped out in tests/consistency/test_consistency.q -
/ these differ per topic (.kdb.exp.j.* has no "func" segment,
/ .kdb.exp.func.Q.* and .kdb.exp.func.z.* do) for reasons that are
/ purely historical, not something this file tries to fix
/ --------------------------------------------------
.kdb.helpx.topics:([]
  topic:        `keywords`iterators`joins`overloads`dataTypes`errors`args`tables`namespaceJ`namespaceQ`namespaceZ`internals;
  descNamespace:`.kdb.desc.keywords`.kdb.desc.iterators`.kdb.desc.joins`.kdb.desc.overloads`.kdb.desc.datatypes`.kdb.desc.errors`.kdb.desc.args`.kdb.desc.tables`.kdb.desc.func.j`.kdb.desc.func.Q`.kdb.desc.func.z`.kdb.desc.func;
  expNamespace: `.kdb.exp.keywords`.kdb.exp.iterators`.kdb.exp.joins`.kdb.exp.overloads`.kdb.exp.dataTypes`.kdb.exp.errors`.kdb.exp.args`.kdb.exp.tables`.kdb.exp.j`.kdb.exp.func.Q`.kdb.exp.func.z`.kdb.exp.func
 );

/ internals shares .kdb.desc.func / .kdb.exp.func with namespaceJ/Q/Z,
/ so those three sub-namespace names need excluding to avoid treating
/ them as if they were themselves leaf entries under internals
.kdb.helpx.internalsExclude:`j`Q`z;

/ --------------------------------------------------
/ leaf children of a namespace, filtered clean of the blank-symbol
/ artifact q's own reflection leaves at the front of the list
/ --------------------------------------------------
.kdb.helpx.leaves:{[ns]
  raw:key ns;
  raw where raw<>`
 };

/ --------------------------------------------------
/ leaf symbols available under one topic
/ --------------------------------------------------
.kdb.helpx.leavesForTopic:{[topicRow]
  leaves:.kdb.helpx.leaves topicRow`descNamespace;
  $[topicRow[`topic]=`internals;
    leaves where not leaves in .kdb.helpx.internalsExclude;
    leaves]
 };

/ --------------------------------------------------
/ last dot-separated token of a symbol, e.g. `.Q.qt -> `qt, `.z.a -> `a
/ (natural input for the topics whose real q name is dotted, since
/ their leaf names are bare)
/ --------------------------------------------------
.kdb.helpx.lastToken:{[sym]
  `$last "." vs string sym
 };

/ --------------------------------------------------
/ every topic where sym is a genuine leaf (a plain symbol match, or
/ - as a fallback - a match on its last dot-separated token)
/ --------------------------------------------------
.kdb.helpx.findTopics:{[sym]
  directHit:{[sym;row] sym in .kdb.helpx.leavesForTopic row}[sym];
  hits:.kdb.helpx.topics where directHit each .kdb.helpx.topics;

  if[0=count hits;
    tokenSym:.kdb.helpx.lastToken sym;
    if[not tokenSym~sym;
      tokenHit:{[sym;row] sym in .kdb.helpx.leavesForTopic row}[tokenSym];
      hits:.kdb.helpx.topics where tokenHit each .kdb.helpx.topics
    ]
  ];

  hits`topic
 };

/ --------------------------------------------------
/ which .kdb.dict.category groups (keywords only) contain sym
/ --------------------------------------------------
.kdb.helpx.categoryFor:{[topicName;sym]
  if[not topicName=`keywords;
    :`
  ];
  catNames:key .kdb.dict.category;
  hitMask:{[sym;catList] sym in catList}[sym] each value .kdb.dict.category;
  hits:catNames where hitMask;
  $[0=count hits;`;first hits]
 };

/ --------------------------------------------------
/ description text for sym under one topic (matching by last token,
/ same as findTopics, so lookups by dotted name resolve consistently)
/ --------------------------------------------------
.kdb.helpx.descFor:{[topicRow;sym]
  leaves:.kdb.helpx.leavesForTopic topicRow;
  match:$[sym in leaves;sym;.kdb.helpx.lastToken sym];
  ns:topicRow`descNamespace;
  fullPath:`$(string ns),".",string match;
  value fullPath
 };

/ --------------------------------------------------
/ example function for sym under one topic, or (::) if none exists
/ (a topic in the description/example backlog, e.g. dataTypes/errors)
/ --------------------------------------------------
.kdb.helpx.exampleFnFor:{[topicRow;sym]
  leaves:.kdb.helpx.leaves topicRow`expNamespace;
  match:$[sym in leaves;sym;.kdb.helpx.lastToken sym];
  $[match in leaves;
    value `$(string topicRow`expNamespace),".",string match;
    (::)]
 };

/ --------------------------------------------------
/ print + run everything for one confirmed (topic, sym) pair,
/ returning a one-row result for the caller to inspect
/ --------------------------------------------------
.kdb.helpx.showOne:{[topicName;sym]
  topicRow:first select from .kdb.helpx.topics where topic=topicName;
  descText:.kdb.helpx.descFor[topicRow;sym];
  categorySym:.kdb.helpx.categoryFor[topicName;sym];
  exampleFn:.kdb.helpx.exampleFnFor[topicRow;sym];
  hasExample:not exampleFn~(::);

  -1 "";
  -1 "=== ",(string sym)," (",(string topicName),") ===";
  if[not categorySym~`;
    -1 "category: ",string categorySym
  ];
  -1 descText;

  exampleRan:0b;
  exampleErr:"";
  if[hasExample;
    -1 "";
    -1 "--- example ---";
    exampleErr:.[{[fn] fn[];""};enlist exampleFn;{x}];
    exampleRan:0=count exampleErr
  ];

  ([] symbol:enlist sym;
      topic:enlist topicName;
      category:enlist categorySym;
      description:enlist descText;
      hasExample:enlist hasExample;
      exampleRan:enlist exampleRan;
      exampleError:enlist exampleErr)
 };

/ --------------------------------------------------
/ list-only summary for an ambiguous (multi-topic) match, without
/ running any example
/ --------------------------------------------------
.kdb.helpx.showAmbiguous:{[sym;topicList]
  -1 "";
  -1 (string sym)," is ambiguous - found in ",(string count topicList)," topics: ",", " sv string topicList;
  -1 "call .kdb.help(topic;`",(string sym),") to pick one, e.g. .kdb.help(`",(string first topicList),";`",(string sym),")";

  rows:{[sym;topicRow]
    topicName:topicRow`topic;
    descText:.kdb.helpx.descFor[topicRow;sym];
    `symbol`topic`category`description`hasExample`exampleRan`exampleError!(
      sym;topicName;.kdb.helpx.categoryFor[topicName;sym];descText;0b;0b;"")
   }[sym] each .kdb.helpx.topics where .kdb.helpx.topics[`topic] in topicList;

  rows
 };

/ --------------------------------------------------
/ not-found result
/ --------------------------------------------------
.kdb.helpx.showNotFound:{[sym]
  -1 "";
  -1 "no entry found for `",string sym;
  ([] symbol:`symbol$(); topic:`symbol$(); category:`symbol$(); description:(); hasExample:`boolean$(); exampleRan:`boolean$(); exampleError:())
 };

/ --------------------------------------------------
/ public entry point: .kdb.help`avg searches every topic; if the name
/ is ambiguous across topics (e.g. `b exists in both args and
/ namespaceZ), pass a (topic;symbol) pair instead: .kdb.help(`args;`b)
/ --------------------------------------------------
.kdb.help:{[x]
  isPair:(11h=type x) and 2=count x;

  $[isPair;
    [
      topicName:first x;
      sym:last x;
      matchedTopics:.kdb.helpx.findTopics sym;
      $[topicName in matchedTopics;
        .kdb.helpx.showOne[topicName;sym];
        .kdb.helpx.showNotFound sym]
    ];
    [
      sym:x;
      matchedTopics:.kdb.helpx.findTopics sym;
      $[0=count matchedTopics;
        .kdb.helpx.showNotFound sym;
        1=count matchedTopics;
        .kdb.helpx.showOne[first matchedTopics;sym];
        .kdb.helpx.showAmbiguous[sym;matchedTopics]]
    ]
  ]
 };
