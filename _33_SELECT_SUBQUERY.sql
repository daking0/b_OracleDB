--1)주제 : 다중행 서브 쿼리
--        서브 쿼리에서 여러 행이 검색되는 것
--        연산자를 제외하면 단일행 서브쿼리와 동일
--2)용법 
--SELECT [DISTINCT|ALL] 컬럼, 컬럼...
--FROM 테이블
--WHERE 컬럼 <다중 행 연산자> (SELECT 문장 : Sub Query)
--
--a) 서브 쿼리에 여러 개의 행이 검색되는 쿼리문을 다중 행 서브 쿼리라고 한다.
--b) 다중 행 서브 쿼리는 다중 행 연산자를 이용한다
--c) 다중 행 연산자의 종류
--   IN : 검색된 값 중에 하나만 일치하면 참이다
--   ANY : 검색된 값 중에 조건에 맞는 것이 1개 이상이면 참이다
--   ALL : 모든 검색된 값과 조건에 맞아야 참이다


--20번 부서원들과 동일한 관리자로부터 관리 받는 사원을 검색
1) 20번 부서원들의 관리자 번호를 검색
SELECT mgr
FROM emp
WHERE dno = '20';

2) 검색된 관리자 번호와 동일한 관리자인 사원을 검색 
SELECT eno, ename, mgr, dno
FROM emp
WHERE mgr IN('0202' , '1002');

3)결과를 합친다
SELECT eno, ename, mgr, dno
FROM emp
WHERE mgr IN(SELECT mgr
             FROM emp
             WHERE dno = '20');
             
--10번 부서원들보다 급여가 낮은 사원을 검색하세요
1)01번 부서원들의 급여를 검색
SELECT sal
FROM emp
WHERE dno = '01';

2)검색된 급여들보다 낮은 사원 검색
SELECT eno, ename, dno, sal
FROM emp
WHERE sal < 3510
AND dno != '01';

3)합친다
SELECT eno, ename, dno, sal
FROM emp
WHERE sal < ALL(SELECT sal
            FROM emp
            WHERE dno = '01')
ORDER BY sal;

SELECT *
FROM emp
WHERE sal <(SELECT MIN(sal)
              FROM emp
              WHERE dno = '01')
ORDER BY sal;

--다중 행 연산자와 그룹 함수
--*다중 행 연산자인 ALL이나 ANY는 다음과 같이 그룹함수를 이용해서 표현할 수 있다.
--a) 컬럼 > ALL -> 컬럼 > MAX : 가장 큰 값보다 크다
--b) 컬럼 < ALL -> 컬럼 < MIN : 가장 작은 값보다 작다
--c) 컬럼 > ANY -> 컬럼 > MIN : 가장 작은 값보다 크다
--d) 컬럼 < ANY -> 컬럼 < MAX : 가장 큰 값보다 작다

20번 부서원들과 보너스가 같은 사원을 검색한다.
1)20번 부서원들의 보너스 검색
SELECT eno, ename, comm
FROM emp
WHERE comm IN(SELECT NVL(comm,0)
              FROM emp
              WHERE dno = '20')
AND dno != '20';
