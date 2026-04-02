/ ==================================================
/ run iterator tests
/ ==================================================

/ --------------------------------------------------
/ load assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load iterator capture functions
/ --------------------------------------------------
system "l tests/iterators/capture.q";

/ --------------------------------------------------
/ load iterator test cases
/ --------------------------------------------------
system "l tests/iterators/test_iterators.q";

/ --------------------------------------------------
/ run all iterator tests
/ --------------------------------------------------
allResults:raze (
  .test.iter.case.eachAdd[];
  .test.iter.case.overSum[];
  .test.iter.case.overSeededSum[];
  .test.iter.case.scanSum[];
  .test.iter.case.priorDiff[]);

/ --------------------------------------------------
/ build summary table
/ --------------------------------------------------
summary:([] metric:`total`passed`failed;value:(count allResults;sum allResults`pass;sum not allResults`pass));

/ --------------------------------------------------
/ display results
/ --------------------------------------------------
show allResults;
show summary;