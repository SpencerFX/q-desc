/ ==================================================
/ namespaceJ tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.nsj.assertCapture:{[label;captureTbl]
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
.test.nsj.assertExists:{[label;fnSym]
  captureTbl:.test.nsj.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - function exists";row`functionExists]
 };

/ --------------------------------------------------
/ assert example runs successfully
/ --------------------------------------------------
.test.nsj.assertRuns:{[label;fnSym]
  captureTbl:.test.nsj.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - execution ok";row`ok]
 };

/ --------------------------------------------------
/ run one arg case
/ --------------------------------------------------
.test.nsj.case.run:{[label;fnSym]
  raze (
    .test.nsj.assertCapture[string label;.test.nsj.capture[label;fnSym]];
    .test.nsj.assertExists[string label;fnSym];
    .test.nsj.assertRuns[string label;fnSym]
  )
 };

/ --------------------------------------------------
/ every arg example, discovered by reflecting .kdb.exp.j rather
/ than hand-transcribing the list - .kdb.exp.j has 22+ entries and
/ a typo in a hand-typed list here would defeat the point of this
/ check (catching wiring mistakes, not adding new ones)
/ --------------------------------------------------
.test.nsj.allList:{[]
  labels:key `.kdb.exp.j;
  labels:labels where labels<>`;
  fnSyms:{[lbl] `$(string `.kdb.exp.j),".",string lbl} each labels;
  ([] label:labels; fnSym:fnSyms)
 };

/ --------------------------------------------------
/ run a list of arg specs
/ --------------------------------------------------
.test.nsj.case.runList:{[specTbl]
  i:0;
  n:count specTbl;
  results:([] label:();pass:();detail:());

  while[i<n;
    results,: .test.nsj.case.run[specTbl[`label] i;specTbl[`fnSym] i];
    i+:1
  ];

  results
 };
