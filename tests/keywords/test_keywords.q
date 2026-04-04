/ ==================================================
/ keyword tests
/ ==================================================

/ --------------------------------------------------
/ assert capture metadata exists
/ --------------------------------------------------
.test.kw.assertCapture:{[label;captureTbl]
  row:first captureTbl;

  (
    .test.assert.true[label," - function exists";row`functionExists];
    .test.assert.true[label," - execution ok";row`ok];
    .test.assert.nonEmpty[label," - result preview recorded";enlist row`resultPreview]
  )
 };

/ --------------------------------------------------
/ assert keyword function exists
/ --------------------------------------------------
.test.kw.assertExists:{[label;fnSym]
  captureTbl:.test.kw.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - function exists";row`functionExists]
 };

/ --------------------------------------------------
/ assert keyword example runs successfully
/ --------------------------------------------------
.test.kw.assertRuns:{[label;fnSym]
  captureTbl:.test.kw.capture[label;fnSym];
  row:first captureTbl;
  enlist .test.assert.true[label," - execution ok";row`ok]
 };

/ --------------------------------------------------
/ run one keyword case
/ --------------------------------------------------
.test.kw.case.run:{[label;fnSym]
  raze (
    .test.kw.assertCapture[string label;.test.kw.capture[label;fnSym]];
    .test.kw.assertExists[string label;fnSym];
    .test.kw.assertRuns[string label;fnSym]
  )
 };

/ --------------------------------------------------
/ core keyword examples
/ --------------------------------------------------
.test.kw.coreList:{[]
  ([] label:`abs`acos`all`any`asc`asin`atan`attr`avg`avgs`ceiling`count`cross`cut`deltas`desc`dev`differ`distinct`div`each`enlist`eval`except`exp`fill`fills`first`flip`group`in`inter`inv`key`like`log`lower`max`maxs`mmax`med`min`mins`mmin`mmu`mod`neg`next`prev`xprev`not`null`or`over`scan`parse`prd`prds`prior`rand`rank`raze`reciprocal`reverse`rotate`signum`sin`sqrt`string`sum`sums`sv`vs`tan`til`trim`ltrim`rtrim`type`union`value`var`svar`where`within`xbar`xgroup`xrank;
      fnSym:`.kdb.exp.keywords.abs`.kdb.exp.keywords.acos`.kdb.exp.keywords.all`.kdb.exp.keywords.any`.kdb.exp.keywords.asc`.kdb.exp.keywords.asin`.kdb.exp.keywords.atan`.kdb.exp.keywords.attr`.kdb.exp.keywords.avg`.kdb.exp.keywords.avgs`.kdb.exp.keywords.ceiling`.kdb.exp.keywords.count`.kdb.exp.keywords.cross`.kdb.exp.keywords.cut`.kdb.exp.keywords.deltas`.kdb.exp.keywords.desc`.kdb.exp.keywords.dev`.kdb.exp.keywords.differ`.kdb.exp.keywords.distinct`.kdb.exp.keywords.div`.kdb.exp.keywords.each`.kdb.exp.keywords.enlist`.kdb.exp.keywords.eval`.kdb.exp.keywords.except`.kdb.exp.keywords.exp`.kdb.exp.keywords.fill`.kdb.exp.keywords.fills`.kdb.exp.keywords.first`.kdb.exp.keywords.flip`.kdb.exp.keywords.group`.kdb.exp.keywords.in`.kdb.exp.keywords.inter`.kdb.exp.keywords.inv`.kdb.exp.keywords.key`.kdb.exp.keywords.like`.kdb.exp.keywords.log`.kdb.exp.keywords.lower`.kdb.exp.keywords.max`.kdb.exp.keywords.maxs`.kdb.exp.keywords.mmax`.kdb.exp.keywords.med`.kdb.exp.keywords.min`.kdb.exp.keywords.mins`.kdb.exp.keywords.mmin`.kdb.exp.keywords.mmu`.kdb.exp.keywords.mod`.kdb.exp.keywords.neg`.kdb.exp.keywords.next`.kdb.exp.keywords.prev`.kdb.exp.keywords.xprev`.kdb.exp.keywords.not`.kdb.exp.keywords.null`.kdb.exp.keywords.or`.kdb.exp.keywords.over`.kdb.exp.keywords.scan`.kdb.exp.keywords.parse`.kdb.exp.keywords.prd`.kdb.exp.keywords.prds`.kdb.exp.keywords.prior`.kdb.exp.keywords.rand`.kdb.exp.keywords.rank`.kdb.exp.keywords.raze`.kdb.exp.keywords.reciprocal`.kdb.exp.keywords.reverse`.kdb.exp.keywords.rotate`.kdb.exp.keywords.signum`.kdb.exp.keywords.sin`.kdb.exp.keywords.sqrt`.kdb.exp.keywords.string`.kdb.exp.keywords.sum`.kdb.exp.keywords.sums`.kdb.exp.keywords.sv`.kdb.exp.keywords.vs`.kdb.exp.keywords.tan`.kdb.exp.keywords.til`.kdb.exp.keywords.trim`.kdb.exp.keywords.ltrim`.kdb.exp.keywords.rtrim`.kdb.exp.keywords.type`.kdb.exp.keywords.union`.kdb.exp.keywords.value`.kdb.exp.keywords.var`.kdb.exp.keywords.svar`.kdb.exp.keywords.where`.kdb.exp.keywords.within`.kdb.exp.keywords.xbar`.kdb.exp.keywords.xgroup`.kdb.exp.keywords.xrank)
 };

/ --------------------------------------------------
/ data-backed keyword examples
/ --------------------------------------------------
.test.kw.dataList:{[]
  ([] label:`aj`aj0`cols`cor`cov`exec`fby`fkeys`ij`ijf`insert`keys`xkey`lj`ljf`meta`pj`ratios`select`tables`uj`update`upsert;
      fnSym:`.kdb.exp.keywords.aj`.kdb.exp.keywords.aj0`.kdb.exp.keywords.cols`.kdb.exp.keywords.cor`.kdb.exp.keywords.cov`.kdb.exp.keywords.exec`.kdb.exp.keywords.fby`.kdb.exp.keywords.fkeys`.kdb.exp.keywords.ij`.kdb.exp.keywords.ijf`.kdb.exp.keywords.insert`.kdb.exp.keywords.keys`.kdb.exp.keywords.xkey`.kdb.exp.keywords.lj`.kdb.exp.keywords.ljf`.kdb.exp.keywords.meta`.kdb.exp.keywords.pj`.kdb.exp.keywords.ratios`.kdb.exp.keywords.select`.kdb.exp.keywords.tables`.kdb.exp.keywords.uj`.kdb.exp.keywords.update`.kdb.exp.keywords.upsert)
 };

/ --------------------------------------------------
/ run a list of keyword specs
/ --------------------------------------------------
.test.kw.case.runList:{[specTbl]
  i:0;
  n:count specTbl;
  results:([] label:();pass:();detail:());

  while[i<n;
    results,: .test.kw.case.run[specTbl[`label] i;specTbl[`fnSym] i];
    i+:1
  ];

  results
 };