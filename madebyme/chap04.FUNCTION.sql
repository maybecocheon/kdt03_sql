-- 숫자 함수
-- 반올림
SELECT ROUND(35.5, -1); -- . 기준으로 자릿수 계산함
SELECT ROUND(3.499999); -- 자릿수 인수 안 넣으면 자동으로 0으로 지정함

-- 올림
SELECT CEIL(35.5);

-- 내림
SELECT FLOOR(35.5);



-- 문자 함수
-- 결합
SELECT CONCAT('Hello', ', ', 'World!') AS "helloworld";

-- 소문자로
SELECT LOWER(CONCAT('Hello', ', ', 'World!')) AS "helloworld";

-- 대문자로
SELECT UPPER(CONCAT('Hello', ', ', 'World!')) AS "helloworld";

-- 지정한 자릿수까지 지정한 문자로 채움
SELECT LPAD('Hello', 10, '*');

-- 지정한 글자를 지정한 글자로 바꾸기
SELECT REPLACE('Hello', 'H', 'A');

-- 지정한 자리부터 지정된 길이만큼 잘라서 반환
-- 0부터 시작 x, 1부터 시작
SELECT SUBSTR('Hello', 2, 2); -- el
SELECT SUBSTR('안녕하세요', 2, 2); -- 녕안

-- 문자열의 byte 반환
SELECT LENGTH('안녕하세요'); -- 15

-- 문자열의 문자 수 반환
SELECT CHAR_LENGTH('안녕하세요'); -- 5

-- 공백 제거
SELECT TRIM(' 안녕하세요');
SELECT TRIM(' ' FROM ' 안녕하세요');



-- 날짜, 시간 함수
-- 문자열을 날짜형으로 변환
SELECT *
FROM madangdb.orders
-- WHERE orderdate = '2024-07-03'; -- 이것도 결과를 반환하지만 형 변환하지 않으면 위험함
WHERE orderdate = STR_TO_DATE('2024-07-03', '%Y-%m-%d');

-- 날짜형을 문자열로 변환
SELECT DATE_FORMAT(orderdate, '%Y-%m-%d')
FROM madangdb.orders;

-- 지정된 날짜에 지정한 시간만큼 더함
SELECT orderdate, ADDDATE(orderdate, INTERVAL 1 DAY) -- (orderdate, 1)
FROM madangdb.orders;

-- 현재 날짜와 시간 반환
SELECT NOW();

-- 현재 날짜 반환
SELECT CURDATE();
SELECT ADDDATE(CURDATE(), 14); -- (CURDATE(), INTERVAL 2 WEEK)

-- date1 - date2 날짜 차이를 반환
SELECT DATEDIFF(NOW(), '2025-09-30'); -- Date 쓸 자리에 String 써도 자동 형 변환해 줌
SELECT DATEDIFF(CURDATE(), orderdate)
FROM madangdb.orders;