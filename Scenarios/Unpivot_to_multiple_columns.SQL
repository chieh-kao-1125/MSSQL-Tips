--Create sample table first
create table T (
no varchar(10),
yearx varchar(4),
z_type varchar(1),
A01 smallint,
B01 smallint,
A02 smallint,
B02 smallint,
A03 smallint,
B03 smallint
)
go

insert into T VALUES('Z01','2012','1',100,-10,200,30,50,60);
insert into T VALUES('Z01','2012','3',200,20,100,20,30,40);
insert into T VALUES('Z01','2013','3',300,30,10,50,70,30);

--Unpivot column names start with A to one column, and B to another.
SELECT no, yearx, z_type, RIGHT(CATA, 2) CAT, A, B FROM T
UNPIVOT
(
A FOR CATA IN (A01, A02, A03)
) UNP
UNPIVOT
(
B FOR CATB IN (B01, B02, B03)
) UNP
WHERE RIGHT(CATA, 2) = RIGHT(CATB, 2) --To filter out unnecessary duplictations. 
--The filter should be used depends on different circumstances.

/* Original:
no	yearx	z_type	A01	B01	A02	B02	A03	B03
Z01	2012	1	100	-10	200	30	50	60
Z01	2012	3	200	20	100	20	30	40
Z01	2013	3	300	30	10	50	70	30
*/

/* Result:
no	yearx	z_type	CAT	A	B
Z01	2012	1	01	100	-10
Z01	2012	1	02	200	30
Z01	2012	1	03	50	60
Z01	2012	3	01	200	20
Z01	2012	3	02	100	20
Z01	2012	3	03	30	40
Z01	2013	3	01	300	30
Z01	2013	3	02	10	50
Z01	2013	3	03	70	30
*/
