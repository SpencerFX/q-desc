// INFO ====================================================
// Purpose: Show examples for z namespace
//==========================================================
/ Examples of z namespace

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.func.z.a[]
.kdb.exp.func.z.a:{
 show "Example: .z.a";
 show .kdb.desc.func.z.a;
 show ".z.a";
 show .z.a;
 show "It can be split into components as follows:";
 show "\"i\"$0x0 vs .z.a";
 show "i"$0x0 vs .z.a;
 };

// .kdb.exp.func.z.ac[]
.kdb.exp.func.z.ac:{
 show "Example: .z.ac";
 show .kdb.desc.func.z.ac;
 };

// .kdb.exp.func.z.b[]
.kdb.exp.func.z.b:{
 show "Example: .z.b";
 show .kdb.desc.func.z.b;
 show "a::x+y";
 //a::x+y;
 show "b::x+1";
 //b::x+1;
 show .z.b;
 };

// .kdb.exp.func.z.bm[]
.kdb.exp.func.z.bm:{
 show "Example: .z.bm";
 show .kdb.desc.func.z.bm;
 show ".z.bm:{`msg set (.z.p;x);}";
 };

// .kdb.exp.func.z.c[]
.kdb.exp.func.z.c:{
 show "Example: .z.c";
 show .kdb.desc.func.z.c;
 show ".z.c";
 show .z.c;
 };

// .kdb.exp.func.z.e[]
.kdb.exp.func.z.e:{
 show "Example: .z.e";
 show .kdb.desc.func.z.e;
 show ".z.e";
 show .z.e;
 };

// .kdb.exp.func.z.ex[]
.kdb.exp.func.z.ex:{
 show "Example: .z.ex";
 show .kdb.desc.func.z.ex;
 };

// .kdb.exp.func.z.exit[]
.kdb.exp.func.z.exit:{
 show "Example: .z.exit";
 show .kdb.desc.func.z.exit;
 show ".z.exit:{0N!x}"
 show "exit 42";
 show "q process exited";
 };

// .kdb.exp.func.z.ey[]
.kdb.exp.func.z.ey:{
 show "Example: .z.ey";
 show .kdb.desc.func.z.ey

 };

// .kdb.exp.func.z.f[]
.kdb.exp.func.z.f:{
 show "Example: .z.f";
 show .kdb.desc.func.z.f

 };

// .kdb.exp.func.z.H[]
.kdb.exp.func.z.H:{
 show "Example: .z.H";
 show .kdb.desc.func.z.H;
 show ".z.H";
 show .z.H;
 };

// .kdb.exp.func.z.h[]
.kdb.exp.func.z.h:{
 show "Example: .z.h";
 show .kdb.desc.func.z.h;
 show ".z.h";
 show .z.h;
 };

// .kdb.exp.func.z.i[]
.kdb.exp.func.z.i:{
 show "Example: .z.i";
 show .kdb.desc.func.z.i;
 show ".z.i";
 show .z.i;
 };

// .kdb.exp.func.z.K[]
.kdb.exp.func.z.K:{
 show "Example: .z.K";
 show .kdb.desc.func.z.K;
 show ".z.K";
 show .z.K;
 };

// .kdb.exp.func.z.k[]
.kdb.exp.func.z.k:{
 show "Example: .z.k";
 show .kdb.desc.func.z.k;
 show ".z.k";
 show .z.k;
 };

// .kdb.exp.func.z.l[]
.kdb.exp.func.z.l:{
 show "Example: .z.l";
 show .kdb.desc.func.z.l;
 show ".z.l";
 show .z.l;
 show "`maxCoresAllowed`expiryDate`updateDate`````bannerText`!.z.l";
 show `maxCoresAllowed`expiryDate`updateDate`````bannerText`!.z.l;
 };

// .kdb.exp.func.z.N[]
.kdb.exp.func.z.N:{
 show "Example: .z.N";
 show .kdb.desc.func.z.N;
 show ".z.N";
 show .z.N;
 };

// .kdb.exp.func.z.n[]
.kdb.exp.func.z.n:{
 show "Example: .z.n";
 show .kdb.desc.func.z.n;
 show ".z.n";
 show .z.n;
 };

// .kdb.exp.func.z.o[]
.kdb.exp.func.z.o:{
 show "Example: .z.o";
 show .kdb.desc.func.z.o;
  show ".z.o";
 show .z.o;
 };

// .kdb.exp.func.z.P[]
.kdb.exp.func.z.P:{
 show "Example: .z.P";
 show .kdb.desc.func.z.P;
 show ".z.P";
 show .z.P;
 };

// .kdb.exp.func.z.p[]
.kdb.exp.func.z.p:{
 show "Example: .z.p";
 show .kdb.desc.func.z.p;
 show ".z.p";
 show .z.p;
 };

// .kdb.exp.func.z.pc[]
.kdb.exp.func.z.pc:{
 show "Example: .z.pc";
 show .kdb.desc.func.z.pc;
 show ".z.pc:{0N!(.z.a;.z.u;.z.w;x);x}";
 .z.pc:{0N!(.z.a;.z.u;.z.w;x);x};
 show "Registry:([zw:`int$()] callback:`symbol$())"
 show "register:{[cb] `Registry upsert (.z.w; cb);}"
 show ".z.po:{`Registry upsert (x; `unregistered);}";
 show ".z.pc:{delete from `Registry where zw=x;}";
 };

