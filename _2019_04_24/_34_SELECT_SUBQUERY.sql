--1) ���� : ���� �� ���� ����
--        ���� ���� �÷��� �˻��Ѵ�
--        �ַ� 'IN'�� ��������� '='�� �����ϴ�
--
--2) ���
--SELECT [ DISTINCT|ALL] �÷�, �÷�...
--FROM ���̺�
--WHERE (�÷�1,�÷�2...) IN (SELECT�� : Sub Query)
--a) ���� ������ SELECT���� ���� ���� �÷��� �˻��Ѵ�
--b) ���� ���� �÷��� �˻��ϴ� ���� �������� �̿��� ����
--   �ݵ�� �� ��� �÷��� 1:1 �����Ǿ�� �Ѵ�.

--���ϴð� ������ �������� ������ �����鼭 ���ϴð� ������ ���� ���
1) ���ϴ��� �����ڿ� ������ �˻�
SELECT mgr, job
FROM emp
WHERE ename = '���ϴ�';

2) �˻������� ���� ����� �˻��Ѵ�
SELECT eno, ename
FROM emp
WHERE mgr = '0001'
AND job = '����'
AND ename != '���ϴ�';

3)��ģ��
SELECT eno, ename
FROM emp
WHERE (mgr, job) IN (SELECT mgr, job
                     FROM emp
                     WHERE ename = '���ϴ�')
AND ename != '���ϴ�';                    

--�����Ͱ� 1���� �ִٰ� ����� �� ���� �� ���������� ���� ����
SELECT eno, ename, mgr, job
FROM emp
WHERE mgr = (SELECT mgr
             FROM emp
             WHERE ename = '���ϴ�')
AND job = (SELECT job
           FROM emp
           WHERE ename = '���ϴ�')
AND ename != '���ϴ�';


SELECT eno, ename, mgr, job
FROM emp
WHERE mgr IN (SELECT mgr
             FROM emp
             WHERE ename = '���ϴ�')
AND job IN (SELECT job
           FROM emp
           WHERE ename = '���ϴ�')
AND ename != '���ϴ�';

--�� �μ����� �ּ� �޿��� �޴� ����� ������ �˻��Ѵ� (�̸�, �޿�)
1) �� �μ��� �ּ� �޿� �˻�
SELECT dno �μ���, MIN(sal) �ּұ޿�
FROM emp
GROUP BY dno;

2) �˻������ ���� ��� ���� �˻�
SELECT dno, ename, sal
FROM emp
WHERE (dno, sal) IN ();

3) ��ġ��
SELECT dno, ename, sal
FROM emp
WHERE (dno, sal) IN (SELECT dno �μ���, MIN(sal) �ּұ޿�
                     FROM emp
                     GROUP BY dno);
                     
                     