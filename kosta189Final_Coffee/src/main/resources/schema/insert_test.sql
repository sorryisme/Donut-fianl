ȸ�� ���� ���̺� : 

	ȸ�� ���� �÷��� : ������ 0 / ����� 1 (�⺻��) /��δ�ü 2
	Ż�� �÷��� :  ȸ�����Խ� 1(�⺻��) / Ż��� 0

���� ��� ���̺� :

	������� �˸� �÷��� : ó�� ������ 0 (�⺻��) / ������� �޸� �� 1 / ���� ��� Ȯ�� �� 2

QnA���̺� ��� :

	QnA �˸� �÷��� : ó�� ������ 0 (�⺻��) / QnA ��� �޸� �� 1 / QnA ��� Ȯ�� �� 2
	

�ݾ�/��ǰ �÷���:

	��ǰ/������: �ݾ� �÷��� 1 / ��ǰ �÷��� 2


* �������� �̷���� NO(��ȣ) ���� �μ�Ʈ�� �� �������� ��ȣ�� ���� ���� ���־����
---------------------------------------------------������

select id,accMoney,RANK() OVER(ORDER BY accMoney DESC) AS RK 
from tb_member
where (accMoney is not null) and statusFlag=1 


select * from tb_member
where id='c1'

select * from tb_company
where id='c1'

----------------------------------------------------������

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('�Ƹ޸�ī��', '1234',
null,null,null,null,null,null,0,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('ī���', '1234',
null,null,null,null,null,null,0,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('īǪġ��', '1234',
null,null,null,null,null,null,0,1);

delete from tb_member
where dropFlag is null


----------------------------------------------------����� ȸ�� ����

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test1', '1234',
'�̼���', '01027709755', 'aaa@aaa.com', 'imgtest.jpg',3000000,sysdate,1,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test2', '1234',
'testname4', '01040000000', 'bbb@bbb.com', 'imgtest.jpg',3000000,sysdate,1,1);


insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test3', '1234',
'testname3', '01030000000', 'ccc@ccc.com', 'imgtest.jpg',4000000,sysdate,1,1);


insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test4', '1234',
'testname2', '01020000000', 'ddd@ddd.com', 'imgtest.jpg',5000000,sysdate,1,1);

insert into tb_member(id, pwd, name, phone, email, picture, accMoney, regDate, statusFlag, dropFlag) values ('test5', '1234',
'testname1', '01010000000', 'eee@eee.com', 'imgtest.jpg',5000000,sysdate,1,1);

------------------------------------------------------------------------��δ�ü ȸ�� ����
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

---------------------------------------------------------------��δ�ü ���� ����

insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company1','companytest','01099833222','��⵵�����ü�����','��������','110-3333-332221');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company2','companytest','01011112225','��⵵�������߿���','��������','110-4444-444444');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company3','companytest','01011112224','����Ư���� ������','�ϳ�����','110-5555-555555');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company4','companytest','01011112223','��⵵�����úд籸','�������','110-6666-666666');
insert into tb_company(id, companyName, companyCall, companyAddr, bank, account)
    values('company5','companytest','01011112222','����Ư���� ����','�뱸����','110-7777-777777');

------------------------------------------------------------------��ǰ������

insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '���ö� ���', '��Ȱ��ǰ', 1000);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '�ܿﵽ��', '��', 1500);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '�̺�', '��Ȱ��ǰ', 1000);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '��Ʈ', '��Ȱ��ǰ', 1500);
insert into tb_data(dataItemNo, dataItemName, dataItemCategory, dataItemPrice) 
    values(seq_data.nextval, '���ö�', '������', 500);


---------------------------------------------------------------------���������Ʈ

insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company1', '�ҿ��̿����� ����� ', '��ǰ','�Ƶ�',
        '�ҳ�/�ҳ� ����', '���� �������� �����Ǵ� 9�� ������
    �����, �������� ��ְ� �־ ���� �� ���;߰ڴٴ� ������ ������. ���,
    �������� ��ְ� �������� ���ھ��.�� ��� ������ ������ 3���� ��Ͽ������� ������ָ� 
    ������ �ֽ��ϴ�. �Դٰ� ������ 2�� �� ������ ���� �� ���� �������� �ΰ�, 
    ���� 7�� �ڱ� Ȥ ���� ������ �޾� ���� ���� �����̴� �͵� ���� �ʽ��ϴ�. ���� 3�쵵 ä ���� ���� ����, 
    ������ָ� ���� ������ ������, �׸��� ���� �Ϸ� ���� ��� �ƺ�. �����̴� �׷� �������� ����� �������� ���þ��ϴ� ������ �����Դϴ�.
    ������ ��ġ ���� �ϴ� �ƺ��� �� �� �� ���� ���� �ٸ��� ���ƽ��ϴ�.
    ������ ���� �Ͻ����� �� �� ���� ���� ���� ������ 70����. �ϰ� �ı��� ��Ȱ�� �����ϱ⿣ �ξ��� �����մϴ�. 
    �������� �̿��ֹ��� �������� �̻� �� ���� �������� ������ ���� ������ �ʽ��ϴ�. �� �������� �츲���̰� �״�� ������ ä, 
    �������� ����� ���� �ʾҴ� �� ��... ��� �� �ϳ� ���� ���� ���� �߿� �ܿ��� ��� �������� ������� �����Դϴ�. 
', 'test', sysdate, sysdate, 2, 300044000, 777777777, 77, 3000);

insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company2', '���Ⱥ� ���� ', '�ݾ�','���� ��ȸ',
        '���ع�', '�ܿ�, ���� ��ٸ��� ���� �Ұ��մϴ�
        �ȳ��ϼ���! �ܿ�, ���� ��ٸ��� ���� ������Ʈ ���� ��ǥ�ϴ� 3���� �ҳ���� �Ұ��մϴ�. 
        1. ������ (23��/����/�泲���б� �Ͼ����) 2. �̽��� (23��/����/�泲���б� �����к�) 
        3. �ּ��� (23��/����/â�����б� ����������а�) ���� 3���� ���л��� ��, ����б� ������ ģ�� ģ�� ���̷� ��ȸ�� �ٶ󺸴� ����
        ���� ����߽��ϴ�. �׷��� ��, 2015�� ���� �Ϻ��� ���Ⱥ� ���� ������ ������ ������ ���� ��⸦ �������� 
        ��� ģ������ �� ������ ���� ���ݿ����� ������Ʈ�� ��ȹ�ϰ� �����ϰ� �Ǿ����ϴ�.
', 'img.jpg', sysdate, sysdate, 2, 300044000, 777777777, 77, 4000);

insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company3', '�ҿ��̿����� ����� ', '��ǰ','�Ƶ�',
        '�ҳ�/�ҳ� ����', 
        '�������� ��� �ִ� �츮���� �̾߱⸦ ������. 
        ������ ������������ ���� �����ϴ� ���̵��� �����ϴ�. 
        ������ ���� ������ ��ü��, ���� ����� �θ�����κ��� ���� �д�� ����, 
        �θ��� �������� ����.. ���̵��� �������� �������� ���� ��ó�� �Ȱ� �������� �ԼҸ� �ϰ� �˴ϴ�. 
        �������� ��� �ִ� ���̵��� ���� �ƺ��� �ƴ� ��Ȱ������ �����԰� �׸��� ����� ��Ȳ�� ó���ִ� ģ����� ������ �˴ϴ�. 
        ������ ��ó�� ������ָ� ������ �ؾ� �� ���� �ʹ� ���� ������� ���̵�. 
        �������̶�� ��Ÿ�� �ȿ����� �׷��� ���̵��� ���ΰ� �־� �ູ�� �� �ֽ��ϴ�. ������ ù ��ȸ���� ������ �����, ��ġ���� ���� �Ǹ� �� �� ���� ���� �ε����� ���̵��� �߰��մϴ�. ģ������� ��, �׸��� �ֺ����� ������ ������ �ü���.. �б���� ������ ���� ��ƽ��ϴ�. ���̵��� ������ ���������� �󸶳� �� ��������, �Բ� ������ ģ������ ������ � ��������, ���� �����ϴ� ���� ��������, � ��̸� ������ �ִ� ���� �����ְ� ���� ����� ������, ������� ������ ���� ����, �ƺ� ���� ����, ������ ���̡��� ���� ������ �͵鿡 �� ������ ���� �� �����ϴ�. �׷��ٺ��� ���̵��� ��ȸ��, ģ������ ���� �� �տ��� �ڲٸ� ��������� ���� �� �ܷο����ϴ�. �б���Ȱ�� ����� �ʰ� ���ο� ���ߵ� ���� �ʽ��ϴ�. �̷��� ����� �ٸ� ȯ���� �� �ҿܿ� ���԰߰� �߸��� ������ �ü����� Ÿ�ο� ���� ���̵鿡 �����ϰ� ���̵鿡�Դ� ���� ��Ʈ������ ���, �ܷο��� �˴ϴ�. 
        ', 'done.jpg', sysdate, sysdate, 2, 300044000, 777777777, 77, 5000);
        
insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company4', '������ ������� ', '�ݾ�','����',
        '���� ����', 
        '������ ��ź�� ����ϴ� ������ �ֳ���?
        ��ź����Ȱ�� ���忡�� ������ ��ź�� ����ϴ� ������ �ִ��Ĵ� ������ ���� ����ϴ�. 
        "��. ������ ������ 13���� ���� �̻��� ��ź���� �߿� �ܿ��� �̰ܳ��� �ֽ��ϴ�. 
        " 3.65kg, 22��-25���� ������ �ո� ��ź�� �ܼ��� ���� ���� ���� ���� �� �̻��� ������ �մϴ�. 
        Ư���� ��ź��밡������ ������޵��� Ȥ�� ���ú������ �Ǵ� ����̻갣���� � 
        �����ϴ� ��찡 ���� �߿� �ܿ��� ���� ������ϴ�. ������ �������� ��ź�� �־� �ܿ��� ���߳��ٴ� �̾߱⸦ ���ֽô�, 
        �� Ȱ���� ������� �����ϴ�. "�Ұ� ��ź�� ������ �츮�� ���ھ�. �߿� �ܿﵵ ��������" 
        6-70��� �̾߱Ⱑ �ƴ�, ������ �Բ� ��ư��� �츮 �̿����� ���Դϴ�. ',
        'doneimg.jpg', sysdate, sysdate, 2, 3000000, 7777777, 77, 6000);
        
insert into tb_project (projectNo, id, projectSubject, category1, category2, category3, story, projectImg, projectEnd, projectRegdate,
    moneyOrItem, totalMoney, goal, percent, givePerson) 
        values (seq_project.nextval,'company5', '�̼������� ���� ', '�ݾ�','���� ��ȸ',
        'ȯ��', 
        '�̼������� ����? : �߱� vs ���� ��� �̼����� �ذ��� ��¼�� �ʹ��� �����մϴ�. 
        �߻� ��ü�� ���̸� �Ǵ� ���̴� �װ��� ��𿡼� ������ �˰� �ִٸ�, 
        �ƴ� ��ŭ �츮�� ��Ȱ�� ��ȭ�� �ٲٴ� ������ �����ϸ� �˴ϴ�. �� �ƽôٽ��� ���� �̾߱�Ǵ�
        �̼������� ������ ũ�� ���ܿ� ������ �����ϴ�. �߱��� ���������� ������ ����ȭ�¹�����, 
        �ڵ���, ������ ����. �̼������� �������� ����������, ������ �����̳Ŀ� ���� ÷���� �븳�� ��Ÿ���� �ֽ��ϴ�. 
        ', 
        'doneimg.jpg', sysdate, sysdate, 2, 666666, 777777, 77, 7000);


-------------------------------------------------------������Ʈ ��ǰ���

insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 1, '���ö�', 5000, 300, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 2, '��������', 5000, 400, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 3, '��������', 5000, 500, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 4, '��ź', 5000, 600, 1000);
insert into tb_item(projectItemNo, projectNo, itemName, itemPrice, itemAmount, goalAmount)
    values(seq_item.nextval, 5, '���', 5000, 700, 1000);

---------------------------------------------------------������

insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 1, '����Ʈ', 50000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 2, '����', 60000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 3, '��ǰ', 70000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 4, '��', 80000);
insert into tb_reward(rewardNo, projectNo, rewardItem, condition) 
    values (seq_reward.nextval, 5, '����', 90000);


