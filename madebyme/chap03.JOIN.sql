USE madangdb;

-- customer 테이블과 orders 테이블 조건 없이 조인
SELECT *
FROM customer, orders;

-- 고객과 고객의 주문에 관한 데이터를 모두 나타내시오.
SELECT *
FROM customer c, orders o
WHERE c.custid = o.custid;

-- 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 나타내시오.
SELECT *
FROM customer c, orders o
WHERE c.custid = o.custid
ORDER BY c.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT c.name, o.saleprice
FROM customer c, orders o 
WHERE c.custid = o.custid;

-- 고객별로 주문한 모든 도서의 총판매액을 구하고, 고객별로 정렬하시오.
SELECT c.custid, c.name, COUNT(*), SUM(saleprice)
FROM customer c, orders o
WHERE c.custid = o.custid
GROUP BY c.custid
ORDER BY c.custid;

-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT c.name, b.bookname
FROM orders o, customer c, book b
WHERE o.bookid = b.bookid AND o.custid = c.custid;

-- 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT c.name, b.bookname
FROM orders o, customer c, book b
WHERE o.bookid = b.bookid AND o.custid = c.custid AND b.price = 20000;

-- 도서를 구매하지 않은 고객을 포함해 고객의 이름과 고객이 주문한 도서의 판매가격 합을 구하시오.
SELECT c.custid, c.name, COUNT(*), IFNULL(SUM(saleprice), 0)
FROM customer c LEFT OUTER JOIN orders o ON c.custid = o.custid
GROUP BY c.custid
ORDER BY c.custid;