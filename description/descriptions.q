.kdb.tables.flatFile:"They are fully loaded into memory, that is why their size (memory footprint) should be small. Small size/configuration/keyed tables are suited for this type of table.";

.kdb.tables.splayedTables:"They are not loaded into memory but their columns (which are files on disk) are mmap-ed on demand when a query is executed against them. Their structure is suitable when queries don’t touch all their columns, but only a restricted set, so only a sub set of files are accessed and loaded into memory. Medium size tables are suitable for this table type. Also the ones that can’t be partitioned according to the database partition rule.";

.kdb.tables.partitions:"They are special directories that contain tables split by a certain criteria. Partitions can only be of the following type: date, month, year, int. The partition type is determined from the partition name format: eg 2008.06.10 – the type is date, 2008.06 – the type is month, 2008 the type is year, 25 - the type is type. One database can contain only one partition type at a time. Each table in a partition will have an extra virtual column with the same type and name as the partition type, and as value the partition name.";

.kdb.tables.sym:"The sym file is a kdb+ binary file containing the list of symbols from all splayed and partitioned tables. During the enumeration process, all columns of symbol type are converted to enumerations against the sym file, after new symbols are added to the sym file. Therefore the sym file contains a list of unique values. Being a kdb+ binary file, it can be read with get:";

.kdb.func.Q.en:"The function is used to enumerate a table:";

.kdb.func.Q.dpft:"Used to save a table in a partition (in a kdb+ tick setup this is done from the realtime database):";

.kdb.func.Q.chk:"Used to create empty tables (respecting the schema) in partitions where tables are missing:"

.kdb.func.minus1Bang:"Prepends a colon to the start of a symbol if it is not there already. This resulting symbol can be used to create a file handle e.g."

.kdb.func.minus2Bang:"Will return any attributes associated to the argument."

.kdb.func.minus3Bang:"This will return a string representation of the argument."

.kdb.func.minus5Bang:"-5! will return the functional representation of argument e.g."

.kdb.func.minus6Bang:"Evaluates the functional form of query. This is the same as the function eval e.g."

.kdb.func.minus7Bang:"Argument is a file location. This function will return the size of the file in bytes."

.kdb.func.minus8Bang:"Returns the byte representation of a string. E.g.";

.kdb.func.minus9Bang:"Restores the string above when the byte representation is used as the argument. E.g.";

.kdb.func.minus11Bang:"Used for streaming executions of a file. This function is can be used in three ways:";

.kdb.func.minus12Bang:"Returns the hostname for a given ip address in integer format e.g.";

.kdb.func.minus13Bang:"Returns the ip address for a given hostname symbol";

.kdb.func.minus15Bang:"Runs md5 encryption on a string e.g.";

.kdb.func.minus16Bang:"Provides the reference count on that object:";

.kdb.func.z.ps:".z.ps[] (process-set) is the equivalent handler for asynchronous messages.";

.kdb.func.z.pw:"This is a hook for connecting to external validation services, and should return a boolean result. The parameters to it are the username and password supplied by the incoming call. When a new request comes in, a call can be made to an external system and return the permissions of the incoming user. Then .z.pw should return true or false and the kdb+ process will accept or reject the connection accordingly. The default implementation is:";

.kdb.func.z.po:"The parameter is the handle of the incoming connection request. At this point, as far as the client is concerned, the connection has already been successful. The server could still close the connection using hclose but the connection open command in the client would still complete successfully and return a connection handle.";

.kdb.func.z.pg:"The parameter is the incoming request. The default behaviour is to evaluate the expression.Example usage would be to restrict access to certain users, or to log incoming calls. It can also be useful for debugging purposes, to see exactly what calls are coming into the database, e.g."

.kdb.func.z.pi:"The parameter is the incoming command and the default behaviour is to value the input. This is invoked when calls are made from the q console. This message handler is really for completeness, so it is possible to log all calls which have been executed on a process.";

.kdb.func.z.pc:"The parameter is the handle of the connection which has been closed. The default behaviour is to do nothing. When this is invoked the connection has already been closed so .z.a, .z.u and.z.w are all local values. However, the argument passed to .z.pc is the connection handle that was being used before the connection was closed. This can be useful for cleaning up log tables."

.kdb.func.z.ph:"This is the only message handler with a default definition. The parameter is the string sent from the web browser.";

.kdb.func.z.pp:"This is undefined by default, but can be redefined to handle http post messages.";

.kdb.func.z.a:"the ip-address of the calling process.";

.kdb.func.z.h:"the hostname of the calling process.";

.kdb.func.z.u:"the username of the calling process.";

.kdb.func.z.w:"the integer handle of the calling process.";

.kdb.args.l:"The command line arguments -l and -L are used to enable logging.";

.kdb.args.p:"Open up a port on startup";

.kdb.args.u:"Enables user/password authentication for ipc";

.kdb.joins.pj:"Again an example of a left outer join which will return all rows from the source table, looking up any common columns and summing their values. If the lookup column does not exist in the table for a particular to then the values are zero filled.";

.kdb.joins.aj:"As the name may suggest it is mainly used to join columns with reference to time. It will return each row of the source table and any rows in the second table which have an entry before or at the same time based on the “key columns”."

.kdb.joins.uj:"The union join is a vertical join of columns in contrast to the ij and lj previously mentioned."

.kdb.joins.lj:"The left join is used to perform lookups on a keyed table. The joined columns do not have to have an entry in the lookup table."

.kdb.joins.ij:"The simplest type of join which returns all rows in the source table which have an entry in the lookup table."

.kdb.joins.comma:"Using , with two unkeyed tables appends/inserts the data into the first table, and can be thought of as a vertical join of columns rather than the traditional lateral join of rows."

.kdb.iterators.eachPrior:"Each prior ': modifies a dyadic function but it creates a monadic function. This new function applies the underlying function to each adjacent pair of items in a list. The function is uniform on its argument by pre-pending the first element of the input to the output."