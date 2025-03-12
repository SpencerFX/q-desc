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

.kdb.desc.func.minus1Bang:"Prepends a colon to the start of a symbol if it is not there already. This resulting symbol can be used to create a file handle e.g.";

.kdb.desc.func.minus2Bang:"Will return any attributes associated to the argument.";

.kdb.desc.func.minus3Bang:"This will return a string representation of the argument.";

.kdb.desc.func.minus5Bang:"-5! will return the functional representation of argument e.g.";

.kdb.desc.func.minus6Bang:"Evaluates the functional form of query. This is the same as the function eval e.g.";

.kdb.desc.func.minus7Bang:"Argument is a file location. This function will return the size of the file in bytes.";

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

.kdb.desc.func.Q.bvi:"It offers the same functionality as .Q.bv, but scans only new partitions loaded in the hdb since the last time .Q.bv or .Q.bvi was run. Since v4.1 2024.09.13.";

.kdb.desc.func.Q.Cf:"create empty nested char file) - Deprecated since 4.1t 2022.03.25. Using resulting files could return file format errors since 3.6.";

.kdb.desc.func.Q.chk:"fill HDB - Where x is a HDB as a filepath, fills tables missing from partitions using the most recent partition as a template, and reports which partitions (but not which tables) it is fixing.";

.kdb.desc.func.Q.cn:"(count partitioned table) - Where x is a partitioned table, passed by value, returns its count. Populates .Q.pn cache.";

.kdb.desc.func.Q.D:"In segmented DBs, contains a list of the partitions – conformant to .Q.P – that are present in each segment. .Q.P!.Q.D can be used to create a dictionary of partition-to-segment information.";

.kdb.desc.func.Q.dd:"(join symbols) - Shorthand for ` sv x,`$string y. Useful for creating filepaths, suffixed stock symbols, etc."

.kdb.desc.func.Q.def:"(command defaults) - Default values and type checks for command-line arguments parsed with .Q.opt. Where x is a dictionary of default parameter names and values, and y is the output of .Q.opt. Types are inferred from the default values provided, which must be an atom type.";

.kdb.desc.func.Q.dpft:"Used to save a table in a partition (in a kdb+ tick setup this is done from the realtime database):";

.kdb.desc.func.Q.dpfts:"Used to save a table in a partition (in a kdb+ tick setup this is done from the realtime database). Used with symtable";

.kdb.desc.func.Q.dpt:"dpt save table unsorted";

.kdb.desc.func.Q.dpts:"save table unsorted with symtable";

.kdb.desc.func.Q.en:"The function is used to enumerate a table:";

.kdb.desc.func.Q.ens:" Enumerage against domain. .Q.ens[dir;table;name]. Where dir is a symbol handle to a folder, table is a table, name is a symbol atom naming a sym file in dir. The function: creates if necessary the folder dir, gets sym from dir if it exists, enumerates against sym the symbols in table, writes sym in dir, returns table with columns enumerated (for .Q.ens, against name). .Q.ens allows enumeration against domains (and therefore filenames) other than sym. Tables splayed across a directory must be fully enumerated and not keyed. The solution is to enumerate columns of type varchar before saving the table splayed.";

.kdb.desc.func.Q.f:"Precision format - .Q.f[x;y] -  Where x is an int atom, y is a numeric atom, returns y as a string formatted as a float to x decimal places. Because of the limits of precision in a double, for y above 1e13 or the limit set by P, formats in scientific notation.";

.kdb.desc.func.Q.fc:"parallel on cut - .Q.fc[x;y] - Where x is is a unary atomic function, y is a list, and returns the result of evaluating f vec – using multiple threads if possible. (Since V2.6)";

.kdb.desc.func.Q.ff:"append columns - x is a table to modify and y is a table of columns to add to x and set to null. Returns x, with all new columns in y, with values in new columns set to null of the appropriate type.If there is a common column in x and y, the column from x is kept (i.e. it will not null any columns that exist in x).";

.kdb.desc.func.Q.fk.:"foreign key - where x is a table column, returns ` if the column is not a foreign key or `tab if the column is a foreign key into tab.";

