DROP TABLE 전표상세;
DROP TABLE 제품;
DROP TABLE 판매전표;

CREATE TABLE 판매전표(
  전표번호 VARCHAR2(12),
  판매일자 DATE,
  고객명 VARCHAR2(50),
  총액 NUMBER
);
ALTER TABLE 판매전표
ADD CONSTRAINT 판매전표_pk_전표번호 PRIMARY KEY(전표번호);
ALTER TABLE 판매전표
MODIFY 판매일자 CONSTRAINT 판매전표_nu_판매일자 NOT NULL;
ALTER TABLE 판매전표
MODIFY 고객명 CONSTRAINT 판매전표_nu_고객명 NOT NULL;
ALTER TABLE 판매전표
ADD CONSTRAINT 판매전표_총액 CHECK(총액>0);

CREATE TABLE 제품(
  제품번호 VARCHAR2(12),
  제품명 VARCHAR2(100),
  제품단가 NUMBER
);
ALTER TABLE 제품
ADD CONSTRAINT 제품_pk_제품번호 PRIMARY KEY(제품번호);
ALTER TABLE 제품
ADD CONSTRAINT 제품_uk_제품명 UNIQUE(제품명);
ALTER TABLE 제품
ADD CONSTRAINT 제품_제품단가 CHECK (제품단가>0);

CREATE TABLE 전표상세(
  전표번호 VARCHAR2(12),
  제품번호 VARCHAR2(12),
  수량 NUMBER,
  단가 NUMBER,
  금액 NUMBER  
);

ALTER TABLE 전표상세
ADD CONSTRAINT 전표상세_fk_전표번호 FOREIGN KEY(전표번호) REFERENCES 판매전표(전표번호);
ALTER TABLE 전표상세
ADD CONSTRAINT 전표상세_fk_제품번호 FOREIGN KEY(제품번호) REFERENCES 제품(제품번호);
ALTER TABLE 전표상세
MODIFY 수량 CONSTRAINT 전표상세_nu_수량 NOT NULL;
ALTER TABLE 전표상세
MODIFY 단가 CONSTRAINT 전표상세_nu_단가 NOT NULL;
ALTER TABLE 전표상세
ADD CONSTRAINT 전표상세_금액 CHECK(금액>0);
--ALTER TABLE 전표상세
--DROP CONSTRAINT 전표상세_수량;

-------------------------------------------------

DROP TABLE dept;
DROP TABLE emp;

CREATE TABLE dept(
  dno VARCHAR2(2),
  dname VARCHAR2(14),
  loc VARCHAR2(8),
  director VARCHAR2(4)
);
ALTER TABLE dept
ADD CONSTRAINT dno_pk_dept PRIMARY KEY(dno);
ALTER TABLE dept
ADD CONSTRAINT director_fk_dept FOREIGN KEY (director) REFERENCES emp(eno);

CREATE TABLE emp(
  eno VARCHAR2(4),
  ename VARCHAR2(10),
  mgr VARCHAR2(4),
  job VARCHAR2(6),
  hdate DATE,
  sal NUMBER,
  comm NUMBER,
  dno VARCHAR2(2)
);

ALTER TABLE emp
ADD CONSTRAINT eno_pk_emp PRIMARY KEY(eno);
ALTER TABLE emp
ADD CONSTRAINT dno_fk_emp FOREIGN KEY(dno) REFERENCES dept(dno);
ALTER TABLE emp
ADD CONSTRAINT emp_sal CHECK(sal>0);
ALTER TABLE emp
MODIFY sal CONSTRAINT emp_nu_sal NOT NULL;
ALTER TABLE emp
ADD CONSTRAINT emp_comm CHECK(comm>0);
ALTER TABLE emp
MODIFY comm CONSTRAINT emp_nu_comm NOT NULL;

--------------------------------------------------------
--3-1
DESC student; --sno , major
DESC score; --sno , cno
DESC course;

CREATE TABLE chemi_result
AS (SELECT major, sname, result, cname
    FROM student s, score sc, course c
    WHERE s.sno = sc.sno
    AND sc.cno = c.cno
    AND major='화학'
);
CREATE TABLE chemi_result2(major,sname,result,cname)
AS(SELECT major,sname,result,cname
   FROM chemi_result
   WHERE 1=2 --빈 테이블 만들겠다는 것.
);
INSERT INTO chemi_result2
SELECT major,sname,result,cname
FROM chemi_result
ORDER BY cname;
SELECT *
FROM chemi_result2;


--3-2;
CREATE TABLE result_avr
AS (SELECT ROUND(AVG(sc.result)) 평균, s.major, s.sname, c.cname
    FROM student s, score sc, course c
    WHERE s.sno = sc.sno
    AND sc.cno = c.cno
    GROUP BY s.major, s.sname, c.cname, sc.result  
);


--3-3;
CREATE TABLE stu_list
AS (SELECT c.cname, s.sname
    FROM student s, course c, score sc
    WHERE s.sno = sc.sno
    AND sc.cno = c.cno
);


--3-4;
SELECT *
FROM course;

CREATE TABLE score_pro
AS (SELECT p.pname, c.st_num
    FROM professor p , course c
    WHERE p.pno = c.pno
);

DROP TABLE score_pro;

--------------------------------------------



