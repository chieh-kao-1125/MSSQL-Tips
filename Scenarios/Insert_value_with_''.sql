INSERT INTO [dbo].[TARGET]
VALUES ('ID_1', 
'SELECT (A.VALUE - B.VALUE) AS VALUE, A.YEARMONTH FROM 
(SELECT YEARMONTH, VALUE FROM dbo.SOURCE WHERE ID = ' + '''ID1_1_1''' + ') A,
(SELECT YEARMONTH, VALUE FROM dbo.SOURCE WHERE ID = ' + '''ID1_1_2''' + ') B
WHERE A.YEARMONTH = B.YEARMONTH', 
'SELECT VALUE, YEARMONTH FROM dbo.SOURCE WHERE ID = ' + '''ID1_2''', 
'ID_NAME_1'
)
