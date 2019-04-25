-- 그룹함수와 GROUP BY절을 이용하세요 --
1. 3학년 학생의 학과별 평점 평균과 분산 및 편차를 검색하세요
SELECT major 학과, AVG(avr) 평점평균, ROUND(VARIANCE(avr),3) 분산,ROUND(STDDEV(avr),3)편차
FROM student
WHERE syear =3
GROUP BY major;

2. 물리학과 학년별 평균 평점을 검색하세요
SELECT syear 학년, AVG(avr) 평균평점
FROM student
WHERE major = '물리'
GROUP BY syear;

3. 각 학생별 기말고사 평균을 검색하세요
SELECT sno 학생번호, sname 학생명, ROUND(AVG(result),2) 기말고사
FROM student
NATURAL JOIN score
GROUP BY sno, sname;

4. 각 학과별 학생 수를 검색하세요
SELECT major 학과명, COUNT(sname) 학생수
FROM student
GROUP BY major;

5. 화학과와 생물학과 학생 4.5환산 평점의 평균을 각각 검색하세요
SELECT major 전공, ROUND(AVG(avr*1.125),3) 평점평균
FROM student
WHERE major IN('화학','생물')
GROUP BY major;

6. 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수)교수의 수를 검색하세요
SELECT orders 직위, COUNT(pname) 교수의수
FROM professor
WHERE TO_CHAR(sysdate,'YYYY')-TO_CHAR(hiredate,'YYYY') >=10
GROUP BY orders;
--WHERE (sysdate - hiredate) / 365 >= 10

7. 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT SUM(st_num) 총합
FROM course
WHERE  INSTR(cname,'화학')!= 0;
--WHERE cname LIKE '%화학%';

8. 생물학과 학생들의 기말고사 성적을 성적순으로 검색하세요
SELECT sname 학생명,cname 과목명, result 성적, ROUND(AVG(result)) 전과목평균
FROM student
NATURAL JOIN score
NATURAL JOIN course
WHERE major = '생물'
ORDER BY result;

SELECT st.sno 학번, sname 학생명, ROUND(AVG(result), 2) 전과목평균
FROM student st, score sc 
WHERE st.sno=sc.sno AND major='생물' 
GROUP BY st.sno, sc.sno, sname 
ORDER BY 전과목평균 DESC;

9. 학과별 기말고사 평균을 성적순으로 검색하세요
SELECT major 학과, ROUND(AVG(result),3) 평균
FROM student
JOIN score USING(sno)
GROUP BY major
ORDER BY ROUND(AVG(result),3) DESC;

-- HAVING절을 이용하세요 --
1. 물리학과를 제외하고 학생들의 평점 평균을 검색하세요
SELECT major 학과,ROUND(AVG(avr),3) 평점평균
FROM student
GROUP BY major
HAVING major != '물리';

2. 생물학과를 제외한 각 학과별 평균 평점중에 평점이 2.0이상인 정보를 검색하세요
SELECT major 학과,ROUND(AVG(avr),3) 평점평균
FROM student 
GROUP BY major
HAVING AVG(avr) >= 2.0
AND major != '생물';

3. 기말고사 평균이 60점이상인 학생의 정보를 검색하세요(학번과 기말고사 평균)
SELECT sno 학번, AVG(result) 기말고사평균
FROM score
JOIN student USING(sno)
GROUP BY sno
HAVING AVG(result) >= 60;

4. 강의 학점수가 3학점 이상인 교수의 정보를 검색하세요(교수번호, 이름과 담당 학점수)
SELECT pno 교수번호, pname 교수이름, st_num 학점수
FROM course
JOIN professor USING (pno)
GROUP BY pno, pname, st_num
HAVING st_num >= 3
ORDER BY pno;