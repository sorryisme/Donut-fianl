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

/* ȸ������ */
DROP TABLE tb_member 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE tb_give 
	CASCADE CONSTRAINTS;

/* ��� ������Ʈ */
DROP TABLE tb_project 
	CASCADE CONSTRAINTS;

/* �������� */
DROP TABLE tb_notice 
	CASCADE CONSTRAINTS;

/* ��� ��ü */
DROP TABLE tb_company 
	CASCADE CONSTRAINTS;

/* ������ */
DROP TABLE tb_reward 
	CASCADE CONSTRAINTS;

/* ������Ʈ �ı� */
DROP TABLE tb_review 
	CASCADE CONSTRAINTS;

/* ������� */
DROP TABLE tb_cheer 
	CASCADE CONSTRAINTS;

/* ��ǰ������ */
DROP TABLE tb_data 
	CASCADE CONSTRAINTS;

/* ���ã�� */
DROP TABLE tb_favorite 
	CASCADE CONSTRAINTS;

/* QnA */
DROP TABLE tb_QnA 
	CASCADE CONSTRAINTS;

/* �������� */
DROP TABLE tb_payment 
	CASCADE CONSTRAINTS;

/* ������Ʈ ��ǰ */
DROP TABLE tb_item 
	CASCADE CONSTRAINTS;

/* ��� ��ǰ */
DROP TABLE tb_giveItem 
	CASCADE CONSTRAINTS;

