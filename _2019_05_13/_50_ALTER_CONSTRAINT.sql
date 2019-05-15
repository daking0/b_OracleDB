--1) 제약조건관리
--  ; 제약 조건을 생성하는 방법은 테이블을 생성할 때
--    같이 생성하거나 나중에 추가하는 방법이 있다.
--    만일 일련의 과정을 스크립트로 작성한다면 가동성과
--    작업의 효율을 위해 가능한 나중에 추가하는 방법으로 
--    제약조건을 생성하는 것이 좋다.
--    그리고 생성된 제약 조건은 작업 환경에 따라 활성화 되거나
--    비활성화 될 수 있다.
--    
--    제약조건의 가장 큰 장점은 동적으로 운영 가능하다는 것이다.
--    예를 들어 대규모 배치 처리작업에서 입력되는 데이터가 이미 
--    무결성이 확인된 경우라면 굳이 제약 조건을 다시 검사할
--    필요가 없다. 이때는 임시로 제약 조건을 비활성화했다가
--    작업이 끝난 이후에 활성해주면 작업의 속도가 매우 빨라진다.

--2) 제약조건 추가
--ALTER TABLE 테이블
--ADD CONSTRAINT 제약조건명 제약조건타입;
--  (1) NOT NULL을 제외한 제약조건을 추가한다.
--  (2) 제약조건타입 : 제약조건별 설정방법과 동일
--  (3) NOT NULL 제약조건은 MODIFY명령으로 추가한다.
--
--- NOT NULL 일 경우
--ALTER TABLE 테이블
--MODIFY 컬럼 CONSTRAINT 제약조건명 NOT NULL;
--  (1) NOT NULL 제약조건을 추가한다.
--  (2) 삭제 방법은 다른 제약조건과 동일하다.
--
--3) 제약 조건 삭제
--ALTER TABLE 테이블
--DROP PRIMARY KEY | UNIQUE(컬럼)|
--CONSTRAINT 제약조건명 [CASCADE];
--  (1) 제약조건을 삭제한다.
--  (2) CASCADE : PK나 UK가 삭제될 경우 이를 참조하는 
--                FK도 삭제된다.
                
4) class, student 테이블을 생성하고 제약조건 추가/삭제
DROP TABLE CLASS;
DROP TABLE ST;
COMMIT;

CREATE TABLE class(
cno VARCHAR2(2),
cname VARCHAR2(50)
);

CREATE TABLE st(
sno VARCHAR2(2),
sname VARCHAR2(50),
cno VARCHAR2(2)
);

INSERT INTO class
VALUES ('01', '노랑새싹반');
INSERT INTO class
VALUES ('02', '연두잎새반');
INSERT INTO st
VALUES ('01', '홍길동','01');
INSERT INTO st
VALUES ('02', '임꺽정','02');
INSERT INTO st
VALUES ('03', '장길산','03');
COMMIT;

ALTER TABLE class
ADD CONSTRAINT class_pk_cno PRIMARY KEY(cno);
ALTER TABLE class
ADD CONSTRAINT class_uk_cname UNIQUE (cname);
ALTER TABLE st
ADD CONSTRAINT st_pk_sno PRIMARY KEY (sno);
ALTER TABLE st
ADD CONSTRAINT st_fk_cno FOREIGN KEY (cno) REFERENCES class (cno);

-- 무결성을 위배한 데이터가 들어가 있는 경우는 제약조건이 적용되지 않는다.
-- 그래서 무결성 오류 데이터를 수정하고 제약조건을 적용한다.

-- 일반적으로 테이블을 설계하고 대규모의 데이터를 입력할 떄는 제약조건을 적용하지 않는다.
-- 이럴 경우 무결성을 위배하는 데이터가 존재할 수 있는데
-- 이 데이터들을 exception 테이블에 일괄적으로 저장하고 
-- rowid를 통해 삭제하면 원래의 테이블의 무결성 데이터가 
-- 모두 삭제된다.
-- 구글에 검색 : 오라클 제약조건 어긋나는 데이터 검색
--https://m.blog.naver.com/PostView.nhn?blogId=tyboss&logNo=70035078373&proxyReferer=https%3A%2F%2Fwww.google.com%2F
--rowid : 오라클에서 특정 행의 데이터를 가리키는 절대 주소값

