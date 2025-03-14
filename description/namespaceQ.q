// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of .Q namespace utilities.

// Author: Spencer
//==========================================================
.kdb.desc.func.Q.A:"upper-case alphabet";

.kdb.desc.func.Q.a:"lower-case alphabet";

.kdb.desc.func.Q.an:"lower-case alphabet and numerics";

.kdb.desc.func.Q.addmonths:"Where x is a date and y is an int, returns x plus y months.If the date x is near the end of the month and (x.month + y) month has fewer days than x.month, the result may spill over to the following month.";

.kdb.desc.func.Q.addr:"Where x is a hostname or IP address as a symbol atom, returns the IP address as an integer (same format as .z.a)";

.kdb.desc.func.Q.b6:"Returns upper- and lower-case alphabet and numerics. Used for binhex encoding and decoding.";

.kdb.desc.func.Q.bt:"Dumps the backtrace to stdout at any point during execution or debug.>> marks the current stack frame. (Since V4.0 2020.03.23.)";

.kdb.desc.func.Q.btoa:"This converts a string to b64 encode";

.kdb.desc.func.Q.bv:"In partitioned DBs, construct the dictionary .Q.vp of table schemas for tables with missing partitions. Optionally allow tables to be missing from partitions, by scanning partitions for missing tables and taking the tables prototypes from the last partition. After loading/re-loading from the filesystem, invoke .Q.bv[] to (re)populate .Q.vt/.Q.vp, which are used inside .Q.p1 during the partitioned select .Q.ps. (Since V2.8 2012.01.20, modified V3.0 2012.01.26). If your table exists at least in the latest partition (so there is a prototype for the schema), you could use .Q.bv[] to create empty tables on the fly at run-time without having to create those empties on disk. .Q.bv[`] (with argument) will use prototype from first partition instead of last. (Since V3.2 2014.08.22.)";

.kdb.desc.func.Q.bvi:"It offers the same functionality as .Q.bv, but scans only new partitions loaded in the hdb since the last time .Q.bv or .Q.bvi was run. Since v4.1 2024.09.13.";

.kdb.desc.func.Q.Cf:"create empty nested char file) - Deprecated since 4.1t 2022.03.25. Using resulting files could return file format errors since 3.6.";

.kdb.desc.func.Q.chk:"fill HDB - Where x is a HDB as a filepath, fills tables missing from partitions using the most recent partition as a template, and reports which partitions (but not which tables) it is fixing.";

.kdb.desc.func.Q.cn:"(count partitioned table) - Where x is a partitioned table, passed by value, returns its count. Populates .Q.pn cache.";

.kdb.desc.func.Q.D:"In segmented DBs, contains a list of the partitions - conformant to .Q.P - that are present in each segment. .Q.P!.Q.D can be used to create a dictionary of partition-to-segment information.";

.kdb.desc.func.Q.dd:"(join symbols) - Shorthand for ` sv x,`$string y. Useful for creating filepaths, suffixed stock symbols, etc."

.kdb.desc.func.Q.def:"(command defaults) - Default values and type checks for command-line arguments parsed with .Q.opt. Where x is a dictionary of default parameter names and values, and y is the output of .Q.opt. Types are inferred from the default values provided, which must be an atom type.";

.kdb.desc.func.Q.dpft:"Used to save a table in a partition (in a kdb+ tick setup this is done from the realtime database):";

.kdb.desc.func.Q.dpfts:"Used to save a table in a partition (in a kdb+ tick setup this is done from the realtime database). Used with symtable";

.kdb.desc.func.Q.dpt:"dpt save table unsorted";

.kdb.desc.func.Q.dpts:"save table unsorted with symtable";

.kdb.desc.func.Q.en:"The function is used to enumerate a table:";

.kdb.desc.func.Q.ens:" Enumerage against domain. .Q.ens[dir;table;name]. Where dir is a symbol handle to a folder, table is a table, name is a symbol atom naming a sym file in dir. The function: creates if necessary the folder dir, gets sym from dir if it exists, enumerates against sym the symbols in table, writes sym in dir, returns table with columns enumerated (for .Q.ens, against name). .Q.ens allows enumeration against domains (and therefore filenames) other than sym. Tables splayed across a directory must be fully enumerated and not keyed. The solution is to enumerate columns of type varchar before saving the table splayed.";

