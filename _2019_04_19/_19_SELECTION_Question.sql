--1. '___�л��� 4.5 ȯ�� ������ ___�Դϴ�'�� ���·� �л��� ȯ�� ������ ����Ѵ�.
SELECT *
FROM student;
SELECT sname||' �л��� 4.5 ȯ�������� '||avr*1.125||'�Դϴ�.' 
FROM student;

--2. '___������ ��� ���� ��ȣ�� ___�Դϴ�'���·� ������ ������ ����Ѵ�.
SELECT *
FROM course;
SELECT cname||' ������ ��米�� ��ȣ�� '|| pno ||'�Դϴ�.'
FROM course;

--3. �б��� ������ ������� �� ����¥������ �˻��Ѵ�.
SELECT cname ��������, st_num ����
FROM course;

--4. �л����� �������� ������ �����ȣ�� �˻��Ѵ�.
SELECT *
FROM student;
SELECT *
FROM score;
SELECT *
FROM course;

SELECT DISTINCT c.cname, c.cno
FROM student s, score sc, course c
WHERE s.sno = sc.sno
AND sc.cno = c.cno
ORDER BY c.cname;

--5. �� �μ� ���� ����� ���� ���� ������ �˻��Ѵ�
SELECT *
FROM emp;
SELECT ename �̸�, (sal*12+NVL(comm, 0)) ����
FROM emp
ORDER BY (sal*12+NVL(comm, 0)) DESC;

--6. �޿��� 10% �λ�� ��� �μ����� �� ����� ������ ���� ������ �˻��Ѵ�
SELECT ename �̸�, ((sal*1.1)*12)+NVL(comm, 0) "�޿��� 10% �λ� �� ����"
FROM emp
ORDER BY ((sal*1.1)*12)+NVL(comm, 0) DESC;

--7. ���ʽ��� 100% �λ�� ��� �������� �� ����� ������ ���� ������ �˻��Ѵ�
SELECT ename �̸�, ((sal*12)+2*(NVL(comm, 0)) "���ʽ��� 100% �λ� �� ����"
FROM emp
ORDER BY (sal*12)+NVL(comm, 0) DESC;


--8. �а��� �г⺰�� �л��� ������ ���������� �˻��Ѵ�
SELECT *
FROM student
ORDER BY major, syear, avr DESC;

--9. 4.5������ ȯ��� ������ �̿� �а����� �л��� ������ ���������� �˻��Ѵ�.
SELECT sname �̸�, major �а�, avr*1.125 "ȯ��� ����"
FROM student
ORDER BY major, avr DESC;

--10. �а� �� �г⺰�� ������ 2.0�̸��� �л��� ���� ���������� �˻��Ѵ�.



--11. �а����� �������� 1998�� ������ ������ ������ ������ ������ �˻��Ѵ�.

--12. ��� ������ �������� ���� ������ ���������� �˻��Ѵ�.

--13. ���ʽ��� �޿��� 10% �̻��� ����� �˻��Ѵ�.

--14. ȭ�а� �л� �߿� ���� '�縶'�� �л��� �˻��Ѵ�.

--15. ȭ�а� �л� �� 4.5 ȯ�� ������ 3.5 �̻��� �л��� �˻��Ѵ�
SELECT sname �̸�, syear �г�, major �а�, avr*1.125 "4.5 ȯ�� ����"
FROM student
WHERE (avr*1.125) >=3.5 AND major = 'ȭ��'
ORDER BY syear, avr DESC;


--16. ȭ�а� �̿� �а� �л��� ������ �� �а� �� �г⺰�� �˻��Ѵ�

--17. ������ ������ ���� �߿� ȭ�� ���� ������ �˻��Ѵ�(�̸��� 'ȭ��'�̶� ���ڿ��� �ִ� ����)

--18. 2000�� ���� ������ ���� �߿� ������ �α����� ������ �˻��Ѵ�.

--19. ������ 3.0���� 4.0������ �л��� �а����� �˻��Ѵ�

--20. ����, ȭ�а� �л� �� 4.5 ȯ�� ������ 3.5���� 4.0������ �л��� �˻��Ѵ�

--21. ����, ȭ�а� �л��� ������ �г⺰ ���������� �˻��Ѵ�

--22. ����, ȭ�а� ���� �߿� 1999�⿡�� 2000�� ���̿� ������ ������ ������ �������� �˻��Ѵ�.
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD:HH24:MI:ss';
--23. �������� �Ի��Ϻ��� ���� ������ ������ ����� �˻��Ѵ�.
SELECT*
FROM professor
WHERE hiredate 
--24. �۰� ������ ������ �����ϴ� �л��� �⸻��� ������ ���������� �˻��Ѵ�.

--25. �۰� ������ �����ϴ� ���񿡼� �� ������ A�� �л��� ����� ������ �Բ� �˻��Ѵ�.
SELECT * FROM student;
SELECT * FROM professor;
SELECT * FROM score;
SELECT * FROM scgrade;
SELECT * FROM course;

SELECT s.sname �̸�
FROM student s, professor p, scgrade sg, score sc, course c
WHERE p.pno = c.pno
AND c.cno = sc.cno
AND sc.sno = s.sno
WHERE sc.result BETWEEN sg.loscore AND sg.hiscore;






--26. ȭ�а� 1�г� �л����� �����ϴ� ������ ����� �˻��Ѵ�.
SELECT *
FROM student;

SELECT *
FROM professor;

SELECT *
FROM course;

SELECT *
FROM score;

SELECT DISTINCT p.pname �����̸�
FROM student s, professor p, course c, score sc
WHERE p.pno = c.pno
AND c.cno = sc.cno
AND sc.sno = s.sno
AND s.syear = 1;