1. 도서번호가 1인 도서의 이름
SELECT bookname
FROM book
WHERE bookid = '1';

2. 가격이 20,000원 이상인 도서의 이름
SELECT bookname
FROM book
WHERE price >= 20000;

3. 박지성의 총 구매액
SELECT SUM(saleprice)
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '박지성');

4. 박지성이 구매한 도서의 수
SELECT COUNT(custid)
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '박지성');

5. 박지성이 구매한 도서의 출판사 수
SELECT COUNT(publisher)
FROM book
JOIN orders USING (bookid)
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '박지성');

6. 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT bookname, price, (price - saleprice)
FROM book
JOIN orders USING (bookid)
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '박지성');

7. 마당서점 도서의 총 개수
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

8. 마당서점에 도서를 출고하는 출판사의 총 개수
SELECT COUNT(DISTINCT publisher) 
FROM book;

9. 모든 고객의 이름, 주소
SELECT name, address
FROM customer;

10. 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
SELECT orderid
FROM orders 
WHERE orderdate BETWEEN '2014/07/04' AND '2014/07/07';

11. 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
SELECT orderid
FROM orders 
WHERE orderdate NOT IN('2014/07/04','2014/07/07');
--AND orderdate NOT IN('2014/07/07');

12. 성이 '김'씨인 고객의 이름과 주소
SELECT name, address
FROM customer
WHERE name LIKE '김%';

13. 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT name, address
FROM customer
WHERE name LIKE '김%아';

14. 주문하지 않은 고객의 이름(서브쿼리사용)
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

15. 주문 금액의 총액과 주문의 평균 금액
SELECT SUM(saleprice), AVG(saleprice)
FROM orders;

16. 고객의 이름과 고객별 구매액
SELECT name, SUM(saleprice)
FROM customer 
JOIN orders USING(custid)
GROUP BY name;

17. 고객의 이름과 고객이 구매한 도서 목록
SELECT name, bookname
FROM customer
JOIN orders USING(custid)
JOIN book USING(bookid);
--WHERE custid IN (SELECT custid FROM orders);

18. 도서의 가격(Book테이블)과 판매가격(Orders테이블)의 차이가 가장 많은 주문
SELECT *
FROM orders
JOIN book USING (bookid)
WHERE price-saleprice = (SELECT MAX(price -saleprice)
                          FROM orders
                           JOIN book USING (bookid)) ;

19. 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT name
FROM customer
JOIN orders USING(custid)
GROUP BY name
HAVING AVG(saleprice) > (SELECT AVG(saleprice) FROM orders);

