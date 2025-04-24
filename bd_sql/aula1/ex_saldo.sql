CREATE TABLE tb_saldos(
id_cliente int primary key,
nm_cliente char(40),
vl_saldo decimal(10,2)
)
insert into tb_saldos values(1,'cliente 1',100.00)
insert into tb_saldos values(2,'cliente 2',150.00)
insert into tb_saldos values(3,'cliente 3',50.00)
insert into tb_saldos values(4,'cliente 4',1000.00)
insert into tb_saldos values(5,'cliente 5',1.00)

select * from tb_saldos

select sum(vl_saldo) as somatoria from tb_saldos
select min(vl_saldo) as minimo from tb_saldos
select max(vl_saldo) as maximo from tb_saldos
select avg(vl_saldo) as maximo from tb_saldos
select count(*) as qtde from tb_saldos

select nm_cliente from tb_saldos
	where vl_saldo = (select max(vl_saldo) from tb_saldos) 

select nm_cliente from tb_saldos
	where vl_saldo = (select min(vl_saldo) from tb_saldos) 

select nm_cliente from tb_saldos
	where vl_saldo < (select avg(vl_saldo) from tb_saldos) 

select nm_cliente from tb_saldos
	where vl_saldo > (select avg(vl_saldo) from tb_saldos) 