.kdb.desc.func.Q.fmt:"precision format - where x and y are integer atoms and z is a numerica atom, returns z as a string of length x formatted y decimal places.";

.kdb.desc.func.Q.fpn:"pipe streaming";

.kdb.desc.func.Q.fps:"pipe streaming - where x is a unary function, y is a filepath to a fifo (named pipe) and z is an integer. Reads z-sized lumps of complete "\n" delimited records from a pipe and applies a function to each record. This enables you to implement a streaming algorithm for various purposes such as converting a large compressed CSV file into an on-disk kdb+ database without holding the data in memory all at once or using disk space required for the uncompressed file.";

.kdb.desc.func.Q.fs:"file streaming";

.kdb.desc.func.Q.fsn:"file streaming - where x is a unary function, y is a filepath, z is an integer. loops over file y, grabs z-sized lumps of complete "\n" delimited records, applies x to each record, and returns the size of the file as given by hcount. This enables you to implement a streaming algorithm to convert a large CSV file into an on-disk database without holding the data in memory all at once. .Q.fsn is almost identical to .Q.fs but takes an extra argument z, the size in bytes that chunks will be read in. This is particularly useful for balancing load speed and RAM usage.";

.kdb.desc.func.Q.ft:"apply simple - where y is a keyed table, x is a unary function x[t]. As an example, note that you can index into a simple table with row indices, but not into a keyed table – for that you should use a select statement. However, to illustrate the method, we show an indexing function being applied to a keyed table. Now create an indexing function, and wrap it in .Q.ft. This works on both types of table:";

.kdb.desc.func.Q.fu:"apply unique - Where x is a unary function and y is a list, returns x[y] after evaluating x only on distinct items of y, not a list, returns x[y]. .Q.fu applies x to the distinct items of y. Where for any index i, the result of x y i depends on no other item of y, then .Q.fu works as intended. Where this is not so, the result is unlikely to be expected or useful.";

.kdb.desc.func.Q.gc:"garbage collect - Run garbage-collection and returns the amount of memory that was returned to the OS. It attempts to coalesce pieces of the heap into their original allocation units and returns any units ≥64MB to the OS. Refer to \g (garbage collection mode) for details on how memory is created on the heap. When secondary threads are configured and .Q.gc[] is invoked in the main thread, .Q.gc[] is automatically invoked in each secondary thread. If the call is instigated in a secondary thread, it affects that thread’s local heap only. Example of garbage collection in the default deferred mode, using .Q.w[] to view memory stats:";

.kdb.desc.func.Q.gz:"gzip - .Q.gz[::] zlib loaded, .Q.gz cbv (unzipped), .Q.gz (cl;cbv) (zipped). Where cbv is a char vector (or byte vector since 4.1t 2021.09.03,4.0 2021.10.01). cl is compression level [1-9] as a long returns, for the general null, a boolean atom as whether Zlib is loaded. cbv, the inflated (unzipped) vector a 2-list, the deflated (zipped) vector";

.kdb.desc.func.Q.hdpf:"hdpf (save tables) - The function: saves all tables to disk, by calling .Q.dpft  (saves as splayed tables to a partition), clears in-memory tables, sends reload message to HDB, by opening a temporary connection and sending \l .";

.kdb.desc.func.Q.hg:"http get - Where x is a URL as a symbol atom or (since V3.6 2018.02.10) a string, returns a string for the result of an HTTP[S] GET query. (Since V3.4)";

.kdb.desc.func.Q.host:"ip to hostname - where x is an IP address as an int atom, returns its hostname as a symbol atom";

.kdb.desc.func.Q.hp:"http post - where x is a url as a symbol handle or string, y is a MIME type as a string, z is a the POST query as a string. Returns a string for the result of an HTTP[S] POST query. (Since V3.4)";

.kdb.desc.func.Q.id:"sanitize - where x is a symbol atom, returns x with items sanitized to valid q names, a table, returns x with column names sanitized by removing characters that interfere with select/exec/update and adding string 1 to column names which clash with commands in the .q namespace. Updated in V3.2 to include .Q.res for checking collisions. A dictionary (since v4.1 2024.09.13), supports the same rules as table above. Table processing also has additional logic to cater for duplicate column names (names are now appended with 1,2,etc. when matched against previous columns) after applying previously defined rules.";

