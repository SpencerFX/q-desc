/ ==================================================
/ analyze classify functions
/ ==================================================

/ --------------------------------------------------
/ classify discovered test suite names
/ --------------------------------------------------
.analyze.classify.testSuites:{[discoverDict]
  suites:`symbol$();

  if[0<count discoverDict`iterators;
    suites:suites,enlist `runIterators
  ];

  if[0<count discoverDict`joins;
    suites:suites,enlist `runJoins
  ];

  if[0<count discoverDict`overloads;
    suites:suites,enlist `runOverloads
  ];

  distinct suites
 };

/ --------------------------------------------------
/ build rows for one category
/ --------------------------------------------------
.analyze.classify.categoryRows:{[categoryName;useCaseList;testSuiteName]
  rowCount:count useCaseList;

  $[rowCount=0;
    ([] category:`symbol$();useCase:`symbol$();testSuite:`symbol$());
    ([] category:rowCount#categoryName;
       useCase:useCaseList;
       testSuite:rowCount#testSuiteName)
  ]
 };

/ --------------------------------------------------
/ classify discovered use cases into table
/ --------------------------------------------------
.analyze.classify.useCases:{[discoverDict]
  iterRows:.analyze.classify.categoryRows[`iterator;discoverDict`iterators;`runIterators];
  joinRows:.analyze.classify.categoryRows[`join;discoverDict`joins;`runJoins];
  overRows:.analyze.classify.categoryRows[`overload;discoverDict`overloads;`runOverloads];

  raze (iterRows;joinRows;overRows)
 };