-- 마당서점의 도서 판매 건수를 구하시오
SELECT bookid, COUNT(*)
FROM orders
GROUP BY bookid;
