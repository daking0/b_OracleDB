*NATURAL JOIN or Using
1.�۰������� �����ϴ� ������ �˻��ϼ���

SELECT *
FROM course;
select *
from professor;

select *
from course
natural join professor
where pname='�۰�';

2.ȭ�� ���� ������ �����ϴ� ������ ����� �˻��ϼ���

select *
from professor
join course using (pno)
where 

3.������ 2������ ����� �̸� �����ϴ� ������ �˻��ϼ���
