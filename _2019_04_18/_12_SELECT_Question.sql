--1. '__������ __�а� �Ҽ��Դϴ�' ���·� ������ ������ ����Ѵ�
SELECT * FROM professor;
SELECT pname||' ������ '|| section || '�а� �Ҽ��Դϴ�.' �������� FROM professor;

--2. �б����� � �а��� �ִ��� �˻��Ѵ�(�л� ���̺� ������� �˻��Ѵ�)
SELECT * FROM student;
SELECT DISTINCT major ���� FROM student; 

--3. �б����� � �а��� �ִ��� �˻��Ѵ�(���� ���̺� ������� �˻��Ѵ�)
SELECT * FROM professor;
SELECT DISTINCT section FROM professor;

--4. ������ ������ � �͵��� �ִ��� �˻��Ѵ�.
SELECT DISTINCT orders FROM professor;

--5. �г⺰ ���������� �л��� ������ �˻��Ѵ�
SELECT * FROM student ORDER BY avr DESC;

--6. �а��� �г⺰�� �л��� ������ ���������� �˻��Ѵ�
SELECT * FROM student ORDER BY syear, major, avr DESC;

--7. ���������� ���� �̸��� �˻��Ѵ�
SELECT cname ����, st_num ���� FROM course ORDER BY st_num DESC;

--8. �� �а����� ������ ������ �˻��Ѵ�
SELECT * FROM tab;
SELECT * FROM professor ORDER BY section;

--9. �������� ������ ������ �˻��Ѵ�
SELECT * FROM professor ORDER BY orders;

--10. �� �а����� ������ ������ �������� ������ �˻��Ѵ�.
SELECT * FROM professor ORDER BY section, hiredate;

--11. ���� �л��� ������ �˻��Ѵ�
SELECT sname �̸�, avr ���� FROM student WHERE sname = '����';

--12. �������� ����� �˻��Ѵ�
SELECT * FROM professor WHERE orders ='������' ORDER BY section;

--13. ȭ�а� �Ҽ� ������ ����� �˻��Ѵ�
SELECT * FROM professor WHERE section = 'ȭ��' ORDER BY hiredate;

--14. �۰� ������ ������ �˻��Ѵ�
SELECT * FROM professor WHERE pname = '�۰�';

--15. �г⺰�� ȭ�а� �л��� ������ �˻��Ѵ�
SELECT sname �̸�, syear �г�,major ����, avr ���� 
FROM student 
WHERE major = 'ȭ��' 
ORDER BY syear, avr DESC;

--16. 2000�� ������ ������ ������ ������ �����ϼ����� �˻��Ѵ�
SELECT * FROM professor;
ALTER SESSION SET nls_date_format = 'YY/MM/dd';
SELECT * FROM professor WHERE hiredate < '00/01/01' ORDER BY hiredate;

ALTER SESSION SET nls_date_format = 'YYYY/MM/DD';
SELECT * FROM professor WHERE hiredate < '2000/01/01' ORDER BY hiredate;

--17. ��� ������ ���� ������ ������ �˻��Ѵ�.
SELECT * FROM course;
SELECT * FROM course WHERE pno IS NULL;

--18. ȭ�а��� �����а� �л��� �˻��Ѵ�
SELECT * FROM student WHERE major = 'ȭ��' OR major = '����' ORDER BY major, avr DESC;

--19. ȭ�а��� �ƴ� �л� �߿� 1�г� �л��� �˻��Ѵ�
SELECT * FROM student WHERE NOT (major = 'ȭ��') AND syear = '1' ORDER BY major;

--20. ȭ�а� 3�г� �л��� �˻��Ѵ�
SELECT * FROM student WHERE major = 'ȭ��' AND syear = '3' ORDER BY avr DESC;

--21. ������ 2.0���� 3.0 ������ �л��� �˻��Ѵ�.
SELECT * FROM student WHERE avr>2.0 AND avr < 3.0 ORDER BY avr DESC;
