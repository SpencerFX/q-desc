/ ==================================================
/ simulator case builders
/ ==================================================

/ --------------------------------------------------
/ attach registry metadata to single arg cases
/ --------------------------------------------------
.sim.inject.cases.single:{[registryTbl]
  ([] name:registryTbl`name;
      category:registryTbl`category;
      subCategory:registryTbl`subCategory;
      typeName:registryTbl`typeName;
      argList:enlist each registryTbl`val)
 };