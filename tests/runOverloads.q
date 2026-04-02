/ ==================================================
/ run overload tests
/ ==================================================

/ --------------------------------------------------
/ load assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load overload capture functions
/ --------------------------------------------------
system "l tests/overloads/capture.q";

/ --------------------------------------------------
/ load overload test cases
/ --------------------------------------------------
system "l tests/overloads/test_overloads.q";

/ --------------------------------------------------
/ run all overload tests
/ --------------------------------------------------
allResults:raze (
  .test.over.case.findBasic[];
  .test.over.case.rollBasic[];
  .test.over.case.permuteBasic[];
  .test.over.case.vectorConditionalBasic[];
  .test.over.case.indexAtBasic[];
  .test.over.case.trapAtBasic[];
  .test.over.case.amendAtBasic[];
  .test.over.case.replaceAtBasic[];
  .test.over.case.dotApplyBasic[];
  .test.over.case.dotTrapBasic[]
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