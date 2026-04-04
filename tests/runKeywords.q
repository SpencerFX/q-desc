/ ==================================================
/ run keyword tests
/ ==================================================

/ --------------------------------------------------
/ initialize repo content required by examples
/ --------------------------------------------------
system "l scripts/init.q";
.kdb.init["description/"];
.kdb.init["dictionary/"];
.kdb.init["data/"];
.kdb.init["example/"];

/ --------------------------------------------------
/ load shared assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load keyword capture functions
/ --------------------------------------------------
system "l tests/keywords/capture.q";

/ --------------------------------------------------
/ load keyword test cases
/ --------------------------------------------------
system "l tests/keywords/test_keywords.q";

/ --------------------------------------------------
/ choose test sets
/ --------------------------------------------------
coreSpecs:.test.kw.coreList[];
dataSpecs:.test.kw.dataList[];

/ --------------------------------------------------
/ run all keyword tests
/ --------------------------------------------------
allResults:raze (
  .test.kw.case.runList coreSpecs;
  .test.kw.case.runList dataSpecs
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