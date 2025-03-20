// INFO ====================================================
// Purpose: Show examples for different joins
//==========================================================
/ Examples of different joins

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.joins.minus4Bang[]
.kdb.exp.joins.minus4Bang:{
 show "Example: -4!x";
 show .kdb.desc.func.minus4Bang;
 show "-4!\"select this from that\"";
 show -4!"select this from that";
 };

// .kdb.exp.joins.minus8Bang[]
.kdb.exp.joins.minus8Bang:{
 show "Example: -8!x";
 show .kdb.desc.func.minus8Bang;
 show "-8!1 2 3";
 show -8!1 2 3;
 };

// .kdb.exp.joins.minus9Bang[]
.kdb.exp.joins.minus9Bang:{
 show "Example: -9!x";
 show .kdb.desc.func.minus9Bang;
 show "-9!0x0100000026000000070003000000010000000000000002000000000000000300000000000000";
 show -9!0x0100000026000000070003000000010000000000000002000000000000000300000000000000;
 };

// .kdb.exp.joins.minus10Bang[]
.kdb.exp.joins.minus10Bang:{
 show "Example: -10!x";
 show .kdb.desc.func.minus10Bang;
 show "-10!20h";
 show -10!20h;
 show "ee:`a`b`c";
 show ee:`a`b`c;
 show "vv:`ee$`a`a`b";
 show vv:`ee$`a`a`b;
 show type vv;
 show "-10!20h";
 show -10!20h;
 };

// .kdb.exp.joins.minus11Bang[]
.kdb.exp.joins.minus11Bang:{
 show "Example: -11!x";
 show "Example: -11!(-1;x)";
 show "-11!(-2;x)";
 show "-11!(n;x)";
 show .kdb.desc.func.minus11Bang;
 };

// .kdb.exp.joins.minus16Bang[]
.kdb.exp.joins.minus16Bang:{
 show "Example: -16!x";
 show .kdb.desc.func.minus16Bang;
 a:5;
 show "-16!a";
 show -16!a;
 show "a:b:c:d:e:1 2 3";
 show a:b:c:d:e:1 2 3;
 show "-16!a";
 show -16!a;
 };

// .kdb.exp.joins.minus18Bang[]
.kdb.exp.joins.minus18Bang:{
 show "Example: -18!x";
 show .kdb.desc.func.minus18Bang;
 show "count -8!til 1000 / uncompressed";
 show count -8!til 1000;
 show "count -18!til 1000 / compressed";
 show count -18!til 1000;
 };

// .kdb.exp.joins.minus21Bang[]
.kdb.exp.joins.minus21Bang:{
 show "Example: -21!x";
 show .kdb.desc.func.minus21Bang;
 };

// .kdb.exp.joins.minus22Bang[]
.kdb.exp.joins.minus22Bang:{
 show "Example: -22!x";
 show .kdb.desc.func.minus22Bang;
 };