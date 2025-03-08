// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the different tables

// Author: Spencer
//==========================================================
.kdb.dict.tables: (!) . flip raze 2 cut
    (
        (`flatfile; .kdb.desc.tables.flatFile);
        (`splayed; .kdb.desc.tables.splayedTables);
        (`partition; .kdb.desc.tables.partitions)
    );