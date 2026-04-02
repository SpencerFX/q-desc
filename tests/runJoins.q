/ ==================================================
/ run join tests
/ ==================================================

/ --------------------------------------------------
/ load assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load join capture functions
/ --------------------------------------------------
system "l tests/joins/capture.q";

/ --------------------------------------------------
/ load join test cases
/ --------------------------------------------------
system "l tests/joins/test_joins.q";

/ --------------------------------------------------
/ run all join tests
/ --------------------------------------------------
allResults:raze (
  .test.join.case.ljBasic[];
  .test.join.case.pjBasic[];
  .test.join.case.ujBasic[];
  .test.join.case.ajBasic[]
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