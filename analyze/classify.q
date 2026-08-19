/ ==================================================
/ analyze classify functions
/ ==================================================

/ --------------------------------------------------
/ category -> the test suite that actually exercises it, matching
/ tests/run<Topic>.q one-for-one
/ --------------------------------------------------
.analyze.classify.testSuiteFor:(!) . flip raze 2 cut
  (
    (`keyword;    `runKeywords);
    (`iterator;   `runIterators);
    (`join;       `runJoins);
    (`overload;   `runOverloads);
    (`namespaceJ; `runNamespaceJ);
    (`namespaceQ; `runNamespaceQ);
    (`namespaceZ; `runNamespaceZ);
    (`internals;  `runInternals)
  );

/ --------------------------------------------------
/ classify discovered test suite names
/ --------------------------------------------------
.analyze.classify.testSuites:{[discoverDict]
  categoriesHit:(key discoverDict) where (0<count each value discoverDict);
  knownCategories:categoriesHit where (categoriesHit in key .analyze.classify.testSuiteFor);

  distinct .analyze.classify.testSuiteFor knownCategories
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
/ classify discovered use cases into table, covering every category
/ discover.all can report, not just iterator/join/overload
/ --------------------------------------------------
.analyze.classify.useCases:{[discoverDict]
  categories:key discoverDict;
  knownCategories:categories where (categories in key .analyze.classify.testSuiteFor);

  rows:([] category:`symbol$();useCase:`symbol$();testSuite:`symbol$());
  i:0;
  n:count knownCategories;

  while[i<n;
    cat:knownCategories i;
    rows:raze (rows;.analyze.classify.categoryRows[cat;discoverDict cat;.analyze.classify.testSuiteFor cat]);
    i+:1
  ];

  rows
 };