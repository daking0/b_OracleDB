DROP TABLE ��ǥ��;
DROP TABLE ��ǰ;
DROP TABLE �Ǹ���ǥ;

CREATE TABLE �Ǹ���ǥ(
  ��ǥ��ȣ VARCHAR2(12),
  �Ǹ����� DATE,
  ���� VARCHAR2(50),
  �Ѿ� NUMBER
);
ALTER TABLE �Ǹ���ǥ
ADD CONSTRAINT �Ǹ���ǥ_pk_��ǥ��ȣ PRIMARY KEY(��ǥ��ȣ);
ALTER TABLE �Ǹ���ǥ
MODIFY �Ǹ����� CONSTRAINT �Ǹ���ǥ_nu_�Ǹ����� NOT NULL;
ALTER TABLE �Ǹ���ǥ
MODIFY ���� CONSTRAINT �Ǹ���ǥ_nu_���� NOT NULL;
ALTER TABLE �Ǹ���ǥ
ADD CONSTRAINT �Ǹ���ǥ_�Ѿ� CHECK(�Ѿ�>0);

CREATE TABLE ��ǰ(
  ��ǰ��ȣ VARCHAR2(12),
  ��ǰ�� VARCHAR2(100),
  ��ǰ�ܰ� NUMBER
);
ALTER TABLE ��ǰ
ADD CONSTRAINT ��ǰ_pk_��ǰ��ȣ PRIMARY KEY(��ǰ��ȣ);
ALTER TABLE ��ǰ
ADD CONSTRAINT ��ǰ_uk_��ǰ�� UNIQUE(��ǰ��);
ALTER TABLE ��ǰ
ADD CONSTRAINT ��ǰ_��ǰ�ܰ� CHECK (��ǰ�ܰ�>0);

CREATE TABLE ��ǥ��(
  ��ǥ��ȣ VARCHAR2(12),
  ��ǰ��ȣ VARCHAR2(12),
  ���� NUMBER,
  �ܰ� NUMBER,
  �ݾ� NUMBER  
);

ALTER TABLE ��ǥ��
ADD CONSTRAINT ��ǥ��_fk_��ǥ��ȣ FOREIGN KEY(��ǥ��ȣ) REFERENCES �Ǹ���ǥ(��ǥ��ȣ);
ALTER TABLE ��ǥ��
ADD CONSTRAINT ��ǥ��_fk_��ǰ��ȣ FOREIGN KEY(��ǰ��ȣ) REFERENCES ��ǰ(��ǰ��ȣ);
ALTER TABLE ��ǥ��
MODIFY ���� CONSTRAINT ��ǥ��_nu_���� NOT NULL;
ALTER TABLE ��ǥ��
MODIFY �ܰ� CONSTRAINT ��ǥ��_nu_�ܰ� NOT NULL;
ALTER TABLE ��ǥ��
ADD CONSTRAINT ��ǥ��_�ݾ� CHECK(�ݾ�>0);
--ALTER TABLE ��ǥ��
--DROP CONSTRAINT ��ǥ��_����;

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
    AND major='ȭ��'
);
CREATE TABLE chemi_result2(major,sname,result,cname)
AS(SELECT major,sname,result,cname
   FROM chemi_result
   WHERE 1=2 --�� ���̺� ����ڴٴ� ��.
);
INSERT INTO chemi_result2
SELECT major,sname,result,cname
FROM chemi_result
ORDER BY cname;
SELECT *
FROM chemi_result2;


--3-2;
CREATE TABLE result_avr
AS (SELECT ROUND(AVG(sc.result)) ���, s.major, s.sname, c.cname
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
AS (SELECT c.cname, ROUND(AVG(sc.result)) ���
    FROM score sc , course c
    WHERE sc.cno = c.cno
    AND 1=2
    GROUP BY c.cname
    HAVING ROUND(AVG(sc.result))>=60
);
INSERT INTO avg_sixty
SELECT c.cname, ROUND(AVG(sc.result)) ���
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
CREATE TABLE �Ǹ���ǥ2(
  ��ǥ��ȣ VARCHAR2(12),
  �Ǹ����� DATE,
  ���� VARCHAR2(50),
  �Ѿ� NUMBER
);

ALTER TABLE �Ǹ���ǥ2
ADD CONSTRAINT �Ǹ���ǥ2_pk_��ǥ��ȣ PRIMARY KEY(��ǥ��ȣ);
ALTER TABLE �Ǹ���ǥ2
MODIFY �Ǹ����� CONSTRAINT �Ǹ���ǥ2_nu_�Ǹ����� NOT NULL;
ALTER TABLE �Ǹ���ǥ2
MODIFY ���� CONSTRAINT �Ǹ���ǥ2_nu_���� NOT NULL;
ALTER TABLE �Ǹ���ǥ2
ADD CONSTRAINT �Ǹ���ǥ2_�Ѿ� CHECK(�Ѿ�>0);

CREATE TABLE ��ǰ2(
  ��ǰ��ȣ VARCHAR2(12),
  ��ǰ�� VARCHAR2(100),
  ��ǰ�ܰ� NUMBER
);
ALTER TABLE ��ǰ2
ADD CONSTRAINT ��ǰ2_pk_��ǰ��ȣ PRIMARY KEY(��ǰ��ȣ);
ALTER TABLE ��ǰ2
ADD CONSTRAINT ��ǰ2_uk_��ǰ�� UNIQUE(��ǰ��);
ALTER TABLE ��ǰ2
ADD CONSTRAINT ��ǰ2_��ǰ�ܰ� CHECK (��ǰ�ܰ�>0);

CREATE TABLE ��ǥ��2(
  ��ǥ��ȣ VARCHAR2(12),
  ��ǰ��ȣ VARCHAR2(12),
  ���� NUMBER,
  �ܰ� NUMBER,
  �ݾ� NUMBER  
);

ALTER TABLE ��ǥ��2
ADD CONSTRAINT ��ǥ��2_pk_��ǥ_��ǰ PRIMARY KEY (��ǥ��ȣ,��ǰ��ȣ);
ALTER TABLE ��ǥ��2
ADD CONSTRAINT ��ǥ��2_fk_��ǥ��ȣ FOREIGN KEY(��ǥ��ȣ) REFERENCES �Ǹ���ǥ(��ǥ��ȣ);
ALTER TABLE ��ǥ��2
ADD CONSTRAINT ��ǥ��2_fk_��ǰ��ȣ FOREIGN KEY(��ǰ��ȣ) REFERENCES ��ǰ(��ǰ��ȣ);
ALTER TABLE ��ǥ��2
MODIFY ���� CONSTRAINT ��ǥ��2_nu_���� NOT NULL;
ALTER TABLE ��ǥ��2
MODIFY �ܰ� CONSTRAINT ��ǥ��2_nu_�ܰ� NOT NULL;
ALTER TABLE ��ǥ��2
ADD CONSTRAINT ��ǥ��2_�ݾ� CHECK(�ݾ�>0);

CREATE INDEX �Ǹ���ǥ_idx_����
ON �Ǹ���ǥ(�Ǹ�����);

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

CREATE INDEX _idx_����
ON �Ǹ���ǥ(�Ǹ�����);

SELECT c.index_name, c.column_name, 
        c.column_position, i.uniqueness
FROM user_indexes I, user_ind_columns c
WHERE c.index_name = i.index_name
AND c.table_name = 'STUDENT';