.kdb.desc.func.Q.ind:"partitioned index - where x is a partitioned table, y is a long int vector of row indexes into x, and returns rows y from x. When picking individual records from an in-memory table you can simply use the special virtual field i: select from table where i<100. But you cannot do that directly for a partitioned table. .Q.ind comes to the rescue here, it takes a table and indexes into the table – and returns the appropriate rows.";

.kdb.desc.func.Q.j10:"encode binhex - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer – maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched – but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.x10:"decode binhex - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer – maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched – but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.j12:"encode base-36 - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer – maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched – but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.x12:"decode base-36 - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer – maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched – but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.K:"version date";

.kdb.desc.func.Q.k:"Return the interpreter version date (.Q.K) and number (.Q.k) for which q.k has been written: checked against .z.K at startup."; 

.kdb.desc.func.Q.l:"load - where x is a symbol atom naming a directory in the current directory, loads it recursively as in load, but into the default namespace";

.kdb.desc.func.Q.ld:"load and group - exposes logic used by '\l to grou script liens for evaluation";

.kdb.desc.func.Q.li:"load partitions - in the current hdb, adds any partitions which are both in the list supplied and on disk. Partitions can be a list or atomic variable.";

.kdb.desc.func.Q.lo:"(load without) - .Q.lo[`database;cd;scripts]. Where database is a symbol atom, cd is a boolean flag indicating whether to add cd to the database dir. scripts is a boolean flag indicating whether to execute any scripts in the database dir";

.kdb.desc.func.Q.M:"(chunk size) - chunk size for dsftg or load-process-save";

.kdb.desc.func.Q.MAP:"(maps partitions) - Keeps partitions mapped to avoid the overhead of repeated file system calls during a select. (Since V3.1.), For use with partitioned HDBS, used in tandem with \l dir .Q.MAP currently has the following limitations: .Q.MAP does not work with linked columns, .Q.MAP does not work with virtual partition columns, use of .Q.MAP with compressed files is not recommended, as the uncompressed maps will be retained in memory";

.kdb.desc.func.Q.n:"(nums)";

.kdb.desc.func.Q.nA:"Strings: numerics (.Q.n) and upper-case alphabet and numerics (.Q.nA). .Q.nA is used for base-36 encoding and decoding.";

.kdb.desc.func.Q.opt:"(command parameters) - .Q.opt .z.x - Presents command-line arguments as a dictionary, using the output of .z.x. Defaults can be added using .Q.def.";

.kdb.desc.func.Q.P:"(segments) - In segmented DBs, returns a list of the segments (i.e. the contents of par.txt).";

.kdb.desc.func.Q.par:"(get expected partition location) - .Q.par[dir;part;table] - where dir is a directory filepath, and part is a date and returns the expected location of a table";

.kdb.desc.func.Q.PD:"(partiion locations) - In partitioned DBs, a list of partition locations - conformant to .Q.PV - which represents the partition location for each partition. (In non-segmented DBs, this will be simply count[.Q.PV]#`:..) .Q.PV!.Q.PD can be used to create a dictionary of partition-to-location information.";

.kdb.desc.func.Q.pd:"(modified partition locations) - In partitioned DBs, .Q.PD as modified by .Q.view.";

.kdb.desc.func.Q.pf:"(partition field) - In partitioned DBs, the partition field. Possible values are `date`month`year`int.";

.kdb.desc.func.Q.pn:"(partition counts) - In partitioned DBs, returns a dictionary of cached partition counts - conformant to .Q.pt, each conformant to .Q.pv - as populated by .Q.cn. .Q.pv!flip .Q.pn can be used to create a crosstab of table-to-partition-counts once .Q.pn is fully populated.";

.kdb.desc.func.Q.prf0:"(code profiler) - Where pid is a process ID, returns a table representing a snapshot of the call stack at the time of the call in another kdb+ process pid, with columns. The following is returned: name - assigned name of the function, file - path to the file containing the definition, line - line number of the definition, col - column offset of the definition, 0-based, text - function definition or source string, pos - execution position (caret) within text";

