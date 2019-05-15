--1) ���� ���ؿ� Ȱ��
--  ; ��(View)�� �������� �ϳ��� ���̺� �Ǵ� ���� ���̺��� ������ �κ� ������ �ǹ��Ѵ�.
--  ����ڴ� �並 ���ؼ� ����� �Ǵ� ���̺��� ������ ������ �� �ִ�.
--
--2) ���� ����
--  (1) �ܼ� ��(Simple View)
--     - ���� table �κ��� ������� View
--     - �Լ��� ���� ���� �������� �ʰ� �ܼ� �÷����� ����
--     - DML ���� ������ �����ϴ� --insert, delete , update
--      (View �� DML�� �����ϸ� ���� table�� ����ȴ�)
--    
--  (2) ���� ��(Complex View)
--     - ���� table �κ��� ������� view
--     - �Լ��� ���� ���� �����Ѵ�
--     - DML ���� ������ �Ұ����ϴ�
--     - ���Ȼ��� ������ ����ϴ� ��찡 ���� �ִ�.
--     
--3) �� ������ Ȯ��(���)
--CREATE [OR REPLACE|FORCE|NOFORCE] VIEW ��� (�÷�...)
--AS (SELECT ���� : sub query ��);
--[WITH CHECK_OPTION [ CONSTRAINT constraint_name]]
--[WITH READ ONLY [CONSTRAINT constraint_name]];
--  (1) �並 �����Ѵ�
--  (2) ���� ������ �̿��� ���̺� ���� ����� �����ϴ�
--  (3) OR REPLACE : �並 �����Ѵ�
--        - ������ �̸��� �並 �����ϰ� ���� �����Ѵ�
--        - ALTER VIEW ����� ��ü�Ѵ�
--  (4) FORCE : ��� ���̺��� ��� �䰡 �����ȴ�
--        - �⺻���� NOFORCE �̴�.
--  (5) WITH CHECK OPTION : �信 ���ؼ� �˻� ������ �ุ
--          DML �۾��� �����ϵ��� �����Ѵ�
--  (6) WITH READ ONLY : �並 ���ؼ��� SELECT �� �����ϵ��� �����Ѵ�.
--          ���Ȼ��� ������ �� �ɼ��� ���� ����Ѵ�

--���� ��Ű���� �並 �˻��Ѵ�.
SELECT view_name, text
FROM user_views;  --grant�� view�� ���� �� �ִ� ������ �ο��޾ƾ� view ����Ⱑ �����ϴ�

--�� �Ϲ�ȭ�� ������ �а��� �⸻��� ����� �˻��ϰ�
--��� �����Ѵ�
SELECT c.cno, cname, major, AVG(result)
FROM student s, course c, score r
WHERE s.sno = r.sno AND r.cno =c.cno
AND cname = '�Ϲ�ȭ��'
GROUP BY c.cno, cname, major;

CREATE VIEW ma_result(�����ȣ, �����, �а�, �⸻������)
AS (SELECT c.cno, cname, major, AVG(result)
    FROM student s, course c, score r
    WHERE s.sno = r.sno AND r.cno =c.cno
    AND cname = '�Ϲ�ȭ��'
    GROUP BY c.cno, cname, major
);

SELECT * FROM ma_result;
DESC ma_result;

SELECT * FROM tab; --table�� view ��� ����
--�並 �˻��ϸ� �����δ� ��� ���̺�(����� ���̺�)�� �˻��ؼ� �����´�

--�並 ���� ������ �Է��ϱ�
CREATE VIEW st_ch
AS (SELECT sno, sname, syear, avr
    FROM student
    WHERE syear = 1
    );

--st_ch�信 �����͸� �����ϸ� st_ch������ ������ �����Ƿ�
--����� student�� ���� �����Ͱ� ����ȴ�.
INSERT INTO st_ch
VALUES('000001','ȫ�浿',1,4.0);

--st_ch�� �˻��ϸ� ����� student�� �˻��ؼ� �����´�
SELECT *
FROM st_ch
WHERE sname='Ʈ����';

SELECT * 
FROM student 
WHERE sname='ȫ�浿';

INSERT INTO st_ch
VALUES('000002','Ʈ����',1,1.0);

--2�г��� �Է��Ѵ�
--student���̺��� ���������
--st_ch���� 1�г⸸ �������Ƿ� ��Ÿ���� �ʴ´�.
INSERT INTO st_ch
VALUES('000003','������',2,0.8);

SELECT *
FROM st_ch
WHERE sname='������';

SELECT * 
FROM student 
WHERE sname='������';

--�並 ���� �˻��� �� ���� �����͸� �ԷºҰ��ϵ��� ����� 
CREATE OR REPLACE VIEW st_ch
AS (SELECT sno, sname, syear, avr
    FROM student
    WHERE syear = 1
    )
WITH CHECK OPTION CONSTRAINT view_ck_st_ch;
--where���� ���ǿ� ���� ������ �Է��������Ѵ�

INSERT INTO st_ch
VALUES('000004','�ƺ�',2,0.6);


