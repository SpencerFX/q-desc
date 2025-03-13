// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different datatypes

// Author: Spencer
//==========================================================
.kdb.desc.tables.flatFile:"They are fully loaded into memory, that is why their size (memory footprint) should be small. Small size/configuration/keyed tables are suited for this type of table.";

.kdb.desc.tables.splayedTables:"They are not loaded into memory but their columns (which are files on disk) are mmap-ed on demand when a query is executed against them. Their structure is suitable when queries don’t touch all their columns, but only a restricted set, so only a sub set of files are accessed and loaded into memory. Medium size tables are suitable for this table type. Also the ones that can’t be partitioned according to the database partition rule.";

.kdb.desc.tables.partitions:"They are special directories that contain tables split by a certain criteria. Partitions can only be of the following type: date, month, year, int. The partition type is determined from the partition name format: eg 2008.06.10 – the type is date, 2008.06 – the type is month, 2008 the type is year, 25 - the type is type. One database can contain only one partition type at a time. Each table in a partition will have an extra virtual column with the same type and name as the partition type, and as value the partition name.";

.kdb.desc.tables.sym:"The sym file is a kdb+ binary file containing the list of symbols from all splayed and partitioned tables. During the enumeration process, all columns of symbol type are converted to enumerations against the sym file, after new symbols are added to the sym file. Therefore the sym file contains a list of unique values. Being a kdb+ binary file, it can be read with get:";