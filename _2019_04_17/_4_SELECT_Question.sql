SELECT * FROM tab;
--1. �� ������ �������� ��米�� ��ȣ�� �˻��Ѵ�
SELECT * FROM course;
SELECT cname �����, st_num ����, pno "��㱳�� ��ȣ" FROM course;

--2. �� �л����� ���� �а��� �г��� �˻��Ѵ�
SELECT * FROM student;
SELECT sname �̸�, major �а�, syear �г� FROM student;

--3. ��� �л��� ��� ������ �˻��Ѵ�
SELECT avr "��� ����" FROM student;

--4. �л����� ������ �˻��Ѵ�.
SELECT sex ���� FROM student;

--5. �� �л��� ������ �˻��Ѵ�
SELECT avr "��� ����" FROM student;

--6. �� ������ �������� �˻��Ѵ�
SELECT cname �����, st_num ������ FROM course;

--7. �� ������ ������ �˻��Ѵ�
SELECT pname ������, orders ���� FROM professor;

--8. �޿��� 10% �λ����� �� ���� ���޵Ǵ� �޿��� �˻��Ѵ�.
SELECT * FROM emp;
SELECT ename �̸�, sal �޿�, sal+(sal*0.1) "10% �λ� �� �޿�" FROM emp;

SELECT eno ���, ename ����̸�, sal �޿�, NVL(comm,0) ���ʽ�, sal*12+NVL(comm,0) 
����, (sal*1.1)*12+NVL(comm,0) "10% �λ�� ����" FROM emp;

--9. ���� �л��� ��� ������ 4.0 �����̴�. �̸� 4.5�������� ȯ���ؼ� �˻��Ѵ�.
SELECT sname �̸�, avr*1.125 "ȯ�� ��� ����" FROM student;

--10. �޿��� 10% �λ�� ��� �� ����� ������ �˻��Ѵ�
SELECT ename �̸�, sal+(sal*0.1)+NVL(comm, 0) "10% �λ�� ����" FROM emp;

--11. 1�� ���� ���޵Ǵ� �޿��� 10% �λ�Ǿ� 1�� ���� ���޵Ǵ� �޿� ���� ������ �˻��Ѵ�
SELECT ename �̸�, (sal+(sal*0.1)+NVL(comm, 0)) - (sal+NVL(comm, 0)) "�۳� ��� ��� ������" FROM emp;

--12. �� �л����� ��������� 4.5�������� ȯ���� ��� ���� ������ ������� ������ �˻��Ѵ�.
SELECT sname �̸�,(avr*1.125) - avr "ȯ�� �� �������" FROM student;


DESC emp