--1. 송상 교수가 강의하는 과목을 검색한다.
SELECT *
FROM professor
WHERE pname IN('송강');

--2. 화학 관련 과목을 강의하는 교수의 명단을 검색한다.
SELECT *
FROM course;

SELECT *
FROM professor;

SELECT p.pno 교번, p.pname 이름, c.cname 과목명 
FROM professor p, course c
WHERE p.pno = c.pno AND c.cname LIKE '%화학%'; 

--3. 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다.
SELECT p.pno 교번, p.pname 이름, c.cname 과목명 , c.st_num 학점
FROM professor p, course c
WHERE p.pno = c.pno AND c.st_num = 2; 

--4. 화학과 교수가 강의하는 과목을 검색한다.
SELECT p.pname 이름, c.cname 과목
FROM professor p, course c
WHERE c.pno = p.pno AND p.section = '화학';