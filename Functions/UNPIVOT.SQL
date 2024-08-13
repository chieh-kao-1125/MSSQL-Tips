--Return table to the way it should be in database.
--Create sample table first
CREATE TABLE yourtable
	([ItemId] int, [Year] int, [PurchasingValue] int, [SellingValue] int)
	
INSERT INTO yourtable ([ItemId], [Year], [PurchasingValue], [SellingValue])
VALUES
	(1, 2000, 1000, 900),
	(1, 2001, 1100, 990),
	(1, 2002, 1200, 1080),
	(1, 2003, 1300, 1170),
	(2, 2000, 500, 450),
	(2, 2001, 550, 495),
	(2, 2002, 600, 540),
	(2, 2003, 650, 585)

--UNPIVOT
--Columns that are going to be unpivoted should be all listed.
SELECT * FROM yourtable
UNPIVOT
(
Value FOR CATEGORY IN (PurchasingValue, SellingValue)
) UNP
--Value is the name of the value column, while CATEGORY is the name of the column containing original column names.

/* Original:
ItemId	Year	PurchasingValue	SellingValue
1	2000	1000	900
1	2001	1100	990
1	2002	1200	1080
1	2003	1300	1170
2	2000	500	450
2	2001	550	495
2	2002	600	540
2	2003	650	585
*/

/* Result:
ItemId	Year	Value	CATEGORY
1	2000	1000	PurchasingValue
1	2000	900	SellingValue
1	2001	1100	PurchasingValue
1	2001	990	SellingValue
1	2002	1200	PurchasingValue
1	2002	1080	SellingValue
1	2003	1300	PurchasingValue
1	2003	1170	SellingValue
2	2000	500	PurchasingValue
2	2000	450	SellingValue
2	2001	550	PurchasingValue
2	2001	495	SellingValue
2	2002	600	PurchasingValue
2	2002	540	SellingValue
2	2003	650	PurchasingValue
2	2003	585	SellingValue
*/
