INSERT INTO book (bookid, bookname, publisher)
VALUES (11, '자바 프로그래밍', '이현지');

-- NULL 값 처리
-- 집계 함수는 NULL 값 빼고 계산함
-- SELECT SUM(PRICE), COUNT(*) // COUNT가 10
SELECT SUM(PRICE), COUNT(PRICE) -- COUNT가 9
FROM book;
select * from book;

-- NULL과 숫자의 연산 결과는 NULL
SELECT SUM(NULL), COUNT(NULL), (NULL + 1);

-- NULL 때문에 값 계산 이상해지는 것 막으려면 테이블 설정에서 NN 체크하기

-- NULL 값 확인하는 방법
-- =, <> 연산자 사용 못 함
SELECT *
FROM madangdb.customer
WHERE phone IS NULL;
-- WHERE phone IS NOT NULL;

-- NULL 값 대치
SELECT IFNULL(phone, "연락처 없음")
FROM madangdb.customer;