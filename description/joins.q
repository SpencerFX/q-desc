// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different joins

// Author: Spencer
//==========================================================
.kdb.desc.joins.pj:"The plus join is used to sum matching columns of two tables. The left table can be either keyed or unkeyed and the right table must be keyed. The resulting table is all of the rows of the left table joined with corresponding rows of the right table. If a row in the left table does not have a corresponding row in the right table, columns for that entry are filled with zeros";

.kdb.desc.joins.aj:"As the name may suggest it is mainly used to join columns with reference to time. It will return each row of the source table and any rows in the second table which have an entry before or at the same time based on the key columns. It is primarily used to find the prevailing quote at the time of a trade, or it will return each trade along with the quote as of the trade time by symbol.";

.kdb.desc.joins.ej:"Equi join joins two tables on specified column(s). The result is a table with all of the rows in the first table that match the second table on the specified columns.";

.kdb.desc.joins.uj:"The union join is a vertical join of columns in contrast to the ij and lj previously mentioned. Common columns are joined and values for any missing values are filled with nulls. One use of this could be to time order data from two different tables in order to ascertain the sequence of updates across multiple tables. For example, trade and quote tables could be joined.";

.kdb.desc.joins.lj:"The left join is used to perform lookups on a keyed table. The joined columns do not have to have an entry in the lookup table. The lj will return the same number of rows as trade since it is the unkeyed table. In contrast to the inner join (ij) each row from the unkeyed table is returned even if it does not have an entry in the keyed table. However, the keyed column in the keyed table must be present in the unkeyed table.";

.kdb.desc.joins.ij:"The simplest type of join which returns all rows in the source table which have an entry in the lookup table.";

.kdb.desc.joins.comma:"Using , with two unkeyed tables appends/inserts the data into the first table, and can be thought of as a vertical join of columns rather than the traditional lateral join of rows.";

.kdb.desc.joins.wj:"The window join is a generalization of the aj. It aggregates all values of specified columns within intervals. The prevailing quote is considered valid in a wj.";