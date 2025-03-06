// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the different tables

// Author: Spencer
//==========================================================
.kdb.dict.tables: (!) . flip raze 2 cut
    (
        (`flatfile; .kdb.tables.flatFile);
        (`splayed; .kdb.tables.splayedTables);
        (`partition; .kdb.tables.partitions)
    );s