/ ==================================================
/ analyze load functions
/ ==================================================

/ --------------------------------------------------
/ convert path input to file handle
/ --------------------------------------------------
.analyze.load.toHandle:{[filePath]
  hsym `$ filePath
 };

/ --------------------------------------------------
/ load script and return handle
/ --------------------------------------------------
.analyze.load.script:{[filePath]
  fileHandle:.analyze.load.toHandle filePath;
  system "l ",string fileHandle;
  fileHandle
 };

/ --------------------------------------------------
/ read raw script text
/ --------------------------------------------------
.analyze.load.text:{[filePath]
  fileHandle:.analyze.load.toHandle filePath;
  read0 fileHandle
 };

/ --------------------------------------------------
/ return script text as one char vector
/ --------------------------------------------------
.analyze.load.textString:{[filePath]
  raze .analyze.load.text filePath
 };

/ --------------------------------------------------
/ module name -> file path, for .analyze.ensureLoaded below. load.q
/ itself isn't listed: it's a prerequisite for calling
/ .analyze.ensureLoaded at all, since that's where this lives
/ --------------------------------------------------
.analyze.moduleFile:(!) . flip raze 2 cut
  (
    (`discover;   "analyze/discover.q");
    (`classify;   "analyze/classify.q");
    (`categorize; "analyze/categorize.q")
  );

/ --------------------------------------------------
/ load whichever of the given analyze/ modules aren't loaded yet -
/ shared by analyze/categorize.q and analyze/run.q, which used to
/ each hand-roll their own copy of this same if-block
/ --------------------------------------------------
.analyze.ensureLoaded:{[requiredModules]
  i:0;
  n:count requiredModules;

  while[i<n;
    modName:requiredModules i;
    if[not modName in key `.analyze;
      system "l ",.analyze.moduleFile modName
    ];
    i+:1
  ];

  `ok
 };