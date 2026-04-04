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