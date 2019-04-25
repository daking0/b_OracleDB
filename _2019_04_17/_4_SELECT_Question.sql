SELECT * FROM tab;
--1. 각 과목의 학점수와 담당교수 번호를 검색한다
SELECT * FROM course;
SELECT cname 과목명, st_num 학점, pno "담담교수 번호" FROM course;

--2. 각 학생들이 속한 학과와 학년을 검색한다
SELECT * FROM student;
SELECT sname 이름, major 학과, syear 학년 FROM student;

--3. 모든 학생의 평균 평점을 검색한다
SELECT avr "평균 평점" FROM student;

--4. 학생들의 성별을 검색한다.
SELECT sex 성별 FROM student;

--5. 각 학생의 평점을 검색한다
SELECT avr "평균 평점" FROM student;

--6. 각 과목의 학점수를 검색한다
SELECT cname 과목명, st_num 학점수 FROM course;

--7. 각 교수의 지위를 검색한다
SELECT pname 교수명, orders 지위 FROM professor;

--8. 급여를 10% 인상했을 때 연간 지급되는 급여를 검색한다.
SELECT * FROM emp;
SELECT ename 이름, sal 급여, sal+(sal*0.1) "10% 인상 된 급여" FROM emp;

SELECT eno 사번, ename 사원이름, sal 급여, NVL(comm,0) 보너스, sal*12+NVL(comm,0) 
연봉, (sal*1.1)*12+NVL(comm,0) "10% 인상된 연봉" FROM emp;

--9. 현재 학생의 평균 평점은 4.0 만점이다. 이를 4.5만점으로 환산해서 검색한다.
SELECT sname 이름, avr*1.125 "환산 평균 평점" FROM student;

--10. 급여가 10% 인상될 경우 각 사원의 연봉을 검색한다
SELECT ename 이름, sal+(sal*0.1)+NVL(comm, 0) "10% 인상된 연봉" FROM emp;

--11. 1년 동안 지급되는 급여와 10% 인상되어 1년 동안 지급되는 급여 간에 차액을 검색한다
SELECT ename 이름, (sal+(sal*0.1)+NVL(comm, 0)) - (sal+NVL(comm, 0)) "작년 대비 상승 연봉값" FROM emp;

--12. 각 학생들의 평균평점을 4.5만점으로 환산한 경우 각각 평점의 상승폭은 얼마인지 검색한다.
SELECT sname 이름,(avr*1.125) - avr "환산 시 상승점수" FROM student;


DESC emp