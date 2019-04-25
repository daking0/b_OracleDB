*NATURAL JOIN or Using
1.송강교수가 강의하는 과목을 검색하세요

SELECT *
FROM course;
select *
from professor;

select *
from course
natural join professor
where pname='송강';

2.화학 관련 과목을 강의하는 교수의 명단을 검색하세요

select *
from professor
join course using (pno)
where 

3.학점이 2학점인 과목과 이를 강의하는 교수를 검색하세요
