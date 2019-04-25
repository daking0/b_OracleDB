1) ���� : NATURAL JOIN(�ڿ� ����)
         ������ Ÿ�԰� �̸��� ���� �÷��� ���� ��������
         �̿��ϴ� ���� ������ �� �� ������ ǥ���ϴ�
         ���(� ����)
         
2) ���
SELECT �÷�, ...
FROM ���̺�1
NATURAL JOIN ���̺�2
WHERE �˻�_����;
 a) ���� ���̺� �����ϴ� ���� �÷��� SELECT�� ����� ��,
    ���� ���� ������� �޸� ���̺� �̸��� �����ϰ� �÷��� ǥ���Ѵ�.
 b) �ݵ�� �� ���̺� ���� ������ �� �ִ� ������ �̸�, Ÿ���� ���� �÷��� �ʿ��ϴ�.
 c) ���ο� �̿�Ǵ� �÷��� ������ ������� �ʾƵ� �ڵ����� ���ο� ���ȴ�.
 d) ������ �̸��� ���� �÷��� ������ Ÿ���� �ٸ� �� ������ �߻��Ѵ�.
 e) ���� ������ �� �ʿ䰡 ����.
 
-- �ڿ� �������� �� ����� �ٹ� �μ��� �˻��Ѵ�.
 SELECT eno ���, ename �̸�, dno �μ���ȣ, dname �μ���
 FROM emp
 NATURAL JOIN dept;
 SELECT *
 FROM emp;
 SELECT *
 FROM dept;
 
 SELECT eno ���, ename �̸�, dept.dno �μ���ȣ, dname �μ���
 FROM dept, emp
 WHERE dept.dno = emp.dno;
 
-- �ڿ� ������ �̿��ؼ� ���ֿ��� �ٹ��ϴ� ������ ����� �˻��ض�
-- (�μ���ȣ�� �μ��� �˻��Ѵ�)
 SELECT loc �ٹ�ó, dno �μ���ȣ, dname �μ���, eno ���, ename �̸�
 FROM dept
 NATURAL JOIN emp
 WHERE loc = '����';
 
 SELECT loc �ٹ�ó, dno �μ���ȣ, dname �μ���, eno ���, ename �̸�
 FROM emp
 NATURAL JOIN dept
 WHERE loc = '����';
 
 1) ���� : USING ���� ������ ����
 
 2) ���
    dept1 ���̺�� emp1 ���̺��� �ڿ� ������ ��� 
    2�� ���̺��� ���� dno�� name�� �̸��� Ÿ���� ��� ���� �ȴ�.
    �׷��� �����δ� name�� �쿬�� ���� ������ ������ ���� �ٸ��Ƿ�
    ���ϴ� ����� ���� �� ���� �ȴ�. �� �� ��Ȯ�� ������ ���ؼ� ����ϴ� ���� Using���̴�.
    SELECT �÷�, ...
    FROM ���̺�1
    JOIN ���̺�2 USING (����_�÷�) [{JOIN ���̺�3 USING (����_�÷�)}...]
    WHERE �˻�_����
     a) USING���� ���ο� ���� �÷��� ��������� �����Ѵ�.
     b) ��쿡 ���� �ڿ� �������� �ٲ� ǥ���� �� ������ NATURAL���� USING���� �Բ� ����� �� ����.
     c) �� �� ���̺� �̻� ������ ��� �������� ����.
     d) ���ο� �̿���� ���� ���� �̸��� ���� �÷��� �÷��� �տ� ���̺� ���� ����Ѵ�.
    
 SELECT eno ���, loc �ٹ�ó
 FROM dept1
 NATURAL JOIN emp1;
 
 SELECT eno ���, loc �ٹ�ó
 FROM dept1, emp1
 WHERE dept1.dno = emp1.dno
 AND dept1.name = emp1.name;
 
-- USING���� �̿��ؼ� �� ����� �ٹ� �μ��� �˻��Ѵ�.
SELECT eno ���, ename �̸�, dno �μ���ȣ, dname �μ���
FROM emp
JOIN dept USING (dno);

--USING���� �̿��ؼ� ���ֿ��� �ٹ��ϴ� ������ ����� �˻��Ѵ�.
SELECT loc �ٹ�ó, dno �μ���ȣ, dname �μ���, eno ���, ename �̸�
FROM dept
JOIN emp USING (dno)
WHERE loc = '����';

--USING���� �̿��ؼ� ȭ�а� 1�г� �л����� ����ȭ�� ������ �˻��ϼ���.
SELECT *
FROM student;
SELECT *
FROM score;
SELECT *
FROM course;

SELECT *
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE major = 'ȭ��' AND cname = '����ȭ��';




