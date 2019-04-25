--1) 주제 : 분산된 테이블로 부터 필요한 정보를 가져올 때
--         이러한 여러 테이블로부터 데이터를 검색하는 것을
--         조인(Join)이라하고, 조인은 테이블간의 관계(Realation)를
--         근간으로 수행한다.
--         등가 조인    : 두 테이블간의 같은 값을 찾아 조인
--         비등가 조인  : 두 테이블간의 서로 다른 값을 부등호로 조인
--
--2) 용법
-- SELECT 테이블1.컬럼, ... 테이블2.컬럼...
-- FROM 테이블1, 테이블2
-- WHERE 조인_조건
-- AND 일반_조건
--  a) 조인 조건은 두 테이블간의 관계를 수식으로 표현한 것이다.
--  b) 조인 문장에서 기술된 모든 테이블은 반드시 조인 조건이
--     기술된다.
--  c) 동일한 이름의 컬럼이 여러 테이블에 존재하는 경우 테이블 이름을
--     반드시 써줘서 어떤 테이블의 컬럼인지 알려줘야 한다.
--  d) 조인 조건은 SELECT문에 사용된 테이블의 개수에 따라 달라지지만
--     테이블 개수가 n이라면 항상 조인 조건의 개수는 (n-1)개 이상이다.
--  e) 조인 조건에 '='를 이용하는 조인을 등가 조인(Equi-join)이라고 하고,
--     부등호가 포함된 조인 조건을 이용하는 경우 비 등가 조인(Non equi-join)이라고 한다.

--각 사원의 근무 부서를 검색한다.
SELECT *
FROM emp;

SELECT *
FROM dept;

SELECT eno 사번, ename 이름, emp.dno 부서번호,
       dept.dno 부서번호, dname 부서명
FROM emp, dept
WHERE dept.dno = emp.dno;

SELECT emp.eno 사번, emp.ename 이름, emp.dno 부서번호,
       dept.dno 부서번호, dept.dname 부서명
FROM emp, dept
WHERE dept.dno = emp.dno;

--광주에서 근무하는 직원의 명단을 검색한다.
--(부서번호와 부서명도 검색한다)

SELECT emp.eno 사번, emp.ename 이름, emp.dno 부서번호, dept.dname 부서명, dept.loc 근무지역
FROM emp, dept
WHERE dept.dno = emp.dno AND dept.loc IN ('광주');

--테이블 별명 붙이기
--sql문이 SELECT 절보다 FROM절이 먼저 실행된다.
--왜냐하면 SELECT절의 컬럼이 테이블에 존재하는 지 여부를 판단해야 하기 때문에.
--그래서 테이블의 별명을 붙이면, 컬럼에서도 별명으로 컬럼을 호출해야 한다.

SELECT e.eno 사번, e.ename 이름, e.dno 부서번호, d.dname 부서명, d.loc 근무지역
FROM emp e, dept d
WHERE e.dno = d.dno AND d.loc IN ('광주');

--각 직원의 급여를 10% 인상한 경우 급여 등급을 검색한다.
--(emp, salgrade)
SELECT *
FROM emp;

SELECT *
FROM salgrade;

SELECT e.eno 사번, e.ename 이름, (e.sal*1.1) "10% 인상 된 급여", s.grade 등급
FROM emp e, salgrade s
WHERE e.sal*1.1 BETWEEN s.losal AND s.hisal
ORDER BY e.sal DESC;

--조인 조건이 없는 잘못된 조인문장
--*반드시 조인 조건이 있어야 한다.
--조인 조건을 누락하게 되면 모든 행이 1:1로 대응된
--잘못된 결과 값(Cartesian product)를 얻게 된다.
--교차 조인(Cross Join)
SELECT d.dno, dname, e.dno, ename
FROM emp e, dept d;
