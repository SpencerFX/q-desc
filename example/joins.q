// INFO ====================================================
// Purpose: Show examples for different joins
//==========================================================
/ Examples of different joins

// Author: Spencer
//==========================================================
// .kdb.exp.joins.pj[]
.kdb.exp.joins.pj:{
 show "Example: plus join";
 show .kdb.desc.joins.pj;
 };

// .kdb.exp.joins.aj[]
.kdb.exp.joins.aj:{
 show "Example: asof join";
 show .kdb.desc.joins.aj;
 };

// .kdb.exp.joins.uj[]
.kdb.exp.joins.uj:{
 show "Example: union join";
 show .kdb.desc.joins.pj;
 };

// .kdb.exp.joins.lj[]
.kdb.exp.joins.lj:{
 show "Example: left join";
 show .kdb.desc.joins.lj;
 };

// .kdb.exp.joins.ij[]
.kdb.exp.joins.ij:{
 show "Example: inner join";
 show .kdb.desc.joins.ij;
 };

// .kdb.exp.joins.comma[]
.kdb.exp.joins.comma:{
 show "Example: comma join";
 show .kdb.desc.joins.comma;
 };

// .kdb.exp.joins.wj[]
.kdb.exp.joins.wj:{
 show "Example: window join";
 show .kdb.desc.joins.wj;
 };