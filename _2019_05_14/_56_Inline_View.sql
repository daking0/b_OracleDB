--1) 인라인 뷰
--  ;인라인뷰(Inline View)란 FROM 절에 사용한 서브쿼리를 의미한다.
--  인라인 뷰는 테이블 전체를 정의역으로 이용하지 않고
--  이 중 일부만을 정의역으로 사용하는 방법이다.
--  좀 더 작은 범위나 연산된 구역을 대상으로 검색을 함으로써
--  단순 SQL 에서보다 다양한 기능을 수행할 수 있으며
--  RDBMS 의 특성으로 인해 단순 문장으로 수행이 어려운 문제를 해결하는데 많이 사용된다.

--2) 용법
--SELECT ...
--FROM (SELECT 문 : sub query 문) 별명
--...
--  (1) 서브 쿼리에 별명을 부여할 경우 인라인 뷰가 생성된다
--  (2) 인라인 뷰는 문장이 실행되는 동안만 존재하는 뷰이다

--각 부서별 최소 급여자를 검색한다
SELECT eno, ename, d.dno, sal, msal
FROM emp e,(SELECT dno, MIN(sal) msal
            FROM emp
            GROUP BY dno
            )d
WHERE e.dno = d.dno
AND sal = msal;
--이 문장이 끝나면 inline view는 사라진다

--ROWNUM 을 이용한 TOP-N 분석
--FROM (SELECT .. ORDER BY ...)
--WHERE ROWNUM <= N; 
--  (1) 상/하위 N개의 행을 검색한다
--  (2) 인라인 뷰에 반드시 ORDER BY 절이 필요하다
--  (3) ROWNUM 은 검색된 행의 순서이다

--EMP테이블로부터 3행까지만 검색한다
SELECT ROWNUM, eno, ename, job, mgr, hdate
FROM emp
WHERE ROWNUM <= 3;

--최상위 연봉을 지급받는 3인을 검색한다
--아래처럼 인라인 뷰로 정렬해서 검색해야 정확한 결과를 얻는다
SELECT ROWNUM, eno, ename, ansal
FROM (SELECT eno, ename, NVL(sal,0)*12+NVL(comm,0) ansal
      FROM emp
      ORDER BY ansal DESC
      )
WHERE ROWNUM <= 3;

-- ROWNUM 을 지정하는 테이블에서 읽는 개수를 제한한다. commit 연속으로 3개 나옴
SELECT eno, ename, NVL(sal,0)*12+NVL(comm,0) ansal
FROM emp
WHERE ROWNUM <= 3
ORDER BY ansal DESC;