// .kdb.exp.func.z.pd[]
.kdb.exp.func.z.pd:{
 show "Example: .z.pd";
 show .kdb.desc.func.z.pd;
 show "open connections to 4 processes on the localhost.";
 show ".z.pd:`u#hopen each 20000+til 4";
 show "more complicated set-up:";
 show ".z.pd:{n:abs system\"s\";$[n=count handles;handles;[hclose each handles;:handles::`u#hopen each 20000+til n]]}";
 show ".z.pc:{handles::`u#handles except x;}";
 };

// .kdb.exp.func.z.pg[]
.kdb.exp.func.z.pg:{
 show "Example: .z.pg";
 show .kdb.desc.func.z.pg;

 };

// .kdb.exp.func.z.ph[]
.kdb.exp.func.z.ph:{
 show "Example: .z.ph";
 show .kdb.desc.func.z.ph;
 show ".z.ph is passed a single argument, a 2-item list (requestText;requestHeaderAsDictionary):";
 show "requestText is parsed in .z.ph – detecting special cases like requests for CSV, XLS output – and the result is returned to the calling task.";
 show "requestHeaderAsDictionary contains a dictionary of HTTP header names and values as sent by the client. This can be used to return content optimized for particular browsers.";
 };

// .kdb.exp.func.z.pi[]
.kdb.exp.func.z.pi:{
 show "Example: .z.pi";
 show .kdb.desc.func.z.pi;
 aa:: ([]a:1 2 3;b:11 22 33);
 show ".z.pi:{0N!value x;}";
 };

// .kdb.exp.func.z.pm[]
.kdb.exp.func.z.pm:{
 show "Example: .z.pm";
 show .kdb.desc.func.z.pm;
 show "(`OPTIONS;requestText;requestHeaderDict)";
 show "For the POST method use .z.pp, and for GET use .z.ph.";
 };

// .kdb.exp.func.z.po[]
.kdb.exp.func.z.po:{
 show "Example: .z.po - open";
 show .kdb.desc.func.z.po;
 show ".z.po is evaluated when a connection to the a kdb process has been requested. It is validated against any -u or -U information or .z.pw checks";
 show "Registry:([zw:`int$()] callback:`symbol$())"
 show "register:{[cb] `Registry upsert (.z.w; cb);}"
 show ".z.po:{`Registry upsert (x; `unregistered);}";
 show ".z.pc:{delete from `Registry where zw=x;}";
 };

// .kdb.exp.func.z.pp[]
.kdb.exp.func.z.pp:{
 show "Example: .z.pp - HTTP post";
 show .kdb.desc.func.z.pp;
 show "You may be able to modify this so that it calls value on the first item of its argument and returns the result to the calling taks.";
 };

// .kdb.exp.func.z.pq[]
.kdb.exp.func.z.pq:{
 show "Example: .z.pq - qcon";
 show .kdb.desc.func.z.pq;
 show "This allows a user to handle remote qcon connections (via .z.pq) without defining special handling for console processing (via .z.pi).";
 };

// .kdb.exp.func.z.ps[]
.kdb.exp.func.z.ps:{
 show "Example: .z.ps - set";
 show .kdb.desc.func.z.ps;
 show ".z.ps:{[x]0N!(`zps;x);value x}";
 show ".z.pg:{[x]0N!(`zpg;x);value x}";
 .z.ps:{[x]0N!(`zps;x);value x}; 
 .z.pg:{[x]0N!(`zpg;x);value x}; 
 show 0 "2+2";
 };

// .kdb.exp.func.z.pw[]
.kdb.exp.func.z.pw:{
 show "Example: .z.pw - validate user";
 show .kdb.desc.func.z.pw;
 show "{[user;pswd]1b}";
 show "As .z.pw is simply a function it can be used to implement rules such as: ordinary users can sign on only between 0800 and 1800 on weekdays or can go out to external resources like an LDAP directory.";
 show "If .z.pw returns 0b the task attempting to establish the connection will get an 'access error.";
 };

