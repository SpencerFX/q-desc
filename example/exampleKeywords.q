// INFO ====================================================
// Purpose: Show examples for key words
//==========================================================
/ Examples of keyword usage

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.keyword.abs[]
.kdb.exp.keyword.abs:{
 show "Example: abs";
 show "abs -1.0";
 show abs -1.0;
 show "abs(10;20 -30)";
 show abs(10;20 -30);
 };

// .kdb.exp.keyword.acos[]
.kdb.exp.keyword.acos:{
 show"acos usage";
 show"acos 0.1"
 show acos 0.1;
 };

// .kdb.exp.keyword.aj[]
.kdb.exp.keyword.aj:{
 rowCount:5000;
 symList: upper(rowCount?`VOD.L`BARC.L`ENI.MI`RBS.L`HBOS.L`LHAG.DE);
 f:{x+(z?0) mod  1+y-x};
 timeRange: f[.z.P - 0D01; .z.P; rowCount];
 trade:([] time: asc timeRange; sym: symList; price:rowCount?100f; size:rowCount?500j);
 quote:([] time: asc timeRange; sym: symList; bid:rowCount?100f; ask:rowCount?100f);
 show"aj[`sym`time;trade; quote]";
 show aj[`sym`time;trade; quote]
 };

// .kdb.exp.keyword.all[]
.kdb.exp.keyword.all:{
 show .kdb.desc.keywords.all;
 show "all 3 4 0 -2";
 show all 3 4 0 -2;
 };

// .kdb.exp.keyword.and[]
.kdb.exp.keyword.and:{
 show .kdb.desc.keywords.and;
 show "1b and 1b /&(min)";
 show 1b and 1b;
 show "1b and 0b /&(min)";
 show 1b and 0b;
 };

// .kdb.exp.keyword.any[]
.kdb.exp.keyword.any:{
 show .kdb.desc.keywords.any;
 show "any 9 2.0 -3.2 1.0";
 show any 9 2.0 -3.2 1.0
 };

// .kdb.exp.keyword.asc[]
.kdb.exp.keyword.asc:{
 show .kdb.desc.keywords.asc;
 show "asc 1 4 7 -2 3";
 show asc 1 4 7 -2 3;
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show .kdb.desc.keywords.all;
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show .kdb.desc.keywords.all;
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show .kdb.desc.keywords.all;
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{

 };

// .kdb.exp.keyword.raze[]
.kdb.exp.keyword.raze:{
    system"c 30 250";
    show ".kdb.exp.keyword.raze";
    show raze (1 2; 3 4 5);
    b:(1 2;(3 4;5 6);7;8);
    show ".kdb.exp.keyword.raze with multiple levels";
    show b;
    show raze/[b];
 };
