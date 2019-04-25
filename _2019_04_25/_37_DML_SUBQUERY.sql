--1) ���� : ���� ������ �̿��� DML
--         �ٷ��� DML�۾��� �����ϴ� ��� ���� �������� �̿��ϴ� ��찡 ����.
--         Ư�� INSERT �۾��� �뷮 �����͸� �Է��� �� ���� ������ �̿��ϴ� ���� �ſ� �����ϰ� ���� �۾� ����̴�.
--         Ư�� �޸𸮸� ������ �ʰ� ���� �����͸� ��ũ�� �Է��ϴ� ���̷�Ʈ �ε带 ���� ����ϸ� �۾� ȿ���� �谡 �ȴ�.
--2) ���
--INSERT INTO [/*+ APPEND */] ���̺�
--[NOLOGGING] [(�÷�, �÷�, ...)]
--SELECT ����;
--a) ���� ���� (SELECT����)�� �˻��� ���� �Է°����� ����Ѵ�
--b) �� ���� ���� ���� �Է��� �� �ִ�.
--c) �÷� ����Ʈ�� SELECT���� �÷��� 1:1�� �����Ǿ�� �Ѵ�.
--d) SELECT���� ����� ���� ���� ������ �޸� ��ȣ�� ���� �ʴ´�.
--e) /*+ APPEND */ : ���̷�Ʈ �ε������� �뷮�� �Է� �۾��� �� ������ �۾��Ѵ�.
--f) [NOLOGGING] : �α� ������ ������ �����Ƿ� �Է� �۾��� ��������.
--                 �׷��� ��� �߻��� ������ �� ����.
--
--UPDATE ���̺�
--SET �÷��� = (SELECT ����),
--    �÷��� = (SELECT ����),...
--[WHERE ����];
--
--UPDATE ���̺�
--SET (�÷�, �÷�,...) = (SELECT ����)
--[WHERE ����];
--a) UPDATE���� SET������ ���� �� ���� �������̳� ���� �� ���� �������� �̿��� �� �ִ�.
--   -���� ���� ��쵵 �ݵ�� ��� ���� 1������ �Ѵ�
--b) �̶� �˻��Ǵ� Data�� �ݵ�� �����Ǵ� �÷���� 1:1 �����Ǿ�� �Ѵ�.
--c) SET������ ������ ���������� �������� WHERE ���� ���� ������ �����ڿ� ���� �޶�����.

--emp2 ���̺� ����� ������ �Է��Ѵ�.
--emp -> emp2
DESC emp2;
SELECT * FROM emp2;

INSERT INTO emp2 (eno, asal)
SELECT eno, sal*12 + NVL(comm,0)
FROM emp;

--�ڵ���ȯ�� ������ ���� ������������
--�ڵ���ȯ�� �ȵǸ� ������ �߻���Ų��
INSERT INTO emp2 (eno, asal)
SELECT eno, hdate FROM emp;

INSERT INTO emp2 (eno, asal)
SELECT eno,dno FROM emp;

SELECT * FROM emp2;

�� ����� ������ �ٹ����� emp3���̺� �����Ѵ�.
SELECT * FROM dept;
SELECT * FROM emp3;

INSERT INTO emp3 (eno, ename, dno, dname)
SELECT e.eno, ename, e.dno, dname 
FROM emp e, dept d
WHERE e.dno = d.dno;

DELETE FROM emp3;

--SELECT �۾��̳� DML�۾��� ��� �޸𸮿��� �̷������.
--����Ŭ�� SGA��� �޸� ���� ���� �����ͺ��̽� ���� ĳ��
(Database Buffer Cache)��� ������ �̵� �۾� �������� �̿��Ѵ�.
�̸� ���� ��ũ ���� ȸ���� ���� �ٿ� ������ ����Ų��.
�׷��� �ϰ����� �뷮�� DML�۾��� �޸𸮿��� �Ͼ�� �̸� ��ũ�� �ݿ��ϰ�
�ٽ� �޸𸮸� �����ϴ� ���� ��ȿ���� �߻��Ѵ�.
�̸� ���ϱ� ���� �뷮 DML �۾������� �޸𸮸� ������ �ʰ� ��ũ�� ���� �۾��� �����ϴ� ���� ���̷�Ʈ �ε�(Direct Load)�� �Ѵ�.
DML �۾��� ���̷�Ʈ �ε��ϱ� ���ؼ��� '/*+ APPEND */'�� ���忡�� �����Ѵ�.
���� /* */�� �뵵�� ����� ������ �ּ�������, ���⿡ +�� �߰��Ͽ� ��Ʈ(HINT)���� �̿��ϵ��� �ϰ�,
����Ŭ�� �� ������ �����Ͽ� ������ ����� �����Ѵ�.

