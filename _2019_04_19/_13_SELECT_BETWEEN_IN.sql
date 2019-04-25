--1) 주제 : BETWEEN 연산자와 IN연산자
--
--2) 용법
--SELECT [DISTINCT|ALL] 컬럼, 컬럼...
--FROM 테이블
--WHERE 컬럼 BETWEEN 값1 AND 값2
--ORDER BY 컬럼 [ASC/DESC], 컬럼 [ASC/DESC]...
-- a) 컬럼 >= 값1 AND 컬럼 <= 값2 와 동일하다.
-- b) 컬럼의 값이 값1에서 값2사이의 값을 검색한다.
-- c) 값1은 반드시 값2보다 작아야 한다.
-- d) AND연산자로 환원 가능하짐나 읽기 쉽기 때문에
--    BETWEEN..AND를 사용하는 것이 좋다.
--    
--급여가 1000에서 2000 이내인 사원
SELECT* 
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

--부서번호가 10, 20인 사원을 검색하세요.
SELECT *
FROM emp
WHERE dno BETWEEN '10' AND '20';

SELECT *
FROM emp
WHERE dno >= '10' AND dno <= '20';

--1992년에서 1996년 사이에 입사한 사원을 검색하세요.
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD';
SELECT *
FROM emp
WHERE hdate BETWEEN '1992/01/01' AND '1996/12/31'
ORDER BY hdate;

--'1992/01/01' ==> '1992/01/01:00:00:00'
--'1996/12/31' ==> '1996/12/31:00:00:00'
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD:HH24:MI:SS';
SELECT *
FROM emp
WHERE hdate BETWEEN '1992/01/01:00:00:00' AND '1996/12/31:23:59:59'
ORDER BY hdate;

--반드시 BETWEEN에서 앞의 값이 뒤의 값보다 작아야 한다.
--급여가 2000에서 1000인 사원을 검색하세요.
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000
ORDER BY sal DESC;

--3)IN 연산자의 용법
--SELECT [DISTINCT|ALL] 컬럼, 컬럼...
--FROM 테이블
--WHERE 컬럼 IN (값1, 값2 ...)
--ORDER BY 컬럼 [ASC/DESC], 컬럼 [ASC/DESC]...
-- a) 지정된 값중에 일치하는 값이 하나라도 있으면 검색된다.
-- b) OR연산관 =연산자로 교환 가능하다.
-- c) 가독성이 매우 우수하다.
-- d) IN연산자는 나중에 서브쿼리, 파티션 등의 여러 기능에
--    사용되는 중요한 연산자이다.

--개발이나 관리 업무를 담당하는 사원을 검색하세요.
SELECT *
FROM emp
WHERE job IN('개발', '회계')
ORDER BY job;

부서번호가 10, 20인 사원정보를 검색하세요.
SELECT *
FROM emp
WHERE dno IN('10', '20')
ORDER BY dno;

--BETWEEN 값1 AND 값2 : Java if (값1<=a)&&(a<=값2)범위
--IN(값1, 값2, ...)   : Java Switch~case