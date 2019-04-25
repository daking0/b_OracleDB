--문자 함수를 이용해서 해결하세요
1. 이름이 2 글자인 학생의 이름을 검색한다
SELECT sno 학생번호, sname 이름
FROM student
WHERE length(sname) =2;

2. '공'씨 성을 가진 학생의 이름을 검색한다
SELECT sno 학생번호, sname 이름
FROM student
WHERE SUBSTR(sname, 1, 1) = '공';
--WHERE sname LIKE '공%';

3. 교수의 지위를 한글자로 검색한다(EX 조교수 ->조)
SELECT pno 교수번호, pname 교수이름, orders 지위
FROM professor
WHERE  SUBSTR(orders, 1, 1)='조'; 

SELECT pname 교수명, SUBSTR(orders, 1, 1) 지위
FROM professor;

4. 일반 과목을 기초 과목으로 변경해서 모든 과목을 검색한다. (EX - 일반화학 -> 기초화학)
SELECT REPLACE(cname,'일반','기초') 과목명
FROM course; 
--WHERE cname LIKE ('%일반%');

5. 만일 입력 실수로 STUDENT테이블의 SNAME컬럼에 데이터가 입력될 때 문자열 마지막에 공백이 추가되었다면
   검색할 때 이를 제외하고 검색하는 SELECT문을 작성한다.
SELECT sno, SUBSTR(sname,1,LENGTH(sname)-1) sname, sex, syear, major, avr
FROM student;

--숫자,날짜 함수를 이용한다
1. 교수들이 부임한 달에 근무한 일수는 몇일인지 검색한다.
SELECT pname 교수명,hiredate 부임한날,LAST_DAY(TRUNC(hiredate))-TRUNC(hiredate)+1 DAY 
FROM professor;

2. 교수들의 오늘까지 근무한 주가 몇 주인지 검색한다.
SELECT pname "교수 이름", pno 교수번호, hiredate 고용일, TRUNC(sysdate,'DD')-TRUNC(hiredate,'DD')-1 근무일,
 ROUND((TRUNC(sysdate,'DD')-TRUNC(hiredate,'DD')-1)/7)근무주
FROM professor;

3. 1991년에서 1995년까지 사이에 부임한 교수를 검색한다.
SELECT pname 교수명, hiredate 부임날짜
FROM professor
WHERE 1995>=TO_CHAR(hiredate,'YYYY') AND TO_CHAR(hiredate,'YYYY')>=1991;

--WHERE hiredate BETWEEN '1991/01/01' AND '1995/12/31';

4. 학생들의 4.5환산 평점을 검색한다(소수점 둘째자리까지)
SELECT sno, sname,sex, syear, major,  TRUNC(avr*1.125,2)변환평점
FROM student
ORDER BY avr DESC;

--변화함수를 이용한다.
1. 학생의 평균 평점을 다음 형식에 따라 소수점 이하 2자리까지 검색한다.
   OOO학생의 평균 평점은 O.OO입니다.
SELECT sname||' 학생의 평균 평점은 '||TO_CHAR(TRUNC(avr,2),'0.99')||'입니다.'
FROM student;
   
2. 교수의 부임일을 다음 형식으로 검색한다.
   OOO교수의 부임일은 YYYY년 MM월 DD일입니다
SELECT pname||'교수의 부임일은 '||TO_CHAR(hiredate,'YYYY"년"MM"월"DD"일 입니다"')
FROM professor;
  
3. 교수 중에 3월에 부임한 교수의 명단을 검색한다.
SELECT pname 교수명, hiredate 부임날짜, TO_CHAR(hiredate,'MM"월"') "3월부임"
FROM professor
WHERE TO_CHAR(hiredate,'MM') =3;