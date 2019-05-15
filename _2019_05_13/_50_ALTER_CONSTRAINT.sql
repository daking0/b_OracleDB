--1) �������ǰ���
--  ; ���� ������ �����ϴ� ����� ���̺��� ������ ��
--    ���� �����ϰų� ���߿� �߰��ϴ� ����� �ִ�.
--    ���� �Ϸ��� ������ ��ũ��Ʈ�� �ۼ��Ѵٸ� ��������
--    �۾��� ȿ���� ���� ������ ���߿� �߰��ϴ� ������� 
--    ���������� �����ϴ� ���� ����.
--    �׸��� ������ ���� ������ �۾� ȯ�濡 ���� Ȱ��ȭ �ǰų�
--    ��Ȱ��ȭ �� �� �ִ�.
--    
--    ���������� ���� ū ������ �������� � �����ϴٴ� ���̴�.
--    ���� ��� ��Ը� ��ġ ó���۾����� �ԷµǴ� �����Ͱ� �̹� 
--    ���Ἲ�� Ȯ�ε� ����� ���� ���� ������ �ٽ� �˻���
--    �ʿ䰡 ����. �̶��� �ӽ÷� ���� ������ ��Ȱ��ȭ�ߴٰ�
--    �۾��� ���� ���Ŀ� Ȱ�����ָ� �۾��� �ӵ��� �ſ� ��������.

--2) �������� �߰�
--ALTER TABLE ���̺�
--ADD CONSTRAINT �������Ǹ� ��������Ÿ��;
--  (1) NOT NULL�� ������ ���������� �߰��Ѵ�.
--  (2) ��������Ÿ�� : �������Ǻ� ��������� ����
--  (3) NOT NULL ���������� MODIFY������� �߰��Ѵ�.
--
--- NOT NULL �� ���
--ALTER TABLE ���̺�
--MODIFY �÷� CONSTRAINT �������Ǹ� NOT NULL;
--  (1) NOT NULL ���������� �߰��Ѵ�.
--  (2) ���� ����� �ٸ� �������ǰ� �����ϴ�.
--
--3) ���� ���� ����
--ALTER TABLE ���̺�
--DROP PRIMARY KEY | UNIQUE(�÷�)|
--CONSTRAINT �������Ǹ� [CASCADE];
--  (1) ���������� �����Ѵ�.
--  (2) CASCADE : PK�� UK�� ������ ��� �̸� �����ϴ� 
--                FK�� �����ȴ�.
                
4) class, student ���̺��� �����ϰ� �������� �߰�/����
DROP TABLE CLASS;
DROP TABLE ST;
COMMIT;

CREATE TABLE class(
cno VARCHAR2(2),
cname VARCHAR2(50)
);

CREATE TABLE st(
sno VARCHAR2(2),
sname VARCHAR2(50),
cno VARCHAR2(2)
);

INSERT INTO class
VALUES ('01', '������Ϲ�');
INSERT INTO class
VALUES ('02', '�����ٻ���');
INSERT INTO st
VALUES ('01', 'ȫ�浿','01');
INSERT INTO st
VALUES ('02', '�Ӳ���','02');
INSERT INTO st
VALUES ('03', '����','03');
COMMIT;

ALTER TABLE class
ADD CONSTRAINT class_pk_cno PRIMARY KEY(cno);
ALTER TABLE class
ADD CONSTRAINT class_uk_cname UNIQUE (cname);
ALTER TABLE st
ADD CONSTRAINT st_pk_sno PRIMARY KEY (sno);
ALTER TABLE st
ADD CONSTRAINT st_fk_cno FOREIGN KEY (cno) REFERENCES class (cno);

-- ���Ἲ�� ������ �����Ͱ� �� �ִ� ���� ���������� ������� �ʴ´�.
-- �׷��� ���Ἲ ���� �����͸� �����ϰ� ���������� �����Ѵ�.

-- �Ϲ������� ���̺��� �����ϰ� ��Ը��� �����͸� �Է��� ���� ���������� �������� �ʴ´�.
-- �̷� ��� ���Ἲ�� �����ϴ� �����Ͱ� ������ �� �ִµ�
-- �� �����͵��� exception ���̺� �ϰ������� �����ϰ� 
-- rowid�� ���� �����ϸ� ������ ���̺��� ���Ἲ �����Ͱ� 
-- ��� �����ȴ�.
-- ���ۿ� �˻� : ����Ŭ �������� ��߳��� ������ �˻�
--https://m.blog.naver.com/PostView.nhn?blogId=tyboss&logNo=70035078373&proxyReferer=https%3A%2F%2Fwww.google.com%2F
--rowid : ����Ŭ���� Ư�� ���� �����͸� ����Ű�� ���� �ּҰ�

UPDATE st
SET cno = '01' WHERE sno = '03';
COMMIT;

