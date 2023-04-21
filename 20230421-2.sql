DROP TABLE PRODUCTTBL;
-- memberTbl ����
DROP TABLE MEMBERTBL;
CREATE TABLE MEMBERTBL 
(
  MEMBERID CHAR(8) NOT NULL 
, MEMBERNAME NCHAR(5) NOT NULL 
, MEMBERADDRESS NVARCHAR2(20) 
, CONSTRAINT MEMBERTBL_PK PRIMARY KEY 
  (
    MEMBERID 
  )
  ENABLE 
);


-- productTbl
CREATE TABLE PRODUCTTBL 
(
  PRODUCTNAME NCHAR(4) NOT NULL 
, PRICE NUMBER(7) NOT NULL 
, MADEDATE DATE 
, COMPANY NCHAR(5) 
, AMOUNT NUMBER(3) NOT NULL 
, CONSTRAINT PRODUCTTABL_PK PRIMARY KEY 
  (
    PRODUCTNAME 
  )
  ENABLE 
);

-- memberTbl�� ������ �Է�
INSERT INTO MEMBERTBL (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('KANG', N'������', N'����� ���Ǳ� �Ÿ���');
INSERT INTO MEMBERTBL (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('GOYA', N'������', N'��� ������ �д籸');
INSERT INTO MEMBERTBL (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('MANG', N'������', N'��õ ����� ����');
INSERT INTO MEMBERTBL (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('SONG', N'�۾���', N'���� ������ ������');

-- productTbl ������ �Է�
INSERT INTO PRODUCTTBL (PRODUCTNAME, PRICE, MADEDATE, COMPANY, AMOUNT) VALUES (N'��ǻ��', '100', TO_DATE('2023-01-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'�Ｚ', '19');
INSERT INTO PRODUCTTBL (PRODUCTNAME, PRICE, MADEDATE, COMPANY, AMOUNT) VALUES (N'�ڷ�����', '24', TO_DATE('2021-04-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'���', '20');
INSERT INTO PRODUCTTBL (PRODUCTNAME, PRICE, MADEDATE, COMPANY, AMOUNT) VALUES (N'�����', '150', TO_DATE('2020-06-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'LG', '150');

-- '�ڸ�����' ���� ��������
SELECT * FROM productTbl WHERE productName = '�ڷ�����';

-- productTbl �����
DROP TABLE PRODUCTTBL;
CREATE TABLE PRODUCTTBL 
(
  IDNUM NUMBER(5) NOT NULL 
, PRODUCTNAME NCHAR(4) NOT NULL 
, MEMBERID CHAR(8) NOT NULL 
, PRICE NUMBER(7) NOT NULL 
, MADEDATE DATE 
, COMPANY NCHAR(5) 
, AMOUNT NUMBER(3) NOT NULL 
, CONSTRAINT PRODUCTTBL_PK PRIMARY KEY 
  (
    PRODUCTNAME 
  )
  ENABLE 
);

-- ������ ����
DROP SEQUENCE SHOPSEQUENCE;
CREATE SEQUENCE SHOPSEQUENCE INCREMENT BY 10 START WITH 1;

CREATE TRIGGER PRODUCTTBL_TRG 
BEFORE INSERT ON PRODUCTTBL 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDNUM IS NULL THEN
      SELECT SHOPSEQUENCE.NEXTVAL INTO :NEW.IDNUM FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

ALTER TABLE PRODUCTTBL
ADD CONSTRAINT PRODUCTTBL_FK1 FOREIGN KEY
(
  MEMBERID 
)
REFERENCES MEMBERTBL
(
  MEMBERID 
)
ENABLE;

INSERT INTO PRODUCTTBL (PRODUCTNAME, MEMBERID, PRICE, MADEDATE, COMPANY, AMOUNT) VALUES (N'��ǻ��', 'KANG', '100', TO_DATE('2023-02-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'�Ｚ', '19');
INSERT INTO PRODUCTTBL (PRODUCTNAME, MEMBERID, PRICE, MADEDATE, COMPANY, AMOUNT) VALUES (N'�ڷ�����', 'MANG', '24', TO_DATE('2021-04-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'���', '20');
INSERT INTO PRODUCTTBL (PRODUCTNAME, MEMBERID, PRICE, MADEDATE, COMPANY, AMOUNT) VALUES (N'�����', 'SONG', '150', TO_DATE('2020-06-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'LG', '8');
INSERT INTO PRODUCTTBL (PRODUCTNAME, MEMBERID, PRICE, MADEDATE, COMPANY, AMOUNT) VALUES (N'��Ʈ��', 'GOYA', '10', TO_DATE('2023-04-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'����', '1');



