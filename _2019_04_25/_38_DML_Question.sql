1. emp 테이블의 모든 행을 삭제 후 임의의 5명의 데이터를 입력하세요
SELECT * FROM emp;
DELETE FROM emp;

ALTER SESSION SET nls_date_format = 'YYYY-MM-DD';
DESC emp;
INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1001','김연아','개발',null,'1991-02-01',4500,520,10);

INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1002','김주란','개발',null,'1992-03-03',4100,330,20);

INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1003','양선호','개발',null,'1995-02-01',4300,null,30);

INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1004','신호연','개발',null,'1992-09-05',4210,100,40);

SELECT * FROM emp;
COMMIT;

2. 모든 학생의 성적을 4.5만점 기준으로 수정하세요
SELECT * FROM student;

UPDATE student 
SET avr = avr *1.125;

3. 모든 교수의 부임일자를 100일 앞으로 수정하세요
SELECT * FROM professor;

UPDATE professor
SET hiredate = hiredate - 100;

4. 화학과 2학년 학생의 정보를 삭제하세요

5. 조교수의 정보를 삭제하세요

6. 일반화학 과목을 수강하는 학생의 성적을 4.5만점 기준으로 수정
UPDATE student 
SET avr = avr *1.125
WHERE avr IN (SELECT avr
              FROM student
              JOIN score USING (sno)
              JOIN course USING (cno)
              WHERE cname = '일반화학');

7. 화학과 교수의 과목 중에 학점이 3학점 미만인 과목을 모두 3학점으로 수정한 다음 확인 출력하세요
UPDATE course   
SET st_num = 3
WHERE cno IN (SELECT cno
             FROM course 
             JOIN professor USING (pno)
             WHERE section = '화학'
             AND st_num < 3
             );

ROLLBACK;

8. 학생의 기말고사 성적을 모두 st_score 테이블에 저장하세요
SELECT * FROM st_score;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM score;


INSERT /*+ APPEND */ INTO st_score 
NOLOGGING (sno, sname, major, syear, cno, cname, result)
SELECT s.sno, s.sname, s.major, s.syear, co.cno, cname, result
FROM student s, score sc, courses co
WHERE s.sno = sc.sno
AND sc.cno = co.cno;

COMMIT;

