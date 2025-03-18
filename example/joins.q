// INFO ====================================================
// Purpose: Show examples for different joins
//==========================================================
/ Examples of different joins

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.joins.pj[]
.kdb.exp.joins.pj:{
 show "Example: plus join";
 show .kdb.desc.joins.pj;
 show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show stocks:([]sym:`IBM`AAPL`GOOG;amount:400 700 1200);
 show newpurchases:([sym:`IBM`GOOG]amount:60 30);
 show "pj[stocks;newpurchases]";
 show pj[stocks;newpurchases]
 };

// .kdb.exp.joins.aj[]
.kdb.exp.joins.aj:{
 show "Example: asof join";
 show .kdb.desc.joins.aj;
 show "syntax is: aj[<col1,col2>;<table1>;<table2>]";
 show quote:([]time:09:29 09:29 09:32 09:33;sym:`FD`KX`FD`KX;ask:30.23 40.20 30.35 40.35;bid:30.20 40.19 30.33 40.32);
 show trade:([]time:09:30 09:31 09:32 09:33 09:34 09:35; sym:`FD`FD`KX`FD`KX`FD;price:30.43 30.45 40.45 30.55 41.00 31.00;size:100 200 200 300 300 600);
 show"aj[`sym`time;trade;quote]";
 show aj[`sym`time;trade;quote]
 };

// .kdb.exp.joins.ej[]
.kdb.exp.joins.ej:{
 show "Example: equi join";
 show .kdb.desc.joins.ej;
 show "syntax is: ej[<col1,…,coln>;<table1>;<table2>]";
 show trade:([]sym:`XOM`GM`MET`GOOG`GM`XOM;price:200 150 60 151 152 199);
 show sector:([]sym:`XOM`GM;sector:`energy`auto);
 show "ej[`sym;trade;sector]";
 show ej[`sym;trade;sector];
 };

// .kdb.exp.joins.uj[]
.kdb.exp.joins.uj:{
 show "Example: union join";
 show .kdb.desc.joins.uj;
 show "syntax is: uj[<unkeyed>;<unkeyed>] or <unkeyed> uj <unkeyed> or uj[<keyed>;<keyed>] or <keyed> uj <keyed>";
 show nyse;
 show lon;
 show "nyse uj lon";
 show nyse uj lon;
 show quote_uj;
 show trade_uj;
 show "`time xasc uj[trade_uj;quote_uj]";
 show `time xasc uj[trade_uj;quote_uj];
 };

// .kdb.exp.joins.lj[]
.kdb.exp.joins.lj:{
 show "Example: left join";
 show .kdb.desc.joins.lj;
 show "syntax is: lj[<unkeyed>;<keyed>] or <unkeyed> lj <keyed>";
 show sector;
 show trades;
 show "trade lj sector";
 show trade lj sector;
 };

// .kdb.exp.joins.ij[]
.kdb.exp.joins.ij:{
 show "Example: inner join";
 show .kdb.desc.joins.ij;
 show "syntax is: ij[<unkeyed>;<keyed>] or <unkeyed> ij <keyed>";
 show info;
 show trade;
 show "trade ij info";
 show trade ij info;
 };

// .kdb.exp.joins.comma[]
.kdb.exp.joins.comma:{
 show "Example: comma join";
 show .kdb.desc.joins.comma;
 show location1;
 show location2;
 show "location1,location2";
 show location1,location2;
 show "Example of comma join with keyed tables."
 show oldcreditrating;
 show newcreditrating;
 show "oldcreditrating,newcreditrating";
 show oldcreditrating,newcreditrating
 };

// .kdb.exp.joins.wj[]
.kdb.exp.joins.wj:{
 show "Example: window join";
 show .kdb.desc.joins.wj;
 show "syntax is: wj [w; c; t; (q; (f0;c0); (f1;c1))]";
 show quote:([]time:1 3 4 5 6t;sym:`FDP;ask:205 201 199 200 201;bid:200 198 199 196 200);
 show trade: ([]time: 2t+6000000*til 3;sym:`FDP;price:200+(1-3?2.0));
 show "wj[(2 5 6t; 3 6 7t);`sym`time;trade;(quote;(max;`ask);(min;`bid))]";
 show wj[(2 5 6t; 3 6 7t);`sym`time;trade;(quote;(max;`ask);(min;`bid))]
 };