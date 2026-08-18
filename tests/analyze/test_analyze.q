/ ==================================================
/ analyze/ tests
/ ==================================================
/ Unlike the description/dictionary/example test topics, analyze/ is
/ functional code (pattern discovery, classification, categorization,
/ signature parsing), not reference content - so these are hand-crafted
/ behavioral assertions against two fixtures under analyze/testFiles/,
/ not a generic capture-and-check over a reflected namespace.
/ -
/ analyze/testFiles/testFile.q exercises the "found something" paths:
/ known iterator/join/overload patterns and //@func/@param annotations.
/ analyze/testFiles/emptyFile.q exercises the "found nothing" paths
/ that testFile.q can't reach (every discover/classify/categorize/sig
/ function has an explicit empty-result branch worth covering).

/ --------------------------------------------------
/ fixture paths
/ --------------------------------------------------
.test.an.testFile:"analyze/testFiles/testFile.q";
.test.an.emptyFile:"analyze/testFiles/emptyFile.q";

/ --------------------------------------------------
/ pull rows matching a functionName (and optionally a category) out
/ of a categorize.file result, working around the fact that its
/ functionName/category columns are variable-length strings, so plain
/ qSQL equality can signal a length error against mismatched rows
/ --------------------------------------------------
.test.an.rowsFor:{[catRows;fnName;categoryVal]
  fnMask:{[fnName;x] x~fnName}[fnName] each catRows`functionName;
  catMask:$[(::)~categoryVal;fnMask;fnMask and catRows[`category]=categoryVal];
  catRows where catMask
 };

/ --------------------------------------------------
/ load.text / load.textString
/ --------------------------------------------------
.test.an.case.loadText:{[]
  lines:.analyze.load.text .test.an.testFile;
  textStr:.analyze.load.textString .test.an.testFile;

  (
    .test.assert.true["load.text - non-empty";0<count lines];
    .test.assert.equal["load.text - line count";count lines;114];
    .test.assert.true["load.textString - contains known content";textStr like "*sumOver*"]
  )
 };

/ --------------------------------------------------
/ discover.lineHasPattern - direct unit checks
/ --------------------------------------------------
.test.an.case.lineHasPattern:{[]
  (
    .test.assert.equal["lineHasPattern - found";.analyze.discover.lineHasPattern["x+/'y";"+/'"];1b];
    .test.assert.equal["lineHasPattern - not found";.analyze.discover.lineHasPattern["x+y";"+/'"];0b];
    .test.assert.equal["lineHasPattern - empty pattern always matches";.analyze.discover.lineHasPattern["anything";""];1b]
  )
 };

/ --------------------------------------------------
/ discover.iterators / joins / overloads against testFile.q
/ --------------------------------------------------
.test.an.case.discoverFound:{[]
  lines:.analyze.load.text .test.an.testFile;

  (
    .test.assert.equal["discover.iterators";.analyze.discover.iterators lines;`each`over`scan`prior];
    .test.assert.equal["discover.joins";.analyze.discover.joins lines;`aj`lj`uj`pj];
    .test.assert.equal["discover.overloads";.analyze.discover.overloads lines;`vectorConditional`findOrRollOrPermute`amendOrTrap`dotApplyOrTrap]
  )
 };

/ --------------------------------------------------
/ discover.all against emptyFile.q - the "found nothing" path
/ --------------------------------------------------
.test.an.case.discoverEmpty:{[]
  lines:.analyze.load.text .test.an.emptyFile;
  discoverDict:.analyze.discover.all lines;

  (
    .test.assert.equal["discover.all empty - iterators";discoverDict`iterators;`symbol$()];
    .test.assert.equal["discover.all empty - joins";discoverDict`joins;`symbol$()];
    .test.assert.equal["discover.all empty - overloads";discoverDict`overloads;`symbol$()]
  )
 };

/ --------------------------------------------------
/ classify.useCases / testSuites against testFile.q
/ --------------------------------------------------
.test.an.case.classifyFound:{[]
  lines:.analyze.load.text .test.an.testFile;
  discoverDict:.analyze.discover.all lines;
  useCaseTbl:.analyze.classify.useCases discoverDict;
  suiteList:.analyze.classify.testSuites discoverDict;

  (
    .test.assert.equal["classify.useCases - row count";count useCaseTbl;12];
    .test.assert.equal["classify.testSuites";suiteList;`runIterators`runJoins`runOverloads]
  )
 };

/ --------------------------------------------------
/ classify.useCases / testSuites against emptyFile.q
/ --------------------------------------------------
.test.an.case.classifyEmpty:{[]
  discoverDict:.analyze.discover.all .analyze.load.text .test.an.emptyFile;
  useCaseTbl:.analyze.classify.useCases discoverDict;
  suiteList:.analyze.classify.testSuites discoverDict;

  (
    .test.assert.equal["classify.useCases empty - row count";count useCaseTbl;0];
    .test.assert.equal["classify.testSuites empty";suiteList;`symbol$()]
  )
 };

