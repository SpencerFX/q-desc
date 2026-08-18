/ ==================================================
/ run scripts/help.q tests
/ ==================================================

/ --------------------------------------------------
/ initialize repo content and the help lookup layer
/ --------------------------------------------------
system "l scripts/init.q";
.kdb.init["description/"];
.kdb.init["dictionary/"];
.kdb.init["data/"];
.kdb.init["example/"];
system "l scripts/help.q";

/ --------------------------------------------------
/ load shared assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load help test cases
/ --------------------------------------------------
system "l tests/help/test_help.q";

/ --------------------------------------------------
/ run all help tests
/ --------------------------------------------------
allResults:raze (
  .test.help.case.unambiguous[];
  .test.help.case.ambiguous[];
  .test.help.case.disambiguated[];
  .test.help.case.dottedFallback[];
  .test.help.case.notFound[];
  .test.help.case.noExample[];
  .test.help.case.mismatchedPair[]
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
