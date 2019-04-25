1. 학생 중에 동명이인을 검색하세요
SELECT DISTINCT s1.sno 학번, s1.sname 이름
FROM student s1, student s2
WHERE s1.sname = s2.sname
AND s1.sno != s2.sno;

2. 전체 교수 명단과 교수가 담당하는 과목의 이름을
   학과 순으로 검색하세요
SELECT p.pno 교수번호, p.pname 교수명, c.cname 과목명
FROM professor p, course c
WHERE p.pno = c.pno(+)
ORDER BY p.section;

3. 등록된 모든 과목과 담당 교수를 학점순으로 검색하세요
SELECT c.cname, p.pname
FROM professor p, course c
WHERE c.pno = p.pno(+)
ORDER BY c.st_num;
