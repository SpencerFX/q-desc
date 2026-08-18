/ ==================================================
/ run internals tests
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
/ load internals capture functions
/ --------------------------------------------------
system "l tests/internals/capture.q";

/ --------------------------------------------------
/ load internals test cases
/ --------------------------------------------------
system "l tests/internals/test_internals.q";

/ --------------------------------------------------
/ run all internals tests
/ --------------------------------------------------
allResults:.test.intl.case.runList[.test.intl.allList[]];

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;metricValue:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;
