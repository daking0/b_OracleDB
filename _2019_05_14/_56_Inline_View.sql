--1) �ζ��� ��
--  ;�ζ��κ�(Inline View)�� FROM ���� ����� ���������� �ǹ��Ѵ�.
--  �ζ��� ��� ���̺� ��ü�� ���ǿ����� �̿����� �ʰ�
--  �� �� �Ϻθ��� ���ǿ����� ����ϴ� ����̴�.
--  �� �� ���� ������ ����� ������ ������� �˻��� �����ν�
--  �ܼ� SQL �������� �پ��� ����� ������ �� ������
--  RDBMS �� Ư������ ���� �ܼ� �������� ������ ����� ������ �ذ��ϴµ� ���� ���ȴ�.

--2) ���
--SELECT ...
--FROM (SELECT �� : sub query ��) ����
--...
--  (1) ���� ������ ������ �ο��� ��� �ζ��� �䰡 �����ȴ�
--  (2) �ζ��� ��� ������ ����Ǵ� ���ȸ� �����ϴ� ���̴�

--�� �μ��� �ּ� �޿��ڸ� �˻��Ѵ�
SELECT eno, ename, d.dno, sal, msal
FROM emp e,(SELECT dno, MIN(sal) msal
            FROM emp
            GROUP BY dno
            )d
WHERE e.dno = d.dno
AND sal = msal;
--�� ������ ������ inline view�� �������

--ROWNUM �� �̿��� TOP-N �м�
--FROM (SELECT .. ORDER BY ...)
--WHERE ROWNUM <= N; 
--  (1) ��/���� N���� ���� �˻��Ѵ�
--  (2) �ζ��� �信 �ݵ�� ORDER BY ���� �ʿ��ϴ�
--  (3) ROWNUM �� �˻��� ���� �����̴�

--EMP���̺�κ��� 3������� �˻��Ѵ�
SELECT ROWNUM, eno, ename, job, mgr, hdate
FROM emp
WHERE ROWNUM <= 3;

--�ֻ��� ������ ���޹޴� 3���� �˻��Ѵ�
--�Ʒ�ó�� �ζ��� ��� �����ؼ� �˻��ؾ� ��Ȯ�� ����� ��´�
SELECT ROWNUM, eno, ename, ansal
FROM (SELECT eno, ename, NVL(sal,0)*12+NVL(comm,0) ansal
      FROM emp
      ORDER BY ansal DESC
      )
WHERE ROWNUM <= 3;

-- ROWNUM �� �����ϴ� ���̺��� �д� ������ �����Ѵ�. commit �������� 3�� ����
SELECT eno, ename, NVL(sal,0)*12+NVL(comm,0) ansal
FROM emp
WHERE ROWNUM <= 3
ORDER BY ansal DESC;


