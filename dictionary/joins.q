// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the different joins

// Author: Spencer
//==========================================================
// Dictionary for joins
.kdb.dict.joins: (!) . flip raze 2 cut
    (
        (`pj; .kdb.joins.pj);
        (`aj; .kdb.joins.aj);
        (`uj; .kdb.joins.uj);
        (`lj; .kdb.joins.lj);
        (`ij; .kdb.joins.ij);
        (`comma; .kdb.joins.comma)
    );