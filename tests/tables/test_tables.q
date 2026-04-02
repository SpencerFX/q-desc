/ ==================================================
/ table tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.tbl.assertCapture:{[label;captureTbl]
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
/ assert table result matches expected value
/ --------------------------------------------------
.test.tbl.assertResult:{[label;tableName;tableFunc;argVals;expectedVal]
  captureTbl:.test.tbl.capture[tableName;tableFunc;argVals];
  row:first captureTbl;

  (
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.equal[label," - result matches expected";row`resultValue;expectedVal]
  )
 };

/ --------------------------------------------------
/ assert table argument count
/ --------------------------------------------------
.test.tbl.assertArgCount:{[label;tableName;tableFunc;argVals;expectedCount]
  captureTbl:.test.tbl.capture[tableName;tableFunc;argVals];
  row:first captureTbl;
  actualCount:`long$row`argCount;
  expectedCount:`long$expectedCount;

  enlist .test.assert.equal[label," - arg count";actualCount;expectedCount]
 };

/ --------------------------------------------------
/ assert table argument types
/ --------------------------------------------------
.test.tbl.assertArgTypes:{[label;tableName;tableFunc;argVals;expectedTypes]
  captureTbl:.test.tbl.capture[tableName;tableFunc;argVals];
  row:first captureTbl;
  actualTypes:`int$row`argTypeCodes;
  expectedTypes:`int$expectedTypes;

  enlist .test.assert.equal[label," - arg types";actualTypes;expectedTypes]
 };

/ --------------------------------------------------
/ assert result is table
/ --------------------------------------------------
.test.tbl.assertResultIsTable:{[label;tableName;tableFunc;argVals;expectedFlag]
  captureTbl:.test.tbl.capture[tableName;tableFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - result is table";row`resultIsTable;expectedFlag]
 };

/ --------------------------------------------------
/ assert result is keyed table
/ --------------------------------------------------
.test.tbl.assertResultIsKeyedTable:{[label;tableName;tableFunc;argVals;expectedFlag]
  captureTbl:.test.tbl.capture[tableName;tableFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - result is keyed table";row`resultIsKeyedTable;expectedFlag]
 };

/ --------------------------------------------------
/ assert result row count
/ --------------------------------------------------
.test.tbl.assertRowCount:{[label;tableName;tableFunc;argVals;expectedCount]
  captureTbl:.test.tbl.capture[tableName;tableFunc;argVals];
  row:first captureTbl;
  actualCount:`long$row`resultRowCount;
  expectedCount:`long$expectedCount;

  enlist .test.assert.equal[label," - row count";actualCount;expectedCount]
 };

/ --------------------------------------------------
/ assert result columns
/ --------------------------------------------------
.test.tbl.assertColumns:{[label;tableName;tableFunc;argVals;expectedCols]
  captureTbl:.test.tbl.capture[tableName;tableFunc;argVals];
  row:first captureTbl;

  enlist .test.assert.equal[label," - columns";row`resultCols;expectedCols]
 };

/ --------------------------------------------------
/ flip case
/ --------------------------------------------------
.test.tbl.case.flipBasic:{[]
  tableFunc:{[] flip `sym`px!(`a`b`c;10 20 30)};
  argVals:();
  expectedVal:([] sym:`a`b`c; px:10 20 30);
  expectedTypes:`short$();

  raze (
    .test.tbl.assertCapture["flip basic";.test.tbl.capture[`flip;tableFunc;argVals]];
    .test.tbl.assertResult["flip basic";`flip;tableFunc;argVals;expectedVal];
    .test.tbl.assertArgCount["flip basic";`flip;tableFunc;argVals;0];
    .test.tbl.assertArgTypes["flip basic";`flip;tableFunc;argVals;expectedTypes];
    .test.tbl.assertResultIsTable["flip basic";`flip;tableFunc;argVals;1b];
    .test.tbl.assertResultIsKeyedTable["flip basic";`flip;tableFunc;argVals;0b];
    .test.tbl.assertRowCount["flip basic";`flip;tableFunc;argVals;3];
    .test.tbl.assertColumns["flip basic";`flip;tableFunc;argVals;`sym`px]
  )
 };

/ --------------------------------------------------
/ cols case
/ --------------------------------------------------
.test.tbl.case.colsBasic:{[]
  tableFunc:{[] cols ([] sym:`a`b`c; px:10 20 30)};
  argVals:();
  expectedVal:`sym`px;
  expectedTypes:`short$();

  raze (
    .test.tbl.assertCapture["cols basic";.test.tbl.capture[`cols;tableFunc;argVals]];
    .test.tbl.assertResult["cols basic";`cols;tableFunc;argVals;expectedVal];
    .test.tbl.assertArgCount["cols basic";`cols;tableFunc;argVals;0];
    .test.tbl.assertArgTypes["cols basic";`cols;tableFunc;argVals;expectedTypes]
  )
 };

/ --------------------------------------------------
/ xcols case
/ --------------------------------------------------
.test.tbl.case.xcolsBasic:{[]
  tableFunc:{[] `px`sym xcols ([] sym:`a`b`c; px:10 20 30)};
  argVals:();
  expectedVal:([] px:10 20 30; sym:`a`b`c);
  expectedTypes:`short$();

  raze (
    .test.tbl.assertCapture["xcols basic";.test.tbl.capture[`xcols;tableFunc;argVals]];
    .test.tbl.assertResult["xcols basic";`xcols;tableFunc;argVals;expectedVal];
    .test.tbl.assertArgCount["xcols basic";`xcols;tableFunc;argVals;0];
    .test.tbl.assertArgTypes["xcols basic";`xcols;tableFunc;argVals;expectedTypes];
    .test.tbl.assertResultIsTable["xcols basic";`xcols;tableFunc;argVals;1b];
    .test.tbl.assertResultIsKeyedTable["xcols basic";`xcols;tableFunc;argVals;0b];
    .test.tbl.assertRowCount["xcols basic";`xcols;tableFunc;argVals;3];
    .test.tbl.assertColumns["xcols basic";`xcols;tableFunc;argVals;`px`sym]
  )
 };

/ --------------------------------------------------
/ key case
/ --------------------------------------------------
.test.tbl.case.keyBasic:{[]
  tableFunc:{[] key ([sym:`a`b`c] px:10 20 30)};
  argVals:();
  expectedVal:([] sym:`a`b`c);
  expectedTypes:`short$();

  raze (
    .test.tbl.assertCapture["key basic";.test.tbl.capture[`key;tableFunc;argVals]];
    .test.tbl.assertResult["key basic";`key;tableFunc;argVals;expectedVal];
    .test.tbl.assertArgCount["key basic";`key;tableFunc;argVals;0];
    .test.tbl.assertArgTypes["key basic";`key;tableFunc;argVals;expectedTypes];
    .test.tbl.assertResultIsTable["key basic";`key;tableFunc;argVals;1b];
    .test.tbl.assertResultIsKeyedTable["key basic";`key;tableFunc;argVals;0b];
    .test.tbl.assertRowCount["key basic";`key;tableFunc;argVals;3];
    .test.tbl.assertColumns["key basic";`key;tableFunc;argVals;enlist `sym]
  )
 };

/ --------------------------------------------------
/ value case
/ --------------------------------------------------
.test.tbl.case.valueBasic:{[]
  tableFunc:{[] value ([sym:`a`b`c] px:10 20 30)};
  argVals:();
  expectedVal:([] px:10 20 30);
  expectedTypes:`short$();

  raze (
    .test.tbl.assertCapture["value basic";.test.tbl.capture[`value;tableFunc;argVals]];
    .test.tbl.assertResult["value basic";`value;tableFunc;argVals;expectedVal];
    .test.tbl.assertArgCount["value basic";`value;tableFunc;argVals;0];
    .test.tbl.assertArgTypes["value basic";`value;tableFunc;argVals;expectedTypes];
    .test.tbl.assertResultIsTable["value basic";`value;tableFunc;argVals;1b];
    .test.tbl.assertResultIsKeyedTable["value basic";`value;tableFunc;argVals;0b];
    .test.tbl.assertRowCount["value basic";`value;tableFunc;argVals;3];
    .test.tbl.assertColumns["value basic";`value;tableFunc;argVals;enlist `px]
  )
 };