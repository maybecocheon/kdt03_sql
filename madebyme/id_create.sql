USE madang2;

INSERT INTO book2
		VALUES (11, '축구의 역사', '굿스포츠', 7000);
        
INSERT INTO book2
		VALUES ((select max(bookid) + 1 from book2 b2), '축구의 역사', '굿스포츠', 7000);
	
INSERT INTO book2
		VALUES ((select bookid + 1
				from book2 b2
				order by bookid desc
				limit 1), '축구의 역사', '굿스포츠', 7000);

-- Auto Increment 걸려 있는 경우
INSERT INTO book2(bookname, publisher, price)
		VALUES ('축구의 역사', '굿스포츠', 7000);