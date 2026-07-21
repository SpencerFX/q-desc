/ ==================================================
/ join tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.join.assertCapture:{[label;captureTbl]
  row:first captureTbl;
  argCount:`long$row`argCount;
  argTypeNames:row`argTypeNames;
  resultPreview:row`resultPreview;

  (
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.true[label," - arg count recorded";argCount>0];
    .test.assert.nonEmpty[label," - arg types recorded";argTypeNames];
    .test.assert.nonEmpty[label," - result preview recorded";enlist resultPreview]
  )
 };

/ --------------------------------------------------
/ assert join result matches expected value
/ --------------------------------------------------
.test.join.assertResult:{[label;joinName;joinFunc;argVals;expectedVal]
  captureTbl:.test.join.capture[joinName;joinFunc;argVals];
  row:first captureTbl;

  (
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.equal[label," - result matches expected";row`resultValue;expectedVal]
  )
 };

/ --------------------------------------------------
/ assert join argument count
/ --------------------------------------------------
.test.join.assertArgCount:{[label;joinName;joinFunc;argVals;expectedCount]
  captureTbl:.test.join.capture[joinName;joinFunc;argVals];
  row:first captureTbl;
  actualCount:`long$row`argCount;
  expectedCount:`long$expectedCount;

  enlist .test.assert.equal[label," - arg count";actualCount;expectedCount]
 };

/ --------------------------------------------------
/ assert join argument types
/ --------------------------------------------------
.test.join.assertArgTypes:{[label;joinName;joinFunc;argVals;expectedTypes]
  captureTbl:.test.join.capture[joinName;joinFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - arg types";row`argTypeCodes;expectedTypes]
 };

/ --------------------------------------------------
/ assert keyed-table flags for arguments
/ --------------------------------------------------
.test.join.assertKeyedFlags:{[label;joinName;joinFunc;argVals;expectedFlags]
  captureTbl:.test.join.capture[joinName;joinFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - keyed flags";row`argKeyedFlags;expectedFlags]
 };

/ --------------------------------------------------
/ left join case
/ --------------------------------------------------
.test.join.case.ljBasic:{[]
  leftInput:([] sym:`a`b`c; px:10 20 30);
  rightInput:([sym:`a`c] qty:100 300);
  joinFunc:lj;
  argVals:(leftInput;rightInput);
  expectedVal:([] sym:`a`b`c; px:10 20 30; qty:100 0N 300);
  expectedTypes:`short$ 98 99;
  expectedFlags:01b;

  raze (
    .test.join.assertCapture["lj basic";.test.join.capture[`lj;joinFunc;argVals]];
    .test.join.assertResult["lj basic";`lj;joinFunc;argVals;expectedVal];
    .test.join.assertArgCount["lj basic";`lj;joinFunc;argVals;2];
    .test.join.assertArgTypes["lj basic";`lj;joinFunc;argVals;expectedTypes];
    .test.join.assertKeyedFlags["lj basic";`lj;joinFunc;argVals;expectedFlags]
  )
 };

/ --------------------------------------------------
/ plus join case
/ --------------------------------------------------
.test.join.case.pjBasic:{[]
  leftInput:([sym:`a`b] px:10 20; qty:1 2);
  rightInput:([sym:`a`b] px:3 4; qty:10 20);
  joinFunc:pj;
  argVals:(leftInput;rightInput);
  expectedVal:([sym:`a`b] px:13 24; qty:11 22);
  expectedTypes:`short$ 99 99;
  expectedFlags:11b;

  raze (
    .test.join.assertCapture["pj basic";.test.join.capture[`pj;joinFunc;argVals]];
    .test.join.assertResult["pj basic";`pj;joinFunc;argVals;expectedVal];
    .test.join.assertArgCount["pj basic";`pj;joinFunc;argVals;2];
    .test.join.assertArgTypes["pj basic";`pj;joinFunc;argVals;expectedTypes];
    .test.join.assertKeyedFlags["pj basic";`pj;joinFunc;argVals;expectedFlags]
  )
 };

/ --------------------------------------------------
/ union join case
/ --------------------------------------------------
.test.join.case.ujBasic:{[]
  leftInput:([] sym:`a`b; px:10 20);
  rightInput:([] sym:`b`c; qty:200 300);
  joinFunc:uj;
  argVals:(leftInput;rightInput);
  expectedVal:([] sym:`a`b`b`c; px:10 20 0N 0N; qty:0N 0N 200 300);
  expectedTypes:`short$ 98 98;
  expectedFlags:00b;

  raze (
    .test.join.assertCapture["uj basic";.test.join.capture[`uj;joinFunc;argVals]];
    .test.join.assertResult["uj basic";`uj;joinFunc;argVals;expectedVal];
    .test.join.assertArgCount["uj basic";`uj;joinFunc;argVals;2];
    .test.join.assertArgTypes["uj basic";`uj;joinFunc;argVals;expectedTypes];
    .test.join.assertKeyedFlags["uj basic";`uj;joinFunc;argVals;expectedFlags]
  )
 };

