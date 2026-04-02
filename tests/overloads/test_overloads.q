/ ==================================================
/ overload tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.over.assertCapture:{[label;captureTbl]
  row:first captureTbl;
  argCount:`long$row`argCount;
  resultPreview:row`resultPreview;

  (
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.true[label," - arg count recorded";argCount>=0];
    .test.assert.nonEmpty[label," - result preview recorded";enlist resultPreview]
  )
 };

/ --------------------------------------------------
/ assert overload result matches expected value
/ --------------------------------------------------
.test.over.assertResult:{[label;overloadName;overloadFunc;argVals;expectedVal]
  captureTbl:.test.over.capture[overloadName;overloadFunc;argVals];
  row:first captureTbl;

  (
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.equal[label," - result matches expected";row`resultValue;expectedVal]
  )
 };

/ --------------------------------------------------
/ assert overload argument count
/ --------------------------------------------------
.test.over.assertArgCount:{[label;overloadName;overloadFunc;argVals;expectedCount]
  captureTbl:.test.over.capture[overloadName;overloadFunc;argVals];
  row:first captureTbl;
  actualCount:`long$row`argCount;
  expectedCount:`long$expectedCount;

  enlist .test.assert.equal[label," - arg count";actualCount;expectedCount]
 };

/ --------------------------------------------------
/ assert overload argument types
/ --------------------------------------------------
.test.over.assertArgTypes:{[label;overloadName;overloadFunc;argVals;expectedTypes]
  captureTbl:.test.over.capture[overloadName;overloadFunc;argVals];
  row:first captureTbl;
  actualTypes:`int$row`argTypeCodes;
  expectedTypes:`int$expectedTypes;

  enlist .test.assert.equal[label," - arg types";actualTypes;expectedTypes]
 };

