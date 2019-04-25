SELECT * FROM tab;
--1. 모든 학생의 정보를 검색한다
SELECT * FROM student;

--2. 모든 교수의 정보를 검색한다.
SELECT * FROM professor;

--3. 모든 과목의 정보를 검색한다.
SELECT * FROM course;

--4. 기말고사 시험 점수를 검색한다.
SELECT sno 학번, cno 과목번호, RESULT "기말고사 점수" FROM score;

--5. 학생들의 학과와 학년을 검색한다.
SELECT sno 학번, sname 이름, major 전공, syear 학년 FROM student;

--6. 각 과목의 이름과 학점을 검색한다.
SELECT cname, st_num FROM course;

--7. 모든 교수의 직위를 검색한다.
SELECT pname, orders FROM professor;