--4-1
CREATE TABLE mylist
AS (SELECT s.major, s.sname, s.syear
    FROM student s, score sc, course c
    WHERE s.sno = sc.sno
    AND sc.cno = c.cno
);
CREATE TABLE mylist2(major, sname, syear)
AS (SELECT major, sname, syear
    FROM mylist
    WHERE 1=2
);
INSERT INTO mylist2
SELECT major, sname, syear
FROM mylist
ORDER BY major, syear DESC;



--4-2
CREATE TABLE avg_sixty
AS (SELECT c.cname, ROUND(AVG(sc.result)) 평균
    FROM score sc , course c
    WHERE sc.cno = c.cno
    AND 1=2
    GROUP BY c.cname
    HAVING ROUND(AVG(sc.result))>=60
);
INSERT INTO avg_sixty
SELECT c.cname, ROUND(AVG(sc.result)) 평균
    FROM score sc , course c
    WHERE sc.cno = c.cno
    GROUP BY c.cname
    HAVING ROUND(AVG(sc.result))>=60
    ORDER BY ROUND(AVG(sc.result));



--4-3;
CREATE TABLE pro_list
AS (SELECT p.pname, c.cname, s.sno, s.sname
    FROM professor p, course c, student s,score sc
    WHERE p.pno=c.pno
    AND c.cno=sc.cno
    AND sc.sno = s.sno
    AND 1=2
);
INSERT INTO pro_list
SELECT p.pname, c.cname, s.sno, s.sname
    FROM professor p, course c, student s,score sc
    WHERE p.pno=c.pno
    AND c.cno=sc.cno
    AND sc.sno = s.sno;
DROP TABLE pro_list;


--------------------------------------------------------------

--5
CREATE TABLE 판매전표2(
  전표번호 VARCHAR2(12),
  판매일자 DATE,
  고객명 VARCHAR2(50),
  총액 NUMBER
);

ALTER TABLE 판매전표2
ADD CONSTRAINT 판매전표2_pk_전표번호 PRIMARY KEY(전표번호);
ALTER TABLE 판매전표2
MODIFY 판매일자 CONSTRAINT 판매전표2_nu_판매일자 NOT NULL;
ALTER TABLE 판매전표2
MODIFY 고객명 CONSTRAINT 판매전표2_nu_고객명 NOT NULL;
ALTER TABLE 판매전표2
ADD CONSTRAINT 판매전표2_총액 CHECK(총액>0);

CREATE TABLE 제품2(
  제품번호 VARCHAR2(12),
  제품명 VARCHAR2(100),
  제품단가 NUMBER
);
ALTER TABLE 제품2
ADD CONSTRAINT 제품2_pk_제품번호 PRIMARY KEY(제품번호);
ALTER TABLE 제품2
ADD CONSTRAINT 제품2_uk_제품명 UNIQUE(제품명);
ALTER TABLE 제품2
ADD CONSTRAINT 제품2_제품단가 CHECK (제품단가>0);

CREATE TABLE 전표상세2(
  전표번호 VARCHAR2(12),
  제품번호 VARCHAR2(12),
  수량 NUMBER,
  단가 NUMBER,
  금액 NUMBER  
);

ALTER TABLE 전표상세2
ADD CONSTRAINT 전표상세2_pk_전표_제품 PRIMARY KEY (전표번호,제품번호);
ALTER TABLE 전표상세2
ADD CONSTRAINT 전표상세2_fk_전표번호 FOREIGN KEY(전표번호) REFERENCES 판매전표(전표번호);
ALTER TABLE 전표상세2
ADD CONSTRAINT 전표상세2_fk_제품번호 FOREIGN KEY(제품번호) REFERENCES 제품(제품번호);
ALTER TABLE 전표상세2
MODIFY 수량 CONSTRAINT 전표상세2_nu_수량 NOT NULL;
ALTER TABLE 전표상세2
MODIFY 단가 CONSTRAINT 전표상세2_nu_단가 NOT NULL;
ALTER TABLE 전표상세2
ADD CONSTRAINT 전표상세2_금액 CHECK(금액>0);

CREATE INDEX 판매전표_idx_일자
ON 판매전표(판매일자);

SELECT c.index_name, c.column_name, 
        c.column_position, i.uniqueness
FROM user_indexes I, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name = 'STUDENT';





----------------------------------------------------

--6

CREATE TABLE dept(
  dno VARCHAR2(2),
  dname VARCHAR2(14),
  loc VARCHAR2(8),
  director VARCHAR2(4)
);
ALTER TABLE dept
ADD CONSTRAINT dno_pk_dept PRIMARY KEY(dno);
ALTER TABLE dept
ADD CONSTRAINT director_fk_dept FOREIGN KEY (director) REFERENCES emp(eno);

CREATE TABLE emp(
  eno VARCHAR2(4),
  ename VARCHAR2(10),
  mgr VARCHAR2(4),
  job VARCHAR2(6),
  hdate DATE,
  sal NUMBER,
  comm NUMBER,
  dno VARCHAR2(2)
);

ALTER TABLE emp
ADD CONSTRAINT eno_pk_emp PRIMARY KEY(eno);
ALTER TABLE emp
ADD CONSTRAINT dno_fk_emp FOREIGN KEY(dno) REFERENCES dept(dno);
ALTER TABLE emp
ADD CONSTRAINT emp_sal CHECK(sal>0);
ALTER TABLE emp
ADD CONSTRAINT emp_comm CHECK(comm>0);

CREATE INDEX _idx_일자
ON 판매전표(판매일자);

SELECT c.index_name, c.column_name, 
        c.column_position, i.uniqueness
FROM user_indexes I, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name = 'STUDENT';























