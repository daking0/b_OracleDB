CREATE VIEW 
AS(SELECT
   FROM
   WHERE
);
--1��
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
AS(SELECT cname,c.cno, AVG(result) ���
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

--2��
--1. �� ���񺰷� �⸻��簡 �ϵ��� �л��� ����� �˻��� �� ����
-- ���� �ִ� ����
CREATE VIEW stu_first
AS(SELECT c.cno, cname, s.sno, sname, result ����
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

--2-2��
CREATE VIEW physt
AS(
  SELECT pname, section, sname
  FROM professor
  JOIN course USING (pno)
  JOIN score USING (cno)
  JOIN student USING (sno)
  WHERE section = '����'
);


--3��
SELECT ROWNUM, eno, ename, NVL(sal,0)*12+NVL(comm,0) ansal
FROM emp
WHERE ROWNUM <= 3
ORDER BY ansal DESC;

SELECT ROWNUM
FROM
WHERE ROWNUM
ORDER BY;
--3-1
SELECT ROWNUM, sno, sname , ���
FROM ( SELECT sno, sname , (avr * 1.125) ���
       FROM student
       ORDER BY ��� DESC
       )
WHERE ROWNUM <=3;

--3-2

SELECT ROWNUM, sno, sname , cname, major, result
FROM student s, (SELECT cname, result 
                 FROM score sc , course c
                 WHERE sc.cno = c.cno
                 AND cname ='����ȭ��'
                 )
WHERE ROWNUM <=3
AND major = 'ȭ��';

--3-3��
SELECT ROWNUM, cname, ���
FROM (SELECT cname, AVG(result) ���
      FROM  score s,course c
      WHERE s.cno =c.cno
      GROUP BY cname
      ORDER BY ��� DESC
     )
WHERE ROWNUM <=3;

--4��
--4-1
SELECT ROWNUM, major, syear, ���
FROM (SELECT major,syear, AVG(result) ���
      FROM  score sc, student s
      WHERE sc.sno =s.sno
      GROUP BY major, syear
      ORDER BY ��� DESC
     )
WHERE ROWNUM <=3;

--4-2��
select * from professor;
select * from score;
select * from course;

SELECT pname, cname, ���
FROM  professor p,(SELECT AVG(result) ���,cname, pno
                   FROM  score s, course c
                   WHERE s.cno =c.cno
                   GROUP BY cname, pno
                   ORDER BY ��� DESC) s
                   
WHERE p.pno = s.pno 
AND ROWNUM <=3;
