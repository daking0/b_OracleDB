--1. '_�а���_�л��� ���� ������ _�Դϴ�.' ���·� �л��� ������ ����ϼ���.
SELECT major||'�а��� '||sname||' �л��� ���� ������ ' ||avr ||' �Դϴ�.' �л����� FROM student; 

--2. '_������ _���� �����Դϴ�.' ���·� ������ ������ ����ϼ���.
SELECT * FROM course;
SELECT cname||' ������ '|| st_num ||'���� �����Դϴ�.' �������� FROM course;

--3. ���������� �л��� �̸��� �˻��ϼ���.
SELECT sname �̸�, avr ����, major �а� FROM student ORDER BY avr DESC;

--4. �а��� ���������� �л��� ������ �˻��ϼ���.
SELECT * FROM student;
SELECT sname �̸�, major ����, avr ���� FROM student ORDER BY major, avr DESC;


--5.ȭ�а� �л��� �˻��ϼ���.
SELECT * FROM student WHERE major='ȭ��';

--6. ������ 2.0 �̸��� �л��� �˻��ϼ���.
SELECT * FROM student WHERE avr<2.0;