USE madangdb;

-- 프로시저
-- 프로그램 실행
CALL dorepeat(1000);
-- 프로그램 내 변수 호출
SELECT @x;

-- 프로시저 내 SELECT문을 쓴 프로그램 실행
CALL callbook();

-- 제어문 사용하는 프로시저
-- bookinsertorupdate 프로시저를 실행하여 테스트하는 부분
CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 25000);
SELECT * FROM book;

CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);
SELECT * FROM book;

-- 결과를 반환하는 프로시저
-- 프로시저 Averageprice를 테스트하는 부분
CALL Averageprice(@myValue);
SELECT @myValue;


-- 트리거
-- book_log 테이블의 기본키와 외래키를 book 테이블의 기본키로 참조하면 bookid에 해당하는 책을 여러 번 수정해도 book_log 테이블에 한 번밖에 기록이 안 됨 
-- 따라서 book_log 테이블에서는 기본키를 따로 만들어 주어야 함
-- 삽입합 내용을 기록하는 트리거 확인
INSERT INTO book
VALUES (18, '스포츠 과학 1', '이상미디어', 25000);

SELECT *
FROM book
WHERE bookid = 18;

SELECT *
FROM book_log
WHERE bookid = 18;

UPDATE book
SET price = 20000
WHERE bookid = 18;

-- FUNCTION
-- 함수 호출
SELECT dorepeat2(1000);

-- 함수의 결괏값 활용 가능
SELECT *
FROM book
WHERE bookid = dorepeat2(3);