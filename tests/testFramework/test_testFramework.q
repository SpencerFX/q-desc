/ ==================================================
/ testFramework/ tests
/ ==================================================
/ testFramework/ turns any file into automated test cases: discover.q
/ finds every function (reusing analyze/'s own function-boundary
/ scanning), signature.q decides which are safe to call (niladic, or
/ carrying a real //@param type-code annotation) versus which need a
/ human to annotate them, and generate.q fuzz-executes the safe ones
/ via sim/'s existing signature-driven fuzzer, producing label/pass/
/ detail rows in the same shape every other suite here uses.
/ -
/ Three fixtures exercise the three real paths: the annotated fixture
/ (fully resolvable, nothing skipped), a real unannotated file with
/ only bare-brace niladic functions (also fully resolvable), and a
/ real unannotated file with genuinely parametrized functions (must
/ be skipped, not guessed at).

/ --------------------------------------------------
/ fixtures
/ --------------------------------------------------
.test.tf.annotatedFixture:"analyze/testFiles/testFile.q";
.test.tf.niladicRealFile:"example/keywords.q";
.test.tf.parametrizedRealFile:"sim/core/util.q";

/ --------------------------------------------------
/ discover.q - regression: .analyze.sig.suggestForFile used to
/ mis-report paramCount 1 (wrapped ,()) instead of 0 for functions
/ declared with explicit empty brackets, because its accumulation
/ loop appended results one at a time via ,:enlist - an empty result
/ appended after a non-empty one got wrapped by q's own type
/ coercion. Fixed by building funcNames/paramLists with vectorized
/ each instead of incremental accumulation (analyze/categorize.q)
/ --------------------------------------------------
.test.tf.case.discoverNiladicBracketsRegression:{[]
  tbl:.testFramework.discover.functionsInFile .test.tf.annotatedFixture;
  niladicRows:select from tbl where paramCount=0;

  (
    .test.assert.equal["discover - row count";count tbl;16];
    .test.assert.equal["discover - niladic-with-brackets count";count niladicRows;5];
    .test.assert.true["discover - niladic paramNames genuinely empty, not wrapped";
      all () ~/: niladicRows`paramNames]
  )
 };

/ --------------------------------------------------
/ signature.q - fully annotated fixture: every function resolves,
/ nothing needs manual annotation
/ --------------------------------------------------
.test.tf.case.signatureFixtureResolvesAll:{[]
  tbl:.testFramework.signature.resolveForFile .test.tf.annotatedFixture;

  (
    .test.assert.equal["signature fixture - row count";count tbl;16];
    .test.assert.equal["signature fixture - annotated count";
      count select from tbl where status=`annotated;11];
    .test.assert.equal["signature fixture - niladic count";
      count select from tbl where status=`niladic;5];
    .test.assert.equal["signature fixture - none need annotation";
      count select from tbl where status=`needsAnnotation;0]
  )
 };

/ --------------------------------------------------
/ signature.q - real file, no annotations at all, but every function
/ is bare-brace niladic (example/*.q's documented convention) - all
/ should resolve to `niladic, none skipped
/ --------------------------------------------------
.test.tf.case.signatureNiladicRealFile:{[]
  tbl:.testFramework.signature.resolveForFile .test.tf.niladicRealFile;

  (
    .test.assert.true["signature niladic real file - non-empty";0<count tbl];
    .test.assert.equal["signature niladic real file - all niladic";
      count select from tbl where status<>`niladic;0]
  )
 };

/ --------------------------------------------------
/ signature.q - real file with genuinely parametrized, unannotated
/ functions: must be reported as needing annotation, not guessed at
/ --------------------------------------------------
.test.tf.case.signatureNeedsAnnotationRealFile:{[]
  tbl:.testFramework.signature.resolveForFile .test.tf.parametrizedRealFile;
  needsAnn:select from tbl where status=`needsAnnotation;

  (
    .test.assert.true["signature needsAnnotation real file - found some";0<count needsAnn];
    .test.assert.equal["signature needsAnnotation real file - none guessed as annotated";
      count select from tbl where status=`annotated;0];
    .test.assert.true["signature needsAnnotation real file - suggestedText present";
      all 0<count each needsAnn`suggestedText]
  )
 };

/ --------------------------------------------------
/ regression: .analyze.sig.fromFile used to return a plain untyped
/ empty list () instead of a well-formed 0-row table when a real file
/ (many lines, zero //@func annotations) was passed in - breaking any
/ caller that keys/joins on its result, discovered while joining it
/ against discover.q's output in signature.q (analyze/categorize.q)
/ --------------------------------------------------
.test.tf.case.fromFileEmptyTableRegression:{[]
  r:.analyze.sig.fromFile .test.tf.niladicRealFile;

  (
    .test.assert.equal["fromFile empty annotations - is a table";type r;98h];
    .test.assert.equal["fromFile empty annotations - functionName col type";
      type r`functionName;11h]
  )
 };

/ --------------------------------------------------
/ generate.q - every testable function in the annotated fixture
/ fuzz-executes without error
/ --------------------------------------------------
.test.tf.case.generateFixtureAllPass:{[]
  out:.testFramework.generate.casesForFile .test.tf.annotatedFixture;

  (
    .test.assert.equal["generate fixture - case count";count out`cases;16];
    .test.assert.true["generate fixture - all pass";all out[`cases]`pass]
  )
 };

/ --------------------------------------------------
/ run.q - end-to-end summary for the annotated fixture: everything
/ resolvable, everything passes, nothing skipped
/ --------------------------------------------------
.test.tf.case.runForFileFixtureSummary:{[]
  resultDict:.testFramework.run.forFile .test.tf.annotatedFixture;
  cases:resultDict`cases;

  (
    .test.assert.equal["run fixture - total";count cases;16];
    .test.assert.true["run fixture - all passed";all cases`pass];
    .test.assert.equal["run fixture - skipped";count resultDict`skipped;0]
  )
 };

/ --------------------------------------------------
/ run.q - end-to-end summary for a real file with unannotated
/ parametrized functions: those are skipped (with suggested
/ annotation text), not fuzzed with guessed argument types
/ --------------------------------------------------
.test.tf.case.runForFileParametrizedSkips:{[]
  resultDict:.testFramework.run.forFile .test.tf.parametrizedRealFile;

  (
    .test.assert.true["run parametrized file - some skipped";0<count resultDict`skipped];
    .test.assert.true["run parametrized file - skipped rows carry suggestedText";
      all 0<count each resultDict[`skipped]`suggestedText]
  )
 };
