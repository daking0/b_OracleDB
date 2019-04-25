--1) 주제 : 조건 검색
--
--2) 용법
--SELECT 컬럼, 컬럼
--FROM 테이블
--WHERE 조건
--ORDER BY 컬럼[ASC/DESC], 컬럼[ASC/DESC]...
-- a) 조건을 통해 컬럼 내의 데이터를 제한한다.
-- b) WHERE절은 FROM절 바로 뒤에 기술한다.
-- c) 조건의 대상은 컬럼명, 연산자, 수식 등이 가능하다.
-- d) 조건에 이용되는 연산자
--    =, <, >, <=, >=
--    <>, !=, ^= : 같지 않다.

--사원 중에 급여가 400이상인 사원의 명단을 검색해라.
SELECT eno 사번, ename 이름, sal 급여 FROM emp WHERE sal >= 4000;

--이름이 '김연아'인 사원의 정보를 검색해라.
SELECT * FROM emp WHERE ename='김연아';

--dno는 문자형 데이터이고 10은 숫자이므로
--10을 문자형으로 형변환한다.
--현재 같은 경우는 전혀 문제가 안되지만
--응용 SW로 구현된 환경이면 하루에 SQL문이 수만번 조회되고,
--수천만번 이상되는 행을 가진
--테이블에서 이런 작업이 반복되면 시스템 전체 성능에
--심각하게 영향을 줄 수도 있다.

--10번 부서를 제외한 사원의 명단을 검색해라.
SELECT eno 사번, ename 이름, dno 부서번호
FROM emp
WHERE dno != '10'; 
--데이터 타입을 안맞춰도 실행은 되지만 대용량일 경우 속도의 저하가 생길 수 있다.

--연봉이 30000이상인 사원의 이름을 검색한다.
SELECT eno 사번, ename 이름, sal*12+NVL(comm, 0) 연봉 FROM emp WHERE sal*12+NVL(comm, 0) > 30000;

--comm은 null을 포함한 컬럼이므로 상황에 따라 사용한다.
--보너스가 200이하인 사원을 검색한다.
SELECT eno 사번, ename 이름, comm 보너스 FROM emp WHERE comm <= 200;

SELECT eno 사번, ename 이름, NVL(comm, 0) 보너스 FROM emp WHERE NVL(comm, 0) <= 200;

--입사일이 1996년 이후인 사원의 정보를 검색한다.
--hdate의 기본 날짜 포맷이 YY/MM/DD로 되어있으므로
--보여지는 것과 조건이 다르게 보이지만
--내부적으로는 잘 계산해준다.

SELECT * FROM emp WHERE hdate > '1995/12/31';

--년도가 4자리로 변경되어 표시된다.
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD';

--null값과 비교연산
SELECT * FROM emp WHERE comm IS NULL;
SELECT * FROM emp WHERE comm IS NOT NULL;