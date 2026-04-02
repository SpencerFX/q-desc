/ ==================================================
/ assertions
/ ==================================================

/ --------------------------------------------------
/ test equality
/ --------------------------------------------------
.test.assert.equal:{[label;actualVal;expectedVal]
  pass:actualVal~expectedVal;
  detail:$[pass;"ok";"actual=", .Q.s1 actualVal, " expected=", .Q.s1 expectedVal];
  `label`pass`detail!(label;pass;detail)
 };

/ --------------------------------------------------
/ test boolean true
/ --------------------------------------------------
.test.assert.true:{[label;flag]
  pass:1b~flag;
  detail:$[pass;"ok";"expected true"];
  `label`pass`detail!(label;pass;detail)
 };

/ --------------------------------------------------
/ test non-empty object
/ --------------------------------------------------
.test.assert.nonEmpty:{[label;objVal]
  pass:0<count objVal;
  detail:$[pass;"ok";"expected non-empty"];
  `label`pass`detail!(label;pass;detail)
 };