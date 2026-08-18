// INFO ====================================================
// Purpose: Verify description/ and dictionary/ stay in sync
//==========================================================
/ Structural checks over the already-loaded namespaces (no example
/ execution, so this topic has no capture.q, unlike the other test
/ topics).
/ -
/ Check 1 - coverage: every description leaf under a topic's
/ .kdb.desc.* namespace must be reachable through the matching
/ .kdb.dict.* lookup table, so new descriptions can't be added
/ without also wiring them into the dictionary (the bug that let
/ divide/minus/multiplication/plus/equal/eachboth/fill/sevenv sit
/ undiscoverable in description/keywords.q).
/ -
/ Check 2 - no accidental duplicate wiring: two different dictionary
/ keys should not point at the exact same description text (the bug
/ that left dictionary/internals.q mapping both `$"-6!" and `$"-7!"
/ to .kdb.desc.func.minus6Bang).
/ -
/ `internals` (the -N! bang functions) is intentionally excluded from
/ the coverage check: its dictionary keys ("-1!", "-2!", ...) bear no
/ mechanical relationship to their description leaf names
/ (minus1Bang, minus2Bang, ...), so coverage can't be verified
/ structurally - only curated by hand. It still gets the duplicate
/ check.

// Author: Spencer
//==========================================================

/ --------------------------------------------------
/ topics with description leaf names that match their dictionary
/ keys (case-insensitively), optionally after an alias rewrite
/ --------------------------------------------------
.test.consistency.topics:([]
  topic:        `keywords`iterators`joins`overloads`dataTypes`errors`args`tables`namespaceJ`namespaceQ`namespaceZ;
  dictNamespace:`.kdb.dict.keywords`.kdb.dict.iterators`.kdb.dict.joins`.kdb.dict.overloads`.kdb.dict.dataTypes`.kdb.dict.errors`.kdb.dict.cli`.kdb.dict.tables`.kdb.dict.j`.kdb.dict.Q`.kdb.dict.Z;
  descNamespace:`.kdb.desc.keywords`.kdb.desc.iterators`.kdb.desc.joins`.kdb.desc.overloads`.kdb.desc.datatypes`.kdb.desc.errors`.kdb.desc.args`.kdb.desc.tables`.kdb.desc.func.j`.kdb.desc.func.Q`.kdb.desc.func.z
 );

/ topic-specific (dictKeyLower -> descLeafLower) aliases, for cases
/ where the dictionary intentionally shortens the description name
.test.consistency.aliases:([] topic:`tables`tables; dictKeyLower:`splayed`partition; descLeafLower:`splayedtables`partitions);

/ --------------------------------------------------
/ lowercase-string form of a namespace child symbol; namespaceQ
/ dictionary keys embed their namespace prefix (`.Q.A), so only the
/ last dot-separated token is used
/ --------------------------------------------------
.test.consistency.normalize:{[sym]
  `$lower last "." vs string sym
 };

/ --------------------------------------------------
/ description leaves defined directly under a namespace
/ --------------------------------------------------
.test.consistency.descLeaves:{[descNamespace]
  leaves:key descNamespace;
  leaves where leaves<>`
 };

/ --------------------------------------------------
/ dictionary keys normalized, with topic aliases applied
/ --------------------------------------------------
.test.consistency.dictLeaves:{[topicName;dictNamespace]
  rawKeys:.test.consistency.normalize each key dictNamespace;
  aliasRows:select from .test.consistency.aliases where topic=topicName;
  aliasMap:aliasRows[`dictKeyLower]!aliasRows[`descLeafLower];
  {$[x in key y; y x; x]}[;aliasMap] each rawKeys
 };

/ --------------------------------------------------
/ description leaves with no dictionary coverage for one topic
/ --------------------------------------------------
.test.consistency.missingForTopic:{[topicName;dictNamespace;descNamespace]
  descLeavesRaw:.test.consistency.descLeaves descNamespace;
  descLeavesNorm:.test.consistency.normalize each descLeavesRaw;
  dictLeavesNorm:.test.consistency.dictLeaves[topicName;dictNamespace];
  missingMask:not descLeavesNorm in dictLeavesNorm;
  descLeavesRaw where missingMask
 };

