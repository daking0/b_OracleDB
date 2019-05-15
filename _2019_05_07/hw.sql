--1��
CREATE TABLE goods(
  gno NUMBER,
  gname VARCHAR2(50),
  pri NUMBER,
  fac_no NUMBER
  CONSTRAINT goods_pk_gno PRIMARY KEY(gno)
);

CREATE TABLE factory(
  fno NUMBER,
  fname VARCHAR2(200),
  CONSTRAINT factory_pk_fno PRIMARY KEY(fno),
);

CREATE TABLE prod(
  s_num NUMBER,
  gno NUMBER,
  pri NUMBER,
  date DATE,
  CONSTRAINT prod_pk_s_num PRIMARY KEY(s_num),
  CONSTRAINT prod_fk_gno FOREIGN KEY(gno)
  REFERENCES goods(gno)
);

--2�� & 4��
CREATE TABLE student(
  sno VARCHAR2(8),
  sname VARCHAR2(10),
  syear NUMBER,
  sex VARCHAR2(3)
  major VARCHAR2(10),
  avr NUMBER(4,2)
  CONSTRAINT student_pk_sno PRIMARY KEY(sno)
  CONSTRAINT student_ch_sex CHECK(sex In ('��','��'))
  CONSTRAINT student_ch_avr CHECK(avr <= 4.50)
);

CREATE TABLE professor(
  pno VARCHAR2(8),
  pname VARCHAR2(10),
  section VARCHAR2(20),
  orders VARCHAR2(10),
  hiredate DATE CONSTRAINT prof_ch_hiredate NOT NULL
  CONSTRAINT prof_pk_pno PRIMARY KEY(pno)
);

CREATE TABLE course(
  cno VARCHAR2(8),
  cname VARCHAR2(14) CONSTRAINT course_ch_cname NOT NULL,
  st_num NUMBER,
  pno VARCHAR2(8),
  CONSTRAINT course_pk_cno PRIMARY KEY(cno),
  CONSTRAINT course_fk_pno FOREIGN KEY(pno)
  REFERENCES professor(pno)
);

CREATE TABLE score(
  sno VARCHAR2(8),
  cno VARCHAR2(8),
  result NUMBER CONSTRAINT score_ch_result NOT NULL,
  CONSTRAINT score_pk_sno PRIMARY KEY(sno) REFERENCES student(sno),
  CONSTRAINT score_pk_cno PRIMARY KEY(cno) REFERENCES student(cno),
  CONSTRAINT student_ch_avr CHECK(result >= 0 && result <= 100)
);

--3��
CREATE TABLE �Ǹ���ǥ(
  ��ǥ��ȣ VARCHAR2(12),
  �Ǹ����� DATE CONSTRAINT sale_ch_date NOT NULL,
  ����  VARCHAR2(50) CONSTRAINT sale_ch_cname NOT NULL,
  �Ѿ� NUMBER
  CONSTRAINT sale_ch_total CHECK(�Ѿ� >= 0)
);

CREATE TABLE ��ǥ��(
  ��ǥ��ȣ VARCHAR2(12),
  ��ǰ��ȣ VARCHAR2(12),
  ���� NUMBER CONSTRAINT sale_ch_qty NOT NULL,
  �ܰ� NUMBER CONSTRAINT sale_ch_price NOT NULL,
  �ݾ� NUMBER CONSTRAINT sale_ch_amount NOT NULL,
  CONSTRAINT detail_pk_sale PRIMARY KEY(��ǥ��ȣ),
  CONSTRAINT detail_pk_product PRIMARY KEY(��ǰ��ȣ),
  CONSTRAINT detail_ch_amount CHECK(�Ѿ� > 0)
);

CREATE TABLE ��ǰ(
  ��ǰ��ȣ VARCHAR2(12),
  ��ǰ�� VARCHAR2(100),
  ��ǰ�ܰ� NUMBER,
  CONSTRAINT product_uk_pname UNIQUE(��ǰ��)
)
