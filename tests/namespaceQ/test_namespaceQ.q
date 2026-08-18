/ ==================================================
/ namespaceQ tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.nsq.assertCapture:{[label;captureTbl]
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
.test.nsq.assertExists:{[label;fnSym]
  captureTbl:.test.nsq.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - function exists";row`functionExists]
 };

/ --------------------------------------------------
/ assert example runs successfully
/ --------------------------------------------------
.test.nsq.assertRuns:{[label;fnSym]
  captureTbl:.test.nsq.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - execution ok";row`ok]
 };

/ --------------------------------------------------
/ run one arg case
/ --------------------------------------------------
.test.nsq.case.run:{[label;fnSym]
  raze (
    .test.nsq.assertCapture[string label;.test.nsq.capture[label;fnSym]];
    .test.nsq.assertExists[string label;fnSym];
    .test.nsq.assertRuns[string label;fnSym]
  )
 };

/ --------------------------------------------------
/ every arg example, discovered by reflecting .kdb.exp.func.Q rather
/ than hand-transcribing the list - .kdb.exp.func.Q has 22+ entries and
/ a typo in a hand-typed list here would defeat the point of this
/ check (catching wiring mistakes, not adding new ones)
/ --------------------------------------------------
.test.nsq.allList:{[]
  labels:key `.kdb.exp.func.Q;
  labels:labels where labels<>`;
  fnSyms:{[lbl] `$(string `.kdb.exp.func.Q),".",string lbl} each labels;
  ([] label:labels; fnSym:fnSyms)
 };

/ --------------------------------------------------
/ run a list of arg specs
/ --------------------------------------------------
.test.nsq.case.runList:{[specTbl]
  i:0;
  n:count specTbl;
  results:([] label:();pass:();detail:());

  while[i<n;
    results,: .test.nsq.case.run[specTbl[`label] i;specTbl[`fnSym] i];
    i+:1
  ];

  results
 };
