/ ==================================================
/ run testFramework/ tests
/ ==================================================

/ --------------------------------------------------
/ initialize repo content, analyze/, sim/, and testFramework/ modules
/ --------------------------------------------------
system "l scripts/init.q";
.kdb.init["description/"];
.kdb.init["dictionary/"];
.kdb.init["data/"];
.kdb.init["example/"];
system "l testFramework/init.q";

/ --------------------------------------------------
/ load shared assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load testFramework test cases
/ --------------------------------------------------
system "l tests/testFramework/test_testFramework.q";

/ --------------------------------------------------
/ run all testFramework tests
/ --------------------------------------------------
allResults:raze (
  .test.tf.case.discoverNiladicBracketsRegression[];
  .test.tf.case.signatureFixtureResolvesAll[];
  .test.tf.case.signatureNiladicRealFile[];
  .test.tf.case.signatureNeedsAnnotationRealFile[];
  .test.tf.case.fromFileEmptyTableRegression[];
  .test.tf.case.generateFixtureAllPass[];
  .test.tf.case.runForFileFixtureSummary[];
  .test.tf.case.runForFileParametrizedSkips[]
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
