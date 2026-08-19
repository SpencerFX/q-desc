/ ==================================================
/ sim/ tests
/ ==================================================
/ sim/ was built but never wired to anything - every example function
/ in example/*.q is niladic (see tests/analyze - none of the 384 take
/ arguments), so there was nothing to inject randomized args into
/ there. sim/core/util.q's .sim.exec.callBySig / .sim.exec.sampleCalls
/ are already shaped to consume .analyze.sig.fromFile's output table
/ directly (same functionName/arg1..arg8 schema), and
/ analyze/testFiles/testFile.q's //@func/@param-annotated .user.*
/ functions are genuinely parametrized - so that fixture is the real,
/ already-intended integration point between analyze/ and sim/.
/ -
/ Building this surfaced five real, previously-undiscovered bugs, all
/ fixed alongside this suite (see the fix-regression cases below):
/ sampleCalls wrapped its per-row table in a spurious enlist, breaking
/ every call; sim.rand.symbols indexed a symbol list by symbols
/ instead of sampling it, crashing on every call; guid generation used
/ .Q.n (the digit string "0123456789") where the guid-null literal
/ 0Ng was clearly intended, in three places; and inject.args.pairs
/ read a nonexistent `objVal column instead of the registry's actual
/ `val column, silently returning zero rows.

/ --------------------------------------------------
/ fixture: the only source in the repo with real //@func/@param
/ annotations, so the only thing analyze.sig.fromFile can build a
/ signature table from
/ --------------------------------------------------
.test.sim.fixture:"analyze/testFiles/testFile.q";
.test.sim.trialsPerFn:10;

/ --------------------------------------------------
/ regression: sampleCalls used to error on every call because of a
/ spurious enlist around its per-row table (fixed in sim/core/util.q)
/ --------------------------------------------------
.test.sim.case.sampleCallsRegression:{[]
  sigTbl:.analyze.sig.fromFile .test.sim.fixture;
  results:.sim.exec.sampleCalls[sigTbl;`.user.iter.sumOver;5;3];

  (
    .test.assert.equal["sampleCalls - row count matches run count";count results;3];
    .test.assert.true["sampleCalls - every trial ok";all results`ok]
  )
 };

/ --------------------------------------------------
/ regression: sim.rand.symbols used to index a symbol list by
/ symbols (invalid) instead of sampling it, erroring on every call
/ --------------------------------------------------
.test.sim.case.randSymbolsRegression:{[]
  syms:.sim.rand.symbols 5;

  (
    .test.assert.equal["rand.symbols - count";count syms;5];
    .test.assert.equal["rand.symbols - type is symbol list";type syms;11h]
  )
 };

/ --------------------------------------------------
/ regression: guid generation used .Q.n (the digit string
/ "0123456789") where the guid-null literal 0Ng was intended
/ --------------------------------------------------
.test.sim.case.guidRegression:{[]
  guidAtomVal:.sim.exec.randByType[-2;1];
  guidListVal:.sim.exec.randByType[2;5];

  (
    .test.assert.equal["randByType - guid atom type";type guidAtomVal;-2h];
    .test.assert.equal["randByType - guid list type";type guidListVal;2h];
    .test.assert.equal["randByType - guid list count";count guidListVal;5]
  )
 };

/ --------------------------------------------------
/ regression: inject.args.pairs read a nonexistent `objVal column
/ (the registry's real column is `val), so it always returned 0 rows
/ --------------------------------------------------
.test.sim.case.injectPairsRegression:{[]
  reg:.sim.data.atoms.build[];
  pairs:.sim.inject.args.pairs reg;
  expected:(count reg) * count reg;

  enlist .test.assert.equal["inject.args.pairs - N x N rows";count pairs;expected]
 };

/ --------------------------------------------------
/ registry sanity - the static sample-data side of sim/, unrelated to
/ signature-based fuzzing but exercised here since it also had never
/ been run before today
/ --------------------------------------------------
.test.sim.case.registryBuild:{[]
  reg:.sim.data.all.build[];

  (
    .test.assert.true["data.all.build - non-empty";0<count reg];
    .test.assert.equal["data.all.build - categories";distinct reg`category;`atom`list`dictionary`table`nested]
  )
 };

/ callBySig's error trap used to update its ok/error locals via ::
/ from inside a nested handler lambda - :: always targets the true
/ global namespace, never an enclosing function's own local of the
/ same name, so those locals were never actually touched and every
/ fuzz call silently reported ok:1b no matter what really happened
/ (fixed in sim/core/util.q: the trapped call now returns
/ (ok;result;error) as its own value instead of mutating enclosing
/ locals). Once the trap could actually detect failures, 4 of these
/ 16 fixture functions turned out to never have genuinely passed:
/ the three real joins need domain-shaped/keyed tables sim's generic
/ table generator doesn't produce, and permuteBasic needs a valid
/ permutation index vector, not arbitrary random ints. Excluded here
/ and pinned separately below so this suite keeps testing everything
/ that actually can pass, without re-hiding the same masking bug
/ under a different name
/ --------------------------------------------------
.test.sim.knownIncompatible:`leftJoinBasic`asOfJoinBasic`plusJoinBasic`permuteBasic;

/ --------------------------------------------------
/ the actual fuzz integration: analyze.sig.fromFile + sim.exec.* -
/ every //@param-annotated function in the fixture (except the known
/ table/index-shape gaps above), called several times with randomly
/ generated arguments matching its declared per-argument type codes,
/ must execute without error every time
/ --------------------------------------------------
.test.sim.case.fuzzFixture:{[]
  sigTbl:.analyze.sig.fromFile .test.sim.fixture;
  fnSyms:sigTbl`functionName;
  fnSyms:fnSyms where not (`$last each "." vs/: string fnSyms) in .test.sim.knownIncompatible;

  results:();
  i:0;
  n:count fnSyms;

  while[i<n;
    fnSym:fnSyms i;
    trialTbl:.sim.exec.sampleCalls[sigTbl;fnSym;5;.test.sim.trialsPerFn];
    label:string fnSym;
    allOk:all trialTbl`ok;
    detail:$[allOk;"ok";"failed trials: ",", " sv distinct trialTbl[`error] where not trialTbl`ok];

    results,:enlist `label`pass`detail!(label," - ",(string .test.sim.trialsPerFn)," random trials ok";allOk;detail);
    i+:1
  ];

  results
 };

/ --------------------------------------------------
/ regression pin: the 4 known-incompatible functions above must still
/ fail (and specifically for their known reason) - if one of them
/ starts passing, that's real news (sim's generator got smarter, or
/ the function's requirements loosened) and this should be revisited,
/ not silently re-masked
/ --------------------------------------------------
.test.sim.case.knownIncompatibleStillFail:{[]
  sigTbl:.analyze.sig.fromFile .test.sim.fixture;

  results:();
  i:0;
  n:count .test.sim.knownIncompatible;

  while[i<n;
    shortName:.test.sim.knownIncompatible i;
    fnSym:first sigTbl[`functionName] where shortName~/:`$last each "." vs/: string sigTbl`functionName;
    trialTbl:.sim.exec.sampleCalls[sigTbl;fnSym;5;.test.sim.trialsPerFn];
    stillFails:any not trialTbl`ok;

    results,:enlist .test.assert.true["knownIncompatible - ",(string shortName)," still fails as expected";stillFails];
    i+:1
  ];

  results
 };