.kdb.desc.func.Q.pt:"(partitioned tables) - Returns a list of partitioned tables.";

.kdb.desc.func.Q.pv:"(modified partition value) - A list of the values of the partition domain: the values corresponding to the slice directories actually found in the root. In partitioned DBs, .Q.PV as modified by .Q.view.";

.kdb.desc.func.Q.PV:"(partition values) - In partitioned DBs, returns a list of partition values - conformant to .Q.PD - which represents the partition value for each partition. (In a date-partitioned DB, unless the date has been modified by .Q.view, this is simply date.)";

.kdb.desc.func.Q.qp:"(is partitioned) - Where x is a partitioned table, returns 1b, a splayed table, returns 0b, anything else, returns 0";

.kdb.desc.func.Q.t:"(is table) - .Q.qt x - Where x is a table, returns 1b, else 0b.";

.kdb.desc.func.Q.res:"(keywords) - Returns the control words and keywords as a symbol vector. key `.q returns the functions defined to extend k to the q language. Hence to get the full list of reserved words for the current version:";

.kdb.desc.func.Q.s:"(plain text) - Returns x formatted to plain text, as used by the console. Obeys console width and height set by \c.";

.kdb.desc.func.Q.s1:"(string representation) - Returns a string representation of x.";

.kdb.desc.func.Q.sbt:"(string backtrace) - Where x is a backtrace object returns it as a string formatted for display.";

.kdb.desc.func.Q.sha1:"(SHA-1 encode) - Where x is a string, returns as a bytestream its SHA-1 hash.";

.kdb.desc.func.Q.t:"(type letters) - List of chars indexed by datatype numbers.";

.kdb.desc.func.Q.trp:"(extend trap at) - .Q.trp[f;x;g] - Where f is a unary function x is its argument g is a binary function. extends Trap At (@[f;x;g]) to collect backtrace: g gets called with arguments: 1. the error string and 2. the backtrace object. You can format the backtrace object with .Q.sbt.";

.kdb.desc.func.Q.trpd:"(extend trap) - .Q.trpd[f;x;g] - Where f is a function of rank, x is an atom or list of count with items in the domains of f, g is a binary function. extends Trap (.[f;x;g]) to collect backtrace: g is called with arguments: the error string, the backtrace object";

.kdb.desc.func.Q.ts:"(time and space) - Apply, with time and space. .Q.ts[x;y] - Where x and y are valid arguments to Apply returns a 2-item list: time and space as ts would return the result of .[x;y]";

.kdb.desc.func.Q.ty:"(type) .Q.ty x - Where x is a list, returns the type of x as a character code: lower case for a vector, upper case for a list of uniform type, else blank";

.kdb.desc.func.Q.u:"(date based) .Q.u - In segmented DBs, returns 1b if each partition is uniquely found in one segment. (E.g., true if segmenting is date-based, false if name-based.). In partitioned DBs, returns 1b.";

.kdb.desc.func.Q.V:"(table to dict) - a table, returns a dictionary of its column values. a partitioned table, returns only the last partition (N.B. the partition field values themselves are not restricted to the last partition but include the whole range).";

.kdb.desc.func.Q.v:"(value) - Where x is a filepath, returns the splayed table stored at x,any other symbol, returns the global named x, anything else, returns x";

.kdb.desc.func.Q.view:"(subview) - Where x is a list of partition values that serves as a filter for all queries against any partitioned table in the database, x is added as a constraint in the first sub-phrase of the where-clause of every query. .Q.view is handy when you are executing queries against partitioned or segmented tables. Recall that multiple tables can share the partitioning. Q.view can guard against runaway queries that ask for all historical data.";

.kdb.desc.func.Q.vp:"(missing partitions) - In partitioned DBs, returns a dictionary of table schemas for tables with missing partitions, as populated by .Q.bv. (Since V3.0 2012.01.26.)";

