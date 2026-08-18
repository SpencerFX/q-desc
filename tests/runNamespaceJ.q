/ ==================================================
/ run namespaceJ tests
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
/ load namespaceJ capture functions
/ --------------------------------------------------
system "l tests/namespaceJ/capture.q";

/ --------------------------------------------------
/ load namespaceJ test cases
/ --------------------------------------------------
system "l tests/namespaceJ/test_namespaceJ.q";

/ --------------------------------------------------
/ run all namespaceJ tests
/ --------------------------------------------------
allResults:.test.nsj.case.runList[.test.nsj.allList[]];

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;metricValue:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;
