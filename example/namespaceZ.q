// INFO ====================================================
// Purpose: Show examples for z namespace
//==========================================================
/ Examples of z namespace

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.keyword.za.[]
.kdb.exp.keyword.za.:{
 show "Example: .z.a";
 show .kdb.desc.func.z.a;
 show ".z.a";
 show .z.a;
 show "It can be split into components as follows:";
 show "\"i\"$0x0 vs .z.a";
 show "i"$0x0 vs .z.a;
 };

// .kdb.exp.keyword.z.ac[]
.kdb.exp.keyword.z.ac:{
 show "Example: .z.ac";
 show .kdb.desc.func.z.ac;
 };

// .kdb.exp.keyword.z.b[]
.kdb.exp.keyword.z.b:{
 show "Example: .z.b";
 show .kdb.desc.func.z.b;
 show "a::x+y";
 //a::x+y;
 show "b::x+1";
 //b::x+1;
 show .z.b;
 };

// .kdb.exp.keyword.z.bm[]
.kdb.exp.keyword.z.bm:{
 show "Example: .z.bm";
 show .kdb.desc.func.z.bm;
 show ".z.bm:{`msg set (.z.p;x);}";
 };

// .kdb.exp.keyword.z.c[]
.kdb.exp.keyword.z.c:{
 show "Example: .z.c";
 show .kdb.desc.func.z.c;
 show ".z.c";
 show .z.c;
 };

// .kdb.exp.keyword.z.[]
.kdb.exp.keyword.z.:{
 show "Example: .z.a";
 show .kdb.desc.func.z.a

 };

// .kdb.exp.keyword.z.e[]
.kdb.exp.keyword.z.e:{
 show "Example: .z.e";
 show .kdb.desc.func.z.e;
 show ".z.e";
 show .z.e;
 };

// .kdb.exp.keyword.z.ex[]
.kdb.exp.keyword.z.ex:{
 show "Example: .z.ex";
 show .kdb.desc.func.z.ex;
 };

// .kdb.exp.keyword.z.exit[]
.kdb.exp.keyword.z.exit:{
 show "Example: .z.exit";
 show .kdb.desc.func.z.exit;
 show ".z.exit:{0N!x}"
 show "exit 42";
 show "q process exited";
 };

// .kdb.exp.keyword.z.ey[]
.kdb.exp.keyword.z.ey:{
 show "Example: .z.ey";
 show .kdb.desc.func.z.a

 };

// .kdb.exp.keyword.z.[]
.kdb.exp.keyword.z.f:{
 show "Example: .z.f";
 show .kdb.desc.func.z.f

 };

// .kdb.exp.keyword.z.H[]
.kdb.exp.keyword.z.H:{
 show "Example: .z.H";
 show .kdb.desc.func.z.H;
 show ".z.H";
 show .z.H;
 };

// .kdb.exp.keyword.z.h[]
.kdb.exp.keyword.z.h:{
 show "Example: .z.h";
 show .kdb.desc.func.z.h;
 show ".z.h";
 show .z.h;
 };

// .kdb.exp.keyword.z.i[]
.kdb.exp.keyword.z.i:{
 show "Example: .z.i";
 show .kdb.desc.func.z.i;
 show ".z.i";
 show .z.i;
 };

// .kdb.exp.keyword.z.K[]
.kdb.exp.keyword.z.K:{
 show "Example: .z.K";
 show .kdb.desc.func.z.K;
 show ".z.K";
 show .z.K;
 };

// .kdb.exp.keyword.z.k[]
.kdb.exp.keyword.z.k:{
 show "Example: .z.k";
 show .kdb.desc.func.z.k;
 show ".z.k";
 show .z.k;
 };

// .kdb.exp.keyword.z.l[]
.kdb.exp.keyword.z.l:{
 show "Example: .z.l";
 show .kdb.desc.func.z.l;
 show ".z.l";
 show .z.l;
 show "`maxCoresAllowed`expiryDate`updateDate`````bannerText`!.z.l";
 show `maxCoresAllowed`expiryDate`updateDate`````bannerText`!.z.l;
 };

// .kdb.exp.keyword.z.N[]
.kdb.exp.keyword.z.N:{
 show "Example: .z.N";
 show .kdb.desc.func.z.N;
 show ".z.N";
 show .z.N;
 };

// .kdb.exp.keyword.z.n[]
.kdb.exp.keyword.z.n:{
 show "Example: .z.n";
 show .kdb.desc.func.z.n;
 show ".z.n";
 show .z.n;
 };

// .kdb.exp.keyword.z.o[]
.kdb.exp.keyword.z.o:{
 show "Example: .z.o";
 show .kdb.desc.func.z.o;
  show ".z.o";
 show .z.o;
 };

// .kdb.exp.keyword.z.P[]
.kdb.exp.keyword.z.P:{
 show "Example: .z.P";
 show .kdb.desc.func.z.P;
 show ".z.P";
 show .z.P;
 };

// .kdb.exp.keyword.z.p[]
.kdb.exp.keyword.z.p:{
 show "Example: .z.p";
 show .kdb.desc.func.z.p;
 show ".z.p";
 show .z.p;
 };

// .kdb.exp.keyword.z.pc[]
.kdb.exp.keyword.z.pc:{
 show "Example: .z.pc";
 show .kdb.desc.func.z.pc;
 show ".z.pc:{0N!(.z.a;.z.u;.z.w;x);x}";
 .z.pc:{0N!(.z.a;.z.u;.z.w;x);x};
 show "Registry:([zw:`int$()] callback:`symbol$())"
 show "register:{[cb] `Registry upsert (.z.w; cb);}"
 show ".z.po:{`Registry upsert (x; `unregistered);}";
 show ".z.pc:{delete from `Registry where zw=x;}";
 };

