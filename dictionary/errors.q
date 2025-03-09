// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of errors

// Author: Spencer
//==========================================================
.kdb.dict.errors: (!) . flip raze 2 cut
    (
        (`x; .kdb.desc.errors.x);
        (`access; .kdb.desc.errors.access);
        (`assign; .kdb.desc.errors.assign);
        (`branch; .kdb.desc.errors.branch);
        (`cant_; .kdb.desc.errors.cant_);
        (`cast; .kdb.desc.errors.cast);
        (`char; .kdb.desc.errors.char);
        (`conn; .kdb.desc.errors.conn);
        (`constants; .kdb.desc.errors.constants);
        (`cores; .kdb.desc.errors.cores);
        (`cpu; .kdb.desc.errors.cpu);
        (`domain; .kdb.desc.errors.domain);
        (`exp; .kdb.desc.errors.exp);
        (`from; .kdb.desc.errors.from);
        (`glim; .kdb.desc.errors.glim);
        (`globals; .kdb.desc.errors.globals);
        (`host; .kdb.desc.errors.host);
        (`insert; .kdb.desc.errors.insert);
        (`k4; .kdb.desc.errors.k4);
        (`length; .kdb.desc.errors.length);
        (`limit; .kdb.desc.errors.limit);
        (`locals; .kdb.desc.errors.locals);
        (`loop; .kdb.desc.errors.loop);
        (`mismatch; .kdb.desc.errors.mismatch);
        (`Mlim; .kdb.desc.errors.Mlim);
        (`mq; .kdb.desc.errors.mq);
        (`noamend; .kdb.desc.errors.noamend);
        (`noupdate; .kdb.desc.errors.noupdate);
        (`nyi; .kdb.desc.errors.nyi);
        (`os; .kdb.desc.errors.os);
        (`params; .kdb.desc.errors.params);
        (`par; .kdb.desc.errors.par);
        (`parse; .kdb.desc.errors.parse);
        (`part; .kdb.desc.errors.part);
        (`pwuid; .kdb.desc.errors.pwuid);
        (`Q7; .kdb.desc.errors.Q7);
        (`rank; .kdb.desc.errors.rank);
        (`s_fail; .kdb.desc.errors.s_fail);
        (`splay; .kdb.desc.errors.splay);
        (`srv; .kdb.desc.errors.srv);
        (`stack; .kdb.desc.errors.stack);
        (`step; .kdb.desc.errors.step);
        (`stop; .kdb.desc.errors.stop);
        (`stype; .kdb.desc.errors.stype);
        (`sys; .kdb.desc.errors.sys);
        (`threadview; .kdb.desc.errors.threadview);
        (`type; .kdb.desc.errors.type);
        (`u; .kdb.desc.errors.u);
        (`upd; .kdb.desc.errors.upd);
        (`user; .kdb.desc.errors.user);
        (`unmappable; .kdb.desc.errors.unmappable);
        (`utf8; .kdb.desc.errors.utf8);
        (`vd1; .kdb.desc.errors.vd1);
        (`view; .kdb.desc.errors.view);
        (`wha; .kdb.desc.errors.wha);
        (`wsfull; .kdb.desc.errors.wsfull)
    );