--1. ������ 3.0���� 4.0 ������ �л��� �˻��ϼ���.
SELECT *
FROM student
WHERE avr BETWEEN 3.0 AND 4.0
ORDER BY avr DESC;

--2. 1994�⿡�� 1995����� ������ ������ ����� �˻��ϼ���.
SELECT *
FROM professor
WHERE hiredate BETWEEN '1994/01/01' AND '1995/12/31'
ORDER BY hiredate;

--3. ȭ�а��� �����а�, �����а� �л��� �˻��ϼ���.
SELECT *
FROM student
WHERE major IN('ȭ��', '����', '����')
ORDER BY major, avr DESC;

--4. �������� �������� �˻��ϼ���.
SELECT *
FROM professor
WHERE orders IN('������', '������')
ORDER BY orders;

--5. �������� 1����, 2������ ������ �˻��ϼ���.
SELECT *
FROM course
WHERE st_num IN(1, 2)
ORDER BY cname;

--6 1,2�г� �л� �߿� ������ 2.0���� 3.0������ �л��� �˻��ϼ���.
SELECT *
FROM student
WHERE syear IN ('1', '2') AND avr BETWEEN '2.0' AND '3.0'
ORDER BY syear DESC, avr DESC;

--7. ȭ��, �����а� �л� �߿� 1,2�г� �л��� ���������� �˻��ϼ���.
SELECT *
FROM student
WHERE major IN('ȭ��', '����') AND syear IN('1', '2')
ORDER BY major, syear, avr DESC;
