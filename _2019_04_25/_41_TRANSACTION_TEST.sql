--[���� 2]

4) ����1�� COMMIT�� �Ϸ����� �ʾ����Ƿ� Undo Segment(��, ���� ���� ��)�� �����ش�.
SELECT sno, sname, avr
FROM student
WHERE sname = '����';

6) ���� 1�� COMMIT�� �Ϸ��Ͽ��� ���� 2���� ������ ������ Ȯ���Ѵ�
SELECT sno, sname, avr
FROM student
WHERE sname = '����';

*Ʈ����ǿ� ���� ��� ���� Ȯ��

3) ������ �а��� �˻��Ѵ�
   ���� 1�� �а��� '��ȸ'�� �����Ͽ����� COMMIT �� ���� �ʾұ� ������
   ���� 2�� ������ ������ 'ȭ��'���� ��Ÿ���� �ȴ�
SELECT sno, sname, major
FROM student
WHERE sname = '����';

4) ���� 1�� ���� ����� �ɾ���� ���¿���
   ���� 2�� �а��� '����'�� ������ �õ��Ѵ�.
   �׷��� ���� 1�� ��������� �ɾ���ұ� ������
   ����� �Ϸ���� ���ϰ� ��� ���¿� �����Ѵ�
UPDATE student
SET major = '����'
WHERE sname = '����';

7) ���� 1�� COMMIT �Ͽ����Ƿ� ��Ⱑ Ǯ��
   ������ ������ �����Ͽ���.
   ������ ���� COMMIT �� �Ϸ���� ���� �����̹Ƿ� Undo Segment���� �����͸� �������� �ȴ�.
   �׸��� ���� 2�� ������ �࿡ ���� ����� �ɾ���� �����̴�.
   
SELECT sno, sname, major
FROM student
WHERE sname = '����';