CREATE TABLE showboard
(NUM NUMBER NOT NULL,
	SUBJECT VARCHAR2(100)NOT NULL,
	ADDRESS1 VARCHAR2(20)NOT NULL,
    ADDRESS2 VARCHAR2(200)NOT NULL,
	"DATE" DATE NOT NULL,
	PAY NUMBER(7)NOT NULL,
	TEL VARCHAR2(13)NOT NULL,
	TAG VARCHAR2(100),
	CONTENT VARCHAR2(4000)NOT NULL,
	FILE_ORGNAME VARCHAR2(50),
	FILE_SAVNAME VARCHAR2(50),
	MAP VARCHAR2(50),
	READCOUNT NUMBER(10),
	ORDERCOUNT NUMBER(10),
	PRIMARY KEY(NUM))

CREATE TABLE MEMBER
(MEMBER_NUM NUMBER NOT NULL,
	EMAIL VARCHAR2(25)NOT NULL,
	PASSWORD VARCHAR2(15)NOT NULL,
	NAME VARCHAR2(20)NOT NULL,
	ADDRESS VARCHAR2(70),
	COMPANY VARCHAR2(25),
	PRIMARY KEY(MEMBER_NUM))

CREATE TABLE "ORDER"
(ORDER_NUM NUMBER NOT NULL,
	MEMBER_NUM NUMBER NOT NULL,
	SHOWBOARD_NUM NUMBER NOT NULL,
	NAME VARCHAR2(20)NOT NULL,
	SEX VARCHAR2(5),
	COMPANY VARCHAR2(25),
	ADDRESS VARCHAR2(70),
	EMAIL VARCHAR2(25)NOT NULL,
	QRCODE VARCHAR2(25),
	REG_DATE DATE NOT NULL,
	TEL VARCHAR2(13)NOT NULL,
	PRIMARY KEY(ORDER_NUM))

CREATE TABLE BASKET
(BASKET_NUM NUMBER NOT NULL,
	MEMBER_NUM VARCHAR2 NOT NULL,
	SHOWBOARD_NUM VARCHAR2 NOT NULL,
	REG_DATE DATE NOT NULL,
	PRIMARY KEY(BASKET_NUM))

CREATE TABLE SHOWCASECOMMENT
(COMMENT_NUM NUMBER NOT NULL,
	SHOWBOARD_NUM NUMBER NOT NULL,
	MEMBER_NUM NUMBER NOT NULL,
	CONTENT VARCHAR2(1000)NOT NULL,
	REG_DATE DATE NOT NULL,
	RE_STEP NUMBER(10),
	RE_LEVEL NUMBER(10),
	PRIMARY KEY(COMMENT_NUM))

CREATE TABLE NOTICE
(NOTICE_NUM NUMBER NOT NULL,
	SUBJECT VARCHAR2(50)NOT NULL,
	CONTENT VARCHAR2(4000)NOT NULL,
	REG_DATE DATE NOT NULL,
	READCOUNT NUMBER(10),
	PRIMARY KEY(NOTICE_NUM))

CREATE TABLE SUPPORT
(REF_NUM NUMBER NOT NULL,
	MEMBER_NUM NUMBER NOT NULL,
	TYPE VARCHAR2(50)NOT NULL,
	EMAIL VARCHAR2(25)NOT NULL,
	CONTENT VARCHAR2(1000)NOT NULL,
	REG_DATE DATE NOT NULL,
	RE_STEP NUMBER(10),
	RE_LEVEL NUMBER(10),
	PRIMARY KEY(REF_NUM))

CREATE TABLE QNA
(QNA_NUM NUMBER NOT NULL,
	SUBJECT VARCHAR2(100)NOT NULL,
	CONTENT VARCHAR2(1000)NOT NULL,
	PRIMARY KEY(QNA_NUM))
