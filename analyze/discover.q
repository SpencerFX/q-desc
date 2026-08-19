/ ==================================================
/ analyze discover functions
/ ==================================================

/ --------------------------------------------------
/ normalize script lines to list
/ --------------------------------------------------
.analyze.discover.normalizeLines:{[scriptLines]
  $[10h=type scriptLines; enlist scriptLines; scriptLines]
 };

/ --------------------------------------------------
/ convert one line to char vector safely
/ --------------------------------------------------
.analyze.discover.toLineString:{[line]
  $[10h=type line; line; string line]
 };

/ --------------------------------------------------
/ whether a line is entirely a comment (first non-space char is /) -
/ evidence-gathering skips these, since a keyword-like English word
/ in comment prose (e.g. "or", "in", "not", "each", "key") is not
/ evidence the script actually uses that keyword
/ --------------------------------------------------
.analyze.discover.isCommentLine:{[line]
  lineStr:.analyze.discover.toLineString line;
  trimmed:ltrim lineStr;
  (0<count trimmed) and "/"~first trimmed
 };

/ --------------------------------------------------
/ check whether one line contains pattern
/ --------------------------------------------------
.analyze.discover.lineHasPattern:{[line;patternText]
  lineStr:.analyze.discover.toLineString line;
  patStr:patternText;
  patLen:count patStr;
  rem:lineStr;
  sub:"";

  if[0=patLen;
    :1b
  ];

  while[patLen<=count rem;
    sub:patLen#rem;
    if[sub~patStr;
      :1b
    ];
    rem:1 _ rem
  ];

  0b
 };

/ --------------------------------------------------
/ find whether script contains pattern
/ --------------------------------------------------
.analyze.discover.hasPattern:{[scriptLines;patternText]
  lines:.analyze.discover.normalizeLines scriptLines;
  i:0;
  n:count lines;

  while[i<n;
    if[.analyze.discover.lineHasPattern[lines i;patternText];
      :1b
    ];
    i+:1
  ];

  0b
 };
/ --------------------------------------------------
/ build evidence rows for one pattern
/ --------------------------------------------------
.analyze.discover.patternEvidence:{[scriptLines;category;useCase;patternText]
  lines:.analyze.discover.normalizeLines scriptLines;
  i:0;
  n:count lines;

  categories:`symbol$();
  useCases:`symbol$();
  patterns:();
  lineNumbers:`long$();
  lineTexts:();

  while[i<n;
    if[(not .analyze.discover.isCommentLine lines i) and .analyze.discover.lineHasPattern[lines i;patternText];
      categories,:enlist category;
      useCases,:enlist useCase;
      patterns,:enlist string patternText;
      lineNumbers,:enlist 1+i;
      lineTexts,:enlist .analyze.discover.toLineString lines i
    ];
    i+:1
  ];

  ([] category:categories;
      useCase:useCases;
      pattern:patterns;
      lineNumber:lineNumbers;
      lineText:lineTexts)
 };
/ --------------------------------------------------
/ build evidence rows for a list of patterns
/ --------------------------------------------------
.analyze.discover.patternListEvidence:{[scriptLines;category;useCase;patternList]
  rows:([] category:`symbol$();useCase:`symbol$();pattern:();lineNumber:`long$();lineText:());
  i:0;
  n:count patternList;

  while[i<n;
    rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;category;useCase;patternList i]);
    i+:1
  ];

  distinct rows
 };

