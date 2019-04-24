--1) 주제 : 그룹함수와 HAVING절
--        HAVING절은 WHERE절과 동일하다.
--        단 조건 내용에 그룹 함수를 포함하는 것만을 포함한다.
--        일반 조건은 WHERE 에 기술하지만 그룹 함수를 포함한 조건은 HAVING절에 기술한다.
--        
--2) 용법
--SELECT [DISTINCT/ALL] 컬럼 OR 그룹함수...
--FROM 테이블
--WHERE 조건
--GROUP BY 그룹대상
--HAVING 그룹함수 포함조건
--ORDER BY 정렬대상 [ASC/DESC];
--a) HAVING : 조건 중에 그룹함수를 포함하는 조건을 기술한다
--b) HAVING절은 GROUP BY 절 뒤에 기술한다

--부서별 급여 평균이 3천달러 미만인 부서의 부서번호와 평균 급여를 검색한다. 
-- ~별이면 GROUP BY
SELECT dno, ROUND(AVG(sal))
FROM emp
GROUP BY dno
HAVING AVG(sal) < 3000;

--아래는 job이 그룹으로 묶인 컬럼이 아니기 때문에 HAVING절에 사용하면 안된다.
--HAVING에는 dno에 관한 것만 넣어야 한다
SELECT dno 부서번호, COUNT(*) 인원수
FROM emp
GROUP BY dno
HAVING job != '개발'; 

--일반컬럼인 job은 WHERE절에 옮겨야 한다
SELECT dno 부서번호, COUNT(*) 인원수
FROM emp
WHERE job != '개발'
GROUP BY dno;

--GROUP으로 묶인 컬럼은 HAVING절에 조건을 기술한다.
SELECT dno 부서번호, COUNT(*) 인원수
FROM emp
WHERE job != '개발'
GROUP BY dno
HAVING dno != '10';

SELECT dno 부서번호, job 업무, COUNT(*) 인원수
FROM emp
GROUP BY dno, job
HAVING job != '개발'; 