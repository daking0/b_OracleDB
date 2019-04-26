--1. 주제 : 테이블 생성
--         테이블은 행(ROW) 와 컬럼(Column)으로 이루어진 매우 익숙한 형태의 자료구조이다.
--         테이블 형태의 자료구조는 문서의 일반적인 형태로 DB이전부터 사용되어져 온 것이다.
--         정보시스템과 무관하게 문서로 널리 사용되는 이것을 행과 열로 구성된 표 또는 도표라고 부른다.
--         정보시스템에서 문서의 형태였던 도표의 구조를 도입해서 테이블로 사용한 것이다.
--         초창기 파일 시스템을 기반으로 한 DB시스템에서 레코드와 필드로 구성된 파일이 도표를 대신했지만
--         RDB(Relational Database)가 본격적으로 사용되면서부터 행(Row)과 컬럼(Column)으로 구성된 테이블이 이를 대신한다.
--
--2) 용법
--CREATE TABLE 테이블(
--컬럼 데이터_타입 [DEFAULT default값] [컬럼 레벨 제약조건], 
--컬럼 데이터_타입 [DEFAULT default값] [컬럼 레벨 제약조건], 
--....
--[테이블 레벨 제약조건],
--....
--);
--
--a) 데이터_타입
--   -컬럼에 입력될 데이터의 종류와 크기를 결정한다
--b) DEFAULT
--   -입력이 누락됐을 때 기본 입력 값을 정의한다
--   -default 값을 지정하지 않으면 null 값이 저장된다
--c) 컬럼 레벨 제약 조건
--   - PK, FK, UK, CHECK, NOT NULL 등을 지정한다
--   - 설정 및 관리 방법은 모델링 후에 다루겠다.
--d) 테이블 레벨 제약 조건
--   - PK, FK, UK, CHECK 만 지정한다
--   - NOT NULL 은 정의할 수 없다.
--   - 설정 및 관리 방법은 모델링 후에 다루겠다.
--
--DROP TABLE 테이블
--[CASCADE CONSTRAINT];
--a) 테이블을 삭제한다
--b) CASCADE CONSTRAINT
--  - 테이블이 다른 테이블로부터 참조되는 경우 해당 제약 조건을 먼저 삭제한 후 테이블을 삭제한다.
--  - FK 삭제 후 테이블 삭제
--  - 주의할 점은 관계를 삭제하면 설계의도에 오류가 생길 수 있다(운용상에도 문제가 생길 수 있다)
--  
--SELECT table_name, column_name, data_type, data_length
--FROM user_tab_columns
--WHERE table_name = 테이블;
--a) user_tab_columns
--   -데이터 딕셔너리(Data Dictionary)를 통해서
--   지정한 테이블의 구조를 자세히 검색한다
--   -Oracle의 sys계정의 소유이다
--b) data_type : 컬럼의 데이터 타입
--c) data_length : 컬럼의 길이
--d) 테이블명은 대문자로 쓰세요
--
--SELECT table_name, column_name, data_type, data_length
--FROM user_tab_columns
--WHERE table_name = 'EMP';
--
--*오라클의 데이터 타입
--VARCHAR2, NUMBER, DATE 이 3가지가 99% 사용된다.
--CHAR 를 쓰는 사람도 있고 안쓰는 사람도 있다
--왜냐하면 CHAR는 100% VARCHAR2가 대체 가능하니까
--
--데이터타입         설명
--------------------------------------
--VARCHAR2(n)     가변 길이 문자 타입(1 < n < 4000 byte)
--CHAR(n)         고정 길이 문자 타입(1 < n < 2000 byte)
--NUMBER(n, p)    숫자타입, n은 전체 자리수이고 p는 소수점이하 자리수이다.
--                전체 자리수를 초과할 경우 입력 거부되지만 소수점 이하 자리수가 초과되면 반올림되어 입력된다.
--                소수점 이하의 값이 없는 경우는 길이를 지정하지 않는 것이 좋다.
--DATE            날짜 타입. 출력이나 입력 형식과 무관하게
--                YYYY/MM/DD:HH24:MI:SS 형태로 저장된다
--                (기원전 4712년 1월 1일 ~ 서기 9999년 12월 31일)
--LONG            2GB까지 저장 가능한 가변길이 문자타입.
--                단 조건 검색할 수 없다.
--                테이블에는 하나의 LONG 컬럼만 정의할 수 있다.
--CLOB            LONG 을 개선한 타입. 최대 4G 까지 저장 가능하고
--                한 테이블의 여러 컬럼에 정의할 수 있다.
--BLOB            4G까지 저장가능한 가변길이 이진 타입
--ROW(n)          가변길이 이진 타입(n < 2000)
--BFILE           외부 파일 저장을 위한 이진 타입.
--                4G 이내 파일을 저장한다
--ROWID           ROWID 를 저장하기 위한 데이터 타입.
--                주로 PLSQL 프로그래밍에서 많이 사용되며
--                각 문자는 64진수로 엔코딩(encoding) 되어 있다.
-------------------------------------------------------------------------------
--테이블을 생성한다
--테이블명 : board
--컬럼구성 : no(게시물번호), name(작성자), sub(제목)
--         content(내용), hdate(입력일시)
         
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


테이블 만들고 숫자 넣기
CREATE TABLE t1(
  no NUMBER(4,2)
);

INSERT INTO t1
VALUES (12.12);
INSERT INTO t1
VALUES (1.789);
INSERT INTO t1
VALUES (123.1);

테이블 만들고 문자넣기
CREATE TABLE t2(
  name VARCHAR2(2)
);

INSERT INTO t2
VALUES ('AA');
INSERT INTO t2
VALUES ('12');
--INSERT INTO t2
--VALUES ('한'); 이건 3BYTE라서 안돼

--UTF-8 : 숫자/영문자 1byte, 한글 3byte
-- ms-949 : 숫자/영문자 1byte, 한글 2byte
-- unicode : 숫자/영문자,한글 2byte
SELECT name, value$
FROM sys.props$
WHERE name = 'NLS_CHARACTERSET';

SELECT * 
FROM t1;