/* ȸ������ */
CREATE TABLE tb_member (
	id VARCHAR2(20) NOT NULL, /* ���̵� */
	pwd VARCHAR2(20), /* ��й�ȣ */
	name VARCHAR2(20), /* �̸� */
	phone VARCHAR2(30), /* �ڵ��� ��ȣ */
	email VARCHAR2(30), /* �̸��� */
	picture VARCHAR(255), /* ���� */
	accMoney NUMBER(20), /* ��δ����ݾ� */
	regDate DATE, /* ����� */
	statusFlag NUMBER(3), /* ȸ�������÷��� */
	dropFlag NUMBER(3) /* Ż���÷��� */
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

/* ��� */
CREATE TABLE tb_give (
	giveNo NUMBER(5) NOT NULL, /* ��ι�ȣ */
	projectNo NUMBER(5), /* ������Ʈ ��ȣ */
	id VARCHAR2(20), /* ���̵� */
	giveMoney NUMBER(20), /* ��αݾ� */
	giveRegdate DATE /* ������� */
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

/* ��� ������Ʈ */
CREATE TABLE tb_project (
	projectNo NUMBER(5) NOT NULL, /* ������Ʈ ��ȣ */
	id VARCHAR2(20), /* ID(�����) */
	projectSubject VARCHAR2(200), /* ������Ʈ ���� */
	category1 VARCHAR2(30), /* ī�װ� */
	category2 VARCHAR2(30), /* ī�װ�2 */
	category3 VARCHAR2(30), /* ī�װ�3 */
	story CLOB, /* ���丮 */
	projectImg VARCHAR(255), /* �̹��� */
	projectEnd DATE, /* ������Ʈ ������ */
	projectRegdate DATE, /* ����� */
	moneyOrItem NUMBER(3), /* ��ǰ/�ݾ� Flag */
	totalMoney NUMBER(20), /* �����ݾ� */
	goal NUMBER(20), /* ��ǥ�ݾ� */
	percent NUMBER(3), /* �޼��� */
	givePerson NUMBER(20) /* ����ο� */
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

/* �������� */
CREATE TABLE tb_notice (
	noticeNo NUMBER(5) NOT NULL, /* �۹�ȣ */
	id VARCHAR2(20), /* ���̵� */
	noticeTitle VARCHAR2(200), /* ���� */
	noticeContent VARCHAR2(2000), /* ���� */
	noticeRegdate DATE /* ������� */
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

/* ��� ��ü */
CREATE TABLE tb_company (
	id VARCHAR2(20) NOT NULL, /* ���̵� */
	companyName VARCHAR2(20), /* ��ü�� */
	companyCall VARCHAR2(30), /* ������ȭ��ȣ */
	companyAddr VARCHAR2(255), /* �ּ� */
	bank VARCHAR2(20), /* �������� */
	account VARCHAR2(20) /* ���¹�ȣ */
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

/* ������ */
CREATE TABLE tb_reward (
	rewardNo NUMBER(5) NOT NULL, /* �������ȣ */
	projectNo NUMBER(5), /* ������Ʈ ��ȣ */
	rewardItem VARCHAR2(255), /* ������ ǰ�� */
	condition NUMBER(10) /* �ݾ����� */
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

/* ������Ʈ �ı� */
CREATE TABLE tb_review (
	projectNo NUMBER(5) NOT NULL, /* ������Ʈ ��ȣ */
	id VARCHAR2(20), /* ���̵� */
	reviewContent CLOB, /* �� ���� */
	reviewImg VARCHAR(255), /* ���������� */
	reviewRegdate DATE /* ������� */
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

/* ������� */
CREATE TABLE tb_cheer (
	cheerNo NUMBER(5) NOT NULL, /* ������ȣ */
	projectNo NUMBER(5), /* ������Ʈ ��ȣ */
	id VARCHAR2(20), /* ���̵� */
	cheerContent VARCHAR2(200), /* ��۳��� */
	cheerRegdate DATE, /* ������� */
	cheerNotify NUMBER(3), /* ������� �˸�flag */
	cheerParentNo NUMBER(5) /* ������ȣ(�θ�) */
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

/* ��ǰ������ */
CREATE TABLE tb_data (
	dataItemNo NUMBER(5) NOT NULL, /* ��ǰ��ȣ */
	dataItemName VARCHAR2(255), /* ��ǰ�� */
	dataItemCategory VARCHAR2(30), /* ��ǰī�װ� */
	dataItemPrice NUMBER(10) /* ���簡�� */
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

/* ���ã�� */
CREATE TABLE tb_favorite (
	favoriteNo NUMBER(5) NOT NULL, /* ���ã�� ��ȣ */
	id VARCHAR2(20) NOT NULL, /* ���̵�(�����) */
	projectNo NUMBER(5) NOT NULL /* ������Ʈ ��ȣ */
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
	qnaNo NUMBER(5) NOT NULL, /* QnA ��ȣ */
	projectNo NUMBER(5), /* ������Ʈ ��ȣ */
	id VARCHAR2(20), /* ���̵� */
	qnaContent VARCHAR2(400), /* QnA ���� */
	qnaRegdate DATE, /* ������� */
	qnaNotify NUMBER(3), /* QnA �˸� */
	qnaParentNo NUMBER(5) /* QnA��ȣ(�θ�) */
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

/* �������� */
CREATE TABLE tb_payment (
	giveNo NUMBER(5) NOT NULL, /* ��ι�ȣ */
	payMethod VARCHAR2(20), /* ������� */
	payMoney NUMBER(20), /* �����ݾ� */
	permissionDate DATE, /* ���� ���� ���� */
	receiver VARCHAR2(20), /* �޴»�� */
	addr VARCHAR2(255), /* �ּ� */
	call VARCHAR2(30), /* ��ȭ��ȣ */
	memo VARCHAR2(100), /* ��۸޸� */
	payDate DATE, /* �������� */
	receiptURL VARCHAR2(1000) /* ������URL */
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

/* ������Ʈ ��ǰ */
CREATE TABLE tb_item (
	projectItemNo NUMBER(5) NOT NULL, /* ������Ʈ ��ǰ��ȣ */
	projectNo NUMBER(5), /* ������Ʈ ��ȣ */
	itemName VARCHAR2(20), /* ��ǰ�� */
	itemPrice NUMBER(10), /* ���簡�� */
	itemAmount NUMBER(5), /* ��μ��� */
	goalAmount NUMBER(5) /* ��ǥ���� */
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

/* ��� ��ǰ */
CREATE TABLE tb_giveItem (
	giveItemNo NUMBER(5) NOT NULL, /* ��ι�ǰ��ȣ */
	giveNo NUMBER(5), /* ��ι�ȣ */
	giveItemName VARCHAR2(255), /* ��ǰ�� */
	giveItemPrice NUMBER(10), /* ���簡�� */
	giveItemAmount NUMBER(5) /* ��ǰ���� */
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

-- ����� ���� ����
alter table tb_company modify companyName varchar2(100);

---------------------------------------------������ ����

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
		

