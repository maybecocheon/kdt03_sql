-- 정규화
SELECT	*
FROM Summer;

-- 삭제 이상
-- 200번 학생의 계절학기 수강을 취소하세요
START TRANSACTION;

-- c 강좌 수강료를 조회하면 10,000원으로 나온다
SELECT price 'C 수강료'
FROM summer
WHERE class LIKE 'C';

-- 200번 학생의 수강신청을 취소했다
SET SQL_SAFE_UPDATES = 0;
DELETE FROM summer WHERE sid = 200;
SET SQL_SAFE_UPDATES = 1;

-- c 강좌 수강료를 다시 조회하면 값이 나오지 않는다
SELECT price 'C 수강료'
FROM summer
WHERE class LIKE 'C';


-- 삽입 이상
-- 계절학기에 새로운 강좌 C++을 개설하시오
INSERT INTO summer 
		VALUES (NULL, 'C++', 25000);

-- NULL값이 있는 경우 질에의 주의한다 (투플 다섯 개지만 수강 학생 총 네 명)
SELECT COUNT(*) '수강 목록'
FROM summer;

SELECT COUNT(sid) '수강 인원'
FROM summer;

SELECT COUNT(*) '수강 인원'
FROM summer
WHERE sid IS NOT NULL;


-- 수정 이상
-- JAVA 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오
-- JAVA 강좌 수강료를 수정하면 JAVA 강좌 수강료 전체가 정상적으로 수정된다
UPDATE summer
SET price = 15000
WHERE class = 'JAVA';

-- JAVA 강좌를 조회하면 같은 값이 2번 조회되므로 DISTINCT문을 사용한다
SELECT DISTINCT price
FROM summer
WHERE class = "JAVA";

-- UPDATE문을 다음과 같이 조건부로 작성하면 데이터 불일치 문제가 발생한다
UPDATE summer
SET price = 20000
WHERE class = 'JAVA' AND sid = 100;

-- JAVA 수강료를 조회하면 두 건이 나와 데이터 불일치 문제가 발생하였다
SELECT price
FROM summer
WHERE class = "JAVA";

INSERT INTO summer 
		VALUES (100, 'PYTHON', 15000);

CREATE TABLE summer_class        
SELECT class, price
FROM summer
GROUP BY class, price;

ROLLBACK;
