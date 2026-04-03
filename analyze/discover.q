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
    if[.analyze.discover.lineHasPattern[lines i;patternText];
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
/ collect all evidence
/ --------------------------------------------------
.analyze.discover.evidence:{[scriptLines]
  rows:([] category:`symbol$();useCase:`symbol$();pattern:();lineNumber:`long$();lineText:());
  rows,: .analyze.discover.iteratorsEvidence scriptLines;
  rows,: .analyze.discover.joinsEvidence scriptLines;
  rows,: .analyze.discover.overloadsEvidence scriptLines;
  rows
 };

/ --------------------------------------------------
/ discover all categories
/ --------------------------------------------------
.analyze.discover.all:{[scriptLines]
  iteratorHits:.analyze.discover.iterators scriptLines;
  joinHits:.analyze.discover.joins scriptLines;
  overloadHits:.analyze.discover.overloads scriptLines;

  `iterators`joins`overloads!(iteratorHits;joinHits;overloadHits)
 };