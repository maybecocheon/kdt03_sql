use madangdb;

-- book 테이블에 새로운 값 삽입
INSERT INTO `book` -- 백틱 기호 생략 가능
(bookid,
bookname,
publisher,
price)
VALUES
-- (1, 'a', 'b', 100); => 1(primary key)이 있기 때문에 오류
(11, 'a', 'b', 100);

-- book 테이블 값 수정
UPDATE book
SET
bookname = '피구왕 통키',
publisher = '김통키',
price = 4900
WHERE bookid = 11;

-- book 테이블 값 삭제
DELETE FROM book
WHERE bookid = 11;