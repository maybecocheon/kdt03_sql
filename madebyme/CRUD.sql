USE madangdb;

-- 모든 도서의 이름과 가격을 검색하시오
SELECT bookname, price
FROM book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
SELECT *
FROM book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오
SELECT publisher
FROM book;

-- 도서 테이블에 있는 모든 출판사를 중복 없이 검색하시오
SELECT DISTINCT publisher
FROM book;

-- 가격이 20,000원 미만인 도서를 검색하시오
SELECT *
FROM book
WHERE price < 20000;

-- 가격이 10,000원 이상 20,000원 이하인 도서를 검색하시오
SELECT *
FROM book
-- WHERE price >= 10000 AND price <= 20000;
WHERE price BETWEEN 10000 AND 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
SELECT *
FROM book
-- WHERE publisher IN ('굿스포츠', '대한미디어');
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

-- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오
SELECT *
FROM book
WHERE publisher NOT IN ('굿스포츠', '대한미디어');

-- '축구의 역사'를 출간한 출판사를 검색하시오
SELECT bookname, publisher
FROM book
WHERE bookname = '축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사를 검색하시오
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%축구%';

-- 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오
SELECT *
FROM book
WHERE bookname LIKE '_구%';

-- 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오
SELECT *
FROM book
WHERE bookname LIKE '%축구%' AND price >= 20000;

-- 도서를 이름순으로 검색하시오
SELECT *
FROM book
ORDER BY bookname;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
SELECT *
FROM book
ORDER BY price, bookname;

-- 도서를 가격의 내림차순으로 검색하시오. 가격이 같다면 출판사를 오름차순으로 출력하시오.
SELECT *
FROM book
ORDER BY price DESC, publisher;


-- 집계함수
-- 고객이 주문한 도서의 총판매액을 구하시오
SELECT SUM(saleprice) AS "총 판매액"
FROM orders;

-- 2번 김연아 고객이 주문한 도서의 총판매액을 구하시오
SELECT SUM(saleprice) AS "총 판매액"
FROM orders
WHERE custid = 2;

-- 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 구하시오
SELECT SUM(saleprice) AS "총 판매액",
		AVG(saleprice) AS "평균값",
        MIN(saleprice) AS "최저가",
        MAX(saleprice) AS "최고가"
FROM orders;


-- 데이터 조작어(삽입, 수정, 삭제)
-- book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
INSERT INTO book(bookid, bookname, publisher, price)
		VALUES (11, '스포츠 의학', '한솔의학서적', 90000);
        
-- book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO book(bookid, bookname, publisher)
		VALUES (12, '스포츠 의학', '한솔의학서적');
        
-- 수입도서 목록을 book 테이블에 모두 삽입하시오.
INSERT INTO book
	SELECT * FROM imported_book;

-- customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오
UPDATE customer
SET address = '대한민국 부산'
WHERE custid = 5;

-- book 테이블에서 12번 '스포츠 의학'의 출판사를 imported_book 테이블에 있는 21번 책의 출판사와 동일하게 변경하시오.
UPDATE book
SET publisher = (SELECT publisher FROM imported_book WHERE bookid = 21)
WHERE bookid = 12;

-- book 테이블에서 도서번호가 11번인 도서를 삭제하시오.
DELETE FROM book
WHERE bookid = 11;

