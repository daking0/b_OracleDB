1. 박지성이 구매하지 않은 도서의 이름
SELECT bookname
FROM book
JOIN orders USING(bookid)
WHERE custid != '1';

2. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT name
FROM book
JOIN orders USING(bookid)
JOIN customer USING(custid)
WHERE publisher IN (SELECT publisher FROM book JOIN orders USING(bookid) JOIN customer USING(custid)  WHERE name='박지성')
AND name !='박지성';

3. 2개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
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


4. 전체 고객의 30% 이상이 구매한 도서
SELECT bookname, COUNT(bookname)
FROM book
JOIN orders USING(bookid)
JOIN customer USING(custid)
GROUP BY bookname
HAVING COUNT(bookname)>= (SELECT COUNT(custid)*0.3
                          FROM customer);

5. 극장 데이터베이스를 생성하세요
극장 cinema
극장번호   극장이름   위치
-------------------------
1          롯데     잠실
2          메가     강남
3          대한     잠실

상영관 theater1 
극장번호    상영관번호    영화제목     가격      좌석수
----------------------------------------------------
1             1       어려운 영화    15000     48
3             1       멋진 영화       7500    120
3             2       재밌는 영화     8000    110

예약 reservation
극장번호    상영관번호    고객번호     좌석번호   날짜
----------------------------------------------------
3              2          3           15      2014-09-01
3              1          4           16      2014-09-01
1              1          9           48      2014-09-01

고객 customer1
고객번호      이름        주소
---------------------------------------
3           홍길동       강남
4           김철수       잠실
9           박영희       강남


CREATE TABLE cinema (
no     NUMBER,
name   VARCHAR2 (20),
location  VARCHAR2 (100)
);

INSERT INTO cinema (no,name,location)
VALUES (1,'롯데','잠실');
INSERT INTO cinema (no,name,location)
VALUES (2,'메가','강남');
INSERT INTO cinema (no,name,location)
VALUES (3,'대한','잠실');
COMMIT;
--

CREATE TABLE theater1 (
tno     NUMBER,
mname   VARCHAR2 (20),
price  NUMBER ,
seat  NUMBER 
);

INSERT INTO theater1 (tno,mname,price,seat)
VALUES (1,'어려운 영화',15000,48);
INSERT INTO theater1 (tno,mname,price,seat)
VALUES (2, '멋진 영화', 7500,120);
INSERT INTO theater1 (tno,mname,price,seat)
VALUES (3,'재밌는 영화',8000,110);
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
VALUES (3,'홍길동','강남');
INSERT INTO customer1 (cno,cname,address)
VALUES (4, '김철수', '잠실');
INSERT INTO customer1 (cno,cname,address)
VALUES (9,'박영희','강남');

COMMIT;

DROP TABLE theater1; --순서 1번) 기존에 있던 theater 1을 삭제한다 

CREATE TABLE theater1 ( --순서 2번) 새로 코드 업데이트 했으니까 이걸로 테이블 생성하셈 
no      NUMBER,
tno     NUMBER,
mname   VARCHAR2 (20),
price  NUMBER ,
seat  NUMBER 
);

INSERT INTO theater1 (no,tno,mname,price,seat) --순서 3)번 내용 다 업데이트 했으니까 이것들로 다시 데이터 넣기 
VALUES (1,1,' 어려운 영화',15000,48);
INSERT INTO theater1 (no,tno,mname,price,seat)
VALUES (3,2, '멋진 영화', 7500,120);
INSERT INTO theater1 (no,tno,mname,price,seat)
VALUES (3,3,'재밌는 영화',8000,110);
COMMIT;
SELECT * -- 순서 4) 제값 들어갔는지 확인 하기 
FROM theater1;

SELECT *
FROM cinema;
SELECT *
FROM theater1;
SELECT *
FROM reservation;
SELECT *
FROM customer1;


6. 모든 극장의 이름과 위치를 보이시오
SELECT name, location
FROM cinema;

7. '잠실'에 있는 극장을 보이시오
SELECT name, location
FROM cinema
WHERE location = '잠실';

8. '잠실'에 사는 고객의 이름을 오름차순으로 보이시오
SELECT cname
FROM customer1
WHERE address = '잠실';

9. 가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오
SELECT no, tno, mname
FROM theater1
WHERE price <= '8000';

10. 극장 위치와 고객의 주소가 같은 고객을 보이시오
SELECT cname, location , address
FROM customer1
NATURAL JOIN cinema
WHERE address = location;

11. 극장의 수는 몇개인가?
SELECT COUNT(name) 극장수
FROM cinema;

12. 상영되는 영화의 평균 가격은 얼마인가?
SELECT AVG(price) 평균가격
FROM theater1;

13. 2014년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
SELECT COUNT(cno)
FROM reservation
WHERE tdate = '14/09/01';

14. '대한'극장에서 상영된 영화제목을 보이시오
SELECT mname
FROM theater1
WHERE no = (SELECT no 
            FROM cinema
            WHERE name = '대한');

15. '대한'극장에서 영화를 본 고객의 이름을 보이시오
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
WHERE name = '대한';
 
            
16. '대한'극장의 전체 수입을 보이시오
SELECT SUM(price)
FROM theater1
WHERE no = (SELECT no 
            FROM cinema
            WHERE name = '대한');

17. 극장별 상영관 수를 보이시오
SELECT no,name,COUNT(tno)
FROM theater1
NATURAL JOIN cinema
GROUP BY no,name;

18. '잠실'에 있는 극장의 상영관을 보이시오
SELECT *
FROM theater1
WHERE no IN (SELECT no 
             FROM cinema 
             WHERE location = '잠실');

19. 2014년 9월 1일의 극장별 평균 관람 고객 수를 보이시오
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


20. 2014년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오
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

--왜 seat(좌석수)으로 해야하나요......흄니라;ㅁㄴㅇㄹㄴㅁㅇ

--SELECT mname
--FROM theater1
--NATURAL JOIN reservation
--WHERE tno IN (SELECT MAX(tno) 
--            FROM theater1
--            NATURAL JOIN reservation
--            WHERE tdate = '14/09/01')
--AND tdate = '14/09/01';



21. 각 테이블에 데이터를 삽입하는 INSERT 문을 하나씩 실행시켜 보시오
INSERT INTO cinema (no,name,location)
VALUES (4,'CGV','신촌');
SELECT *
FROM cinema;

INSERT INTO theater1 (tno,mname,price,seat)
VALUES (4,'쉬운 영화',5000,40);
SELECT *
FROM theater1;

INSERT INTO reservation (no,tno,cno,seat,tdate)
VALUES(4,4,2,54,'2014-09-02');
SELECT *
FROM reservation;

INSERT INTO customer1 (cno,cname,address)
VALUES (4,'홍다경','신촌');
SELECT *
FROM customer1;

22. 영화의 가격을 10%씩 인상하시오
UPDATE theater1
SET price = price * 1.1;

ROLLBACK;





