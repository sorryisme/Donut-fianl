회원 관리 테이블 : 

	회원 상태 플래그 : 관리자 0 / 기부자 1 (기본값) /기부단체 2
	탈퇴 플래그 :  회원가입시 1(기본값) / 탈퇴시 0

응원 댓글 테이블 :

	응원댓글 알림 플래그 : 처음 생성시 0 (기본값) / 응원댓글 달린 후 1 / 응원 답글 확인 후 2

QnA테이블 댓글 :

	QnA 알림 플래그 : 처음 생성시 0 (기본값) / QnA 답글 달린 후 1 / QnA 답글 확인 후 2
	

금액/물품 플래그:

	물품/아이템: 금액 플래그 1 / 물품 플래그 2


* 시퀀스로 이루어진 NO(번호) 전부 인설트시 들어간 데이터의 번호에 따라 설정 해주어야함
---------------------------------------------------연습장

select id,accMoney,RANK() OVER(ORDER BY accMoney DESC) AS RK 
from tb_member
where (accMoney is not null) and statusFlag=1 


select * from tb_member
where id='c1'

select * from tb_company
where id='c1'

----------------------------------------------------관리자

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('아메리카노', '1234',
null,null,null,null,null,null,0,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('카페라떼', '1234',
null,null,null,null,null,null,0,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('카푸치노', '1234',
null,null,null,null,null,null,0,1);

delete from tb_member
where dropFlag is null


----------------------------------------------------기부자 회원 가입

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test1', '1234',
'이수현', '01027709755', 'aaa@aaa.com', 'imgtest.jpg',3000000,sysdate,1,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test2', '1234',
'testname4', '01040000000', 'bbb@bbb.com', 'imgtest.jpg',3000000,sysdate,1,1);


insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test3', '1234',
'testname3', '01030000000', 'ccc@ccc.com', 'imgtest.jpg',4000000,sysdate,1,1);


insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test4', '1234',
'testname2', '01020000000', 'ddd@ddd.com', 'imgtest.jpg',5000000,sysdate,1,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test5', '1234',
'testname1', '01010000000', 'eee@eee.com', 'imgtest.jpg',5000000,sysdate,1,1);

------------------------------------------------------------------------기부단체 회원 가입
insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('company1', '1234',
'testcompany1', '01010000000', 'company1@company.com', 'imgtest',5000000,sysdate,2,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('company2', '1234',
'testcompany2', '01010000000', 'company2@company.com', 'imgtest',6000000,sysdate,2,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('company3', '1234',
'testcompany3', '01010000000', 'company3@company.com', 'imgtest',7000000,sysdate,2,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('company4', '1234',
'testcompany4', '01010000000', 'company4@company.com', 'imgtest',8000000,sysdate,2,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('company5', '1234',
'testcompany5', '01010000000', 'company5@company.com', 'imgtest',9000000,sysdate,2,1);

---------------------------------------------------------------기부단체 정보 삽입

insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company1','companytest','01099833222','경기도성남시수정구','신한은행','110-3333-332221');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company2','companytest','01011112225','경기도성남시중원구','국민은행','110-4444-444444');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company3','companytest','01011112224','서울특별시 강남구','하나은행','110-5555-555555');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company4','companytest','01011112223','경기도성남시분당구','기업은행','110-6666-666666');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company5','companytest','01011112222','서울특별시 강북','대구은행','110-7777-777777');

------------------------------------------------------------------물품데이터

insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '도시락 용기', '생활용품', 1000);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '겨울돕바', '옷', 1500);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '이불', '생활용품', 1000);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '텐트', '생활용품', 1500);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '도시락', '먹을거', 500);


---------------------------------------------------------------------기부프로젝트

insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company1', '불우이웃에게 희망을 ', '물품','아동',
        '소녀/소년 가장', '아픈 가족들을 보살피는 9살 해은이
    “언니, 오빠들이 장애가 있어서 제가 잘 도와야겠다는 생각이 들었어요. 언니,
    오빠들이 장애가 없었으면 좋겠어요.” 사실 해은이 엄마와 3명의 언니오빠들은 지적장애를 
    가지고 있습니다. 게다가 엄마는 2년 전 동생을 낳은 뒤 산후 후유증을 앓고, 
    지난 7월 자궁 혹 제거 수술도 받아 몸을 조금 움직이는 것도 쉽지 않습니다. 아직 3살도 채 되지 않은 동생, 
    지적장애를 가진 엄마와 형제들, 그리고 일을 하러 집을 비운 아빠. 해은이는 그런 가족들을 대신해 집안일을 도맡아하는 의젓한 아이입니다.
    에어컨 설치 일을 하는 아빠는 몇 년 전 사고로 인해 다리를 다쳤습니다.
    꾸준히 일을 하시지만 한 달 꼬박 일해 버는 수입은 70만원. 일곱 식구의 생활비를 감당하기엔 턱없이 부족합니다. 
    다행히도 이웃주민의 도움으로 이사 갈 집을 구했지만 형편이 마냥 좋지는 않습니다. 집 안팎으로 살림살이가 그대로 남겨진 채, 
    오랫동안 사람이 살지 않았던 빈 집... 어느 것 하나 성한 것이 없어 추운 겨울을 어떻게 나야할지 벌써부터 걱정입니다. 
', 'test', sysdate, sysdate, 2, 300044000, 777777777, 77, 3000);

insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company2', '위안부 문제 ', '금액','지역 사회',
        '재해민', '겨울, 봄을 기다리는 나비를 소개합니다
        안녕하세요! 겨울, 봄을 기다리는 나비 프로젝트 팀을 대표하는 3명의 소년들을 소개합니다. 
        1. 성새빛 (23세/휴학/경남대학교 일어교육과) 2. 이시헌 (23세/휴학/경남대학교 기계공학부) 
        3. 주성현 (23세/재학/창원대학교 제어계측공학과) 저희 3명의 대학생은 중, 고등학교 때부터 친한 친구 사이로 사회를 바라보는 관점
        또한 비슷했습니다. 그러던 중, 2015년 한일 일본군 위안부 합의 문제에 관심을 가지고 많은 얘기를 나누었고 
        모든 친구들이 군 복무가 끝난 지금에서야 프로젝트를 계획하고 진행하게 되었습니다.
', 'img.jpg', sysdate, sysdate, 2, 300044000, 777777777, 77, 4000);

insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company3', '불우이웃에게 희망을 ', '물품','아동',
        '소녀/소년 가장', 
        '보육원에 살고 있는 우리들의 이야기를 들어보세요. 
        스스로 보육원에서의 삶을 선택하는 아이들은 없습니다. 
        뜻하지 않은 가정의 해체로, 가장 가까운 부모님으로부터 받은 학대로 인해, 
        부모의 선택으로 인해.. 아이들은 누군가의 선택으로 인해 상처를 안고 보육원에 입소를 하게 됩니다. 
        보육원에 살고 있는 아이들은 엄마 아빠가 아닌 생활지도원 선생님과 그리고 비슷한 상황에 처해있는 친구들과 가족이 됩니다. 
        서로의 상처를 보듬어주며 스스로 해야 할 일을 너무 빨리 배워버린 아이들. 
        보육원이라는 울타리 안에서는 그래도 아이들은 서로가 있어 행복할 수 있습니다. 하지만 첫 사회로의 관문인 어린이집, 유치원에 가게 되면 알 수 없는 벽에 부딪히는 아이들을 발견합니다. 친구들과의 비교, 그리고 주변에서 보내는 차별의 시선들.. 학교라는 관문은 더욱 어렵습니다. 아이들은 ‘내가 보육원에서 얼마나 잘 지내는지, 함께 지내는 친구들은 나에게 어떤 존재인지, 내가 좋아하는 것은 무엇인지, 어떤 취미를 가지고 있는 지’ 보여주고 싶은 모습이 많지만, 사람들은 ‘엄마 없는 아이, 아빠 없는 아이, 부족한 아이’와 같은 부족한 것들에 더 관심이 많은 것 같습니다. 그러다보면 아이들은 사회가, 친구들이 만든 벽 앞에서 자꾸만 움츠려들고 점점 더 외로워집니다. 학교생활이 즐겁지 않고 공부에 집중도 되지 않습니다. 이렇게 남들과 다른 환경은 늘 소외와 선입견과 잘못된 부정적 시선으로 타인에 의해 아이들에 도달하고 아이들에게는 남모를 스트레스와 고민, 외로움이 됩니다. 
        ', 'done.jpg', sysdate, sysdate, 2, 300044000, 777777777, 77, 5000);
        
insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company4', '노인을 사랑하자 ', '금액','노인',
        '독거 노인', 
        '아직도 연탄을 사용하는 가구가 있나요?
        연탄나눔활동 현장에서 아직도 연탄을 사용하는 가구가 있느냐는 질문을 자주 듣습니다. 
        "네. 아직도 전국의 13만여 가구 이상은 연탄으로 추운 겨울을 이겨내고 있습니다. 
        " 3.65kg, 22개-25개의 구멍이 뚫린 연탄은 단순히 불을 떼는 난방 수단 그 이상의 역할을 합니다. 
        특히나 연탄사용가구들은 고지대달동네 혹은 도시빈민지역 또는 농어촌산간벽지 등에 
        거주하는 경우가 많아 추운 겨울이 더욱 힘겹습니다. 하지만 한편으로 연탄이 있어 겨울을 버텨낸다는 이야기를 해주시니, 
        이 활동을 멈출수가 없습니다. "쌀과 연탄만 있으면 우리는 부자야. 추운 겨울도 걱정없어" 
        6-70년대 이야기가 아닌, 오늘을 함께 살아가는 우리 이웃들의 삶입니다. ',
        'doneimg.jpg', sysdate, sysdate, 2, 3000000, 7777777, 77, 6000);
        
insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company5', '미세먼지의 원인 ', '금액','지역 사회',
        '환경', 
        '미세먼지의 원인? : 중국 vs 국내 사실 미세먼지 해결은 어쩌면 너무도 간단합니다. 
        발생 자체를 줄이면 되는 것이니 그것이 어디에서 오는지 알고 있다면, 
        아는 만큼 우리의 생활과 문화를 바꾸는 것으로 시작하면 됩니다. 잘 아시다시피 현재 이야기되는
        미세먼지의 원인은 크게 국외와 국내로 나뉩니다. 중국의 공업단지와 국내의 노후화력발전소, 
        자동차, 공장이 있죠. 미세먼지가 심해지면 심해질수록, 원인이 무엇이냐에 대한 첨예한 대립이 나타나고 있습니다. 
        ', 
        'doneimg.jpg', sysdate, sysdate, 2, 666666, 777777, 77, 7000);


-------------------------------------------------------프로젝트 물품등록

insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 1, '도시락', 5000, 300, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 2, '딸기파이', 5000, 400, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 3, '초코파이', 5000, 500, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 4, '연탄', 5000, 600, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 5, '담요', 5000, 700, 1000);

---------------------------------------------------------리워드

insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 1, '포인트', 50000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 2, '뱃지', 60000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 3, '상품', 70000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 4, '돈', 80000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 5, '순금', 90000);


----------------------------------------------------기부
insert into tb_give(giveNo, projectNo, id, giveMoney, giveRegdate) 
    values (seq_give.nextval, 2, 'test1', 20000000000, sysdate);
insert into tb_give(giveNo, projectNo, id, giveMoney, giveRegdate)
    values (seq_give.nextval, 3, 'test2', 40000000000, sysdate);
insert into tb_give(giveNo, projectNo, id, giveMoney, giveRegdate)
    values (seq_give.nextval, 5, 'test3', 50000000000, sysdate);
