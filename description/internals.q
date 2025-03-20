// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of internal functions such as -11!

// Author: Spencer
//==========================================================
.kdb.desc.func.minus1Bang:"Prepends a colon to the start of a symbol if it is not there already. This resulting symbol can be used to create a file handle e.g.";

.kdb.desc.func.minus2Bang:"Will return any attributes associated to the argument.";

.kdb.desc.func.minus3Bang:"This will return a string representation of the argument.";

.kdb.desc.func.minus4Bang:"tokens - Returns the list of q tokens found in string x. (Note the q parsing of names with embedded underscores.). Should not be used with input data over 2GB in length (0Wi). Returns domain error with this condition since 4.1 2022.04.15.";

.kdb.desc.func.minus5Bang:"-5! will return the functional representation of argument e.g.";

.kdb.desc.func.minus6Bang:"Evaluates the functional form of query. This is the same as the function eval e.g.";

.kdb.desc.func.minus7Bang:"Argument is a file location. This function will return the size of the file in bytes.";

.kdb.desc.func.minus8Bang:"Returns the byte representation of a string. q)-8!1 2 30x010000001a000000060003000000010000000200000003000000";

.kdb.desc.func.minus9Bang:"Creates data from IPC byte representation x.";

.kdb.desc.func.minus10Bang:"type enum - Resolve a type number to an enum vector and check if it is available.";

.kdb.desc.func.minus11Bang:"Used for streaming executions of a file. This function is can be used in three ways: Where n is a non-negative integer and x is a logfile handle. -11!x and -11!(-1;x) - replay x and return the number of chunks executed; if end of file is corrupted, signal badtail. -11!(-2;x) - returns the number of consecutive valid chunks in x and the length of the valid part of the file. -11!(n;x) - replays n chunks from top of logfile and returns the number of chunks executed. Each chunk from a log is passed to .z.ps for execution. In replaying, if the logfile references an undefined function, the function name is signalled as an error.";

.kdb.desc.func.minus12Bang:"Returns the hostname for a given ip address in integer format e.g.";

.kdb.desc.func.minus13Bang:"Returns the ip address for a given hostname symbol";

.kdb.desc.func.minus14Bang:"quote escape - Handles quote escaping in strings: used to prepare data for CSV export.";

.kdb.desc.func.minus15Bang:"Runs md5 encryption on a string e.g.";

.kdb.desc.func.minus16Bang:"Provides the reference count on that object:";

.kdb.desc.func.minus18Bang:"compress bytes - Returns the IPC byte representation of x according to -8!x, applying compression based on IPC compression rules: Uncompressed serialized data has a length greater than 2000 bytes, Size of compressed data is less than ½ the size of uncompressed data";

.kdb.desc.func.minus21Bang:"compression/encryption stats - Where x is a file symbol, returns a dictionary of compression/encryption statistics for it. Encryption available since 4.0 2019.12.12. The dictionary is empty if the file is not compressed/encrypted.";

.kdb.desc.func.minus22Bang:"uncompressed length - An optimized shortcut to obtain the length of uncompressed serialized x, i.e. count -8!x";

.kdb.desc.func.minus23Bang:"memory map - Attempts to force the object x to be resident in memory by hinting to the OS and/or faulting the underlying memory pages. Useful for triggering sequential access to the storage backing x.";

.kdb.desc.func.minus25Bang:"async broadcast - Broadcast data as an async msg to specified handles. The advantage of using -25!(handles;msg) over neg[handles]@backslash:msg is that -25!msg will serialize msg just once - thereby reducing CPU and memory load. Handles should be a vector of positive int or longs. msg will be serialized just once, to the lowest capability of the list of handles. I.e. if handles are connected to a mix of versions of kdb+, it will serialize limited to the types supported by the lowest version. If there is an error, no messages will have been sent, and it will return the handle whose cap caused the error. Just as with neg[handles]@ backslash:msg, -25!x queues the msg as async on those handles - they don't get sent until the next spin of the main loop, or are flushed with neg[handles]@backslash:(::).";

.kdb.desc.func.minus26Bang:"ssl - View TLS settings on a handle or current process -26!handle or -26!(). Since V3.4 2016.05.12. In the result, all keys except SSLEAY_VERSION are initialized from their corresponding environment variables.";

.kdb.desc.func.minus27Bang:"IEEE754 precision format - Where x is an int atom, y is a float returns y as a string or strings formatted as a float to x decimal places. (Since V3.6 2018.09.26.) It is atomic and doesn't take backslash P into account. For example: q)-27!(3i;0 1+123456789.4567) 123456789.457, 123456790.457";

.kdb.desc.func.minus30Bang:"deferred response - Defer response to a sync message. Since V3.6 2018.05.18. -30!(::). Allows the currently-executing callback to complete without responding to the client, for example .z.pg. The handle to use for the subsequent deferred reply can be obtained via .z.w. The deferred reply should be provided later via one of the following methods: -30!(handle;1b;errorMsg) - responds to the deferred sync call with an error message populated with the string/symbol provided in errorMsg. -30!(handle;0b;msg) - responds to the deferred sync call with the contents of msg. A 'domain error will returned if the handle is not a member of .z.W. Using a handle that is not expecting a response message will return an error, for example: -30!(8i;0b;`hello`world)";

.kdb.desc.func.minus33Bang:"SHA-1 hash - where x is a string, returns its SHA-1 hash as a list of strings of hex codes.";

.kdb.desc.func.minus36Bang:"Load master key - Where x is a master-key file as a file symbol, y is a password as a string, z is whether to unlock/lock as a bool. -36!(::) - Expose whether a key has already been loaded, returning 0b or 1b accordingly. -36!(x;y) and -36!(x;y;z) - loads and validates the master key into memory as the key to use when decrypting or encrypting data on disk. Create master key. Expect this call to take about 500 milliseconds to execute. It can be executed from handle 0 only.Signals errors: Encryption lib unavailable - failed to load OpenSSL libs. Invalid password. Main thread only - can be executed from the main thread only.PKCS5_PBKDF2_HMAC - library invocation failed. Restricted - must be executed under handle 0. Unrecognized key format - master key file format unrecognized";

.kdb.desc.func.minus38ang:"socket table - where x is a list of socket handles, returns a table with columns: p (protocol): q (IPC) or w (WebSocket), f (family): t (TCP) or u (Unix domain socket), z (compression enabled flag): since v4.1 2024.05.31, n (count unsent msgs): since v4.1 2024.05.31, m (total unsent bytes, like .z.W): since v4.1 2024.05.31";

.kdb.desc.func.minus120Bang:"memory domain - returns x's memory domain (currently 0 or 1), e.g. -120!'(1 2 3;.m.x:1 2 3)";