.kdb.desc.func.Q.f:"Precision format - .Q.f[x;y] -  Where x is an int atom, y is a numeric atom, returns y as a string formatted as a float to x decimal places. Because of the limits of precision in a double, for y above 1e13 or the limit set by P, formats in scientific notation.";

.kdb.desc.func.Q.fc:"parallel on cut - .Q.fc[x;y] - Where x is is a unary atomic function, y is a list, and returns the result of evaluating f vec - using multiple threads if possible. (Since V2.6)";

.kdb.desc.func.Q.ff:"append columns - x is a table to modify and y is a table of columns to add to x and set to null. Returns x, with all new columns in y, with values in new columns set to null of the appropriate type.If there is a common column in x and y, the column from x is kept (i.e. it will not null any columns that exist in x).";

.kdb.desc.func.Q.fk.:"foreign key - where x is a table column, returns ` if the column is not a foreign key or `tab if the column is a foreign key into tab.";

.kdb.desc.func.Q.fmt:"precision format - where x and y are integer atoms and z is a numerica atom, returns z as a string of length x formatted y decimal places.";

.kdb.desc.func.Q.fpn:"pipe streaming";

.kdb.desc.func.Q.fps:"pipe streaming - where x is a unary function, y is a filepath to a fifo (named pipe) and z is an integer. Reads z-sized lumps of complete n delimited records from a pipe and applies a function to each record. This enables you to implement a streaming algorithm for various purposes such as converting a large compressed CSV file into an on-disk kdb+ database without holding the data in memory all at once or using disk space required for the uncompressed file.";

.kdb.desc.func.Q.fs:"file streaming";

.kdb.desc.func.Q.fsn:"file streaming - where x is a unary function, y is a filepath, z is an integer. loops over file y, grabs z-sized lumps of complete n delimited records, applies x to each record, and returns the size of the file as given by hcount. This enables you to implement a streaming algorithm to convert a large CSV file into an on-disk database without holding the data in memory all at once. .Q.fsn is almost identical to .Q.fs but takes an extra argument z, the size in bytes that chunks will be read in. This is particularly useful for balancing load speed and RAM usage.";

.kdb.desc.func.Q.ft:"apply simple - where y is a keyed table, x is a unary function x[t]. As an example, note that you can index into a simple table with row indices, but not into a keyed table - for that you should use a select statement. However, to illustrate the method, we show an indexing function being applied to a keyed table. Now create an indexing function, and wrap it in .Q.ft. This works on both types of table:";

.kdb.desc.func.Q.fu:"apply unique - Where x is a unary function and y is a list, returns x[y] after evaluating x only on distinct items of y, not a list, returns x[y]. .Q.fu applies x to the distinct items of y. Where for any index i, the result of x y i depends on no other item of y, then .Q.fu works as intended. Where this is not so, the result is unlikely to be expected or useful.";

.kdb.desc.func.Q.gc:"garbage collect - Run garbage-collection and returns the amount of memory that was returned to the OS. It attempts to coalesce pieces of the heap into their original allocation units and returns any units ≥64MB to the OS. Refer to g (garbage collection mode) for details on how memory is created on the heap. When secondary threads are configured and .Q.gc[] is invoked in the main thread, .Q.gc[] is automatically invoked in each secondary thread. If the call is instigated in a secondary thread, it affects that thread’s local heap only. Example of garbage collection in the default deferred mode, using .Q.w[] to view memory stats:";

.kdb.desc.func.Q.gz:"gzip - .Q.gz[::] zlib loaded, .Q.gz cbv (unzipped), .Q.gz (cl;cbv) (zipped). Where cbv is a char vector (or byte vector since 4.1t 2021.09.03,4.0 2021.10.01). cl is compression level [1-9] as a long returns, for the general null, a boolean atom as whether Zlib is loaded. cbv, the inflated (unzipped) vector a 2-list, the deflated (zipped) vector";

.kdb.desc.func.Q.hdpf:"hdpf (save tables) - The function: saves all tables to disk, by calling .Q.dpft  (saves as splayed tables to a partition), clears in-memory tables, sends reload message to HDB, by opening a temporary connection and sending l .";

.kdb.desc.func.Q.hg:"http get - Where x is a URL as a symbol atom or (since V3.6 2018.02.10) a string, returns a string for the result of an HTTP[S] GET query. (Since V3.4)";

