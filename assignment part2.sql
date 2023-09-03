use assignment;
set sql_safe_updates=0;

#SET 2
#Q1
select *
from employee
where salary > 3000 AND deptno = 10;

#Q2
select * from students;
select *,
     CASE
      WHEN marks BETWEEN 40 AND 49.99 THEN 'Third Class'
            WHEN marks BETWEEN 50 AND 59.99 THEN 'First Class'
            WHEN marks BETWEEN 60 AND 79.99 THEN 'Second Class'
            WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
            ELSE 'Failed'
    END as Grade        
  from students;
  
  #a)
  select *
	from (  select *,
		       CASE
			   WHEN marks BETWEEN 40 AND 49.99 THEN 'Third CLass'
			   WHEN marks BETWEEN 50 AND 59.99 THEN 'Second CLass'
			   WHEN marks BETWEEN 60 AND 79.99 THEN 'First CLass'
			   WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
			   ELSE 'Failed'
			END as Grade
		 From students ) as ss
			where ss.grade = 'First Class';
#b)
select *
	from (  select *,
		       CASE
			   WHEN marks BETWEEN 40 AND 49.99 THEN 'Third CLass'
			   WHEN marks BETWEEN 50 AND 59.99 THEN 'Second CLass'
			   WHEN marks BETWEEN 60 AND 79.99 THEN 'First CLass'
			   WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
			   ELSE 'Failed'
			END as Grade
		 From students ) as ss
			where ss.grade = 'Distinction';
            
#Q3)
select * from station;

select distinct * from station
where id % 2 =0;
 
 #Q4)
 select count(city) as 'total number of city' from station;
 select count(distinct city) as 'total number of distinct city' from station;
 select count(city) - count(distinct city) as difference from station;
 
 #Q5)
 #a)
select city
from station
where city regexp '^a|^e|^i|^o|^u'
GROUP BY city;

#b)
select city
From station
where city regexp '^a|^e|^i|^o|^u' AND
              city regexp 'a$|e$|i$|o$|u$'
GROUP BY city
order by city;

#c)
select city 
from station 
where city not regexp '^a|^e|^i|^o|^u'
group by city
order by city;

#d)
select city
from station 
where city not regexp '^a|^e|^i|^o|^u' or
city not regexp 'a$|e$|i$|o$|u$';

#Q6)
SELECT *
FROM Emp 
WHERE Salary > 2000
  AND Hire_Date<=DATE_SUB(CURRENT_DATE(),INTERVAL 36 MONTH)
ORDER BY emp_no ;

#Q7)
select * from employee;

select deptno, sum(salary) as totol_salary
from employee
group by deptno;

#Q8)
select name as City, population
from city
where population > 100000
order by population desc;

#Q9)
select district,sum(population) from city
where district = 'california'
group by district;

#Q10)
select district , avg(population) as Avg_Population
from city
group by district;

#Q11)
select o.ordernumber, 
       o.status, 
       o.customernumber, 
       c.customername, 
       o.comments
from customers c 
JOIN orders o
USING (customernumber)
Where o.status = 'Disputed';



 
 
 