/ --------------------------------------------------
/ as-of join case
/ --------------------------------------------------
.test.join.case.ajBasic:{[]
  tradeInput:([] sym:`a`a`b; time:09:30:01 09:30:03 09:30:02; qty:100 200 300);
  quoteInput:([] sym:`a`a`b; time:09:30:00 09:30:02 09:30:01; px:10 11 20);
  joinFunc:aj;
  argVals:(`sym`time;tradeInput;quoteInput);
  expectedVal:([] sym:`a`a`b; time:09:30:01 09:30:03 09:30:02; qty:100 200 300; px:10 11 20);
  expectedTypes:`short$ 11 98 98;
  expectedFlags:000b;

  raze (
    .test.join.assertCapture["aj basic";.test.join.capture[`aj;joinFunc;argVals]];
    .test.join.assertResult["aj basic";`aj;joinFunc;argVals;expectedVal];
    .test.join.assertArgCount["aj basic";`aj;joinFunc;argVals;3];
    .test.join.assertArgTypes["aj basic";`aj;joinFunc;argVals;expectedTypes];
    .test.join.assertKeyedFlags["aj basic";`aj;joinFunc;argVals;expectedFlags]
  )
 };

/ --------------------------------------------------
/ inner join case
/ --------------------------------------------------
.test.join.case.ijBasic:{[]
  leftInput:([] sym:`a`b`c; px:10 20 30);
  rightInput:([sym:`a`c] ceo:`Alice`Carol);
  joinFunc:ij;
  argVals:(leftInput;rightInput);
  / ij drops rows of the unkeyed table with no match in the keyed table --
  / unlike lj, which keeps them and null-fills. `b` has no match, so it's gone.
  expectedVal:([] sym:`a`c; px:10 30; ceo:`Alice`Carol);
  expectedTypes:`short$ 98 99;
  expectedFlags:01b;

  raze (
    .test.join.assertCapture["ij basic";.test.join.capture[`ij;joinFunc;argVals]];
    .test.join.assertResult["ij basic";`ij;joinFunc;argVals;expectedVal];
    .test.join.assertArgCount["ij basic";`ij;joinFunc;argVals;2];
    .test.join.assertArgTypes["ij basic";`ij;joinFunc;argVals;expectedTypes];
    .test.join.assertKeyedFlags["ij basic";`ij;joinFunc;argVals;expectedFlags]
  )
 };

/ --------------------------------------------------
/ equi join case
/ --------------------------------------------------
.test.join.case.ejBasic:{[]
  leftInput:([] sym:`a`a`b; qty:10 20 30);
  rightInput:([] sym:`a`b; price:100 200);
  joinFunc:ej;
  argVals:(`sym;leftInput;rightInput);
  / both a-rows in leftInput match the single a-row in rightInput; result
  / columns are the match column(s), then leftInput's other columns, then
  / rightInput's other columns.
  expectedVal:([] sym:`a`a`b; qty:10 20 30; price:100 100 200);
  expectedTypes:`short$ -11 98 98;
  expectedFlags:000b;

  raze (
    .test.join.assertCapture["ej basic";.test.join.capture[`ej;joinFunc;argVals]];
    .test.join.assertResult["ej basic";`ej;joinFunc;argVals;expectedVal];
    .test.join.assertArgCount["ej basic";`ej;joinFunc;argVals;3];
    .test.join.assertArgTypes["ej basic";`ej;joinFunc;argVals;expectedTypes];
    .test.join.assertKeyedFlags["ej basic";`ej;joinFunc;argVals;expectedFlags]
  )
 };

/ --------------------------------------------------
/ window join case
/ --------------------------------------------------
/ NOTE: worked through wj's interval (inclusive-both-ends) semantics by hand
/ here, since there's no local q interpreter to execute this against -- this
/ is the most intricate join in the suite, so double check expectedVal
/ against a real q session before relying on this case.
.test.join.case.wjBasic:{[]
  quoteInput:([] time:0 1 2 3 4 5; sym:`a`a`a`a`a`a; ask:10 11 12 13 14 15; bid:9 10 11 12 13 14);
  tradeInput:([] time:enlist 2; sym:enlist `a; price:enlist 100);
  windows:(enlist 1; enlist 3);   / single window: [1,3] inclusive
  joinFunc:wj;
  argVals:(windows;`sym`time;tradeInput;(quoteInput;(max;`ask);(min;`bid)));
  / quote rows with time in [1,3]: time=1 (ask=11,bid=10), time=2 (ask=12,bid=11),
  / time=3 (ask=13,bid=12) -> max ask=13, min bid=10
  expectedVal:([] time:enlist 2; sym:enlist `a; price:enlist 100; ask:enlist 13; bid:enlist 10);
  expectedTypes:`short$ 0 11 98 0;
  expectedFlags:0000b;

  raze (
    .test.join.assertCapture["wj basic";.test.join.capture[`wj;joinFunc;argVals]];
    .test.join.assertResult["wj basic";`wj;joinFunc;argVals;expectedVal];
    .test.join.assertArgCount["wj basic";`wj;joinFunc;argVals;4];
    .test.join.assertArgTypes["wj basic";`wj;joinFunc;argVals;expectedTypes];
    .test.join.assertKeyedFlags["wj basic";`wj;joinFunc;argVals;expectedFlags]
  )
 };