/ --------------------------------------------------
/ run.script / run.summary end-to-end against testFile.q
/ --------------------------------------------------
.test.an.case.runScript:{[]
  analysisDict:.analyze.run.script .test.an.testFile;
  summaryTbl:.analyze.run.summary analysisDict;

  (
    .test.assert.equal["run.script - keys";key analysisDict;`filePath`scriptLines`discoveries`useCases`testSuites];
    .test.assert.equal["run.script - testSuites";analysisDict`testSuites;`runIterators`runJoins`runOverloads];
    .test.assert.equal["run.summary - counts";exec countVal from summaryTbl;4 4 4]
  )
 };

/ --------------------------------------------------
/ categorize.fileName - strips the directory, keeps the basename
/ (regression check: this previously always returned the full path,
/ because comparing a 1-item list to a char atom via ~ never matched)
/ --------------------------------------------------
.test.an.case.categorizeFileName:{[]
  (
    .test.assert.equal["fileName - strips forward-slash path";.analyze.categorize.fileName "analyze/testFiles/testFile.q";`testFile.q];
    .test.assert.equal["fileName - strips backslash path";.analyze.categorize.fileName "analyze\\testFiles\\testFile.q";`testFile.q];
    .test.assert.equal["fileName - no directory";.analyze.categorize.fileName "testFile.q";`testFile.q]
  )
 };

/ --------------------------------------------------
/ categorize.functionNameFromLine - stops at the first colon
/ (regression check: this previously returned the whole line unchanged,
/ same root cause as the fileName bug above)
/ --------------------------------------------------
.test.an.case.categorizeFunctionName:{[]
  (
    .test.assert.equal["functionNameFromLine - stops at colon";.analyze.categorize.functionNameFromLine ".user.iter.sumOver:{[x]";".user.iter.sumOver"];
    .test.assert.equal["functionNameFromLine - no colon returns whole line";.analyze.categorize.functionNameFromLine "noColonHere";"noColonHere"]
  )
 };

/ --------------------------------------------------
/ categorize.file against testFile.q - spot-check known matches,
/ filtered to the intended category to sidestep the incidental noise
/ from the merged keyword catalog (e.g. "sum" and "aj" are also
/ keyword names, so lines mentioning sumOver/aj[ pick up extra
/ category=`keyword rows alongside the intended one)
/ --------------------------------------------------
.test.an.case.categorizeFound:{[]
  catRows:.analyze.categorize.file .test.an.testFile;
  sumOverRows:.test.an.rowsFor[catRows;".user.iter.sumOver";`iterator];
  ajRows:.test.an.rowsFor[catRows;".user.join.asOfJoinBasic";`join];

  (
    .test.assert.equal["categorize.file - fileName";distinct catRows`fileName;enlist `testFile.q];
    .test.assert.equal["categorize.file - sumOver matched once as iterator";count sumOverRows;1];
    .test.assert.equal["categorize.file - sumOver useCase";sumOverRows`useCase;enlist `over];
    .test.assert.equal["categorize.file - sumOver function line";sumOverRows`functionLineNumber;enlist 11];
    .test.assert.equal["categorize.file - asOfJoinBasic matched once as join";count ajRows;1];
    .test.assert.equal["categorize.file - asOfJoinBasic useCase";ajRows`useCase;enlist `aj]
  )
 };

/ --------------------------------------------------
/ categorize.file against emptyFile.q - the "found nothing" path
/ --------------------------------------------------
.test.an.case.categorizeEmpty:{[]
  catRows:.analyze.categorize.file .test.an.emptyFile;
  enlist .test.assert.equal["categorize.file empty - row count";count catRows;0]
 };

/ --------------------------------------------------
/ sig.fromFile against testFile.q - spot-check known arg counts/types
/ --------------------------------------------------
.test.an.case.sigFound:{[]
  sigTab:.analyze.sig.fromFile .test.an.testFile;
  sumOverRow:first select from sigTab where functionName=`.user.iter.sumOver;
  addEachRow:first select from sigTab where functionName=`.user.iter.addEach;
  rollBasicRow:first select from sigTab where functionName=`.user.over.rollBasic;

  (
    .test.assert.equal["sig.fromFile - row count";count sigTab;16];
    .test.assert.equal["sig.fromFile - sumOver arg1";sumOverRow`arg1;6];
    .test.assert.equal["sig.fromFile - sumOver arg2 null";sumOverRow`arg2;0Nj];
    .test.assert.equal["sig.fromFile - addEach arg1";addEachRow`arg1;6];
    .test.assert.equal["sig.fromFile - addEach arg2";addEachRow`arg2;6];
    .test.assert.equal["sig.fromFile - rollBasic negative type code";rollBasicRow`arg1;-6]
  )
 };

/ --------------------------------------------------
/ sig.fromFile against emptyFile.q - the "found nothing" path
/ --------------------------------------------------
.test.an.case.sigEmpty:{[]
  sigTab:.analyze.sig.fromFile .test.an.emptyFile;
  enlist .test.assert.equal["sig.fromFile empty - row count";count sigTab;0]
 };
