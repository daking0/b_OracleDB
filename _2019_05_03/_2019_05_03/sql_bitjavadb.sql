-- �̸�: demo_bitjavadb.sql
-- ����
-- bitjavadb��� ���̵�� bitjavadb��� ��й�ȣ�� ����
-- ���̺� ���� ������ �ο��Ѵ�.
-- ����ũ��Ʈ�� system �������� �����ؾ��Ѵ�.
---
-- SQLPlus ������
-- SQL>@demo_bitjavadb.sql
-- SQL Developer F5 ��ũ���� ����


DROP USER bitjavadb CASCADE;

CREATE USER bitjavadb IDENTIFIED BY bitjavadb DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp PROFILE DEFAULT;

GRANT CONNECT, RESOURCE TO bitjavadb;
GRANT CREATE VIEW, CREATE SYNONYM TO bitjavadb;

ALTER USER bitjavadb ACCOUNT UNLOCK;

--conn bitjavadb/bitjavadb;






