ALTER TABLE tb_give
	DROP
		CONSTRAINT FK_tb_project_TO_tb_give
		CASCADE;

ALTER TABLE tb_give
	DROP
		CONSTRAINT FK_tb_member_TO_tb_give
		CASCADE;

ALTER TABLE tb_project
	DROP
		CONSTRAINT FK_tb_member_TO_tb_project
		CASCADE;

ALTER TABLE tb_notice
	DROP
		CONSTRAINT FK_tb_member_TO_tb_notice
		CASCADE;

ALTER TABLE tb_company
	DROP
		CONSTRAINT FK_tb_member_TO_tb_company
		CASCADE;

ALTER TABLE tb_reward
	DROP
		CONSTRAINT FK_tb_project_TO_tb_reward
		CASCADE;

ALTER TABLE tb_review
	DROP
		CONSTRAINT FK_tb_project_TO_tb_review
		CASCADE;

ALTER TABLE tb_review
	DROP
		CONSTRAINT FK_tb_member_TO_tb_review
		CASCADE;

ALTER TABLE tb_cheer
	DROP
		CONSTRAINT FK_tb_project_TO_tb_cheer
		CASCADE;

ALTER TABLE tb_cheer
	DROP
		CONSTRAINT FK_tb_cheer_TO_tb_cheer
		CASCADE;

ALTER TABLE tb_cheer
	DROP
		CONSTRAINT FK_tb_member_TO_tb_cheer
		CASCADE;

ALTER TABLE tb_favorite
	DROP
		CONSTRAINT FK_tb_member_TO_tb_favorite
		CASCADE;

ALTER TABLE tb_favorite
	DROP
		CONSTRAINT FK_tb_project_TO_tb_favorite
		CASCADE;

ALTER TABLE tb_QnA
	DROP
		CONSTRAINT FK_tb_project_TO_tb_QnA
		CASCADE;

ALTER TABLE tb_QnA
	DROP
		CONSTRAINT FK_tb_QnA_TO_tb_QnA
		CASCADE;

ALTER TABLE tb_QnA
	DROP
		CONSTRAINT FK_tb_member_TO_tb_QnA
		CASCADE;

ALTER TABLE tb_payment
	DROP
		CONSTRAINT FK_tb_give_TO_tb_payment
		CASCADE;

ALTER TABLE tb_item
	DROP
		CONSTRAINT FK_tb_project_TO_tb_item
		CASCADE;

ALTER TABLE tb_giveItem
	DROP
		CONSTRAINT FK_tb_give_TO_tb_giveItem
		CASCADE;

ALTER TABLE tb_member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_give
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_project
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_notice
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_company
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_reward
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_cheer
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_data
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_favorite
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_QnA
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_payment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_item
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tb_giveItem
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 회원관리 */
DROP TABLE tb_member 
	CASCADE CONSTRAINTS;

/* 기부 */
DROP TABLE tb_give 
	CASCADE CONSTRAINTS;

/* 기부 프로젝트 */
DROP TABLE tb_project 
	CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE tb_notice 
	CASCADE CONSTRAINTS;

/* 기부 단체 */
DROP TABLE tb_company 
	CASCADE CONSTRAINTS;

/* 리워드 */
DROP TABLE tb_reward 
	CASCADE CONSTRAINTS;

/* 프로젝트 후기 */
DROP TABLE tb_review 
	CASCADE CONSTRAINTS;

/* 응원댓글 */
DROP TABLE tb_cheer 
	CASCADE CONSTRAINTS;

/* 물품데이터 */
DROP TABLE tb_data 
	CASCADE CONSTRAINTS;

/* 즐겨찾기 */
DROP TABLE tb_favorite 
	CASCADE CONSTRAINTS;

/* QnA */
DROP TABLE tb_QnA 
	CASCADE CONSTRAINTS;

/* 결제정보 */
DROP TABLE tb_payment 
	CASCADE CONSTRAINTS;

/* 프로젝트 물품 */
DROP TABLE tb_item 
	CASCADE CONSTRAINTS;

/* 기부 물품 */
DROP TABLE tb_giveItem 
	CASCADE CONSTRAINTS;

/* 회원관리 */
CREATE TABLE tb_member (
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pwd VARCHAR2(20), /* 비밀번호 */
	name VARCHAR2(20), /* 이름 */
	phone VARCHAR2(30), /* 핸드폰 번호 */
	email VARCHAR2(30), /* 이메일 */
	picture VARCHAR(255), /* 사진 */
	accMoney NUMBER(20), /* 기부누적금액 */
	regDate DATE, /* 등록일 */
	statusFlag NUMBER(3), /* 회원상태플래그 */
	dropFlag NUMBER(3) /* 탈퇴플래그 */
);