insert into tb_give(giveNo, projectNo, id, giveMoney, giveRegdate)
    values (seq_give.nextval, 1, 'test4', 60000000000, sysdate);
insert into tb_give(giveNo, projectNo, id, giveMoney, giveRegdate)
    values (seq_give.nextval, 4, 'test5', 70000000000, sysdate);
    
    
----------------------------------------------기부물품 등록
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 1, '초코파이', 3000, 300);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 2, '딸기파이', 4000, 400);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 3, '연탄', 5000, 500);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 4, '담요',6000, 600);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 5, '돕바', 70000, 700);


------------------------------------------------------------------------------결제정보 (수정예정)
--set define off
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (1, '카드', 270000, sysdate, '박성호', '경기도 성남시 분당구', '01099848993','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (2, '카드', 230000, sysdate, '김지성', '서울특별시 분당구', '00000000000','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20020130114048862234&noMethod=1 ');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (3, '계좌이체', 230000, sysdate, '김지혜', '경기도 성남시 수정구', '00000000001','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20080130114048862234&noMethod=1 ');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (4, '카드', 30000, sysdate, '박병현', '경기도 성남시 서울구', '00000000002','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20180130114048862234&noMethod=1 ');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (5, '계좌이체', 900000, sysdate, '권도훈', '경기도 수원시 팔달구', '00000000003','memo', sysdate,'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20170730114048862234&noMethod=1 ');

    

    -----------응원댓글
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 1, 'test1', '힘을 내세요 !!',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 2, 'test2', '응원 합니다.',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 3, 'test3', '용기를 가지세요 !!',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 4, 'test4', '화이팅 화이팅 !!',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 5, 'test5', '힘을 내용 !!',sysdate, 0, null); 
    -------------대댓글
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 1, 'company1', '응원 감사합니다.',sysdate, 0, 1); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 2, 'company2', '응원 해주셔서 감사합니다',sysdate, 0, 2); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 3, 'company3', '응원 감사합니다.',sysdate, 0, 3); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 4, 'company4', '응원에 감사드립니다',sysdate, 0, 4); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 5, 'company5', '감사합니다',sysdate, 0, 5); 

-----------qna질문 글
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 1, 'test1', '이 기부 제대로 진행 되고 있나요 ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 2, 'test2', '이 기부 제대로 진행 되고 있나요 ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 3, 'test3', '이 기부 제대로 진행 되고 있나요 ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 4, 'test4', '이 기부 제대로 진행 되고 있나요 ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 5, 'test5', '이 기부 제대로 진행 되고 있나요 ?', sysdate, 0, null);
---------qna대댓글
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 1, 'company1', '네 정상적으로 진행 되고 있습니다. 곧 종료됩니다', sysdate, 0, 1);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 2, 'company2', '종료된 프로젝트 입니다. 후기에서 기부금 사용내역을 확인 할수 있습니다.', sysdate, 0, 2);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 3, 'company3', '곧 후기에서 사용 내역을 확인 하실수 있습니다.', sysdate, 0, 3);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 4, 'company4', '네 곧 마감 됩니다!', sysdate, 0, 4);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 5, 'company5', '네', sysdate, 0, 5);






--------------------------------------------------------기부후기
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company1',
    '우리는 이렇게 사용 했습니다!
    기부자님 감사합니다.
아버님께서 기부자님께 드리는 말씀을 대신 전달합니다.

