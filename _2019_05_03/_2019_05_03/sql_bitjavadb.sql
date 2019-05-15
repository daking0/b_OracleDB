-- 이름: demo_bitjavadb.sql
-- 설명
-- bitjavadb라는 아이디와 bitjavadb라는 비밀번호만 생성
-- 테이블 생성 권한을 부여한다.
-- 본스크립트는 system 계정에서 실행해야한다.
---
-- SQLPlus 실행방법
-- SQL>@demo_bitjavadb.sql
-- SQL Developer F5 스크립터 실행


DROP USER bitjavadb CASCADE;

CREATE USER bitjavadb IDENTIFIED BY bitjavadb DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp PROFILE DEFAULT;

GRANT CONNECT, RESOURCE TO bitjavadb;
GRANT CREATE VIEW, CREATE SYNONYM TO bitjavadb;

ALTER USER bitjavadb ACCOUNT UNLOCK;

--conn bitjavadb/bitjavadb;






