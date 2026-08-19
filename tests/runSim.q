/ ==================================================
/ run sim/ tests
/ ==================================================

/ --------------------------------------------------
/ initialize repo content, analyze/ and sim/ modules, and the fixture
/ (loaded for real so its //@func-annotated functions are callable,
/ not just parseable)
/ --------------------------------------------------
system "l scripts/init.q";
.kdb.init["description/"];
.kdb.init["dictionary/"];
.kdb.init["data/"];
.kdb.init["example/"];
system "l analyze/init.q";
system "l sim/init.q";
system "l analyze/testFiles/testFile.q";

/ --------------------------------------------------
/ load shared assertion functions
/ --------------------------------------------------
system "l tests/core/assert.q";

/ --------------------------------------------------
/ load sim test cases
/ --------------------------------------------------
system "l tests/sim/test_sim.q";

/ --------------------------------------------------
/ run all sim tests
/ --------------------------------------------------
allResults:raze (
  .test.sim.case.sampleCallsRegression[];
  .test.sim.case.randSymbolsRegression[];
  .test.sim.case.guidRegression[];
  .test.sim.case.injectPairsRegression[];
  .test.sim.case.registryBuild[];
  .test.sim.case.fuzzFixture[];
  .test.sim.case.knownIncompatibleStillFail[]
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
