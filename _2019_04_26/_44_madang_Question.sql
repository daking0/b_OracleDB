1. �������� �������� ���� ������ �̸�
SELECT bookname
FROM book
JOIN orders USING(bookid)
WHERE custid != '1';

2. �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name
FROM book
JOIN orders USING(bookid)
JOIN customer USING(custid)
WHERE publisher IN (SELECT publisher FROM book JOIN orders USING(bookid) JOIN customer USING(custid)  WHERE name='������')
AND name !='������';

3. 2�� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT DISTINCT name 
FROM book
JOIN orders USING(bookid)
JOIN customer USING(custid)
WHERE custid IN (SELECT custid FROM orders 
                 GROUP BY custid
                 HAVING COUNT(publisher) >=2); 

SELECT DISTINCT name 
FROM book
JOIN orders USING(bookid)
JOIN customer USING(custid)
GROUP BY name
HAVING COUNT(DISTINCT publisher) >=2;

SELECT 
  custid, name, COUNT(DISTINCT publisher)
FROM 
  orders
  JOIN customer USING(custid)
  JOIN book USING(bookid)
GROUP BY 
  custid, name
HAVING 
  COUNT(DISTINCT publisher) >= 2
ORDER BY 
  custid;


4. ��ü ���� 30% �̻��� ������ ����
SELECT bookname, COUNT(bookname)
FROM book
JOIN orders USING(bookid)
JOIN customer USING(custid)
GROUP BY bookname
HAVING COUNT(bookname)>= (SELECT COUNT(custid)*0.3
                          FROM customer);

5. ���� �����ͺ��̽��� �����ϼ���
���� cinema
�����ȣ   �����̸�   ��ġ
-------------------------
1          �Ե�     ���
2          �ް�     ����
3          ����     ���

�󿵰� theater1 
�����ȣ    �󿵰���ȣ    ��ȭ����     ����      �¼���
----------------------------------------------------
1             1       ����� ��ȭ    15000     48
3             1       ���� ��ȭ       7500    120
3             2       ��մ� ��ȭ     8000    110

���� reservation
�����ȣ    �󿵰���ȣ    ����ȣ     �¼���ȣ   ��¥
----------------------------------------------------
3              2          3           15      2014-09-01
3              1          4           16      2014-09-01
1              1          9           48      2014-09-01

�� customer1
����ȣ      �̸�        �ּ�
---------------------------------------
3           ȫ�浿       ����
4           ��ö��       ���
9           �ڿ���       ����


CREATE TABLE cinema (
no     NUMBER,
name   VARCHAR2 (20),
location  VARCHAR2 (100)
);

INSERT INTO cinema (no,name,location)
VALUES (1,'�Ե�','���');
INSERT INTO cinema (no,name,location)
VALUES (2,'�ް�','����');
INSERT INTO cinema (no,name,location)
VALUES (3,'����','���');
COMMIT;
--

CREATE TABLE theater1 (
tno     NUMBER,
mname   VARCHAR2 (20),
price  NUMBER ,
seat  NUMBER 
);

INSERT INTO theater1 (tno,mname,price,seat)
VALUES (1,'����� ��ȭ',15000,48);
INSERT INTO theater1 (tno,mname,price,seat)
VALUES (2, '���� ��ȭ', 7500,120);
INSERT INTO theater1 (tno,mname,price,seat)
VALUES (3,'��մ� ��ȭ',8000,110);
COMMIT;

CREATE TABLE reservation (
no     NUMBER,
tno   NUMBER,
cno   NUMBER,
seat  NUMBER ,
tdate  DATE DEFAULT sysdate
);

INSERT INTO reservation (no,tno,cno,seat,tdate)
VALUES(3,2,3,15,'2014-09-01');
INSERT INTO reservation (no,tno,cno,seat,tdate)
VALUES(3,1,4,16,'2014-09-01');
INSERT INTO reservation (no,tno,cno,seat,tdate)
VALUES(1,1,9,48,'2014-09-01');

COMMIT;



CREATE TABLE customer1 (
cno     NUMBER,
cname   VARCHAR2 (20),
address  VARCHAR2 (20)
);

INSERT INTO customer1 (cno,cname,address)
VALUES (3,'ȫ�浿','����');
INSERT INTO customer1 (cno,cname,address)
VALUES (4, '��ö��', '���');
INSERT INTO customer1 (cno,cname,address)
VALUES (9,'�ڿ���','����');

COMMIT;

DROP TABLE theater1; --���� 1��) ������ �ִ� theater 1�� �����Ѵ� 

CREATE TABLE theater1 ( --���� 2��) ���� �ڵ� ������Ʈ �����ϱ� �̰ɷ� ���̺� �����ϼ� 
no      NUMBER,
tno     NUMBER,
mname   VARCHAR2 (20),
price  NUMBER ,
seat  NUMBER 
);

