-- ���̺� Ȯ��
SELECT *
FROM tab;

--���̺� ���� Ȯ��
DESC datetest;

--������ Ȯ��
SELECT *
FROM datetest;

--����
SELECT *
FROM datetest
ORDER BY hdate DESC;

--���� �˻�
SELECT *
FROM datetest
WHERE hdate BETWEEN '2000/01/01' AND '2010/12/31'
ORDER BY hdate;