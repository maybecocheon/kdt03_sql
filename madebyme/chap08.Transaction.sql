SELECT * FROM book;
SELECT * FROM orders;

START TRANSACTION;

UPDATE book
SET price = 1000
WHERE bookid = 1;

UPDATE orders
SET saleprice = 1000
WHERE orderid = 1;

ROLLBACK; -- transaction 되돌리기
COMMIT; -- transaction 수행하기 (되돌릴 수 없음)

-- 새로운 transaction 생성
-- 동시성 제어
START TRANSACTION;

UPDATE book
SET price = 1000
WHERE bookid = 1;

UPDATE book
SET price = 5000
WHERE bookid = 2;

ROLLBACK;