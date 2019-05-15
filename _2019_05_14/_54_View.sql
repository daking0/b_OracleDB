--1) 뷰의 이해와 활용
--  ; 뷰(View)는 논리적으로 하나의 테이블 또는 여러 테이블의 논리적인 부분 집합을 의미한다.
--  사용자는 뷰를 통해서 기반이 되는 테이블의 정보에 접근할 수 있다.
--
--2) 뷰의 종류
--  (1) 단순 뷰(Simple View)
--     - 단일 table 로부터 만들어진 View
--     - 함수나 수식 등을 포함하지 않고 단순 컬럼으로 구성
--     - DML 문장 수행이 가능하다 --insert, delete , update
--      (View 에 DML을 수행하면 원래 table에 적용된다)
--    
--  (2) 복합 뷰(Complex View)
--     - 다중 table 로부터 만들어진 view
--     - 함수나 수식 등을 포함한다
--     - DML 문장 수행이 불가능하다
--     - 보안상의 이유로 사용하는 경우가 종종 있다.
--     
--3) 뷰 생성과 확인(용법)
--CREATE [OR REPLACE|FORCE|NOFORCE] VIEW 뷰면 (컬럼...)
--AS (SELECT 문장 : sub query 문);
--[WITH CHECK_OPTION [ CONSTRAINT constraint_name]]
--[WITH READ ONLY [CONSTRAINT constraint_name]];
--  (1) 뷰를 생성한다
--  (2) 서브 쿼리를 이용한 테이블 생성 문장과 유사하다
--  (3) OR REPLACE : 뷰를 수정한다
--        - 동일한 이름의 뷰를 삭제하고 새로 생성한다
--        - ALTER VIEW 명령을 대체한다
--  (4) FORCE : 기반 테이블이 없어도 뷰가 생성된다
--        - 기본값은 NOFORCE 이다.
--  (5) WITH CHECK OPTION : 뷰에 의해서 검색 가능한 행만
--          DML 작업이 가능하도록 제약한다
--  (6) WITH READ ONLY : 뷰를 통해서는 SELECT 만 가능하도록 제한한다.
--          보안상의 이유로 이 옵션을 많이 사용한다

--현재 스키마에 뷰를 검색한다.
SELECT view_name, text
FROM user_views;  --grant로 view를 만들 수 있는 권한을 부여받아야 view 만들기가 가능하다

--각 일반화학 과목의 학과별 기말고사 평균을 검색하고
--뷰로 생성한다
SELECT c.cno, cname, major, AVG(result)
FROM student s, course c, score r
WHERE s.sno = r.sno AND r.cno =c.cno
AND cname = '일반화학'
GROUP BY c.cno, cname, major;

CREATE VIEW ma_result(과목번호, 과목명, 학과, 기말고사평균)
AS (SELECT c.cno, cname, major, AVG(result)
    FROM student s, course c, score r
    WHERE s.sno = r.sno AND r.cno =c.cno
    AND cname = '일반화학'
    GROUP BY c.cno, cname, major
);

SELECT * FROM ma_result;
DESC ma_result;

SELECT * FROM tab; --table과 view 목록 보기
--뷰를 검색하면 실제로는 기반 테이블(연결된 테이블)을 검색해서 가져온다

--뷰를 통해 데이터 입력하기
CREATE VIEW st_ch
AS (SELECT sno, sname, syear, avr
    FROM student
    WHERE syear = 1
    );

--st_ch뷰에 데이터를 저장하면 st_ch물리적 공간은 없으므로
--연결된 student에 실제 데이터가 저장된다.
INSERT INTO st_ch
VALUES('000001','홍길동',1,4.0);

--st_ch를 검색하면 연결된 student를 검색해서 가져온다
SELECT *
FROM st_ch
WHERE sname='트럼프';

SELECT * 
FROM student 
WHERE sname='홍길동';

INSERT INTO st_ch
VALUES('000002','트럼프',1,1.0);

--2학년을 입력한다
--student테이블에는 저장되지만
--st_ch에는 1학년만 보여지므로 나타나지 않는다.
INSERT INTO st_ch
VALUES('000003','시진핑',2,0.8);

SELECT *
FROM st_ch
WHERE sname='시진핑';

SELECT * 
FROM student 
WHERE sname='시진핑';

--뷰를 통해 검색될 수 없는 데이터를 입력불가하도록 만들기 
CREATE OR REPLACE VIEW st_ch
AS (SELECT sno, sname, syear, avr
    FROM student
    WHERE syear = 1
    )
WITH CHECK OPTION CONSTRAINT view_ck_st_ch;
--where절의 조건에 맞지 않으면 입력조차못한다

INSERT INTO st_ch
VALUES('000004','아베',2,0.6);


