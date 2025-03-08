// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of all major functions and utilities in string format

// Author: Spencer
//==========================================================
.kdb.desc.args.b:"Block write-access to a kdb+ database, for any handle context (.z.w) other than 0. Blocks hdel keyword (since V4.1t 2021.10.13, V4.0 2023.08.11). Blocks hopen of a file (since 4.1t 2021.10.13, 4.0 2023.08.11)";

.kdb.desc.args.c:"Set console maximum rows and columns, default 25 80.";

.kdb.desc.args.C:"Set HTTP display maximum rows and columns.";

.kdb.desc.args.e:"Sets error-trapping mode. The default is 0 (off).";

.kdb.desc.args.E:"TLS Server Mode";

.kdb.desc.args.g:"Show or set garbage-collection mode. The default mode is 0 (deferred). Setting the garbage-collection mode will automatically call .Q.gc[] after setting the provided value. Q manages its own thread-local heap. Objects in q use reference counting. As soon as there are no references to an object, its memory is eligable to be returned to the heap. 0 (deferred): Returns memory to the thread-local heap. Will subsequently return memory to the OS when either .Q.gc[] is called or an allocation fails, hence has a performance advantage, but can be more difficult to dimension or manage memory requirements. 1 (immediate): As memory is returned to the thread-local heap, if the object is ≥64MB then the memory is returned to the OS instead. This has an associated performance overhead. As per defered mode, memory used by the heap may be subsequently returned to the OS when either .Q.gc[] is called or an allocation fails. When q is denied additional address space from the OS, it invokes .Q.gc[] and retries the request to the OS. If the subsequent attempt fail, the request exits with 'wsfull.";

.kdb.desc.args.l:"The command line arguments -l and -L are used to enable logging.";

.kdb.desc.args.L:"As -l, but sync logging.";

.kdb.desc.args.m:"Memory can be backed by a filesystem, allowing use of DAX-enabled filesystems (e.g. AppDirect) as a non-persistent memory extension for kdb+. This command-line option directs kdb+ to use the filesystem path specified as a separate memory domain. This splits every thread’s heap into two:";

.kdb.desc.args.o:"Sets local time offset as N hours from UTC, or minutes if abs[N]>23 (Affects .z.Z)";

.kdb.desc.args.p:"Open up a port on startup";

.kdb.desc.args.P:"Display precision for floating-point numbers, i.e. the number of digits shown.";

.kdb.desc.args.q:"Quiet, i.e. no startup banner text or session prompts. Typically used where no console is required.";

.kdb.desc.args.r:"Replicate from :host:port.";

.kdb.desc.args.s:"Number of secondary threads or processes available for parallel processing.";

.kdb.desc.args.S:"Sets N as value of random seed.";

.kdb.desc.args.T:"Timeout in seconds for client queries, i.e. maximum time a client call will execute. Default is 0, for no timeout.";

.kdb.desc.args.u:"Enables user/password authentication for ipc";

.kdb.desc.args.U:"sets a password file, disables \x (even on the local console). The password file is a text file with one credential on each line. (No trailing blank line/s.)";

.kdb.desc.args.w:"Workspace limit in MB for the heap across threads for memory domain 0. Default is 0: no limit.";

.kdb.desc.args.W:"Set the start-of-week offset, where 0 is Saturday. The default is 2, i.e Monday.";

.kdb.desc.args.z:"Set the format for "D"$ date parsing: 0 for mm/dd/yyyy and 1 for dd/mm/yyyy.";

.kdb.desc.tables.flatFile:"They are fully loaded into memory, that is why their size (memory footprint) should be small. Small size/configuration/keyed tables are suited for this type of table.";

.kdb.desc.tables.splayedTables:"They are not loaded into memory but their columns (which are files on disk) are mmap-ed on demand when a query is executed against them. Their structure is suitable when queries don’t touch all their columns, but only a restricted set, so only a sub set of files are accessed and loaded into memory. Medium size tables are suitable for this table type. Also the ones that can’t be partitioned according to the database partition rule.";

.kdb.desc.tables.partitions:"They are special directories that contain tables split by a certain criteria. Partitions can only be of the following type: date, month, year, int. The partition type is determined from the partition name format: eg 2008.06.10 – the type is date, 2008.06 – the type is month, 2008 the type is year, 25 - the type is type. One database can contain only one partition type at a time. Each table in a partition will have an extra virtual column with the same type and name as the partition type, and as value the partition name.";

