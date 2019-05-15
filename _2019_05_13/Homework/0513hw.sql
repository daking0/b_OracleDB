-- 1번
DROP TABLE 판매전표;
COMMIT;

CREATE TABLE sales_slip ( --판매전표
  ssno VARCHAR2(12),
  sdate DATE, 
  cname VARCHAR2(50),
  total NUMBER
);

CREATE TABLE slip_detail (--전표상세
  ssno VARCHAR2(12),
  pno VARCHAR2(12),
  amount NUMBER,
  price NUMBER,
  product_sum NUMBER
);

CREATE TABLE product ( --제품
  pno VARCHAR2(12),
  pname VARCHAR2(100),
  pprice NUMBER
);

ALTER TABLE sales_slip ADD CONSTRAINT sales_slip_pk_ssno PRIMARY KEY(ssno);
ALTER TABLE sales_slip MODIFY sdate CONSTRAINT sales_slip_not_null_sdate NOT NULL;
ALTER TABLE sales_slip MODIFY cname CONSTRAINT sales_slip_not_null_cname NOT NULL;
ALTER TABLE sales_slip ADD CONSTRAINT sales_slip_check_total CHECK(total > 0);

ALTER TABLE slip_detail ADD CONSTRAINT slip_detail_pk_sdno_pno PRIMARY KEY(ssno, pno);
ALTER TABLE slip_detail ADD CONSTRAINT slip_detail_fk_ssno FOREIGN KEY(ssno) REFERENCES sales_slip(ssno);
ALTER TABLE slip_detail ADD CONSTRAINT slip_detail_fk_pno FOREIGN KEY(pno) REFERENCES product(pno);
ALTER TABLE slip_detail MODIFY amount CONSTRAINT sales_detail_not_null_amount NOT NULL;
ALTER TABLE slip_detail MODIFY price CONSTRAINT sales_detail_not_null_price NOT NULL;
ALTER TABLE slip_detail MODIFY product_sum CONSTRAINT sales_detail_not_null_product_sum NOT NULL;
ALTER TABLE slip_detail ADD CONSTRAINT sales_detail_check_product_sum CHECK(product_sum > 0);

ALTER TABLE product ADD CONSTRAINT product_pk_pno PRIMARY KEY(pno);
ALTER TABLE product ADD CONSTRAINT product_uk_pname UNIQUE KEY(pname);
ALTER TABLE product ADD CONSTRAINT product_check_pprice CHECK(pprice > 0);


--2번
CREATE TABLE depthw ( 
  dno VARCHAR2(2),
  dname VARCHAR2(14), 
  loc VARCHAR2(8),
  director VARCHAR2(4)
); 

CREATE TABLE emphw ( 
  eno VARCHAR2(4),
  ename VARCHAR2(10),
  mgr VARCHAR2(4),
  job VARCHAR2(6),
  hdate DATE,
  sal NUMBER,
  comm NUMBER,
  dno VARCHAR2(2)
); 

ALTER TABLE depthw ADD CONSTRAINT dept_pk__dno PRIMARY KEY(dno);
ALTER TABLE depthw ADD CONSTRAINT dept_fk_eno FOREIGN KEY(director) REFERENCES emphw(eno);

ALTER TABLE emphw ADD CONSTRAINT emp_pk__eno PRIMARY KEY(eno);
ALTER TABLE emphw MODIFY sal CONSTRAINT emphw_not_null_sal NOT NULL;
ALTER TABLE emphw MODIFY comm CONSTRAINT emphw_not_null_comm NOT NULL;

ALTER TABLE emphw ADD CONSTRAINT emp_fk_mgr FOREIGN KEY(mgr) REFERENCES emphw(eno);
ALTER TABLE emphw ADD CONSTRAINT emp_fk_dno FOREIGN KEY(dno) REFERENCES depthw(dno);

--3번
DROP TABLE studentlist;

CREATE TABLE prof
AS (
    SELECT p.pno, p.pname, c.cname, c.st_num 
    FROM professor p , course c
    WHERE p.pno = c.pno
);
DROP TABLE studentlist;
CREATE TABLE studentlist
AS (
    SELECT s.sno, s.sname, s.major, sc.result 
    FROM student s , score sc
    WHERE s.sno = sc.sno
    GROUP BY s.sno, s.sname, s.major, sc.result 
);

CREATE TABLE scorelist
AS (
    SELECT s.sno, c.cname, s.result , AVG(result) 평균
    FROM score s , course c
    WHERE s.cno = c.cno
    GROUP BY s.sno, c.cname, s.result
);


CREATE TABLE chemistry
AS (SELECT d.sno, d.sname, s.result
    FROM studentlist d , scorelist s 
    WHERE d.sno = s.sno
    AND major = '화학'
    );

ALTER TABLE prof ADD CONSTRAINT prof_pk__pno PRIMARY KEY(pno);
ALTER TABLE studentlist ADD CONSTRAINT student_pk__dno PRIMARY KEY(sno);

ALTER TABLE scorelist ADD CONSTRAINT score_fk_sno FOREIGN KEY(sno) REFERENCES studentlist(sno);

