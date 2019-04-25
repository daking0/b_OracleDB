--1. '__교수는 __학과 소속입니다' 형태로 교수의 정보를 출력한다
SELECT * FROM professor;
SELECT pname||' 교수는 '|| section || '학과 소속입니다.' 교수정보 FROM professor;

--2. 학교에는 어떤 학과가 있는지 검색한다(학생 테이블 기반으로 검색한다)
SELECT * FROM student;
SELECT DISTINCT major 전공 FROM student; 

--3. 학교에는 어떤 학과가 있는지 검색한다(교수 테이블 기반으로 검색한다)
SELECT * FROM professor;
SELECT DISTINCT section FROM professor;

--4. 교수의 지위는 어떤 것들이 있는지 검색한다.
SELECT DISTINCT orders FROM professor;

--5. 학년별 성적순으로 학생의 정보를 검색한다
SELECT * FROM student ORDER BY avr DESC;

--6. 학과별 학년별로 학생의 정보를 성적순으로 검색한다
SELECT * FROM student ORDER BY syear, major, avr DESC;

--7. 학점순으로 과목 이름을 검색한다
SELECT cname 과목, st_num 학점 FROM course ORDER BY st_num DESC;

--8. 각 학과별로 교수의 정보를 검색한다
SELECT * FROM tab;
SELECT * FROM professor ORDER BY section;

--9. 지위별로 교수의 정보를 검색한다
SELECT * FROM professor ORDER BY orders;

--10. 각 학과별로 교수의 정보를 부임일자 순으로 검색한다.
SELECT * FROM professor ORDER BY section, hiredate;

--11. 관우 학생의 평점을 검색한다
SELECT sname 이름, avr 평점 FROM student WHERE sname = '관우';

--12. 정교수의 명단을 검색한다
SELECT * FROM professor WHERE orders ='정교수' ORDER BY section;

--13. 화학과 소속 교수의 명단을 검색한다
SELECT * FROM professor WHERE section = '화학' ORDER BY hiredate;

--14. 송강 교수의 정보를 검색한다
SELECT * FROM professor WHERE pname = '송강';

--15. 학년별로 화학과 학생의 성적을 검색한다
SELECT sname 이름, syear 학년,major 전공, avr 성적 
FROM student 
WHERE major = '화학' 
ORDER BY syear, avr DESC;

--16. 2000년 이전에 부임한 교수의 정보를 부임일순으로 검색한다
SELECT * FROM professor;
ALTER SESSION SET nls_date_format = 'YY/MM/dd';
SELECT * FROM professor WHERE hiredate < '00/01/01' ORDER BY hiredate;

ALTER SESSION SET nls_date_format = 'YYYY/MM/DD';
SELECT * FROM professor WHERE hiredate < '2000/01/01' ORDER BY hiredate;

--17. 담당 교수가 없는 과목의 정보를 검색한다.
SELECT * FROM course;
SELECT * FROM course WHERE pno IS NULL;

--18. 화학과와 물리학과 학생을 검색한다
SELECT * FROM student WHERE major = '화학' OR major = '물리' ORDER BY major, avr DESC;

--19. 화학과가 아닌 학생 중에 1학년 학생을 검색한다
SELECT * FROM student WHERE NOT (major = '화학') AND syear = '1' ORDER BY major;

--20. 화학과 3학년 학생을 검색한다
SELECT * FROM student WHERE major = '화학' AND syear = '3' ORDER BY avr DESC;

--21. 평점이 2.0에서 3.0 사이인 학생을 검색한다.
SELECT * FROM student WHERE avr>2.0 AND avr < 3.0 ORDER BY avr DESC;