CREATE UNIQUE INDEX PK_tb_member
	ON tb_member (
		id ASC
	);

ALTER TABLE tb_member
	ADD
		CONSTRAINT PK_tb_member
		PRIMARY KEY (
			id
		);

/* 기부 */
CREATE TABLE tb_give (
	giveNo NUMBER(5) NOT NULL, /* 기부번호 */
	projectNo NUMBER(5), /* 프로젝트 번호 */
	id VARCHAR2(20), /* 아이디 */
	giveMoney NUMBER(20), /* 기부금액 */
	giveRegdate DATE /* 기부일자 */
);

CREATE UNIQUE INDEX PK_tb_give
	ON tb_give (
		giveNo ASC
	);

ALTER TABLE tb_give
	ADD
		CONSTRAINT PK_tb_give
		PRIMARY KEY (
			giveNo
		);

/* 기부 프로젝트 */
CREATE TABLE tb_project (
	projectNo NUMBER(5) NOT NULL, /* 프로젝트 번호 */
	id VARCHAR2(20), /* ID(등록자) */
	projectSubject VARCHAR2(200), /* 프로젝트 제목 */
	category1 VARCHAR2(30), /* 카테고리 */
	category2 VARCHAR2(30), /* 카테고리2 */
	category3 VARCHAR2(30), /* 카테고리3 */
	story CLOB, /* 스토리 */
	projectImg VARCHAR(255), /* 이미지 */
	projectEnd DATE, /* 프로젝트 마감일 */
	projectRegdate DATE, /* 등록일 */
	moneyOrItem NUMBER(3), /* 물품/금액 Flag */
	totalMoney NUMBER(20), /* 현재모금액 */
	goal NUMBER(20), /* 목표금액 */
	percent NUMBER(3), /* 달성률 */
	givePerson NUMBER(20) /* 기부인원 */
);

CREATE UNIQUE INDEX PK_tb_project
	ON tb_project (
		projectNo ASC
	);

ALTER TABLE tb_project
	ADD
		CONSTRAINT PK_tb_project
		PRIMARY KEY (
			projectNo
		);

/* 공지사항 */
CREATE TABLE tb_notice (
	noticeNo NUMBER(5) NOT NULL, /* 글번호 */
	id VARCHAR2(20), /* 아이디 */
	noticeTitle VARCHAR2(200), /* 제목 */
	noticeContent VARCHAR2(2000), /* 내용 */
	noticeRegdate DATE /* 등록일자 */
);

CREATE UNIQUE INDEX PK_tb_notice
	ON tb_notice (
		noticeNo ASC
	);

ALTER TABLE tb_notice
	ADD
		CONSTRAINT PK_tb_notice
		PRIMARY KEY (
			noticeNo
		);

/* 기부 단체 */
CREATE TABLE tb_company (
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	companyName VARCHAR2(20), /* 단체명 */
	companyCall VARCHAR2(30), /* 문의전화번호 */
	companyAddr VARCHAR2(255), /* 주소 */
	bank VARCHAR2(20), /* 계좌은행 */
	account VARCHAR2(20) /* 계좌번호 */
);

CREATE UNIQUE INDEX PK_tb_company
	ON tb_company (
		id ASC
	);

ALTER TABLE tb_company
	ADD
		CONSTRAINT PK_tb_company
		PRIMARY KEY (
			id
		);

/* 리워드 */
CREATE TABLE tb_reward (
	rewardNo NUMBER(5) NOT NULL, /* 리워드번호 */
	projectNo NUMBER(5), /* 프로젝트 번호 */
	rewardItem VARCHAR2(255), /* 리워드 품목 */
	condition NUMBER(10) /* 금액조건 */
);

CREATE UNIQUE INDEX PK_tb_reward
	ON tb_reward (
		rewardNo ASC
	);

ALTER TABLE tb_reward
	ADD
		CONSTRAINT PK_tb_reward
		PRIMARY KEY (
			rewardNo
		);

/* 프로젝트 후기 */
CREATE TABLE tb_review (
	projectNo NUMBER(5) NOT NULL, /* 프로젝트 번호 */
	id VARCHAR2(20), /* 아이디 */
	reviewContent CLOB, /* 글 내용 */
	reviewImg VARCHAR(255), /* 영수증사진 */
	reviewRegdate DATE /* 등록일자 */
);

CREATE UNIQUE INDEX PK_tb_review
	ON tb_review (
		projectNo ASC
	);

ALTER TABLE tb_review
	ADD
		CONSTRAINT PK_tb_review
		PRIMARY KEY (
			projectNo
		);

