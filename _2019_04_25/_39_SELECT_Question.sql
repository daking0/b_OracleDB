-- 서브쿼리로 해결하세요
1. 화학과 1학년 학생 중 평점이 평균이하인 학생을 검색하세요
SELECT AVG(avr)
             FROM student;

SELECT * 
FROM student
WHERE avr <= (SELECT AVG(avr)
             FROM student
             )
AND syear = '1' 
AND major = '화학';
             
2. 일반 화학을 수강하는 학생 중 성적이 가장 낮은 학생의 이름을 검색하세요

SELECT sname
FROM student
NATURAL JOIN course
NATURAL JOIN score
WHERE result IN (SELECT MIN(result)
                FROM student
                NATURAL JOIN course
                NATURAL JOIN score
                WHERE cname = '일반화학')
AND cname = '일반화학';

3. 10번 부서 사원들과 연봉이 동일한 타부서 사원을 검색하세요
SELECT * FROM emp;

SELECT *
FROM emp
WHERE sal = (SELECT sal
              FROM emp
              WHERE dno = 10)
AND dno != '10';

4. 기말고사 성적이 
핵화학과목보다 우수한 과목의 
과목명과 담당 교수명을 검색하세요
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM score;
SELECT * FROM professor;

SELECT DISTINCT pname ,cname,AVG(result)
FROM course 
NATURAL JOIN professor
NATURAL JOIN score 
GROUP BY cname, pname
HAVING AVG(result) > (SELECT AVG(result)
                FROM score
                NATURAL JOIN course
                NATURAL JOIN professor
                HAVING cname = '핵화학'
                GROUP BY cname);
                
--SELECT cname, pname ,AVG(result)
--FROM profesoor
--JOIN course USING (pno)
--JOIN score USING (cno)
--GROUP BY cname, pname
--HAVING AVG(result) > (SELECT AVG(result)
--                FROM course
--                NATURAL JOIN professor
--                NATURAL JOIN score
--                GROUP BY cname
--                HAVING cname = '핵화학'
--                );

5. 10번 부서 사원들과 급여 및 연봉이 동일한 타 부서 사원을 검색하세요
SELECT eno, ename, sal, sal*12+NVL(comm,0),dno
  FROM emp e1
  WHERE e1.dno != 10
  AND (sal, sal*12+NVL(comm,0)) = (SELECT ALL sal, sal*12+NVL(comm,0)
                                     FROM emp e2
                                     WHERE dno = 10);

-- DML로 처리하세요
1. st_score테이블에 각 학생의 평점을 학과별, 과목별로 입력하세요
 - SELECT * FROM st_score;를 하면 학과별, 과목별로 정렬된 상태가 되면 됩니다.
 SELECT * FROM st_score;
 
INSERT INTO st_score (sno, sname, major, syear, cno, cname, result)
SELECT sno, sname, major, syear, cno, cname, result
FROM student
            JOIN score USING (sno)
            JOIN course USING (cno)
            ORDER BY major, cname;

2. 화학과 학생이 수강하는 과목을 강의하는 교수의 부임일자를 1년 늦도록 수정하세요

UPDATE professor
SET hiredate = hiredate + 365
WHERE pno IN (SELECT DISTINCT pno
              FROM student
              JOIN score USING (sno)
              JOIN course USING (cno)
              JOIN professor USING (pno)
              WHERE major = '화학');