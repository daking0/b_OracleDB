--1) ���� : ���� �����ڿ� �ߺ�����
--
--2) ���
--SELECT �÷�|| '���ͷ�'||......
--FROM ���̺�;
--a) ���Ῥ����(||)�� ���ͷ��̳� �÷��� �ϳ���
--   ���ڿ��� �˻��Ѵ�.
--b) ���ͷ��̶� SQL���� ���� ����, ����, ��¥��
--   �ǹ��Ѵ�.
--   ���ͷ��� ���ڸ� �����ϰ� �ݵ�� ���� �ο��ȣ�� ����Ѵ�.
--c) ���� �����ڴ� SELECT���� �̿� �پ��� ������
--   ���� �� ���� ���ȴ�.

SELECT ename||sal �����޿� FROM emp;

SELECT ename ����, sal �޿� FROM emp;

SELECT ename||' '||sal �̸��޿� FROM emp;

SELECT ename||'�� ������ '||job||'�Դϴ�.' �������� FROM emp;

-- �����ؾ� �� ���� ������
--���� �����ڴ� ��Ģ�����ں��� �켱������ ����.
--�׷��Ƿ� �Ʒ� �������� ���ڿ��� ���ڸ� ��ġ���� �ؼ�
--������ �߻��Ѵ�.
SELECT ename||' '||sal+100
FROM emp;
SELECT eno||ename||sal*12+NVL(comm,0)
FROM emp;

-- ��ȣ�� �켱���� ����
SELECT ename||' '||(sal+100) �޿�
FROM emp;
SELECT eno||ename||(sal*12+NVL(comm,0))
FROM emp;


SELECT * FROM student;
SELECT sname||'�� ������ '||sex||'�Դϴ�.' "�л� ����" FROM student;
SELECT sname||'�� ������ '||major||'�Դϴ�' "�л� ����" FROM student;


-- �ߺ� ����
SELECT job FROM emp;

SELECT DISTINCT job FROM emp;