/* 응원댓글 */
CREATE TABLE tb_cheer (
	cheerNo NUMBER(5) NOT NULL, /* 응원번호 */
	projectNo NUMBER(5), /* 프로젝트 번호 */
	id VARCHAR2(20), /* 아이디 */
	cheerContent VARCHAR2(200), /* 댓글내용 */
	cheerRegdate DATE, /* 등록일자 */
	cheerNotify NUMBER(3), /* 응원댓글 알림flag */
	cheerParentNo NUMBER(5) /* 응원번호(부모) */
);

CREATE UNIQUE INDEX PK_tb_cheer
	ON tb_cheer (
		cheerNo ASC
	);

ALTER TABLE tb_cheer
	ADD
		CONSTRAINT PK_tb_cheer
		PRIMARY KEY (
			cheerNo
		);

/* 물품데이터 */
CREATE TABLE tb_data (
	dataItemNo NUMBER(5) NOT NULL, /* 물품번호 */
	dataItemName VARCHAR2(255), /* 물품명 */
	dataItemCategory VARCHAR2(30), /* 물품카테고리 */
	dataItemPrice NUMBER(10) /* 개당가격 */
);

CREATE UNIQUE INDEX PK_tb_data
	ON tb_data (
		dataItemNo ASC
	);

ALTER TABLE tb_data
	ADD
		CONSTRAINT PK_tb_data
		PRIMARY KEY (
			dataItemNo
		);

/* 즐겨찾기 */
CREATE TABLE tb_favorite (
	favoriteNo NUMBER(5) NOT NULL, /* 즐겨찾기 번호 */
	id VARCHAR2(20) NOT NULL, /* 아이디(사용자) */
	projectNo NUMBER(5) NOT NULL /* 프로젝트 번호 */
);

CREATE UNIQUE INDEX PK_tb_favorite
	ON tb_favorite (
		favoriteNo ASC
	);

ALTER TABLE tb_favorite
	ADD
		CONSTRAINT PK_tb_favorite
		PRIMARY KEY (
			favoriteNo
		);

/* QnA */
CREATE TABLE tb_QnA (
	qnaNo NUMBER(5) NOT NULL, /* QnA 번호 */
	projectNo NUMBER(5), /* 프로젝트 번호 */
	id VARCHAR2(20), /* 아이디 */
	qnaContent VARCHAR2(400), /* QnA 내용 */
	qnaRegdate DATE, /* 등록일자 */
	qnaNotify NUMBER(3), /* QnA 알림 */
	qnaParentNo NUMBER(5) /* QnA번호(부모) */
);

CREATE UNIQUE INDEX PK_tb_QnA
	ON tb_QnA (
		qnaNo ASC
	);

ALTER TABLE tb_QnA
	ADD
		CONSTRAINT PK_tb_QnA
		PRIMARY KEY (
			qnaNo
		);

/* 결제정보 */
CREATE TABLE tb_payment (
	giveNo NUMBER(5) NOT NULL, /* 기부번호 */
	payMethod VARCHAR2(20), /* 결제방식 */
	payMoney NUMBER(20), /* 결제금액 */
	permissionDate DATE, /* 결제 승인 일자 */
	receiver VARCHAR2(20), /* 받는사람 */
	addr VARCHAR2(255), /* 주소 */
	call VARCHAR2(30), /* 전화번호 */
	memo VARCHAR2(100), /* 배송메모 */
	payDate DATE, /* 결제일자 */
	receiptURL VARCHAR2(1000) /* 영수증URL */
);

CREATE UNIQUE INDEX PK_tb_payment
	ON tb_payment (
		giveNo ASC
	);

ALTER TABLE tb_payment
	ADD
		CONSTRAINT PK_tb_payment
		PRIMARY KEY (
			giveNo
		);

/* 프로젝트 물품 */
CREATE TABLE tb_item (
	projectItemNo NUMBER(5) NOT NULL, /* 프로젝트 물품번호 */
	projectNo NUMBER(5), /* 프로젝트 번호 */
	itemName VARCHAR2(20), /* 물품명 */
	itemPrice NUMBER(10), /* 개당가격 */
	itemAmount NUMBER(5), /* 기부수량 */
	goalAmount NUMBER(5) /* 목표수량 */
);

CREATE UNIQUE INDEX PK_tb_item
	ON tb_item (
		projectItemNo ASC
	);

ALTER TABLE tb_item
	ADD
		CONSTRAINT PK_tb_item
		PRIMARY KEY (
			projectItemNo
		);

/* 기부 물품 */
CREATE TABLE tb_giveItem (
	giveItemNo NUMBER(5) NOT NULL, /* 기부물품번호 */
	giveNo NUMBER(5), /* 기부번호 */
	giveItemName VARCHAR2(255), /* 물품명 */
	giveItemPrice NUMBER(10), /* 개당가격 */
	giveItemAmount NUMBER(5) /* 물품수량 */
);

