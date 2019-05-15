CREATE VIEW 
AS(SELECT
   FROM
   WHERE
);
--1번
--1-1
CREATE VIEW syear_sal
AS (SELECT ename, eno, sal*12+NVL(comm,0)
    FROM emp
);

--1-2
CREATE VIEW score_st
AS(SELECT sname, sno, avr*1.125
   FROM student
);

--1-3
CREATE VIEW avr_co
AS(SELECT cname,c.cno, AVG(result) 평균
   FROM course c, score s
   WHERE c.cno = s.cno
   GROUP BY c.cname, c.cno
);

--1-4
CREATE VIEW mgr_name
AS(SELECT mgr, e1.name, e.ename
   FROM emp1 e1, emp e
   WHERE e1.eno = e.eno;
);

--1-5
CREATE VIEW score_f
AS(SELECT s.sno, s.sname, co.cname, sc.grade, c.result 
   FROM student s, scgrade sc , score c, course co 
   WHERE s.sno = c.sno 
   AND c.cno = co.cno
   AND result BETWEEN sc.loscore AND sc.hiscore
   AND grade = 'F'
);

--2번
--1. 각 과목별로 기말고사가 일등인 학생의 명단을 검색할 뷰 생성
-- 과목별 최대 점수
CREATE VIEW stu_first
AS(SELECT c.cno, cname, s.sno, sname, result 점수
   FROM student s
   JOIN score r ON s.sno = r.sno
   JOIN course c ON c.cno = r.cno
   WHERE result = (SELECT MAX(result)
                   FROM score s
                   GROUP BY cno
                   HAVING s.cno = r.cno)
);

SELECT *
FROM stu_first
ORDER BY cname;

--2-2번
CREATE VIEW physt
AS(
  SELECT pname, section, sname
  FROM professor
  JOIN course USING (pno)
  JOIN score USING (cno)
  JOIN student USING (sno)
  WHERE section = '물리'
);


--3번
SELECT ROWNUM, eno, ename, NVL(sal,0)*12+NVL(comm,0) ansal
FROM emp
WHERE ROWNUM <= 3
ORDER BY ansal DESC;

SELECT ROWNUM
FROM
WHERE ROWNUM
ORDER BY;
--3-1
SELECT ROWNUM, sno, sname , 평균
FROM ( SELECT sno, sname , (avr * 1.125) 평균
       FROM student
       ORDER BY 평균 DESC
       )
WHERE ROWNUM <=3;

--3-2

SELECT ROWNUM, sno, sname , cname, major, result
FROM student s, (SELECT cname, result 
                 FROM score sc , course c
                 WHERE sc.cno = c.cno
                 AND cname ='유기화학'
                 )
WHERE ROWNUM <=3
AND major = '화학';

--3-3번
SELECT ROWNUM, cname, 평균
FROM (SELECT cname, AVG(result) 평균
      FROM  score s,course c
      WHERE s.cno =c.cno
      GROUP BY cname
      ORDER BY 평균 DESC
     )
WHERE ROWNUM <=3;

--4번
--4-1
SELECT ROWNUM, major, syear, 평균
FROM (SELECT major,syear, AVG(result) 평균
      FROM  score sc, student s
      WHERE sc.sno =s.sno
      GROUP BY major, syear
      ORDER BY 평균 DESC
     )
WHERE ROWNUM <=3;

--4-2번
select * from professor;
select * from score;
select * from course;

SELECT pname, cname, 평균
FROM  professor p,(SELECT AVG(result) 평균,cname, pno
                   FROM  score s, course c
                   WHERE s.cno =c.cno
                   GROUP BY cname, pno
                   ORDER BY 평균 DESC) s
                   
WHERE p.pno = s.pno 
AND ROWNUM <=3;
