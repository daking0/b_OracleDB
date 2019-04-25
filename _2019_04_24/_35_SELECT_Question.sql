--������ ���������� �ذ��ϼ���
1. ���캸�� ������ ����� �л��� �й��� �̸��� �˻��ϼ���
SELECT sno, sname,avr
FROM student
WHERE avr >(SELECT avr 
            FROM student
            WHERE sname = '����');

2. ����� ������ �г� �л��߿� ������ �縶���� ������ �л��� �˻��ϼ���
  SELECT sno, sname, syear, avr
  FROM student
  WHERE avr = (SELECT avr
              FROM student
              WHERE sname = '�縶��')
  AND syear = (SELECT syear
              FROM student
              WHERE sname = '����');
              
3. ���캸�� �Ϲ� ȭ�а����� ������ �� ���� �л��� ����� ������ �˻��ϼ���
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
               WHERE sname='����'
               AND cname='�Ϲ�ȭ��')
AND cname='�Ϲ�ȭ��';

4. �ο����� ���� ���� �а��� �˻��ϼ���
SELECT major, COUNT(sno)
FROM student
GROUP BY major
HAVING COUNT(sno) =(SELECT MAX(COUNT(sno))
                      FROM student
                      GROUP BY major);

5. �л� �� �⸻��� ������ ���� ���� �л��� ������ �˻��ϼ���
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

--�������̳� ���߿� ���������� �ذ��ϼ���
6. ȭ�а� �л��� ������ ������ �л����� �˻��ϼ���
SELECT  *
FROM student s1
WHERE major !='ȭ��' AND avr IN(SELECT avr FROM student s2 WHERE major='ȭ��' AND s1.sno != s2.sno);

7. ȭ�а� ������ �������� ���� ������ �˻��ϼ���
SELECT *
FROM professor p
NATURAL JOIN emp e
WHERE e.hdate IN(SELECT p.hiredate
                  FROM professor
                  WHERE section = 'ȭ��');
                  
8. ȭ�а� �л��� ���� �г⿡�� ������ ������ �л����� �˻��ϼ���
SELECT sno, sname, major, avr
FROM student
WHERE (syear, avr) IN (SELECT syear, avr
                     FROM student
                     WHERE major = 'ȭ��' )
AND major != 'ȭ��';

-- �׷��Լ��� Having���� �ذ��ϼ���
9. �ٹ� ���� ������ 4���̻��� �μ��� �˻��ϼ���(�μ���ȣ, �ο�)
SELECT dno, COUNT(ename)
FROM emp
GROUP BY dno
HAVING COUNT(ename) >= 4;

10. ������ ��� ������ 2���� �̻��� ������ �˻��ϼ���
SELECT job,AVG((sal*12)+NVL(comm,0))
FROM emp
GROUP BY job
HAVING AVG((sal*12)+NVL(comm,0)) >= 20000;

11. �� �а��� �г⺰ �ο��� �ο��� 6�� �̻��� �г��� �˻��ϼ���
SELECT major, syear, COUNT(sname)
FROM student
GROUP BY syear,major
HAVING COUNT(major)>= 6;