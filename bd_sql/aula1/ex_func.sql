CREATE TABLE tb_depto(
id_depto int primary key,
nm_depto char(40)
)
insert into tb_depto values(1,'depto 1')
insert into tb_depto values(2,'depto 2')
insert into tb_depto values(3,'depto 3')
insert into tb_depto values(4,'depto 4')
insert into tb_depto values(5,'depto 5')


CREATE TABLE tb_gr_inst(
id_gr_inst int primary key,
nm_gr_inst char(40)
)
insert into tb_gr_inst values(1,'basico completo')
insert into tb_gr_inst values(2,'superior incompleto')
insert into tb_gr_inst values(3,'superior completo')
insert into tb_gr_inst values(4,'especialista')
insert into tb_gr_inst values(5,'mestrado completo')

CREATE TABLE tb_funcionarios(
id_func int primary key,
nm_func char(40),
id_depto int,
id_gr_inst int ,
foreign key (id_depto) references tb_depto(id_depto),
foreign key (id_gr_inst) references tb_gr_inst(id_gr_inst)

)
insert into tb_funcionarios values(1,'func1',1,1)
insert into tb_funcionarios values(2,'func2',2,2)
insert into tb_funcionarios values(3,'func3',3,3)
insert into tb_funcionarios values(4,'func4',4,4)
insert into tb_funcionarios values(5,'func5',5,5)

select * from tb_funcionarios

update tb_funcionarios set nm_func = 'func1 alterado' where id_func = 1

delete from tb_funcionarios where id_func = 5

--select f.id_func as CODIGO, f.nm_func as NOME_FUNCIONARIO, d.nm_depto as NOME_DEPARTAMENTO
	--from tb_funcionarios f join tb_depto d on (f.id_depto = d.id_depto)

select id_func, nm_func, nm_depto, nm_gr_inst from tb_funcionarios, tb_depto, tb_gr_inst
	where tb_funcionarios.id_depto = tb_depto.id_depto 
	and tb_funcionarios.id_gr_inst = tb_gr_inst.id_gr_inst
	order by nm_depto desc


