// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the minus functions:

// Author: Spencer
//==========================================================
// Dictionary for ! related functions
.kdb.dict.bang: (!) . flip raze 2 cut
    (
        (`$"-1!"; .kdb.func.minus1Bang);
        (`$"-2!"; .kdb.func.minus2Bang);
        (`$"-3!"; .kdb.func.minus3Bang);
        (`$"-5!"; .kdb.func.minus5Bang);
        (`$"-6!"; .kdb.func.minus6Bang);
        (`$"-7!"; .kdb.func.minus6Bang);
        (`$"-8!"; .kdb.func.minus8Bang);
        (`$"-9!"; .kdb.func.minus9Bang);
        (`$"-11!"; .kdb.func.minus11Bang);
        (`$"-12!"; .kdb.func.minus12Bang);
        (`$"-13!"; .kdb.func.minus13Bang);
        (`$"-15!"; .kdb.func.minus15Bang);
        (`$"-16!"; .kdb.func.minus16Bang)
    );