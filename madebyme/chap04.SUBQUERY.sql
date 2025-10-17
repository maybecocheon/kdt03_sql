-- 가장 비싼 도서의 이름을 나타내시오.
SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT name
FROM customer
WHERE custid IN (SELECT custid
				FROM orders);
                
-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT b1.bookname
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price)
					FROM book b2
                    WHERE b1.publisher = b2.publisher);

-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 나타내시오.
SELECT orderid, saleprice
FROM orders
WHERE saleprice <= (SELECT AVG(saleprice)
					FROM orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 나타내시오.
SELECT orderid, custid, saleprice
FROM orders o1
WHERE saleprice > (SELECT AVG(saleprice)
					FROM orders o2
                    WHERE o1.custid = o2.custid);

-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
SELECT SUM(saleprice)
FROM orders
WHERE custid IN (SELECT custid
				FROM customer
                WHERE address LIKE '대한민국%');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 판매금액을 보이시오.

-- EXISTS 연산자를 사용하여 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
SELECT SUM(saleprice)
FROM orders
WHERE EXISTS (SELECT *
			FROM customer c
			WHERE address LIKE '%대한민국%' AND orders.custid = c.custid);
            
-- 마당서점의 고객별 판매액을 나타내시오. (고객이름과 고객별 판매액 출력)
SELECT (SELECT name FROM customer WHERE custid = o.custid), SUM(saleprice)
FROM orders o
GROUP BY o.custid;

-- orders 테이블에 각 주문에 맞는 도서이름을 입력하시오.

-- 고객번호가 2 이하인 고객의 판매액을 나타내시오(고객이름과 고객별 판매액 출력)
SELECT c.name, SUM(saleprice)
FROM orders o, (SELECT name, custid FROM customer WHERE custid <= 2) c
WHERE c.custid = o.custid
GROUP BY o.custid;