UPDATE st
SET cno = '01' WHERE sno = '03';
COMMIT;

ALTER TABLE st
ADD CONSTRAINT st_fk_cno FOREIGN KEY (cno) REFERENCES class (cno);

ALTER TABLE CLASS
MODIFY cname CONSTRAINT class_not_null_cname NOT NULL;

--테이블 이름을 대문자로 할 것
SELECT c.table_name, c.constraint_name,
       c.constraint_type, s.column_name
FROM user_constraints c, user_cons_columns s
WHERE c.constraint_name = s.constraint_name
AND c.table_name IN('CLASS','ST');

--5) CLASS, STUDENT 테이블의 제약조건 삭제 
-- 자식테이블에 의해 참조되는 제약조건을 삭제 불가능
ALTER TABLE class
DROP CONSTRAINT class_pk_cno;
-- CASCADE는 강제로 제약조건을 삭제하는데
-- 자식의 관련 제약조건도 강제로 삭제
ALTER TABLE class
DROP CONSTRAINT class_pk_cno CASCADE;

ALTER TABLE class
DROP CONSTRAINT class_not_null_cname;
ALTER TABLE class
DROP CONSTRAINT class_uk_cname;
ALTER TABLE st
DROP CONSTRAINT st_pk_sno;

SELECT *
FROM st;

--6) 제약조건 활성화/비활성화
--ALTER TABLE 테이블
--DISABLE CONSTRAINT 제약조건명 [CASCADE];
--  (1) 제약조건을 비활성화한다.
--  (2) PK나 UK인 경우 인덱스가 삭제된다.
--  (3) 비활성화된 제약조건은 제약조건을 검색하지 않는다.

--CLASS/ST 테이블에 제약조건을 활성/비활성화를 통해 데이터 입력
ALTER TABLE class
ADD CONSTRAINT class_pk_cno PRIMARY KEY(cno);


ALTER TABLE st
ADD CONSTRAINT st_fk_cno FOREIGN KEY(cno) REFERENCES class(cno);

SELECT table_name, constraint_name, status
FROM user_constraints
WHERE table_name IN('CLASS','ST');

INSERT INTO st VALUES('10','김연아','03');

ALTER TABLE st
DISABLE CONSTRAINT st_fk_cno;

SELECT table_name, constraint_name, status
FROM user_constraints
WHERE table_name IN('CLASS','ST');

INSERT INTO st VALUES('10','김연아','03');
INSERT INTO class VALUES('03','분홍열매반');

ALTER TABLE st
ENABLE CONSTRAINT st_fk_cno;

제약조건은 DB의 무결성을 보장하는 기능이다.
하지만 작업의 순서를 반드시 제약조건에 따라 계획해야 하는 불편함이 따라온다.
특히 참조관계일 경우 부모를 먼저 입력하고 자식을 입력해야하므로 불편함이 따라오게 된다.
SI를 개발시 일반적으로 데이터베이스를 설게하고 데이터를 입력하게 되는데
초기에는 데이터의 미확보 OR 자유로운 테스트가 가능하도록 하기 위해 제약조건을 비활성화하게 된다.
제약조건을 비활성화 하면 2가지 장점이 따라온다.
첫째, 데이터의 입력이 자유롭다 -> 단위별 테스트가 쉽다
둘째, 데용량 데이터 입력시 조건검사를 하지 않으므로 속도가 향상된다

단, 초기 작업과 테스트가 끝나고 운영시에는 반드시 제약조건을 활성해야 한다.
또 무결성을 위배하는 데이터는 exceptions 테이블에서 확인하고 일괄처리한다.

[대규모 배치 작업을 효율적으로 수행하는 방법]
(1) 가능한 DATABASE BUFFER CACHE 의 크기를 늘린다
(2) 다이렉트 로드 작업을 수행한다
  - 이때는 DATABASE BUFFER CACHE 를 사용하지 않으므로 크기를 늘릴 필요가 없다.
(3) 입력 테이블과 관련된 모든 제약조건을 비활성화한다 ->퇴근 빨리하려면 중요
 - 제약조건에 맞지 않는 데이터는 입력이 끝난 후에 exceptino 기능을 사용해서 걸러낼 수 있다.
 구글에 검색하면 나온다.