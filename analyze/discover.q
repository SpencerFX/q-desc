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
  patStr:string patternText;
  lineLen:count lineStr;
  patLen:count patStr;
  idx:0;
  found:0b;

  if[patLen=0;
    :1b
  ];

  if[lineLen<patLen;
    :0b
  ];

  while[idx<=lineLen-patLen;
    if[patStr~patLen#idx _ lineStr;
      found:1b;
      idx:lineLen
    ];
    idx+:1
  ];

  found
 };

/ --------------------------------------------------
/ find whether script contains pattern
/ --------------------------------------------------
.analyze.discover.hasPattern:{[scriptLines;patternText]
  lines:.analyze.discover.normalizeLines scriptLines;
  idx:0;
  lineTotal:count lines;
  found:0b;

  while[idx<lineTotal;
    if[.analyze.discover.lineHasPattern[lines idx;patternText];
      found:1b;
      idx:lineTotal
    ];
    idx+:1
  ];

  found
 };

/ --------------------------------------------------
/ discover iterator-related patterns
/ --------------------------------------------------
.analyze.discover.iterators:{[scriptLines]
  hits:`symbol$();

  if[.analyze.discover.hasPattern[scriptLines;"'"];
    hits:hits,enlist `each
  ];

  if[.analyze.discover.hasPattern[scriptLines;"/"];
    hits:hits,enlist `over
  ];

  if[.analyze.discover.hasPattern[scriptLines;"\\"];
    hits:hits,enlist `scan
  ];

  if[.analyze.discover.hasPattern[scriptLines;"prior"];
    hits:hits,enlist `prior
  ];

  if[.analyze.discover.hasPattern[scriptLines;"deltas"];
    hits:hits,enlist `prior
  ];

  distinct hits
 };

/ --------------------------------------------------
/ discover join-related patterns
/ --------------------------------------------------
.analyze.discover.joins:{[scriptLines]
  hits:`symbol$();

  if[.analyze.discover.hasPattern[scriptLines;"aj["];
    hits:hits,enlist `aj
  ];

  if[.analyze.discover.hasPattern[scriptLines;"lj["];
    hits:hits,enlist `lj
  ];

  if[.analyze.discover.hasPattern[scriptLines;"ij["];
    hits:hits,enlist `ij
  ];

  if[.analyze.discover.hasPattern[scriptLines;"uj["];
    hits:hits,enlist `uj
  ];

  if[.analyze.discover.hasPattern[scriptLines;"pj["];
    hits:hits,enlist `pj
  ];

  if[.analyze.discover.hasPattern[scriptLines;"ej["];
    hits:hits,enlist `ej
  ];

  if[.analyze.discover.hasPattern[scriptLines;"wj["];
    hits:hits,enlist `wj
  ];

  distinct hits
 };

/ --------------------------------------------------
/ discover overload-related patterns
/ --------------------------------------------------
.analyze.discover.overloads:{[scriptLines]
  hits:`symbol$();

  if[.analyze.discover.hasPattern[scriptLines;"?["];
    hits:hits,enlist `vectorConditional
  ];

  if[.analyze.discover.hasPattern[scriptLines;" ? "];
    hits:hits,enlist `findOrRollOrPermute
  ];

  if[.analyze.discover.hasPattern[scriptLines;"@/"];
    hits:hits,enlist `indexAt
  ];

  if[.analyze.discover.hasPattern[scriptLines;"@["];
    hits:hits,enlist `amendOrTrap
  ];

  if[.analyze.discover.hasPattern[scriptLines;".["];
    hits:hits,enlist `dotApplyOrTrap
  ];

  distinct hits
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