--1)���� : ������ ���� ����
--        ���� �������� ���� ���� �˻��Ǵ� ��
--        �����ڸ� �����ϸ� ������ ���������� ����
--2)��� 
--SELECT [DISTINCT|ALL] �÷�, �÷�...
--FROM ���̺�
--WHERE �÷� <���� �� ������> (SELECT ���� : Sub Query)
--
--a) ���� ������ ���� ���� ���� �˻��Ǵ� �������� ���� �� ���� ������� �Ѵ�.
--b) ���� �� ���� ������ ���� �� �����ڸ� �̿��Ѵ�
--c) ���� �� �������� ����
--   IN : �˻��� �� �߿� �ϳ��� ��ġ�ϸ� ���̴�
--   ANY : �˻��� �� �߿� ���ǿ� �´� ���� 1�� �̻��̸� ���̴�
--   ALL : ��� �˻��� ���� ���ǿ� �¾ƾ� ���̴�


--20�� �μ������ ������ �����ڷκ��� ���� �޴� ����� �˻�
1) 20�� �μ������� ������ ��ȣ�� �˻�
SELECT mgr
FROM emp
WHERE dno = '20';

2) �˻��� ������ ��ȣ�� ������ �������� ����� �˻� 
SELECT eno, ename, mgr, dno
FROM emp
WHERE mgr IN('0202' , '1002');

3)����� ��ģ��
SELECT eno, ename, mgr, dno
FROM emp
WHERE mgr IN(SELECT mgr
             FROM emp
             WHERE dno = '20');
             
--10�� �μ����麸�� �޿��� ���� ����� �˻��ϼ���
1)01�� �μ������� �޿��� �˻�
SELECT sal
FROM emp
WHERE dno = '01';

2)�˻��� �޿��麸�� ���� ��� �˻�
SELECT eno, ename, dno, sal
FROM emp
WHERE sal < 3510
AND dno != '01';

3)��ģ��
SELECT eno, ename, dno, sal
FROM emp
WHERE sal < ALL(SELECT sal
            FROM emp
            WHERE dno = '01')
ORDER BY sal;

SELECT *
FROM emp
WHERE sal <(SELECT MIN(sal)
              FROM emp
              WHERE dno = '01')
ORDER BY sal;

--���� �� �����ڿ� �׷� �Լ�
--*���� �� �������� ALL�̳� ANY�� ������ ���� �׷��Լ��� �̿��ؼ� ǥ���� �� �ִ�.
--a) �÷� > ALL -> �÷� > MAX : ���� ū ������ ũ��
--b) �÷� < ALL -> �÷� < MIN : ���� ���� ������ �۴�
--c) �÷� > ANY -> �÷� > MIN : ���� ���� ������ ũ��
--d) �÷� < ANY -> �÷� < MAX : ���� ū ������ �۴�

20�� �μ������ ���ʽ��� ���� ����� �˻��Ѵ�.
1)20�� �μ������� ���ʽ� �˻�
SELECT eno, ename, comm
FROM emp
WHERE comm IN(SELECT NVL(comm,0)
              FROM emp
              WHERE dno = '20')
AND dno != '20';
