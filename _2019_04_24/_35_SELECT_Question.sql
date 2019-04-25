--단일행 서브쿼리로 해결하세요
1. 관우보다 평점이 우수한 학생의 학번과 이름을 검색하세요
SELECT sno, sname,avr
FROM student
WHERE avr >(SELECT avr 
            FROM student
            WHERE sname = '관우');

2. 관우와 동일한 학년 학생중에 평점이 사마감과 동일한 학생을 검색하세요
  SELECT sno, sname, syear, avr
  FROM student
  WHERE avr = (SELECT avr
              FROM student
              WHERE sname = '사마감')
  AND syear = (SELECT syear
              FROM student
              WHERE sname = '관우');
              
3. 관우보다 일반 화학과목의 학점이 더 낮은 학생의 명단을 학점과 검색하세요
SELECT sno, sname, grade
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
JOIN scgrade ON result BETWEEN loscore AND hiscore
WHERE grade > (SELECT grade
               FROM student
               JOIN score USING (sno)
               JOIN course USING (cno)
               JOIN scgrade ON result BETWEEN loscore AND hiscore
               WHERE sname='관우'
               AND cname='일반화학')
AND cname='일반화학';

4. 인원수가 가장 많은 학과를 검색하세요
SELECT major, COUNT(sno)
FROM student
GROUP BY major
HAVING COUNT(sno) =(SELECT MAX(COUNT(sno))
                      FROM student
                      GROUP BY major);

5. 학생 중 기말고사 성적이 가장 낮은 학생의 정보를 검색하세요
SELECT sno, sname, AVG(result)
FROM student
NATURAL JOIN score
GROUP BY sno, sname
HAVING AVG(result) = (SELECT MIN(AVG(result))
                      FROM student
                      NATURAL JOIN score
                      GROUP BY sno, sname);

SELECT st.sno, sname, AVG(result) 
FROM student st, score sc 
WHERE st.sno=sc.sno
GROUP BY st.sno, sname 
HAVING AVG(result)=(SELECT MIN(AVG(result)) 
                    FROM student st, score sc 
                    WHERE st.sno=sc.sno
                    GROUP BY st.sno, sname);

--다중행이나 다중열 서브쿼리로 해결하세요
6. 화학과 학생의 평점이 동일한 학생들을 검색하세요
SELECT  *
FROM student s1
WHERE major !='화학' AND avr IN(SELECT avr FROM student s2 WHERE major='화학' AND s1.sno != s2.sno);

7. 화학과 교수와 부임일이 같은 직원을 검색하세요
SELECT *
FROM professor p
NATURAL JOIN emp e
WHERE e.hdate IN(SELECT p.hiredate
                  FROM professor
                  WHERE section = '화학');
                  
8. 화학과 학생과 같은 학년에서 평점이 동일한 학생들을 검색하세요
SELECT sno, sname, major, avr
FROM student
WHERE (syear, avr) IN (SELECT syear, avr
                     FROM student
                     WHERE major = '화학' )
AND major != '화학';

-- 그룹함수나 Having절로 해결하세요
9. 근무 중인 직원이 4명이상인 부서를 검색하세요(부서번호, 인원)
SELECT dno, COUNT(ename)
FROM emp
GROUP BY dno
HAVING COUNT(ename) >= 4;

10. 업무별 평균 연봉이 2만불 이상인 업무를 검색하세요
SELECT job,AVG((sal*12)+NVL(comm,0))
FROM emp
GROUP BY job
HAVING AVG((sal*12)+NVL(comm,0)) >= 20000;

11. 각 학과의 학년별 인원중 인원이 6명 이상인 학년을 검색하세요
SELECT major, syear, COUNT(sname)
FROM student
GROUP BY syear,major
HAVING COUNT(major)>= 6;