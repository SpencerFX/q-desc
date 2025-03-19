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

// .kdb.exp.func.Q.ft[]
.kdb.exp.func.Q.ft:{
    show ".Q.ft";
    show .kdb.desc.func.Q.ft;
    show ".Q.ft[{x 2 3};s]";
    show .Q.ft[{x 2 3};s];
    show "select from s where i in 2 3";
    show select from s where i in 2 3;
 };

// .kdb.exp.func.Q.fu[]
.kdb.exp.func.Q.fu:{
    show ".Q.fu";
    show .kdb.desc.func.Q.fu;
    vec:100000?30;
    f:{exp x*x};
    show"system \"t r1:f vec\"";
    show system"t r1:f vec";
    show"system \"t 1000 r2:.Q.fu[f;vec]\"";
    show system"t r2:.Q.fu[f;vec]";
    show r1~r2
 };

// .kdb.exp.func.Q.gc[]
.kdb.exp.func.Q.gc:{
    show ".Q.gc";
    show .kdb.desc.func.Q.gc;
    a::til 10000000;
    show .Q.w[];
    delete a from `.;
    show".Q.gc[];"
    show .Q.gc[];
    show .Q.w[];
 };

// .kdb.exp.func.Q.gz[]
.kdb.exp.func.Q.gz:{
    show ".Q.gz";
    show .kdb.desc.func.Q.gz;
    show ".Q.gz{0N!count x;x}[.Q.gz(9;10000#\"helloworld\")]";
    show .Q.gz{0N!count x;x}[.Q.gz(9;10000#"helloworld")];
 };

// .kdb.exp.func.Q.hdpf[]
.kdb.exp.func.Q.hdpf:{
    show ".Q.hdpf";
    show .kdb.desc.func.Q.hdpf;
    show ".Q.hdpf[historicalport;directory;partition;`p#field]";
 };

// .kdb.exp.func.Q.hg[]
.kdb.exp.func.Q.hg:{
    show ".Q.hg";
    show .kdb.desc.func.Q.hg;
    show ".Q.hg`:http://www.google.com";
    show .Q.hg`:http://www.google.com
 };

// .kdb.exp.func.Q.host[]
.kdb.exp.func.Q.host:{
    show ".Q.host";
    show .kdb.desc.func.Q.host;
    show ".Q.host .Q.addr`localhost";
    show .Q.host .Q.addr`localhost;
    show .Q.host "I"$"104.130.139.23";
 };

// .kdb.exp.func.Q.hp[]
.kdb.exp.func.Q.hp:{
    show ".Q.hp";
    show .kdb.desc.func.Q.hp;
    show ".Q.hp[x;y;z]";
    show .Q.hp["http://google.com";.h.ty`json]"my question";
 };

// .kdb.exp.func.Q.id[]
.kdb.exp.func.Q.id:{
    show ".Q.id";
    show .kdb.desc.func.Q.id;
    show ".Q.id each `$(\"ab\";\"a/b\";\"two words\";\"2drifters\";\"2+2\")";
    show .Q.id each `$("ab";"a/b";"two words";"2drifters";"2+2");
    show ".Q.id flip (5#.Q.res)!(5#())";
    show .Q.id flip (5#.Q.res)!(5#());
 };

// .kdb.exp.func.Q.ind[]
.kdb.exp.func.Q.ind:{
    show ".Q.ind";
    show .kdb.desc.func.Q.ind;
    show ".Q.ind[x;y]";
    show ".Q.ind[trade;2 3]";
    show "(select from trade where date=2010.01.07)~.Q.ind[trade;(exec first sum x from t where date<2010.01.07)+til first exec x from t where date=2010.01.07]";
 };

// .kdb.exp.func.Q.j10[]
.kdb.exp.func.Q.j10:{
    show ".Q.j10";
    show .kdb.desc.func.Q.j10;
    show ".Q.j10 .Q.x10 12345";
    .Q.j10 .Q.x10 12345;
 };

// .kdb.exp.func.Q.x10[]
.kdb.exp.func.Q.x10:{
    show ".Q.x10";
    show .kdb.desc.func.Q.x10;
    show ".Q.x10 12345";
    show .Q.x10 12345
 };

// .kdb.exp.func.Q.j12[]
.kdb.exp.func.Q.j12:{
    show ".Q.j12";
    show .kdb.desc.func.Q.j12;
    show ".Q.j12 .Q.x12 12345";
    show .Q.j12 .Q.x12 12345;
 };

// .kdb.exp.func.Q.x12[]
.kdb.exp.func.Q.x12:{
    show ".Q.x12";
    show .kdb.desc.func.Q.x12;
    show ".Q.x12 12345";
    show .Q.x12 12345;
 };

// .kdb.exp.func.Q.K[]
.kdb.exp.func.Q.K:{
    show ".Q.K";
    show .kdb.desc.func.Q.K;
    show .Q.K
 };

// .kdb.exp.func.Q.k[]
.kdb.exp.func.Q.k:{
    show ".Q.k";
    show .kdb.desc.func.Q.k;
    show .Q.k
 };

// .kdb.exp.func.Q.l[]
.kdb.exp.func.Q.l:{
    show ".Q.l";
    show .kdb.desc.func.Q.l;
    show ".Q.l x";
 };

// .kdb.exp.func.Q.ld[]
.kdb.exp.func.Q.ld:{
    show ".Q.ld";
    show .kdb.desc.func.Q.ld;
    show ".Q.ld x";
    show ".Q.ld read0`:funcs.q";
 };

