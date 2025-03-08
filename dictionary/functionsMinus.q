// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the minus functions:

// Author: Spencer
//==========================================================
// Dictionary for ! related functions
.kdb.dict.bang: (!) . flip raze 2 cut
    (
        (`$"-1!"; .kdb.desc.func.minus1Bang);
        (`$"-2!"; .kdb.desc.func.minus2Bang);
        (`$"-3!"; .kdb.desc.func.minus3Bang);
        (`$"-5!"; .kdb.desc.func.minus5Bang);
        (`$"-6!"; .kdb.desc.func.minus6Bang);
        (`$"-7!"; .kdb.desc.func.minus6Bang);
        (`$"-8!"; .kdb.desc.func.minus8Bang);
        (`$"-9!"; .kdb.desc.func.minus9Bang);
        (`$"-11!"; .kdb.desc.func.minus11Bang);
        (`$"-12!"; .kdb.desc.func.minus12Bang);
        (`$"-13!"; .kdb.desc.func.minus13Bang);
        (`$"-15!"; .kdb.desc.func.minus15Bang);
        (`$"-16!"; .kdb.desc.func.minus16Bang)
    );