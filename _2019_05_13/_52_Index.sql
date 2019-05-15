--1) 인덱스 생성과 이해
-- ; 인덱스는 테이블 검색 성능을 빠르게 하기 위해 제공되는 개체이다.
--  비록 직접 인덱스에 저장된 데이터를 검색하거나 조작할 수 없지만 DB운영에 매우 중요하다.
--  처음 SQL을 배울 때는 활용도가 낮지만 SQL에 대한 이해도가 높아질수록
--  인덱스에 대한 활용도가 높아진다.
--  (물리 데이터베이스 모델링)
--  
--2) 데이터베이스 모델링의 단계
--  (1) 개념모델링 - IEntity, Attribute, Relation 도출
--                  개념 ERD
--                  키워드 추출
--  (2) 논리모델링 - Table, Column, 정규화
--                  논리 ERD
--                  RDB의 분리, 연관관계 도출(PK-FK)
--  (3) 물리모델링 - SQL 작성, NOT NULL, CHECK, UK
--                INDEX, 역정규화(반정규화)
--                DBMS를 선택
--                성능 고려 모델링
--                테이블 상세서
--
--3) 오라클의 검색
--  테이블의 행은 우선순위가 없으며 입력 순서와는 무관하게 저장되고 검색한다.
--  이렇게 저장된 행이 순서에 무관하므로 오라클에서 테이블내의 
--  정보를 찾기 위해서는 반드시 테이블 전체를 읽어야 한다.
--  이렇게 테이블 전체를 읽는 것을 Full Table Scan 이라고 한다.
--  테이블의 행이 적을 때는 문제가 없지만 테이블 행이
--  수천만 ~ 수억 건을 넘어가면 정보 검색 시간이 너무 느려져서
--  사실상 사용이 불가능해 질 수도 있다.
--  
--  인덱스는 이렇게 매우 큰 테이블로부터 원하는 정보를 빠르게 검색하는 방법을 제공한다.
--  
--4) 인덱스의 사용 원칙
--  (1) 인덱스는 테이블을 설계하는 시점(물리 모델링)부터 
--      효과적인 인덱스 이용을 위해 생성이 계획되고 응용 프로그램 설계에 반영되어야 한다.
--      인덱스는 테이블에 대한 DML/DDL 작업이 수행되면
--      RDBMS가 자동으로 유지해준다.
--  (2) 인덱스는 SELECT 문의 성능을 높여준. (사용할 때마다 내부 정렬이 발생한다) 
--  (3) 인덱스는 DML(INSERT, UPDATE, DELETE) 문의 성능을 저해한다.
--  (4) 불필요한 컬럼의 인덱스 생성은 자제하는 것이 좋다. (필요한 컬럼만 할 것)
--  (5) 인덱스의 종류
--      a. 고유 인덱스(Unique Index)
--        - 중복된 값이 입력되지 않는다
--        - 테이블에도 중복된 값이 허용되지 않는다
--        - PK, UK에 자동으로 만들어진다
--      b. 비고유 인덱스(Non-Unique Index)
--        - 중복된 값을 허용한다
--        - 수동으로 생성하는 인덱스의 기본이다
--        - 일반 컬럼중에 검색 조건에 빈번하게 쓰이는 컬럼
--        
--  (6) 인덱스 생성 조건
--      (1) 테이블의 크기가 최소 수십만에서 수천만 건 이상
--      (2) 수천 건 이내의 테이블을 인덱스를 별도로 생성 않는다
--      (3) 조건과 조인에 자주 사용하는 컬럼에 생성한다
--      (4) 검색량이 테이블의 5% 미만 정도의 행을 검색하는 경우 생성한다.
--      (5) 가능한 검색대상이 수백 건 내외일 때 성능 향상이 뛰어나다
--      (6) FK 컬럼에 반드시 인덱스를 생성해준다.
--          조인에 빈번하게 사용되기 때문에 
--      (7) PK,UK 는 자동으로 인덱스가 생성된다.
--
--5) 인덱스의 용법
--CREATE INDEX 인덱스
--ON 테이블 [컬럼명|함수|수식];
--  (1) 컬럼은 여러 개 지정 가능하다
--  (2) 함수나 수식을 사용하는 인덱스도 생성 가능하다
--  (3) 제약 조건에 의해 자동으로 만들어지는 인덱스는 제약 조건과 이름이 동일하다.(PK, UK)
--
--DROP INDEX 인덱스;
--  (1) 인덱스를 삭제한다
--  (2) 제약 조건에 의해 생성된 인덱스는 삭제되지 않는다.
--  (3) 제약조건을 삭제하거나 비활성화하면 자동으로 삭제된다.
--
--현재 스키마(현재 사용자의 DB)의 모든 인덱스를 조회한다
SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name;

--함수 기반 인덱스의 생성 내역을 검색한다
SELECT index_name, column_expression
FROM user_ind_expressions;

--student테이블에 인덱스를 추가/삭제한다
CREATE INDEX student_indx_sname
ON student(sname);

--major와 sname을 동시 검색
--major를 주로 검색하는 경우
--sname 검색할 때는 별로 아님
CREATE INDEX student_indx_major_sname
ON student(major, sname); --복합키로 해놓고 둘다하거나 아니면 major로 찾을때 가능

CREATE INDEX student_indx_coavr
ON student(avr*4.5/4.0);


SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name = 'STUDENT';
SELECT index_name,column_position
FROM user_ind_expressions
WHERE index_name = 'STUDENT_INDX_COAVR';


--score, course 테이블에 FX를 확인하고 FX컬럼에 인덱스를 생성한다.
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

CREATE INDEX course_pno_fk ON course(pno); --pno라는 foreign key에 인덱스 생성
CREATE INDEX score_cno_fk ON score(cno);

--student 테이블의 인덱스를 삭제한다
DROP INDEX student_indx_major_sname;

--PK/UK는 제약조건에 의해 생성된 인덱스이므로
--인덱스를 직접 삭제는 못하고
--제약조건을 삭제하거나 Disable해야 한다
DROP INDEX student_sno_pk;

ALTER TABLE student
DISABLE CONSTRAINT student_snno_pk CASCADE;o_pk CASCADE;

SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name='STUDENT';

ALTER TABLE student
DISABLE CONSTRAINT student_sno_pk;

