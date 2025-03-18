// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different command line args

// Author: Spencer
//==========================================================
.kdb.desc.args.b:"Block write-access to a kdb+ database, for any handle context (.z.w) other than 0. Blocks hdel keyword (since V4.1t 2021.10.13, V4.0 2023.08.11). Blocks hopen of a file (since 4.1t 2021.10.13, 4.0 2023.08.11)";

.kdb.desc.args.c:"Set console maximum rows and columns, default 25 80.";

.kdb.desc.args.C:"Set HTTP display maximum rows and columns.";

.kdb.desc.args.e:"Sets error-trapping mode. The default is 0 (off).";

.kdb.desc.args.E:"TLS Server Mode. -E 0 is plain, -E 1 is plain & TLS and -E 2 is TLS only";

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

.kdb.desc.args.U:"sets a password file, disables x (even on the local console). The password file is a text file with one credential on each line. (No trailing blank lines.)";

.kdb.desc.args.w:"Workspace limit in MB for the heap across threads for memory domain 0. Default is 0: no limit.";

.kdb.desc.args.W:"Set the start-of-week offset, where 0 is Saturday. The default is 2, i.e Monday.";

.kdb.desc.args.z:"Set the format for D$ date parsing: 0 for mm dd yyyy and 1 for dd mm yyyy.";