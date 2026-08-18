/ ==================================================
/ namespaceZ tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.nsz.assertCapture:{[label;captureTbl]
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
.test.nsz.assertExists:{[label;fnSym]
  captureTbl:.test.nsz.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - function exists";row`functionExists]
 };

/ --------------------------------------------------
/ assert example runs successfully
/ --------------------------------------------------
.test.nsz.assertRuns:{[label;fnSym]
  captureTbl:.test.nsz.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - execution ok";row`ok]
 };

/ --------------------------------------------------
/ run one arg case
/ --------------------------------------------------
.test.nsz.case.run:{[label;fnSym]
  raze (
    .test.nsz.assertCapture[string label;.test.nsz.capture[label;fnSym]];
    .test.nsz.assertExists[string label;fnSym];
    .test.nsz.assertRuns[string label;fnSym]
  )
 };

/ --------------------------------------------------
/ every arg example, discovered by reflecting .kdb.exp.func.z rather
/ than hand-transcribing the list - .kdb.exp.func.z has 22+ entries and
/ a typo in a hand-typed list here would defeat the point of this
/ check (catching wiring mistakes, not adding new ones)
/ --------------------------------------------------
.test.nsz.allList:{[]
  labels:key `.kdb.exp.func.z;
  labels:labels where labels<>`;
  fnSyms:{[lbl] `$(string `.kdb.exp.func.z),".",string lbl} each labels;
  ([] label:labels; fnSym:fnSyms)
 };

/ --------------------------------------------------
/ run a list of arg specs
/ --------------------------------------------------
.test.nsz.case.runList:{[specTbl]
  i:0;
  n:count specTbl;
  results:([] label:();pass:();detail:());

  while[i<n;
    results,: .test.nsz.case.run[specTbl[`label] i;specTbl[`fnSym] i];
    i+:1
  ];

  results
 };
