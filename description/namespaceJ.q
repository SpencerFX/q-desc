// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of J namespace utilities.

// Author: Spencer
//==========================================================
.kdb.desc.func.j.j:"serialize - Where x is a K object, returns a string representing it in JSON.";
.kdb.desc.func.j.k:"deserialize - Where x is a string containing JSON, returns a K object.";
.kdb.desc.func.j.jd:"serialize infinity - Where x is a K object d is a dictionary returns the result of .j.j unless d[null0w] is 1b, in which case0wand-0ware mapped to null `. (Since V3.6 2018.12.06.)";