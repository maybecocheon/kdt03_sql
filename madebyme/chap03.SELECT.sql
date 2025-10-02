use madangdb;

-- 모든 도서의 이름과 가격을 검색하시오
select bookname, price
from book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
select bookid, bookname, publisher, price
from book;

-- 가격이 20,000원 미만인 도서를 검색하시오
select *
from book
where price < 20000;

-- 가격이 10,000원 이상 20,000원 이하인 도서를 검색하시오
select *
from book
-- where price >= 10000 and price <= 20000;
where price between 10000 and 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
select *
from book
-- where publisher='굿스포츠' or publisher='대한미디어';
where publisher in('굿스포츠', '대한미디어');

-- 도서이름에 '축구'가 포함된 출판사를 검색하시오.
select bookname, publisher
from book
where bookname like '%축구%';

-- 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오
select *
from book
where bookname like '_구%';

-- 도서를 가격순으로 검색하시오
select *
from book
order by price;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
select *
from book
order by price, bookname desc;
-- 내림차순은 뒤에 desc 붙임