// .kdb.exp.func.z.q[]
.kdb.exp.func.z.q:{
 show "Example: .z.q - quiet mode";
 show .kdb.desc.func.z.q;
 "See command line option -q";

 };
// .kdb.exp.func.z.r[]
.kdb.exp.func.z.r:{
 show "Example: .z.r - blocked";
 show .kdb.desc.func.z.r;

 };

// .kdb.exp.func.z.s[]
.kdb.exp.func.z.s:{
 show "Example: .z.s - self";
 show .kdb.desc.func.z.s;
 show "fact:{$[x<=0;1;x*.z.s x-1]}";
 show "fact[5]";
 fact:{$[x<=0;1;x*.z.s x-1]};
 show fact[5];
 };

// .kdb.exp.func.z.ts[]
.kdb.exp.func.z.ts:{
 show "Example: .z.ts - timer";
 show .kdb.desc.func.z.ts;
 show "system\"t 1000\" / setting the timer to every second";
 show ".z.ts:{0N!x}";
 show "2010.12.16D17:12:12.849442000";
 };

// .kdb.exp.func.z.u[]
.kdb.exp.func.z.u:{
 show "Example: .z.u - user id";
 show .kdb.desc.func.z.u;
 show .z.u;
 };

// .kdb.exp.func.z.vs[]
.kdb.exp.func.z.vs:{
 show "Example: .z.vs - value set";
 show .kdb.desc.func.z.vs;
 show "The following example sets .z.vs to display the symbol, the index and the value of the variable.";
 show ".z.vs:{0N!(x;y;value x)}";
 .z.vs:{0N!(x;y;value x)};
 show m:(1 2;3 4);
 };

// .kdb.exp.func.z.W[]
.kdb.exp.func.z.W:{
 show "Example: .z.W - handles";
 show .kdb.desc.func.z.W;
 show "neg[h]({};til 1000000); neg[h]({};til 10); .z.W";
 show "3| 8000030 110";
 };

// .kdb.exp.func.z.w[]
.kdb.exp.func.z.w:{
 show "Example: .z.w - handle";
 show .kdb.desc.func.z.w;
 show ".z.w";
 show .z.w;
 };

// .kdb.exp.func.z.wc[]
.kdb.exp.func.z.wc:{
 show "Example: .z.wc - websocket close";
 show .kdb.desc.func.z.wc;
 show "f[h] is evaluated after a websocket connection has been closed. (Since V3.3t 2014.11.26.)";
 };

// .kdb.exp.func.z.wo[]
.kdb.exp.func.z.wo:{
 show "Example: .z.wo - websocket open";
 show .kdb.desc.func.z.wo;
 };

// .kdb.exp.func.z.ws[]
.kdb.exp.func.z.ws:{
 show "Example: .z.ws - websockets";
 show .kdb.desc.func.z.ws;
 };

// .kdb.exp.func.z.X[]
.kdb.exp.func.z.X:{
 show "Example: .z.X - raw command line";
 show .kdb.desc.func.z.X;
 show ".z.X";
 show .z.X;
 show ".Q.opt .z.X";
 show .Q.opt .z.X;
 };

// .kdb.exp.func.z.x[]
.kdb.exp.func.z.x:{
 show "Example: .z.x - argv";
 show .kdb.desc.func.z.x;
 show ".z.x";
 show .z.x;
 };

// .kdb.exp.func.z.Z[]
.kdb.exp.func.z.Z:{
 show "Example: .z.Z - local datetime";
 show .kdb.desc.func.z.Z;
 show ".z.Z";
 show .z.Z;
 };

// .kdb.exp.func.z.z[]
.kdb.exp.func.z.z:{
 show "Example: .z.z - utc datetime";
 show .kdb.desc.func.z.z;
 show ".z.z";
 show .z.z;
 };

// .kdb.exp.func.z.zd[]
.kdb.exp.func.z.zd:{
 show "Example: .z.zd - compression/encryption defaults";
 show .kdb.desc.func.z.zd;
 show ".z.zd:(lbs;alg;lvl)";
 show ".z.zd:17 2 6        / set zip defaults";
 show "system \"x .z.zd\"  / clear zip defaults";
 };

// .kdb.exp.func.z.T[]
.kdb.exp.func.z.T:{
 show "Example: .z.T - time short cuts";
 show .kdb.desc.func.z.T;
 show ".z.T";
 show .z.T;
 show ".z.t";
 show .z.t;
 };