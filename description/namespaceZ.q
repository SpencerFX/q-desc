// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of .z namespace utilities.

// Author: Spencer
//==========================================================
.kdb.desc.func.z.a:""
.kdb.desc.func.z.ac:""
.kdb.desc.func.z.b:""
.kdb.desc.func.z.bm:""
.kdb.desc.func.z.c:""
.kdb.desc.func.z.e:""
.kdb.desc.func.z.ex:""
.kdb.desc.func.z.exit:""
.kdb.desc.func.z.ey:""
.kdb.desc.func.z.f:""
.kdb.desc.func.z.H:""
.kdb.desc.func.z.h:""
.kdb.desc.func.z.i:""
.kdb.desc.func.z.K:""
.kdb.desc.func.z.k:""
.kdb.desc.func.z.l:""
.kdb.desc.func.z.N:""
.kdb.desc.func.z.n:""
.kdb.desc.func.z.o:""
.kdb.desc.func.z.P:""
.kdb.desc.func.z.p:""
.kdb.desc.func.z.pc:"The parameter is the handle of the connection which has been closed. The default behaviour is to do nothing. When this is invoked the connection has already been closed so .z.a, .z.u and.z.w are all local values. However, the argument passed to .z.pc is the connection handle that was being used before the connection was closed. This can be useful for cleaning up log tables."
.kdb.desc.func.z.pd:""
.kdb.desc.func.z.pg:"The parameter is the incoming request. The default behaviour is to evaluate the expression.Example usage would be to restrict access to certain users, or to log incoming calls. It can also be useful for debugging purposes, to see exactly what calls are coming into the database, e.g."
.kdb.desc.func.z.ph:"This is the only message handler with a default definition. The parameter is the string sent from the web browser.";
.kdb.desc.func.z.pi:"The parameter is the incoming command and the default behaviour is to value the input. This is invoked when calls are made from the q console. This message handler is really for completeness, so it is possible to log all calls which have been executed on a process.";
.kdb.desc.func.z.pm:""
.kdb.desc.func.z.po:"The parameter is the handle of the incoming connection request. At this point, as far as the client is concerned, the connection has already been successful. The server could still close the connection using hclose but the connection open command in the client would still complete successfully and return a connection handle.";
.kdb.desc.func.z.pp:"This is undefined by default, but can be redefined to handle http post messages.";
.kdb.desc.func.z.pq:""
.kdb.desc.func.z.ps:""
.kdb.desc.func.z.pw:"This is a hook for connecting to external validation services, and should return a boolean result. The parameters to it are the username and password supplied by the incoming call. When a new request comes in, a call can be made to an external system and return the permissions of the incoming user. Then .z.pw should return true or false and the kdb+ process will accept or reject the connection accordingly. The default implementation is:";
.kdb.desc.func.z.q:""
.kdb.desc.func.z.r:""
.kdb.desc.func.z.s:""
.kdb.desc.func.z.ts:""
.kdb.desc.func.z.u:"the username of the calling process.";
.kdb.desc.func.z.vs:""
.kdb.desc.func.z.W:""
.kdb.desc.func.z.w:""
.kdb.desc.func.z.wc:""
.kdb.desc.func.z.wo:""
.kdb.desc.func.z.ws:""
.kdb.desc.func.z.X:""
.kdb.desc.func.z.x:""
.kdb.desc.func.z.Z:""
.kdb.desc.func.z.z:""
.kdb.desc.func.z..zd:""
.kdb.desc.func.z.T:""