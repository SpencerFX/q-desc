/ ==================================================
/ iterator tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.iter.assertCapture:{[label;captureTbl]
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
/ assert iterator result matches expected value
/ --------------------------------------------------
.test.iter.assertResult:{[label;iteratorName;derivedFunc;argVals;expectedVal]
  captureTbl:.test.iter.capture[iteratorName;derivedFunc;argVals];
  row:first captureTbl;

  (
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.equal[label," - result matches expected";row`resultValue;expectedVal]
  )
 };

/ --------------------------------------------------
/ assert iterator argument count
/ --------------------------------------------------
.test.iter.assertArgCount:{[label;iteratorName;derivedFunc;argVals;expectedCount]
  captureTbl:.test.iter.capture[iteratorName;derivedFunc;argVals];
  row:first captureTbl;
  actualCount:`long$row`argCount;
  expectedCount:`long$expectedCount;

  enlist .test.assert.equal[label," - arg count";actualCount;expectedCount]
 };

/ --------------------------------------------------
/ assert iterator argument types
/ --------------------------------------------------
.test.iter.assertArgTypes:{[label;iteratorName;derivedFunc;argVals;expectedTypes]
  captureTbl:.test.iter.capture[iteratorName;derivedFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - arg types";row`argTypeCodes;expectedTypes]
 };

/ --------------------------------------------------
/ each iterator with addition
/ --------------------------------------------------
.test.iter.case.eachAdd:{[]
  derivedFunc:+';
  argVals:(1 2 3;10 20 30);
  expectedTypes:`short$ 7 7;

  raze (
    .test.iter.assertCapture["each add";.test.iter.capture[`each;derivedFunc;argVals]];
    .test.iter.assertResult["each add";`each;derivedFunc;argVals;11 22 33];
    .test.iter.assertArgCount["each add";`each;derivedFunc;argVals;2];
    .test.iter.assertArgTypes["each add";`each;derivedFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ over iterator with sum
/ --------------------------------------------------
.test.iter.case.overSum:{[]
  derivedFunc:+/;
  argVals:enlist 1 2 3 4;
  expectedTypes:`short$ enlist 7;

  raze (
    .test.iter.assertCapture["over sum";.test.iter.capture[`over;derivedFunc;argVals]];
    .test.iter.assertResult["over sum";`over;derivedFunc;argVals;10];
    .test.iter.assertArgCount["over sum";`over;derivedFunc;argVals;1];
    .test.iter.assertArgTypes["over sum";`over;derivedFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ over iterator with seed and list
/ --------------------------------------------------
.test.iter.case.overSeededSum:{[]
  derivedFunc:+/;
  argVals:(100;1 2 3 4);
  expectedTypes:`short$ -7 7;

  raze (
    .test.iter.assertCapture["seeded over sum";.test.iter.capture[`over;derivedFunc;argVals]];
    .test.iter.assertResult["seeded over sum";`over;derivedFunc;argVals;110];
    .test.iter.assertArgCount["seeded over sum";`over;derivedFunc;argVals;2];
    .test.iter.assertArgTypes["seeded over sum";`over;derivedFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ scan iterator with sum
/ --------------------------------------------------
.test.iter.case.scanSum:{[]
  derivedFunc:+\;
  argVals:enlist 1 2 3 4;
  expectedTypes:`short$ enlist 7;

  raze (
    .test.iter.assertCapture["scan sum";.test.iter.capture[`scan;derivedFunc;argVals]];
    .test.iter.assertResult["scan sum";`scan;derivedFunc;argVals;1 3 6 10];
    .test.iter.assertArgCount["scan sum";`scan;derivedFunc;argVals;1];
    .test.iter.assertArgTypes["scan sum";`scan;derivedFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ prior iterator with difference
/ --------------------------------------------------
.test.iter.case.priorDiff:{[]
  derivedFunc:{[x] 0N,1 _ deltas x};
  argVals:enlist 10 13 20 19;
  expectedTypes:`short$ enlist 7;

  raze (
    .test.iter.assertCapture["prior diff";.test.iter.capture[`prior;derivedFunc;argVals]];
    .test.iter.assertResult["prior diff";`prior;derivedFunc;argVals;0N 3 7 -1];
    .test.iter.assertArgCount["prior diff";`prior;derivedFunc;argVals;1];
    .test.iter.assertArgTypes["prior diff";`prior;derivedFunc;argVals;expectedTypes]
  )
 };