/ --------------------------------------------------
/ coverage check across all configured topics
/ --------------------------------------------------
.test.consistency.checkCoverage:{[]
  results:();
  i:0;
  n:count .test.consistency.topics;

  while[i<n;
    row:.test.consistency.topics i;
    missing:.test.consistency.missingForTopic[row`topic;row`dictNamespace;row`descNamespace];
    label:"coverage - ",string row`topic;
    detail:$[0=count missing;"ok";"missing from dictionary: ",", " sv string missing];
    results,:enlist `label`pass`detail!(label;0=count missing;detail);
    i+:1
  ];

  results
 };

/ --------------------------------------------------
/ description <-> example coverage: every description leaf must have
/ a matching runnable example under .kdb.exp.*, so a keyword can't
/ have prose without a demonstration (the gap that left divide, do,
/ if, set, upper, xcol, and 21 others undemonstrated in example/).
/ Leaf names on this side match exactly (no dictionary-style key
/ shortening), so no alias table is needed here.
/ -
/ `internals` needs the sub-namespace markers (j, Q, z) filtered out
/ of both sides before comparing, since .kdb.desc.func and
/ .kdb.exp.func hold the minusNBang leaves AND the j/Q/z sub-contexts
/ side by side; excludeLeaves below does that.
/ --------------------------------------------------
.test.consistency.exampleTopics:([]
  topic:        `keywords`iterators`joins`overloads`dataTypes`errors`args`tables`namespaceJ`namespaceQ`namespaceZ`internals;
  descNamespace:`.kdb.desc.keywords`.kdb.desc.iterators`.kdb.desc.joins`.kdb.desc.overloads`.kdb.desc.datatypes`.kdb.desc.errors`.kdb.desc.args`.kdb.desc.tables`.kdb.desc.func.j`.kdb.desc.func.Q`.kdb.desc.func.z`.kdb.desc.func;
  expNamespace: `.kdb.exp.keywords`.kdb.exp.iterators`.kdb.exp.joins`.kdb.exp.overloads`.kdb.exp.dataTypes`.kdb.exp.errors`.kdb.exp.args`.kdb.exp.tables`.kdb.exp.j`.kdb.exp.func.Q`.kdb.exp.func.z`.kdb.exp.func
 );

/ leaf names to ignore on both sides of a topic's comparison (namespace markers, not real leaves)
.test.consistency.exampleExcludeLeaves:([] topic:`internals`internals`internals; leaf:`j`Q`z);

/ --------------------------------------------------
/ description leaves for one topic, with that topic's excludes applied
/ --------------------------------------------------
.test.consistency.exampleDescLeaves:{[topicName;descNamespace]
  leaves:.test.consistency.descLeaves descNamespace;
  excludes:exec leaf from .test.consistency.exampleExcludeLeaves where topic=topicName;
  leaves where not leaves in excludes
 };

/ --------------------------------------------------
/ example leaves with no matching description leaf are irrelevant here;
/ this check only cares about the other direction (desc -> exp), so
/ example leaves are just normalized for lookup, no excludes needed
/ since a topic's example namespace never holds unrelated children
/ --------------------------------------------------
.test.consistency.exampleLeavesNorm:{[expNamespace]
  .test.consistency.normalize each .test.consistency.descLeaves expNamespace
 };

/ --------------------------------------------------
/ description leaves with no runnable example for one topic
/ --------------------------------------------------
.test.consistency.missingExampleForTopic:{[topicName;descNamespace;expNamespace]
  descLeavesRaw:.test.consistency.exampleDescLeaves[topicName;descNamespace];
  descLeavesNorm:.test.consistency.normalize each descLeavesRaw;
  expLeavesNorm:.test.consistency.exampleLeavesNorm expNamespace;
  missingMask:not descLeavesNorm in expLeavesNorm;
  descLeavesRaw where missingMask
 };

/ --------------------------------------------------
/ example coverage check across all configured topics
/ --------------------------------------------------
.test.consistency.checkExampleCoverage:{[]
  results:();
  i:0;
  n:count .test.consistency.exampleTopics;

  while[i<n;
    row:.test.consistency.exampleTopics i;
    missing:.test.consistency.missingExampleForTopic[row`topic;row`descNamespace;row`expNamespace];
    label:"example coverage - ",string row`topic;
    detail:$[0=count missing;"ok";"missing example for: ",", " sv string missing];
    results,:enlist `label`pass`detail!(label;0=count missing;detail);
    i+:1
  ];

  results
 };

