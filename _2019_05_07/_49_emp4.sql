DROP TABLE emp4;

CREATE TABLE emp4(
  eno VARCHAR2(4),
  ename VARCHAR2(50) CONSTRAINT emp4_nu_ename NOT NULL,
  gno VARCHAR2(13),
  sex VARCHAR2(3),
  CONSTRAINT emp4_pk_eno PRIMARY KEY(eno),
  CONSTRAINT emp4_uk_gno UNIQUE(gno),
  CONSTRAINT emp4_ch_gno CHECK(LENGTH(gno)=13),
  CONSTRAINT emp4_ch_sex CHECK(sex In ('남','여'))
);

SELECT c.table_name, c.constraint_name,
       c.constraint_type, s.column_name
FROM user_constraints c, user_cons_columns s
WHERE c.constraint_name = s.constraint_name
AND c.table_name = 'EMP4'
ORDER BY c.table_name;

SELECT constraint_name, search_condition
 FROM user_constraints
 WHERE table_name ='EMP4';
 
INSERT INTO emp4 (eno,ename,gno,sex)
VALUES ('1001', '아이유', '0011222154125', '여');

--null 못들어가니까 오류
INSERT INTO emp4 (eno,ename,gno,sex)
VALUES ('1001', NULL , '0011222154125', '여');

--숫자 length
INSERT INTO emp4 (eno,ename,gno,sex)
VALUES ('1002', '건담' , '00222154126', '남');

--남/여 만 가능
INSERT INTO emp4 (eno,ename,gno,sex)
VALUES ('1002', '건담성우' , '0011222154126', 'M');