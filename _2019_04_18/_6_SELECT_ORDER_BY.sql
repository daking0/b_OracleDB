--1) ����: ���ĵ� ������ �˻�
--2) ���
--SELECT �÷�, �÷�, ...
--FROM ���̺�
--ORDER BY [ASC/DESC], �÷�[ASC,DESC]...
-- a) ORDER BY : ������ �÷��� ������� ������ ����
-- b) ASC : �������� ����, DESC�� �������� ����
--          �������� ������ ���������� �⺻��.
-- c) ���Ĵ���� �÷��� ���� ���� ��� �տ� ������
--    �÷��� ������ ���� ���ؼ� ������ �÷�����
--    ���ĵȴ�. �� ���� �÷��� ������ ������ �ʴ�
--    ���� ������ �� ��° �÷����� ������ �����Ѵ�.
-- d) �������� �ʴ� SELECT���� ��� ������ �ǹ̰� ����.
-- e) ���� ������δ� �÷��̿��� ������ �͵��� ��밡��.
--    ����/����/�˻��׸��� ����

--����� �̸��� �޿� ������ �˻��Ѵ�.
SELECT eno ���, ename �̸�, sal �޿� FROM emp ORDER BY sal DESC;

SELECT eno ���, ename �̸�, sal �޿� FROM emp ORDER BY sal ASC;

--����� ����� �̸��� ���������� �˻��Ѵ�.
SELECT eno ���, ename �̸�, sal*12+NVL(comm, 0) ���� FROM emp ORDER BY sal*12+NVL(comm, 0) DESC;

SELECT eno ���, ename �̸�, sal*12+NVL(comm, 0) ���� FROM emp ORDER BY ���� DESC;

--�Ʒ� �ΰ��� ����
SELECT eno, ename, sal FROM emp ORDER BY eno;
SELECT eno, ename, sal FROM emp ORDER BY 1;

SELECT eno, ename, sal FROM emp ORDER BY ename;
SELECT eno, ename, sal FROM emp ORDER BY 2;

SELECT eno, ename, sal FROM emp ORDER BY sal;
SELECT eno, ename, sal FROM emp ORDER BY 3;

--�� �μ����� ����� �޿��� �˻��Ѵ�.
--�� �޿��� ���� �޴� ������� �˻��Ѵ�.

SELECT * FROM emp;

SELECT dno �μ���ȣ, eno ���, ename �̸�, sal �޿� FROM emp
ORDER BY �μ���ȣ, �޿� DESC ;

--SQL������ ~���� �˻��� ��
--1) ORDER BY
--2) GROUP�Լ��� ���