// .kdb.exp.keyword.z.pd[]
.kdb.exp.keyword.z.pd:{
 show "Example: .z.pd";
 show .kdb.desc.func.z.pd;
 show "open connections to 4 processes on the localhost.";
 show ".z.pd:`u#hopen each 20000+til 4";
 show "more complicated set-up:";
 show ".z.pd:{n:abs system\"s\";$[n=count handles;handles;[hclose each handles;:handles::`u#hopen each 20000+til n]]}";
 show ".z.pc:{handles::`u#handles except x;}";
 };

// .kdb.exp.keyword.z.pg[]
.kdb.exp.keyword.z.pg:{
 show "Example: .z.pg";
 show .kdb.desc.func.z.pg;

 };

// .kdb.exp.keyword.z.ph[]
.kdb.exp.keyword.z.ph:{
 show "Example: .z.ph";
 show .kdb.desc.func.z.ph;
 show ".z.ph is passed a single argument, a 2-item list (requestText;requestHeaderAsDictionary):";
 show "requestText is parsed in .z.ph – detecting special cases like requests for CSV, XLS output – and the result is returned to the calling task.";
 show "requestHeaderAsDictionary contains a dictionary of HTTP header names and values as sent by the client. This can be used to return content optimized for particular browsers.";
 };

// .kdb.exp.keyword.z.pi[]
.kdb.exp.keyword.z.pi:{
 show "Example: .z.pi";
 show .kdb.desc.func.z.pi;
 aa:: ([]a:1 2 3;b:11 22 33);
 show ".z.pi:{0N!value x;}";
 };

// .kdb.exp.keyword.z.pm[]
.kdb.exp.keyword.z.pm:{
 show "Example: .z.pm";
 show .kdb.desc.func.z.pm;
 show "(`OPTIONS;requestText;requestHeaderDict)";
 show "For the POST method use .z.pp, and for GET use .z.ph.";
 };

// .kdb.exp.keyword.z.po[]
.kdb.exp.keyword.z.po:{
 show "Example: .z.po - open";
 show .kdb.desc.func.z.po;
 show ".z.po is evaluated when a connection to the a kdb process has been requested. It is validated against any -u or -U information or .z.pw checks";
 show "Registry:([zw:`int$()] callback:`symbol$())"
 show "register:{[cb] `Registry upsert (.z.w; cb);}"
 show ".z.po:{`Registry upsert (x; `unregistered);}";
 show ".z.pc:{delete from `Registry where zw=x;}";
 };

// .kdb.exp.keyword.z.pp[]
.kdb.exp.keyword.z.pp:{
 show "Example: .z.pp - HTTP post";
 show .kdb.desc.func.z.pp;
 show "You may be able to modify this so that it calls value on the first item of its argument and returns the result to the calling taks.";
 };

// .kdb.exp.keyword.z.pq[]
.kdb.exp.keyword.z.pq:{
 show "Example: .z.pq - qcon";
 show .kdb.desc.func.z.pq;
 show "This allows a user to handle remote qcon connections (via .z.pq) without defining special handling for console processing (via .z.pi).";
 };

// .kdb.exp.keyword.z.ps[]
.kdb.exp.keyword.z.ps:{
 show "Example: .z.ps - set";
 show .kdb.desc.func.z.ps;
 show ".z.ps:{[x]0N!(`zps;x);value x}";
 show ".z.pg:{[x]0N!(`zpg;x);value x}";
 .z.ps:{[x]0N!(`zps;x);value x}; 
 .z.pg:{[x]0N!(`zpg;x);value x}; 
 show 0 "2+2";
 };

// .kdb.exp.keyword.z.pw[]
.kdb.exp.keyword.z.pw:{
 show "Example: .z.pw - validate user";
 show .kdb.desc.func.z.pw;
 show "{[user;pswd]1b}";
 show "As .z.pw is simply a function it can be used to implement rules such as: ordinary users can sign on only between 0800 and 1800 on weekdays or can go out to external resources like an LDAP directory.";
 show "If .z.pw returns 0b the task attempting to establish the connection will get an 'access error.";
 };

