// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different error messages

// Author: Spencer
//==========================================================
.kdb.desc.errors.x:"'x - Referencing a variable that has not been instantiated (value error)";

.kdb.desc.errors.access:"'access - Accessing a protected -u database without a valid username or password";;

.kdb.desc.errors.assign:"'assign - Assigning a user defined function or variable to a reserved word";

.kdb.desc.errors.branch:"'branch - Running too many statements in a do/if/while statement";

.kdb.desc.errors.cant_:"'can't_ - Encrypting script in a non-commercial version of kdb+";

.kdb.desc.errors.cast:"'cast - Enumerating a value not in the enumeration domain";

.kdb.desc.errors.char:"'char - Creating an invalid character or list of characters";

.kdb.desc.errors.conn:"'conn - Too many open connections";

.kdb.desc.errors.constants:"'constants - Using moe than 96 constants";

.kdb.desc.errors.cores:"'cores - Using more cores than are available for the license";

.kdb.desc.errors.cpu:"'cpu - Utilizing more cpus than are available for the license";

.kdb.desc.errors.domain:"'domain - Accessing a value that is out of the domain";

.kdb.desc.errors.elim:"'elim - Creating more than max permitted enumerations";

.kdb.desc.errors.exp:"'exp - Using kdb+ license after expiry date has passed";

.kdb.desc.errors.from:"'from - Executing a badly formed select statement";

.kdb.desc.errors.glim:"'glim - Apply g# attribute more than max permitted times";

.kdb.desc.errors.globals:"'globals - Utilizing more than 31 global variables";

.kdb.desc.errors.host:"'host - Running kdb+ on a host not permitted by the license";

.kdb.desc.errors.insert:"'insert - Inserting a record with an existing key into a keyed table";

.kdb.desc.errors.k4:"'k4.lic - k4.lic file not found check QHOME/QLIC";

.kdb.desc.errors.length:"'length - Operation with incompatible lengths";

.kdb.desc.errors.limit:"'limit - Gerating a list longer than two billion or a serialized object greater than 2GB";

.kdb.desc.errors.locals:"'locals - Utilizing more than 26 local variables";

.kdb.desc.errors.loop:"'loop - Creating a dependency loop";

.kdb.desc.errors.mismatch:"'mismatch - columns that can't be aligned for R,R or K,K";

.kdb.desc.errors.Mlim:"'Mlim - Too many nested columns in splayed tables";

.kdb.desc.errors.mq:"'mq - Multi-threading not allowed";

.kdb.desc.errors.noamend:"'noamend - Performing global amend from within an amend";

.kdb.desc.errors.noupdate:"'noupdate - Updating blocked from the command line -b or updating from a non-main thread";

.kdb.desc.errors.nyi:"'nyi - Not yet implemented";

.kdb.desc.errors.os:"'os - Operating system error or wrong os (if license error)";

.kdb.desc.errors.params:"'params - Using more than 8 parameters in a function. Use a dictionary or array as a workaround";

.kdb.desc.errors.par:"'par - Attempting to update a partitioned table";

.kdb.desc.errors.parse:"'parse - Invalid syntax";

.kdb.desc.errors.part:"'part - Error with partitioned database";

.kdb.desc.errors.pwuid:"'pwuid - Missing libraries for getpwuid. Likely due to a 32bit app on a 64bit machine";

.kdb.desc.errors.Q7:"'Q7 - nyi op on file nested array";

.kdb.desc.errors.rank:"'rank - Applying too many arguments to a function";

.kdb.desc.errors.s_fail:"'s-fail - Aply the sorted attribute to an unsorted list or loading a databse when enum target has not been loaded yet";

.kdb.desc.errors.splay:"'splay - nyi operation on a splayed table";

.kdb.desc.errors.srv:"'srv - Using client-only license in server mode";

.kdb.desc.errors.stack:"'stack - Exhausting of stack space";

.kdb.desc.errors.step:"'step - Upserting on a dictionary with sorted keys (step dictionary)";

.kdb.desc.errors.stop:"'stop - Interrupting using ctrl-c or time limit (-T)";

.kdb.desc.errors.stype:"'stype - Using a signal with an incorrect type";

.kdb.desc.errors.sys:"'sys - Calling a system command from any thread that is not the main thread";

.kdb.desc.errors.threadview:"'threadview - Calculating a vew from a thread that is not the main thread. Only cached results can be used on other threads";

.kdb.desc.errors.type:"'type - Using an argument of wrong datatype";

.kdb.desc.errors.u:"'u-fail - Setting unique attribute on non-unique data";

.kdb.desc.errors.upd:"'upd - The update date in your license is fore the date of the current q version";

.kdb.desc.errors.user:"'user - Unlicensed user";

.kdb.desc.errors.unmappable:"'unmappable - Saving partitioned data with unmappable columns";

.kdb.desc.errors.utf8:"'utf8 - Using text in a websocket that is not UTF8 encoded";

.kdb.desc.errors.vd1:"'vd1 - Attempted multithread update";

.kdb.desc.errors.view:"'view - Re-assigning a view";

.kdb.desc.errors.wha:"'wha - Invalid system date";

.kdb.desc.errors.wsfull:"'wsfull - Workspace full - out of memory";