/ ==================================================
/ run table tests
/ ==================================================

/ --------------------------------------------------
/ load assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load table capture functions
/ --------------------------------------------------
system "l tests/tables/capture.q";

/ --------------------------------------------------
/ load table test cases
/ --------------------------------------------------
system "l tests/tables/test_tables.q";

/ --------------------------------------------------
/ run all table tests
/ --------------------------------------------------
allResults:raze (
  .test.tbl.case.flipBasic[];
  .test.tbl.case.colsBasic[];
  .test.tbl.case.xcolsBasic[];
  .test.tbl.case.keyBasic[];
  .test.tbl.case.valueBasic[]
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