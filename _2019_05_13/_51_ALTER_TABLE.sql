--1) 테이블의 변경
--  ;테이블을 생성한느 작업은 요구순서 -> 모델링 작업을 거치는 섬세하고 복잡한 과정을 통해서 이루어진다.
--  이것은 데이터는 변하지만 데이터의 구조는 안정적이라는 기본적인 전제 위에서 만들어진 일련의 작업 과정이다.
--  그런데 운영중에 테이블의 구조가 변경된다는 것은 사실상 요구분석과 모델링 작업에 문제가 있었다는 의미로 볼 수도 있다.
--  하지만 아무리 분석/설계가 잘 이루어져도 운영중에 업무의 변경에 의해 일부의 변경이 요구될 때가 있다.
--  이 때는 전체에 최소한의 영향을 미치도록 최소한의 변경만 이루어져야 한다.
--  
--2) 컬럼 수정
--ALTER TABLE 테이블
--[ADD|MODIFY] 컬럼 데이터타입;
--  (1) 추가된 컬럼에는 NULL 값이 저장된다.
--  (2) CHAR 와 VARCHAR2는 컬럼의 크기를 변경하지 않으면 서로 수정 교환 가능하다
--  (3) 컬럼의 크기는 늘리는 것만 가능하다
--  (4) 대상 컬럼에 데이터가 없을 때만 크기를 줄이거나 타입을 수정하는 것이 가능하다
--
--3) 컬럼 삭제
--ALTER TABLE 테이블
--DROP COLUMN 컬럼;
--  (1) 불필요한 컬럼을 삭제한다
--  (2) SYS 유저가 소유한 테이블의 컬럼은 DROP 불가능하다

--test 테이블을 생성하고 컬럼을 수정한다
DROP TABLE test2;

CREATE TABLE test2(no number);

DESC test2;

ALTER TABLE test2
ADD name CHAR(10);

DESC test2;

ALTER TABLE test2
MODIFY name VARCHAR(10);

DESC test2;

ALTER TABLE test2 DROP COLUMN name;

DESC test2;

--4) 서브 쿼리를이용한 테이블 생성
--  ;기존 테이블을 수정하는 것이 부담스러우니까
--  차라리 기존의 테이블을 이용해서 새로운 테이블을 생성하는 것으로 대체하는 경우가 있다,
--  또는 기존 테이블의 일부를 이용해서 새로운 테이블을 만들기도 한다.
--  이것이 서브쿼리를 이용한 테이블 생성이다.
--
--5) 용법
--CREATE TABLE 테이블 (컬럼,...)
--AS (SELECT 문장 : sub query 문);
--  (1) 서브 쿼리문의 결과로 테이블을 생성한다
--  (2) 데이터 타입과 길이는 서브 쿼리문에 의해 결정된다
--  (3) 컬럼의 리스트와 서브 쿼리의 컬럼은 1:1 대응이다
--  (4) 컬럼명이 없으면 서브 쿼리의 검색 결과 출력되는 헤더를 컬럼명으로 사용한다
--  (5) 서브 쿼리에 계산식이나 함수를 사용하는 경우 반드시 'CREATE TABLE 문장'에 컬럼명을 정의하거나 별명 사용
--  
--개발업무를 담당하는 사원의 근무 부서관련 정보를 검색할 수 있는 테이블을 생성한다.
DROP TABLE e_dept;

CREATE TABLE e_dept
AS (SELECT eno, ename , job, d.dno, dname, loc
    FROM dept d, emp e 
    WHERE d.dno = e.dno
    AND job = '개발'
    );

--부서별 평균 연봉을 검색할 수 있는 테이블을 생성한다.
CREATE TABLE d_sal
AS (SELECT d.dno, dname, ROUND(AVG(sal)) av_sal
    FROM dept d, emp e
    WHERE d.dno = e.dno
    GROUP BY d.dno, dname
    );

--부서별로 검색된 사원의 연봉 정보를 이용해서 테이블을 생성한다
--서브 쿼리에 ORDER BY 를 사용할 수 없다.
--왜냐하면 RDB에서 각 테이블은 컬럼의 순서나 행의 순서와는 무관하다는 RDB원칙에 위배됨으로써 이를 지원하지 않는다.
CREATE TABLE e_sal(dno, eno, ename, an_sal)
AS (SELECT dno, eno, ename, sal *12+NVAL(comm,0)
    FROM emp
    WHERE 1=2
    );
    
INSERT INTO e_sal
SELECT dno, eno, ename, SAL+12+NVL(comm,0)
FROM emp
ORDER BY dnol

SELECT * FROM e_sal;

--서브쿼리를 이용한 테이블 생성은 주로 다음처럼 사용된다.
--테스트용 테이블이나 임시테이블, 분석용 테이블 용도로 만들어진다.
--만드는 이유는 업무 효율성 때문에 만들지만 
--주의할 점은 다른 테이블의 데이터를 가져와서 만들기 때문에 
--데이터가 중복되어 있는 것을 인식해야 한다.,
--또 기반이 되는 테이블의 정보가 계속 바뀌게 되므로 
--시간이 지나면 서브쿼리로 생성한 테이블은 
--데이터의 갱신이 안되는 등의 제약사항이 생긴다.

