// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the comand line arguments

// Author: Spencer
//==========================================================
// Dictionary for joins
.kdb.dict.cli: (!) . flip raze 2 cut
    (
        (`u; .kdb.args.u);
        (`aj; .kdb.args.p);
        (`l; .kdb.args.l)
    );s