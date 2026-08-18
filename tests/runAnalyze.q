/ ==================================================
/ run analyze/ tests
/ ==================================================

/ --------------------------------------------------
/ initialize repo content and analyze/ modules
/ --------------------------------------------------
system "l scripts/init.q";
.kdb.init["description/"];
.kdb.init["dictionary/"];
.kdb.init["data/"];
.kdb.init["example/"];
system "l analyze/init.q";

/ --------------------------------------------------
/ load shared assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load analyze test cases
/ --------------------------------------------------
system "l tests/analyze/test_analyze.q";

/ --------------------------------------------------
/ run all analyze tests
/ --------------------------------------------------
allResults:raze (
  .test.an.case.loadText[];
  .test.an.case.lineHasPattern[];
  .test.an.case.discoverFound[];
  .test.an.case.discoverEmpty[];
  .test.an.case.classifyFound[];
  .test.an.case.classifyEmpty[];
  .test.an.case.runScript[];
  .test.an.case.categorizeFileName[];
  .test.an.case.categorizeFunctionName[];
  .test.an.case.categorizeFound[];
  .test.an.case.categorizeEmpty[];
  .test.an.case.sigFound[];
  .test.an.case.sigEmpty[]
 );

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;metricValue:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;