// .kdb.exp.func.Q.li[]
.kdb.exp.func.Q.li:{
    show ".Q.li";
    show .kdb.desc.func.Q.li;
    show ".Q.li[partitions]";
 };

// .kdb.exp.func.Q.lo[]
.kdb.exp.func.Q.lo:{
    show ".Q.lo";
    show .kdb.desc.func.Q.lo;
    show ".Q.lo[`database;cd;scripts]";
 };

// .kdb.exp.func.Q.M[]
.kdb.exp.func.Q.M:{
    show ".Q.M";
    show .kdb.desc.func.Q.M;
    show "0W~.Q.M";
    show 0W~.Q.M
 };

// .kdb.exp.func.Q.MAP[]
.kdb.exp.func.Q.MAP:{
    show ".Q.MAP";
    show .kdb.desc.func.Q.MAP;
    show "system \"l .\"";
    show ".Q.MAP[]";
 };

// .kdb.exp.func.Q.n[]
.kdb.exp.func.Q.n:{
    show ".Q.n";
    show .kdb.desc.func.Q.n;
    show .Q.n;
 };

// .kdb.exp.func.Q.nA[]
.kdb.exp.func.Q.nA:{
    show ".Q.nA";
    show .kdb.desc.func.Q.nA;
    show .Q.nA;
 };

// .kdb.exp.func.Q.opt[]
.kdb.exp.func.Q.opt:{
    show ".Q.opt";
    show .kdb.desc.func.Q.opt;
    show ".Q.opt .z.x";
    show .Q.opt .z.x;
 };

// .kdb.exp.func.Q.P[]
.kdb.exp.func.Q.P:{
    show ".Q.P";
    show .kdb.desc.func.Q.P;
 };

// .kdb.exp.func.Q.par[]
.kdb.exp.func.Q.par:{
    show ".Q.par";
    show .kdb.desc.func.Q.par;
    show ".Q.par[dir;part;table]";
    show "all{`p=attr .Q.par[`:.;x;`quote]`sym}each  date";
 };

// .kdb.exp.func.Q.PD[]
.kdb.exp.func.Q.PD:{
    show ".Q.PD";
    show .kdb.desc.func.Q.PD;
 };

// .kdb.exp.func.Q.pd[]
.kdb.exp.func.Q.PD:{
    show ".Q.pd";
    show .kdb.desc.func.Q.pd;
 };

// .kdb.exp.func.Q.pf[]
.kdb.exp.func.Q.pf:{
    show ".Q.pf";
    show .kdb.desc.func.Q.pf;
 };

// .kdb.exp.func.Q.pn[]
.kdb.exp.func.Q.pn:{
    show ".Q.pn";
    show .kdb.desc.func.Q.pn;
 };

// .kdb.exp.func.Q.prf0[]
.kdb.exp.func.Q.prf0:{
    show ".Q.prf0";
    show .kdb.desc.func.Q.prf0;
    show ".Q.prf0 pid";
 };

// .kdb.exp.func.Q.pt[]
.kdb.exp.func.Q.pt:{
    show ".Q.pt";
    show .kdb.desc.func.Q.pt;
 };

// .kdb.exp.func.Q.pv[]
.kdb.exp.func.Q.pv:{
    show ".Q.pv";
    show .kdb.desc.func.Q.pv;
 };

// .kdb.exp.func.Q.PV[]
.kdb.exp.func.Q.PV:{
    show ".Q.PV";
    show .kdb.desc.func.Q.PV;
 };

// .kdb.exp.func.Q.qp[]
.kdb.exp.func.Q.qp:{
    show ".Q.qp";
    show .kdb.desc.func.Q.qp;
 };

// .kdb.exp.func.Q.qt[]
.kdb.exp.func.Q.qt:{
    show ".Q.qt";
    show .kdb.desc.func.Q.qt;
    show ".Q.qt trade";
    show .Q.qt trade'
 };

