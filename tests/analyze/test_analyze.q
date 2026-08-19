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
/ -
/ example/keywords.q is used as a third, real-scale fixture (1700+
/ lines, not hand-built for testing) - it's what caught
/ isFunctionStart's ":{[" pattern never matching a function defined
/ without an explicit parameter list (e.g. ".kdb.exp.keywords.abs:{"
/ with no "[]"), which is how every one of the 384 example functions
/ across example/*.q is actually written. testFile.q's functions all
/ happen to declare an explicit [x]/[], so that gap was invisible
/ until tested against real content.
/ --------------------------------------------------
/ fixture paths
/ --------------------------------------------------
.test.an.testFile:"analyze/testFiles/testFile.q";
.test.an.emptyFile:"analyze/testFiles/emptyFile.q";
.test.an.realFile:"example/keywords.q";

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
/ discover.all covers every topic, not just iterator/join/overload -
/ against testFile.q, which only exercises three of them
/ --------------------------------------------------
.test.an.case.discoverAllTopics:{[]
  lines:.analyze.load.text .test.an.testFile;
  discoverDict:.analyze.discover.all lines;

  (
    .test.assert.equal["discover.all - covers 8 categories";key discoverDict;`iterator`join`overload`keyword`namespaceJ`namespaceQ`namespaceZ`internals];
    .test.assert.equal["discover.all - keyword hits";discoverDict`keyword;`aj`deltas`lj`pj`til`uj];
    .test.assert.equal["discover.all - namespaceJ empty (not used in fixture)";discoverDict`namespaceJ;`symbol$()];
    .test.assert.equal["discover.all - namespaceQ empty (not used in fixture)";discoverDict`namespaceQ;`symbol$()];
    .test.assert.equal["discover.all - namespaceZ empty (not used in fixture)";discoverDict`namespaceZ;`symbol$()];
    .test.assert.equal["discover.all - internals empty (not used in fixture)";discoverDict`internals;`symbol$()]
  )
 };

/ --------------------------------------------------
/ discover.all against emptyFile.q - the "found nothing" path, now
/ across all 8 categories
/ --------------------------------------------------
.test.an.case.discoverEmpty:{[]
  lines:.analyze.load.text .test.an.emptyFile;
  discoverDict:.analyze.discover.all lines;

  (
    .test.assert.equal["discover.all empty - still 8 categories";key discoverDict;`iterator`join`overload`keyword`namespaceJ`namespaceQ`namespaceZ`internals];
    .test.assert.true["discover.all empty - every category empty";all 0=count each value discoverDict]
  )
 };

/ --------------------------------------------------
/ word-boundary matching: a bare keyword pattern must not fire
/ inside a longer identifier (this is what let "sum" false-positive
/ inside "sumOver" before lineHasWordBoundaryPattern existed)
/ --------------------------------------------------
.test.an.case.wordBoundaryMatching:{[]
  (
    .test.assert.equal["lineHasWordBoundaryPattern - standalone match";.analyze.discover.lineHasWordBoundaryPattern["x:sum y";"sum"];1b];
    .test.assert.equal["lineHasWordBoundaryPattern - embedded in longer identifier";.analyze.discover.lineHasWordBoundaryPattern["sumOver:{[x]}";"sum"];0b];
    .test.assert.equal["lineHasWordBoundaryPattern - namespaced identifier";.analyze.discover.lineHasWordBoundaryPattern[".foo.sum x";"sum"];0b]
  )
 };

/ --------------------------------------------------
/ evidence-gathering skips comment-only lines - English prose can
/ accidentally contain a standalone keyword-like word ("...join, or
/ overload...") that isn't real usage
/ --------------------------------------------------
.test.an.case.commentLinesSkipped:{[]
  codeLine:enlist "x:1 or 2";
  commentLine:enlist "/ this uses or somewhere in prose";

  (
    .test.assert.equal["patternEvidenceWB - real code line counted";count .analyze.discover.patternEvidenceWB[codeLine;`keyword;`or;"or"];1];
    .test.assert.equal["patternEvidenceWB - comment-only line skipped";count .analyze.discover.patternEvidenceWB[commentLine;`keyword;`or;"or"];0]
  )
 };

/ --------------------------------------------------
/ dotted namespace and bang-notation discovery, using ad-hoc script
/ lines since testFile.q doesn't exercise .j/.Q/.z/-N! at all
/ --------------------------------------------------
.test.an.case.namespaceAndInternalsDiscovery:{[]
  scriptLines:("show .Q.qt trade";"show .z.a";"show -1!`x";"show .j.j 1 2 3");
  discoverDict:.analyze.discover.all scriptLines;

  (
    .test.assert.equal["discover.all - namespaceQ finds qt";discoverDict`namespaceQ;enlist `qt];
    .test.assert.equal["discover.all - namespaceZ finds a";discoverDict`namespaceZ;enlist `a];
    .test.assert.equal["discover.all - namespaceJ finds j";discoverDict`namespaceJ;enlist `j];
    .test.assert.equal["discover.all - internals finds -1!";discoverDict`internals;enlist `$"-1!"]
  )
 };

/ --------------------------------------------------
/ regression: the internals catalog used to include the legacy `0N
/ alias key from dictionary/internals.q as a bare pattern, which is
/ just q's null-int literal and fired on nearly any script
/ --------------------------------------------------
.test.an.case.internalsExcludesLegacyAlias:{[]
  scriptLines:enlist "x:0N";
  discoverDict:.analyze.discover.all scriptLines;
  enlist .test.assert.equal["discover.all - bare 0N is not internals evidence";discoverDict`internals;`symbol$()]
 };

/ --------------------------------------------------
/ classify.useCases / testSuites against testFile.q, now including
/ the keyword category
/ --------------------------------------------------
.test.an.case.classifyFound:{[]
  lines:.analyze.load.text .test.an.testFile;
  discoverDict:.analyze.discover.all lines;
  useCaseTbl:.analyze.classify.useCases discoverDict;
  suiteList:.analyze.classify.testSuites discoverDict;

  (
    .test.assert.equal["classify.useCases - row count";count useCaseTbl;18];
    .test.assert.equal["classify.testSuites";suiteList;`runIterators`runJoins`runOverloads`runKeywords]
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
    .test.assert.equal["run.script - testSuites";analysisDict`testSuites;`runIterators`runJoins`runOverloads`runKeywords];
    .test.assert.equal["run.summary - categories";exec category from summaryTbl;`iterator`join`keyword`overload];
    .test.assert.equal["run.summary - counts";exec countVal from summaryTbl;4 4 6 4]
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
/ categorize.file against testFile.q - spot-check known matches.
/ .test.an.rowsFor's category filter is kept for robustness (a line
/ can still legitimately match more than one category, e.g. "aj["
/ is both a join pattern and, as bare text, part of the keyword "aj"
/ too) but it's no longer papering over noise: categorize.file now
/ shares discover.q's word-boundary matcher and comment-line
/ skipping, so a plain rowsFor[...;`iterator] filter finds exactly
/ one row instead of the pre-unification mix of real and
/ keyword-substring-noise rows (regression: this fixture's total row
/ count was 91 before word-boundary matching and comment skipping,
/ now a stable 22)
/ --------------------------------------------------
.test.an.case.categorizeFound:{[]
  catRows:.analyze.categorize.file .test.an.testFile;
  sumOverRows:.test.an.rowsFor[catRows;".user.iter.sumOver";`iterator];
  ajRows:.test.an.rowsFor[catRows;".user.join.asOfJoinBasic";`join];

  (
    .test.assert.equal["categorize.file - fileName";distinct catRows`fileName;enlist `testFile.q];
    .test.assert.equal["categorize.file - row count (noise-free)";count catRows;22];
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
/ categorize.catalog now shares discover.q's full 8-topic catalog,
/ where it used to be stuck at 4 (iterator/join/overload/keyword)
/ --------------------------------------------------
.test.an.case.categorizeCatalogCoverage:{[]
  catalog:.analyze.categorize.catalog[];
  enlist .test.assert.equal["categorize.catalog - covers 8 categories";distinct catalog`category;`iterator`join`overload`keyword`namespaceJ`namespaceQ`namespaceZ`internals]
 };

/ --------------------------------------------------
/ categorize.file now finds namespaceQ/namespaceZ/internals evidence
/ too, attributed to the function it appears in - testFile.q doesn't
/ exercise these, so this uses a small ad-hoc script instead
/ --------------------------------------------------
.test.an.case.categorizeNamespaceCoverage:{[]
  scriptLines:(".user.probe.demo:{[]";" show .Q.qt trade";" show -1!`x";" }");
  tmpFile:".test.an.tmpProbe.q";
  hsym[`$tmpFile] 0: scriptLines;
  catRows:.analyze.categorize.file tmpFile;
  hdel hsym `$tmpFile;

  qtRows:catRows where catRows[`category]=`namespaceQ;
  bangRows:catRows where catRows[`category]=`internals;

  (
    .test.assert.equal["categorize.file - finds namespaceQ inside a function";count qtRows;1];
    .test.assert.equal["categorize.file - namespaceQ useCase";qtRows`useCase;enlist `qt];
    .test.assert.equal["categorize.file - finds internals inside a function";count bangRows;1];
    .test.assert.equal["categorize.file - internals useCase";bangRows`useCase;enlist `$"-1!"]
  )
 };

/ --------------------------------------------------
/ regression: a keyword-like word inside a comment, within a real
/ function body, must not be attributed to that function as evidence
/ --------------------------------------------------
.test.an.case.categorizeSkipsCommentLines:{[]
  scriptLines:(".user.probe.demo2:{[x]";" / this is or that, in prose";" x";" }");
  tmpFile:".test.an.tmpProbe2.q";
  hsym[`$tmpFile] 0: scriptLines;
  catRows:.analyze.categorize.file tmpFile;
  hdel hsym `$tmpFile;

  keywordRows:catRows where catRows[`category]=`keyword;
  enlist .test.assert.equal["categorize.file - comment-only line contributes no keyword evidence";count keywordRows;0]
 };

/ --------------------------------------------------
/ regression: categorize.file against a real, large example file -
/ this is what caught isFunctionStart's ":{[" pattern never matching
/ a bracket-less function definition, the style every real example
/ function in the repo actually uses. Bounds are loose (not tied to
/ the file's exact current size) so this stays a regression guard
/ against "detects zero functions again", not a brittle exact-count
/ check that breaks every time example/keywords.q grows
/ --------------------------------------------------
.test.an.case.categorizeRealFile:{[]
  catRows:.analyze.categorize.file .test.an.realFile;
  functionNames:distinct catRows`functionName;

  absMask:{x~".kdb.exp.keywords.abs"} each catRows`functionName;
  absUseCases:distinct (catRows where absMask)`useCase;

  (
    .test.assert.true["categorize.file real file - finds many rows";1000<count catRows];
    .test.assert.true["categorize.file real file - finds many functions";150<count functionNames];
    .test.assert.true["categorize.file real file - finds multiple categories";1<count distinct catRows`category];
    .test.assert.true["categorize.file real file - abs function found with its own keyword";`abs in absUseCases]
  )
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

/ --------------------------------------------------
/ paramNamesFromLine - direct unit checks across the shapes a real
/ function definition line can take
/ --------------------------------------------------
.test.an.case.paramNamesFromLine:{[]
  (
    .test.assert.equal["paramNamesFromLine - two params";.analyze.categorize.paramNamesFromLine ".user.iter.addEach:{[x;y]";(enlist "x";enlist "y")];
    .test.assert.equal["paramNamesFromLine - one param";.analyze.categorize.paramNamesFromLine ".user.iter.sumOver:{[x]";enlist enlist "x"];
    .test.assert.equal["paramNamesFromLine - explicit empty brackets";.analyze.categorize.paramNamesFromLine ".foo:{[]";()];
    .test.assert.equal["paramNamesFromLine - no brackets at all (implicit niladic)";.analyze.categorize.paramNamesFromLine ".kdb.exp.keywords.abs:{";()]
  )
 };

/ --------------------------------------------------
/ sig.suggestForFile against the already-annotated fixture - the
/ suggested parameter names should match what's really there, since
/ this reflects real function definitions rather than the //@param
/ comments sig.fromFile itself reads
/ --------------------------------------------------
.test.an.case.suggestAgainstFixture:{[]
  suggestTbl:.analyze.sig.suggestForFile .test.an.testFile;
  sumOverRow:first select from suggestTbl where functionName=`.user.iter.sumOver;
  addEachRow:first select from suggestTbl where functionName=`.user.iter.addEach;

  (
    .test.assert.equal["suggestForFile fixture - sumOver params";sumOverRow`paramNames;enlist enlist "x"];
    .test.assert.equal["suggestForFile fixture - addEach params";addEachRow`paramNames;(enlist "x";enlist "y")];
    .test.assert.equal["suggestForFile fixture - suggested text has func + param lines";count sumOverRow`suggestedText;2]
  )
 };

/ --------------------------------------------------
/ sig.suggestForFile against a real, unannotated file - this is the
/ actual gap being closed: sig.fromFile could previously only ever
/ be pointed at analyze/testFiles/testFile.q, the one file in the
/ repo with //@func/@param comments. analyze/discover.q has real
/ multi-parameter functions and zero annotations, so a correct match
/ here is real evidence the tool generalizes, not just a fixture
/ round-trip
/ --------------------------------------------------
.test.an.case.suggestAgainstRealFile:{[]
  suggestTbl:.analyze.sig.suggestForFile["analyze/discover.q"];
  patEvRow:first select from suggestTbl where functionName=`.analyze.discover.patternEvidence;

  (
    .test.assert.true["suggestForFile real file - finds several functions";10<count suggestTbl];
    .test.assert.equal["suggestForFile real file - patternEvidence params";patEvRow`paramNames;("scriptLines";"category";"useCase";"patternText")];
    .test.assert.equal["suggestForFile real file - patternEvidence suggested func line";first patEvRow`suggestedText;"//@func  | .analyze.discover.patternEvidence"]
  )
 };

/ --------------------------------------------------
/ sig.suggestForFile against emptyFile.q - the "found nothing" path
/ --------------------------------------------------
.test.an.case.suggestEmpty:{[]
  suggestTbl:.analyze.sig.suggestForFile .test.an.emptyFile;
  enlist .test.assert.equal["suggestForFile empty - row count";count suggestTbl;0]
 };

/ --------------------------------------------------
/ full round trip: generate a suggestion for a genuinely unannotated
/ multi-param function, fill in real type codes as a human would,
/ and confirm sig.fromFile parses the result correctly - this is
/ what actually proves the gap is closed, not just that suggestions
/ get generated
/ --------------------------------------------------
.test.an.case.suggestRoundTrip:{[]
  scriptLines:(".foo.bar:{[x;y;z]";" x+y+z";" }");
  tmpFile:".test.an.tmpRoundTrip.q";
  hsym[`$tmpFile] 0: scriptLines;

  suggestTbl:.analyze.sig.suggestForFile[tmpFile];
  row:first suggestTbl;

  annotated:(row`suggestedText),scriptLines;
  annotated[1]:"//@param | x | 6 | int list";
  annotated[2]:"//@param | y | 6 | int list";
  annotated[3]:"//@param | z | -6 | int atom";
  hsym[`$tmpFile] 0: annotated;

  sigTab:.analyze.sig.fromFile[tmpFile];
  hdel hsym `$tmpFile;

  fooRow:first select from sigTab where functionName=`.foo.bar;

  (
    .test.assert.equal["suggestForFile round trip - suggested params";row`paramNames;(enlist "x";enlist "y";enlist "z")];
    .test.assert.equal["suggestForFile round trip - parsed back arg1";fooRow`arg1;6];
    .test.assert.equal["suggestForFile round trip - parsed back arg2";fooRow`arg2;6];
    .test.assert.equal["suggestForFile round trip - parsed back arg3";fooRow`arg3;-6]
  )
 };
