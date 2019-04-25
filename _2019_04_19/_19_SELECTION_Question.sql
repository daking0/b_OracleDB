--1. '___학생의 4.5 환산 평점은 ___입니다'의 형태로 학생의 환산 평점을 출력한다.
SELECT *
FROM student;
SELECT sname||' 학생의 4.5 환산평점은 '||avr*1.125||'입니다.' 
FROM student;

--2. '___과목의 담당 교수 번호는 ___입니다'형태로 과목의 정보를 출력한다.
SELECT *
FROM course;
SELECT cname||' 과목의 담당교수 번호는 '|| pno ||'입니다.'
FROM course;

--3. 학교에 개설된 과목들은 몇 학점짜리인지 검색한다.
SELECT cname 개설과목, st_num 학점
FROM course;

--4. 학생들이 수강중인 과목의 과목번호를 검색한다.
SELECT *
FROM student;
SELECT *
FROM score;
SELECT *
FROM course;

SELECT DISTINCT c.cname, c.cno
FROM student s, score sc, course c
WHERE s.sno = sc.sno
AND sc.cno = c.cno
ORDER BY c.cname;

--5. 각 부서 별로 사원의 연봉 높은 순으로 검색한다
SELECT *
FROM emp;
SELECT ename 이름, (sal*12+NVL(comm, 0)) 연봉
FROM emp
ORDER BY (sal*12+NVL(comm, 0)) DESC;

--6. 급여가 10% 인상된 경우 부서별로 각 사원의 연봉을 높은 순으로 검색한다
SELECT ename 이름, ((sal*1.1)*12)+NVL(comm, 0) "급여가 10% 인상 된 연봉"
FROM emp
ORDER BY ((sal*1.1)*12)+NVL(comm, 0) DESC;

--7. 보너스가 100% 인상된 경우 업무별로 각 사원의 연봉을 높은 순으로 검색한다
SELECT ename 이름, ((sal*12)+2*(NVL(comm, 0)) "보너스가 100% 인상 된 연봉"
FROM emp
ORDER BY (sal*12)+NVL(comm, 0) DESC;


--8. 학과별 학년별로 학생의 정보를 성적순으로 검색한다
SELECT *
FROM student
ORDER BY major, syear, avr DESC;

--9. 4.5점으로 환산된 평점을 이용 학과별로 학생의 정보를 성적순으로 검색한다.
SELECT sname 이름, major 학과, avr*1.125 "환산된 평점"
FROM student
ORDER BY major, avr DESC;

--10. 학과 및 학년별로 학점이 2.0미만인 학생을 낮은 성적순으로 검색한다.



--11. 학과별로 부임일이 1998년 이전인 교수의 정보를 부임일 순으로 검색한다.

--12. 담당 교수가 정해지지 않은 과목을 학점순으로 검색한다.

--13. 보너스가 급여의 10% 이상인 사원을 검색한다.

--14. 화학과 학생 중에 성이 '사마'인 학생을 검색한다.

--15. 화학과 학생 중 4.5 환산 평점이 3.5 이상인 학생을 검색한다
SELECT sname 이름, syear 학년, major 학과, avr*1.125 "4.5 환산 학점"
FROM student
WHERE (avr*1.125) >=3.5 AND major = '화학'
ORDER BY syear, avr DESC;


--16. 화학과 이외 학과 학생의 평점을 각 학과 및 학년별로 검색한다

--17. 교수가 정해진 과목 중에 화학 관련 과목을 검색한다(이름에 '화학'이란 문자열이 있는 과목)

--18. 2000년 이후 부임한 교수 중에 직위가 부교수인 교수를 검색한다.

--19. 평점이 3.0에서 4.0사이의 학생을 학과별로 검색한다

--20. 물리, 화학과 학생 중 4.5 환산 평점이 3.5에서 4.0사이인 학생을 검색한다

--21. 물리, 화학과 학생의 정보를 학년별 성적순으로 검색한다

--22. 물리, 화학과 교수 중에 1999년에서 2000년 사이에 부임한 교수의 정보를 직위별로 검색한다.
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD:HH24:MI:ss';
--23. 제갈민의 입사일보다 빨리 부임한 교수의 명단을 검색한다.
SELECT*
FROM professor
WHERE hiredate 
--24. 송강 교수의 과목을 수강하는 학생의 기말고사 점수를 성적순으로 검색한다.

--25. 송강 교수가 강의하는 과목에서 평가 점수가 A인 학생의 명단을 과목명과 함께 검색한다.
SELECT * FROM student;
SELECT * FROM professor;
SELECT * FROM score;
SELECT * FROM scgrade;
SELECT * FROM course;

SELECT s.sname 이름
FROM student s, professor p, scgrade sg, score sc, course c
WHERE p.pno = c.pno
AND c.cno = sc.cno
AND sc.sno = s.sno
WHERE sc.result BETWEEN sg.loscore AND sg.hiscore;






--26. 화학과 1학년 학생에게 강의하는 교수의 명단을 검색한다.
SELECT *
FROM student;

SELECT *
FROM professor;

SELECT *
FROM course;

SELECT *
FROM score;

SELECT DISTINCT p.pname 교수이름
FROM student s, professor p, course c, score sc
WHERE p.pno = c.pno
AND c.cno = sc.cno
AND sc.sno = s.sno
AND s.syear = 1;