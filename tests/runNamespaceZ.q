/ ==================================================
/ run namespaceZ tests
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
/ load namespaceZ capture functions
/ --------------------------------------------------
system "l tests/namespaceZ/capture.q";

/ --------------------------------------------------
/ load namespaceZ test cases
/ --------------------------------------------------
system "l tests/namespaceZ/test_namespaceZ.q";

/ --------------------------------------------------
/ run all namespaceZ tests
/ --------------------------------------------------
allResults:.test.nsz.case.runList[.test.nsz.allList[]];

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;metricValue:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;