/ --------------------------------------------------
/ ? find case
/ --------------------------------------------------
.test.over.case.findBasic:{[]
  overloadFunc:{[x;y] x?y};
  argVals:(10 -8 3 5 -2 3;-8);
  expectedVal:1;
  expectedTypes:`short$ 7 -7;

  raze (
    .test.over.assertCapture["find basic";.test.over.capture[`find;overloadFunc;argVals]];
    .test.over.assertResult["find basic";`find;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["find basic";`find;overloadFunc;argVals;2];
    .test.over.assertArgTypes["find basic";`find;overloadFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ ? roll case
/ --------------------------------------------------
.test.over.case.rollBasic:{[]
  overloadFunc:{[x] count 5?x};
  argVals:10;
  expectedVal:5;
  expectedTypes:`short$ enlist -7;

  raze (
    .test.over.assertCapture["roll basic";.test.over.capture[`roll;overloadFunc;argVals]];
    .test.over.assertResult["roll basic";`roll;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["roll basic";`roll;overloadFunc;argVals;1];
    .test.over.assertArgTypes["roll basic";`roll;overloadFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ ? permute case
/ --------------------------------------------------
.test.over.case.permuteBasic:{[]
  overloadFunc:{[x] asc 0N?til x};
  argVals:10;
  expectedVal:til 10;
  expectedTypes:`short$ enlist -7;

  raze (
    .test.over.assertCapture["permute basic";.test.over.capture[`permute;overloadFunc;argVals]];
    .test.over.assertResult["permute basic";`permute;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["permute basic";`permute;overloadFunc;argVals;1];
    .test.over.assertArgTypes["permute basic";`permute;overloadFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ ? vector conditional case
/ --------------------------------------------------
.test.over.case.vectorConditionalBasic:{[]
  overloadFunc:{[] ?[11001b;1 2 3 4 5;10 20 30 40 50]};
  argVals:();
  expectedVal:1 2 30 40 5;
  expectedTypes:`short$();

  raze (
    .test.over.assertCapture["vector conditional basic";.test.over.capture[`vectorConditional;overloadFunc;argVals]];
    .test.over.assertResult["vector conditional basic";`vectorConditional;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["vector conditional basic";`vectorConditional;overloadFunc;argVals;0];
    .test.over.assertArgTypes["vector conditional basic";`vectorConditional;overloadFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ @ index at case
/ --------------------------------------------------
.test.over.case.indexAtBasic:{[]
  overloadFunc:{[d;i] d @/ i};
  d:((1 2 3;4 5 6 7);(8 9;10;11 12);(13 14;15 16 17 18;19 20));
  argVals:(d;1 2 0);
  expectedVal:11;
  expectedTypes:`short$ 0 7;

  raze (
    .test.over.assertCapture["index at basic";.test.over.capture[`indexAt;overloadFunc;argVals]];
    .test.over.assertResult["index at basic";`indexAt;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["index at basic";`indexAt;overloadFunc;argVals;2];
    .test.over.assertArgTypes["index at basic";`indexAt;overloadFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ @ trap case
/ --------------------------------------------------
.test.over.case.trapAtBasic:{[]
  overloadFunc:{[] @[2+;"42";{`err}]};
  argVals:();
  expectedVal:`err;
  expectedTypes:`short$();

  raze (
    .test.over.assertCapture["trap at basic";.test.over.capture[`trapAt;overloadFunc;argVals]];
    .test.over.assertResult["trap at basic";`trapAt;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["trap at basic";`trapAt;overloadFunc;argVals;0];
    .test.over.assertArgTypes["trap at basic";`trapAt;overloadFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ @ amend case
/ --------------------------------------------------
.test.over.case.amendAtBasic:{[]
  overloadFunc:{[] @[(0 1 2;1 2 3 4;7 8 9);1 1;2*]};
  argVals:();
  expectedVal:(0 1 2;4 8 12 16;7 8 9);
  expectedTypes:`short$();

  raze (
    .test.over.assertCapture["amend at basic";.test.over.capture[`amendAt;overloadFunc;argVals]];
    .test.over.assertResult["amend at basic";`amendAt;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["amend at basic";`amendAt;overloadFunc;argVals;0];
    .test.over.assertArgTypes["amend at basic";`amendAt;overloadFunc;argVals;expectedTypes]
  )
 };
/ --------------------------------------------------
/ @ replace case
/ --------------------------------------------------
.test.over.case.replaceAtBasic:{[]
  overloadFunc:{[]
    d:((1 2 3;4 5 6 7);(8 9;10;11 12);(13 14;15 16 17 18;19 20));
    .[d;2 0;:;400 500 600]
  };
  argVals:();
  expectedVal:((1 2 3;4 5 6 7);(8 9;10;11 12);(400 500 600;15 16 17 18;19 20));
  expectedTypes:`short$();

  raze (
    .test.over.assertCapture["replace at basic";.test.over.capture[`replaceAt;overloadFunc;argVals]];
    .test.over.assertResult["replace at basic";`replaceAt;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["replace at basic";`replaceAt;overloadFunc;argVals;0];
    .test.over.assertArgTypes["replace at basic";`replaceAt;overloadFunc;argVals;expectedTypes]
  )
 };
/ --------------------------------------------------
/ . apply case
/ --------------------------------------------------
.test.over.case.dotApplyBasic:{[]
  overloadFunc:{[] .[+;2 3]};
  argVals:();
  expectedVal:5;
  expectedTypes:`short$();

  raze (
    .test.over.assertCapture["dot apply basic";.test.over.capture[`dotApply;overloadFunc;argVals]];
    .test.over.assertResult["dot apply basic";`dotApply;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["dot apply basic";`dotApply;overloadFunc;argVals;0];
    .test.over.assertArgTypes["dot apply basic";`dotApply;overloadFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ . trap case
/ --------------------------------------------------
.test.over.case.dotTrapBasic:{[]
  overloadFunc:{[] .[+;("ab");{`ouch}]};
  argVals:();
  expectedVal:`ouch;
  expectedTypes:`short$();

  raze (
    .test.over.assertCapture["dot trap basic";.test.over.capture[`dotTrap;overloadFunc;argVals]];
    .test.over.assertResult["dot trap basic";`dotTrap;overloadFunc;argVals;expectedVal];
    .test.over.assertArgCount["dot trap basic";`dotTrap;overloadFunc;argVals;0];
    .test.over.assertArgTypes["dot trap basic";`dotTrap;overloadFunc;argVals;expectedTypes]
  )
 };