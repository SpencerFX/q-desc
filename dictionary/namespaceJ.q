// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the J namespace utilities/functions:

// Author: Spencer
//==========================================================
.kdb.dict.j: (!) . flip raze 2 cut
    (
        (`j; .kdb.desc.func.j.j);
        (`k; .kdb.desc.func.j.k);
        (`jd; .kdb.desc.func.j.jd)
    );