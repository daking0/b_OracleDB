--1. �ۻ� ������ �����ϴ� ������ �˻��Ѵ�.
SELECT *
FROM professor
WHERE pname IN('�۰�');

--2. ȭ�� ���� ������ �����ϴ� ������ ����� �˻��Ѵ�.
SELECT *
FROM course;

SELECT *
FROM professor;

SELECT p.pno ����, p.pname �̸�, c.cname ����� 
FROM professor p, course c
WHERE p.pno = c.pno AND c.cname LIKE '%ȭ��%'; 

--3. ������ 2������ ����� �̸� �����ϴ� ������ �˻��Ѵ�.
SELECT p.pno ����, p.pname �̸�, c.cname ����� , c.st_num ����
FROM professor p, course c
WHERE p.pno = c.pno AND c.st_num = 2; 

--4. ȭ�а� ������ �����ϴ� ������ �˻��Ѵ�.
SELECT p.pname �̸�, c.cname ����
FROM professor p, course c
WHERE c.pno = p.pno AND p.section = 'ȭ��';