----------------------------------------------------���
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
    
    
----------------------------------------------��ι�ǰ ���
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 1, '��������', 3000, 300);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 2, '��������', 4000, 400);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 3, '��ź', 5000, 500);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 4, '���',6000, 600);
insert into tb_giveItem(giveItemNo, giveNo, giveItemName, giveItemPrice, giveItemAmount)
    values(seq_giveItem.nextval, 5, '����', 70000, 700);


------------------------------------------------------------------------------�������� (��������)
--set define off
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (1, 'ī��', 270000, sysdate, '�ڼ�ȣ', '��⵵ ������ �д籸', '01099848993','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (2, 'ī��', 230000, sysdate, '������', '����Ư���� �д籸', '00000000000','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20020130114048862234&noMethod=1 ');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (3, '������ü', 230000, sysdate, '������', '��⵵ ������ ������', '00000000001','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20080130114048862234&noMethod=1 ');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (4, 'ī��', 30000, sysdate, '�ں���', '��⵵ ������ ���ﱸ', '00000000002','memo', sysdate, 'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20180130114048862234&noMethod=1 ');
insert into tb_payment(giveNo, payMethod, payMoney, permissionDate, receiver, addr, call, memo, payDate, receiptURL)
    values (5, '������ü', 900000, sysdate, '�ǵ���', '��⵵ ������ �ȴޱ�', '00000000003','memo', sysdate,'https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=INIjspVBNKINIpayTest20170730114048862234&noMethod=1 ');

    

    -----------�������
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 1, 'test1', '���� ������ !!',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 2, 'test2', '���� �մϴ�.',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 3, 'test3', '��⸦ �������� !!',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 4, 'test4', 'ȭ���� ȭ���� !!',sysdate, 0, null); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 5, 'test5', '���� ���� !!',sysdate, 0, null); 
    -------------����
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 1, 'company1', '���� �����մϴ�.',sysdate, 0, 1); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 2, 'company2', '���� ���ּż� �����մϴ�',sysdate, 0, 2); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 3, 'company3', '���� �����մϴ�.',sysdate, 0, 3); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 4, 'company4', '������ ����帳�ϴ�',sysdate, 0, 4); 
insert into tb_cheer(cheerNo, projectNo, id, cheerContent, cheerRegdate, cheerNotify, cheerParentNo) 
    values (seq_cheer.nextval, 5, 'company5', '�����մϴ�',sysdate, 0, 5); 

-----------qna���� ��
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 1, 'test1', '�� ��� ����� ���� �ǰ� �ֳ��� ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 2, 'test2', '�� ��� ����� ���� �ǰ� �ֳ��� ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 3, 'test3', '�� ��� ����� ���� �ǰ� �ֳ��� ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 4, 'test4', '�� ��� ����� ���� �ǰ� �ֳ��� ?', sysdate, 0, null);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 5, 'test5', '�� ��� ����� ���� �ǰ� �ֳ��� ?', sysdate, 0, null);
---------qna����
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 1, 'company1', '�� ���������� ���� �ǰ� �ֽ��ϴ�. �� ����˴ϴ�', sysdate, 0, 1);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 2, 'company2', '����� ������Ʈ �Դϴ�. �ı⿡�� ��α� ��볻���� Ȯ�� �Ҽ� �ֽ��ϴ�.', sysdate, 0, 2);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 3, 'company3', '�� �ı⿡�� ��� ������ Ȯ�� �ϽǼ� �ֽ��ϴ�.', sysdate, 0, 3);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 4, 'company4', '�� �� ���� �˴ϴ�!', sysdate, 0, 4);
insert into tb_QnA(qnaNo, projectNo, id, qnacontent, qnaRegdate, qnaNotify, qnaParentNo)
    values(seq_qna.nextval, 5, 'company5', '��', sysdate, 0, 5);






--------------------------------------------------------����ı�
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company1',
    '�츮�� �̷��� ��� �߽��ϴ�!
    ����ڴ� �����մϴ�.
�ƹ��Բ��� ����ڴԲ� �帮�� ������ ��� �����մϴ�.

