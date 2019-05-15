CREATE TABLE �Ǹ���ǥ (
��ǥ��ȣ VARCHAR2(12),
�Ǹ����� DATE,
���� VARCHAR2(50),
�Ѿ� NUMBER);

ALTER TABLE �Ǹ���ǥ
ADD CONSTRAINT �Ǹ���ǥ_PK PRIMARY KEY(��ǥ��ȣ);

ALTER TABLE �Ǹ���ǥ
ADD CONSTRAINT �Ǹ���ǥ_CH CHECK(�Ѿ�>0);

ALTER TABLE �Ǹ���ǥ
MODIFY �Ǹ����� CONSTRAINT �Ǹ���ǥ_nu_���� NOT NULL;

ALTER TABLE �Ǹ���ǥ
MODIFY ���� CONSTRAINT �Ǹ���ǥ_NU_�� NOT NULL;


CREATE TABLE ��ǰ(
��ǰ��ȣ VARCHAR2(12),
��ǰ�� VARCHAR2(100),
��ǰ�ܰ� NUMBER);

ALTER TABLE ��ǰ
ADD CONSTRAINT ��ǰ_PK_��ǰ��ȣ PRIMARY KEY (��ǰ��ȣ);

ALTER TABLE ��ǰ
ADD CONSTRAINT ��ǰ_UK_��ǰ�� UNIQUE (��ǰ��);

ALTER TABLE ��ǰ
ADD CONSTRAINT ��ǰ_CH_��ǰ�ܰ� CHECK(��ǰ�ܰ�>0);

CREATE TABLE ��ǥ��(
��ǥ��ȣ VARCHAR2(12),
��ǰ��ȣ VARCHAR2(12),
���� NUMBER,
�ܰ� NUMBER,
�ݾ� NUMBER);

ALTER TABLE ��ǥ��
ADD CONSTRAINT ��ǥ��_FK_��ǥ��ȣ FOREIGN KEY(��ǥ��ȣ) REFERENCES �Ǹ���ǥ(��ǥ��ȣ);

ALTER TABLE ��ǥ��
ADD CONSTRAINT ��ǥ��_FK_��ǰ��ȣ FOREIGN KEY(��ǰ��ȣ) REFERENCES ��ǰ(��ǰ��ȣ);

ALTER TABLE ��ǥ��
ADD CONSTRAINT ��ǥ��_PK_��ǥ��ǰ PRIMARY KEY(��ǥ��ȣ, ��ǰ��ȣ);

ALTER TABLE ��ǥ��
MODIFY ���� CONSTRAINT ��ǥ��_NU_���� NOT NULL;
ALTER TABLE ��ǥ��
MODIFY �ܰ� CONSTRAINT ��ǥ��_NU_�ܰ� NOT NULL;
ALTER TABLE ��ǥ��
MODIFY �ݾ� CONSTRAINT ��ǥ��_NU_�ݾ� NOT NULL;
ALTER TABLE ��ǥ��
ADD CONSTRAINT ��ǥ��_CH_�ݾ� CHECK(�ݾ�>0);

-----------------------------------------------
����5 �ε��� �߰�
-----------------------------------------------
CREATE INDEX ��ǥ��_fk_�Ǹ�
ON ��ǥ��(��ǥ��ȣ);
CREATE INDEX ��ǥ��_fk_��ǰ
ON ��ǥ��(��ǰ��ȣ);


CREATE INDEX �Ǹ���ǥ_�Ǹ�����
ON �Ǹ���ǥ(�Ǹ�����);