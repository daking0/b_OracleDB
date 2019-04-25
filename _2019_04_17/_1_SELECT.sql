-- 1) 소개
--select문 : RDB(Relational DataBase) - 관계형 데이터베이스
--          에서 99%로 사용을 하는 SQL문
--          데이터를 가져올 때 사용한다.

--2) 용법
--SELECT [컬럼, 컬럼, ...]
--FROM 테이블;

--3) 설명
--a) 테이블로부터 지정한 컬럼을 검색한다.
--b) '*'는 모든 컬럼을 검색할 때 사용한다.
--c) '*'을 통해 검색되는 컬럼의 순서는 DESC명령으로 검색한다.
--   검색한 컬럼 순서이다.
--d) '*'는 컬럼명과 같이 사용할 수 없고 반드시 단독으로 사용한다.
--e) SELECT절이나 FROM절은 생략할 수 없다.

DB_Bitcamp
-- DESC 테이블명
-- ; 테이블에 구조를 검색한다.
-- ; 컬럼의 이름, 데이터 타입을 검색한다.

--SQL문은 대소문자 구별을 하지 않는다.
--그러나 관습적으로 구별을 잘하기 위해서
--SQL명령어가 대문자면, 사용자 정의 이름은 소문자로
--SQL명령어가 소문자면, 사용자 정의 이름은 대문자로
--사용한다.
DESC course;

DESC student;

--현재 스키마(schema) - 현재 접속한 계정의 DB의 테이블 목록을 검색한다.
SELECT * FROM tab;

--emp의 모든 정보를 보고 싶다.
--SELECT * FROM emp;
SELECT * FROM emp;

SELECT * FROM student;

--professor의 모든 정보를 보고 싶다.
SELECT * FROM professor;

emp테이블의 eno, ename, job을 보고 싶다.
SELECT eno, ename, job FROM emp;

SELECT SNO, SNAME, MAJOR FROM student;

SELECT sname, sno, major FROM student;

--SELECT 수식
--FROM daul;

dual은 오라클의 dummy 테이블(실테이블이 아님)
SELECT 2+3 FROM dual;