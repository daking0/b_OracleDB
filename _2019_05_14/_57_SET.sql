--1) 집합 연산자
--  ; 집합 연산자는 합집합, 교집합, 차집합을 의미하는 연산자로
--  SELECT 결과에 대해서 집합 연산을 수행한다.
--  
--2) 종류
--UNION     합집합, 중복은 제거된다
--UNION ALL 합집합, 중복을 포함한다
--INTERSECT 교집합, 양쪽 모두 존재하는 행을 검색한다
--MINUS     차집합, 첫번쨰 검색 결과에서 두번째 검색을 제외한다
--
--3)용법
--SELECT ...
--[UNION ALL| UNION | INTERSECT | MINUS]
--SELECT... 
--  (1) 두 SELECT 문의 결과를 집합연산한다
--  (2) 검색 결과의 헤더는 앞쪽 SELECT 문에 의해 결정된다
--  (3) 두 SELECT 문의 컬럼 개수와 데이터 타입이 일치해야 한다
--  (4) ALL : 중복을 포함한다( 그냥 다 가져와라)

--2000년 이후에 입사한 사원과 부임한 교수의 명단을 검색한다
--만일 두개 테이블에 중복이 없다는 사실을 인지한다면
--UNION 보다는 UNION ALL 이 성능이 더 좋다
--왜냐하면 UNION 은 중복을 제거하기 위해 정렬을 하니까
SELECT eno, ename, hdate
FROM emp
WHERE hdate > '2000/01/01'
UNION
SELECT pno, pname, hiredate
FROM professor
WHERE hiredate > '2000/01/01';

--제갈씨 성을 가진 사원 중에 지원 업무를 하지않는 사원을 검색한다
-- != 부정 연산자는 인덱스를 사용하지 못한다
-- = 인덳르르 이용할 수 있다
-- 그러므로 job에 인덱스가 존재하는 경우
-- != 보다 =가 성능이 훨씬 좋을 수도 있다.
SELECT eno, ename, job
FROM emp
WHERE ename LIKE '제갈%'
MINUS
SELECT eno, ename, job
FROM emp
WHERE job = '지원';

--이렇게 해도 된다.
SELECT eno, ename, job
FROM emp
WHERE ename LIKE '제갈%'
AND job = '지원';
