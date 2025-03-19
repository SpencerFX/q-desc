// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of datatypes

// Author: Spencer
//==========================================================
// Dictionary for joins
.kdb.dict.dataTypes: (!) . flip raze 2 cut
    (
        (`char; .kdb.desc.datatypes.char);
        (`symbol; .kdb.desc.datatypes.symbol);
        (`float; .kdb.desc.datatypes.float);
        (`real; .kdb.desc.datatypes.real);
        (`boolean; .kdb.desc.datatypes.boolean);
        (`time; .kdb.desc.datatypes.time);
        (`timespan; .kdb.desc.datatypes.timespan);
        (`datetime; .kdb.desc.datatypes.datetime);
        (`timestamp; .kdb.desc.datatypes.timestamp);
        (`month; .kdb.desc.datatypes.month);
        (`minute; .kdb.desc.datatypes.minute);
        (`second; .kdb.desc.datatypes.second);
        (`guid; .kdb.desc.datatypes.guid);
        (`enumerations; .kdb.desc.datatypes.enumerations)
    );

