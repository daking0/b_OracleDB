--1) �ε��� ������ ����
-- ; �ε����� ���̺� �˻� ������ ������ �ϱ� ���� �����Ǵ� ��ü�̴�.
--  ��� ���� �ε����� ����� �����͸� �˻��ϰų� ������ �� ������ DB��� �ſ� �߿��ϴ�.
--  ó�� SQL�� ��� ���� Ȱ�뵵�� ������ SQL�� ���� ���ص��� ����������
--  �ε����� ���� Ȱ�뵵�� ��������.
--  (���� �����ͺ��̽� �𵨸�)
--  
--2) �����ͺ��̽� �𵨸��� �ܰ�
--  (1) ����𵨸� - IEntity, Attribute, Relation ����
--                  ���� ERD
--                  Ű���� ����
--  (2) ���𵨸� - Table, Column, ����ȭ
--                  �� ERD
--                  RDB�� �и�, �������� ����(PK-FK)
--  (3) �����𵨸� - SQL �ۼ�, NOT NULL, CHECK, UK
--                INDEX, ������ȭ(������ȭ)
--                DBMS�� ����
--                ���� ��� �𵨸�
--                ���̺� �󼼼�
--
--3) ����Ŭ�� �˻�
--  ���̺��� ���� �켱������ ������ �Է� �����ʹ� �����ϰ� ����ǰ� �˻��Ѵ�.
--  �̷��� ����� ���� ������ �����ϹǷ� ����Ŭ���� ���̺��� 
--  ������ ã�� ���ؼ��� �ݵ�� ���̺� ��ü�� �о�� �Ѵ�.
--  �̷��� ���̺� ��ü�� �д� ���� Full Table Scan �̶�� �Ѵ�.
--  ���̺��� ���� ���� ���� ������ ������ ���̺� ����
--  ��õ�� ~ ���� ���� �Ѿ�� ���� �˻� �ð��� �ʹ� ��������
--  ��ǻ� ����� �Ұ����� �� ���� �ִ�.
--  
--  �ε����� �̷��� �ſ� ū ���̺�κ��� ���ϴ� ������ ������ �˻��ϴ� ����� �����Ѵ�.
--  
--4) �ε����� ��� ��Ģ
--  (1) �ε����� ���̺��� �����ϴ� ����(���� �𵨸�)���� 
--      ȿ������ �ε��� �̿��� ���� ������ ��ȹ�ǰ� ���� ���α׷� ���迡 �ݿ��Ǿ�� �Ѵ�.
--      �ε����� ���̺� ���� DML/DDL �۾��� ����Ǹ�
--      RDBMS�� �ڵ����� �������ش�.
--  (2) �ε����� SELECT ���� ������ ������. (����� ������ ���� ������ �߻��Ѵ�) 
--  (3) �ε����� DML(INSERT, UPDATE, DELETE) ���� ������ �����Ѵ�.
--  (4) ���ʿ��� �÷��� �ε��� ������ �����ϴ� ���� ����. (�ʿ��� �÷��� �� ��)
--  (5) �ε����� ����
--      a. ���� �ε���(Unique Index)
--        - �ߺ��� ���� �Էµ��� �ʴ´�
--        - ���̺��� �ߺ��� ���� ������ �ʴ´�
--        - PK, UK�� �ڵ����� ���������
--      b. ����� �ε���(Non-Unique Index)
--        - �ߺ��� ���� ����Ѵ�
--        - �������� �����ϴ� �ε����� �⺻�̴�
--        - �Ϲ� �÷��߿� �˻� ���ǿ� ����ϰ� ���̴� �÷�
--        
--  (6) �ε��� ���� ����
--      (1) ���̺��� ũ�Ⱑ �ּ� ���ʸ����� ��õ�� �� �̻�
--      (2) ��õ �� �̳��� ���̺��� �ε����� ������ ���� �ʴ´�
--      (3) ���ǰ� ���ο� ���� ����ϴ� �÷��� �����Ѵ�
--      (4) �˻����� ���̺��� 5% �̸� ������ ���� �˻��ϴ� ��� �����Ѵ�.
--      (5) ������ �˻������ ���� �� ������ �� ���� ����� �پ��
--      (6) FK �÷��� �ݵ�� �ε����� �������ش�.
--          ���ο� ����ϰ� ���Ǳ� ������ 
--      (7) PK,UK �� �ڵ����� �ε����� �����ȴ�.
--
--5) �ε����� ���
--CREATE INDEX �ε���
--ON ���̺� [�÷���|�Լ�|����];
--  (1) �÷��� ���� �� ���� �����ϴ�
--  (2) �Լ��� ������ ����ϴ� �ε����� ���� �����ϴ�
--  (3) ���� ���ǿ� ���� �ڵ����� ��������� �ε����� ���� ���ǰ� �̸��� �����ϴ�.(PK, UK)
--
--DROP INDEX �ε���;
--  (1) �ε����� �����Ѵ�
--  (2) ���� ���ǿ� ���� ������ �ε����� �������� �ʴ´�.
--  (3) ���������� �����ϰų� ��Ȱ��ȭ�ϸ� �ڵ����� �����ȴ�.
--
--���� ��Ű��(���� ������� DB)�� ��� �ε����� ��ȸ�Ѵ�
SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name;

--�Լ� ��� �ε����� ���� ������ �˻��Ѵ�
SELECT index_name, column_expression
FROM user_ind_expressions;

--student���̺� �ε����� �߰�/�����Ѵ�
CREATE INDEX student_indx_sname
ON student(sname);

--major�� sname�� ���� �˻�
--major�� �ַ� �˻��ϴ� ���
--sname �˻��� ���� ���� �ƴ�
CREATE INDEX student_indx_major_sname
ON student(major, sname); --����Ű�� �س��� �Ѵ��ϰų� �ƴϸ� major�� ã���� ����

CREATE INDEX student_indx_coavr
ON student(avr*4.5/4.0);


SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name = 'STUDENT';
SELECT index_name,column_position
FROM user_ind_expressions
WHERE index_name = 'STUDENT_INDX_COAVR';


--score, course ���̺� FX�� Ȯ���ϰ� FX�÷��� �ε����� �����Ѵ�.
SELECT c.table_name, c.constraint_name, c.constraint_type, s.column_name
FROM user_constraints c , user_cons_columns s
WHERE c.constraint_name = s.constraint_name
AND c.constraint_type = 'R'
AND c.table_name IN ('SCORE', 'COURSE')
ORDER BY c.table_name;

SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name IN ('SCORE', 'COURSE');

CREATE INDEX course_pno_fk ON course(pno); --pno��� foreign key�� �ε��� ����
CREATE INDEX score_cno_fk ON score(cno);

--student ���̺��� �ε����� �����Ѵ�
DROP INDEX student_indx_major_sname;

--PK/UK�� �������ǿ� ���� ������ �ε����̹Ƿ�
--�ε����� ���� ������ ���ϰ�
--���������� �����ϰų� Disable�ؾ� �Ѵ�
DROP INDEX student_sno_pk;

ALTER TABLE student
DISABLE CONSTRAINT student_snno_pk CASCADE;o_pk CASCADE;

SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name='STUDENT';

ALTER TABLE student
DISABLE CONSTRAINT student_sno_pk;

