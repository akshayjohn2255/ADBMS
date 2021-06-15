CREATE TABLE CUSTOMER(CUST_ID INT PRIMARY KEY,CUST_NAME VARCHAR(10));
CREATE TABLE ITEM(ITEM_ID INT PRIMARY KEY,ITEM_NAME VARCHAR(20),PRICE INT);
CREATE TABLE SALE(BILL_NO INT PRIMARY KEY,BILL_DATE DATE,CUST_ID INT,ITEM_ID INT,QTY_SOLID INT,
CONSTRAINT FK_CUST FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(CUST_ID),CONSTRAINT FK_IEM FOREIGN KEY(ITEM_ID) REFERENCES ITEM(ITEM_ID));
INSERT INTO CUSTOMER(CUST_ID,CUST_NAME) VALUES(1,'Rekha'),(2,'Rani'),(3,'Rocky'),(4,'Xin'),(5,'Kim');
SELECT * FROM CUSTOMER;
INSERT INTO ITEM(ITEM_ID,ITEM_NAME,PRICE) VALUES(1,'Rusk',120),(2,'Banana',50),(3,'Sanitizer',60),(4,'Cake',420),(5,'Laddu',25);
SELECT * FROM ITEM;
INSERT INTO SALE(BILL_NO,BILL_DATE,CUST_ID,ITEM_ID,QTY_SOLID) VALUES(10,'2020-10-01',1,1,3),(11,'2020-10-01',1,3,2),(12,'2020-10-01',1,5,7),
(13,'2018-10-01',4,4,1),(14,'2018-10-11',4,2,2),(15,'2018-09-29',5,1,5),(16,'2018-12-25',3,1,5),(17,'1995-06-21',5,4,4),(18,'2002-04-01',4,5,5),
(19,'2020-02-12',1,2,3),(20,'2020-10-01',1,5,7);
SELECT * FROM SALE;
SELECT * FROM CUSTOMER C,ITEM I,SALE S WHERE C.CUST_ID=S.CUST_ID AND I.ITEM_ID=S.ITEM_ID AND I.PRICE>200;
SELECT C.CUST_ID,CUST_NAME,SC.COUNT,SC.BILL_DATE FROM CUSTOMER C,
(SELECT COUNT(ITEM_ID) AS COUNT,BILL_DATE,CUST_ID FROM SALE GROUP BY BILL_DATE) SC WHERE C.CUST_ID=SC.CUST_ID;
SELECT ITEM_NAME,I.ITEM_ID FROM ITEM I,CUSTOMER C,SALE S WHERE S.CUST_ID=C.CUST_ID AND S.ITEM_ID=I.ITEM_ID AND C.CUST_ID=5;
SELECT ITEM_NAME,S.BILL_DATE FROM ITEM I,SALE S WHERE I.ITEM_ID=S.ITEM_ID AND S.BILL_DATE=CURDATE();
SELECT ITEM_NAME,PRICE ,QTY_SOLID,QTY_SOLID*PRICE AS TOTAL_AMOUNT FROM CUSTOMER C,ITEM I,SALE S 
WHERE C.CUST_ID=S.CUST_ID AND I.ITEM_ID=S.ITEM_ID AND C.CUST_NAME = 'Rekha';
