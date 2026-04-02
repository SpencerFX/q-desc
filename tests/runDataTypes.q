/ ==================================================
/ run data type tests
/ ==================================================

/ --------------------------------------------------
/ load assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load data type capture functions
/ --------------------------------------------------
system "l tests/dataTypes/capture.q";

/ --------------------------------------------------
/ load data type test cases
/ --------------------------------------------------
system "l tests/dataTypes/test_dataTypes.q";

/ --------------------------------------------------
/ run all data type tests
/ --------------------------------------------------
allResults:raze (
  .test.dt.case.typeBasic[];
  .test.dt.case.stringBasic[];
  .test.dt.case.intCastBasic[];
  .test.dt.case.floatCastBasic[];
  .test.dt.case.symbolCastBasic[];
  .test.dt.case.atomBasic[];
  .test.dt.case.listBasic[]
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