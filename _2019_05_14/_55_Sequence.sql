--1) ������(Sequence)
--  ; ������ ���ڸ� �����ϴ� ��ü
--  
--  ���̺� �ԷµǴ� ������ �߿��� ���� �ߺ��Ǹ� �ȵǴ� �κ��� �ִ�.
--  �̶� �Էµ� ���߿� �ִ밪���� +1�� ���� ���� ���ο� �Է°����� ����Ѵ�.
--  �׷��� �̷� ����� ���� ���� Ʈ������� ���ÿ� ����Ǵ� ȯ�濡�� ������ �Է� ���а� �߻��Ѵ�.
--  �̸� �ؼ��ϱ� ���� �ڵ����� �����ϴ� �������� ������ �� �������� ����Ѵ�.
--  
--  �뵵 : ����Ű �ĺ����� -> ���� PKŰ ��ĺ����� ��ȯ�� ��
--        �Ϸù�ȣ�� PK�� ����ϴµ� �̰��� �������� ����Ѵ�.
--        (ex. �ֹ���ȣ, ����ȣ, �԰��ȣ ..)
--        
--2) ���
--CREATE SEQUENCE ������
--[START WITH ���۰� - �⺻���� 1
--INCREMENT BY ������ - �⺻���� 1
--MAXVALUE [���Ѱ� | NOMAXVALUE]
--MINVALUE [���Ѱ� | NOMINVALUE]
--CYCLE | NOCYCLE
--CACHE [cache���� | NOCACHE]];
--
--  (1) �ڵ����� ������ ���� �����ϴ� �������� �����Ѵ�
--  (2) START WITH : �Ҵ��� �����ϴ� ���� �����Ѵ�.
--                   �������� ������ MINVALUE �� ���ǵ��
--                   MINVALUE ���� ���� ���� ������ �� ����
--  (3) INCREMENT BY : �����Ǵ� ���� ����ġ�� �����Ѵ�
--                     �������� ������ 1���� �����Ѵ�
--  (4) MAXVALUE : ������ ���Ѱ��� �����Ѵ�
--                 �⺻ ������ NOMAXVALUE �̴�.
--  (5) MINVALUE : ���Ѱ��� �����Ѵ�
--                 �⺻ ������ NOMINVALUE �̴�. 
--                 NOMINVALUE �� �����Ǵ� START WITH �� 1�̴�.
--  (6) CYCLE : ���Ѱ����� ������ ���� �ٽ� ���Ѱ����� ������� ������ �����̴�.
--              �������� ������ NOCYCLE �� �⺻ �����̴�
--              NOCYCLE ���� ���Ѱ��� ���ǵǾ� ������ 
--              ���� ���Ѱ����� �����ǰ� ���Ŀ��� �������� �ʴ´�.
--  (7) CACHE : �޸𸮿� �̸� ������ ���� ������ �����Ѵ�
--              �������� ������ 20���� �̸� ������ �д�
--              
--ALTER SEQUENCE ������
--INCREMENT BY ������
--MAXVALUE [���Ѱ� | NOMAXVALUE]
--MINVALUE [���Ѱ� | NOMINVALUE]
--CYCLE | NOCYCLE
--CACHE cache���� | NOCACHE;
--  (1) �������� ������ �����Ѵ�
--  (2) START WITH ���� ������ �� ����
--  (3) �̿� ��� ������ CREATE SEQUENCE �� �����ϴ�
--
--DROP SEQUENCE ������;
--  (1) �������� �����Ѵ�.
--
--SELECT sequence_name, max_value, min_value,
--       increment_by, cache_size, last_number,
--       cycle_flag
--FROM user_sequences;
--    (1) ������ ������ �˻��Ѵ�
--    (2) last_number : �޸𸮿� CACHE �� ���� ���� ū ��
--
--������.nextval
--������.currval
--    (1) nextval : �������κ��� ������ ���� �Ҵ�޴´�
--                  ���� ����ڳ� ���ǿ��� ���� ����������
--                  � ��쵵 �ߺ����� �ʴ� ������ ���� �Ҵ�޴´�.
--    (2) currval : �������κ��� ���������� �Ҵ���� ���� �ٽ� �Ҵ�޴´�.
--                  -������ �Ҵ�� ���� ������ ���� �ʿ��� ��� ����Ѵ�.
--    (3) INSERT ���� VALUES ���̳� UPDATE ���� SET ������ ���� ����Ѵ�.
--        �ֹ���ȣ/�ֹ��Ϸù�ȣ ���� ������ ���� ����Ѵ�.
--
--�������� �����ϰ� ������ �˻��Ѵ�
CREATE SEQUENCE emp_seq_eno
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  CACHE 20;
  
SELECT sequence_name, max_value, min_value,
       increment_by, cache_size, last_number,
       cycle_flag
FROM user_sequences;

--�������� 99%�̻� �̷��� �����
CREATE SEQUENCE order_seq_no;

--�������κ��� ���� �Ҵ�޾� ����Ѵ�.
INSERT INTO emp (eno)
VALUES (emp_seq_eno.nextval);

SELECT *
FROM emp;
ROLLBACK;
--ROLLBACK�� �̷������ �������� ��� �����Ѵ� (Ȥ�� �𸣴ϱ� ����ũ���� �����ϱ� ���ؼ�)
--������ ��ȣ�� GAP�� �����.