�׸��� ����Ŭ�� ������ �ý��� ��� ���� ��� �߻� �� ������ �� �ֵ��� DB�� ������ ���ϴ� ��� �۾��� ������
���� �α�(Reado log)������ �α� ������ �����Ѵ�.
�׷��� �뷮�� DML �۾��� �۾��� ȿ���� ���� �̸� �������� ���� �� �ִ�.
�۾� ������ ���� �α� ������ ������ �ʴ´ٸ� 'NOLOGGING' �ɼ��� �̿��Ѵ�.
�׷��� �̷��� ������ �Ұ����ϵ��� �۾��� ���Ŀ��� ��ֿ� ����� ����� ���� �ʾƾ� �Ѵ�.
�뷮�� �۾����� ���̷�Ʈ �ε�� ��α� ����� �̿��ϸ� �۾� ������ ��������� ����������
�۾��� �������� ������ �� �ۿ� ����.
���̷�Ʈ �ε带 �̿� �뷮�� �����͸� ���̺� �Է��� ��� �ԷµǴ� �������� ��ġ�� �Ϲ� �Է°� �޶� 
Ʈ������� ������ ���� �ʰ� �˻��ϰ� �Ǹ� 'ORA-12838: ���ķ� ������ �� ��ü�� �аų� ������ �� �����ϴ�'��� ������ ������ �ȴ�
�̰��� �Է� �������� �ջ��� �����ϱ� ���� ����̴�.
�ݵ�� COMMIT �� ���� �˻��Ѵ�.
;

INSERT /*+ APPEND */ INTO emp3 
NOLOGGING (eno, ename, dno, dname)
SELECT e.eno, ename, e.dno, dname 
FROM emp e, dept d
WHERE e.dno = d.dno;

COMMIT;


���� ������ �̿��� UPDATE ���� �����Ѵ�.
--�輱���� �޿��� ���ʽ��� 
--���� �ȿ����� �޿��� 
--���ϴ��� ���ʽ��� �����ϰ� �����Ѵ�. (���� ������ UPDATE)
UPDATE emp 
SET sal = (SELECT sal FROM emp WHERE ename = '�ȿ���'), comm = (SELECT comm FROM emp WHERE ename = '���ϴ�')
WHERE ename = '�輱��';

SELECT * FROM emp 
WHERE ename IN ('�輱��', '�ȿ���', '���ϴ�');

�����ΰ� ������ �μ��� ������� �޿��� �������� �޿��� �����ϰ� �����Ѵ�.
SELECT * FROM emp;

UPDATE emp
SET sal = (SELECT sal FROM emp WHERE ename = '������')
WHERE dno = (SELECT dno FROM emp WHERE ename = '������');

SELECT dno, eno, ename, sal
FROM emp
WHERE dno = (SELECT dno
             FROM emp
             WHERE ename = '������');

���ʷ��� �޿�, ���ʽ��� �Ǿ����� �����ϰ� �����Ѵ�.
SELECT * FROM emp;
UPDATE emp
SET (sal,comm) = (SELECT sal, comm FROM emp WHERE ename = '�Ǿ���')
WHERE ename = '���ʷ�';

SELECT * FROM emp;
UPDATE emp
SET sal = (SELECT sal FROM emp WHERE ename = '�Ǿ���')
    comm = (SELECT comm FROM emp WHERE ename = '�Ǿ���')
WHERE ename = '���ʷ�';


SELECT ename, sal, comm
FROM emp
WHERE ename IN ('�Ǿ���', '���ʷ�');