CREATE TABLE 판매전표 (
전표번호 VARCHAR2(12),
판매일자 DATE,
고객명 VARCHAR2(50),
총액 NUMBER);

ALTER TABLE 판매전표
ADD CONSTRAINT 판매전표_PK PRIMARY KEY(전표번호);

ALTER TABLE 판매전표
ADD CONSTRAINT 판매전표_CH CHECK(총액>0);

ALTER TABLE 판매전표
MODIFY 판매일자 CONSTRAINT 판매전표_nu_일자 NOT NULL;

ALTER TABLE 판매전표
MODIFY 고객명 CONSTRAINT 판매전표_NU_고객 NOT NULL;


CREATE TABLE 제품(
제품번호 VARCHAR2(12),
제품명 VARCHAR2(100),
제품단가 NUMBER);

ALTER TABLE 제품
ADD CONSTRAINT 제품_PK_제품번호 PRIMARY KEY (제품번호);

ALTER TABLE 제품
ADD CONSTRAINT 제품_UK_제품명 UNIQUE (제품명);

ALTER TABLE 제품
ADD CONSTRAINT 제품_CH_제품단가 CHECK(제품단가>0);

CREATE TABLE 전표상세(
전표번호 VARCHAR2(12),
제품번호 VARCHAR2(12),
수량 NUMBER,
단가 NUMBER,
금액 NUMBER);

ALTER TABLE 전표상세
ADD CONSTRAINT 전표상세_FK_전표번호 FOREIGN KEY(전표번호) REFERENCES 판매전표(전표번호);

ALTER TABLE 전표상세
ADD CONSTRAINT 전표상세_FK_제품번호 FOREIGN KEY(제품번호) REFERENCES 제품(제품번호);

ALTER TABLE 전표상세
ADD CONSTRAINT 전표상세_PK_전표제품 PRIMARY KEY(전표번호, 제품번호);

ALTER TABLE 전표상세
MODIFY 수량 CONSTRAINT 전표상세_NU_수량 NOT NULL;
ALTER TABLE 전표상세
MODIFY 단가 CONSTRAINT 전표상세_NU_단가 NOT NULL;
ALTER TABLE 전표상세
MODIFY 금액 CONSTRAINT 전표상세_NU_금액 NOT NULL;
ALTER TABLE 전표상세
ADD CONSTRAINT 전표상세_CH_금액 CHECK(금액>0);

-----------------------------------------------
문제5 인덱스 추가
-----------------------------------------------
CREATE INDEX 전표상세_fk_판매
ON 전표상세(전표번호);
CREATE INDEX 전표상세_fk_제품
ON 전표상세(제품번호);


CREATE INDEX 판매전표_판매일자
ON 판매전표(판매일자);