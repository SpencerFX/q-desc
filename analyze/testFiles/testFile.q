/ ==================================================
/ test user script
/ basic examples for iterators, joins and overloads
/ ==================================================

/ --------------------------------------------------
/ iterator examples
/ --------------------------------------------------
//@func  | .user.iter.sumOver 
//@param | x | 6 | int list
.user.iter.sumOver:{[x]
  +/ x
 };

//@func  | .user.iter.sumScan 
//@param | x | 6 | int list
.user.iter.sumScan:{[x]
  +\ x
 };

//@func  | .user.iter.addEach
//@param | x | 6 | int list
//@param | y | 6 | int list
.user.iter.addEach:{[x;y]
  x +/' y
 };

//@func  | .user.iter.diffPrior
//@param | x | 6 | int list
.user.iter.diffPrior:{[x]
  0N,1 _ deltas x
 };

/ --------------------------------------------------
/ join examples
/ --------------------------------------------------
//@func  | .user.join.leftJoinBasic
//@param | leftTbl | 98 | keyedTable
//@param | rightTbl | 99 | table
.user.join.leftJoinBasic:{[leftTbl;rightTbl]
  lj[leftTbl;rightTbl]
 };

//@func  | .user.join.asOfJoinBasic
//@param | leftTbl | 98 | table
//@param | rightTbl | 99 | table
.user.join.asOfJoinBasic:{[tradeTbl;quoteTbl]
  aj[`sym`time;tradeTbl;quoteTbl]
 };

//@func  | .user.join.plusJoinBasic
//@param | leftTbl | 98 | keyedTable
//@param | rightTbl | 99 | table
.user.join.plusJoinBasic:{[leftTbl;rightTbl]
  pj[leftTbl;rightTbl]
 };

//@func  | .user.join.unionJoinBasic
//@param | leftTbl | 98 | keyedTable
//@param | rightTbl | 99 | table
.user.join.unionJoinBasic:{[leftTbl;rightTbl]
  uj[leftTbl;rightTbl]
 };
/ --------------------------------------------------
/ overload examples
/ --------------------------------------------------
//@func  | .user.over.findBasic
//@param | x | 6 | int list
//@param | y | 6 | int list
.user.over.findBasic:{[x;y]
  x ? y
 };

//@func  | .user.over.rollBasic
//@param | x | -6 | an atom int
.user.over.rollBasic:{[x]
  5 ? x
 };

//@func  | .user.over.permuteBasic
//@param | x | 6 | int list
.user.over.permuteBasic:{[x]
  0N ? til x
 };

//@func  | .user.iter.diffPrior
//@param | [] | 0 | none
.user.over.vectorConditionalBasic:{[]
  ?[11001b;1 2 3 4 5;10 20 30 40 50]
 };

//@func  | .user.iter.diffPrior
//@param | d | 99 | data
//@param | i | -6 | index
.user.over.indexAtBasic:{[d;i]
  d @/ i
 };

//@func  | .user.over.trapAtBasic
//@param | [] | 0 | none
.user.over.trapAtBasic:{[]
  @[2+;"42";{`err}]
 };

//@func  | .user.over.amendAtBasic
//@param | [] | 0 | 
.user.over.amendAtBasic:{[]
  @[(0 1 2;1 2 3 4;7 8 9);1 1;2*]
 };

//@func  | .user.over.dotApplyBasic
//@param | [] | 0 | none
.user.over.dotApplyBasic:{[]
  .[+;2 3]
 };

//@func  | .user.over.dotTrapBasic
//@param | [] | 0 | none
.user.over.dotTrapBasic:{[]
  .[+;("ab");{`ouch}]
 };