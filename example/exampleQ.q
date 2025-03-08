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

// .kdb.exp.func.Q.chk[]
.kdb.exp.func.Q.chk:{
    system"c 30 250";
    show .kdb.desc.func.Q.chk;    
    show ".Q.chk[`:hdb]";
    // NOTE: Create hdb or configure here
    .Q.chk[`:hdb];
 };

// .kdb.exp.func.Q.dd[]
.kdb.exp.func.Q.dd:{
    system"c 30 250";
    show ".Q.dd";
    show .kdb.desc.func.Q.dd;    
    show "USAGE: .Q.dd[`:dir]`file";
    show .Q.dd[`:dir]`file
 };

// .kdb.exp.func.Q.ens[]
.kdb.exp.func.Q.ens:{
    system"c 250 550";
    show ".Q.ens";
    show .kdb.desc.func.Q.ens;
    show "USAGE: Q.ens[`:db;([]sym:`a`b`c);`mysym]";
    // show ([]sym:`mysym$`a`b`c)~.Q.ens[`:db;([]sym:`a`b`c);`mysym];
 };

// .kdb.exp.func.Q.f[]
.kdb.exp.func.Q.f:{
    system"c 250 550";
    show ".Q.f";
    show .kdb.desc.func.Q.f;
    show "USAGE:.Q.f[2;]each 9.996 34.3445 7817047037.90 781704703567.90 -.02 9.996 -0.0001";
    show .Q.f[2;]each 9.996 34.3445 7817047037.90 781704703567.90 -.02 9.996 -0.0001
 };