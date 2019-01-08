select * 
from
	(select picture,name,accMoney,RANK() OVER (ORDER BY accMoney desc) as rk 
	from tb_member
	where (accMoney is not null) and (statusFlag=1))
where rk <= 3

select * from TB_MEMBER;

select * from tb_project;

update tb_member set pwd = '1234' where id = 'test1';

update tb_member set name = 'ÀÌ¼öÇö', phone='01027709755', email='aaa@gmail.com' where id = 'test1';

select 