.kdb.desc.func.Q.host:"ip to hostname - where x is an IP address as an int atom, returns its hostname as a symbol atom";

.kdb.desc.func.Q.hp:"http post - where x is a url as a symbol handle or string, y is a MIME type as a string, z is a the POST query as a string. Returns a string for the result of an HTTP[S] POST query. (Since V3.4)";

.kdb.desc.func.Q.id:"sanitize - where x is a symbol atom, returns x with items sanitized to valid q names, a table, returns x with column names sanitized by removing characters that interfere with select/exec/update and adding string 1 to column names which clash with commands in the .q namespace. Updated in V3.2 to include .Q.res for checking collisions. A dictionary (since v4.1 2024.09.13), supports the same rules as table above. Table processing also has additional logic to cater for duplicate column names (names are now appended with 1,2,etc. when matched against previous columns) after applying previously defined rules.";

.kdb.desc.func.Q.ind:"partitioned index - where x is a partitioned table, y is a long int vector of row indexes into x, and returns rows y from x. When picking individual records from an in-memory table you can simply use the special virtual field i: select from table where i<100. But you cannot do that directly for a partitioned table. .Q.ind comes to the rescue here, it takes a table and indexes into the table - and returns the appropriate rows.";

.kdb.desc.func.Q.j10:"encode binhex - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer - maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched - but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.x10:"decode binhex - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer - maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched - but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.j12:"encode base-36 - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer - maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched - but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.x12:"decode base-36 - Where s is a string, these functions return s encoded (j10, j12) or decoded (x10, x12) against restricted alphabets: …10 en/decodes against the alphabet .Q.b6, this is a base-64 encoding - see BinHex and Base64 for more details than you ever want to know about which characters are where in the encoding. To keep the resulting number an integer the maximum length of s is 10. -12 en/decodes against .Q.nA, a base-36 encoding. As the alphabet is smaller s can be longer - maximum length 12. The main use of these functions is to encode long alphanumeric identifiers (CUSIP, ORDERID..) so they can be quickly searched - but without filling up the symbol table with vast numbers of single-use values.";

.kdb.desc.func.Q.K:"version date";

.kdb.desc.func.Q.k:"Return the interpreter version date (.Q.K) and number (.Q.k) for which q.k has been written: checked against .z.K at startup."; 

.kdb.desc.func.Q.l:"load - where x is a symbol atom naming a directory in the current directory, loads it recursively as in load, but into the default namespace";

.kdb.desc.func.Q.ld:"load and group - exposes logic used by 'l to grou script liens for evaluation";

.kdb.desc.func.Q.li:"load partitions - in the current hdb, adds any partitions which are both in the list supplied and on disk. Partitions can be a list or atomic variable.";

.kdb.desc.func.Q.lo:"(load without) - .Q.lo[`database;cd;scripts]. Where database is a symbol atom, cd is a boolean flag indicating whether to add cd to the database dir. scripts is a boolean flag indicating whether to execute any scripts in the database dir";

.kdb.desc.func.Q.M:"(chunk size) - chunk size for dsftg or load-process-save";

.kdb.desc.func.Q.MAP:"(maps partitions) - Keeps partitions mapped to avoid the overhead of repeated file system calls during a select. (Since V3.1.), For use with partitioned HDBS, used in tandem with l dir .Q.MAP currently has the following limitations: .Q.MAP does not work with linked columns, .Q.MAP does not work with virtual partition columns, use of .Q.MAP with compressed files is not recommended, as the uncompressed maps will be retained in memory";

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

.kdb.desc.func.Q.s:"(plain text) - Returns x formatted to plain text, as used by the console. Obeys console width and height set by c.";

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

.kdb.desc.func.Q.w:"(memory stats) - .Q.w[] - Returns the memory stats from w into a more readable dictionary. Refer to w for an explaination of each statistic.";

.kdb.desc.func.Q.Xf:"(create file) .Q.Xf[x;y]- Where x is a mapped nested datatype as either an upper-case char atom, or as a short symbol (e.g. `char), y is a filepath";

.kdb.desc.func.Q.x:"(non-command parameters) - Set by .Q.opt: a list of non-command parameters from the command line, where command parameters are prefixed by -.";