INSERT INTO theater1 (no,tno,mname,price,seat) --���� 3)�� ���� �� ������Ʈ �����ϱ� �̰͵�� �ٽ� ������ �ֱ� 
VALUES (1,1,' ����� ��ȭ',15000,48);
INSERT INTO theater1 (no,tno,mname,price,seat)
VALUES (3,2, '���� ��ȭ', 7500,120);
INSERT INTO theater1 (no,tno,mname,price,seat)
VALUES (3,3,'��մ� ��ȭ',8000,110);
COMMIT;
SELECT * -- ���� 4) ���� ������ Ȯ�� �ϱ� 
FROM theater1;

SELECT *
FROM cinema;
SELECT *
FROM theater1;
SELECT *
FROM reservation;
SELECT *
FROM customer1;


6. ��� ������ �̸��� ��ġ�� ���̽ÿ�
SELECT name, location
FROM cinema;

7. '���'�� �ִ� ������ ���̽ÿ�
SELECT name, location
FROM cinema
WHERE location = '���';

8. '���'�� ��� ���� �̸��� ������������ ���̽ÿ�
SELECT cname
FROM customer1
WHERE address = '���';

9. ������ 8,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�
SELECT no, tno, mname
FROM theater1
WHERE price <= '8000';

10. ���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�
SELECT cname, location , address
FROM customer1
NATURAL JOIN cinema
WHERE address = location;

11. ������ ���� ��ΰ�?
SELECT COUNT(name) �����
FROM cinema;

12. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
SELECT AVG(price) ��հ���
FROM theater1;

13. 2014�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?
SELECT COUNT(cno)
FROM reservation
WHERE tdate = '14/09/01';

14. '����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�
SELECT mname
FROM theater1
WHERE no = (SELECT no 
            FROM cinema
            WHERE name = '����');

15. '����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�
SELECT *
FROM cinema;
SELECT *
FROM theater1;
SELECT *
FROM reservation;
SELECT *
FROM customer1;

SELECT DISTINCT cname
FROM customer1
NATURAL JOIN reservation
NATURAL JOIN cinema
NATURAL JOIN theater1
WHERE name = '����';
 
            
16. '����'������ ��ü ������ ���̽ÿ�
SELECT SUM(price)
FROM theater1
WHERE no = (SELECT no 
            FROM cinema
            WHERE name = '����');

17. ���庰 �󿵰� ���� ���̽ÿ�
SELECT no,name,COUNT(tno)
FROM theater1
NATURAL JOIN cinema
GROUP BY no,name;

18. '���'�� �ִ� ������ �󿵰��� ���̽ÿ�
SELECT *
FROM theater1
WHERE no IN (SELECT no 
             FROM cinema 
             WHERE location = '���');

19. 2014�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�
SELECT *
FROM cinema;
SELECT *
FROM theater1;
SELECT *
FROM reservation;
SELECT *
FROM customer1;

SELECT name, AVG(no) 
FROM cinema
NATURAL JOIN reservation
NATURAL JOIN theater1
WHERE tdate = '14/09/01'
GROUP BY name;


20. 2014�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�
SELECT *
FROM cinema;
SELECT *
FROM theater1;
SELECT *
FROM reservation;
SELECT *
FROM customer1;

SELECT mname
FROM theater1
NATURAL JOIN reservation
WHERE seat IN (SELECT MAX(seat) 
            FROM theater1
            NATURAL JOIN reservation
            WHERE tdate = '14/09/01')
AND tdate = '14/09/01';

--�� seat(�¼���)���� �ؾ��ϳ���......��϶�;��������������

--SELECT mname
--FROM theater1
--NATURAL JOIN reservation
--WHERE tno IN (SELECT MAX(tno) 
--            FROM theater1
--            NATURAL JOIN reservation
--            WHERE tdate = '14/09/01')
--AND tdate = '14/09/01';



21. �� ���̺� �����͸� �����ϴ� INSERT ���� �ϳ��� ������� ���ÿ�
INSERT INTO cinema (no,name,location)
VALUES (4,'CGV','����');
SELECT *
FROM cinema;

INSERT INTO theater1 (tno,mname,price,seat)
VALUES (4,'���� ��ȭ',5000,40);
SELECT *
FROM theater1;

INSERT INTO reservation (no,tno,cno,seat,tdate)
VALUES(4,4,2,54,'2014-09-02');
SELECT *
FROM reservation;

INSERT INTO customer1 (cno,cname,address)
VALUES (4,'ȫ�ٰ�','����');
SELECT *
FROM customer1;

22. ��ȭ�� ������ 10%�� �λ��Ͻÿ�
UPDATE theater1
SET price = price * 1.1;

ROLLBACK;





