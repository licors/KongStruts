CREATE TABLE showboard(
	SHOWBOARD_NUM NUMBER PRIMARY KEY,
	SUBJECT VARCHAR2(100) NOT NULL,
	ADDRESS1 VARCHAR2(30) NOT NULL,
    ADDRESS2 VARCHAR2(200) NOT NULL,
	"DATE" VARCHAR2(35) NOT NULL,
	PAY NUMBER(7) NOT NULL,
	TEL VARCHAR2(13) NOT NULL,
	TAG VARCHAR2(100),
	CONTENT VARCHAR2(4000) NOT NULL,
	FILE_ORGNAME VARCHAR2(50),
	FILE_SAVNAME VARCHAR2(100),
	READCOUNT NUMBER(10),
	ORDERCOUNT NUMBER(10),
	MAP VARCHAR2(200),
	STATUS NUMBER DEFAULT 0,
	SHOWBOARD_CATEGORY VARCHAR2(25) NOT NULL
)


CREATE TABLE MEMBER
(
	MEMBER_NUM NUMBER PRIMARY KEY,
	EMAIL VARCHAR2(50) NOT NULL,
	PASSWORD VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(20) NOT NULL,
	ZIPCODE VARCHAR2(15),
	ADDRESS VARCHAR2(70),
	ADDRESS2 VARCHAR2(50),
	COMPANY VARCHAR2(25),
	ADMIN NUMBER DEFAULT 0
)

CREATE TABLE "ORDER"
(
	ORDER_NUM NUMBER PRIMARY KEY,
	MEMBER_NUM NUMBER,
	CONSTRAINT fk_order_member_num FOREIGN KEY(MEMBER_NUM) 
	references MEMBER(MEMBER_NUM) on delete cascade, 
	SHOWBOARD_NUM number,
	CONSTRAINT fk_order_showboard_num FOREIGN KEY(SHOWBOARD_NUM) 
	references SHOWBOARD(SHOWBOARD_NUM) on delete cascade,
	NAME VARCHAR2(20) NOT NULL,
	SEX VARCHAR2(5),
	COMPANY VARCHAR2(25),
	ADDRESS VARCHAR2(70),
	EMAIL VARCHAR2(25) NOT NULL,
	BARCODE VARCHAR2(25),
	ORDER_DATE DATE NOT NULL,
	TEL VARCHAR2(13)NOT NULL,
	STATUS VARCHAR2(15)
)


CREATE TABLE BASKET
(
	BASKET_NUM NUMBER PRIMARY KEY,
	MEMBER_NUM number NOT NULL,
	SHOWBOARD_NUM number NOT NULL,
	BASKET_DATE DATE NOT NULL
)

alter table BASKET add constraint fk_basket_member_num FOREIGN KEY(MEMBER_NUM) 
	references MEMBER(MEMBER_NUM) on delete cascade;
	
alter table BASKET add constraint fk_basket_showboard_num FOREIGN KEY(SHOWBOARD_NUM) 
	references SHOWBOARD(SHOWBOARD_NUM) on delete cascade;

CREATE TABLE SHOWCASECOMMENT
(COMMENT_NUM NUMBER PRIMARY KEY,
	SHOWBOARD_NUM NUMBER NOT NULL,
	constraint fk_showboardcomment_showbd_num FOREIGN KEY(SHOWBOARD_NUM) 
	references SHOWBOARD(SHOWBOARD_NUM) on delete cascade,
	MEMBER_NUM NUMBER NOT NULL,
	constraint fk_showboardcomment_member_num FOREIGN KEY(MEMBER_NUM) 
	references MEMBER(MEMBER_NUM) on delete cascade,
	CONTENT VARCHAR2(1000)NOT NULL,
	REG_DATE DATE NOT NULL
)


CREATE TABLE NOTICE
(NOTICE_NUM NUMBER PRIMARY KEY,
	SUBJECT VARCHAR2(50)NOT NULL,
	CONTENT VARCHAR2(4000)NOT NULL,
	REG_DATE DATE NOT NULL,
	READCOUNT NUMBER(10)
)

CREATE TABLE SUPPORT
(SUPPORT_NUM NUMBER PRIMARY KEY,
	MEMBER_NUM NUMBER NOT NULL,
	"TYPE" VARCHAR2(50)NOT NULL,
	EMAIL VARCHAR2(25)NOT NULL,
	CONTENT VARCHAR2(1000)NOT NULL,
	REG_DATE DATE NOT NULL,
    "REF" NUMBER(10) DEFAULT 0,
	RE_STEP NUMBER(10),
	RE_LEVEL NUMBER(10)
)
alter table SUPPORT add constraint fk_support_member_num FOREIGN KEY(MEMBER_NUM) 
	references MEMBER(MEMBER_NUM) on delete cascade;
	
CREATE TABLE QNA
(QNA_NUM NUMBER PRIMARY KEY,
	SUBJECT VARCHAR2(100)NOT NULL,
	CONTENT VARCHAR2(1000)NOT NULL
)
	
CREATE TABLE ZIPCODE
(
	ZIPCODE VARCHAR2(7) PRIMARY KEY,
	AREA1 VARCHAR2(20),
	AREA2 VARCHAR2(40),
	ZIPCODE VARCHAR2(40),
	ZIPCODE VARCHAR2(120),
)

create sequence showboard_num_seq;
create sequence basket_num_seq;
create sequence member_num_seq;
create sequence notice_num_seq;
create sequence order_num_seq;
create sequence qna_num_seq;
create sequence comment_num_seq;
create sequence ref_num_seq;
