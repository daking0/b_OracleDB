SELECT * FROM tab;
--1. ��� �л��� ������ �˻��Ѵ�
SELECT * FROM student;

--2. ��� ������ ������ �˻��Ѵ�.
SELECT * FROM professor;

--3. ��� ������ ������ �˻��Ѵ�.
SELECT * FROM course;

--4. �⸻��� ���� ������ �˻��Ѵ�.
SELECT sno �й�, cno �����ȣ, RESULT "�⸻��� ����" FROM score;

--5. �л����� �а��� �г��� �˻��Ѵ�.
SELECT sno �й�, sname �̸�, major ����, syear �г� FROM student;

--6. �� ������ �̸��� ������ �˻��Ѵ�.
SELECT cname, st_num FROM course;

--7. ��� ������ ������ �˻��Ѵ�.
SELECT pname, orders FROM professor;