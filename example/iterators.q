// INFO ====================================================
// Purpose: Show examples for iterators
//==========================================================
/ Examples of iterators

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.iterators.each[]
.kdb.exp.iterators.each:{
 show "Example: plus join";
 show .kdb.desc.joins.pj;
 show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show stocks:([]sym:`IBM`AAPL`GOOG;amount:400 700 1200);
 show newpurchases:([sym:`IBM`GOOG]amount:60 30);
 show "pj[stocks;newpurchases]";
 show pj[stocks;newpurchases]
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };

.kdb.exp.iterators.{
 show "Example: ";
 show .kdb.desc.iterators.;
 show "syntax is: ";
 show 
 };