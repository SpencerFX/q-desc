// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different datatypes

// Author: Spencer
//==========================================================
.kdb.desc.datatypes.char:" It corresponds to a SQL CHAR. It is denoted by a single character enclosed in double quotes.";

.kdb.desc.datatypes.symbol:"Symbols are atomic and immutable. They are suitable for representing recurring values.";

.kdb.desc.datatypes.float:"Often called double in traditional languages. A float can hold (at least) 15 decimal digits of precision. It is denoted by optionally signed numeric digits with either a decimal point or an optional trailing type indicator f.";

.kdb.desc.datatypes.real:"This type is called float in some languages. A real can hold at least 6 decimal digits of precision.";

.kdb.desc.datatypes.boolean:"The boolean type uses one byte to store a bit and is denoted by the bit value with the trailing type indicator b. There are no keywords for true or false, nor are there separate logical operators for booleans.";

.kdb.desc.datatypes.time:"time: If milliseconds are sufficient, use the time type, which stores the count of milliseconds from midnight in a 32-bit signed integer. It is denoted by hh:mm:ss.uuu where hh represents hours on the 24-hour clock, mm represents minutes, ss represents seconds, and uuu represents milliseconds.";

.kdb.desc.datatypes.timespan:"timespan: If milliseconds are not sufficient, use the timespan type, which stores the count of nanoseconds from midnight as a long integer.";

.kdb.desc.datatypes.datetime:"datetime(deprecated) : A datetime is the lexical combination of a date and a time, separated by T as in the ISO standard format. A datetime value stores in a float the fractional day count from midnight Jan 1, 2000.";

.kdb.desc.datatypes.timestamp:"It is the lexical combination of a date and a timespan, separated by D. The underlying timestamp value is a long representing the count of nanoseconds since the millennium. Post-millennium is positive and pre- is negative.";

.kdb.desc.datatypes.month:"month: The month type is stored as a 32-bit signed integer and is denoted by yyyy.mm with a trailing type indicator m. A month value is the count of months since the beginning of the millennium. Post-milieu is positive and pre is negative.";

.kdb.desc.datatypes.minute:"The minute type is stored as a 32-bit signed integer and is denoted by hh:mm. A minute value counts the number of minutes from midnight.";

.kdb.desc.datatypes.second:"The second type is stored as 32-bit signed integer and is denoted by hh:mm:ss. A second value counts the number of seconds from midnight.";

.kdb.desc.datatypes.guid:"The guid type (since V3.0) is a 16-byte type, and can be used for storing arbitrary 16-byte values, typically transaction IDs.";

.kdb.desc.datatypes.enumerations:"Enumerated types are numbered from 20h up to 76h. For example, in a new session with no enumerations defined: q)type `sym$10?sym:`AAPL`AIG`GOOG`IBM 20h";