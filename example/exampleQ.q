// INFO ====================================================
// Purpose: Show examples for Q namespace
//==========================================================
/ Examples of Q namespace usage

// Author: Spencer
//==========================================================
// .kdb.exp.func.Q.addr[]
.kdb.exp.func.Q.addr:{
    system"c 30 250";
    show .kdb.desc.func.Q.addr;
    show .Q.addr`localhost;
 };

// .kdb.exp.func.Q.bt[]
.kdb.exp.func.Q.bt:{
    system"c 30 250";
    show .kdb.desc.func.Q.bt;
    show f:{{.Q.bt[];x*2}x+1};
    show f 4;
 };

// .kdb.exp.func.Q.btoa[]
.kdb.exp.func.Q.btoa:{
    system"c 30 250";
    show .kdb.desc.func.Q.btoa;
    show".Q.btoa\"Hello World!\"";
    show .Q.btoa"Hello World!";
 };

// .kdb.exp.func.Q.bv[]
.kdb.exp.func.Q.bv:{
    n:100;
    t:([]time:.z.T+til n;sym:n?`2;num:n);
    .Q.dpft[`:.;;`sym;`t]each 2010.01.01+til 5;
    tt:t;
    .Q.dpft[`:.;;`sym;`tt]last 2010.01.01+til 5;
    system"l .";
    @[get;"select from tt";-2@]; / error
    .Q.bv[];
    .Q.vp;
    @[get;"select from tt";-2@]; / no error
 };