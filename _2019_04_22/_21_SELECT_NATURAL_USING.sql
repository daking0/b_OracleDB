1) 주제 : NATURAL JOIN(자연 조인)
         동일한 타입과 이름을 가진 컬럼을 조인 조건으로
         이용하는 조인 문장을 좀 더 간단히 표현하는
         방법(등가 조인)
         
2) 용법
SELECT 컬럼, ...
FROM 테이블1
NATURAL JOIN 테이블2
WHERE 검색_조건;
 a) 여러 테이블에 존재하는 동일 컬럼을 SELECT에 기술할 때,
    이전 조인 문장과는 달리 테이블 이름을 생략하고 컬럼명만 표기한다.
 b) 반드시 두 테이블 간에 조인할 수 있는 동일한 이름, 타입을 가진 컬럼이 필요하다.
 c) 조인에 이용되는 컬럼은 별도로 명시하지 않아도 자동으로 조인에 사용된다.
 d) 동일한 이름을 갖는 컬럼의 데이터 타입이 다를 때 에러가 발생한다.
 e) 조인 조건을 쓸 필요가 없다.
 
-- 자연 조인으로 각 사원의 근무 부서를 검색한다.
 SELECT eno 사번, ename 이름, dno 부서번호, dname 부서명
 FROM emp
 NATURAL JOIN dept;
 SELECT *
 FROM emp;
 SELECT *
 FROM dept;
 
 SELECT eno 사번, ename 이름, dept.dno 부서번호, dname 부서명
 FROM dept, emp
 WHERE dept.dno = emp.dno;
 
-- 자연 조인을 이용해서 광주에서 근무하는 직원의 명단을 검색해라
-- (부서번호와 부서명도 검색한다)
 SELECT loc 근무처, dno 부서번호, dname 부서명, eno 사번, ename 이름
 FROM dept
 NATURAL JOIN emp
 WHERE loc = '광주';
 
 SELECT loc 근무처, dno 부서번호, dname 부서명, eno 사번, ename 이름
 FROM emp
 NATURAL JOIN dept
 WHERE loc = '광주';
 
 1) 주제 : USING 절을 포함한 조인
 
 2) 용법
    dept1 테이블과 emp1 테이블을 자연 조인한 결과 
    2개 테이블에는 각각 dno와 name이 이름과 타입이 모두 같게 된다.
    그러나 실제로는 name은 우연히 같은 것이지 내용은 전혀 다르므로
    원하는 결과를 얻을 수 없게 된다. 이 때 정확한 조인을 위해서 사용하는 것이 Using절이다.
    SELECT 컬럼, ...
    FROM 테이블1
    JOIN 테이블2 USING (조인_컬럼) [{JOIN 테이블3 USING (조인_컬럼)}...]
    WHERE 검색_조건
     a) USING절은 조인에 사용될 컬럼을 명시적으로 지정한다.
     b) 경우에 따라 자연 조인으로 바꿔 표현할 수 있지만 NATURAL절과 USING절은 함께 사용할 수 없다.
     c) 세 개 테이블 이상 조인할 경우 가독성이 좋다.
     d) 조인에 이용되지 않은 동일 이름을 가진 컬럼은 컬럼명 앞에 테이블 명을 기술한다.
    
 SELECT eno 사번, loc 근무처
 FROM dept1
 NATURAL JOIN emp1;
 
 SELECT eno 사번, loc 근무처
 FROM dept1, emp1
 WHERE dept1.dno = emp1.dno
 AND dept1.name = emp1.name;
 
-- USING절을 이용해서 각 사원의 근무 부서를 검색한다.
SELECT eno 사번, ename 이름, dno 부서번호, dname 부서명
FROM emp
JOIN dept USING (dno);

--USING절을 이용해서 광주에서 근무하는 직원의 명단을 검색한다.
SELECT loc 근무처, dno 부서번호, dname 부서명, eno 사번, ename 이름
FROM dept
JOIN emp USING (dno)
WHERE loc = '광주';

--USING절을 이용해서 화학과 1학년 학생들의 유기화학 점수를 검색하세요.
SELECT *
FROM student;
SELECT *
FROM score;
SELECT *
FROM course;

SELECT *
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE major = '화학' AND cname = '유기화학';




