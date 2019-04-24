--1) 주제 : 다중 열 서브 쿼리
--        여러 개의 컬럼을 검색한다
--        주로 'IN'을 사용하지만 '='도 가능하다
--
--2) 용법
--SELECT [ DISTINCT|ALL] 컬럼, 컬럼...
--FROM 테이블
--WHERE (컬럼1,컬럼2...) IN (SELECT문 : Sub Query)
--a) 서브 쿼리의 SELECT문에 여러 개의 컬럼을 검색한다
--b) 여러 개의 컬럼을 검색하는 서브 쿼리문을 이용할 때는
--   반드시 비교 대상 컬럼과 1:1 대응되어야 한다.

--손하늘과 동일한 관리자의 관리를 받으면서 손하늘과 업무도 같은 사원
1) 손하늘의 관리자와 업무를 검색
SELECT mgr, job
FROM emp
WHERE ename = '손하늘';

2) 검색정보와 같은 사원을 검색한다
SELECT eno, ename
FROM emp
WHERE mgr = '0001'
AND job = '지원'
AND ename != '손하늘';

3)합친다
SELECT eno, ename
FROM emp
WHERE (mgr, job) IN (SELECT mgr, job
                     FROM emp
                     WHERE ename = '손하늘')
AND ename != '손하늘';                    

--데이터가 1개만 있다고 보장될 때 단일 행 서브쿼리로 변경 가능
SELECT eno, ename, mgr, job
FROM emp
WHERE mgr = (SELECT mgr
             FROM emp
             WHERE ename = '손하늘')
AND job = (SELECT job
           FROM emp
           WHERE ename = '손하늘')
AND ename != '손하늘';


SELECT eno, ename, mgr, job
FROM emp
WHERE mgr IN (SELECT mgr
             FROM emp
             WHERE ename = '손하늘')
AND job IN (SELECT job
           FROM emp
           WHERE ename = '손하늘')
AND ename != '손하늘';

--각 부서별로 최소 급여를 받는 사원의 정보를 검색한다 (이름, 급여)
1) 각 부서별 최소 급여 검색
SELECT dno 부서별, MIN(sal) 최소급여
FROM emp
GROUP BY dno;

2) 검색결과에 의한 사원 정보 검색
SELECT dno, ename, sal
FROM emp
WHERE (dno, sal) IN ();

3) 합치기
SELECT dno, ename, sal
FROM emp
WHERE (dno, sal) IN (SELECT dno 부서별, MIN(sal) 최소급여
                     FROM emp
                     GROUP BY dno);
                     
                     