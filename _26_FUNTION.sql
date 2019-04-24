--1)���� : ���� �Լ�
--
--2)�Լ� ����
--a) ROUND - n�ڸ����� �ݿø��Ѵ�.
--        ROUND(m,n)
--        ROUND(123.4567, 3) -> 123.457
--
--b) TRUNC - n�ڸ� �̸��� �����Ѵ�.
--        TRUNC(m,n)
--        TRUNC(123.4567, 3) -> 123.456
--c) MOD - m�� n���� ���� ������ ����Ѵ�.
--        MOD(m,n)
--        MOD(10, 4) -> 2
--d) POWER - m�� n���� ����Ѵ�.
--        POWER(m,n)
--        POWER(2,4) -> 16
--e) CEIL - m���� ū ���� ���� ������ ã�´�.
--        CEIL(m)
--        CEIL(2.34) -> 3
--f) FLOOR - m���� ���� ���� ū ������ ã�´�.
--        FLOOR(m)
--        FLOOR(2.34) -> 2
--g) ABS - m�� ���밪�� ����Ѵ�
--        ABS(m)
--        ABS(-4) -> 4
--h) SQRT - m�� �������� ����Ѵ�
--        SQRT(m)
--        SQRT(9) -> 3
--i) SIGN - m�� ������ �� -1, ����� �� 1, 0�̸� 0�� ��ȯ�Ѵ�
--         SIGN(m)
--         SIGN(-3) -> -1
         
--�پ��� ���� �Լ��� �̿��� ����� Ȯ���Ѵ�.  
SELECT ROUND(98.765), TRUNC(98.765), ROUND(98.765,2), TRUNC(98.765,2)
FROM dual;

SELECT MOD(19,3), MOD(-19,3)
FROM dual;

--10�� �μ��� ������ ����Ѵ�. �� 100���� �̸��� �����Ѵ�
SELECT *
FROM dept;

SELECT *
FROM emp;

SELECT eno, ename, dno, TRUNC(sal*12 + NVL(comm,0), -2)
FROM emp
WHERE dno = 10;

--���� ��¥�� �˻��ϰ� ��¥ ��� ����� ��������
SELECT sysdate
FROM dual;

--glogin.sql, login.sql���� ������ �����ϸ�
--����� �ڵ����� ������ �����ȴ�.
ALTER SESSION SET nls_date_format ='YYYY/MM/DD:HH24:MI:SS';

--���� ��¥, �Ի� ����, �Ի��Ϸκ��� ���ñ��� �Ⱓ, �Ի��� ���� 100���� ������ ���� �˻��ϰ� ��¥ ������ ����� ���캻��.
SELECT sysdate ���ó�¥, hdate �Ի�����, TRUNC(sysdate-hdate) "�Ի���-���ñ��� �Ⱓ", hdate+100 "�Ի�100�ϰ��"
FROM emp
WHERE ename = '�迬��';

--��¥ ���� ����
---����        -�����  -����
--------------------------------------
--��¥ + ����    ��¥    �ϼ� ���� ��¥
--��¥ - ����    ��¥    �ϼ� ���� ��¥
--��¥ + ����/24 ��¥    �ð��� ���� ��¥
--��¥ - ��¥    ����    �� ��¥ ���� ��(�ϼ�)
--
--1)���� : ��¥ �Լ�
--        ȸ�� ����� ���� ���ȴ�.
--        �������� ���� ��
--
--2) ����
--YYYY : �⵵
--MM : ��
--DD : ��¥
--HH : �ð�
--MI : ��
--SS : ��
--
--3) �Լ�����
--�Լ���                         ���
-------------------------------------------------
--ROUND             ���Ŀ� ���߾� �ݿø��� ��¥�� ��ȯ�Ѵ�
--                  ROUND(��¥, ����)
--                  ROUND(sysdate, 'DD') -> 2019/04/23
--
--TRUCN             ���Ŀ� ���߾� ������ ��¥�� ��ȯ�Ѵ�
--                  TRUNC(��¥, ����)
--                  TRUNC(sysdate, 'YYYY') -> 2019/01/01
--
--MONTHS_BETWEEN    �� ��¥���� �Ⱓ�� �� ���� ����Ѵ�
--                  MONTHS_BETWEEN(��¥1, ��¥2)
--                  MONTHS_BETWEEN('2011/08/01', '2011/07/01') ->1 --1�����̶� �ǹ�
--
--ADD_MONTHS        ��¥�� n���� ���� ��¥�� ����Ѵ�
--                  ADD_MONTHS(��¥, n)
--                  ADD_MONTHS('2011/07/01', 23) ->'2013/06/01'
--                  
--NEXT_DAY          ��¥ ���� ������ ���Ͽ� �ش��ϴ� ��¥ ���
--                  NEXT_DAY(��¥, ����)
--                  NEXT_DAY('2011/07/14', '�Ͽ���') ->2011/07/17
--
--LAST_DAY          ��¥�� ������ ���� ������ ��¥ ���
--                  LAST_DAY(��¥)
--                  LAST_DAY('2011/02/13') ->2011/02/28
                  
--���ڿ� ��¥�� �ݿø��ϰų� �߶󳻰� ����غ���
SELECT sysdate, ROUND(sysdate, 'YY') ��, ROUND(sysdate, 'MM') ��, ROUND(sysdate, 'DD') ��
FROM dual;

SELECT sysdate, TRUNC(sysdate, 'YY') ��, TRUNC(sysdate, 'MM') ��, TRUNC(sysdate, 'DD') ��
FROM dual;

--�迬�ư� ���ñ��� ���� �ϼ��� �˻��Ѵ� 
--�Ի����� �ٹ��ϼ��� �� ���ϱ� 1�� ���� (���̳ʽ� ���ꤷ�� �ϸ��Ի����� �ٹ��ϼ����� �����Ƿ� 1�� ����)
SELECT TRUNC(sysdate,'DD') - TRUNC(hdate, 'DD')+1 DAY 
FROM emp
WHERE ename = '�迬��';

--20�� �μ� �������� ������� �ٹ��� ���� ���� �˻��Ѵ�
SELECT dno, eno, ename,TRUNC(MONTHS_BETWEEN(sysdate, hdate)) �ٹ�����
FROM emp
WHERE dno = '20';

--20�� �μ������� �Ի� 100��° �Ǵ� ���� 10��° �Ǵ� ���� �˻�
SELECT dno, eno, ename,hdate, hdate+99 "�Ի�100�ϰ��",  ADD_MONTHS(hdate,120) "�Ի�10����"
FROM emp
WHERE dno = '20';

--20�� �μ������� �Ի��� ���� ù���� �Ͽ����� �˻��Ѵ�.
SELECT dno, eno, ename,hdate,NEXT_DAY(hdate, '�Ͽ���')Sunday
FROM emp
WHERE dno = '20';

--10�� �μ������� �Ի��Ѵ��� ������ ��¥�� �Ի��� �޿� �ٹ��� �ϼ��� �˻��Ѵ�.
--(��,�Ի����� �ٹ��Ͽ��� �����Ѵ�)
--(��,�ָ��� �ٹ��Ͽ� �����Ѵ�)
SELECT dno, eno, ename,hdate,LAST_DAY(hdate) ��������¥ ,LAST_DAY(TRUNC(hdate))-TRUNC(hdate) �ٹ��ϼ�
FROM emp
WHERE dno = '10';