// .kdb.exp.keyword.z.q[]
.kdb.exp.keyword.z.q:{
 show "Example: .z.q - quiet mode";
 show .kdb.desc.func.z.q;
 "See command line option -q";

 };
// .kdb.exp.keyword.z.r[]
.kdb.exp.keyword.z.r:{
 show "Example: .z.r - blocked";
 show .kdb.desc.func.z.r;

 };

// .kdb.exp.keyword.z.s[]
.kdb.exp.keyword.z.s:{
 show "Example: .z.s - self";
 show .kdb.desc.func.z.s;
 show "fact:{$[x<=0;1;x*.z.s x-1]}";
 show "fact[5]";
 fact:{$[x<=0;1;x*.z.s x-1]};
 show fact[5];
 };

// .kdb.exp.keyword.z.ts[]
.kdb.exp.keyword.z.ts:{
 show "Example: .z.ts - timer";
 show .kdb.desc.func.z.ts;
 show "system\"t 1000\" / setting the timer to every second";
 show ".z.ts:{0N!x}";
 show "2010.12.16D17:12:12.849442000";
 };

// .kdb.exp.keyword.z.u[]
.kdb.exp.keyword.z.u:{
 show "Example: .z.u - user id";
 show .kdb.desc.func.z.u;
 show .z.u;
 };

// .kdb.exp.keyword.z.vs[]
.kdb.exp.keyword.z.vs:{
 show "Example: .z.vs - value set";
 show .kdb.desc.func.z.vs;
 show "The following example sets .z.vs to display the symbol, the index and the value of the variable.";
 show ".z.vs:{0N!(x;y;value x)}";
 .z.vs:{0N!(x;y;value x)};
 show m:(1 2;3 4);
 };

// .kdb.exp.keyword.z.W[]
.kdb.exp.keyword.z.W:{
 show "Example: .z.W - handles";
 show .kdb.desc.func.z.W;
 show "neg[h]({};til 1000000); neg[h]({};til 10); .z.W";
 show "3| 8000030 110";
 };

// .kdb.exp.keyword.z.w[]
.kdb.exp.keyword.z.w:{
 show "Example: .z.w - handle";
 show .kdb.desc.func.z.w;
 show ".z.w";
 show .z.w;
 };

// .kdb.exp.keyword.z.wc[]
.kdb.exp.keyword.z.wc:{
 show "Example: .z.wc - websocket close";
 show .kdb.desc.func.z.wc;
 show "f[h] is evaluated after a websocket connection has been closed. (Since V3.3t 2014.11.26.)";
 };

// .kdb.exp.keyword.z.wo[]
.kdb.exp.keyword.z.wo:{
 show "Example: .z.wo - websocket open";
 show .kdb.desc.func.z.wo;
 };

// .kdb.exp.keyword.z.ws[]
.kdb.exp.keyword.z.ws:{
 show "Example: .z.ws - websockets";
 show .kdb.desc.func.z.ws;
 };

// .kdb.exp.keyword.z.X[]
.kdb.exp.keyword.z.X:{
 show "Example: .z.X - raw command line";
 show .kdb.desc.func.z.X;
 show ".z.X";
 show .z.X;
 show ".Q.opt .z.X";
 show .Q.opt .z.X;
 };

// .kdb.exp.keyword.z.x[]
.kdb.exp.keyword.z.x:{
 show "Example: .z.x - argv";
 show .kdb.desc.func.z.x;
 show ".z.x";
 show .z.x;
 };

// .kdb.exp.keyword.z.Z[]
.kdb.exp.keyword.z.Z:{
 show "Example: .z.Z - local datetime";
 show .kdb.desc.func.z.Z;
 show ".z.Z";
 show .z.Z;
 };

// .kdb.exp.keyword.z.z[]
.kdb.exp.keyword.z.z:{
 show "Example: .z.z - utc datetime";
 show .kdb.desc.func.z.z;
 show ".z.z";
 show .z.z;
 };

// .kdb.exp.keyword.z.zd[]
.kdb.exp.keyword.z.zd:{
 show "Example: .z.zd - compression/encryption defaults";
 show .kdb.desc.func.z.zd;
 show ".z.zd:(lbs;alg;lvl)";
 show ".z.zd:17 2 6        / set zip defaults";
 show "system \"x .z.zd\"  / clear zip defaults";
 };

// .kdb.exp.keyword.z.T[]
.kdb.exp.keyword.z.T:{
 show "Example: .z.T - time short cuts";
 show .kdb.desc.func.z.T;
 show ".z.T";
 show .z.T;
 show ".z.t";
 show .z.t;
 };