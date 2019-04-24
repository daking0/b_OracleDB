--1)주제 : 서브 쿼리
--        서브 쿼리는 둘 이상의 SQL문장이 합해서 만들어진 것으로 
--        보통은 서브 쿼리(Sub Query : 내부 질의)에 의해 검색된 결과 값이 SQL문에 필요한 경우에 사용된다.
--        즉 서브 쿼리란 SQL문장 내에 쓰인 SELECT문장을 의미하며,
--        이때 SQL문장은 메인 쿼리(Main Query:외부 질의)라 불린다
--        서브 쿼리는 WHERE절, HAVING절과 같이 조건 절에 주로 쓰이고, FROM절에 쓰이는 경우도 있다.
--        FROM절에 서브 쿼리를 쓰는 경우는 인라인 뷰(Inline View)라고 부른다.
--        
--2)용법 
--*단일 행 서브 쿼리
--: 서브 쿼리 문장에서 단 하나의 행과 열을 검색하는 SQL문이다.
--특히 검색된 결과 값을 조건문에 이용하는 경우 많이 사용된다.
--SELECT [DISTINCT|ALL] 컬럼, 컬럼...
--FROM 테이블
--WHERE 컬럼 <단일 행 연산자> (SELECT 문장 : Sub Query문)
--
--a) 단일 행 연산자가 사용됨으로 반드시 서브 쿼리의 결과 값은 한 개만 검색되야 한다.
--b) 서브 쿼리는 반드시 괄호로 묶는다.
--c) 서브 쿼리의 검색된 결과 값은 메인 쿼리에서 사용된다.
--d) 단일 행 연산자 오른쪽에 기술한다
--   <=, <, > , <=, >=, !=
--e) WHERE절에 기술된 열의 숫자와 타입은 SELECT절과 1:1 대응 관계가 되어야 한다.
--
--김연아보다 급여를 많이 받는 사원을 검색한다.
--1) 김연아의 급여를 얻는다
SELECT sal 
FROM emp
WHERE ename = '김연아';

--2) 해당 급여보다 많이 받는 사원을 검색한다.
SELECT eno, ename
FROM emp
WHERE sal > 3300;

--3)쿼리문을 합친다
SELECT eno, ename
FROM emp
WHERE sal > (SELECT sal 
            FROM emp
            WHERE ename = '김연아');
            
--제갈민과 부서가 다르고 동일한 업무를 하는 사원의 정보를 검색한다
1) 제갈민의 부서를 검색하세요
SELECT dno 
FROM emp
WHERE ename = '제갈민';

2) 제갈민의 업무를 검색하세요
SELECT job
FROM emp
WHERE ename = '제갈민';

3) 1), 2) 결과의 부서가 다르고 업무는 동일한 사원을 검색하세요
SELECT eno, ename, dno, job
FROM emp
WHERE dno != '20'
AND job ='개발';

4)합친다
SELECT eno, ename, dno, job
FROM emp
WHERE dno != (SELECT dno 
              FROM emp
              WHERE ename = '제갈민')
AND job =(SELECT job
          FROM emp
          WHERE ename = '제갈민');
          
--부서중에 급여를 가장 많이 받는 부서를 검색하세요
1) 부서의 평균급여가 가장 큰 값을 검색한다
SELECT dno, AVG(sal) 
FROM emp
GROUP BY dno;

SELECT MAX(AVG(sal)) 
FROM emp
GROUP BY dno;

2) 이 값과 동일한 평균급여를 가진 부서를 검색한다
SELECT dno '급여를 가장 많이 받는 부서'
FROM emp
GROUP BY dno 
HAVING ANG(sal) = 4070;

3)합친다
SELECT dno '급여를 가장 많이 받는 부서', AVG(sal)
FROM emp
GROUP BY dno 
HAVING ANG(sal) = (SELECT MAX(AVG(sal)) 
                   FROM emp
                   GROUP BY dno);
                   
--부산에서 근무하는 사원의 정보를 검색하세요
1)부산에 있는 부서를 검색
SELECT dno 
FROM dept
WHERE loc = '부산';

2)해당 부서의 사원 정보를 검색
SELECT eno, ename
FROM emp
WHERE dno = '20';

3)합친다
SELECT * 
FROM emp
WHERE dno = (SELECT dno 
       FROM dept
       where loc = '부산');
       
SELECT *
FROM emp
NATURAL JOIN dept 
WHERE loc ='부산';

SELECT *
FROM emp
JOIN dept USING (dno)
WHERE loc ='부산';