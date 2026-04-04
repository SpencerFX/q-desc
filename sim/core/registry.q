/ ==================================================
/ simulator registry helpers
/ ==================================================

/ --------------------------------------------------
/ empty registry
/ --------------------------------------------------
.sim.registry.empty:{[]
  ([] name:`symbol$();
      category:`symbol$();
      subCategory:`symbol$();
      typeCode:`int$();
      typeName:();
      val:())
 };

/ --------------------------------------------------
/ append rows
/ --------------------------------------------------
.sim.registry.append:{[leftTbl;rightTbl]
  raze (leftTbl;rightTbl)
 };