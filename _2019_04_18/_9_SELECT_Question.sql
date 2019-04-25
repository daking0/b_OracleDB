--1. '_학과인_학생의 현재 평점은 _입니다.' 형태로 학생의 정보를 출력하세요.
SELECT major||'학과인 '||sname||' 학생의 현재 평점은 ' ||avr ||' 입니다.' 학생정보 FROM student; 

--2. '_과목은 _학점 과목입니다.' 형태로 과목의 정보를 출력하세요.
SELECT * FROM course;
SELECT cname||' 과목은 '|| st_num ||'학점 과목입니다.' 과목정보 FROM course;

--3. 성적순으로 학생의 이름을 검색하세요.
SELECT sname 이름, avr 학점, major 학과 FROM student ORDER BY avr DESC;

--4. 학과별 성적순으로 학생의 정보를 검색하세요.
SELECT * FROM student;
SELECT sname 이름, major 전공, avr 학점 FROM student ORDER BY major, avr DESC;


--5.화학과 학생을 검색하세요.
SELECT * FROM student WHERE major='화학';

--6. 평점이 2.0 미만인 학생을 검색하세요.
SELECT * FROM student WHERE avr<2.0;