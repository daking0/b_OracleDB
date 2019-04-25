--1)���� : ���� ����
--        ���� ������ �� �̻��� SQL������ ���ؼ� ������� ������ 
--        ������ ���� ����(Sub Query : ���� ����)�� ���� �˻��� ��� ���� SQL���� �ʿ��� ��쿡 ���ȴ�.
--        �� ���� ������ SQL���� ���� ���� SELECT������ �ǹ��ϸ�,
--        �̶� SQL������ ���� ����(Main Query:�ܺ� ����)�� �Ҹ���
--        ���� ������ WHERE��, HAVING���� ���� ���� ���� �ַ� ���̰�, FROM���� ���̴� ��쵵 �ִ�.
--        FROM���� ���� ������ ���� ���� �ζ��� ��(Inline View)��� �θ���.
--        
--2)��� 
--*���� �� ���� ����
--: ���� ���� ���忡�� �� �ϳ��� ��� ���� �˻��ϴ� SQL���̴�.
--Ư�� �˻��� ��� ���� ���ǹ��� �̿��ϴ� ��� ���� ���ȴ�.
--SELECT [DISTINCT|ALL] �÷�, �÷�...
--FROM ���̺�
--WHERE �÷� <���� �� ������> (SELECT ���� : Sub Query��)
--
--a) ���� �� �����ڰ� �������� �ݵ�� ���� ������ ��� ���� �� ���� �˻��Ǿ� �Ѵ�.
--b) ���� ������ �ݵ�� ��ȣ�� ���´�.
--c) ���� ������ �˻��� ��� ���� ���� �������� ���ȴ�.
--d) ���� �� ������ �����ʿ� ����Ѵ�
--   <=, <, > , <=, >=, !=
--e) WHERE���� ����� ���� ���ڿ� Ÿ���� SELECT���� 1:1 ���� ���谡 �Ǿ�� �Ѵ�.
--
--�迬�ƺ��� �޿��� ���� �޴� ����� �˻��Ѵ�.
--1) �迬���� �޿��� ��´�
SELECT sal 
FROM emp
WHERE ename = '�迬��';

--2) �ش� �޿����� ���� �޴� ����� �˻��Ѵ�.
SELECT eno, ename
FROM emp
WHERE sal > 3300;

--3)�������� ��ģ��
SELECT eno, ename
FROM emp
WHERE sal > (SELECT sal 
            FROM emp
            WHERE ename = '�迬��');
            
--�����ΰ� �μ��� �ٸ��� ������ ������ �ϴ� ����� ������ �˻��Ѵ�
1) �������� �μ��� �˻��ϼ���
SELECT dno 
FROM emp
WHERE ename = '������';

2) �������� ������ �˻��ϼ���
SELECT job
FROM emp
WHERE ename = '������';

3) 1), 2) ����� �μ��� �ٸ��� ������ ������ ����� �˻��ϼ���
SELECT eno, ename, dno, job
FROM emp
WHERE dno != '20'
AND job ='����';

4)��ģ��
SELECT eno, ename, dno, job
FROM emp
WHERE dno != (SELECT dno 
              FROM emp
              WHERE ename = '������')
AND job =(SELECT job
          FROM emp
          WHERE ename = '������');
          
--�μ��߿� �޿��� ���� ���� �޴� �μ��� �˻��ϼ���
1) �μ��� ��ձ޿��� ���� ū ���� �˻��Ѵ�
SELECT dno, AVG(sal) 
FROM emp
GROUP BY dno;

SELECT MAX(AVG(sal)) 
FROM emp
GROUP BY dno;

2) �� ���� ������ ��ձ޿��� ���� �μ��� �˻��Ѵ�
SELECT dno '�޿��� ���� ���� �޴� �μ�'
FROM emp
GROUP BY dno 
HAVING ANG(sal) = 4070;

3)��ģ��
SELECT dno '�޿��� ���� ���� �޴� �μ�', AVG(sal)
FROM emp
GROUP BY dno 
HAVING ANG(sal) = (SELECT MAX(AVG(sal)) 
                   FROM emp
                   GROUP BY dno);
                   
--�λ꿡�� �ٹ��ϴ� ����� ������ �˻��ϼ���
1)�λ꿡 �ִ� �μ��� �˻�
SELECT dno 
FROM dept
WHERE loc = '�λ�';

2)�ش� �μ��� ��� ������ �˻�
SELECT eno, ename
FROM emp
WHERE dno = '20';

3)��ģ��
SELECT * 
FROM emp
WHERE dno = (SELECT dno 
       FROM dept
       where loc = '�λ�');
       
SELECT *
FROM emp
NATURAL JOIN dept 
WHERE loc ='�λ�';

SELECT *
FROM emp
JOIN dept USING (dno)
WHERE loc ='�λ�';