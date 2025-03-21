// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the catetegories of functions

// Author: Spencer
//==========================================================
.kdb.dict.category: (!) . flip raze 2 cut
    (
        (`control; 	`do`exit`if`while);
        (`env; 	`getenv`gtime`ltime`setenv);
        (`interpret; `eval`parse`reval`show`system`value);
        (`io; `dsave`get`hclose`hcount`hdel`hopen`hsym`load`read0`read1`rload`rsave`save`set);
        (`iterate;`each`over`peach`prior`scan);
        (`join;`aj`aj0`ajf`ajf0`asof`ej`ij`ijf`lj`ljf`pj`uj`ujf`wj`wj1);
        (`list; 	`count`cross`cut`enlist`except`fills`first`flip`group`in`inter`last`mcount`next`prev`raze`reverse`rotate`sublist`sv`til`union`vs`where`xprev);
        (`logic;`all`and`any`not`or);
        (`math; 	`abs`acos`asin`atan`avg`avgs`ceiling`cor`cos`cov`deltas`dev`div`ema`exp`floor`inv`log`lsq`mavg`max`maxs`mdev`med`min`mins`mmax`mmin`mmu`mod`msum`neg`prd`prds`rand`ratios`reciprocal`scov`sdev`signum`sin`sqrt`sum`sums`svar`tan`var`wavg`within`wsum`xexp`xlog);
        (`meta; `attr`null`tables`type`view`views);
        (`query; `delete`exec`fby`select`update);
        (`sort; `asc`bin`binr`desc`differ`distinct`iasc`idesc`rank`xbar`xrank);
        (`table; 	`cols`csv`fkeys`insert`key`keys`meta`ungroup`upsert`xasc`xcol`xcols`xdesc`xgroup`xkey);
        (`text; `like`lower`ltrim`md5`rtrim`ss`ssr`string`trim`upper)
    );