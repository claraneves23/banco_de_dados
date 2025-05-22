create table tb_cliente(
  id_cliente int primary key,
  nm_cliente char (30)
  );
        
insert into tb_cliente (id_cliente, nm_cliente)values (1,'cliente 1');
insert into tb_cliente (id_cliente, nm_cliente)values (2,'cliente 2');
insert into tb_cliente (id_cliente, nm_cliente)values (3,'cliente 3');
insert into tb_cliente (id_cliente, nm_cliente)values (4,'cliente 4');
insert into tb_cliente (id_cliente, nm_cliente)values (5,'cliente 5');
                   
create table tb_duplicatas(
id_duplicata int primary key,
id_cliente int,
vl_duplicata money,
);

insert into tb_duplicatas (id_duplicata, id_cliente,vl_duplicata)values(1,1,100);
insert into tb_duplicatas (id_duplicata, id_cliente,vl_duplicata)values(2,1,50);
insert into tb_duplicatas (id_duplicata, id_cliente,vl_duplicata)values(3,1,150);
insert into tb_duplicatas (id_duplicata, id_cliente,vl_duplicata)values(4,1,200);
insert into tb_duplicatas (id_duplicata, id_cliente,vl_duplicata)values(5,6,1000);

-- inner = Listar nome do cliente, id_duplicata e o valor da duplicata dos registros com correspondência entre as tabelas
SELECT tb_cliente.nm_cliente, tb_duplicatas.id_duplicata,tb_duplicatas.vl_duplicata
FROM tb_cliente
INNER JOIN tb_duplicatas
ON tb_cliente.id_cliente = tb_duplicatas.id_cliente;

-- left join = Listar o nome do cliente, id_duplicata, vl_duplicata para todos os clientes, quando o cliente não tiver duplicata apresentar como null os dados da duplicata.
SELECT 
  tb_cliente.nm_cliente, 
  tb_duplicatas.id_duplicata, 
  tb_duplicatas.vl_duplicata
FROM tb_cliente
LEFT JOIN tb_duplicatas
  ON tb_cliente.id_cliente = tb_duplicatas.id_cliente;

-- left join com is null = Listar o nome do cliente, id_duplicata, vl_duplicata para todos os clientes sem duplicatas registradas na tabela de duplicatas.
SELECT 
  tb_cliente.nm_cliente, 
  tb_duplicatas.id_duplicata, 
  tb_duplicatas.vl_duplicata
FROM tb_cliente
LEFT JOIN tb_duplicatas
  ON tb_cliente.id_cliente = tb_duplicatas.id_cliente
where tb_duplicatas.id_duplicata is null;

-- right join = Listar o nome do cliente, id_duplicata, vl_duplicata para todas as duplicatas,  a duplicata não tiver cliente apresentar como null o nome do cliente.
SELECT 
  tb_cliente.nm_cliente, 
  tb_duplicatas.id_duplicata, 
  tb_duplicatas.vl_duplicata
FROM tb_cliente
RIGHT JOIN tb_duplicatas
  ON tb_cliente.id_cliente = tb_duplicatas.id_cliente;

-- right join com is null = Listar o nome do cliente, id_duplicata, vl_duplicata para todas as duplicatas cujo cliente não exista na tabela de clientes.
SELECT 
  tb_cliente.nm_cliente, 
  tb_duplicatas.id_duplicata, 
  tb_duplicatas.vl_duplicata
FROM tb_cliente
RIGHT JOIN tb_duplicatas
  ON tb_cliente.id_cliente = tb_duplicatas.id_cliente
where tb_cliente.id_cliente is null;
-- full outer join = Listar nm_cliente, id_duplicata, vl_duplicata para todos os registros das 2 tabelas, quando não existir correspondência entre as tabelas, informar null no campo que não tem correspondência.
SELECT 
  tb_cliente.nm_cliente, 
  tb_duplicatas.id_duplicata, 
  tb_duplicatas.vl_duplicata
FROM tb_cliente
FULL OUTER JOIN tb_duplicatas
  ON tb_cliente.id_cliente = tb_duplicatas.id_cliente;

-- full outer join com is null = listar nm_cliente, id_duplicata, vl_duplicata para os registros sem correspondência entre as tabelas.
SELECT 
  tb_cliente.nm_cliente, 
  tb_duplicatas.id_duplicata, 
  tb_duplicatas.vl_duplicata
FROM tb_cliente
FULL OUTER JOIN tb_duplicatas
  ON tb_cliente.id_cliente = tb_duplicatas.id_cliente
where tb_cliente.id_cliente is null 
OR tb_duplicatas.id_duplicata is null;