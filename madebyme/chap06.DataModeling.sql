USE sakila;

SELECT *
FROM staff sf, store sr
WHERE sf.store_id = sr.store_id;

-- 장르가 sci-fi인 영화는 몇 개인지 조사
SELECT COUNT(*)
FROM category c, film_category f
WHERE c.name = 'Sci-Fi' AND c.category_id = f.category_id;

-- 장르가 sci-fi인 영화의 이름
SELECT film.title
FROM category c, film_category f, film
WHERE c.name = 'Sci-Fi' AND c.category_id = f.category_id AND f.film_id = film.film_id;

-- store 1번의 재고 몇 개인지, 영화 이름순으로 정렬 
SELECT *
FROM store s, inventory i, film f
WHERE s.store_id = i.store_id AND i.film_id = f.film_id AND s.store_id = 1
ORDER BY f.title;

-- 제일 마지막으로 빌린 책(누가, 무엇을, 어떤 사람이 대여해 줬는지, 얼마인지)
SELECT concat(c.first_name, " ", c.last_name) as "cname", f.title, concat(s.first_name, " ", s.last_name) as "sname", p.amount
FROM rental r, inventory i, customer c, staff s, film f, payment p
WHERE r.inventory_id = i.inventory_id AND
i.film_id = f.film_id AND
r.customer_id = c.customer_id AND
r.rental_id = p.rental_id AND
r.staff_id = s.staff_id AND
r.rental_id = (SELECT rental_id
			FROM rental
			ORDER BY rental_id DESC
            limit 1);
            
-- 매장별 직원 목록
SELECT sf.*
FROM store sr, staff sf
WHERE sr.store_id = sf.store_id;

-- 카테고리가 sci-fi인 영화 목록
SELECT f.*
FROM film f, film_category fc, category c
WHERE f.film_id = fc.film_id AND
fc.category_id = c.category_id AND
c.name = 'sci-fi';

-- 스토어 1의 재고 목록
SELECT f.*
FROM store s, inventory i, film f
WHERE s.store_id = i.store_id AND
i.film_id = f.film_id AND
s.store_id = 1;

-- 가장 최근 렌탈 정보 => 뷰로 만들기
SELECT *
FROM rental r, inventory i, film f
WHERE r.inventory_id = i.inventory_id AND
i.film_id = f.film_id AND
r.rental_id = (SELECT rental_id
				FROM rental
				ORDER BY rental_id DESC
                LIMIT 1);
                
-- 뷰 사용
SELECT *
FROM rental
WHERE rental_id = (SELECT * FROM lastrentalinformation);


-- 저장 프로그램 및 함수 활용
-- 재고량
SELECT inventory_in_stock(1);
-- 고객마다 대출한 권수
SELECT inventory_held_by_customer(1);
-- 가게별 대출 가능한 권수
CALL film_in_stock(1, 1, @x);
SELECT @x;