.kdb.desc.func.Q.w:"(memory stats) - .Q.w[] - Returns the memory stats from \w into a more readable dictionary. Refer to \w for an explaination of each statistic.";

.kdb.desc.func.Q.Xf:"(create file) .Q.Xf[x;y]- Where x is a mapped nested datatype as either an upper-case char atom, or as a short symbol (e.g. `char), y is a filepath";

.kdb.desc.func.Q.x:"(non-command parameters) - Set by .Q.opt: a list of non-command parameters from the command line, where command parameters are prefixed by -.";

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

.kdb.desc.keywords.abs:"absolute value. A multithreaded primitive."

.kdb.desc.keywords.acos:"This is a unary funcation that returns the arcos (or inverse cosine) of x, with the result in radians.";

.kdb.desc.keywords.aj:"Generally this is used to get the prevailing quote one tablwe as of the time of the trade (other table). aj[`sym`time;trade;quote]";

.kdb.desc.keywords.aj0:"Same as the as of join except that the resulting time value is from the quote table instead of the boundary time from the trade table. aj0 returns the actual time from the second table.";

.kdb.desc.keywords.all:"This is an aggregate monadic function. The function returns boolean atomb 1b if all values in its argument are non-zero and 0b otherwise. The function all can be applied to any datatype except symbol by converting the type to boolean and then performing the operation.";

