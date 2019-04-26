--1. ���� : ���̺� ����
--         ���̺��� ��(ROW) �� �÷�(Column)���� �̷���� �ſ� �ͼ��� ������ �ڷᱸ���̴�.
--         ���̺� ������ �ڷᱸ���� ������ �Ϲ����� ���·� DB�������� ���Ǿ��� �� ���̴�.
--         �����ý��۰� �����ϰ� ������ �θ� ���Ǵ� �̰��� ��� ���� ������ ǥ �Ǵ� ��ǥ��� �θ���.
--         �����ý��ۿ��� ������ ���¿��� ��ǥ�� ������ �����ؼ� ���̺�� ����� ���̴�.
--         ��â�� ���� �ý����� ������� �� DB�ý��ۿ��� ���ڵ�� �ʵ�� ������ ������ ��ǥ�� ���������
--         RDB(Relational Database)�� ���������� ���Ǹ鼭���� ��(Row)�� �÷�(Column)���� ������ ���̺��� �̸� ����Ѵ�.
--
--2) ���
--CREATE TABLE ���̺�(
--�÷� ������_Ÿ�� [DEFAULT default��] [�÷� ���� ��������], 
--�÷� ������_Ÿ�� [DEFAULT default��] [�÷� ���� ��������], 
--....
--[���̺� ���� ��������],
--....
--);
--
--a) ������_Ÿ��
--   -�÷��� �Էµ� �������� ������ ũ�⸦ �����Ѵ�
--b) DEFAULT
--   -�Է��� �������� �� �⺻ �Է� ���� �����Ѵ�
--   -default ���� �������� ������ null ���� ����ȴ�
--c) �÷� ���� ���� ����
--   - PK, FK, UK, CHECK, NOT NULL ���� �����Ѵ�
--   - ���� �� ���� ����� �𵨸� �Ŀ� �ٷ�ڴ�.
--d) ���̺� ���� ���� ����
--   - PK, FK, UK, CHECK �� �����Ѵ�
--   - NOT NULL �� ������ �� ����.
--   - ���� �� ���� ����� �𵨸� �Ŀ� �ٷ�ڴ�.
--
--DROP TABLE ���̺�
--[CASCADE CONSTRAINT];
--a) ���̺��� �����Ѵ�
--b) CASCADE CONSTRAINT
--  - ���̺��� �ٸ� ���̺�κ��� �����Ǵ� ��� �ش� ���� ������ ���� ������ �� ���̺��� �����Ѵ�.
--  - FK ���� �� ���̺� ����
--  - ������ ���� ���踦 �����ϸ� �����ǵ��� ������ ���� �� �ִ�(���󿡵� ������ ���� �� �ִ�)
--  
--SELECT table_name, column_name, data_type, data_length
--FROM user_tab_columns
--WHERE table_name = ���̺�;
--a) user_tab_columns
--   -������ ��ųʸ�(Data Dictionary)�� ���ؼ�
--   ������ ���̺��� ������ �ڼ��� �˻��Ѵ�
--   -Oracle�� sys������ �����̴�
--b) data_type : �÷��� ������ Ÿ��
--c) data_length : �÷��� ����
--d) ���̺���� �빮�ڷ� ������
--
--SELECT table_name, column_name, data_type, data_length
--FROM user_tab_columns
--WHERE table_name = 'EMP';
--
--*����Ŭ�� ������ Ÿ��
--VARCHAR2, NUMBER, DATE �� 3������ 99% ���ȴ�.
--CHAR �� ���� ����� �ְ� �Ⱦ��� ����� �ִ�
--�ֳ��ϸ� CHAR�� 100% VARCHAR2�� ��ü �����ϴϱ�
--
--������Ÿ��         ����
--------------------------------------
--VARCHAR2(n)     ���� ���� ���� Ÿ��(1 < n < 4000 byte)
--CHAR(n)         ���� ���� ���� Ÿ��(1 < n < 2000 byte)
--NUMBER(n, p)    ����Ÿ��, n�� ��ü �ڸ����̰� p�� �Ҽ������� �ڸ����̴�.
--                ��ü �ڸ����� �ʰ��� ��� �Է� �źε����� �Ҽ��� ���� �ڸ����� �ʰ��Ǹ� �ݿø��Ǿ� �Էµȴ�.
--                �Ҽ��� ������ ���� ���� ���� ���̸� �������� �ʴ� ���� ����.
--DATE            ��¥ Ÿ��. ����̳� �Է� ���İ� �����ϰ�
--                YYYY/MM/DD:HH24:MI:SS ���·� ����ȴ�
--                (����� 4712�� 1�� 1�� ~ ���� 9999�� 12�� 31��)
--LONG            2GB���� ���� ������ �������� ����Ÿ��.
--                �� ���� �˻��� �� ����.
--                ���̺��� �ϳ��� LONG �÷��� ������ �� �ִ�.
--CLOB            LONG �� ������ Ÿ��. �ִ� 4G ���� ���� �����ϰ�
--                �� ���̺��� ���� �÷��� ������ �� �ִ�.
--BLOB            4G���� ���尡���� �������� ���� Ÿ��
--ROW(n)          �������� ���� Ÿ��(n < 2000)
--BFILE           �ܺ� ���� ������ ���� ���� Ÿ��.
--                4G �̳� ������ �����Ѵ�
--ROWID           ROWID �� �����ϱ� ���� ������ Ÿ��.
--                �ַ� PLSQL ���α׷��ֿ��� ���� ���Ǹ�
--                �� ���ڴ� 64������ ���ڵ�(encoding) �Ǿ� �ִ�.
-------------------------------------------------------------------------------
--���̺��� �����Ѵ�
--���̺�� : board
--�÷����� : no(�Խù���ȣ), name(�ۼ���), sub(����)
--         content(����), hdate(�Է��Ͻ�)
         
CREATE TABLE board(
no     NUMBER,
name   VARCHAR2(50),
sub    VARCHAR2(100),
content VARCHAR2(4000),
hdate   DATE DEFAULT sysdate
);

DESC board; 

SELECT table_name, column_name, data_type, data_length
FROM user_tab_columns
WHERE table_name = 'BOARD';

INSERT INTO board(no)
VALUES (1);

SELECT * 
FROM board;


���̺� ����� ���� �ֱ�
CREATE TABLE t1(
  no NUMBER(4,2)
);

INSERT INTO t1
VALUES (12.12);
INSERT INTO t1
VALUES (1.789);
INSERT INTO t1
VALUES (123.1);

���̺� ����� ���ڳֱ�
CREATE TABLE t2(
  name VARCHAR2(2)
);

INSERT INTO t2
VALUES ('AA');
INSERT INTO t2
VALUES ('12');
--INSERT INTO t2
--VALUES ('��'); �̰� 3BYTE�� �ȵ�

--UTF-8 : ����/������ 1byte, �ѱ� 3byte
-- ms-949 : ����/������ 1byte, �ѱ� 2byte
-- unicode : ����/������,�ѱ� 2byte
SELECT name, value$
FROM sys.props$
WHERE name = 'NLS_CHARACTERSET';

SELECT * 
FROM t1;