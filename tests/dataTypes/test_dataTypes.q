/ ==================================================
/ data type tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.dt.assertCapture:{[label;captureTbl]
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
/ assert datatype result matches expected value
/ --------------------------------------------------
.test.dt.assertResult:{[label;dtName;dtFunc;argVals;expectedVal]
  captureTbl:.test.dt.capture[dtName;dtFunc;argVals];
  row:first captureTbl;

  (
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.equal[label," - result matches expected";row`resultValue;expectedVal]
  )
 };

/ --------------------------------------------------
/ assert datatype argument count
/ --------------------------------------------------
.test.dt.assertArgCount:{[label;dtName;dtFunc;argVals;expectedCount]
  captureTbl:.test.dt.capture[dtName;dtFunc;argVals];
  row:first captureTbl;
  actualCount:`long$row`argCount;
  expectedCount:`long$expectedCount;

  enlist .test.assert.equal[label," - arg count";actualCount;expectedCount]
 };

/ --------------------------------------------------
/ assert datatype argument types
/ --------------------------------------------------
.test.dt.assertArgTypes:{[label;dtName;dtFunc;argVals;expectedTypes]
  captureTbl:.test.dt.capture[dtName;dtFunc;argVals];
  row:first captureTbl;
  actualTypes:`int$row`argTypeCodes;
  expectedTypes:`int$expectedTypes;

  enlist .test.assert.equal[label," - arg types";actualTypes;expectedTypes]
 };

/ --------------------------------------------------
/ assert result type
/ --------------------------------------------------
.test.dt.assertResultType:{[label;dtName;dtFunc;argVals;expectedType]
  captureTbl:.test.dt.capture[dtName;dtFunc;argVals];
  row:first captureTbl;
  actualType:`int$row`resultTypeCode;
  expectedType:`int$expectedType;

  enlist .test.assert.equal[label," - result type";actualType;expectedType]
 };

/ --------------------------------------------------
/ assert result is atom
/ --------------------------------------------------
.test.dt.assertResultIsAtom:{[label;dtName;dtFunc;argVals;expectedFlag]
  captureTbl:.test.dt.capture[dtName;dtFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - result is atom";row`resultIsAtom;expectedFlag]
 };

/ --------------------------------------------------
/ assert result is list
/ --------------------------------------------------
.test.dt.assertResultIsList:{[label;dtName;dtFunc;argVals;expectedFlag]
  captureTbl:.test.dt.capture[dtName;dtFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - result is list";row`resultIsList;expectedFlag]
 };

/ --------------------------------------------------
/ type case
/ --------------------------------------------------
.test.dt.case.typeBasic:{[]
  dtFunc:{[] type 42};
  argVals:();
  expectedVal:-7h;
  expectedTypes:`short$();

  raze (
    .test.dt.assertCapture["type basic";.test.dt.capture[`type;dtFunc;argVals]];
    .test.dt.assertResult["type basic";`type;dtFunc;argVals;expectedVal];
    .test.dt.assertArgCount["type basic";`type;dtFunc;argVals;0];
    .test.dt.assertArgTypes["type basic";`type;dtFunc;argVals;expectedTypes];
    .test.dt.assertResultType["type basic";`type;dtFunc;argVals;-5h];
    .test.dt.assertResultIsAtom["type basic";`type;dtFunc;argVals;1b];
    .test.dt.assertResultIsList["type basic";`type;dtFunc;argVals;0b]
  )
 };

/ --------------------------------------------------
/ string case
/ --------------------------------------------------
.test.dt.case.stringBasic:{[]
  dtFunc:{[] string 42};
  argVals:();
  expectedVal:"42";
  expectedTypes:`short$();

  raze (
    .test.dt.assertCapture["string basic";.test.dt.capture[`string;dtFunc;argVals]];
    .test.dt.assertResult["string basic";`string;dtFunc;argVals;expectedVal];
    .test.dt.assertArgCount["string basic";`string;dtFunc;argVals;0];
    .test.dt.assertArgTypes["string basic";`string;dtFunc;argVals;expectedTypes];
    .test.dt.assertResultType["string basic";`string;dtFunc;argVals;10h];
    .test.dt.assertResultIsAtom["string basic";`string;dtFunc;argVals;0b];
    .test.dt.assertResultIsList["string basic";`string;dtFunc;argVals;1b]
  )
 };

/ --------------------------------------------------
/ int cast case
/ --------------------------------------------------
.test.dt.case.intCastBasic:{[]
  dtFunc:{[] `int$42};
  argVals:();
  expectedVal:42i;
  expectedTypes:`short$();

  raze (
    .test.dt.assertCapture["int cast basic";.test.dt.capture[`intCast;dtFunc;argVals]];
    .test.dt.assertResult["int cast basic";`intCast;dtFunc;argVals;expectedVal];
    .test.dt.assertArgCount["int cast basic";`intCast;dtFunc;argVals;0];
    .test.dt.assertArgTypes["int cast basic";`intCast;dtFunc;argVals;expectedTypes];
    .test.dt.assertResultType["int cast basic";`intCast;dtFunc;argVals;-6h];
    .test.dt.assertResultIsAtom["int cast basic";`intCast;dtFunc;argVals;1b];
    .test.dt.assertResultIsList["int cast basic";`intCast;dtFunc;argVals;0b]
  )
 };

/ --------------------------------------------------
/ float cast case
/ --------------------------------------------------
.test.dt.case.floatCastBasic:{[]
  dtFunc:{[] `float$42};
  argVals:();
  expectedVal:42f;
  expectedTypes:`short$();

  raze (
    .test.dt.assertCapture["float cast basic";.test.dt.capture[`floatCast;dtFunc;argVals]];
    .test.dt.assertResult["float cast basic";`floatCast;dtFunc;argVals;expectedVal];
    .test.dt.assertArgCount["float cast basic";`floatCast;dtFunc;argVals;0];
    .test.dt.assertArgTypes["float cast basic";`floatCast;dtFunc;argVals;expectedTypes];
    .test.dt.assertResultType["float cast basic";`floatCast;dtFunc;argVals;-9h];
    .test.dt.assertResultIsAtom["float cast basic";`floatCast;dtFunc;argVals;1b];
    .test.dt.assertResultIsList["float cast basic";`floatCast;dtFunc;argVals;0b]
  )
 };

/ --------------------------------------------------
/ symbol cast case
/ --------------------------------------------------
/ --------------------------------------------------
/ symbol cast case
/ --------------------------------------------------
.test.dt.case.symbolCastBasic:{[]
  dtFunc:{[] `$"abc"};
  argVals:();
  expectedVal:`abc;
  expectedTypes:`short$();

  raze (
    .test.dt.assertCapture["symbol cast basic";.test.dt.capture[`symbolCast;dtFunc;argVals]];
    .test.dt.assertResult["symbol cast basic";`symbolCast;dtFunc;argVals;expectedVal];
    .test.dt.assertArgCount["symbol cast basic";`symbolCast;dtFunc;argVals;0];
    .test.dt.assertArgTypes["symbol cast basic";`symbolCast;dtFunc;argVals;expectedTypes];
    .test.dt.assertResultType["symbol cast basic";`symbolCast;dtFunc;argVals;-11h];
    .test.dt.assertResultIsAtom["symbol cast basic";`symbolCast;dtFunc;argVals;1b];
    .test.dt.assertResultIsList["symbol cast basic";`symbolCast;dtFunc;argVals;0b]
  )
 };

/ --------------------------------------------------
/ atom check case
/ --------------------------------------------------
.test.dt.case.atomBasic:{[]
  dtFunc:{[] 0>type 42};
  argVals:();
  expectedVal:1b;
  expectedTypes:`short$();

  raze (
    .test.dt.assertCapture["atom basic";.test.dt.capture[`atomCheck;dtFunc;argVals]];
    .test.dt.assertResult["atom basic";`atomCheck;dtFunc;argVals;expectedVal];
    .test.dt.assertArgCount["atom basic";`atomCheck;dtFunc;argVals;0];
    .test.dt.assertArgTypes["atom basic";`atomCheck;dtFunc;argVals;expectedTypes];
    .test.dt.assertResultType["atom basic";`atomCheck;dtFunc;argVals;-1h];
    .test.dt.assertResultIsAtom["atom basic";`atomCheck;dtFunc;argVals;1b];
    .test.dt.assertResultIsList["atom basic";`atomCheck;dtFunc;argVals;0b]
  )
 };

/ --------------------------------------------------
/ list check case
/ --------------------------------------------------
.test.dt.case.listBasic:{[]
  dtFunc:{[] 0<=type 1 2 3};
  argVals:();
  expectedVal:1b;
  expectedTypes:`short$();

  raze (
    .test.dt.assertCapture["list basic";.test.dt.capture[`listCheck;dtFunc;argVals]];
    .test.dt.assertResult["list basic";`listCheck;dtFunc;argVals;expectedVal];
    .test.dt.assertArgCount["list basic";`listCheck;dtFunc;argVals;0];
    .test.dt.assertArgTypes["list basic";`listCheck;dtFunc;argVals;expectedTypes];
    .test.dt.assertResultType["list basic";`listCheck;dtFunc;argVals;-1h];
    .test.dt.assertResultIsAtom["list basic";`listCheck;dtFunc;argVals;1b];
    .test.dt.assertResultIsList["list basic";`listCheck;dtFunc;argVals;0b]
  )
 };