.kdb.desc.keywords.and:"These are respectively the restrictions of min, mand and not to bool arguments.";
.kdb.desc.keywords.any:"This is an aggregate monadic function. This function returns 1b if any value in its argument is non-zero and returns 0b if all values in its argument are 0";
.kdb.desc.keywords.asc:"This function sorts a list and applies `s# attribute. On homogenous lists, asc sorts the list in ascending order and applies the `s# attribute. On a mixed list, asc sorts values within datatype groups. On a dictionary, asc sorts by the values. On a table, asc sorts by the first unkeyed column and applies the sorted attribute to that column"
.kdb.desc.keywords.asin:
.kdb.desc.keywords.atan:
.kdb.desc.keywords.attr:
.kdb.desc.keywords.avg:
.kdb.desc.keywords.avgs:
.kdb.desc.keywords.bin:
.kdb.desc.keywords.binr:
.kdb.desc.keywords.ceiling:
.kdb.desc.keywords.cols:
.kdb.desc.keywords.cor:
.kdb.desc.keywords.cos:
.kdb.desc.keywords.count:
.kdb.desc.keywords.cov:
.kdb.desc.keywords.cross:
.kdb.desc.keywords.cut:
.kdb.desc.keywords.delete:
.kdb.desc.keywords.deltas:
.kdb.desc.keywords.desc:
.kdb.desc.keywords.dev:
.kdb.desc.keywords.differ:
.kdb.desc.keywords.distinct:
.kdb.desc.keywords.div:
.kdb.desc.keywords.divide:
.kdb.desc.keywords.do:
.kdb.desc.keywords.dsave:
.kdb.desc.keywords.each:
.kdb.desc.keywords.eachboth:
.kdb.desc.keywords.ej:
.kdb.desc.keywords.enlist:
.kdb.desc.keywords.equal:
.kdb.desc.keywords.eval:
.kdb.desc.keywords.except:
.kdb.desc.keywords.exec:
.kdb.desc.keywords.exit:
.kdb.desc.keywords.exp:
.kdb.desc.keywords.fby:
.kdb.desc.keywords.fill:
.kdb.desc.keywords.fills:
.kdb.desc.keywords.first:
.kdb.desc.keywords.fkeys:
.kdb.desc.keywords.flip:
.kdb.desc.keywords.floor:
.kdb.desc.keywords.get:
.kdb.desc.keywords.getenv:
.kdb.desc.keywords.group:
.kdb.desc.keywords.gtime:
.kdb.desc.keywords.hclose:
.kdb.desc.keywords.hcount:
.kdb.desc.keywords.hdel:
.kdb.desc.keywords.hopen:
.kdb.desc.keywords.hsym:
.kdb.desc.keywords.iasc:
.kdb.desc.keywords.idesc:
.kdb.desc.keywords.if:
.kdb.desc.keywords.ij:
.kdb.desc.keywords.in:
.kdb.desc.keywords.insert:"This keyword is used to append new data to a table and returns the index of the new row. If insert is used on a key table and the key already axists an insert error will be returned.";
.kdb.desc.keywords.inter:
.kdb.desc.keywords.inv:
.kdb.desc.keywords.key:
.kdb.desc.keywords.keys:
.kdb.desc.keywords.last:
.kdb.desc.keywords.like:
.kdb.desc.keywords.lj:
.kdb.desc.keywords.ljf:
.kdb.desc.keywords.load:
.kdb.desc.keywords.log:
.kdb.desc.keywords.lower:
.kdb.desc.keywords.lsq:
.kdb.desc.keywords.ltime:
.kdb.desc.keywords.ltrime:
.kdb.desc.keywords.match:
.kdb.desc.keywords.mavg:
.kdb.desc.keywords.max:
.kdb.desc.keywords.maxs:
.kdb.desc.keywords.mcount:
.kdb.desc.keywords.md5:
.kdb.desc.keywords.mdev:
.kdb.desc.keywords.med:
.kdb.desc.keywords.meta:
.kdb.desc.keywords.min:
.kdb.desc.keywords.mins:
.kdb.desc.keywords.minus:
.kdb.desc.keywords.mmax:
.kdb.desc.keywords.mmin:
.kdb.desc.keywords.mmu:
.kdb.desc.keywords.mod:
.kdb.desc.keywords.msum:
.kdb.desc.keywords.multiplication:
.kdb.desc.keywords.neg:
.kdb.desc.keywords.next:
.kdb.desc.keywords.not:
.kdb.desc.keywords.null:
.kdb.desc.keywords.over:
.kdb.desc.keywords.parse:
.kdb.desc.keywords.peach:
.kdb.desc.keywords.pj:
.kdb.desc.keywords.plus:
.kdb.desc.keywords.prd:
.kdb.desc.keywords.prds:
.kdb.desc.keywords.prior:
.kdb.desc.keywords.prev:
.kdb.desc.keywords.rand:
.kdb.desc.keywords.rank:
.kdb.desc.keywords.ratios:
.kdb.desc.keywords.raze:"return the items of x, collapsing one level of nesting"
.kdb.desc.keywords.read0:
.kdb.desc.keywords.read1:
.kdb.desc.keywords.reciprocal:
.kdb.desc.keywords.reval:
.kdb.desc.keywords.reverse:
.kdb.desc.keywords.rload:
.kdb.desc.keywords.rotate:
.kdb.desc.keywords.rsave:
.kdb.desc.keywords.rtrim:
.kdb.desc.keywords.save:
.kdb.desc.keywords.scan:
.kdb.desc.keywords.scov:
.kdb.desc.keywords.sdev:
.kdb.desc.keywords.select:
.kdb.desc.keywords.set:
.kdb.desc.keywords.sevenv:
.kdb.desc.keywords.show:
.kdb.desc.keywords.signum:
.kdb.desc.keywords.sin:
.kdb.desc.keywords.sqrt:
.kdb.desc.keywords.ss:
.kdb.desc.keywords.ssr:
.kdb.desc.keywords.string:
.kdb.desc.keywords.sublist:
.kdb.desc.keywords.sum:
.kdb.desc.keywords.sums:
.kdb.desc.keywords.sv:
.kdb.desc.keywords.svar:
.kdb.desc.keywords.system:
.kdb.desc.keywords.tables:
.kdb.desc.keywords.tan:
.kdb.desc.keywords.til:
.kdb.desc.keywords.trim:
.kdb.desc.keywords.type:
.kdb.desc.keywords.uj:
.kdb.desc.keywords.ungroup:
.kdb.desc.keywords.union:
.kdb.desc.keywords.update:
.kdb.desc.keywords.upper:
.kdb.desc.keywords.upsert:"This function can be used to update certain information in a table. If the table name is passed by value, a table is returned with the updated results. If the table name is passed by reference the table name as a symbol is returned and the changes are persisted in the table.";
.kdb.desc.keywords.upper:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
.kdb.desc.keywords.:
