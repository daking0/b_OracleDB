--1) 주제 : 연결 연산자와 중복제거
--
--2) 용법
--SELECT 컬럼|| '리터럴'||......
--FROM 테이블;
--a) 연결연산자(||)는 리터럴이나 컬럼을 하나의
--   문자열로 검색한다.
--b) 리터럴이란 SQL문에 쓰인 문자, 숫자, 날짜를
--   의미한다.
--   리터럴은 숫자를 제외하고 반드시 단일 인용부호를 사용한다.
--c) 연결 연산자는 SELECT문을 이용 다양한 문장을
--   만들 때 많이 사용된다.

SELECT ename||sal 직원급여 FROM emp;

SELECT ename 직원, sal 급여 FROM emp;

SELECT ename||' '||sal 이름급여 FROM emp;

SELECT ename||'의 업무는 '||job||'입니다.' 직원업무 FROM emp;

-- 주의해야 할 연결 연산자
--연결 연산자는 사칙연산자보다 우선순위가 높다.
--그러므로 아래 예제들은 문자열과 숫자를 합치려고 해서
--에러가 발생한다.
SELECT ename||' '||sal+100
FROM emp;
SELECT eno||ename||sal*12+NVL(comm,0)
FROM emp;

-- 괄호로 우선순위 설정
SELECT ename||' '||(sal+100) 급여
FROM emp;
SELECT eno||ename||(sal*12+NVL(comm,0))
FROM emp;


SELECT * FROM student;
SELECT sname||'의 성별은 '||sex||'입니다.' "학생 성별" FROM student;
SELECT sname||'의 전공은 '||major||'입니다' "학생 전공" FROM student;


-- 중복 제거
SELECT job FROM emp;

SELECT DISTINCT job FROM emp;

