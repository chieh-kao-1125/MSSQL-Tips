DECLARE @test varchar(30);
SET @test = 'This is a sentence'

--Returns the SECOND instance of a space (' ')
SELECT CHARINDEX(' ', @test, CHARINDEX(' ', @test)+1)

--Result 8

--Returns the LENGTH of the second word
SELECT CHARINDEX(' ', @test, CHARINDEX(' ', @test)+1) - (CHARINDEX(' ', @test) + 1)

--Result 2

--Uses the findings to return the second word
SELECT SUBSTRING(@test, CHARINDEX(' ', @test) + 1 , CHARINDEX(' ', @test, CHARINDEX(' ', @test)+1) - (CHARINDEX(' ', @test) + 1))

--Result is
