--1)주제 : 숫자 함수
--
--2)함수 종료
--a) ROUND - n자리까지 반올림한다.
--        ROUND(m,n)
--        ROUND(123.4567, 3) -> 123.457
--
--b) TRUNC - n자리 미만을 절삭한다.
--        TRUNC(m,n)
--        TRUNC(123.4567, 3) -> 123.456
--c) MOD - m을 n으로 나눈 나머지 계산한다.
--        MOD(m,n)
--        MOD(10, 4) -> 2
--d) POWER - m의 n승을 계산한다.
--        POWER(m,n)
--        POWER(2,4) -> 16
--e) CEIL - m보다 큰 가장 작은 정수를 찾는다.
--        CEIL(m)
--        CEIL(2.34) -> 3
--f) FLOOR - m보다 작은 가장 큰 정수를 찾는다.
--        FLOOR(m)
--        FLOOR(2.34) -> 2
--g) ABS - m의 절대값을 계산한다
--        ABS(m)
--        ABS(-4) -> 4
--h) SQRT - m의 제곱근을 계산한다
--        SQRT(m)
--        SQRT(9) -> 3
--i) SIGN - m이 음수일 때 -1, 양수일 때 1, 0이면 0을 반환한다
--         SIGN(m)
--         SIGN(-3) -> -1
         
--다양한 숫자 함수를 이용한 결과를 확인한다.  
SELECT ROUND(98.765), TRUNC(98.765), ROUND(98.765,2), TRUNC(98.765,2)
FROM dual;

SELECT MOD(19,3), MOD(-19,3)
FROM dual;

--10번 부서의 연봉을 계산한다. 단 100단위 미만은 절삭한다
SELECT *
FROM dept;

SELECT *
FROM emp;

SELECT eno, ename, dno, TRUNC(sal*12 + NVL(comm,0), -2)
FROM emp
WHERE dno = 10;

--현재 날짜를 검색하고 날짜 출력 양식을 수정하자
SELECT sysdate
FROM dual;

--glogin.sql, login.sql에서 포맷을 설정하면
--연결시 자동으로 포맷을 설정된다.
ALTER SESSION SET nls_date_format ='YYYY/MM/DD:HH24:MI:SS';

--오늘 날짜, 입사 일자, 입사일로부터 오늘까지 기간, 입사일 이후 100일이 지난날 등을 검색하고 날짜 연산의 결과를 살펴본다.
SELECT sysdate 오늘날짜, hdate 입사일자, TRUNC(sysdate-hdate) "입사일-오늘까지 기간", hdate+100 "입사100일경과"
FROM emp
WHERE ename = '김연아';

--날짜 관련 연산
---연산        -결과값  -내용
--------------------------------------
--날짜 + 숫자    날짜    일수 이후 날짜
--날짜 - 숫자    날짜    일수 이전 날짜
--날짜 + 숫자/24 날짜    시간을 더한 날짜
--날짜 - 날짜    숫자    두 날짜 간에 차(일수)
--
--1)주제 : 날짜 함수
--        회계 정산시 많이 사용된다.
--        사용비중이 높은 편
--
--2) 포맷
--YYYY : 년도
--MM : 월
--DD : 날짜
--HH : 시간
--MI : 분
--SS : 초
--
--3) 함수종류
--함수명                         기능
-------------------------------------------------
--ROUND             형식에 맞추어 반올림한 날짜를 반환한다
--                  ROUND(날짜, 형식)
--                  ROUND(sysdate, 'DD') -> 2019/04/23
--
--TRUCN             형식에 맞추어 절삭한 날짜를 반환한다
--                  TRUNC(날짜, 형식)
--                  TRUNC(sysdate, 'YYYY') -> 2019/01/01
--
--MONTHS_BETWEEN    두 날짜간의 기간을 월 수로 계산한다
--                  MONTHS_BETWEEN(날짜1, 날짜2)
--                  MONTHS_BETWEEN('2011/08/01', '2011/07/01') ->1 --1개월이란 의미
--
--ADD_MONTHS        날짜에 n달을 더한 날짜를 계산한다
--                  ADD_MONTHS(날짜, n)
--                  ADD_MONTHS('2011/07/01', 23) ->'2013/06/01'
--                  
--NEXT_DAY          날짜 이후 지정된 요일에 해당하는 날짜 계산
--                  NEXT_DAY(날짜, 요일)
--                  NEXT_DAY('2011/07/14', '일요일') ->2011/07/17
--
--LAST_DAY          날짜를 포함한 달의 마지막 날짜 계산
--                  LAST_DAY(날짜)
--                  LAST_DAY('2011/02/13') ->2011/02/28
                  
--숫자와 날짜를 반올림하거나 잘라내고 출력해본다
SELECT sysdate, ROUND(sysdate, 'YY') 년, ROUND(sysdate, 'MM') 월, ROUND(sysdate, 'DD') 일
FROM dual;

SELECT sysdate, TRUNC(sysdate, 'YY') 년, TRUNC(sysdate, 'MM') 월, TRUNC(sysdate, 'DD') 일
FROM dual;

--김연아가 오늘까지 일한 일수를 검색한다 
--입사일은 근무일수에 안 들어가니까 1을 더함 (마이너스 연산ㅇ르 하면입사일은 근무일수에서 빠지므로 1을 더함)
SELECT TRUNC(sysdate,'DD') - TRUNC(hdate, 'DD')+1 DAY 
FROM emp
WHERE ename = '김연아';

--20번 부서 직원들이 현재까지 근무한 개월 수를 검색한다
SELECT dno, eno, ename,TRUNC(MONTHS_BETWEEN(sysdate, hdate)) 근무개월
FROM emp
WHERE dno = '20';

--20번 부서원들이 입사 100일째 되는 날과 10년째 되는 날을 검색
SELECT dno, eno, ename,hdate, hdate+99 "입사100일경과",  ADD_MONTHS(hdate,120) "입사10년경과"
FROM emp
WHERE dno = '20';

--20번 부서원들이 입사한 이후 첫번재 일요일을 검색한다.
SELECT dno, eno, ename,hdate,NEXT_DAY(hdate, '일요일')Sunday
FROM emp
WHERE dno = '20';

--10번 부서원들의 입사한달의 마지막 날짜와 입사한 달에 근무한 일수를 검색한다.
--(단,입사일은 근무일에서 제외한다)
--(단,주말도 근무일에 포함한다)
SELECT dno, eno, ename,hdate,LAST_DAY(hdate) 마지막날짜 ,LAST_DAY(TRUNC(hdate))-TRUNC(hdate) 근무일수
FROM emp
WHERE dno = '10';
