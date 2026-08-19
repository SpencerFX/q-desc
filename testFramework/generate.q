/ ==================================================
/ testFramework test-case generation
/ ==================================================
/ Fuzz-executes every testable function (signature.q's `niladic and
/ `annotated statuses) via sim/'s own .sim.exec.sampleCalls, then
/ turns the results into label/pass/detail assertion rows in the same
/ shape tests/core/assert.q's functions produce - the format every
/ other test suite in this repo already uses. This mirrors
/ tests/sim/test_sim.q's .test.sim.case.fuzzFixture almost exactly;
/ the difference is fuzzFixture already knows its fixture is fully
/ annotated, while this has to work on any file, so it runs
/ signature.q's resolution first and only fuzzes what that says is
/ safe to call.

/ --------------------------------------------------
/ tunables - kept small since this runs against arbitrary files, not
/ just one curated fixture
/ --------------------------------------------------
.testFramework.generate.argListLength:5;
.testFramework.generate.trialsPerFunction:5;

/ --------------------------------------------------
/ one label/pass/detail row for a single function's fuzz trials
/ --------------------------------------------------
.testFramework.generate.rowForFunction:{[sigTbl;fnSym]
  trialTbl:.sim.exec.sampleCalls[
    sigTbl;
    fnSym;
    .testFramework.generate.argListLength;
    .testFramework.generate.trialsPerFunction];

  allOk:all trialTbl`ok;
  label:string[fnSym]," - ",(string .testFramework.generate.trialsPerFunction)," random trials ok";
  detail:$[allOk;"ok";"failed trials: ",", " sv distinct trialTbl[`error] where not trialTbl`ok];

  `label`pass`detail!(label;allOk;detail)
 };

/ --------------------------------------------------
/ test-case rows for every testable function in a file, plus the
/ signature table itself (so callers/tests can also inspect what got
/ skipped and why, via status<>`niladic`annotated rows' suggestedText)
/ --------------------------------------------------
.testFramework.generate.casesForFile:{[filePath]
  .analyze.load.script filePath;

  sigTbl:.testFramework.signature.resolveForFile filePath;
  testable:select from sigTbl where status in `niladic`annotated;

  results:$[0=count testable;
    ([] label:(); pass:`boolean$(); detail:());
    .testFramework.generate.rowForFunction[testable] each testable`functionName];

  `sigTbl`cases!(sigTbl;results)
 };
