/ ==================================================
/ command-line arg tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.args.assertCapture:{[label;captureTbl]
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
.test.args.assertExists:{[label;fnSym]
  captureTbl:.test.args.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - function exists";row`functionExists]
 };

/ --------------------------------------------------
/ assert example runs successfully
/ --------------------------------------------------
.test.args.assertRuns:{[label;fnSym]
  captureTbl:.test.args.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - execution ok";row`ok]
 };

/ --------------------------------------------------
/ run one arg case
/ --------------------------------------------------
.test.args.case.run:{[label;fnSym]
  raze (
    .test.args.assertCapture[string label;.test.args.capture[label;fnSym]];
    .test.args.assertExists[string label;fnSym];
    .test.args.assertRuns[string label;fnSym]
  )
 };

/ --------------------------------------------------
/ every arg example, discovered by reflecting .kdb.exp.args rather
/ than hand-transcribing the list - .kdb.exp.args has 22+ entries and
/ a typo in a hand-typed list here would defeat the point of this
/ check (catching wiring mistakes, not adding new ones)
/ --------------------------------------------------
.test.args.allList:{[]
  labels:key `.kdb.exp.args;
  labels:labels where labels<>`;
  fnSyms:{[lbl] `$(string `.kdb.exp.args),".",string lbl} each labels;
  ([] label:labels; fnSym:fnSyms)
 };

/ --------------------------------------------------
/ run a list of arg specs
/ --------------------------------------------------
.test.args.case.runList:{[specTbl]
  i:0;
  n:count specTbl;
  results:([] label:();pass:();detail:());

  while[i<n;
    results,: .test.args.case.run[specTbl[`label] i;specTbl[`fnSym] i];
    i+:1
  ];

  results
 };
