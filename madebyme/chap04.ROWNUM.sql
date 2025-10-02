-- 변수 생성(치환문)
SET @seq := 0;
-- 변수 값 출력
SELECT @seq;

-- 행 번호 출력
SELECT (@seq := @seq + 1), bookname, price
FROM book;

SELECT ROW_NUMBER() OVER (ORDER BY bookid), bookname, price
FROM book;

-- 앞의 행 3개만 출력
SELECT *
FROM book
LIMIT 3;

-- 행 다섯 번째부터 출력
SELECT *
FROM book
LIMIT 4, 6;