/ --------------------------------------------------
/ character class check: is ch part of a longer identifier
/ (alphanumeric, underscore, or dot - the last so a namespaced name
/ like .foo.sum doesn't count as a bare use of the sum keyword)
/ --------------------------------------------------
.analyze.discover.isIdentChar:{[ch]
  (ch within "az") or (ch within "AZ") or (ch within "09") or (ch in "_.")
 };

/ --------------------------------------------------
/ like lineHasPattern, but requires the match not be embedded inside
/ a longer identifier - without this, a bare keyword name like "sum"
/ matches inside "sumOver", which is noise rather than a real usage
/ --------------------------------------------------
.analyze.discover.lineHasWordBoundaryPattern:{[line;patternText]
  lineStr:.analyze.discover.toLineString line;
  patLen:count patternText;
  n:count lineStr;
  i:0;
  found:0b;

  if[0=patLen;
    :1b
  ];

  while[i<=n-patLen;
    if[patternText~patLen#i _ lineStr;
      leftIdx:i-1;
      leftIsIdent:$[i=0;0b;.analyze.discover.isIdentChar lineStr leftIdx];
      leftOk:(i=0) or (not leftIsIdent);

      rightIdx:i+patLen;
      rightIsIdent:$[rightIdx=n;0b;.analyze.discover.isIdentChar lineStr rightIdx];
      rightOk:(rightIdx=n) or (not rightIsIdent);

      if[leftOk and rightOk;
        found:1b
      ]
    ];
    i+:1
  ];

  found
 };

/ --------------------------------------------------
/ like patternEvidence, but matches on word boundaries only
/ --------------------------------------------------
.analyze.discover.patternEvidenceWB:{[scriptLines;category;useCase;patternText]
  lines:.analyze.discover.normalizeLines scriptLines;
  i:0;
  n:count lines;

  categories:`symbol$();
  useCases:`symbol$();
  patterns:();
  lineNumbers:`long$();
  lineTexts:();

  while[i<n;
    if[(not .analyze.discover.isCommentLine lines i) and .analyze.discover.lineHasWordBoundaryPattern[lines i;patternText];
      categories,:enlist category;
      useCases,:enlist useCase;
      patterns,:enlist string patternText;
      lineNumbers,:enlist 1+i;
      lineTexts,:enlist .analyze.discover.toLineString lines i
    ];
    i+:1
  ];

  ([] category:categories;
      useCase:useCases;
      pattern:patterns;
      lineNumber:lineNumbers;
      lineText:lineTexts)
 };

/ -------------------------------------------------
/ evidence for iterator-related patterns
/ --------------------------------------------------
.analyze.discover.iteratorsEvidence:{[scriptLines]
  rows:([] category:`symbol$();useCase:`symbol$();pattern:();lineNumber:`long$();lineText:());

  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`iterator;`each;"+/'"]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`iterator;`over;"+/"]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`iterator;`scan;"+\\"]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`iterator;`prior;"prior"]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`iterator;`prior;"deltas"]);

  distinct rows
 };

/ --------------------------------------------------
/ evidence for join-related patterns
/ --------------------------------------------------
.analyze.discover.joinsEvidence:{[scriptLines]
  rows:([] category:`symbol$();useCase:`symbol$();pattern:();lineNumber:`long$();lineText:());

  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`join;`aj;"aj["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`join;`lj;"lj["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`join;`ij;"ij["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`join;`uj;"uj["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`join;`pj;"pj["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`join;`ej;"ej["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`join;`wj;"wj["]);

  rows
 };
/ --------------------------------------------------
/ evidence for overload-related patterns
/ --------------------------------------------------
.analyze.discover.overloadsEvidence:{[scriptLines]
  rows:([] category:`symbol$();useCase:`symbol$();pattern:();lineNumber:`long$();lineText:());

  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`overload;`vectorConditional;"?["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`overload;`findOrRollOrPermute;" ? "]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`overload;`indexAt;"@/"]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`overload;`amendOrTrap;"@["]);
  rows:raze (rows;.analyze.discover.patternEvidence[scriptLines;`overload;`dotApplyOrTrap;".["]);

  rows
 };

/ --------------------------------------------------
/ discover iterator-related patterns
/ --------------------------------------------------
.analyze.discover.iterators:{[scriptLines]
  distinct .analyze.discover.iteratorsEvidence[scriptLines]`useCase
 };

/ --------------------------------------------------
/ discover join-related patterns
/ --------------------------------------------------
.analyze.discover.joins:{[scriptLines]
  distinct .analyze.discover.joinsEvidence[scriptLines]`useCase
 };

/ --------------------------------------------------
/ discover overload-related patterns
/ --------------------------------------------------
.analyze.discover.overloads:{[scriptLines]
  distinct .analyze.discover.overloadsEvidence[scriptLines]`useCase
 };

/ --------------------------------------------------
/ collect all evidence (iterator/join/overload only) - kept for
/ backward compatibility; .catalogEvidence below covers every topic
/ --------------------------------------------------
.analyze.discover.evidence:{[scriptLines]
  rows:([] category:`symbol$();useCase:`symbol$();pattern:();lineNumber:`long$();lineText:());
  rows,: .analyze.discover.iteratorsEvidence scriptLines;
  rows,: .analyze.discover.joinsEvidence scriptLines;
  rows,: .analyze.discover.overloadsEvidence scriptLines;
  rows
 };

