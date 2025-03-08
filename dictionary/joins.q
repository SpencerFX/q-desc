// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the different joins

// Author: Spencer
//==========================================================
// Dictionary for joins
.kdb.dict.joins: (!) . flip raze 2 cut
    (
        (`pj; .kdb.desc.joins.pj);
        (`aj; .kdb.desc.joins.aj);
        (`uj; .kdb.desc.joins.uj);
        (`lj; .kdb.desc.joins.lj);
        (`ij; .kdb.desc.joins.ij);
        (`comma; .kdb.desc.joins.comma)
    );