"제가 정말 달라진 게 있어요. 제 인생 모토는 안 주고 안 받기였는데요. 너무 많은 분들이 도와주셔서 얼마 전에 기부를 시작했어요. 
받은 건 제가 할 수 있을 만큼 돌려주려구요..제가 나눠주면 저 같은 사람이 생기지 않겠어요?...너무 기적 같아서 “
수 천만 원의 빚을 감당하던 아버님께 기적을 선물해주신 기부자님, 정말 감사합니다. 
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company2',
    '우리는 이렇게 사용 했습니다!
    박금선 할머니의 전하고 싶은 말
    박금선 할머니는‘누군가에겐 평범하고, 당연한 생활들이 과연 우리 가정에서도 가능할까?’라는 말을 하셨습니다. 
    하지만 현재의 할머니는 많은 분들의 도움과 응원으로 할머니가 그토록 원하시던 평범한 일상이라는 꿈에 다가설 수 있게 되었다고 말씀하셨습니다. 
    또한 도움을 주신 한 분, 한 분 의 정성을 잊지 않고 성원에 보답하기 위해서라도 꼭 행복한 모습을 보여드리겠다고 하셨습니다.
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company3',
    '아이들 마음 속의 가시들이 사라지기 시작했어요
    사회성발달 프로그램을 하기 이전, 센터에서는 항상 싸우는 소리, 
    놀리는 소리, 괴롭히는 소리가 계속 되었어요. 아이들 간 싸움이 나면 물건을 던지는 일도 종종 있었고요. 
    사랑을 받지 못하고, 누군가를 사랑하는 방법을 모르는 아이들에게 어떻게 하면 사랑을 나누는 방법을 알려줄 수 있을까 고민을 했었어요. 
    오랜 고민을 통해 사회성 발달 프로그램을 계획하게 되었습니다. 
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company4',
    '이웃들의 마음이 빚어낸 작지만 소중한 나눔
    경제 발전을 통해 우리 삶이 과거에 비해 매우 윤택해지고 있지만 여전히 우리 주변에는 식사 한 끼를 걱정해야 하는 많은 이웃들이 존재하고 있습니다.
    “요즘에 밥 없어서 못 먹는 사람이 어디 있어?”라고 이야기를 하는 분들도 계시지만 실제로 우리의 생각보다 많은 분들이 끼니를 걱정합니다.
    
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company5',
    '치료를 할 수 있게 도움을 주신 모든 분들께 감사드립니다
    많은 분들의 도움으로 저 멀리 필리핀에서 환자 2명이 
    10개월동안 2시간 거리의 마닐라 국립병원을 찾아다니며 치료를 받게 되었습니다. 
    이번 모금을 통해 지원을 받게 된 제이코보 티아론님은 다행히 수술 말고 
    약물로도 충분히 치료가 가능하다고 해서 매달 꾸준히 국립병원을 방문해 약을 받고 치료 중에 있습니다. 
    ','img.jpg', sysdate);
    
--------------------------------------------------------------즐겨찾기

insert into tb_favorite(favoriteNo, id, projectNo)
    values(seq_favorite.nextval, 'test1', 1);
insert into tb_favorite(favoriteNo, id, projectNo)
    values(seq_favorite.nextval, 'test2', 2);
insert into tb_favorite(favoriteNo, id, projectNo)
    values(seq_favorite.nextval, 'test3', 3);
insert into tb_favorite(favoriteNo, id, projectNo)
    values(seq_favorite.nextval, 'test4', 4);
insert into tb_favorite(favoriteNo, id, projectNo)
    values(seq_favorite.nextval, 'test5', 5);


--------------------------------공지사항

insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
    values(seq_notice.nextval, '아메리카노', 'test2', 'test2', sysdate);
insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
    values(seq_notice.nextval, '카푸치노', 'test3', 'test3', sysdate);
insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
    values(seq_notice.nextval, 'admin3', 'test4', 'test4', sysdate);
--insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
--    values(seq_notice.nextval, 'admin4', 'test5', 'test5', sysdate);

--insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
--    values(seq_notice.nextval, 'admin5', 'test1', 'test1', sysdate);

select * from tb_notice;
    
    
delete from tb_notice 
where id='company5'
    
---------------------------------------------테이블 조회
select * from tb_member;
select * from tb_company;
select * from tb_data;
select * from tb_project;
select * from tb_item;
select * from tb_reward;
select * from tb_give;
select * from tb_giveItem;
select * from tb_payment;
select * from tb_cheer;
select * from tb_qna;
select * from tb_review;
select * from tb_favorite;
select * from tb_notice;

commit
