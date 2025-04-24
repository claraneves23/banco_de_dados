
CREATE TABLE tb_socios(
id_socio int primary key,
nm_socios char(40)
)
insert into tb_socios values(1,'socio 1')
insert into tb_socios values(2,'socio 2')
insert into tb_socios values(3,'socio 3')
insert into tb_socios values(4,'socio 4')
insert into tb_socios values(5,'socio 5')

--truncate table tb_socios 
select * from tb_socios

select * from tb_socios where id_socio > 3

select count (*) as qtd from tb_socios

select count (*) as qtd from tb_socios where id_socio > 3


CREATE TABLE tb_dependentes(
id_socio int ,
id_depte int ,
nm_depte char(40),
primary key(id_socio,id_depte),
foreign key (id_socio) references tb_socios(id_socio)

)
insert into tb_dependentes values(1,1,'D1S1')
insert into tb_dependentes values(2,1,'D2S2')
insert into tb_dependentes values(3,1,'D3S3')
insert into tb_dependentes values(4,1,'D4S4')
insert into tb_dependentes values(5,1,'D5S5')


select * from tb_dependentes

select * from tb_dependentes where id_socio = 4

select count(*) as qtde from tb_dependentes where id_socio = 1

select nm_depte from tb_dependentes