--1) 조인 문을 만드는 절차
--
--2) ERD(Entity-Relationship Diagram) 도표를 보면
--   테이블간의 연관관계를 바로 알 수 있다.
--   => Join을 어떤 컬럼으로 해야 하는 지 알 수 있다.
--3) 절차
--   a) step1. 지문에서 검색대상과 조건을 찾는다.
--             (지문의 단어로 찾는다.)
--      step2. SELECT절, WHERE절, ORDER BY절을 한글로 완성한다.
--      step3. SELECT절과 WHERE절의 내용에 따라 정보를
--             검색할 테이블을 찾는다.
--      step4. 테이블에서 검색대상과 조건에 해당하는 컬럼을 찾는다.
--      step5. 테이블간의 관계를 확인한다.
--             테이블과 테이블의 연결관계가 없을 때는 다른 중개 테이블을
--             추가하게 된다.
--      step6. 조인 조건을 기술한다.
--      step7. 전체 문장을 다듬는다.
--   b) 예제
--      문제 : 화학과 학생의 일반화학 기말고사 점수를 검색한다.
--      step1. 검색 대상과 조건을 찾는다.
--             검색 대상 : 기말고사 점수
--             조건     : 화학과 학생
--                       일반화학 과목

       step2. SELECT절, WHERE절, ORDER BY 절을 한글로 완성한다.
       SELECT 기말고사 점수
       FROM
       WHERE 화학과 학생 AND 일반화학 과목
       
       step3. SELECT절과 WHERE절의 내용에 따라 정보를
              검색할 테이블을 찾는다.
              학생 : student
              과목 : course
              기말고사 점수 : score
              
       step4. 테이블에서 검색대상과 조건에 해당하는 컬럼을 찾는다.
              검색 대상 : 기말고사 점수 score.result
              조건     : 화학과 학생 student.major
                        일반화학 과목 course.cname
       SELECT result
       FROM score, course, student
       WHERE major = '화학' AND cname = '일반화학';
       
       step5. 테이블간의 관계를 확인한다.
       <student> - sno - <score> - cno - <course>
       
       step6. 조인 조건을 기술한다.
       SELECT result
       FROM score, course, student
       WHERE student.sno = score.sno
       AND score.cno = course.cno
       AND major = '화학' AND cname = '일반화학';
       
       step7. 전체 문장을 다듬는다.
       SELECT major, cname, sname, result
       FROM score, course, student
       WHERE student.sno = score.sno
       AND score.cno = course.cno
       AND major = '화학' AND cname = '일반화학';

-- c) 예제
--    문제 : 4학년 학생이 수강하는 과목을 강의하는 교수의 명단을 검색한다.
SELECT *
FROM student;
SELECT *
FROM course;
SELECT *
FROM score;
SELECT *
FROM professor;

SELECT DISTINCT(p.pno) 교수번호, p.pname 교수이름, s.syear 학년
FROM student s, course c, professor p, score sc
WHERE s.sno = sc.sno
AND sc.cno = c.cno
AND c.pno = p.pno
AND s.syear = 4;

-- 4학년 학생이 수강하는 과목을 강의하는 교수의 명단을 검색한다.
SELECT
  distinct(professor.pno), professor.pname
FROM
  professor, student, course, score
WHERE
  professor.pno = course.pno
  AND course.cno = score.cno
  AND score.sno = student.sno
  AND student.syear = 4;
  
  
--1) 자기 참조 Join(Self Join)
--
--2) 용법
--SELECT 별명1.컬럼1...별병2.컬럼1...
--FROM 테이블 별명1, 테이블 별명2...
--WHERE 조인_조건
--AND 일반_조건
-- a) 동일 테이블을 자기 참조에 의해 조인한다.
-- b) 별명1과 별명2는 동일 테이블에 대한 별명이지만
--    각각 별도의 테이블처럼 사용한다.
-- c) 하나의 테이블에 별명을 다르게 해서 마치 여러 개의
--    테이블간 조인하는 것처럼 문장을 구현한다.
-- d) 서로 다른 별명을 별개의 테이블로 가정하면 보통의
--    등가조인이나 비등가조인과 동일하다.
-- e) 테이블에 반드시 별명을 붙여야 됨으로 별명을 이용한
--    조인이라 부르기도 한다.
    
각 사원을 달리하는 사수의 이름을 검색한다.
SELECT e1.eno 사번, e1.ename 이름, e2.ename 관리자
FROM emp4 e1, emp4 e2
WHERE e1.mgr = e2.eno;

--1) 외부조인
--SELECT 테이블1.컬럼, ...테이블2.컬럼...
--FROM 테이블1, 테이블2...
--WHERE 조인_조건(+)
--AND 일반_조건
-- a) 조인 조건에 일치하지 않는 데이터를 출력해준다.
-- b) 조인 결과물을 해석할 때 오해를 방지하기 위한 방법이다.
-- c) '+' 기호는 데이터가 부족한 쪽에 기술한다.

--각 부서별로 사원을 검색한다. (일반조인)
SELECT d.dno 부서번호, dname 부서명, ename 사원명
FROM dept d, emp e
WHERE d.dno = e.dno 
ORDER BY 부서번호;

dept 테이블에는 50번 부서가 존재하지만
emp테이블에는 50번부서의 사원이 없다.
이런 경우 데이터가 부족한 쪽(emp.dno)에
조인조건(+)기호를 추가한다.

--각 부서별로 사원을 검색한다. (외부조인)
SELECT d.dno 부서번호, dname 부서명, ename 사원명
FROM dept d, emp e
WHERE d.dno = e.dno(+)
ORDER BY 부서번호;




