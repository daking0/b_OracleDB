--1) SELECT절의 다양한 활용
--
--2) 용법
--SELECT 컬럼 as "별명", 컬럼 as "별명",...
--FROM 테이블;
--
--3) 설명
--  a) 별명은 헤더에 출력되는 내용을 바꿔서 검색된 
--     데이터의 해석을 돕는다.
--  b) 예약에 'as'는 생략 가능하다.
--  c) 다음에 해당하는 별명을 사용하는 경우 반드시
--     "(이중인용부호)를 사용한다.
--     - 공백이 포함된 경우
--     - 특수 문자가 포함된 경우
--     - 대소문자를 구별하고자 할 경우
--  d) 다음 2개의 문장은 동일하다.
--     SELECT eno AS "사원 번호"
--     SELECT eno "사원 번호"

--사원의 이름과 담당업무를 검색하여 보고한다.
SELECT eno, ename, job FROM emp;

SELECT eno 사번, ename 이름, job 업무 FROM emp;

--수식을 이용한 검색
--각 사원의 급여와 1년간 수급하는 급여를 검색한다.
SELECT eno 사번, ename 이름, sal*12 "연간 급여" FROM emp;

--null은 값을 알 수 없다.
--       정해지지 않았다.
--       모른다.
--프로그램에서는 null을 0과 같이 사용하는 경우도 있다.
--하지만 null과 0은 다른 의미이다.
--ex) null을 넣고 전체 평균을 구하면 아예 빠져버림.


--사원의 연봉을 검색한다(연봉 = 월급(sal)*12 + 보너스(comm))
--이 구문을 실행하면 null에 의해 결과도 null이 도출된다.
SELECT eno 사번, ename 이름, sal 급여, comm 보너스, sal*12 + comm 연봉 FROM emp;
DESC emp;
--NVL(컬럼, 치환값)
--; 컬럼이 null일 경우 치환값을 교체
--  null이 아닐 경우 원래 값을 반환
--  치환값은 컬럼값의 데이터타입과 일치해야 한다.

--사원의 연봉을 검색한다(comm(보너스))의 null을 0으로 치환한다.)
SELECT eno 사번, ename 이름, sal*12+NVL(comm, 0) 연봉 FROM emp;