--1) 주제 : 서브 쿼리를 이용한 DML
--         다량의 DML작업을 수행하는 경우 서브 쿼리문을 이용하는 경우가 많다.
--         특히 INSERT 작업에 대량 데이터를 입력할 때 서브 쿼리를 이용하는 것은 매우 유용하고 빠른 작업 방법이다.
--         특히 메모리를 통하지 않고 직접 데이터를 디스크에 입력하는 다이렉트 로드를 같이 사용하면 작업 효과는 배가 된다.
--2) 용법
--INSERT INTO [/*+ APPEND */] 테이블
--[NOLOGGING] [(컬럼, 컬럼, ...)]
--SELECT 문장;
--a) 서브 쿼리 (SELECT문장)에 검색된 행을 입력값으로 사용한다
--b) 한 번에 많은 행을 입력할 수 있다.
--c) 컬럼 리스트와 SELECT문의 컬럼이 1:1로 대응되어야 한다.
--d) SELECT문에 사용한 서브 쿼리 문과는 달리 괄호를 쓰지 않는다.
--e) /*+ APPEND */ : 다이렉트 로드함으로 대량의 입력 작업을 더 빠르게 작업한다.
--f) [NOLOGGING] : 로그 정보를 남기지 않으므로 입력 작업이 빨라진다.
--                 그러나 장애 발생시 복구할 수 없다.
--
--UPDATE 테이블
--SET 컬럼명 = (SELECT 문장),
--    컬럼명 = (SELECT 문장),...
--[WHERE 조건];
--
--UPDATE 테이블
--SET (컬럼, 컬럼,...) = (SELECT 문장)
--[WHERE 조건];
--a) UPDATE문의 SET절에는 단일 행 서브 쿼리문이나 다중 열 서브 쿼리문을 이용할 수 있다.
--   -다중 열인 경우도 반드시 결과 행은 1개여야 한다
--b) 이때 검색되는 Data는 반드시 수정되는 컬럼명과 1:1 대응되어야 한다.
--c) SET절에는 단일행 서브쿼리만 허용되지만 WHERE 절의 서브 쿼리는 연산자에 따라 달라진다.

--emp2 테이블에 사번과 연봉을 입력한다.
--emp -> emp2
DESC emp2;
SELECT * FROM emp2;

INSERT INTO emp2 (eno, asal)
SELECT eno, sal*12 + NVL(comm,0)
FROM emp;

--자동변환이 가능할 때는 정상실행되지만
--자동변환이 안되면 에러를 발생시킨다
INSERT INTO emp2 (eno, asal)
SELECT eno, hdate FROM emp;

INSERT INTO emp2 (eno, asal)
SELECT eno,dno FROM emp;

SELECT * FROM emp2;

각 사원의 정보와 근무지를 emp3테이블에 저장한다.
SELECT * FROM dept;
SELECT * FROM emp3;

INSERT INTO emp3 (eno, ename, dno, dname)
SELECT e.eno, ename, e.dno, dname 
FROM emp e, dept d
WHERE e.dno = d.dno;

DELETE FROM emp3;

--SELECT 작업이나 DML작업은 모두 메모리에서 이루어진다.
--오라클은 SGA라는 메모리 영역 내에 데이터베이스 버퍼 캐시
(Database Buffer Cache)라는 영역을 이들 작업 공간으로 이용한다.
이를 통해 디스크 접근 회수와 양을 줄여 성능을 향상시킨다.
그러나 일괄적인 대량의 DML작업이 메모리에서 일어나면 이를 디스크에 반영하고
다시 메모리를 정리하는 등의 비효율이 발생한다.
이를 피하기 위해 대량 DML 작업에서는 메모리를 통하지 않고 디스크에 직접 작업을 수행하는 것을 다이렉트 로드(Direct Load)라 한다.
DML 작업을 다이렉트 로드하기 위해서는 '/*+ APPEND */'를 문장에서 삽입한다.
원래 /* */의 용도는 실행과 무관한 주석이지만, 여기에 +를 추가하여 힌트(HINT)절로 이용하도록 하고,
오라클은 이 문장을 참조하여 최적의 방법을 수행한다.

그리고 오라클은 안전한 시스템 운영을 위해 장애 발생 시 복구할 수 있도록 DB에 변경을 가하는 모든 작업의 내역을
리두 로그(Reado log)영역에 로그 정보로 보관한다.
그러나 대량의 DML 작업은 작업의 효율을 위해 이를 수행하지 않을 수 있다.
작업 성능을 위해 로그 정보를 남기지 않는다면 'NOLOGGING' 옵션을 이용한다.
그러나 이렇게 복구가 불가능하도록 작업한 이후에는 장애에 대비한 백업을 잊지 않아야 한다.
대량의 작업에서 다이렉트 로드와 노로깅 방식을 이용하면 작업 성능은 비약적으로 빨라지지만
작업의 안전도는 떨어질 수 밖에 없다.
다이렉트 로드를 이용 대량의 데이터를 테이블에 입력한 경우 입력되는 물리적인 위치가 일반 입력과 달라 
트랜잭션을 마무리 하지 않고 검색하게 되면 'ORA-12838: 병렬로 수정한 후 객체를 읽거나 수정할 수 없습니다'라는 에러를 만나게 된다
이것은 입력 데이터의 손상을 방지하기 위한 기능이다.
반드시 COMMIT 한 이후 검색한다.
;

INSERT /*+ APPEND */ INTO emp3 
NOLOGGING (eno, ename, dno, dname)
SELECT e.eno, ename, e.dno, dname 
FROM emp e, dept d
WHERE e.dno = d.dno;

COMMIT;


서브 쿼리를 이용한 UPDATE 문을 수행한다.
--김선유의 급여와 보너스를 
--각각 안영숙의 급여와 
--손하늘의 보너스와 동일하게 수정한다. (수정 나오면 UPDATE)
UPDATE emp 
SET sal = (SELECT sal FROM emp WHERE ename = '안영숙'), comm = (SELECT comm FROM emp WHERE ename = '손하늘')
WHERE ename = '김선유';

SELECT * FROM emp 
WHERE ename IN ('김선유', '안영숙', '손하늘');

제갈민과 동일한 부서의 사원들의 급여를 제갈민의 급여와 동일하게 수정한다.
SELECT * FROM emp;

UPDATE emp
SET sal = (SELECT sal FROM emp WHERE ename = '제갈민')
WHERE dno = (SELECT dno FROM emp WHERE ename = '제갈민');

SELECT dno, eno, ename, sal
FROM emp
WHERE dno = (SELECT dno
             FROM emp
             WHERE ename = '제갈민');

이초록의 급여, 보너스를 권아현과 동일하게 수정한다.
SELECT * FROM emp;
UPDATE emp
SET (sal,comm) = (SELECT sal, comm FROM emp WHERE ename = '권아현')
WHERE ename = '이초록';

SELECT * FROM emp;
UPDATE emp
SET sal = (SELECT sal FROM emp WHERE ename = '권아현')
    comm = (SELECT comm FROM emp WHERE ename = '권아현')
WHERE ename = '이초록';


SELECT ename, sal, comm
FROM emp
WHERE ename IN ('권아현', '이초록');