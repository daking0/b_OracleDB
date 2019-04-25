--1) 주제 : 관계 연산자, LIKE 연산자
--
--2) 용법 
--SELECT [DISTINCT|ALL] 컬럼, 컬럼...
--FROM 테이블
--WHERE 조건 [관계연산자 조건...]
--ORDER BY 컬럼[ASC/DESC], 컬럼[ASC/DESC]...
-- a) 관계 연산자는 여러 개의 조건을 동시에 이용할 때 사용
-- b) AND, OR, NOT 등의 관계연산자가 사용된다.
-- c) 복잡한 관계 연산은 예상치 못한 결과를 발생 시킬 수 있다.
--    그러므로 두 개 이상의 관계 연산을 이용할 때는 반드시
--    괄호를 이용 연산의 우선순위를 SQL 작성자가 직접 결정한다.

--20번 부서 사원중에 급여가 2000이상인 사원을 검색한다.
SELECT *
FROM emp;
WHERE dno = '20' AND sal >= '2000';

--20번 부서 사원중에 급여가 1500이상이고 개발 업무를
--담당하는 사원을 검색한다.

SELECT *
FROM emp
WHERE dno = '20' AND sal >= '1500' AND job ='개발';

--20번 부서 사원중에 급여가 1500이상이고 개발 업무를
--담당하는 사원과 급여가 3000이상인 사원을 검색한다.
SELECT *
FROM emp
WHERE sal >= '3000' or (dno = '20' AND sal >= '1500' AND job = '개발')
ORDER BY sal DESC;

--회계부서 사원과 개발 부서사원을 검색하세요.
SELECT * 
FROM emp
WHERE job = '회계' or job = '개발';

--개발부서 사원을 제외하고 타부서 사원만 검색하세요.
SELECT *
FROM emp
WHERE NOT (job = '개발');
--WHERE job^ = '개발';
--WHERE job<> '개발';

--관계 연산자 우선순위
--NOT > AND > OR

--부서번호가 10인 사원과
--급여가 1600보다 크고 보너스가 600보다 큰 사원을 검색해라.
SELECT *
FROM emp
WHERE dno = 10
OR (sal > 1600
AND comm > 600);

