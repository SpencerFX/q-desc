/ ==================================================
/ internals tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.intl.assertCapture:{[label;captureTbl]
  row:first captureTbl;

  (
    .test.assert.true[label," - function exists";row`functionExists];
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.nonEmpty[label," - result preview recorded";enlist row`resultPreview]
  )
 };

/ --------------------------------------------------
/ assert example function exists
/ --------------------------------------------------
.test.intl.assertExists:{[label;fnSym]
  captureTbl:.test.intl.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - function exists";row`functionExists]
 };

/ --------------------------------------------------
/ assert example runs successfully
/ --------------------------------------------------
.test.intl.assertRuns:{[label;fnSym]
  captureTbl:.test.intl.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - execution ok";row`ok]
 };

/ --------------------------------------------------
/ run one internals case
/ --------------------------------------------------
.test.intl.case.run:{[label;fnSym]
  raze (
    .test.intl.assertCapture[string label;.test.intl.capture[label;fnSym]];
    .test.intl.assertExists[string label;fnSym];
    .test.intl.assertRuns[string label;fnSym]
  )
 };

/ --------------------------------------------------
/ every internals (-N!) example, discovered by reflecting .kdb.exp.func
/ rather than hand-transcribing the list - a typo in a hand-typed list
/ here would defeat the point of this check (catching wiring mistakes,
/ not adding new ones). .kdb.exp.func also holds the j/Q/z namespace
/ sub-contexts alongside the minusNBang leaves (example/namespaceJ.q,
/ namespaceQ.q and namespaceZ.q live under .kdb.exp.func too), so
/ those three names are excluded - they're covered by their own
/ dedicated test topics.
/ --------------------------------------------------
.test.intl.allList:{[]
  labels:key `.kdb.exp.func;
  labels:labels where labels<>`;
  labels:labels where not labels in `j`Q`z;
  fnSyms:{[lbl] `$(string `.kdb.exp.func),".",string lbl} each labels;
  ([] label:labels; fnSym:fnSyms)
 };

/ --------------------------------------------------
/ run a list of internals specs
/ --------------------------------------------------
.test.intl.case.runList:{[specTbl]
  i:0;
  n:count specTbl;
  results:([] label:();pass:();detail:());

  while[i<n;
    results,: .test.intl.case.run[specTbl[`label] i;specTbl[`fnSym] i];
    i+:1
  ];

  results
 };
