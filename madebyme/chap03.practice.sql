USE madangdb;
-- 마당서점의 고객이 요구하는 다음 질문에 대해 SQL문을 작성
-- 1) 도서번호가 1인 도서의 이름
SELECT bookname
FROM book
WHERE bookid = 1;

-- 2) 가격이 20000원 이상인 도서의 이름
SELECT bookname
FROM book
WHERE price >= 20000;

-- 3) 박지성의 총구매액 
SELECT c.name, SUM(saleprice) AS "총구매액"
FROM orders o, customer c
WHERE o.custid = c.custid AND o.custid = 1;

-- 4) 박지성이 구매한 도서의 수
SELECT c.name, COUNT(*) AS "구매한 도서의 수"
FROM orders o, customer c
WHERE o.custid = c.custid AND o.custid = 1;

-- 5) 박지성이 구매한 도서의 출판사 수
SELECT c.name, COUNT(b.publisher) AS "구매한 도서의 출판사 수"
FROM orders o, customer c, book b
WHERE o.custid = c.custid AND o.bookid = b.bookid AND o.custid = 1;

-- 6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT b.bookname, b.price, (b.price - o.saleprice) AS "정가와 판매가격의 차이"
FROM book b, orders o, customer c
WHERE b.bookid = o.bookid AND o.custid = c.custid AND o.custid = 1;

-- 7) 박지성이 구매하지 않은 도서의 이름
SELECT b.bookname
FROM orders o, customer c, book b
WHERE b.bookid = o.bookid AND o.custid = c.custid AND o.custid <> 1;


-- 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL문을 작성하시오.
-- 1) 마당서점 도서의 총개수
SELECT COUNT(*) AS "총개수"
FROM book;

-- 2) 마당서점에 도서를 출고하는 출판사의 총개수
SELECT COUNT(DISTINCT publisher)
FROM book;

-- 3) 모든 고객의 이름, 주소
SELECT name, address
FROM customer;

-- 4) 2024년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
SELECT orderid
FROM orders
WHERE orderdate BETWEEN '2024-07-04' AND '2024-07-07';

-- 5) 2024년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
SELECT orderid
FROM orders
WHERE orderdate NOT BETWEEN '2024-07-04' AND '2024-07-07';

-- 6) 성이 '김'씨인 고객의 이름과 주소
SELECT name, address
FROM customer
WHERE name LIKE '김%';

-- 7) 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT name, address
FROM customer
WHERE name LIKE '김%아';

-- 8) 주문하지 않은 고객의 이름(부속질의 사용)
SELECT name
FROM customer
WHERE custid NOT IN (SELECT custid FROM orders);

-- 9) 주문 금액의 총액과 주문의 평균 금액
SELECT SUM(saleprice), AVG(saleprice)
FROM orders;

-- 10) 고객의 이름과 고객별 구매액
SELECT c.name, SUM(saleprice)
FROM customer c, orders o
WHERE c.custid = o.custid
GROUP BY o.custid;

-- 11) 고객의 이름과 고객이 구매한 도서 목록
SELECT c.name, b.bookname
FROM customer c, orders o, book b
WHERE c.custid = o.custid AND o.bookid = b.bookid;

-- 12) 도서의 가격과 판매가격의 차이가 가장 많은 주문
SELECT MAX(b.price - o.saleprice)
FROM book b, orders o
WHERE b.bookid = o.bookid;

-- 13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT name
FROM customer c
WHERE (SELECT AVG(saleprice)
		FROM orders o1
		WHERE c.custid = o1.custid
		GROUP BY o1.custid) > (SELECT AVG(saleprice) FROM orders o2);

                    