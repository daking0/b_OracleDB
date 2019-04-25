--1) ���� : �׷��Լ��� HAVING��
--        HAVING���� WHERE���� �����ϴ�.
--        �� ���� ���뿡 �׷� �Լ��� �����ϴ� �͸��� �����Ѵ�.
--        �Ϲ� ������ WHERE �� ��������� �׷� �Լ��� ������ ������ HAVING���� ����Ѵ�.
--        
--2) ���
--SELECT [DISTINCT/ALL] �÷� OR �׷��Լ�...
--FROM ���̺�
--WHERE ����
--GROUP BY �׷���
--HAVING �׷��Լ� ��������
--ORDER BY ���Ĵ�� [ASC/DESC];
--a) HAVING : ���� �߿� �׷��Լ��� �����ϴ� ������ ����Ѵ�
--b) HAVING���� GROUP BY �� �ڿ� ����Ѵ�

--�μ��� �޿� ����� 3õ�޷� �̸��� �μ��� �μ���ȣ�� ��� �޿��� �˻��Ѵ�. 
-- ~���̸� GROUP BY
SELECT dno, ROUND(AVG(sal))
FROM emp
GROUP BY dno
HAVING AVG(sal) < 3000;

--�Ʒ��� job�� �׷����� ���� �÷��� �ƴϱ� ������ HAVING���� ����ϸ� �ȵȴ�.
--HAVING���� dno�� ���� �͸� �־�� �Ѵ�
SELECT dno �μ���ȣ, COUNT(*) �ο���
FROM emp
GROUP BY dno
HAVING job != '����'; 

--�Ϲ��÷��� job�� WHERE���� �Űܾ� �Ѵ�
SELECT dno �μ���ȣ, COUNT(*) �ο���
FROM emp
WHERE job != '����'
GROUP BY dno;

--GROUP���� ���� �÷��� HAVING���� ������ ����Ѵ�.
SELECT dno �μ���ȣ, COUNT(*) �ο���
FROM emp
WHERE job != '����'
GROUP BY dno
HAVING dno != '10';

SELECT dno �μ���ȣ, job ����, COUNT(*) �ο���
FROM emp
GROUP BY dno, job
HAVING job != '����'; 