"���� ���� �޶��� �� �־��. �� �λ� ����� �� �ְ� �� �ޱ⿴�µ���. �ʹ� ���� �е��� �����ּż� �� ���� ��θ� �����߾��. 
���� �� ���� �� �� ���� ��ŭ �����ַ�����..���� �����ָ� �� ���� ����� ������ �ʰھ��?...�ʹ� ���� ���Ƽ� ��
�� õ�� ���� ���� �����ϴ� �ƹ��Բ� ������ �������ֽ� ����ڴ�, ���� �����մϴ�. 
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company2',
    '�츮�� �̷��� ��� �߽��ϴ�!
    �ڱݼ� �ҸӴ��� ���ϰ� ���� ��
    �ڱݼ� �ҸӴϴ¡����������� ����ϰ�, �翬�� ��Ȱ���� ���� �츮 ���������� �����ұ�?����� ���� �ϼ̽��ϴ�. 
    ������ ������ �ҸӴϴ� ���� �е��� ����� �������� �ҸӴϰ� ����� ���Ͻô� ����� �ϻ��̶�� �޿� �ٰ��� �� �ְ� �Ǿ��ٰ� �����ϼ̽��ϴ�. 
    ���� ������ �ֽ� �� ��, �� �� �� ������ ���� �ʰ� ������ �����ϱ� ���ؼ��� �� �ູ�� ����� �����帮�ڴٰ� �ϼ̽��ϴ�.
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company3',
    '���̵� ���� ���� ���õ��� ������� �����߾��
    ��ȸ���ߴ� ���α׷��� �ϱ� ����, ���Ϳ����� �׻� �ο�� �Ҹ�, 
    ��� �Ҹ�, �������� �Ҹ��� ��� �Ǿ����. ���̵� �� �ο��� ���� ������ ������ �ϵ� ���� �־����. 
    ����� ���� ���ϰ�, �������� ����ϴ� ����� �𸣴� ���̵鿡�� ��� �ϸ� ����� ������ ����� �˷��� �� ������ ����� �߾����. 
    ���� ����� ���� ��ȸ�� �ߴ� ���α׷��� ��ȹ�ϰ� �Ǿ����ϴ�. 
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company4',
    '�̿����� ������ ��� ������ ������ ����
    ���� ������ ���� �츮 ���� ���ſ� ���� �ſ� ���������� ������ ������ �츮 �ֺ����� �Ļ� �� ���� �����ؾ� �ϴ� ���� �̿����� �����ϰ� �ֽ��ϴ�.
    ������ �� ��� �� �Դ� ����� ��� �־�?����� �̾߱⸦ �ϴ� �е鵵 ������� ������ �츮�� �������� ���� �е��� ���ϸ� �����մϴ�.
    
    ','img.jpg', sysdate);
insert into tb_review(projectNo, id, reviewContent, reviewImg, reviewRegdate)
    values(seq_review.nextval, 'company5',
    'ġ�Ḧ �� �� �ְ� ������ �ֽ� ��� �е鲲 ����帳�ϴ�
    ���� �е��� �������� �� �ָ� �ʸ��ɿ��� ȯ�� 2���� 
    10�������� 2�ð� �Ÿ��� ���Ҷ� ���������� ã�ƴٴϸ� ġ�Ḧ �ް� �Ǿ����ϴ�. 
    �̹� ����� ���� ������ �ް� �� �����ں� Ƽ�Ʒд��� ������ ���� ���� 
    �๰�ε� ����� ġ�ᰡ �����ϴٰ� �ؼ� �Ŵ� ������ ���������� �湮�� ���� �ް� ġ�� �߿� �ֽ��ϴ�. 
    ','img.jpg', sysdate);
    
--------------------------------------------------------------���ã��

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


--------------------------------��������

insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
    values(seq_notice.nextval, '�Ƹ޸�ī��', 'test2', 'test2', sysdate);
insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
    values(seq_notice.nextval, 'īǪġ��', 'test3', 'test3', sysdate);
insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
    values(seq_notice.nextval, 'admin3', 'test4', 'test4', sysdate);
--insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
--    values(seq_notice.nextval, 'admin4', 'test5', 'test5', sysdate);

--insert into tb_notice (noticeNo, id, noticeTitle, noticeContent, noticeRegdate) 
--    values(seq_notice.nextval, 'admin5', 'test1', 'test1', sysdate);

select * from tb_notice;
    
    
delete from tb_notice 
where id='company5'
    
---------------------------------------------���̺� ��ȸ
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
