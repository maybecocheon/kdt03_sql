USE madangdb;

-- 고객별로 주문한 도서의 총수량과 총판매액을 구하시오
SELECT custid, COUNT(*), SUM(saleprice)
FROM orders
GROUP BY custid;

-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총수량을 구하시오. 단, 2권 이상 구매한 고객에 대해서만 구하시오.
SELECT custid, COUNT(*) AS "총수량"
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2;

-- 조인
-- 고객별로 주문한 도서의 총수량과 총판매액을 구하시오
SELECT name, COUNT(*), SUM(saleprice)
FROM orders, customer
WHERE orders.custid = customer.custid
GROUP BY orders.custid;

-- 출판사별로 주문한 도서의 총수량과 총판매액을 구하시오
SELECT publisher, COUNT(*), SUM(saleprice)
FROM orders, book
WHERE orders.bookid = book.bookid
GROUP BY book.publisher;