ALTER TABLE st
ADD CONSTRAINT st_fk_cno FOREIGN KEY (cno) REFERENCES class (cno);

ALTER TABLE CLASS
MODIFY cname CONSTRAINT class_not_null_cname NOT NULL;

--���̺� �̸��� �빮�ڷ� �� ��
SELECT c.table_name, c.constraint_name,
       c.constraint_type, s.column_name
FROM user_constraints c, user_cons_columns s
WHERE c.constraint_name = s.constraint_name
AND c.table_name IN('CLASS','ST');

--5) CLASS, STUDENT ���̺��� �������� ���� 
-- �ڽ����̺� ���� �����Ǵ� ���������� ���� �Ұ���
ALTER TABLE class
DROP CONSTRAINT class_pk_cno;
-- CASCADE�� ������ ���������� �����ϴµ�
-- �ڽ��� ���� �������ǵ� ������ ����
ALTER TABLE class
DROP CONSTRAINT class_pk_cno CASCADE;

ALTER TABLE class
DROP CONSTRAINT class_not_null_cname;
ALTER TABLE class
DROP CONSTRAINT class_uk_cname;
ALTER TABLE st
DROP CONSTRAINT st_pk_sno;

SELECT *
FROM st;

--6) �������� Ȱ��ȭ/��Ȱ��ȭ
--ALTER TABLE ���̺�
--DISABLE CONSTRAINT �������Ǹ� [CASCADE];
--  (1) ���������� ��Ȱ��ȭ�Ѵ�.
--  (2) PK�� UK�� ��� �ε����� �����ȴ�.
--  (3) ��Ȱ��ȭ�� ���������� ���������� �˻����� �ʴ´�.

--CLASS/ST ���̺� ���������� Ȱ��/��Ȱ��ȭ�� ���� ������ �Է�
ALTER TABLE class
ADD CONSTRAINT class_pk_cno PRIMARY KEY(cno);


ALTER TABLE st
ADD CONSTRAINT st_fk_cno FOREIGN KEY(cno) REFERENCES class(cno);

SELECT table_name, constraint_name, status
FROM user_constraints
WHERE table_name IN('CLASS','ST');

INSERT INTO st VALUES('10','�迬��','03');

ALTER TABLE st
DISABLE CONSTRAINT st_fk_cno;

SELECT table_name, constraint_name, status
FROM user_constraints
WHERE table_name IN('CLASS','ST');

INSERT INTO st VALUES('10','�迬��','03');
INSERT INTO class VALUES('03','��ȫ���Ź�');

ALTER TABLE st
ENABLE CONSTRAINT st_fk_cno;

���������� DB�� ���Ἲ�� �����ϴ� ����̴�.
������ �۾��� ������ �ݵ�� �������ǿ� ���� ��ȹ�ؾ� �ϴ� �������� ����´�.
Ư�� ���������� ��� �θ� ���� �Է��ϰ� �ڽ��� �Է��ؾ��ϹǷ� �������� ������� �ȴ�.
SI�� ���߽� �Ϲ������� �����ͺ��̽��� �����ϰ� �����͸� �Է��ϰ� �Ǵµ�
�ʱ⿡�� �������� ��Ȯ�� OR �����ο� �׽�Ʈ�� �����ϵ��� �ϱ� ���� ���������� ��Ȱ��ȭ�ϰ� �ȴ�.
���������� ��Ȱ��ȭ �ϸ� 2���� ������ ����´�.
ù°, �������� �Է��� �����Ӵ� -> ������ �׽�Ʈ�� ����
��°, ���뷮 ������ �Է½� ���ǰ˻縦 ���� �����Ƿ� �ӵ��� ���ȴ�

��, �ʱ� �۾��� �׽�Ʈ�� ������ ��ÿ��� �ݵ�� ���������� Ȱ���ؾ� �Ѵ�.
�� ���Ἲ�� �����ϴ� �����ʹ� exceptions ���̺��� Ȯ���ϰ� �ϰ�ó���Ѵ�.

[��Ը� ��ġ �۾��� ȿ�������� �����ϴ� ���]
(1) ������ DATABASE BUFFER CACHE �� ũ�⸦ �ø���
(2) ���̷�Ʈ �ε� �۾��� �����Ѵ�
  - �̶��� DATABASE BUFFER CACHE �� ������� �����Ƿ� ũ�⸦ �ø� �ʿ䰡 ����.
(3) �Է� ���̺�� ���õ� ��� ���������� ��Ȱ��ȭ�Ѵ� ->��� �����Ϸ��� �߿�
 - �������ǿ� ���� �ʴ� �����ʹ� �Է��� ���� �Ŀ� exceptino ����� ����ؼ� �ɷ��� �� �ִ�.
 ���ۿ� �˻��ϸ� ���´�.