.kdb.desc.tables.sym:"The sym file is a kdb+ binary file containing the list of symbols from all splayed and partitioned tables. During the enumeration process, all columns of symbol type are converted to enumerations against the sym file, after new symbols are added to the sym file. Therefore the sym file contains a list of unique values. Being a kdb+ binary file, it can be read with get:";

.kdb.desc.func.minus1Bang:"Prepends a colon to the start of a symbol if it is not there already. This resulting symbol can be used to create a file handle e.g."

.kdb.desc.func.minus2Bang:"Will return any attributes associated to the argument."

.kdb.desc.func.minus3Bang:"This will return a string representation of the argument."

.kdb.desc.func.minus5Bang:"-5! will return the functional representation of argument e.g."

.kdb.desc.func.minus6Bang:"Evaluates the functional form of query. This is the same as the function eval e.g."

.kdb.desc.func.minus7Bang:"Argument is a file location. This function will return the size of the file in bytes."

.kdb.desc.func.minus8Bang:"Returns the byte representation of a string. E.g.";

.kdb.desc.func.minus9Bang:"Restores the string above when the byte representation is used as the argument. E.g.";

.kdb.desc.func.minus11Bang:"Used for streaming executions of a file. This function is can be used in three ways:";

.kdb.desc.func.minus12Bang:"Returns the hostname for a given ip address in integer format e.g.";

.kdb.desc.func.minus13Bang:"Returns the ip address for a given hostname symbol";

.kdb.desc.func.minus15Bang:"Runs md5 encryption on a string e.g.";

.kdb.desc.func.minus16Bang:"Provides the reference count on that object:";

.kdb.desc.func.Q.A:"upper-case alphabet";

.kdb.desc.func.Q.a:"lower-case alphabet";

.kdb.desc.func.Q.an:"lower-case alphabet and numerics";

.kdb.desc.func.Q.addmonths:"Where x is a date and y is an int, returns x plus y months.If the date x is near the end of the month and (x.month + y)’s month has fewer days than x.month, the result may spill over to the following month.";

.kdb.desc.func.Q.addr:"Where x is a hostname or IP address as a symbol atom, returns the IP address as an integer (same format as .z.a)";

.kdb.desc.func.Q.b6:"Returns upper- and lower-case alphabet and numerics. Used for binhex encoding and decoding.";

.kdb.desc.func.Q.bt:"Dumps the backtrace to stdout at any point during execution or debug.>> marks the current stack frame. (Since V4.0 2020.03.23.)";

.kdb.desc.func.Q.btoa:"This converts a string to b64 encode";

.kdb.desc.func.Q.bv:"In partitioned DBs, construct the dictionary .Q.vp of table schemas for tables with missing partitions. Optionally allow tables to be missing from partitions, by scanning partitions for missing tables and taking the tables’ prototypes from the last partition. After loading/re-loading from the filesystem, invoke .Q.bv[] to (re)populate .Q.vt/.Q.vp, which are used inside .Q.p1 during the partitioned select .Q.ps. (Since V2.8 2012.01.20, modified V3.0 2012.01.26). If your table exists at least in the latest partition (so there is a prototype for the schema), you could use .Q.bv[] to create empty tables on the fly at run-time without having to create those empties on disk. .Q.bv[`] (with argument) will use prototype from first partition instead of last. (Since V3.2 2014.08.22.)";

.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:
.kdb.desc.func.Q.:

.kdb.desc.func.Q.en:"The function is used to enumerate a table:";

.kdb.desc.func.Q.dpft:"Used to save a table in a partition (in a kdb+ tick setup this is done from the realtime database):";

.kdb.desc.func.Q.chk:"Used to create empty tables (respecting the schema) in partitions where tables are missing:"

.kdb.desc.func.z.ps:".z.ps[] (process-set) is the equivalent handler for asynchronous messages.";

.kdb.desc.func.z.pw:"This is a hook for connecting to external validation services, and should return a boolean result. The parameters to it are the username and password supplied by the incoming call. When a new request comes in, a call can be made to an external system and return the permissions of the incoming user. Then .z.pw should return true or false and the kdb+ process will accept or reject the connection accordingly. The default implementation is:";

