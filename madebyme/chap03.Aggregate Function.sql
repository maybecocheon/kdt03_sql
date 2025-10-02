-- 고객이 주문한 도서의 총판매액을 구하시오
SELECT IFNULL(SUM(saleprice), 0)
FROM orders;

-- 2번 김연아 고객이 주문한 도서의 총판매액을 구하시오
SELECT IFNULL(SUM(saleprice), 0)
FROM orders
WHERE custid = 2;

-- 5번 박세리 고객이 주문한 도서의 총판매액을 구하시오
SELECT IFNULL(SUM(saleprice), 0)
FROM orders
WHERE custid = 5;

-- 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 구하시오
SELECT IFNULL(SUM(saleprice), 0), ROUND(IFNULL(AVG(saleprice), 0), 1), IFNULL(MIN(saleprice), 0), IFNULL(MAX(saleprice), 0)
FROM orders; -- orders2 테이블 쓰면 값 0 나옴