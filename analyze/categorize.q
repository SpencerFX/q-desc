/ ==================================================
/ analyze categorize functions
/ ==================================================

/ --------------------------------------------------
/ ensure analyze dependencies are loaded
/ --------------------------------------------------
.analyze.categorize.ensureLoaded:{[]
  .analyze.ensureLoaded enlist `discover
 };

/ --------------------------------------------------
/ convert path to display file name
/ --------------------------------------------------
.analyze.categorize.fileName:{[filePath]
  pathStr:filePath;
  rem:pathStr;
  out:pathStr;
  ch:"";

  while[count rem;
    ch:first rem;
    if[(ch~"/") or (ch~"\\");
      out:1 _ rem
    ];
    rem:1 _ rem
  ];

  `$out
 };

/ --------------------------------------------------
/ test whether line starts a function - ":{" not ":{[", since q
/ functions don't require an explicit parameter list: every one of
/ the 384 example functions across example/*.q omits it entirely
/ (e.g. .kdb.exp.keywords.abs:{ with no "[]"), which the narrower
/ ":{[" pattern never matched - it found real matches only against
/ analyze/testFiles/testFile.q, where every function happens to
/ declare an explicit [x]/[]. Against example/keywords.q (1767
/ lines, real repo content) the old pattern matched zero functions
/ --------------------------------------------------
.analyze.categorize.isFunctionStart:{[line]
  lineStr:.analyze.discover.toLineString line;
  .analyze.discover.lineHasPattern[lineStr;":{"]
 };

/ --------------------------------------------------
/ extract function name from definition line
/ --------------------------------------------------
.analyze.categorize.functionNameFromLine:{[line]
  lineStr:.analyze.discover.toLineString line;
  rem:lineStr;
  name:"";
  ch:"";

  while[count rem;
    ch:first rem;
    if[ch~":";
      :name
    ];
    name,:ch;
    rem:1 _ rem
  ];

  name
 };

/ --------------------------------------------------
/ extract parameter names from a function definition line, e.g.
/ ".user.iter.addEach:{[x;y]" -> ("x";"y"). Empty list for both
/ "{[]" (explicitly niladic) and bare "{" (implicitly niladic, e.g.
/ ".kdb.exp.keywords.abs:{" - the style every example function uses)
/ --------------------------------------------------
.analyze.categorize.paramNamesFromLine:{[line]
  lineStr:.analyze.discover.toLineString line;
  openPositions:ss[lineStr;"["];
  closePositions:ss[lineStr;"]"];

  if[(0=count openPositions) or (0=count closePositions);
    :()
  ];

  openIdx:first openPositions;
  closeIdx:first closePositions;

  if[closeIdx<=openIdx;
    :()
  ];

  inner:(openIdx+1) _ closeIdx#lineStr;

  if[0=count trim inner;
    :()
  ];

  trim each ";" vs inner
 };

/ --------------------------------------------------
/ test whether line ends a function
/ --------------------------------------------------
.analyze.categorize.isFunctionEnd:{[line]
  lineStr:.analyze.discover.toLineString line;
  .analyze.discover.lineHasPattern[lineStr;"};"]
 };

/ --------------------------------------------------
/ operation catalog - shared with analyze/discover.q, so categorize
/ and discover cover the same 8 topics (keyword/iterator/join/
/ overload/namespaceJ/namespaceQ/namespaceZ/internals) from one
/ definition instead of two hand-kept lists drifting apart
/ --------------------------------------------------
.analyze.categorize.catalog:{[]
  .analyze.discover.catalog[]
 };

/ --------------------------------------------------
/ test one line against catalog row, using word-boundary matching
/ where the catalog calls for it (bare names like keywords) and
/ plain substring matching otherwise (multi-char idioms like "aj[" or
/ dotted names like ".Q.qt" are distinctive enough on their own)
/ --------------------------------------------------
.analyze.categorize.matchesCatalogRow:{[line;catalogRow]
  lineStr:.analyze.discover.toLineString line;
  patternText:catalogRow`pattern;
  useCaseVal:catalogRow`useCase;
  wordBoundaryVal:catalogRow`wordBoundary;

  if[useCaseVal~`over;
    if[.analyze.discover.lineHasPattern[lineStr;"+/'"];
      :0b
    ]
  ];

  $[wordBoundaryVal;
    .analyze.discover.lineHasWordBoundaryPattern[lineStr;patternText];
    .analyze.discover.lineHasPattern[lineStr;patternText]]
 };

/ --------------------------------------------------
/ categorize one file
/ --------------------------------------------------
.analyze.categorize.file:{[filePath]
  .analyze.categorize.ensureLoaded[];

  lines:.analyze.load.text filePath;
  fileName:.analyze.categorize.fileName filePath;
  catalog:.analyze.categorize.catalog[];

  currentFunctionName:"";
  currentFunctionLine:0;
  i:0;
  n:count lines;
  j:0;
  m:count catalog;
  lineVal:"";
  lineNum:0;
  catRow:(::);

  listOfRows:();

  while[i<n;
    lineVal:lines i;
    lineNum:1+i;

    if[.analyze.categorize.isFunctionStart lineVal;
      currentFunctionName:.analyze.categorize.functionNameFromLine lineVal;
      currentFunctionLine:lineNum
    ];

    if[(count currentFunctionName) and (not .analyze.discover.isCommentLine lineVal);
      j:0;

      while[j<m;
        catRow:catalog j;

        if[.analyze.categorize.matchesCatalogRow[lineVal;catRow];
          listOfRows,:enlist (
            fileName;
            currentFunctionName;
            currentFunctionLine;
            catRow`category;
            catRow`useCase;
            catRow`operation;
            lineNum;
            .analyze.discover.toLineString lineVal
          )
        ];

        j+:1
      ]
    ];

    if[.analyze.categorize.isFunctionEnd lineVal;
      currentFunctionName:"";
      currentFunctionLine:0
    ];

    i+:1
  ];

  $[0=count listOfRows;
    ([] fileName:`symbol$();
        functionName:();
        functionLineNumber:`long$();
        category:`symbol$();
        useCase:`symbol$();
        operation:();
        operationLineNumber:`long$();
        lineText:());
    flip `fileName`functionName`functionLineNumber`category`useCase`operation`operationLineNumber`lineText!flip listOfRows
  ]
 };
/ --------------------------------------------------
/ display categorization for one file
/ --------------------------------------------------
.analyze.categorize.show:{[filePath]
  rows:.analyze.categorize.file filePath;
  rows:select from rows where not null useCase;
  show rows;
  rows
 };
/ --------------------------------------------------
/ parse comment metadata from file path
/ --------------------------------------------------
/ reads //@func and //@param annotation comments (see
/ analyze/testFiles/testFile.q for the expected format) and returns
/ a list of per-function dicts: functionName plus up to 8 param type
/ codes (q allows at most 8 parameters per function), null-padded
/ --------------------------------------------------
.analyze.sig.fromFile:{[filePath]
  lineVals:.analyze.load.text filePath;
  funcLines:first each {ss[x;"//@func"]}each lineVals;
  funcLines:where not null funcLines;
  funcs:`$trim last each ("|" vs'(lineVals funcLines));
  paramLines:first each {ss[x;"//@param"]}each lineVals;
  params:where not null paramLines;
  currentP:"J"$trim each raze each -1_''2_''("|" vs '' (lineVals [last each .analyze.sig.groupFuncParams[funcLines;params]]));
  missingParams:(8-count each currentP)#\:0Nj;
  list: funcs,'(currentP,'missingParams);
  argTab: (`functionName`arg1`arg2`arg3`arg4`arg5`arg6`arg7`arg8)!/:(list);
  argTab
 };

/ --------------------------------------------------
/ sig.fromFile only understands //@func/@param comments, and
/ analyze/testFiles/testFile.q is the only file in the repo that has
/ any - this generates that annotation text for a real, unannotated
/ file instead, so sig.fromFile (and sim/'s fuzzer, which consumes
/ its output) can be pointed at real content. It reflects each
/ function's actual name and parameter names (reusing categorize's
/ function-boundary detection, which now handles both the explicit
/ "{[x]" style and the bare "{" style every example function uses).
/ Type codes are left as the placeholder 0N ("unknown"): inferring a
/ real q type code from usage alone isn't reliable, so a human still
/ has to review and fill those in - but the function/parameter
/ names and annotation structure no longer have to be hand-typed
/ from scratch first
/ --------------------------------------------------
.analyze.sig.suggestForFile:{[filePath]
  .analyze.categorize.ensureLoaded[];

  lines:.analyze.load.text filePath;
  n:count lines;
  i:0;

  funcNames:();
  paramLists:();
  lineNumbers:`long$();

  while[i<n;
    lineVal:lines i;
    if[.analyze.categorize.isFunctionStart lineVal;
      funcNames,:enlist .analyze.categorize.functionNameFromLine lineVal;
      paramLists,:enlist .analyze.categorize.paramNamesFromLine lineVal;
      lineNumbers,:enlist 1+i
    ];
    i+:1
  ];

  suggestedText:{[fn;params]
    funcLine:enlist "//@func  | ",fn;
    paramLines:{[p] "//@param | ",p," | 0N | TODO: fill in type code and description"} each params;
    funcLine,paramLines
   }'[funcNames;paramLists];

  ([] functionName:`$funcNames;
      functionLineNumber:lineNumbers;
      paramNames:paramLists;
      suggestedText:suggestedText)
 };

/ --------------------------------------------------
/ print every function's suggested annotation block, ready to review
/ and paste above its definition
/ --------------------------------------------------
.analyze.sig.printSuggestions:{[filePath]
  suggestTbl:.analyze.sig.suggestForFile filePath;
  i:0;
  n:count suggestTbl;

  while[i<n;
    row:suggestTbl i;
    {-1 x} each row`suggestedText;
    -1 "";
    i+:1
  ];

  suggestTbl
 };

/ --------------------------------------------------
/ pair param notes with function details - used only by sig.fromFile,
/ hence the .analyze.sig.* prefix rather than .analyze.categorize.*
/ (this used to be a bare global, the one function in the module not
/ namespaced under .analyze.* at all)
/ --------------------------------------------------
.analyze.sig.groupFuncParams:{[funcIdxs;paramIdxs]
  n:count funcIdxs;
  i:0;
  out:();

  while[i<n;
    f:funcIdxs i;
    nextF:$[i<n-1;funcIdxs 1+i;1+max (funcIdxs,paramIdxs)];

    p:paramIdxs where (paramIdxs>f) & (paramIdxs<nextF);

    out,:enlist (f;p);
    i+:1
  ];

  out
 };