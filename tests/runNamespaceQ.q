/ ==================================================
/ run namespaceQ tests
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
/ load namespaceQ capture functions
/ --------------------------------------------------
system "l tests/namespaceQ/capture.q";

/ --------------------------------------------------
/ load namespaceQ test cases
/ --------------------------------------------------
system "l tests/namespaceQ/test_namespaceQ.q";

/ --------------------------------------------------
/ run all namespaceQ tests
/ --------------------------------------------------
allResults:.test.nsq.case.runList[.test.nsq.allList[]];

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;metricValue:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;
