--1) ���� : �л�� ���̺�� ���� �ʿ��� ������ ������ ��
--         �̷��� ���� ���̺�κ��� �����͸� �˻��ϴ� ����
--         ����(Join)�̶��ϰ�, ������ ���̺��� ����(Realation)��
--         �ٰ����� �����Ѵ�.
--         � ����    : �� ���̺��� ���� ���� ã�� ����
--         �� ����  : �� ���̺��� ���� �ٸ� ���� �ε�ȣ�� ����
--
--2) ���
-- SELECT ���̺�1.�÷�, ... ���̺�2.�÷�...
-- FROM ���̺�1, ���̺�2
-- WHERE ����_����
-- AND �Ϲ�_����
--  a) ���� ������ �� ���̺��� ���踦 �������� ǥ���� ���̴�.
--  b) ���� ���忡�� ����� ��� ���̺��� �ݵ�� ���� ������
--     ����ȴ�.
--  c) ������ �̸��� �÷��� ���� ���̺� �����ϴ� ��� ���̺� �̸���
--     �ݵ�� ���༭ � ���̺��� �÷����� �˷���� �Ѵ�.
--  d) ���� ������ SELECT���� ���� ���̺��� ������ ���� �޶�������
--     ���̺� ������ n�̶�� �׻� ���� ������ ������ (n-1)�� �̻��̴�.
--  e) ���� ���ǿ� '='�� �̿��ϴ� ������ � ����(Equi-join)�̶�� �ϰ�,
--     �ε�ȣ�� ���Ե� ���� ������ �̿��ϴ� ��� �� � ����(Non equi-join)�̶�� �Ѵ�.

--�� ����� �ٹ� �μ��� �˻��Ѵ�.
SELECT *
FROM emp;

SELECT *
FROM dept;

SELECT eno ���, ename �̸�, emp.dno �μ���ȣ,
       dept.dno �μ���ȣ, dname �μ���
FROM emp, dept
WHERE dept.dno = emp.dno;

SELECT emp.eno ���, emp.ename �̸�, emp.dno �μ���ȣ,
       dept.dno �μ���ȣ, dept.dname �μ���
FROM emp, dept
WHERE dept.dno = emp.dno;

--���ֿ��� �ٹ��ϴ� ������ ����� �˻��Ѵ�.
--(�μ���ȣ�� �μ��� �˻��Ѵ�)

SELECT emp.eno ���, emp.ename �̸�, emp.dno �μ���ȣ, dept.dname �μ���, dept.loc �ٹ�����
FROM emp, dept
WHERE dept.dno = emp.dno AND dept.loc IN ('����');

--���̺� ���� ���̱�
--sql���� SELECT ������ FROM���� ���� ����ȴ�.
--�ֳ��ϸ� SELECT���� �÷��� ���̺� �����ϴ� �� ���θ� �Ǵ��ؾ� �ϱ� ������.
--�׷��� ���̺��� ������ ���̸�, �÷������� �������� �÷��� ȣ���ؾ� �Ѵ�.

SELECT e.eno ���, e.ename �̸�, e.dno �μ���ȣ, d.dname �μ���, d.loc �ٹ�����
FROM emp e, dept d
WHERE e.dno = d.dno AND d.loc IN ('����');

--�� ������ �޿��� 10% �λ��� ��� �޿� ����� �˻��Ѵ�.
--(emp, salgrade)
SELECT *
FROM emp;

SELECT *
FROM salgrade;

SELECT e.eno ���, e.ename �̸�, (e.sal*1.1) "10% �λ� �� �޿�", s.grade ���
FROM emp e, salgrade s
WHERE e.sal*1.1 BETWEEN s.losal AND s.hisal
ORDER BY e.sal DESC;

--���� ������ ���� �߸��� ���ι���
--*�ݵ�� ���� ������ �־�� �Ѵ�.
--���� ������ �����ϰ� �Ǹ� ��� ���� 1:1�� ������
--�߸��� ��� ��(Cartesian product)�� ��� �ȴ�.
--���� ����(Cross Join)
SELECT d.dno, dname, e.dno, ename
FROM emp e, dept d;