// .kdb.exp.func.Q.res[]
.kdb.exp.func.Q.res:{
    show ".Q.res";
    show .kdb.desc.func.Q.res;
    show ".Q.res,key`.q";
    show .Q.res,key`.q;
 };

// .kdb.exp.func.Q.s[]
.kdb.exp.func.Q.s:{
    show ".Q.s";
    show .kdb.desc.func.Q.s;
    show ".Q.s ([h:1 2 3] m: 4 5 6)";
    show .Q.s ([h:1 2 3] m: 4 5 6);
 };

// .kdb.exp.func.Q.[]
.kdb.exp.func.Q.s1:{
    show ".Q.s1";
    show .kdb.desc.func.Q.s1;
    show ".Q.s1 `test";
    show .Q.s1 `test;
 };

// .kdb.exp.func.Q.sbt[]
.kdb.exp.func.Q.sbt:{
    show ".Q.sbt";
    show .kdb.desc.func.Q.sbt;
 };

// .kdb.exp.func.Q.sha1[]
.kdb.exp.func.Q.sha1:{
    show ".Q.sha1";
    show .kdb.desc.func.Q.sha1;
    show ".Q.sha1\"Hello World!\"";
    show .Q.sha1"Hello World!"
 };

// .kdb.exp.func.Q.t[]
.kdb.exp.func.Q.t:{
    show ".Q.t";
    show .kdb.desc.func.Q.t;
    show .Q.t;
    show ".Q.t?\"j\"";
    show .Q.t?"j";
 };

// .kdb.exp.func.Q.trp[]
.kdb.exp.func.Q.trp:{
    show ".Q.trp";
    show .kdb.desc.func.Q.trp;
    f:{`hello+x};
    show f;
    show ".Q.trp[f;2;{2\"error: \",x,\"\nbacktrace:\n\",.Q.sbt y;-1}]";
    show .Q.trp[f;2;{2"error: ",x,"\nbacktrace:\n",.Q.sbt y;-1}];
 };

// .kdb.exp.func.Q.trpd[]
.kdb.exp.func.Q.trpd:{
    show ".Q.trpd";
    show .kdb.desc.func.Q.trpd;
    show ".Q.trpd[{x+y};(1;`2);{2\"error: \",x,\"\nbacktrace:\n\",.Q.sbt y;-1}]";
    .Q.trpd[{x+y};(1;`2);{2"error: ",x,"\nbacktrace:\n",.Q.sbt y;-1}];
 };

// .kdb.exp.func.Q.ts[]
.kdb.exp.func.Q.ts:{
    show ".Q.ts";
    show .kdb.desc.func.Q.ts;
    show ".Q.ts[x;y]";
    show ".Q.ts[.Q.hg;enlist`:http://www.google.com]";
    show .Q.ts[.Q.hg;enlist`:http://www.google.com];
 };

// .kdb.exp.func.Q.ty[]
.kdb.exp.func.Q.ty:{
    show ".Q.ty";
    show .kdb.desc.func.Q.ty;
    t:([]a:3 4 5;b:"abc";c:(3;"xy";`ab);d:3 2#3 4 5;e:("abc";"de";"fg"));
    show t;
    show ".Q.ty each t`a`b`c`d`e";
    show .Q.ty each t`a`b`c`d`e;
 };

// .kdb.exp.func.Q.u[]
.kdb.exp.func.Q.u:{
    show ".Q.u";
    show .kdb.desc.func.Q.u;
 };

// .kdb.exp.func.Q.V[]
.kdb.exp.func.Q.V:{
    show ".Q.V";
    show .kdb.desc.func.Q.V;
 };

// .kdb.exp.func.Q.v[]
.kdb.exp.func.Q.v:{
    show ".Q.v";
    show .kdb.desc.func.Q.v;
 };

// .kdb.exp.func.Q.view[]
.kdb.exp.func.Q.view:{
    show ".Q.view";
    show .kdb.desc.func.Q.view;
 };

// .kdb.exp.func.Q.vp[]
.kdb.exp.func.Q.vp:{
    show ".Q.vp";
    show .kdb.desc.func.Q.vp;
 };

// .kdb.exp.func.Q.w[]
.kdb.exp.func.Q.w:{
    show ".Q.w";
    show .kdb.desc.func.Q.w;
    show .Q.w[];
 };

// .kdb.exp.func.Q.Xf[]
.kdb.exp.func.Q.Xf:{
    show ".Q.";
    show .kdb.desc.func.Q.Xf;
    show ".Q.Xf[x;y]";
    show ".Q.Xf["C";`:emptyNestedCharVector]";
 };

// .kdb.exp.func.Q.x[]
.kdb.exp.func.Q.x:{
    show ".Q.x";
    show .kdb.desc.func.Q.x;
    show .Q.x;
 };