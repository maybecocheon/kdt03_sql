-- 프로시저
-- 프로그램 실행
CALL dorepeat(1000);
-- 프로그램 내 변수 호출
SELECT @x;

-- 프로시저 내 SELECT문을 쓴 프로그램 실행
CALL callbook();

-- FUNCTION
-- 함수 호출
SELECT dorepeat2(1000);

-- 함수의 결괏값 활용 가능
SELECT *
FROM book
WHERE bookid = dorepeat2(3);