--4번
DROP TABLE studentcourse;
CREATE TABLE studentcourse
AS(
   SELECT sno, sname, syear, major, cname
   FROM student
   JOIN score USING (sno)
   JOIN course USING (cno)
   GROUP BY sno, sname, syear, major, cname
);

CREATE TABLE majorscore
AS(
   SELECT cname,  AVG(result) 평균
   FROM score 
   JOIN course USING (cno)
   GROUP BY cname
   HAVING AVG(result)  >= 60
);

CREATE TABLE profstudent
AS(
   SELECT pno, pname, cname, sno, sname
   FROM professor 
   JOIN course USING(pno) 
   JOIN score USING(cno) 
   JOIN student USING(sno)
   GROUP BY pno, pname, cname, sno, sname
);

--5번
CREATE TABLE sales_slip ( --판매전표
  ssno VARCHAR2(12),
  sdate DATE, 
  cname VARCHAR2(50),
  total NUMBER
);

CREATE TABLE slip_detail (--전표상세
  ssno VARCHAR2(12),
  pno VARCHAR2(12),
  amount NUMBER,
  price NUMBER,
  product_sum NUMBER
);

CREATE TABLE product ( --제품
  pno VARCHAR2(12),
  pname VARCHAR2(100),
  pprice NUMBER
);

ALTER TABLE sales_slip ADD CONSTRAINT sales_slip_pk_ssno PRIMARY KEY(ssno);
ALTER TABLE sales_slip MODIFY sdate CONSTRAINT sales_slip_not_null_sdate NOT NULL;
ALTER TABLE sales_slip MODIFY cname CONSTRAINT sales_slip_not_null_cname NOT NULL;
ALTER TABLE sales_slip ADD CONSTRAINT sales_slip_check_total CHECK(total > 0);

ALTER TABLE slip_detail ADD CONSTRAINT slip_detail_pk_sdno_pno PRIMARY KEY(ssno, pno);
ALTER TABLE slip_detail ADD CONSTRAINT slip_detail_fk_ssno FOREIGN KEY(ssno) REFERENCES sales_slip(ssno);
ALTER TABLE slip_detail ADD CONSTRAINT slip_detail_fk_pno FOREIGN KEY(pno) REFERENCES product(pno);
ALTER TABLE slip_detail MODIFY amount CONSTRAINT sales_detail_not_null_amount NOT NULL;
ALTER TABLE slip_detail MODIFY price CONSTRAINT sales_detail_not_null_price NOT NULL;
ALTER TABLE slip_detail MODIFY product_sum CONSTRAINT sales_detail_not_null_product_sum NOT NULL;
ALTER TABLE slip_detail ADD CONSTRAINT sales_detail_check_product_sum CHECK(product_sum > 0);

ALTER TABLE product ADD CONSTRAINT product_pk_pno PRIMARY KEY(pno);
ALTER TABLE product ADD CONSTRAINT product_uk_pname UNIQUE KEY(pname);
ALTER TABLE product ADD CONSTRAINT product_check_pprice CHECK(pprice > 0);
DROP INDEX slip_sdate;

CREATE INDEX slip_sdate
ON sales_slip(sdate);

SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name = 'SALES_SLIP';

--SELECT index_name
--FROM user_ind_expressions
--WHERE index_name = 'SLIP_SDATE';

--SELECT INDEX_NAME FROM user_indexes;

--6번
CREATE TABLE depthw ( 
  dno VARCHAR2(2),
  dname VARCHAR2(14), 
  loc VARCHAR2(8),
  director VARCHAR2(4)
); 

CREATE TABLE emphw ( 
  eno VARCHAR2(4),
  ename VARCHAR2(10),
  mgr VARCHAR2(4),
  job VARCHAR2(6),
  hdate DATE,
  sal NUMBER,
  comm NUMBER,
  dno VARCHAR2(2)
); 

ALTER TABLE depthw ADD CONSTRAINT dept_pk__dno PRIMARY KEY(dno);
ALTER TABLE depthw ADD CONSTRAINT dept_fk_eno FOREIGN KEY(director) REFERENCES emphw(eno);

ALTER TABLE emphw ADD CONSTRAINT emp_pk__eno PRIMARY KEY(eno);
ALTER TABLE emphw MODIFY sal CONSTRAINT emphw_not_null_sal NOT NULL;
ALTER TABLE emphw MODIFY comm CONSTRAINT emphw_not_null_comm NOT NULL;

ALTER TABLE emphw ADD CONSTRAINT emp_fk_mgr FOREIGN KEY(mgr) REFERENCES emphw(eno);
ALTER TABLE emphw ADD CONSTRAINT emp_fk_dno FOREIGN KEY(dno) REFERENCES depthw(dno);

CREATE INDEX emp_sal
ON emphw(sal*12 +NVL(comm,0));



SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
FROM user_indexes i, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name = 'EMP_SAL';


SELECT index_name, column_expression
FROM user_ind_expressions;
WHERE index_name = 'EMP_SAL';

--
--SELECT c.index_name, c.column_name, c.column_position, i.uniqueness
--FROM user_indexes i, user_ind_columns c
--WHERE c.index_name = i.index_name;