// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the different tables

// Author: Spencer
//==========================================================
.kdb.dict.tables: (!) . flip raze 2 cut
    (
        (`flatFile; .kdb.desc.tables.flatFile);
        (`splayedTables; .kdb.desc.tables.splayedTables);
        (`partitions; .kdb.desc.tables.partitions);
        (`sym; .kdb.desc.tables.sym)
    );