-- 모든 도서의 이름과 가격을 검색하시오
SELECT bookname, price
FROM book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
SELECT bookid, bookname, publisher, price -- 속성명 대신 * 이거 써도 됨
FROM book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오
SELECT publisher
FROM book;

-- 가격이 20,000원 미만인 도서를 검색하시오
SELECT *
FROM book
WHERE price < 20000;

-- 가격이 10,000원 이상 20,000원 이하인 도서를 검색하시오
SELECT *
FROM book
-- WHERE price BETWEEN 10000 AND 20000;
WHERE price >= 10000 AND price <= 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
SELECT *
FROM book
-- WHERE publisher IN ('굿스포츠', '대한미디어');
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

-- '축구의 역사'를 출간한 출판사를 검색하시오
SELECT publisher
FROM book
WHERE bookname = '축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사를 검색하시오
SELECT publisher
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

-- 