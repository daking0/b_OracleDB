1. �л� �߿� ���������� �˻��ϼ���
SELECT DISTINCT s1.sno �й�, s1.sname �̸�
FROM student s1, student s2
WHERE s1.sname = s2.sname
AND s1.sno != s2.sno;

2. ��ü ���� ��ܰ� ������ ����ϴ� ������ �̸���
   �а� ������ �˻��ϼ���
SELECT p.pno ������ȣ, p.pname ������, c.cname �����
FROM professor p, course c
WHERE p.pno = c.pno(+)
ORDER BY p.section;

3. ��ϵ� ��� ����� ��� ������ ���������� �˻��ϼ���
SELECT c.cname, p.pname
FROM professor p, course c
WHERE c.pno = p.pno(+)
ORDER BY c.st_num;
