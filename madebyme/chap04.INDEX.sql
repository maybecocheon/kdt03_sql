USE madangdb;

-- 인덱스 없으면 시간복잡도 높아짐 (빨간색)
-- 인덱스 있으면 시간복잡도 낮아짐 (주황색)
SELECT *
FROM book
WHERE price > 5000
-- ORDER BY 붙이면 인덱스 적용 안 돼서 빨간색 뜸
limit 5;

-- 기본키와 외래키는 자동으로 인덱스 지정됨 (파란색)
SELECT *
FROM book
WHERE bookid = 1;

-- 보통 orderdate 같은 날짜는 desc 정렬해서 인덱스 지정해 둠
SELECT *
FROM orders
WHERE orderdate
limit 1;

-- Book 테이블의 bookname 열을 대상으로 인덱스 ix_Book을 생성하시오.
CREATE INDEX ix_Book
ON book(bookname);

SHOW INDEX FROM book;

-- Book 테이블의 publisher, price 열을 대상으로 인덱스 ix_Book2를 생성하시오.
CREATE INDEX ix_Book2
ON book(publisher, price);