.kdb.desc.func.z.po:"The parameter is the handle of the incoming connection request. At this point, as far as the client is concerned, the connection has already been successful. The server could still close the connection using hclose but the connection open command in the client would still complete successfully and return a connection handle.";

.kdb.desc.func.z.pg:"The parameter is the incoming request. The default behaviour is to evaluate the expression.Example usage would be to restrict access to certain users, or to log incoming calls. It can also be useful for debugging purposes, to see exactly what calls are coming into the database, e.g."

.kdb.desc.func.z.pi:"The parameter is the incoming command and the default behaviour is to value the input. This is invoked when calls are made from the q console. This message handler is really for completeness, so it is possible to log all calls which have been executed on a process.";

.kdb.desc.func.z.pc:"The parameter is the handle of the connection which has been closed. The default behaviour is to do nothing. When this is invoked the connection has already been closed so .z.a, .z.u and.z.w are all local values. However, the argument passed to .z.pc is the connection handle that was being used before the connection was closed. This can be useful for cleaning up log tables."

.kdb.desc.func.z.ph:"This is the only message handler with a default definition. The parameter is the string sent from the web browser.";

.kdb.desc.func.z.pp:"This is undefined by default, but can be redefined to handle http post messages.";

.kdb.desc.func.z.a:"the ip-address of the calling process.";

.kdb.desc.func.z.h:"the hostname of the calling process.";

.kdb.desc.func.z.u:"the username of the calling process.";

.kdb.desc.func.z.w:"the integer handle of the calling process.";

.kdb.desc.joins.pj:"Again an example of a left outer join which will return all rows from the source table, looking up any common columns and summing their values. If the lookup column does not exist in the table for a particular to then the values are zero filled.";

.kdb.desc.joins.aj:"As the name may suggest it is mainly used to join columns with reference to time. It will return each row of the source table and any rows in the second table which have an entry before or at the same time based on the “key columns”.";

.kdb.desc.joins.uj:"The union join is a vertical join of columns in contrast to the ij and lj previously mentioned.";

.kdb.desc.joins.lj:"The left join is used to perform lookups on a keyed table. The joined columns do not have to have an entry in the lookup table.";

.kdb.desc.joins.ij:"The simplest type of join which returns all rows in the source table which have an entry in the lookup table.";

.kdb.desc.joins.comma:"Using , with two unkeyed tables appends/inserts the data into the first table, and can be thought of as a vertical join of columns rather than the traditional lateral join of rows.";

.kdb.desc.iterators.each:"Apply a value item-wise to a dictionary, list, or conforming lists and/or dictionaries. Where v is an applicable value, v' applies v to each item of a list, dictionary or to corresponding items of conforming lists. The derived function has the same rank as v. Each applied to a binary value is sometimes called each both and can be applied infix. Iterations of ternary and higher-rank values are applied with brackets.";

.kdb.desc.iterators.eachLeft:"Apply a binary value between one argument and each item of the other. The maps Each Left and Each Right take binary values and derive binary functions that pair one argument to each item of the other. Effectively, the map projects its value on one argument and applies Each.";

.kdb.desc.iterators.eachRight:"Apply a binary value between one argument and each item of the other. The maps Each Left and Each Right take binary values and derive binary functions that pair one argument to each item of the other. Effectively, the map projects its value on one argument and applies Each.";

.kdb.desc.iterators.cross:"Each Left combined with Each Right resembles the result obtained by cross.";

.kdb.desc.iterators.eachParallel:"Assign sublists of the argument list to secondary tasks, in which the unary value is applied to each item of the sublist. The Each Parallel map takes a unary value as argument and derives a unary function. The iteration v1': divides its list or dictionary argument x between available secondary tasks. Each secondary task applies v1 to each item of its sublist.";

.kdb.desc.iterators.peach:"The binary keyword peach can be used as a mnemonic alternative. The following are equivalent.";

.kdb.desc.iterators.eachPrior:"Each prior ': modifies a dyadic function but it creates a monadic function. This new function applies the underlying function to each adjacent pair of items in a list. The function is uniform on its argument by pre-pending the first element of the input to the output."

.kdb.desc.iterators.case:"Pick successive items from multiple list arguments: the left argument of the iterator determines from which of the arguments each item is picked. The derived function int' has rank max[int]+1. Atom arguments are treated as infinitely-repeated values.";

