-- 1) �Ұ�
--select�� : RDB(Relational DataBase) - ������ �����ͺ��̽�
--          ���� 99%�� ����� �ϴ� SQL��
--          �����͸� ������ �� ����Ѵ�.

--2) ���
--SELECT [�÷�, �÷�, ...]
--FROM ���̺�;

--3) ����
--a) ���̺�κ��� ������ �÷��� �˻��Ѵ�.
--b) '*'�� ��� �÷��� �˻��� �� ����Ѵ�.
--c) '*'�� ���� �˻��Ǵ� �÷��� ������ DESC������� �˻��Ѵ�.
--   �˻��� �÷� �����̴�.
--d) '*'�� �÷���� ���� ����� �� ���� �ݵ�� �ܵ����� ����Ѵ�.
--e) SELECT���̳� FROM���� ������ �� ����.

DB_Bitcamp
-- DESC ���̺��
-- ; ���̺� ������ �˻��Ѵ�.
-- ; �÷��� �̸�, ������ Ÿ���� �˻��Ѵ�.

--SQL���� ��ҹ��� ������ ���� �ʴ´�.
--�׷��� ���������� ������ ���ϱ� ���ؼ�
--SQL��ɾ �빮�ڸ�, ����� ���� �̸��� �ҹ��ڷ�
--SQL��ɾ �ҹ��ڸ�, ����� ���� �̸��� �빮�ڷ�
--����Ѵ�.
DESC course;

DESC student;

--���� ��Ű��(schema) - ���� ������ ������ DB�� ���̺� ����� �˻��Ѵ�.
SELECT * FROM tab;

--emp�� ��� ������ ���� �ʹ�.
--SELECT * FROM emp;
SELECT * FROM emp;

SELECT * FROM student;

--professor�� ��� ������ ���� �ʹ�.
SELECT * FROM professor;

emp���̺��� eno, ename, job�� ���� �ʹ�.
SELECT eno, ename, job FROM emp;

SELECT SNO, SNAME, MAJOR FROM student;

SELECT sname, sno, major FROM student;

--SELECT ����
--FROM daul;

dual�� ����Ŭ�� dummy ���̺�(�����̺��� �ƴ�)
SELECT 2+3 FROM dual;