--���� �Լ��� �̿��ؼ� �ذ��ϼ���
1. �̸��� 2 ������ �л��� �̸��� �˻��Ѵ�
SELECT sno �л���ȣ, sname �̸�
FROM student
WHERE length(sname) =2;

2. '��'�� ���� ���� �л��� �̸��� �˻��Ѵ�
SELECT sno �л���ȣ, sname �̸�
FROM student
WHERE SUBSTR(sname, 1, 1) = '��';
--WHERE sname LIKE '��%';

3. ������ ������ �ѱ��ڷ� �˻��Ѵ�(EX ������ ->��)
SELECT pno ������ȣ, pname �����̸�, orders ����
FROM professor
WHERE  SUBSTR(orders, 1, 1)='��'; 

SELECT pname ������, SUBSTR(orders, 1, 1) ����
FROM professor;

4. �Ϲ� ������ ���� �������� �����ؼ� ��� ������ �˻��Ѵ�. (EX - �Ϲ�ȭ�� -> ����ȭ��)
SELECT REPLACE(cname,'�Ϲ�','����') �����
FROM course; 
--WHERE cname LIKE ('%�Ϲ�%');

5. ���� �Է� �Ǽ��� STUDENT���̺��� SNAME�÷��� �����Ͱ� �Էµ� �� ���ڿ� �������� ������ �߰��Ǿ��ٸ�
   �˻��� �� �̸� �����ϰ� �˻��ϴ� SELECT���� �ۼ��Ѵ�.
SELECT sno, SUBSTR(sname,1,LENGTH(sname)-1) sname, sex, syear, major, avr
FROM student;

--����,��¥ �Լ��� �̿��Ѵ�
1. �������� ������ �޿� �ٹ��� �ϼ��� �������� �˻��Ѵ�.
SELECT pname ������,hiredate �����ѳ�,LAST_DAY(TRUNC(hiredate))-TRUNC(hiredate)+1 DAY 
FROM professor;

2. �������� ���ñ��� �ٹ��� �ְ� �� ������ �˻��Ѵ�.
SELECT pname "���� �̸�", pno ������ȣ, hiredate �����, TRUNC(sysdate,'DD')-TRUNC(hiredate,'DD')-1 �ٹ���,
 ROUND((TRUNC(sysdate,'DD')-TRUNC(hiredate,'DD')-1)/7)�ٹ���
FROM professor;

3. 1991�⿡�� 1995����� ���̿� ������ ������ �˻��Ѵ�.
SELECT pname ������, hiredate ���ӳ�¥
FROM professor
WHERE 1995>=TO_CHAR(hiredate,'YYYY') AND TO_CHAR(hiredate,'YYYY')>=1991;

--WHERE hiredate BETWEEN '1991/01/01' AND '1995/12/31';

4. �л����� 4.5ȯ�� ������ �˻��Ѵ�(�Ҽ��� ��°�ڸ�����)
SELECT sno, sname,sex, syear, major,  TRUNC(avr*1.125,2)��ȯ����
FROM student
ORDER BY avr DESC;

--��ȭ�Լ��� �̿��Ѵ�.
1. �л��� ��� ������ ���� ���Ŀ� ���� �Ҽ��� ���� 2�ڸ����� �˻��Ѵ�.
   OOO�л��� ��� ������ O.OO�Դϴ�.
SELECT sname||' �л��� ��� ������ '||TO_CHAR(TRUNC(avr,2),'0.99')||'�Դϴ�.'
FROM student;
   
2. ������ �������� ���� �������� �˻��Ѵ�.
   OOO������ �������� YYYY�� MM�� DD���Դϴ�
SELECT pname||'������ �������� '||TO_CHAR(hiredate,'YYYY"��"MM"��"DD"�� �Դϴ�"')
FROM professor;
  
3. ���� �߿� 3���� ������ ������ ����� �˻��Ѵ�.
SELECT pname ������, hiredate ���ӳ�¥, TO_CHAR(hiredate,'MM"��"') "3������"
FROM professor
WHERE TO_CHAR(hiredate,'MM') =3;