-- �̸�: demo_madan_addr_cart.sql
-- ����

CREATE TABLE  Cust_addr (
  addrid 	  INTEGER PRIMARY KEY,  
  custid      INTEGER,  
  address     VARCHAR(50),
  phone       VARCHAR(20),
  changeday		DATE,
  FOREIGN KEY (custid) REFERENCES Customer(custid)  
);

INSERT INTO Cust_addr VALUES (1, '���� ����Ʈȣ��', '010-5000-0001', STR_TO_DATE('2003-07-01','%Y-%m-%d'));
INSERT INTO Cust_addr VALUES (1, '���� ��ü����', '010-5000-0002', STR_TO_DATE('2005-07-01','%Y-%m-%d'));
INSERT INTO Cust_addr VALUES (1, '���� ����Ʈȣ��', '010-5000-0003', STR_TO_DATE('2013-07-01','%Y-%m-%d'));
INSERT INTO Cust_addr VALUES (1, '���� ������ũ', '010-5000-0004', STR_TO_DATE('2021-07-01','%Y-%m-%d'));

commit;

CREATE TABLE Cart (
  cartid INTEGER PRIMARY KEY,
  custid  INTEGER,
  bookid  INTEGER,
  cartdate DATE,
  FOREIGN KEY (custid) REFERENCES Customer(custid),
  FOREIGN KEY (bookid) REFERENCES Book(bookid)
);

INSERT INTO Cart VALUES (1, 1, 1, STR_TO_DATE('2024-07-01','%Y-%m-%d')); 
INSERT INTO Cart VALUES (2, 1, 3, STR_TO_DATE('2024-07-03','%Y-%m-%d'));
INSERT INTO Cart VALUES (3, 1, 5, STR_TO_DATE('2024-07-03','%Y-%m-%d')); 
INSERT INTO Cart VALUES (4, 1, 6, STR_TO_DATE('2024-07-04','%Y-%m-%d')); 
commit;
