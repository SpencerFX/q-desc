/ ==================================================
/ run description/dictionary consistency tests
/ ==================================================

/ --------------------------------------------------
/ initialize repo content required by the checks
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
/ load consistency checks
/ --------------------------------------------------
system "l tests/consistency/test_consistency.q";

/ --------------------------------------------------
/ run all consistency checks
/ --------------------------------------------------
allResults:.test.consistency.runAll[];

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;metricValue:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;
