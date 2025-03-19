// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of datatypes

// Author: Spencer
//==========================================================
// Dictionary for joins
.kdb.dict.dataTypes: (!) . flip raze 2 cut
    (
        (`flatFile; .kdb.desc.tables.flatFile);
        (`splayedTables; .kdb.desc.tables.splayedTables);
        (`partitions; .kdb.desc.tables.partitions);
        (`sym; .kdb.desc.tables.sym)
    );