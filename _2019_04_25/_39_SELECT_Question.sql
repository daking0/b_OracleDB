-- ���������� �ذ��ϼ���
1. ȭ�а� 1�г� �л� �� ������ ��������� �л��� �˻��ϼ���
SELECT AVG(avr)
             FROM student;

SELECT * 
FROM student
WHERE avr <= (SELECT AVG(avr)
             FROM student
             )
AND syear = '1' 
AND major = 'ȭ��';
             
2. �Ϲ� ȭ���� �����ϴ� �л� �� ������ ���� ���� �л��� �̸��� �˻��ϼ���

SELECT sname
FROM student
NATURAL JOIN course
NATURAL JOIN score
WHERE result IN (SELECT MIN(result)
                FROM student
                NATURAL JOIN course
                NATURAL JOIN score
                WHERE cname = '�Ϲ�ȭ��')
AND cname = '�Ϲ�ȭ��';

3. 10�� �μ� ������ ������ ������ Ÿ�μ� ����� �˻��ϼ���
SELECT * FROM emp;

SELECT *
FROM emp
WHERE sal = (SELECT sal
              FROM emp
              WHERE dno = 10)
AND dno != '10';

4. �⸻��� ������ 
��ȭ�а��񺸴� ����� ������ 
������ ��� �������� �˻��ϼ���
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
                HAVING cname = '��ȭ��'
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
--                HAVING cname = '��ȭ��'
--                );

5. 10�� �μ� ������ �޿� �� ������ ������ Ÿ �μ� ����� �˻��ϼ���
SELECT eno, ename, sal, sal*12+NVL(comm,0),dno
  FROM emp e1
  WHERE e1.dno != 10
  AND (sal, sal*12+NVL(comm,0)) = (SELECT ALL sal, sal*12+NVL(comm,0)
                                     FROM emp e2
                                     WHERE dno = 10);

-- DML�� ó���ϼ���
1. st_score���̺� �� �л��� ������ �а���, ���񺰷� �Է��ϼ���
 - SELECT * FROM st_score;�� �ϸ� �а���, ���񺰷� ���ĵ� ���°� �Ǹ� �˴ϴ�.
 SELECT * FROM st_score;
 
INSERT INTO st_score (sno, sname, major, syear, cno, cname, result)
SELECT sno, sname, major, syear, cno, cname, result
FROM student
            JOIN score USING (sno)
            JOIN course USING (cno)
            ORDER BY major, cname;

2. ȭ�а� �л��� �����ϴ� ������ �����ϴ� ������ �������ڸ� 1�� �ʵ��� �����ϼ���

UPDATE professor
SET hiredate = hiredate + 365
WHERE pno IN (SELECT DISTINCT pno
              FROM student
              JOIN score USING (sno)
              JOIN course USING (cno)
              JOIN professor USING (pno)
              WHERE major = 'ȭ��');