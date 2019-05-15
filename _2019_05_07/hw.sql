--1번
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

--2번 & 4번
CREATE TABLE student(
  sno VARCHAR2(8),
  sname VARCHAR2(10),
  syear NUMBER,
  sex VARCHAR2(3)
  major VARCHAR2(10),
  avr NUMBER(4,2)
  CONSTRAINT student_pk_sno PRIMARY KEY(sno)
  CONSTRAINT student_ch_sex CHECK(sex In ('남','여'))
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

--3번
CREATE TABLE 판매전표(
  전표번호 VARCHAR2(12),
  판매일자 DATE CONSTRAINT sale_ch_date NOT NULL,
  고객명  VARCHAR2(50) CONSTRAINT sale_ch_cname NOT NULL,
  총액 NUMBER
  CONSTRAINT sale_ch_total CHECK(총액 >= 0)
);

CREATE TABLE 전표상세(
  전표번호 VARCHAR2(12),
  제품번호 VARCHAR2(12),
  수량 NUMBER CONSTRAINT sale_ch_qty NOT NULL,
  단가 NUMBER CONSTRAINT sale_ch_price NOT NULL,
  금액 NUMBER CONSTRAINT sale_ch_amount NOT NULL,
  CONSTRAINT detail_pk_sale PRIMARY KEY(전표번호),
  CONSTRAINT detail_pk_product PRIMARY KEY(제품번호),
  CONSTRAINT detail_ch_amount CHECK(총액 > 0)
);

CREATE TABLE 제품(
  제품번호 VARCHAR2(12),
  제품명 VARCHAR2(100),
  제품단가 NUMBER,
  CONSTRAINT product_uk_pname UNIQUE(제품명)
)
