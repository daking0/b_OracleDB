1. ������ȣ�� 1�� ������ �̸�
SELECT bookname
FROM book
WHERE bookid = '1';

2. ������ 20,000�� �̻��� ������ �̸�
SELECT bookname
FROM book
WHERE price >= 20000;

3. �������� �� ���ž�
SELECT SUM(saleprice)
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '������');

4. �������� ������ ������ ��
SELECT COUNT(custid)
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '������');

5. �������� ������ ������ ���ǻ� ��
SELECT COUNT(publisher)
FROM book
JOIN orders USING (bookid)
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '������');

6. �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
SELECT bookname, price, (price - saleprice)
FROM book
JOIN orders USING (bookid)
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '������');

7. ���缭�� ������ �� ����
SELECT COUNT(bookid) 
FROM book;

SELECT * 
FROM book
UNION ALL
SELECT *
FROM imported_book;

SELECT * 
FROM (SELECT * FROM book
      UNION 
      SELECT *
      FROM imported_book);

8. ���缭���� ������ ����ϴ� ���ǻ��� �� ����
SELECT COUNT(DISTINCT publisher) 
FROM book;

9. ��� ���� �̸�, �ּ�
SELECT name, address
FROM customer;

10. 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
SELECT orderid
FROM orders 
WHERE orderdate BETWEEN '2014/07/04' AND '2014/07/07';

11. 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
SELECT orderid
FROM orders 
WHERE orderdate NOT IN('2014/07/04','2014/07/07');
--AND orderdate NOT IN('2014/07/07');

12. ���� '��'���� ���� �̸��� �ּ�
SELECT name, address
FROM customer
WHERE name LIKE '��%';

13. ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
SELECT name, address
FROM customer
WHERE name LIKE '��%��';

14. �ֹ����� ���� ���� �̸�(�����������)
SELECT name 
FROM orders
JOIN customer USING (custid)
WHERE custid NOT IN (SELECT DISTINCT custid FROM orders NATURAL JOIN customer);

SELECT name
FROM customer
WHERE custid NOT IN (SELECT custid FROM orders);

SELECT name
FROM customer
WHERE custid NOT IN (SELECT custid
                     FROM customer
                     NATURAL JOIN orders);

15. �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT SUM(saleprice), AVG(saleprice)
FROM orders;

16. ���� �̸��� ���� ���ž�
SELECT name, SUM(saleprice)
FROM customer 
JOIN orders USING(custid)
GROUP BY name;

17. ���� �̸��� ���� ������ ���� ���
SELECT name, bookname
FROM customer
JOIN orders USING(custid)
JOIN book USING(bookid);
--WHERE custid IN (SELECT custid FROM orders);

18. ������ ����(Book���̺�)�� �ǸŰ���(Orders���̺�)�� ���̰� ���� ���� �ֹ�
SELECT *
FROM orders
JOIN book USING (bookid)
WHERE price-saleprice = (SELECT MAX(price -saleprice)
                          FROM orders
                           JOIN book USING (bookid)) ;

19. ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT name
FROM customer
JOIN orders USING(custid)
GROUP BY name
HAVING AVG(saleprice) > (SELECT AVG(saleprice) FROM orders);

