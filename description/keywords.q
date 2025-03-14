// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different keywords

// Author: Spencer
//==========================================================
.kdb.desc.keywords.abs:"absolute value. A multithreaded primitive.";
.kdb.desc.keywords.acos:"This is a unary funcation that returns the arcos (or inverse cosine) of x, with the result in radians.";
.kdb.desc.keywords.aj:"Generally this is used to get the prevailing quote one tablwe as of the time of the trade (other table). aj[`sym`time;trade;quote]";
.kdb.desc.keywords.aj0:"Same as the as of join except that the resulting time value is from the quote table instead of the boundary time from the trade table. aj0 returns the actual time from the second table.";
.kdb.desc.keywords.all:"This is an aggregate monadic function. The function returns boolean atomb 1b if all values in its argument are non-zero and 0b otherwise. The function all can be applied to any datatype except symbol by converting the type to boolean and then performing the operation.";
.kdb.desc.keywords.and:"These are respectively the restrictions of min, mand and not to bool arguments.";
.kdb.desc.keywords.any:"This is an aggregate monadic function. This function returns 1b if any value in its argument is non-zero and returns 0b if all values in its argument are 0";
.kdb.desc.keywords.asc:"This function sorts a list and applies `s# attribute. On homogenous lists, asc sorts the list in ascending order and applies the `s# attribute. On a mixed list, asc sorts values within datatype groups. On a dictionary, asc sorts by the values. On a table, asc sorts by the first unkeyed column and applies the sorted attribute to that column";
.kdb.desc.keywords.asin:"This is a unary function that returns the arcsine (or inverse sine) of x in radians. The arguments must be within -1<=x<=1, otherwise the null value 0n is returned.";
.kdb.desc.keywords.atan:"This is a unary function that returns the arc tan (or inverse  tangent) of x, with the result in radians. Valid arguments must be approximately of the order +10 to the 9th power or -10 to the ninth power. If this is not the case then the function will not evaluate.";
.kdb.desc.keywords.attr:"The attr function gives the attributes of data,which describe certain properties; `s denotes sorted ascending, eg, `s#2 3 4. `u denotes unique, `u#2 3 4, `p and `g are used to refer to lists with reptition with `p standing for parted and `g for grouped. Attribute flags are descriptive, not prescriptive; amends and appends preserve flags if the attribute is preserved. In other words, a sorted list remains sorted until an element is inserted in such a manner that disrupts the sort. Furthermore, applying an attribute to a list will result in fail if the list does not fulfill the attributes requirements.";
.kdb.desc.keywords.avg:"This function returns the arithmetic mean of a list of numeric values. The averages of lists of conformant lists can be return as well.";
.kdb.desc.keywords.avgs:"The function avgs computes the running average of a list with numerica values.";
.kdb.desc.keywords.bin:"The function bin performs a binary search and gives the index of the last element in x which <=y. The result is -1 for y less than the first element of x. Although bin does not require an ascending list, the return value is undefined for all non-ascending lists.";
.kdb.desc.keywords.binr:"The function binr gives the index of the first element in x which is >=y. Like bin the items of the left argument should be ascending to return meaning results.";
.kdb.desc.keywords.ceiling:"The ceiling function is the complement to the floor function. given a float or real the ceiling function always rounds up to the nearest integer. It is equivalent to 1 + floor x.";
.kdb.desc.keywords.cols:"This keyword returns the columns of a table as a list.";
.kdb.desc.keywords.cor:"This function gives the correlation between two numeric lists of the same length. If each list only has one member, the float null 0n is returned. The function output is between 1 and -1, with 1 denoting perfect correlation and -1 denoting perfect anti-correlation.";
.kdb.desc.keywords.cos:"This unary function returns the cosine of x, where x is in radians. Note that cos x repeats iteself every 2*pi and consequently valid values of x are of the order + 10 to the ninth power or -10 to the ninth power.";
.kdb.desc.keywords.count:"This aggregate function counts the elements in a list,table, or dictionary and returns a single long value.";
.kdb.desc.keywords.cov:"This function gives the covariance between two numeric lists of the same length. Attempting to find the covariance between two single numbers produces the null float value 0f";
.kdb.desc.keywords.cross:"This function gives the cartesian product of two arguments";
.kdb.desc.keywords.cut:"This function allows a table or list to be cut at a certain point. Putting in negative numbers or a single zero results in a domain error. Putting in a number larger then the number of atoms results in the argument being returned as a single element list.";
.kdb.desc.keywords.delete:"This command enables rows or columns from a table to be deleted. The syntax is similar to that of a query.";
.kdb.desc.keywords.deltas:"The deltas function is another primitive uniform function, which produces the differences of neighbouring items in the argument. The ith item of the result of deltas v is v[i]-v[i-1] for i greater than 0. Note that the first item of the result is identical to the firsm item of the argument.";
.kdb.desc.keywords.desc:"This monadic function sorts a list from largest to smallest. Duplicates are allowed making this a uniform function.";
.kdb.desc.keywords.dev:"This function gives the mathematical deviation for a list of numeric values; it is therefore an aggregate function. The numeric list need to have at least 2 values or else the null 0f is returned.";
.kdb.desc.keywords.differ:"This uniform function checks each member of a list to see if it differs from the preceding element. It returns a list of bool values with 1b indicating that the current value and the preceding one do differ whilst a 0b indicates the opposite. The first atom of a list returns 1b by default.";
.kdb.desc.keywords.distinct:"This monadic function returns the distinct elements of a list.";
.kdb.desc.keywords.div:"The function div is a dyadic function which performs integer division on two values. The function preserves the type of the first argument, except char, bytes, and shorts are converted to ints.";
.kdb.desc.keywords.divide:"Divid is a dyadic arithmetic function. Note that divide is denote by eprcentage sign. Numeric datatypes can be mixed in arithmetic expressions and required conversions from one to another automatic. the arguments of percentage sign are converted to float before the operation is performed.";
.kdb.desc.keywords.do:"A dyadic function, which accepts an integer and a function. the do function runs the inputfunction the inputer number of times.";
.kdb.desc.keywords.dsave:"A dyadic function, the dscave function saves global tables to disk as a splayed enumerated and indexted tables. Provides similar functionalit to .Q.dpft.";
.kdb.desc.keywords.each:"The each keyword (adverb or iterator) takes a function on its left and creates a new function that applies to each item of its argument.";
.kdb.desc.keywords.eachboth:"The each-both ' adverb modifies a dyadic function by applyings its behavior item-wise to corresponding list elements. Note that there cannot be any whitespace between ' and the verb or function that it modifies.";
.kdb.desc.keywords.ej:"The equijoin joins tables on a list of columns specified as the first argument.";
.kdb.desc.keywords.enlist:"A monadic primitive function, which enables one-item lists to be created. In the example above, a three item list is turned into a one item list with the itembeing a three item list.";
.kdb.desc.keywords.equal:"This is a dyadic relational function. This function produces boolean values, where 1b means that the each atom in a list is equal to the related atom. The relational functions q use a multiplicative tolerance when applied to floats. this makes arithmetic work better. Does not take into account type.";
.kdb.desc.keywords.eval:"The eval function is used to evaluate parse trees.";
.kdb.desc.keywords.except:"This function deletes items from a list.";
.kdb.desc.keywords.exec:"Written similarly to select statements, exec statements return the same results as select except in the forms of lists or dictionaries depending on the number of columns selected.";
.kdb.desc.keywords.exit:"This keyword terminates a process with a given exit code, e.g. exit 0.";
.kdb.desc.keywords.exp:"This function returns e^x (e to the power of x) where 'e' is the natural number and is approximately equal to 2.718282.";
.kdb.desc.keywords.fby:"This function can take the place of common by phrases, thereby simplifying them - useful in where clauses.";
.kdb.desc.keywords.fill:"There are three functions for processing null values. The dyadic function named fill replaces values in the right argument with the atomic left argument. Integer left arguments are promoted when the right argument is float or real. We could also choose to fill in with the non null-values.";
.kdb.desc.keywords.fills:"This function fills in nulls with the previous not null value.";
.kdb.desc.keywords.first:"The command returns the first atom of a list, a dictionary representation of the first row of a table or the value of the first element in a dictionary.";
.kdb.desc.keywords.fkeys:"This function returns a dictionary of the foreign keys of its table argument.";
.kdb.desc.keywords.flip:"Flip is a monadic primitive that applies to lists, associations and tables. The effect is to interchange the top two levels of its argument. Generally, when flip is applied to a rectangular dictionary, it returns a table and when flip is applied to a table, a dictionary is returned. That is if we perform c:flip b then b[i][j] and c[j][i] are identical for all valid indices i and j. In martrix terminology c is the transpose of b. In particular all items of a list must have the same count in order to be flipped." ;
.kdb.desc.keywords.floor:"The floor function applies to floats and reals and returns their value rounded down to the nearest integer. The value that is returned is of type long. Floor is often used to truncate and round floats to a specified number of decimal places. For example, the first expression truncates the float 72.277 to 2 decimal places and the second expression rounds it to 2 decimal places.";
.kdb.desc.keywords.get:"This allows one to memory map a file.";
.kdb.desc.keywords.getenv:"Returns the value of a given environment variable.";
.kdb.desc.keywords.group:"This function returns an association of the distinct atoms of a list with their positions in the list.";
.kdb.desc.keywords.gtime:"Converts time to Greenwich Mean Time. GMT";
.kdb.desc.keywords.hclose:"This keyword closes an ipc connection or file handle";
.kdb.desc.keywords.hcount:"Returns the size of a file in bytes.";
.kdb.desc.keywords.hdel:"Handle delete, useful for files.";
.kdb.desc.keywords.hopen:"This keyword opens an ipc connection or file handle.";
.kdb.desc.keywords.hsym:"This keyword converts a symbol to a file or process handle. the function hsym can also handle lists of symbols.";
.kdb.desc.keywords.iasc:"This is a uniform function, which returns the indices of the ascended sorted list relative to the input list.";
.kdb.desc.keywords.idesc:"This is a uniform function, which returns the indices of the descended sorted list relative to the input list.";
.kdb.desc.keywords.if:"This function is a type of conditional execution whereby if the condition statement is not equal to 0, then all expressions after it are executed. If the conditional expression evaluates to 0 then the following expressions are not evaluated.";
.kdb.desc.keywords.ij:"The inner join joins tables on the key columns of the second table.";
.kdb.desc.keywords.in:"This dyadic function can be used to query lists (on the right-hand side) about their contents. the output is a bool list indicating whether or not a specified atom is in the queried list.";
.kdb.desc.keywords.insert:"This keyword is used to append new data to a table and returns the index of the new row. If insert is used on a key table and the key already axists an insert error will be returned.";
.kdb.desc.keywords.inter:"This dyadic function returns the intersection of two lists; that is the atoms they have in common.";
.kdb.desc.keywords.inv:"This monadic function returns the matrix inverse. The function only works on matrixes with float values.";
.kdb.desc.keywords.key:"The keyword key is overloaded with several different functions. It can be used to return the keys of a dictionary or the keyed columns of a table. It can also be used to return a list of objects in a directory. Key can also be used to return a list of numbers from 0 to n-1, where n is a positive integer/long value.";
.kdb.desc.keywords.keys:"This function obtains the keys of a table.";
.kdb.desc.keywords.last:"This keyword returns the last atom in a list, the last row in a table as a ditionary or the last value in a dictionary.";
.kdb.desc.keywords.like:"This function performs a string match, where list1[i] matches pattern in list2[i]. ? is a wildcard denoting any one character while * is a wildcard denoting any number of characters. When characters are enclosed in square brackets, the match can be on any single character in the brackets.";
.kdb.desc.keywords.lj:"The lj (left join) verb joins tables on the key columns of its right argument. the left argument is a table, and the right argument is a keyed table, where the key columns must be a subset of the column of the left argument. More information can be found in the Basic Table Joins section.";
.kdb.desc.keywords.ljf:"(left join earlier version) The ljf verb joins tables on the key columns of its right argument. The left argument is an unkeyed table and the right argument is a keyed table. If the right table has a null in the same column that the left key table has a non null value, the resulting table keeps the non-null value.";
.kdb.desc.keywords.load:"This keyword loads a q data file.";
.kdb.desc.keywords.log:"This function returns the natural logarithm of a non-negative numeric value.";
.kdb.desc.keywords.lower:"This function converts symbols or strings to lowercase symbols or strings of the same type.";
.kdb.desc.keywords.lsq:"The lsq verb is a matrix divid. x and y must be floating point matrices with the same number of columns. The number of rows of y must be less than or equal to the number of columns, and the rows of y must be linearly independent.";
.kdb.desc.keywords.ltime:"Converts to local time.";
.kdb.desc.keywords.ltrim:"The ltrim function removes leading spaces from a string";
.kdb.desc.keywords.match:"Match is used to determine whether the two arguments are exactly identical. If they are exactly equivalent, matrch returns 1b. If they have any differences including type differences, match returns 0b. When comparing floats, comparison tolerance is used. It is also important to note that symbols from different enumerations will not match. Match depends on the datatype of arguments, not just the values.";
.kdb.desc.keywords.mavg:"Computes the n-number moving average of a list of numeric values. the function is uniform so that the moving average build up to the n-number one as the function goes along the list. The upshot of this is that the first atom of the output is the 1-number average of the input(first atom), the second is the 2-number average of the first and second atoms of the output and so forth and so on until the n-number moving average is reached. If the count of the list is m, and we perform n mvg list with n>=m, the moving average just up in the usual manner, so the i'th atom of the output is the i-number moving average starting from the beginning of the input list.";
.kdb.desc.keywords.max:"Comparison function to see what is the max between two items. The max of 2 chars is the one with the highest byte order. Max and min can also apply to boolean results";
.kdb.desc.keywords.maxs:"The maxs function is a primitive uniform function. The nth result is the maximum of the first n items in the argument.";
.kdb.desc.keywords.mcount:"The mcount function returns the N-item moving count of the non-null items in its right argument. The first N items are the counts up to that index. After this, the result is the moving count.";
.kdb.desc.keywords.md5:"This function exnrypts text using the message-digest algorithm 5.";
.kdb.desc.keywords.mdev:"This uniform function computes the moving standard deviation of a list of numeric values. The first atom of the output is always 0, as this is the measure of the deviation of a single number. the next atom of the output is the deviation of the first and second atoms of the input and and so forth until the n'th atom of the input list is reached. After that, the first atom of the input is dropped from consideration and the next one is added.";
.kdb.desc.keywords.med:"This function returns the mathematical median of a list of numeric values.";
.kdb.desc.keywords.meta:"Displays table meta data. the result is in the form of a keywed table with columns c,t,f,a. Where c is column name, t is data type, f is foreign key and a is attribute.";
.kdb.desc.keywords.min:"Comparison function to see what is the max between two items. The max of 2 chars is the one with the highest byte order. Max and min can also apply to boolean results.";
.kdb.desc.keywords.mins:"The mins function is a primitive uniform function. The nth result is the minimum of the first n items in the argument.";
.kdb.desc.keywords.minus:"Minus is a dyadic arithmetic function. Numeric datatypes can be mixed in arithmetic expressions and required conversions from one to another are automatic. The sum, product and difference of two bools are ints. the difference of two ints is always an int, the modulo two to the 32 power value of the mathematical result. Analogously the difference of two longs or a long and an int is always a long, the modulo 2 to the 64 value of the mathematical result";
.kdb.desc.keywords.mmax:"The mmax verb returns the N-item moving moaximum of its numeric right argument, with nulls after the first replaced by the preceding maximum. the first N items of the result are the maximums of the terms so far, and thereafter the result is the moving maximum.";
.kdb.desc.keywords.mmin:"The mmin verb returns the Nitem moving minimum of its numeric right argument, with nulls treated as the minimum value. The first N items of the result are the minimums of the terms so far, and therafter the result is the moving minimum.";
.kdb.desc.keywords.mmu:"This dyadic operator only works on matrices of type float. If a is a l x m matrix b is a m x n matrix, then a mmu b is a l x n matrix. This functions works for all matrices, except for the case of a column vector times a row vector. this is because both types of vectors are represented in the same way and mmu distinguishes between them according to the situation.";
.kdb.desc.keywords.mod:"The modulus function returns the remainder of m divided by n";
.kdb.desc.keywords.msum:"This uniform function is the n-number moving sum of the input list of numeric values. If n is greater than or equal to count list then the output is the same as that of the sums function. Until";
.kdb.desc.keywords.multiplication:"times is a dyadic arithmetic function. Numeric datatypes can be mixed in arithmetic expressions and required conversions from one to another are automatic. The sum, product and difference of two bools are ints. The product of two ints is always an int, the modulo 2^32 value of the mathematical result. Analogously, the product of two longs or a long and an int is always a long, the modulo 2^64 value of the mathematical result.";
.kdb.desc.keywords.neg:"Returns the negation of its argument and can be applied to all datatypes except sym and char. If the argument passed is an IPC handle, the message is sent asynchronously.";
.kdb.desc.keywords.next:"Returns the next item in a list for each element. The final value will be a null with the same type as the first item in the list. If the first item is a list the last value will be a list, its format depending on the make up of the first item. It can also be used to cycle through a list. This use of next is uniform, with the first atom 2 being dropped and the null int being tacked on the end.";
.kdb.desc.keywords.not:"There is one monadic relational function, named not. This function gives the relationship of all numeric values to zero: the result is 1b if the argument is identical to 0 and 0b if it is not.";
.kdb.desc.keywords.null:"The monadic function null is an atomic function whose result has the same structure as the as the argument, with each atom replaced by 1b if the atom is a null or 0b otherwise. This function is useful when replacing null values in a way other than that defined by fill. For example, suppose you want to replace the null values with their previous values. The where function used with null gives the indices of the null values. The replacement can then be done as well.";
.kdb.desc.keywords.over:"Over is an adverb which recusively applies a dyadic function a list where its first input is the previous result and second input is the next item in the list. Over returns only latest recursion. Ocer can either be denoted by the word over or a forward slash.";
.kdb.desc.keywords.parse:""
.kdb.desc.keywords.peach:""
.kdb.desc.keywords.pj:""
.kdb.desc.keywords.plus:""
.kdb.desc.keywords.prd:""
.kdb.desc.keywords.prds:""
.kdb.desc.keywords.prior:""
.kdb.desc.keywords.prev:""
.kdb.desc.keywords.rand:""
.kdb.desc.keywords.rank:""
.kdb.desc.keywords.ratios:""
.kdb.desc.keywords.raze:"return the items of x, collapsing one level of nesting"
.kdb.desc.keywords.read0:""
.kdb.desc.keywords.read1:""
.kdb.desc.keywords.reciprocal:""
.kdb.desc.keywords.reval:""
.kdb.desc.keywords.reverse:""
.kdb.desc.keywords.rload:""
.kdb.desc.keywords.rotate:""
.kdb.desc.keywords.rsave:""
.kdb.desc.keywords.rtrim:""
.kdb.desc.keywords.save:""
.kdb.desc.keywords.scan:""
.kdb.desc.keywords.scov:""
.kdb.desc.keywords.sdev:""
.kdb.desc.keywords.select:""
.kdb.desc.keywords.set:""
.kdb.desc.keywords.sevenv:""
.kdb.desc.keywords.show:""
.kdb.desc.keywords.signum:""
.kdb.desc.keywords.sin:""
.kdb.desc.keywords.sqrt:""
.kdb.desc.keywords.ss:""
.kdb.desc.keywords.ssr:""
.kdb.desc.keywords.string:""
.kdb.desc.keywords.sublist:""
.kdb.desc.keywords.sum:""
.kdb.desc.keywords.sums:""
.kdb.desc.keywords.sv:""
.kdb.desc.keywords.svar:""
.kdb.desc.keywords.system:""
.kdb.desc.keywords.tables:""
.kdb.desc.keywords.tan:""
.kdb.desc.keywords.til:""
.kdb.desc.keywords.trim:""
.kdb.desc.keywords.type:""
.kdb.desc.keywords.uj:""
.kdb.desc.keywords.ungroup:""
.kdb.desc.keywords.union:""
.kdb.desc.keywords.update:""
.kdb.desc.keywords.upper:""
.kdb.desc.keywords.update:"This function can be used to update certain information in a table. If the table name is passed by value, a table is returned with the updated results. If the table name is passed by reference the table name as a symbol is returned and the changes are persisted in the table.";
.kdb.desc.keywords.upper:
.kdb.desc.keywords.upsert:"The verb upsert inserts or updates new records to a table. If the table is keyed and a record matches on a keyed column, then the matching row is updated. Otherwise the record is inserted at the end of the table."
.kdb.desc.keywords.value:""
.kdb.desc.keywords.var:""
.kdb.desc.keywords.view:""
.kdb.desc.keywords.views:""
.kdb.desc.keywords.vs:""
.kdb.desc.keywords.wavg:""
.kdb.desc.keywords.where:""
.kdb.desc.keywords.within:""
.kdb.desc.keywords.wj:""
.kdb.desc.keywords.wj1:""
.kdb.desc.keywords.ww:""
.kdb.desc.keywords.wsum:""
.kdb.desc.keywords.xasc:""
.kdb.desc.keywords.xbar:""
.kdb.desc.keywords.xcol:""
.kdb.desc.keywords.xcols:""
.kdb.desc.keywords.xdesc:""
.kdb.desc.keywords.xexp:""
.kdb.desc.keywords.xgroup:""
.kdb.desc.keywords.xkey:""
.kdb.desc.keywords.xlog:""
.kdb.desc.keywords.xprev:""
.kdb.desc.keywords.xrank:""