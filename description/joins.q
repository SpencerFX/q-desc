// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different joins

// Author: Spencer
//==========================================================
.kdb.desc.joins.pj:"Again an example of a left outer join which will return all rows from the source table, looking up any common columns and summing their values. If the lookup column does not exist in the table for a particular to then the values are zero filled.";

.kdb.desc.joins.aj:"As the name may suggest it is mainly used to join columns with reference to time. It will return each row of the source table and any rows in the second table which have an entry before or at the same time based on the “key columns”.";

.kdb.desc.joins.uj:"The union join is a vertical join of columns in contrast to the ij and lj previously mentioned.";

.kdb.desc.joins.lj:"The left join is used to perform lookups on a keyed table. The joined columns do not have to have an entry in the lookup table.";

.kdb.desc.joins.ij:"The simplest type of join which returns all rows in the source table which have an entry in the lookup table.";

.kdb.desc.joins.comma:"Using , with two unkeyed tables appends/inserts the data into the first table, and can be thought of as a vertical join of columns rather than the traditional lateral join of rows.";