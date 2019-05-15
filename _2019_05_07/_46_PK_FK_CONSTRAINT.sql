--1) ���� ������ ���ؿ� ����(PK, FK)
--  ; ���� �����̶� ���̺� �������� �������� ���Ἲ�� �������ִ� ��Ģ�̴�.
--    ���������� ���̺� �����Ͱ� �Է�, ����, �����ǰų� ���̺��� ����, ����� ���
--    �߸��� Ʈ������� ������� �ʵ��� ������ ������ ���ɼ��� �ִ� �۾��� �����ϴ� ������ ����Ѵ�.
--    Ư�� PK�� FK�� ���̺��� �ʼ� ��ҷν� ��� ���̺��� �̵� �� �� �ϳ� �̻��� �ݵ�� �����ϰ� �ִ�.
--    
--2) ��������
--   (1) ���̺� �������� ���ǵǰ� ����ȴ�.
--   (2) ���Ӽ��� �����ϴ� ��� ���̺��� ������ �����ش�.
--   (3) �ڷᰡ ����, ����, ������ ������ ��Ģ�� ����ȴ�.
--   (4) �Ͻ������� Ȱ��ȭ�ϰų� ��Ȱ��ȭ�ϴ� ���� �����ϴ�.
--   (5) USER_CONSTRAINTS, USER_CONS_CONLUMNS ��ųʸ����� �˻��Ѵ�.
--   (6) ���� ������ ��üó�� �����ǹǷ� �ݵ�� �̸��� �ʿ��ϴ�.
--       ���� ���ǿ� �̸��� �������� ������ ����Ŭ ������ �ڵ����� SYS Cn������ �̸��� ���δ�.
--
--3) ����Ŭ���� �����Ǵ� ��������
--   (1) PRIMARY KEY(PK)
--   (2) FOREIGN KEY(FK)
--   (3) UNIQUE KEY(UK)
--   (4) NOT NULL
--   (5) CHECK 
--
--4) PRIMARY KEY ����
--CREATE TABLE ���̺�(
--...
--CONSTRAINT ���������̸� PRIMARY KEY(�÷�)
--);
--
--CREATE TABLE ���̺�(
--�÷� ������Ÿ�� CONSTRAINT ���������̸� PRIMARY KEY,
--...
--);
--
--  (1) ���̺��� ������ �� PX�� �����Ѵ�
--  (2) PK�� �� ���� �����ϰ� �ĺ��ϴ� ������ �Ѵ�.
--  (3) ���̺�� �ϳ��� ���� �����ϴ�
--  (4) ������ �÷����� �ߺ��� ���̳� NULL���� �Էµ� �� ����.
--  (5) PK�� ���� ������ �÷��� ���� �� ���� ���� �˻��� ���� ���ǰ� �����ϰ� ª�� �÷��� �����Ѵ�.
--  (6) �� �ĺ���, ��Ű, �ֽĺ��� ������ �Ҹ���.
--  (7) ���� �ε���(Unique Index)�� �ڵ����� �����ȴ�.
--
--5) FOREIGN KEY ����
----���س��� �̰� ���� �̰� ���� �̷� ������ ����
--CREATE TABLE ���̺�(
--...
--CONSTRAINT ���������̸� FOREIGN KEY(�÷�)
--REFERENCES �������̺� (�����÷�) [ON DELETE CASCADE]
--);
--
--CREATE TABLE ���̺�(
--�÷��� ������Ÿ�� CONSTRAINT ���������̸� FOREIGN KEY
--               REFERENCES �������̺� (�����÷�)
--               [ON DELETE CASCADE],
--...
--);
--
--  (1) FK�� ���ǵ� ���̺��� ����(�ڽ�) ���̺��̴�
--  (2) �����Ǵ� ���̺��� ����(�θ�) ���̺��̶�� �Ѵ�.
--  (3) ���� ���̺��� �̸� �����Ǿ� �־�� �Ѵ�.
--  (4) ���� ���̺��� �����Ǵ� �÷��� �����ϴ� ������ �Է��� �� �ִ�.
--  (5) ���� ���̺� �����Ǵ� ���� �����ʹ� FK�� �����ϴ� ������ ������ �Ұ����ϴ�.
--  (6) ���� ���̺��� FK�� ���� ������ �Ұ����ϴ�.
--  (7) ON DELETE CASCADE : �����Ǵ� ���� ���̺��� �࿡ ���� DELETE�� ����Ѵ�.
--      -�������̺��� �൵ ���� �������� �ɼ�
--  (8) �ڷ����� �ݵ�� ��ġ�ؾ� �Ѵ�
--  (9) �����Ǵ� �÷��� PK�̰ų� UK(Unique Key)�� �����ϴ�
--  (10) �ܺ�Ű, ����Ű, �ܺνĺ��� ������ �Ҹ���.
--
--6) ���̺��� �������� ��ȸ
SELECT c.table_name, c.constraint_name, 
c.constraint_type, s.column_name
FROM user_constraints c, user_cons_columns s
WHERE c.constraint_name = s.constraint_name 
AND c.table_name IN ('COURSE', 'SCORE')
ORDER BY c.table_name ;

SELECT p.table_name �������̺�,
       p.constraint_name ������������,
       c.table_name �������̺�,
       c.constraint_name ������������
FROM user_constraints p, user_constraints c
WHERE c.r_constraint_name = p.constraint_name
AND p.table_name IN ('COURSE', 'STUDENT')
ORDER BY p.table_name;


DROP TABLE emp;
DROP TABLE dept;

PURGE RECYCLEBIN; --������ ����

CREATE TABLE dept(
  dno VARCHAR2(2),
  dname VARCHAR2(14),
  loc VARCHAR2(8), 
  director VARCHAR2(4),
  CONSTRAINT dept_pk_dno PRIMARY KEY(dno)
);

CREATE TABLE emp(
  eno VARCHAR2(4),
  ename VARCHAR2(10),
  job VARCHAR2(6),
  mgr VARCHAR2(4),
  hdate DATE,
  sal NUMBER,
  comnm NUMBER,
  dno VARCHAR2(2),
  CONSTRAINT emp_pk_eno PRIMARY KEY(eno),
  CONSTRAINT emp_fk_dno FOREIGN KEY(dno)
  REFERENCES dept(dno)
);

SELECT c.table_name, c.constraint_name, 
c.constraint_type, s.column_name
FROM user_constraints c, user_cons_columns s
WHERE c.constraint_name = s.constraint_name 
AND c.table_name IN ('DEPT', 'EMP')
ORDER BY c.table_name ;

SELECT p.table_name �������̺�,
       p.constraint_name ������������,
       c.table_name �������̺�,
       c.constraint_name ������������
FROM user_constraints p, user_constraints c
WHERE c.r_constraint_name = p.constraint_name
AND p.table_name IN ('DEPT', 'EMP')
ORDER BY p.table_name;

--Dept���̺�� emp���̺� ���� �����͸� �Է��ϰ� ���������� �Էµ����͸� �����ϴ��� Ȯ���Ѵ�.

INSERT INTO dept(dno, dname, loc)
VALUES ('10', '����', '����');

INSERT INTO emp(eno, ename, dno)
VALUES ('2000', '������', '20');

COMMIT;

--PK�� ������ �Ӽ��̱� ������ �ߺ��� �ȵȴ�
INSERT INTO dept(dno, dname, loc)
VALUES ('10', '�ѹ�', '�λ�');

--FK�� �θ����̺� �����ϴ� FK�� ���԰����ϴ�
INSERT INTO emp(eno, ename, dno)
VALUES ('3000', '������', '20');

COMMIT;