/ --------------------------------------------------
/ duplicate key groups that are known and intentional, so the check
/ doesn't flag them forever - each is a case where two keys legitimately
/ share one description rather than a copy/paste wiring mistake:
/ eachLeft/eachRight and dotApply/dotIndex share verbatim prose in
/ description/iterators.q and description/overloads.q (a content-quality
/ gap worth revisiting, but not a dictionary wiring bug), and 0N/-1! in
/ dictionary/internals.q is a deliberate legacy alias for the same op
/ --------------------------------------------------
.test.consistency.duplicateWhitelist:([]
  label:`iterators`overloads`internals;
  keyGroup:(`eachLeft`eachRight; `dotApply`dotIndex; `$("0N";"-1!"))
 );

/ --------------------------------------------------
/ whether a duplicate key group is on the whitelist for a dict label
/ --------------------------------------------------
.test.consistency.isWhitelistedDuplicate:{[lbl;grp]
  candidates:exec keyGroup from .test.consistency.duplicateWhitelist where label=lbl;
  sortedGrp:asc grp;
  any sortedGrp~/:asc each candidates
 };

/ --------------------------------------------------
/ duplicate-wiring check for one dictionary namespace
/ --------------------------------------------------
.test.consistency.duplicatesForDict:{[dictLabel;dictNamespace]
  keysList:key dictNamespace;
  valsList:value value dictNamespace;
  n:count keysList;
  handled:n#0b;
  dupKeyGroups:();
  i:0;

  while[i<n;
    if[not handled i;
      matchMask:{[lst;item] lst~\:item}[valsList;valsList i];
      matchIdx:where matchMask;

      if[1<count matchIdx;
        grp:keysList matchIdx;
        if[not .test.consistency.isWhitelistedDuplicate[`$dictLabel;grp];
          dupKeyGroups,:enlist grp
        ];
        handled[matchIdx]:1b
      ]
    ];
    i+:1
  ];

  label:"no duplicate wiring - ",dictLabel;
  detail:$[0=count dupKeyGroups;"ok";"keys pointing at the same description: ",", " sv {"(",(", " sv string x),")"} each dupKeyGroups];
  `label`pass`detail!(label;0=count dupKeyGroups;detail)
 };

/ --------------------------------------------------
/ duplicate-wiring check across every dictionary, including internals
/ --------------------------------------------------
.test.consistency.checkDuplicates:{[]
  allDicts:([] label:`keywords`iterators`joins`overloads`dataTypes`errors`args`tables`namespaceJ`namespaceQ`namespaceZ`internals;
                namespace:`.kdb.dict.keywords`.kdb.dict.iterators`.kdb.dict.joins`.kdb.dict.overloads`.kdb.dict.dataTypes`.kdb.dict.errors`.kdb.dict.cli`.kdb.dict.tables`.kdb.dict.j`.kdb.dict.Q`.kdb.dict.Z`.kdb.dict.bang);

  .test.consistency.duplicatesForDict'[string allDicts`label;allDicts`namespace]
 };

/ --------------------------------------------------
/ run every consistency check
/ --------------------------------------------------
.test.consistency.runAll:{[]
  .test.consistency.checkCoverage[],.test.consistency.checkExampleCoverage[],.test.consistency.checkDuplicates[]
 };
