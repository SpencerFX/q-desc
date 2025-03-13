// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different iterators

// Author: Spencer
//==========================================================
.kdb.desc.iterators.each:"Apply a value item-wise to a dictionary, list, or conforming lists and/or dictionaries. Where v is an applicable value, v' applies v to each item of a list, dictionary or to corresponding items of conforming lists. The derived function has the same rank as v. Each applied to a binary value is sometimes called each both and can be applied infix. Iterations of ternary and higher-rank values are applied with brackets.";

.kdb.desc.iterators.eachLeft:"Apply a binary value between one argument and each item of the other. The maps Each Left and Each Right take binary values and derive binary functions that pair one argument to each item of the other. Effectively, the map projects its value on one argument and applies Each.";

.kdb.desc.iterators.eachRight:"Apply a binary value between one argument and each item of the other. The maps Each Left and Each Right take binary values and derive binary functions that pair one argument to each item of the other. Effectively, the map projects its value on one argument and applies Each.";

.kdb.desc.iterators.cross:"Each Left combined with Each Right resembles the result obtained by cross.";

.kdb.desc.iterators.eachParallel:"Assign sublists of the argument list to secondary tasks, in which the unary value is applied to each item of the sublist. The Each Parallel map takes a unary value as argument and derives a unary function. The iteration v1': divides its list or dictionary argument x between available secondary tasks. Each secondary task applies v1 to each item of its sublist.";

.kdb.desc.iterators.peach:"The binary keyword peach can be used as a mnemonic alternative. The following are equivalent.";

.kdb.desc.iterators.eachPrior:"Each prior ': modifies a dyadic function but it creates a monadic function. This new function applies the underlying function to each adjacent pair of items in a list. The function is uniform on its argument by pre-pending the first element of the input to the output."

.kdb.desc.iterators.case:"Pick successive items from multiple list arguments: the left argument of the iterator determines from which of the arguments each item is picked. The derived function int' has rank max[int]+1. Atom arguments are treated as infinitely-repeated values.";