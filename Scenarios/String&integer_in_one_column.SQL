--If you only want to filter data which are integer, but there are stings in the column.

SELECT COL1, COL2, TRY_CAST(COL3 AS INTEGER) COL3 FROM TABLE
