--LEAD()
--Find next VAL1 in th same COL1 but order by COL2
SELECT COL1, COL2, LEAD(VAL1) OVER(PARTITION BY COL1 ORDER BY COL2) FROM TABLE

--LAG()
--Find the former VAL1 in th same COL1 but order by COL2
SELECT COL1, COL2, LAG(VAL1) OVER(PARTITION BY COL1 ORDER BY COL2) FROM TABLE
