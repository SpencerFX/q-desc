/ ==================================================
/ analyze categorize functions
/ ==================================================

/ --------------------------------------------------
/ ensure analyze dependencies are loaded
/ --------------------------------------------------
.analyze.categorize.ensureLoaded:{[]
  if[not `load in key `.analyze;
    system "l analyze/load.q"
  ];

  if[not `discover in key `.analyze;
    system "l analyze/discover.q"
  ];

  `ok
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
    ch:1#rem;
    if[ch~"/" or ch~"\\";
      out:1 _ rem
    ];
    rem:1 _ rem
  ];

  `$out
 };

/ --------------------------------------------------
/ test whether line starts a function
/ --------------------------------------------------
.analyze.categorize.isFunctionStart:{[line]
  lineStr:.analyze.discover.toLineString line;
  .analyze.discover.lineHasPattern[lineStr;":{["]
 };

/ --------------------------------------------------
/ extract function name from definition line
/ --------------------------------------------------
.analyze.categorize.functionNameFromLine:{[line]
  lineStr:.analyze.discover.toLineString line;
  .sp.lineStr:lineStr;
  rem:lineStr;
  name:"";
  ch:"";

  while[count rem;
    ch:1#rem;
    if[ch~":";
      :name
    ];
    name,:ch;
    rem:1 _ rem
  ];

  name
 };

/ --------------------------------------------------
/ test whether line ends a function
/ --------------------------------------------------
.analyze.categorize.isFunctionEnd:{[line]
  lineStr:.analyze.discover.toLineString line;
  .analyze.discover.lineHasPattern[lineStr;"};"]
 };

/ --------------------------------------------------
/ operation catalog
/ --------------------------------------------------
.analyze.categorize.catalog:{[]
  baseCatalog:([]
    category:`iterator`iterator`iterator`iterator`join`join`join`join`join`join`join`overload`overload`overload`overload`overload;
    useCase:`each`over`scan`prior`aj`lj`ij`uj`pj`ej`wj`vectorConditional`findOrRollOrPermute`indexAt`amendOrTrap`dotApplyOrTrap;
    operation:("'";"/";"\\";"prior";"aj";"lj";"ij";"uj";"pj";"ej";"wj";"?";"?";"@";"@";".");
    pattern:("+/'";"+/";"+\\";"prior";"aj[";"lj[";"ij[";"uj[";"pj[";"ej[";"wj[";"?[";" ? ";"@/";"@[";".[")
  );

  keywordList:key .kdb.exp.keywords;

  keywordCatalog:$[
    0=count keywordList;
      ([] category:`symbol$();useCase:`symbol$();operation:();pattern:());
      ([] category:(count keywordList)#`keyword;
          useCase:keywordList;
          operation:string each keywordList;
          pattern:string each keywordList)
  ];

  t:raze (baseCatalog;keywordCatalog);
  t
 };

/ --------------------------------------------------
/ test one line against catalog row
/ --------------------------------------------------
.analyze.categorize.matchesCatalogRow:{[line;catalogRow]
  lineStr:.analyze.discover.toLineString line;
  patternText:catalogRow`pattern;
  useCaseVal:catalogRow`useCase;

  if[useCaseVal~`over;
    if[.analyze.discover.lineHasPattern[lineStr;"+/'"];
      :0b
    ]
  ];

  .analyze.discover.lineHasPattern[lineStr;patternText]
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

    if[count currentFunctionName;
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
/ ==================================================
/ parse //@func and //@param comment blocks
/ ==================================================

/ --------------------------------------------------
/ empty function signature table
/ --------------------------------------------------
.analyze.sig.emptyTable:{[]
  ([] functionName:`symbol$();arg1:();arg2:();arg3:();arg4:();arg5:();arg6:();arg7:();arg8:())
 };

/ --------------------------------------------------
/ parse comment metadata from file path
/ --------------------------------------------------
.analyze.sig.fromFile:{[filePath]
  lineVals:.analyze.load.text filePath;
  funcLines:first each {ss[x;"//@func"]}each lineVals;
  funcsLines:lineVals where not null funcLines;
  funcs:`$trim last each ("|" vs'funcLines);
  paramLines:first each {ss[x;"//@param"]}each lineVals;
  params:where not null paramLines;
  /params:last each groupFuncParams[where not null funcLines;params];
  currentP:"J"$trim each raze each -1_''2_''("|" vs '' (lineVals [last each groupFuncParams[where not null funcs;params]]));
  missingParams:(8-count each "J"$trim each raze each -1_''2_''("|" vs '' (lineVals [last each groupFuncParams[where not null funcs;params]])))#\:0Nj;
  fullParams:(currentP,'missingParams);
  list: funcs,'(currentP,'missingParams)
  'break;
 };

groupFuncParams:{[funcIdxs;paramIdxs]
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