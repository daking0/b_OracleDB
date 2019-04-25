--1) 주제: 정렬된 데이터 검색
--2) 용법
--SELECT 컬럼, 컬럼, ...
--FROM 테이블
--ORDER BY [ASC/DESC], 컬럼[ASC,DESC]...
-- a) ORDER BY : 지정된 컬럼을 대상으로 정렬을 수행
-- b) ASC : 오름차순 정렬, DESC는 내림차순 정렬
--          지정하지 않으면 오름차순이 기본값.
-- c) 정렬대상인 컬럼이 여러 개인 경우 앞에 지정한
--    컬럼이 동일한 값에 대해서 지정된 컬럼으로
--    정렬된다. 즉 앞쪽 컬럼의 정렬이 깨지지 않는
--    범위 내에서 두 번째 컬럼으로 정렬을 수행한다.
-- d) 정렬하지 않는 SELECT문의 출력 순서는 의미가 없다.
-- e) 정렬 대상으로는 컬럼이외의 다음의 것들이 사용가능.
--    별명/수식/검색항목의 순서

--사원의 이름을 급여 순으로 검색한다.
SELECT eno 사번, ename 이름, sal 급여 FROM emp ORDER BY sal DESC;

SELECT eno 사번, ename 이름, sal 급여 FROM emp ORDER BY sal ASC;

--사원의 사번과 이름을 연봉순으로 검색한다.
SELECT eno 사번, ename 이름, sal*12+NVL(comm, 0) 연봉 FROM emp ORDER BY sal*12+NVL(comm, 0) DESC;

SELECT eno 사번, ename 이름, sal*12+NVL(comm, 0) 연봉 FROM emp ORDER BY 연봉 DESC;

--아래 두개는 같다
SELECT eno, ename, sal FROM emp ORDER BY eno;
SELECT eno, ename, sal FROM emp ORDER BY 1;

SELECT eno, ename, sal FROM emp ORDER BY ename;
SELECT eno, ename, sal FROM emp ORDER BY 2;

SELECT eno, ename, sal FROM emp ORDER BY sal;
SELECT eno, ename, sal FROM emp ORDER BY 3;

--각 부서별로 사원의 급여를 검색한다.
--단 급여를 많이 받는 사람부터 검색한다.

SELECT * FROM emp;

SELECT dno 부서번호, eno 사번, ename 이름, sal 급여 FROM emp
ORDER BY 부서번호, 급여 DESC ;

--SQL문에서 ~별로 검색일 때
--1) ORDER BY
--2) GROUP함수를 사용