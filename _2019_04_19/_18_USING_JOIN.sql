--1) ���� ���� ����� ����
--
--2) ERD(Entity-Relationship Diagram) ��ǥ�� ����
--   ���̺��� �������踦 �ٷ� �� �� �ִ�.
--   => Join�� � �÷����� �ؾ� �ϴ� �� �� �� �ִ�.
--3) ����
--   a) step1. �������� �˻����� ������ ã�´�.
--             (������ �ܾ�� ã�´�.)
--      step2. SELECT��, WHERE��, ORDER BY���� �ѱ۷� �ϼ��Ѵ�.
--      step3. SELECT���� WHERE���� ���뿡 ���� ������
--             �˻��� ���̺��� ã�´�.
--      step4. ���̺��� �˻����� ���ǿ� �ش��ϴ� �÷��� ã�´�.
--      step5. ���̺��� ���踦 Ȯ���Ѵ�.
--             ���̺�� ���̺��� ������谡 ���� ���� �ٸ� �߰� ���̺���
--             �߰��ϰ� �ȴ�.
--      step6. ���� ������ ����Ѵ�.
--      step7. ��ü ������ �ٵ�´�.
--   b) ����
--      ���� : ȭ�а� �л��� �Ϲ�ȭ�� �⸻��� ������ �˻��Ѵ�.
--      step1. �˻� ���� ������ ã�´�.
--             �˻� ��� : �⸻��� ����
--             ����     : ȭ�а� �л�
--                       �Ϲ�ȭ�� ����

       step2. SELECT��, WHERE��, ORDER BY ���� �ѱ۷� �ϼ��Ѵ�.
       SELECT �⸻��� ����
       FROM
       WHERE ȭ�а� �л� AND �Ϲ�ȭ�� ����
       
       step3. SELECT���� WHERE���� ���뿡 ���� ������
              �˻��� ���̺��� ã�´�.
              �л� : student
              ���� : course
              �⸻��� ���� : score
              
       step4. ���̺��� �˻����� ���ǿ� �ش��ϴ� �÷��� ã�´�.
              �˻� ��� : �⸻��� ���� score.result
              ����     : ȭ�а� �л� student.major
                        �Ϲ�ȭ�� ���� course.cname
       SELECT result
       FROM score, course, student
       WHERE major = 'ȭ��' AND cname = '�Ϲ�ȭ��';
       
       step5. ���̺��� ���踦 Ȯ���Ѵ�.
       <student> - sno - <score> - cno - <course>
       
       step6. ���� ������ ����Ѵ�.
       SELECT result
       FROM score, course, student
       WHERE student.sno = score.sno
       AND score.cno = course.cno
       AND major = 'ȭ��' AND cname = '�Ϲ�ȭ��';
       
       step7. ��ü ������ �ٵ�´�.
       SELECT major, cname, sname, result
       FROM score, course, student
       WHERE student.sno = score.sno
       AND score.cno = course.cno
       AND major = 'ȭ��' AND cname = '�Ϲ�ȭ��';

-- c) ����
--    ���� : 4�г� �л��� �����ϴ� ������ �����ϴ� ������ ����� �˻��Ѵ�.
SELECT *
FROM student;
SELECT *
FROM course;
SELECT *
FROM score;
SELECT *
FROM professor;

SELECT DISTINCT(p.pno) ������ȣ, p.pname �����̸�, s.syear �г�
FROM student s, course c, professor p, score sc
WHERE s.sno = sc.sno
AND sc.cno = c.cno
AND c.pno = p.pno
AND s.syear = 4;

-- 4�г� �л��� �����ϴ� ������ �����ϴ� ������ ����� �˻��Ѵ�.
SELECT
  distinct(professor.pno), professor.pname
FROM
  professor, student, course, score
WHERE
  professor.pno = course.pno
  AND course.cno = score.cno
  AND score.sno = student.sno
  AND student.syear = 4;
  
  
--1) �ڱ� ���� Join(Self Join)
--
--2) ���
--SELECT ����1.�÷�1...����2.�÷�1...
--FROM ���̺� ����1, ���̺� ����2...
--WHERE ����_����
--AND �Ϲ�_����
-- a) ���� ���̺��� �ڱ� ������ ���� �����Ѵ�.
-- b) ����1�� ����2�� ���� ���̺� ���� ����������
--    ���� ������ ���̺�ó�� ����Ѵ�.
-- c) �ϳ��� ���̺� ������ �ٸ��� �ؼ� ��ġ ���� ����
--    ���̺� �����ϴ� ��ó�� ������ �����Ѵ�.
-- d) ���� �ٸ� ������ ������ ���̺�� �����ϸ� ������
--    ������̳� �����ΰ� �����ϴ�.
-- e) ���̺� �ݵ�� ������ �ٿ��� ������ ������ �̿���
--    �����̶� �θ��⵵ �Ѵ�.
    
�� ����� �޸��ϴ� ����� �̸��� �˻��Ѵ�.
SELECT e1.eno ���, e1.ename �̸�, e2.ename ������
FROM emp4 e1, emp4 e2
WHERE e1.mgr = e2.eno;

--1) �ܺ�����
--SELECT ���̺�1.�÷�, ...���̺�2.�÷�...
--FROM ���̺�1, ���̺�2...
--WHERE ����_����(+)
--AND �Ϲ�_����
-- a) ���� ���ǿ� ��ġ���� �ʴ� �����͸� ������ش�.
-- b) ���� ������� �ؼ��� �� ���ظ� �����ϱ� ���� ����̴�.
-- c) '+' ��ȣ�� �����Ͱ� ������ �ʿ� ����Ѵ�.

--�� �μ����� ����� �˻��Ѵ�. (�Ϲ�����)
SELECT d.dno �μ���ȣ, dname �μ���, ename �����
FROM dept d, emp e
WHERE d.dno = e.dno 
ORDER BY �μ���ȣ;

dept ���̺��� 50�� �μ��� ����������
emp���̺��� 50���μ��� ����� ����.
�̷� ��� �����Ͱ� ������ ��(emp.dno)��
��������(+)��ȣ�� �߰��Ѵ�.

--�� �μ����� ����� �˻��Ѵ�. (�ܺ�����)
SELECT d.dno �μ���ȣ, dname �μ���, ename �����
FROM dept d, emp e
WHERE d.dno = e.dno(+)
ORDER BY �μ���ȣ;




