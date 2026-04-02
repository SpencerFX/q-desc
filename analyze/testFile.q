/ ==================================================
/ test user script
/ basic examples for iterators, joins and overloads
/ ==================================================

/ --------------------------------------------------
/ iterator examples
/ --------------------------------------------------
.user.iter.sumOver:{[x]
  +/ x
 };

.user.iter.sumScan:{[x]
  +\ x
 };

.user.iter.addEach:{[x;y]
  x +/' y
 };

.user.iter.diffPrior:{[x]
  0N,1 _ deltas x
 };

/ --------------------------------------------------
/ join examples
/ --------------------------------------------------
.user.join.leftJoinBasic:{[leftTbl;rightTbl]
  lj[leftTbl;rightTbl]
 };

.user.join.asOfJoinBasic:{[tradeTbl;quoteTbl]
  aj[`sym`time;tradeTbl;quoteTbl]
 };

.user.join.plusJoinBasic:{[leftTbl;rightTbl]
  pj[leftTbl;rightTbl]
 };

.user.join.unionJoinBasic:{[leftTbl;rightTbl]
  uj[leftTbl;rightTbl]
 };

/ --------------------------------------------------
/ overload examples
/ --------------------------------------------------
.user.over.findBasic:{[x;y]
  x ? y
 };

.user.over.rollBasic:{[x]
  5 ? x
 };

.user.over.permuteBasic:{[x]
  0N ? til x
 };

.user.over.vectorConditionalBasic:{[]
  ?[11001b;1 2 3 4 5;10 20 30 40 50]
 };

.user.over.indexAtBasic:{[d;i]
  d @/ i
 };

.user.over.trapAtBasic:{[]
  @[2+;"42";{`err}]
 };

.user.over.amendAtBasic:{[]
  @[(0 1 2;1 2 3 4;7 8 9);1 1;2*]
 };

.user.over.dotApplyBasic:{[]
  .[+;2 3]
 };

.user.over.dotTrapBasic:{[]
  .[+;("ab");{`ouch}]
 };