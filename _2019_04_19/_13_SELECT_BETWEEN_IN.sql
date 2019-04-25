--1) ���� : BETWEEN �����ڿ� IN������
--
--2) ���
--SELECT [DISTINCT|ALL] �÷�, �÷�...
--FROM ���̺�
--WHERE �÷� BETWEEN ��1 AND ��2
--ORDER BY �÷� [ASC/DESC], �÷� [ASC/DESC]...
-- a) �÷� >= ��1 AND �÷� <= ��2 �� �����ϴ�.
-- b) �÷��� ���� ��1���� ��2������ ���� �˻��Ѵ�.
-- c) ��1�� �ݵ�� ��2���� �۾ƾ� �Ѵ�.
-- d) AND�����ڷ� ȯ�� ���������� �б� ���� ������
--    BETWEEN..AND�� ����ϴ� ���� ����.
--    
--�޿��� 1000���� 2000 �̳��� ���
SELECT* 
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

--�μ���ȣ�� 10, 20�� ����� �˻��ϼ���.
SELECT *
FROM emp
WHERE dno BETWEEN '10' AND '20';

SELECT *
FROM emp
WHERE dno >= '10' AND dno <= '20';

--1992�⿡�� 1996�� ���̿� �Ի��� ����� �˻��ϼ���.
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD';
SELECT *
FROM emp
WHERE hdate BETWEEN '1992/01/01' AND '1996/12/31'
ORDER BY hdate;

--'1992/01/01' ==> '1992/01/01:00:00:00'
--'1996/12/31' ==> '1996/12/31:00:00:00'
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD:HH24:MI:SS';
SELECT *
FROM emp
WHERE hdate BETWEEN '1992/01/01:00:00:00' AND '1996/12/31:23:59:59'
ORDER BY hdate;

--�ݵ�� BETWEEN���� ���� ���� ���� ������ �۾ƾ� �Ѵ�.
--�޿��� 2000���� 1000�� ����� �˻��ϼ���.
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000
ORDER BY sal DESC;

--3)IN �������� ���
--SELECT [DISTINCT|ALL] �÷�, �÷�...
--FROM ���̺�
--WHERE �÷� IN (��1, ��2 ...)
--ORDER BY �÷� [ASC/DESC], �÷� [ASC/DESC]...
-- a) ������ ���߿� ��ġ�ϴ� ���� �ϳ��� ������ �˻��ȴ�.
-- b) OR����� =�����ڷ� ��ȯ �����ϴ�.
-- c) �������� �ſ� ����ϴ�.
-- d) IN�����ڴ� ���߿� ��������, ��Ƽ�� ���� ���� ��ɿ�
--    ���Ǵ� �߿��� �������̴�.

--�����̳� ���� ������ ����ϴ� ����� �˻��ϼ���.
SELECT *
FROM emp
WHERE job IN('����', 'ȸ��')
ORDER BY job;

�μ���ȣ�� 10, 20�� ��������� �˻��ϼ���.
SELECT *
FROM emp
WHERE dno IN('10', '20')
ORDER BY dno;

--BETWEEN ��1 AND ��2 : Java if (��1<=a)&&(a<=��2)����
--IN(��1, ��2, ...)   : Java Switch~case