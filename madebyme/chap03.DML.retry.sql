-- book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
INSERT INTO book (bookid, bookname, publisher, price)
VALUES (11, '스포츠 의학', '한솔의학서적', 90000);

-- book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO book (bookid, bookname, publisher)
VALUES (12, '스포츠 의학', '한솔의학서적');

-- 수입도서 목록(Imported_book)을 book 테이블에 모두 삽입하시오.
INSERT INTO book (bookid, bookname, publisher, price)
SELECT bookid, bookname, publisher, price
FROM imported_book;

-- Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오
UPDATE customer 
SET address = '대한민국 부산'
WHERE custid = 5;

select * from customer;

-- Book 테이블에서 14번 '스포츠 의학'의 출판사를 imported_book 테이블에 있는 21번 책의 출판사와 동일하게 변경하시오.
UPDATE book
SET publisher = (SELECT publisher
				FROM imported_book
				WHERE imported_book.bookid = 21)
WHERE bookid = 11;

-- book 테이블에서 도서번호가 11인 도서를 삭제하시오
DELETE FROM book
WHERE bookid = 11;
