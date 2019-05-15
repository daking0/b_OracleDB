--1) 제약 조건의 이해와 설정(PK, FK)
--  ; 제약 조건이란 테이블 단위에서 데이터의 무결성을 보장해주는 규칙이다.
--    제약조건은 테이블에 데이터가 입력, 수정, 삭제되거나 테이블이 삭제, 변경될 경우
--    잘못된 트랜잭션이 수행되지 않도록 결함을 유발할 가능성이 있는 작업을 방지하는 역할을 담당한다.
--    특히 PK와 FK는 테이블의 필수 요소로써 모든 테이블은 이들 둘 중 하나 이상을 반드시 포함하고 있다.
--    
--2) 제약조건
--   (1) 테이블 단위에서 정의되고 적용된다.
--   (2) 종속성이 존재하는 경우 테이블의 삭제를 막아준다.
--   (3) 자료가 삽입, 갱신, 삭제될 때마다 규칙이 적용된다.
--   (4) 일시적을오 활성화하거나 비활성화하는 것이 가능하다.
--   (5) USER_CONSTRAINTS, USER_CONS_CONLUMNS 딕셔너리에서 검색한다.
--   (6) 제약 조건은 개체처럼 관리되므로 반드시 이름이 필요하다.
--       제약 조건에 이름을 정의하지 않으면 오라클 서버가 자동으로 SYS Cn형태의 이름을 붙인다.
--
--3) 오라클에서 제공되는 제약조건
--   (1) PRIMARY KEY(PK)
--   (2) FOREIGN KEY(FK)
--   (3) UNIQUE KEY(UK)
--   (4) NOT NULL
--   (5) CHECK 
--
--4) PRIMARY KEY 설정
--CREATE TABLE 테이블(
--...
--CONSTRAINT 제약조건이름 PRIMARY KEY(컬럼)
--);
--
--CREATE TABLE 테이블(
--컬럼 데이터타입 CONSTRAINT 제약조건이름 PRIMARY KEY,
--...
--);
--
--  (1) 테이블을 생성할 때 PX를 정의한다
--  (2) PK는 각 행을 고유하게 식별하는 역할을 한다.
--  (3) 테이블당 하나만 정의 가능하다
--  (4) 지정된 컬럼에는 중복된 값이나 NULL값이 입력될 수 없다.
--  (5) PK로 지정 가능한 컬럼이 여러 개 있을 때는 검색에 많이 사용되고 간단하고 짧은 컬럼을 지정한다.
--  (6) 주 식별자, 주키, 주식별자 등으로 불린다.
--  (7) 고유 인덱스(Unique Index)가 자동으로 생성된다.
--
--5) FOREIGN KEY 설정
----다해놓고 이건 뭐다 이건 뭐다 이런 정리된 느낌
--CREATE TABLE 테이블(
--...
--CONSTRAINT 제약조건이름 FOREIGN KEY(컬럼)
--REFERENCES 참조테이블 (참조컬럼) [ON DELETE CASCADE]
--);
--
--CREATE TABLE 테이블(
--컬럼명 데이터타입 CONSTRAINT 제약조건이름 FOREIGN KEY
--               REFERENCES 참조테이블 (참조컬럼)
--               [ON DELETE CASCADE],
--...
--);
--
--  (1) FK가 정의된 테이블이 하위(자식) 테이블이다
--  (2) 참조되는 테이블을 상위(부모) 테이블이라고 한다.
--  (3) 상위 테이블은 미리 생성되어 있어야 한다.
--  (4) 상위 테이블의 참조되는 컬럼에 존재하는 값만을 입력할 수 있다.
--  (5) 상위 테이블에 참조되는 행의 데이터는 FK를 위배하는 삭제나 변경이 불가능하다.
--  (6) 상위 테이블은 FK로 인해 삭제가 불가능하다.
--  (7) ON DELETE CASCADE : 참조되는 상위 테이블의 행에 대한 DELETE를 허용한다.
--      -하위테이블의 행도 같이 지워지는 옵션
--  (8) 자료형이 반드시 일치해야 한다
--  (9) 참조되는 컬럼은 PK이거나 UK(Unique Key)만 가능하다
--  (10) 외부키, 참조키, 외부식별자 등으로 불린다.
--
--6) 테이블의 제약조건 조회
SELECT c.table_name, c.constraint_name, 
c.constraint_type, s.column_name
FROM user_constraints c, user_cons_columns s
WHERE c.constraint_name = s.constraint_name 
AND c.table_name IN ('COURSE', 'SCORE')
ORDER BY c.table_name ;

SELECT p.table_name 상위테이블,
       p.constraint_name 상위제약조건,
       c.table_name 하위테이블,
       c.constraint_name 참조제약조건
FROM user_constraints p, user_constraints c
WHERE c.r_constraint_name = p.constraint_name
AND p.table_name IN ('COURSE', 'STUDENT')
ORDER BY p.table_name;


DROP TABLE emp;
DROP TABLE dept;

PURGE RECYCLEBIN; --휴지통 비우기

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

SELECT p.table_name 상위테이블,
       p.constraint_name 상위제약조건,
       c.table_name 하위테이블,
       c.constraint_name 참조제약조건
FROM user_constraints p, user_constraints c
WHERE c.r_constraint_name = p.constraint_name
AND p.table_name IN ('DEPT', 'EMP')
ORDER BY p.table_name;

--Dept테이블과 emp테이블에 각각 데이터를 입력하고 제약조건이 입력데이터를 통제하는지 확인한다.

INSERT INTO dept(dno, dname, loc)
VALUES ('10', '개발', '서울');

INSERT INTO emp(eno, ename, dno)
VALUES ('2000', '아이유', '20');

COMMIT;

--PK는 유일한 속성이기 때문에 중복이 안된다
INSERT INTO dept(dno, dname, loc)
VALUES ('10', '총무', '부산');

--FK는 부모테이블에 존재하는 FK만 삽입가능하다
INSERT INTO emp(eno, ename, dno)
VALUES ('3000', '아이유', '20');

COMMIT;