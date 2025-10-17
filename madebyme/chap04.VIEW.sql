USE madang2;

-- 뷰(가상 테이블)을 만들기 위한 쿼리
SELECT b.bookid, b.bookname, b.publisher, b.price,
		c.custid, c.name, c.address, c.phone,
        o.orderid, o.saleprice, o.orderdate
FROM book2 b, customer2 c, orders2 o
WHERE b.bookid = o.bookid AND c.custid = o.custid;

-- 위 쿼리를 이용해 만든 뷰 활용
SELECT *
FROM v_orders
WHERE saleprice > 5000;