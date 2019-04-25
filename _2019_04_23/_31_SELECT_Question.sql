-- �׷��Լ��� GROUP BY���� �̿��ϼ��� --
1. 3�г� �л��� �а��� ���� ��հ� �л� �� ������ �˻��ϼ���
SELECT major �а�, AVG(avr) �������, ROUND(VARIANCE(avr),3) �л�,ROUND(STDDEV(avr),3)����
FROM student
WHERE syear =3
GROUP BY major;

2. �����а� �г⺰ ��� ������ �˻��ϼ���
SELECT syear �г�, AVG(avr) �������
FROM student
WHERE major = '����'
GROUP BY syear;

3. �� �л��� �⸻��� ����� �˻��ϼ���
SELECT sno �л���ȣ, sname �л���, ROUND(AVG(result),2) �⸻���
FROM student
NATURAL JOIN score
GROUP BY sno, sname;

4. �� �а��� �л� ���� �˻��ϼ���
SELECT major �а���, COUNT(sname) �л���
FROM student
GROUP BY major;

5. ȭ�а��� �����а� �л� 4.5ȯ�� ������ ����� ���� �˻��ϼ���
SELECT major ����, ROUND(AVG(avr*1.125),3) �������
FROM student
WHERE major IN('ȭ��','����')
GROUP BY major;

6. �������� 10�� �̻� �� ���޺�(������, ������, �α���)������ ���� �˻��ϼ���
SELECT orders ����, COUNT(pname) �����Ǽ�
FROM professor
WHERE TO_CHAR(sysdate,'YYYY')-TO_CHAR(hiredate,'YYYY') >=10
GROUP BY orders;
--WHERE (sysdate - hiredate) / 365 >= 10

7. ����� ȭ���� ���Ե� ������ ������ ������ �˻��ϼ���
SELECT SUM(st_num) ����
FROM course
WHERE  INSTR(cname,'ȭ��')!= 0;
--WHERE cname LIKE '%ȭ��%';

8. �����а� �л����� �⸻��� ������ ���������� �˻��ϼ���
SELECT sname �л���,cname �����, result ����, ROUND(AVG(result)) ���������
FROM student
NATURAL JOIN score
NATURAL JOIN course
WHERE major = '����'
ORDER BY result;

SELECT st.sno �й�, sname �л���, ROUND(AVG(result), 2) ���������
FROM student st, score sc 
WHERE st.sno=sc.sno AND major='����' 
GROUP BY st.sno, sc.sno, sname 
ORDER BY ��������� DESC;

9. �а��� �⸻��� ����� ���������� �˻��ϼ���
SELECT major �а�, ROUND(AVG(result),3) ���
FROM student
JOIN score USING(sno)
GROUP BY major
ORDER BY ROUND(AVG(result),3) DESC;

-- HAVING���� �̿��ϼ��� --
1. �����а��� �����ϰ� �л����� ���� ����� �˻��ϼ���
SELECT major �а�,ROUND(AVG(avr),3) �������
FROM student
GROUP BY major
HAVING major != '����';

2. �����а��� ������ �� �а��� ��� �����߿� ������ 2.0�̻��� ������ �˻��ϼ���
SELECT major �а�,ROUND(AVG(avr),3) �������
FROM student 
GROUP BY major
HAVING AVG(avr) >= 2.0
AND major != '����';

3. �⸻��� ����� 60���̻��� �л��� ������ �˻��ϼ���(�й��� �⸻��� ���)
SELECT sno �й�, AVG(result) �⸻������
FROM score
JOIN student USING(sno)
GROUP BY sno
HAVING AVG(result) >= 60;

4. ���� �������� 3���� �̻��� ������ ������ �˻��ϼ���(������ȣ, �̸��� ��� ������)
SELECT pno ������ȣ, pname �����̸�, st_num ������
FROM course
JOIN professor USING (pno)
GROUP BY pno, pname, st_num
HAVING st_num >= 3
ORDER BY pno;