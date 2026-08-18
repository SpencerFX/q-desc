/ ==================================================
/ run command-line arg tests
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
/ load arg capture functions
/ --------------------------------------------------
system "l tests/args/capture.q";

/ --------------------------------------------------
/ load arg test cases
/ --------------------------------------------------
system "l tests/args/test_args.q";

/ --------------------------------------------------
/ run all arg tests
/ --------------------------------------------------
allResults:.test.args.case.runList[.test.args.allList[]];

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;metricValue:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;
