--6¹ø
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