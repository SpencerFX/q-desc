/ ==================================================
/ analyze run functions
/ ==================================================

/ --------------------------------------------------
/ initialize analyze modules
/ --------------------------------------------------
.analyze.init:{[]
  system "l analyze/load.q";
  system "l analyze/discover.q";
  system "l analyze/classify.q";
  system "l analyze/run.q";
  `ok
 };

/ --------------------------------------------------
/ ensure analyze modules are loaded
/ --------------------------------------------------
.analyze.run.ensureLoaded:{[]
  if[not `load in key `.analyze;
    system "l analyze/load.q"
  ];

  if[not `discover in key `.analyze;
    system "l analyze/discover.q"
  ];

  if[not `classify in key `.analyze;
    system "l analyze/classify.q"
  ];

  `ok
 };

/ --------------------------------------------------
/ analyze a script path
/ --------------------------------------------------
.analyze.run.script:{[filePath]
  .analyze.run.ensureLoaded[];

  scriptLines:.analyze.load.text filePath;
  discoverDict:.analyze.discover.all scriptLines;
  useCaseTbl:.analyze.classify.useCases discoverDict;
  suiteList:.analyze.classify.testSuites discoverDict;

  `filePath`scriptLines`discoveries`useCases`testSuites!(
    filePath;
    scriptLines;
    discoverDict;
    useCaseTbl;
    suiteList
  )
 };

/ --------------------------------------------------
/ show summary of analysis
/ --------------------------------------------------
.analyze.run.summary:{[analysisDict]
  useCaseTbl:analysisDict`useCases;
  $[0=count useCaseTbl;
    ([] category:`symbol$();countVal:`long$());
    select countVal:count i by category from useCaseTbl
  ]
 };

/ --------------------------------------------------
/ print analysis result
/ --------------------------------------------------
.analyze.run.show:{[filePath]
  analysisDict:.analyze.run.script filePath;
  show analysisDict`useCases;
  show .analyze.run.summary analysisDict;
  show analysisDict`testSuites;
  analysisDict
 };