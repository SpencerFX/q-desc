// INFO ====================================================
// Purpose: Show examples for key words
//==========================================================
/ Examples of keyword usage

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.args.b[]
.kdb.exp.args.b:{
 show "CLI Example: -b blocked";
 show .kdb.desc.args.b;
 show "q -b";
 show "aa:([]bb:til 4)";
 show "p 5001";
 show "h:hopen 5001";
 show "h count aa";
 show "4";
 show "h aa:10#aa";
 show "'noupdate"
 };

// .kdb.exp.args.c[]
.kdb.exp.args.c:{
 show "CLI Example: -c";
 show .kdb.desc.args.c;
 show "q -c 200 200";
 show "system c";
 show "200 200"
 };

// .kdb.exp.args.C[]
.kdb.exp.args.C:{
 show "CLI Example: -C";
 show .kdb.desc.args.C;
 show "q -C 200 200";
 };

// .kdb.exp.args.e[]
.kdb.exp.args.e:{
 show "CLI Example: -e";
 show .kdb.desc.args.e;
 };

// .kdb.exp.args.E[]
.kdb.exp.args.E:{
 show "CLI Example: -E";
 };

// .kdb.exp.args.g[]
.kdb.exp.args.g:{
 show "CLI Example: -g";
 show .kdb.desc.args.g;
 show "q -g 0 # sets deferred or default value";
 show "q -g 1 # sets immediate value";
 };

// .kdb.exp.args.l[]
.kdb.exp.args.l:{
 show "CLI Example: -l";
 show .kdb.desc.args.l;
 show "/tmp/qtest$ q qtest -l";
 show"call ls command and see file ";
 show"qtest.log";
 };

// .kdb.exp.args.L[]
.kdb.exp.args.L:{
 show "CLI Example: -L";
 show .kdb.desc.args.L;
 show "/tmp/qtest$ q qtest -L";
 show"call ls command and see file ";
 show"qtest.log";
 };

// .kdb.exp.args.m[]
.kdb.exp.args.m:{
 show "CLI Example: -m";
 show .kdb.desc.args.m;
 show "0      regular anonymous memory, active and used for all allocs by default";
 show "1      filesystem-backed memory";
 };

// .kdb.exp.args.o[]
.kdb.exp.args.o:{
 show "CLI Example: -o";
 show .kdb.desc.args.o;
 show "q -0 5";
 };

// .kdb.exp.args.p[]
.kdb.exp.args.p:{
 show "CLI Example: -p";
 show .kdb.desc.args.p;
 show "p [rp,][hostname:](portnumber|servicename)";
 show "q -p 5001";
 };

// .kdb.exp.args.P[]
.kdb.exp.args.P:{
 show "CLI Example: -P";
 show .kdb.desc.args.P;
 show "q -p 5";
 };

.kdb.exp.args.q:{
 show "CLI Example: -q";
 show .kdb.desc.args.q;
 };

.kdb.exp.args.r:{
 show "CLI Example: -r";
 show .kdb.desc.args.r;
 };

.kdb.exp.args.s:{
 show "CLI Example: -s";
 show .kdb.desc.args.s;
 };

.kdb.exp.args.S:{
 show "CLI Example: -S";
 show .kdb.desc.args.S;
 };

.kdb.exp.args.T:{
 show "CLI Example: -T";
 show .kdb.desc.args.T;
 };

.kdb.exp.args.u:{
 show "CLI Example: -u";
 show .kdb.desc.args.u;
 };

.kdb.exp.args.U:{
 show "CLI Example: -u";
 show .kdb.desc.args.U;
 };

.kdb.exp.args.w:{
 show "CLI Example: -w";
 show .kdb.desc.args.w;
 };

.kdb.exp.args.W:{
 show "CLI Example: -W";
 show .kdb.desc.args.W;
 };

.kdb.exp.args.z:{
 show "CLI Example: -z";
 show .kdb.desc.args.z;
 };