/ --------------------------------------------------
/ the original 17 iterator/join/overload patterns, as a catalog table.
/ operation is a short display label for the underlying idiom (used
/ by analyze/categorize.q's per-function output) - it's independent
/ of pattern, e.g. useCase `each has pattern "+/'" but operation "'"
/ --------------------------------------------------
.analyze.discover.baseCatalog:{[]
  ([]
    category:`iterator`iterator`iterator`iterator`iterator`join`join`join`join`join`join`join`overload`overload`overload`overload`overload;
    useCase: `each`over`scan`prior`prior`aj`lj`ij`uj`pj`ej`wj`vectorConditional`findOrRollOrPermute`indexAt`amendOrTrap`dotApplyOrTrap;
    operation:("'";"/";"\\";"prior";"prior";"aj";"lj";"ij";"uj";"pj";"ej";"wj";"?";"?";"@";"@";".");
    pattern: ("+/'";"+/";"+\\";"prior";"deltas";"aj[";"lj[";"ij[";"uj[";"pj[";"ej[";"wj[";"?[";" ? ";"@/";"@[";".[");
    wordBoundary:17#0b
  )
 };

/ --------------------------------------------------
/ every keyword as its own pattern, matched on word boundaries so a
/ bare name like "sum" doesn't fire on "sumOver" (see
/ lineHasWordBoundaryPattern) - reflects .kdb.exp.keywords directly
/ rather than hand-listing 175+ names
/ --------------------------------------------------
.analyze.discover.keywordCatalog:{[]
  leaves:key `.kdb.exp.keywords;
  leaves:leaves where leaves<>`;
  n:count leaves;
  patterns:string each leaves;

  ([] category:n#`keyword;
      useCase:leaves;
      operation:patterns;
      pattern:patterns;
      wordBoundary:n#1b)
 };

/ --------------------------------------------------
/ one dotted-namespace catalog (.j.*, .Q.*, .z.*) - the pattern is
/ the real dotted name (e.g. ".Q.qt"), not the bare leaf, since
/ that's what actually appears in script source
/ --------------------------------------------------
.analyze.discover.namespaceCatalog:{[category;ns;dottedPrefix]
  leaves:key ns;
  leaves:leaves where leaves<>`;
  n:count leaves;
  patterns:dottedPrefix,/:string each leaves;

  ([] category:n#category;
      useCase:leaves;
      operation:patterns;
      pattern:patterns;
      wordBoundary:n#0b)
 };

/ --------------------------------------------------
/ internal -N! functions, keyed off dictionary/internals.q's own
/ bang-notation keys directly (there's no mechanical way to derive
/ "-1!" from its description leaf name minus1Bang, so the curated
/ dictionary mapping is the only source of truth for this one).
/ `0N is excluded: it's a deliberate legacy alias for -1! in the
/ dictionary, but as a bare pattern it's just q's null-int literal -
/ it would fire on nearly every script that uses a null int, which
/ is noise, not evidence of using -1!
/ --------------------------------------------------
.analyze.discover.internalsCatalog:{[]
  bangKeys:key `.kdb.dict.bang;
  bangKeys:bangKeys where bangKeys<>`0N;
  n:count bangKeys;
  patterns:string each bangKeys;

  ([] category:n#`internals;
      useCase:bangKeys;
      operation:patterns;
      pattern:patterns;
      wordBoundary:n#0b)
 };

/ --------------------------------------------------
/ every topic's patterns in one table
/ --------------------------------------------------
.analyze.discover.catalog:{[]
  raze (
    .analyze.discover.baseCatalog[];
    .analyze.discover.keywordCatalog[];
    .analyze.discover.namespaceCatalog[`namespaceJ;`.kdb.exp.j;".j."];
    .analyze.discover.namespaceCatalog[`namespaceQ;`.kdb.exp.func.Q;".Q."];
    .analyze.discover.namespaceCatalog[`namespaceZ;`.kdb.exp.func.z;".z."];
    .analyze.discover.internalsCatalog[]
  )
 };

/ --------------------------------------------------
/ evidence for every row of a catalog table, dispatching to the
/ word-boundary matcher only where the catalog asks for it
/ --------------------------------------------------
.analyze.discover.evidenceForCatalog:{[scriptLines;catalogTbl]
  rows:([] category:`symbol$();useCase:`symbol$();pattern:();lineNumber:`long$();lineText:());
  i:0;
  n:count catalogTbl;

  while[i<n;
    row:catalogTbl i;
    matchFn:$[row`wordBoundary;.analyze.discover.patternEvidenceWB;.analyze.discover.patternEvidence];
    rows:raze (rows;matchFn[scriptLines;row`category;row`useCase;row`pattern]);
    i+:1
  ];

  distinct rows
 };

/ --------------------------------------------------
/ discover every topic's usage in a script, not just iterator/join/
/ overload - keys are the bare category names (keyword, iterator,
/ join, overload, namespaceJ, namespaceQ, namespaceZ, internals)
/ --------------------------------------------------
.analyze.discover.all:{[scriptLines]
  catalogTbl:.analyze.discover.catalog[];
  evidenceTbl:.analyze.discover.evidenceForCatalog[scriptLines;catalogTbl];
  categories:distinct catalogTbl`category;

  useCasesByCategory:{[evidenceTbl;cat]
    distinct (select from evidenceTbl where category=cat)`useCase
   }[evidenceTbl] each categories;

  categories!useCasesByCategory
 };