CREATE UNIQUE INDEX PK_tb_giveItem
	ON tb_giveItem (
		giveItemNo ASC
	);

ALTER TABLE tb_giveItem
	ADD
		CONSTRAINT PK_tb_giveItem
		PRIMARY KEY (
			giveItemNo
		);

ALTER TABLE tb_give
	ADD
		CONSTRAINT FK_tb_project_TO_tb_give
		FOREIGN KEY (
			projectNo
		)
		REFERENCES tb_project (
			projectNo
		);

ALTER TABLE tb_give
	ADD
		CONSTRAINT FK_tb_member_TO_tb_give
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_project
	ADD
		CONSTRAINT FK_tb_member_TO_tb_project
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_notice
	ADD
		CONSTRAINT FK_tb_member_TO_tb_notice
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_company
	ADD
		CONSTRAINT FK_tb_member_TO_tb_company
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_reward
	ADD
		CONSTRAINT FK_tb_project_TO_tb_reward
		FOREIGN KEY (
			projectNo
		)
		REFERENCES tb_project (
			projectNo
		);

ALTER TABLE tb_review
	ADD
		CONSTRAINT FK_tb_project_TO_tb_review
		FOREIGN KEY (
			projectNo
		)
		REFERENCES tb_project (
			projectNo
		);

ALTER TABLE tb_review
	ADD
		CONSTRAINT FK_tb_member_TO_tb_review
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_cheer
	ADD
		CONSTRAINT FK_tb_project_TO_tb_cheer
		FOREIGN KEY (
			projectNo
		)
		REFERENCES tb_project (
			projectNo
		);

ALTER TABLE tb_cheer
	ADD
		CONSTRAINT FK_tb_cheer_TO_tb_cheer
		FOREIGN KEY (
			cheerParentNo
		)
		REFERENCES tb_cheer (
			cheerNo
		);

ALTER TABLE tb_cheer
	ADD
		CONSTRAINT FK_tb_member_TO_tb_cheer
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_favorite
	ADD
		CONSTRAINT FK_tb_member_TO_tb_favorite
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_favorite
	ADD
		CONSTRAINT FK_tb_project_TO_tb_favorite
		FOREIGN KEY (
			projectNo
		)
		REFERENCES tb_project (
			projectNo
		);

ALTER TABLE tb_QnA
	ADD
		CONSTRAINT FK_tb_project_TO_tb_QnA
		FOREIGN KEY (
			projectNo
		)
		REFERENCES tb_project (
			projectNo
		);

ALTER TABLE tb_QnA
	ADD
		CONSTRAINT FK_tb_QnA_TO_tb_QnA
		FOREIGN KEY (
			qnaParentNo
		)
		REFERENCES tb_QnA (
			qnaNo
		);

ALTER TABLE tb_QnA
	ADD
		CONSTRAINT FK_tb_member_TO_tb_QnA
		FOREIGN KEY (
			id
		)
		REFERENCES tb_member (
			id
		);

ALTER TABLE tb_payment
	ADD
		CONSTRAINT FK_tb_give_TO_tb_payment
		FOREIGN KEY (
			giveNo
		)
		REFERENCES tb_give (
			giveNo
		);

ALTER TABLE tb_item
	ADD
		CONSTRAINT FK_tb_project_TO_tb_item
		FOREIGN KEY (
			projectNo
		)
		REFERENCES tb_project (
			projectNo
		);

ALTER TABLE tb_giveItem
	ADD
		CONSTRAINT FK_tb_give_TO_tb_giveItem
		FOREIGN KEY (
			giveNo
		)
		REFERENCES tb_give (
			giveNo
		);

-- 기업명 길이 변경
alter table tb_company modify companyName varchar2(100);

---------------------------------------------시퀀스 생성

DROP SEQUENCE seq_project;
DROP SEQUENCE seq_item;
DROP SEQUENCE seq_reward;
DROP SEQUENCE seq_review;
DROP SEQUENCE seq_QnA;
DROP SEQUENCE seq_cheer;
DROP SEQUENCE seq_favorite;
DROP SEQUENCE seq_giveItem;
DROP SEQUENCE seq_give;
DROP SEQUENCE seq_payment;
DROP SEQUENCE seq_data;
DROP SEQUENCE seq_notice;



CREATE SEQUENCE seq_project
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_item
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_reward
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_review
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_cheer
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_QnA
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_favorite
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_give
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_giveItem
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_payment
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_data
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE SEQUENCE seq_notice
START WITH 1
INCREMENT BY 1
NOCACHE;		
		

