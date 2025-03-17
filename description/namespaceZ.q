// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of .z namespace utilities.

// Author: Spencer
//==========================================================
.kdb.desc.func.z.a:"IP address - theip address asa 32-bit integer. When invoked inside a .z.p* callback via a TCP/IP connection, it is the IP address of the client session, not the current session. For example, connecting from a remote machine. When invoked via a Unix Domain Socket, it is 0.";
.kdb.desc.func.z.ac:"HTTP auth - .z.ac:(requestText;requestHeaderAsDictionary) - Lets you define custom code to authorize/authenticate an hhtp request, e.g. inspect HTTP headers representing oauth tokens, cookies, etc. Your custom code can then return different values based on what is discovered. .z.ac is a unary function, whose single parameter is a two-element list providing the request text and header. The function should return a two-element list. The list of possible return values is: (0;quotes) - User not authorized. Client is sent default 401 HTTP unauthorized response. An HTTP callback to handle the request will not be called. (1;username in quotes) - The provided username is used to set .z.u. The relevant HTTP callback to handle this request will be allowed. (2;response text) - The custom response to be sent should be provided in the response text section. The response text should be comprised of a valid HTTP response message, for example a 401 response with a customised message. An HTTP callback to handle the original request is not called. (4;empty quotes) - Fallback to basic access authentication, where the username/password are base64 decoded and processed via the -u/-U file and .z.pw (if defined). If the user is not permitted, the client is sent a default 401 HTTP unauthorized response. Since V4.0 2021.07.12.";
.kdb.desc.func.z.b:"view dependencies - The dependency dictionary. q)a::x+y q)b::x+1 q).z.b x| `a`b y| ,`a";
.kdb.desc.func.z.bm:"msg validator - .z.bm:x - where x is a unary function. kdb+ before V2.7 was sensitive to being fed malformed data structures, sometimes resulting in a crash, but now validates incoming IPC messages to check that data structures are well formed, reporting 'badmsg and disconnecting senders of malformed data structures. The raw message is captured for analysis via the callback .z.bm. The sequence upon receiving such a message is - calls .z.bm with a 2-item list: (handle;msgBytes), close the handle and call .z.pc, signals 'badmsg, E.g. with the callback defined. after a bad msg has been received, the global var msg will contain the timestamp, the handle and the full message. Note that this check validates only the data structures, it cannot validate the data itself.";
.kdb.desc.func.z.c:"cores - the number of physical cores.";
.kdb.desc.func.z.e:"tls connection status - TLS details used with a connection handle. Returns an empty dictionary if the connection is not TLS enabled. E.g. where h is a connection handle.";
.kdb.desc.func.z.ex:"failed primitive - In a debugger session, .z.ex is set to the failed primitive.";
.kdb.desc.func.z.exit:"action on exit - .z.edit:f - Where f is a unary function, f is called with the exit parameter as the argument just before exiting the kdb+ session. The exit parameter is the argument to the exit function, or 0 if manual exit with double backslash quit. The default behavior is equivalent to setting .z.exit to {}, i.e. do nothing. If the exit behavior has an error (disk full for example if exit tries to save the current state), the session is suspended and exits after completion or manual exit from the suspension.";
.kdb.desc.func.z.ey:"argument to a failed primitive - In a debugger session, .z.ey is set to the argument to failed primitive.";
.kdb.desc.func.z.f:"file - name of the q script as a symbol.";
.kdb.desc.func.z.H:"active sockets - Active sockets as a list. List has a sorted attribute applied since version 4.1";
.kdb.desc.func.z.h:"host - the host name as a symbol. On Linux this should return the same as the shell command hostname. If you require a fully qualified domain name, and the hostname command returns a hostname only, this should be resolved by your system administrators.";
.kdb.desc.func.z.i:"PID - the process ID as an integer.";
.kdb.desc.func.z.K:"version - the major version number as a flot of the version of kdb+ being used.";
.kdb.desc.func.z.k:"release data - date on which the version of kdb+ being used was released.";
.kdb.desc.func.z.l:"License information as a list of strings; () for non-commercial 32-bit versions. bannerText is the custom text displayed at startup, and always contains the license number as the last token.";
.kdb.desc.func.z.N:"local timespan - System local time as timespan in nanoseconds.";
.kdb.desc.func.z.n:"UTC timespan - System UTC time as timespan in nanoseconds.";
.kdb.desc.func.z.o:"OS version - kdb+ operating system version as a symbol.";
.kdb.desc.func.z.P:"local timestamp - System localtime timestamp in nanoseconds. ";
.kdb.desc.func.z.p:"UTC timestamp - UTC timestamp in nanoseconds.";
.kdb.desc.func.z.pc:"The parameter is the handle of the connection which has been closed. The default behaviour is to do nothing. When this is invoked the connection has already been closed so .z.a, .z.u and.z.w are all local values. However, the argument passed to .z.pc is the connection handle that was being used before the connection was closed. This can be useful for cleaning up log tables. To allow you to clean up things like tables of users keyed by handle, the handle that was being used is passed as a parameter to .z.pc";
.kdb.desc.func.z.pd:"peach handles - .z.pd: x - Where q has been started with secondary processes for use in parallel processing, x is an int vector of handles to secondary processes a function that returns a list of handles to those secondary processes. For evaluating the function passed to peach or ':, kdb+ gets the handles to the secondary processes by calling .z.pd[]. The int vector (returned by) x must have the unique attribute set.";
.kdb.desc.func.z.pg:"The parameter is the incoming request. The default behaviour is to evaluate the expression.Example usage would be to restrict access to certain users, or to log incoming calls. It can also be useful for debugging purposes, to see exactly what calls are coming into the database, e.g."
.kdb.desc.func.z.ph:"This is the only message handler with a default definition. The parameter is the string sent from the web browser.";
.kdb.desc.func.z.pi:"The parameter is the incoming command and the default behaviour is to value the input. This is invoked when calls are made from the q console. This message handler is really for completeness, so it is possible to log all calls which have been executed on a process.";
.kdb.desc.func.z.pm:"";
.kdb.desc.func.z.po:"The parameter is the handle of the incoming connection request. At this point, as far as the client is concerned, the connection has already been successful. The server could still close the connection using hclose but the connection open command in the client would still complete successfully and return a connection handle.";
.kdb.desc.func.z.pp:"This is undefined by default, but can be redefined to handle http post messages.";
.kdb.desc.func.z.pq:"qcon - Remote connections using the qcon text protocol are routed to .z.pq, which defaults to calling .z.pi. (Since V3.5+3.6 2019.01.31.)";
.kdb.desc.func.z.ps:"set - Where f is a unary function, .z.ps is evaluated with the object that is passed to this kdb+ session via an asynchronous request. The return value is discarded. .z.ps can be unset with \x .z.ps, which restores the default behavior. The default behavior is equivalent to setting .z.ps to value. Note that .z.ps is used in preference to .z.pg when messages are sent to the local process using handle 0.";
.kdb.desc.func.z.pw:"This is a hook for connecting to external validation services, and should return a boolean result. The parameters to it are the username and password supplied by the incoming call. When a new request comes in, a call can be made to an external system and return the permissions of the incoming user. Then .z.pw should return true or false and the kdb+ process will accept or reject the connection accordingly. The default implementation is:";
.kdb.desc.func.z.q:"";
.kdb.desc.func.z.r:"";
.kdb.desc.func.z.s:"";
.kdb.desc.func.z.ts:"";
.kdb.desc.func.z.u:"the username of the calling process.";
.kdb.desc.func.z.vs:"";
.kdb.desc.func.z.W:"";
.kdb.desc.func.z.w:"";
.kdb.desc.func.z.wc:"";
.kdb.desc.func.z.wo:"";
.kdb.desc.func.z.ws:"";
.kdb.desc.func.z.X:"";
.kdb.desc.func.z.x:"";
.kdb.desc.func.z.Z:"";
.kdb.desc.func.z.z:"";
.kdb.desc.func.z..zd:"";
.kdb.desc.func.z.T:"";