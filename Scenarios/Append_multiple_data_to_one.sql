--Ordinary case
SELECT *, 
(SELECT ', ' + TEXT FROM TABLE_T A 
WHERE A.AD_ID = B.AD_ID AND A.YEARMONTH = B.YEARMONTH
ORDER BY B.YEARMONTH, B.AD_ID --In order to kee the order
FOR XML PATH(‘’)) TEXT 
FROM TABLE_T B

-- Add a new line between each data
SELECT *, 
REPLACE((SELECT ‘
‘ + TEXT FROM TABLE_T A --In order to add a new line
WHERE A.AD_ID = B.AD_ID AND A.YEARMONTH = B.YEARMONTH
ORDER BY B.YEARMONTH, B.AD_ID --In order to kee the order
FOR XML PATH(‘’)), ‘&#x0D;’, ‘’) TEXT --Use REPLACE() to remove code generated because of adding a new line
FROM TABLE_T B
