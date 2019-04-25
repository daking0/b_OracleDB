1. emp ���̺��� ��� ���� ���� �� ������ 5���� �����͸� �Է��ϼ���
SELECT * FROM emp;
DELETE FROM emp;

ALTER SESSION SET nls_date_format = 'YYYY-MM-DD';
DESC emp;
INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1001','�迬��','����',null,'1991-02-01',4500,520,10);

INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1002','���ֶ�','����',null,'1992-03-03',4100,330,20);

INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1003','�缱ȣ','����',null,'1995-02-01',4300,null,30);

INSERT INTO emp (eno, ename, job, mgr, hdate, sal, comm, dno)
VALUES ('1004','��ȣ��','����',null,'1992-09-05',4210,100,40);

SELECT * FROM emp;
COMMIT;

2. ��� �л��� ������ 4.5���� �������� �����ϼ���
SELECT * FROM student;

UPDATE student 
SET avr = avr *1.125;

3. ��� ������ �������ڸ� 100�� ������ �����ϼ���
SELECT * FROM professor;

UPDATE professor
SET hiredate = hiredate - 100;

4. ȭ�а� 2�г� �л��� ������ �����ϼ���

5. �������� ������ �����ϼ���

6. �Ϲ�ȭ�� ������ �����ϴ� �л��� ������ 4.5���� �������� ����
UPDATE student 
SET avr = avr *1.125
WHERE avr IN (SELECT avr
              FROM student
              JOIN score USING (sno)
              JOIN course USING (cno)
              WHERE cname = '�Ϲ�ȭ��');

7. ȭ�а� ������ ���� �߿� ������ 3���� �̸��� ������ ��� 3�������� ������ ���� Ȯ�� ����ϼ���
UPDATE course   
SET st_num = 3
WHERE cno IN (SELECT cno
             FROM course 
             JOIN professor USING (pno)
             WHERE section = 'ȭ��'
             AND st_num < 3
             );

ROLLBACK;

8. �л��� �⸻��� ������ ��� st_score ���̺� �����ϼ���
SELECT * FROM st_score;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM score;


INSERT /*+ APPEND */ INTO st_score 
NOLOGGING (sno, sname, major, syear, cno, cname, result)
SELECT s.sno, s.sname, s.major, s.syear, co.cno, cname, result
FROM student s, score sc, courses co
WHERE s.sno = sc.sno
AND sc.cno = co.cno;

COMMIT;

