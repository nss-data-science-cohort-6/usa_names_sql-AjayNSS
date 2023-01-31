--SQL Names
--Save a script containing the query you used to answer each question and your answer (as a comment).
--1.	How many rows are in the names table?
-- Select Count(*)
-- FROM names;
--=1957046
--2.	How many total registered people appear in the dataset?
-- Select Count(num_registered)
-- FROM names;
--=1957046
--3.	Which name had the most appearances in a single year in the dataset?
-- SELECT name, year, MaX(num_registered) AS Most_Names
-- FROM names
-- GROUP BY Name, year
-- ORDER by Most_Names desc, Year
-- LIMIT 1;
--4.	What range of years are included?
-- SELECT Distinct(Year)
-- from names 

-- SELECT min(year) AS Min_Year,  Max(year) AS Max_year
-- from names

--=Year starting from 1880, 2018
--5.	What year has the largest number of registrations?
--  SELECT  year, SUM(num_registered) AS num_registered_Total
-- from names
-- group by year
-- order by num_registered_Total desc

--= Year 2008 has largest registartions =	35079
--6.	How many different (distinct) names are contained in the dataset?
-- SELECT count(DISTINCT(Name))
-- From names
--=Distinct names= 98400
-- 7.	Are there more males or more females registered?
-- SELECT gender, count(gender), sum(num_registered)
-- From names 174079232
-- GROUP by gender
--= There are more Males registered (177573793) 
--= Females registered are 174079232
-- 8.	What are the most popular male and female names overall (i.e., the most total registrations)?
-- SELECT name, sum(num_registered)
-- from names
-- group by name
-- order by 2 desc

-- "James"	5187679
-- "John"	5146508
-- "Robert"	4840228
-- "Michael"	4384463
-- 9.	What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
-- SELECT Name, gender, sum(num_registered) AS Num_Registered
-- from names
-- WHERE year between 2000 and 2009
-- GROUP BY Name, gender
-- order by Num_Registered desc, gender

-- "Jacob"	"M"	273844
-- "Michael"	"M"	250554
-- "Joshua"	"M"	231926
-- "Emily"	"F"	223690

-- 10.	Which year had the most variety in names (i.e. had the most distinct names)?
-- SELECT  year, count(distinct(name)) as Dist_Names
-- from names
-- group by year
-- order by Dist_Names desc
-- limit 1;

--=Year 2008 had 32518 Distinct names

-- 11.	What is the most popular name for a girl that starts with the letter X?
-- SELECT Name, gender, sum(num_registered) AS Num_Registered
-- from names
-- WHERE name LIKE 'X%'
-- AND gender = 'F'
-- GROUP BY Name, gender
-- ORDER by Num_Registered desc
-- LIMIT 1;

--=="Ximena"	"F"	26145

-- 12.	How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
-- SELECT count(distinct(Name))
-- from names
-- WHERE name LIKE 'Q%' AND name not LIKE '_u%'

--= 46

-- 13.	Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
----REVISIT
-- select distinct name, sum(num_registered) as Most_Popular
-- from names
-- where name between 'Stephen' and 'Steven'
-- AND gender = 'M'
-- group by name
-- order by 2 desc

-- 14.	What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?
-- ANS= 10.94 % names are Unisex
SELECT (SUM(Unisex_names ) * 100.0)/ COUNT(*) 
FROM(
		SELECT name, Case when count(distinct(gender)) > 1 then 1
						end AS Unisex_names
		FROM names
		GROUP BY name	
	) as Sub1
	
	
   
					   

-- 15.	How many names have made an appearance in every single year since 1880?
--ANS = 921 names

--part 1 - Validate names have count year = 139
SELECT DISTINCT name, count(distinct year) as Dist_Year
FROM names
GROUP BY name
HAVING COUNT(DISTINCT year) = (SELECT COUNT(DISTINCT year) FROM names)


--part 2- Get the count of names
SELECT COUNT(name)
FROM
(
	SELECT DISTINCT name
	FROM names
	GROUP BY name
	HAVING COUNT(DISTINCT year) = (SELECT COUNT(DISTINCT year) FROM names)
	) AS Sub1

-- 16.	How many names have only appeared in one year?
--ANS = 21123
SELECT COUNT(name)
FROM
(
	SELECT DISTINCT name, count(distinct year) as Dist_Year
	FROM names
	GROUP BY name
	HAVING COUNT(DISTINCT year) = 1
) AS Sub
 



-- 17.	How many names only appeared in the 1950s?
--ANS = 661
Select count( Distinct Name)
from names
where name not in
(
	SELECT DISTINCT YEAR
	FROM names
	WHERE year <  1950 OR year > 1959
)
And Year between 1950 and 1959

-- 18.	How many names made their first appearance in the 2010s?
--ANS = 11270
	
Select count(  Distinct Name)
from names
where name not in
(
SELECT DISTINCT Name
	FROM names
	WHERE year < 2010 
	
)




-- 19.	Find the names that have not be used in the longest.
-- 20.	Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.






