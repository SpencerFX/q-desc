// INFO ====================================================
// Purpose: Show examples for Q namespace
//==========================================================
/ Examples of Q namespace usage

// Author: Spencer
//==========================================================
system"c 350 550";

// .kdb.exp.func.Q.addr[]
.kdb.exp.func.Q.addr:{
    show .kdb.desc.func.Q.addr;
    show .Q.addr`localhost;
 };

// .kdb.exp.func.Q.bt[]
.kdb.exp.func.Q.bt:{
    show .kdb.desc.func.Q.bt;
    show f:{{.Q.bt[];x*2}x+1};
    show f 4;
 };

// .kdb.exp.func.Q.btoa[]
.kdb.exp.func.Q.btoa:{
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
    show .kdb.desc.func.Q.chk;    
    show ".Q.chk[`:hdb]";
    // NOTE: Create hdb or configure here
    .Q.chk[`:hdb];
 };

// .kdb.exp.func.Q.dd[]
.kdb.exp.func.Q.dd:{
    show ".Q.dd";
    show .kdb.desc.func.Q.dd;    
    show "USAGE: .Q.dd[`:dir]`file";
    show .Q.dd[`:dir]`file
 };

// .kdb.exp.func.Q.ens[]
.kdb.exp.func.Q.ens:{
    show ".Q.ens";
    show .kdb.desc.func.Q.ens;
    show "USAGE: Q.ens[`:db;([]sym:`a`b`c);`mysym]";
    // show ([]sym:`mysym$`a`b`c)~.Q.ens[`:db;([]sym:`a`b`c);`mysym];
 };

// .kdb.exp.func.Q.f[]
.kdb.exp.func.Q.f:{
    show ".Q.f";
    show .kdb.desc.func.Q.f;
    show "USAGE:.Q.f[2;]each 9.996 34.3445 7817047037.90 781704703567.90 -.02 9.996 -0.0001";
    show .Q.f[2;]each 9.996 34.3445 7817047037.90 781704703567.90 -.02 9.996 -0.0001
 };

// .kdb.exp.func.Q.fc[]
.kdb.exp.func.Q.fc:{
    show ".Q.fc";
    show .kdb.desc.func.Q.fc;
    f:{2 xexp x};
    vec:til 100000;
    show "USAGE: .Q.fc[f]vec";
    show .Q.fc[f]vec;
 };

// .kdb.exp.func.Q.ff[]
.kdb.exp.func.Q.ff:{
    show ".Q.ff";
    show .kdb.desc.func.Q.ff;
    show "src:0N!flip`sym`time`price`size!10?'(`3;.z.t;1000f;10000)";
    show src:0N!flip`sym`time`price`size!10?'(`3;.z.t;1000f;10000);
    show ".Q.ff[src] enlist `sym`ratioA`ratioB!3#1";
    show .Q.ff[src] enlist `sym`ratioA`ratioB!3#1
 };

// .kdb.exp.func.Q.ff[]
.kdb.exp.func.Q.ff:{
    show ".Q.ff";
    show .kdb.desc.func.Q.ff;
    show "src:0N!flip`sym`time`price`size!10?'(`3;.z.t;1000f;10000)";
    show src:0N!flip`sym`time`price`size!10?'(`3;.z.t;1000f;10000);
    show ".Q.ff[src] enlist `sym`ratioA`ratioB!3#1";
    show .Q.ff[src] enlist `sym`ratioA`ratioB!3#1
 };

// .kdb.exp.func.Q.ff[]
.kdb.exp.func.Q.ff:{
    show ".Q.fk";
    show .kdb.desc.func.Q.fk;
    show "src:0N!flip`sym`time`price`size!10?'(`3;.z.t;1000f;10000)";
    show src:0N!flip`sym`time`price`size!10?'(`3;.z.t;1000f;10000);
    show ".Q.fk src";
    show .Q.fk src;
 };

// .kdb.exp.func.Q.fmt[]
.kdb.exp.func.Q.fmt:{
    show ".Q.fmt";
    show .kdb.desc.func.Q.fmt;
    show ".Q.fmt[6;2]each 1 234";
    show .Q.fmt[6;2]each 1 234;
    show "fix:{.Q.fmt'[x+1+count each string floor y;x;y]}";
    fix:{.Q.fmt'[x+1+count each string floor y;x;y]};
    show "fix[2]1.2 123 1.23445 -1234578.5522";
    show fix[2]1.2 123 1.23445 -1234578.5522
 };

// .kdb.exp.func.Q.fmt[]
.kdb.exp.func.Q.fmt:{
    show ".Q.fmt";
    show .kdb.desc.func.Q.fmt;
    show ".Q.fmt[6;2]each 1 234";
    show .Q.fmt[6;2]each 1 234;
    show "fix:{.Q.fmt'[x+1+count each string floor y;x;y]}";
    fix:{.Q.fmt'[x+1+count each string floor y;x;y]};
    show "fix[2]1.2 123 1.23445 -1234578.5522";
    show fix[2]1.2 123 1.23445 -1234578.5522
 };