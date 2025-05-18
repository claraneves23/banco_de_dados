-- Tabela de Categorias
CREATE TABLE TB_CATEGORIA (
  ID_CATEG INT PRIMARY KEY,
  NM_CATEG VARCHAR(50)
);

-- Tabela de Produtos
CREATE TABLE TB_PRODUTOS (
  ID_PROD INT PRIMARY KEY,
  NM_PROD VARCHAR(50),
  VL_UNIT FLOAT,
  QT_EST INT,
  ID_CATEG INT,
  FOREIGN KEY (ID_CATEG) REFERENCES TB_CATEGORIA(ID_CATEG)
);

-- Tabela de Clientes
CREATE TABLE TB_CLIENTES (
  ID_CLI INT PRIMARY KEY,
  NM_CLI VARCHAR(50),
  NR_CPF VARCHAR(11)
);

-- Tabela de Pedidos
CREATE TABLE TB_PEDIDO (
  ID_PED INT PRIMARY KEY,
  ID_CLI INT,
  DT_PED DATE,
  VL_PED FLOAT,
  FOREIGN KEY (ID_CLI) REFERENCES TB_CLIENTES(ID_CLI)
);

-- Tabela de Itens do Pedido
CREATE TABLE TB_ITEM_PEDIDO (
  ID_PED INT,
  ID_PROD INT,
  QT_PED INT,
  VL_UNIT DECIMAL(10,2),
  VL_TOTAL DECIMAL(10,2),
  PRIMARY KEY (ID_PED, ID_PROD),
  FOREIGN KEY (ID_PED) REFERENCES TB_PEDIDO(ID_PED),
  FOREIGN KEY (ID_PROD) REFERENCES TB_PRODUTOS(ID_PROD)
);

-- Categorias
INSERT INTO TB_CATEGORIA(ID_CATEG, NM_CATEG) VALUES 
(1, 'CATEGORIA 1'),
(2, 'CATEGORIA 2'),
(3, 'CATEGORIA 3');

-- Produtos
INSERT INTO TB_PRODUTOS (ID_PROD, NM_PROD, VL_UNIT, QT_EST, ID_CATEG) VALUES
(1, 'PRODUTO 1', 10, 30, 1),
(2, 'PRODUTO 2', 15, 40, 1),
(3, 'PRODUTO 3', 11, 10, 2),
(4, 'PRODUTO 4', 50, 10, 1),
(5, 'PRODUTO 5', 100, 5, 3);

-- Clientes
INSERT INTO TB_CLIENTES (ID_CLI, NM_CLI, NR_CPF) VALUES
(1, 'CLIENTE 1', '111'),
(2, 'CLIENTE 2', '222'),
(3, 'CLIENTE 3', '333'),
(4, 'CLIENTE 4', '444'),
(5, 'CLIENTE 5', '555');

-- Pedidos
INSERT INTO TB_PEDIDO (ID_PED, ID_CLI, DT_PED, VL_PED) VALUES
(1, 1, '2024-10-10', 215),
(2, 1, '2024-10-14', 400),
(3, 2, '2024-10-16', 410),
(4, 3, '2024-10-20', 70),
(5, 4, '2024-10-21', 60);

-- Itens do Pedido
INSERT INTO TB_ITEM_PEDIDO (ID_PED, ID_PROD, QT_PED, VL_UNIT, VL_TOTAL) VALUES
(1, 1, 3, 10, 30),
(1, 2, 5, 15, 75),
(1, 3, 10, 11, 110),
(2, 4, 8, 50, 400),
(3, 4, 8, 50, 400),
(3, 5, 1, 10, 10),
(4, 1, 7, 10, 70),
(5, 1, 3, 10, 30),
(5, 4, 2, 15, 30);

-- 1) Listar nome do produto, nome da categoria, valor unitário, qtde em estoque
select NM_PROD, NM_CATEG, VL_UNIT, QT_EST from TB_PRODUTOS, TB_CATEGORIA where
TB_PRODUTOS.ID_CATEG = TB_CATEGORIA.ID_CATEG

-- 2) Listar nome do produto, valor unitário, qtde em estoque e nome da categoria para o produto com maior qtde em estoque
select NM_PROD, VL_UNIT,QT_EST, NM_CATEG from TB_PRODUTOS, TB_CATEGORIA where
TB_PRODUTOS.ID_CATEG = TB_CATEGORIA.ID_CATEG and QT_EST = (select max(QT_EST) from TB_PRODUTOS)

-- 3) Qual o valor total em estoque na base tb_produtos?
select sum(VL_UNIT * QT_EST) from TB_PRODUTOS

-- 4) Qual o nome do produto, qt_est para o produto com  qtde em estoque maior que média das quantidades?
select NM_PROD, QT_EST from TB_PRODUTOS where QT_EST > (select avg(QT_EST) from TB_PRODUTOS)

-- 5) Qual o menor valor, o maior valor e o valor médio dos produtos em estoque?
select min(QT_EST) AS valor_minimo, max(QT_EST) AS valor_maximo, avg(QT_EST) AS valor_medio from TB_PRODUTOS

-- 6) Listar o id do pedido, o nome do cliente, a data do pedido e o valor do pedido para todos os pedidos cadastrados.
select ID_PED, NM_CLI, DT_PED, VL_PED from TB_PEDIDO, TB_CLIENTES where
TB_PEDIDO.ID_CLI = TB_CLIENTES.ID_CLI

-- 7) Listar para o pedido com id = 1:  para todos os itens da tabela tb_item_pedido=> nome do produto, qt do pedido, vl unitário 
select ID_PED, NM_PROD, QT_PED, tb_item_pedido.VL_UNIT from TB_PRODUTOS, tb_item_pedido 
where TB_PRODUTOS.ID_PROD = tb_item_pedido.ID_PROD and ID_PED = 1

-- 8) Listar os seguintes campos para todas as informações constantes na base tb_item_pedido: 
--     => id_ped, id_cli, nome do cliente, Id_prod, nome do produto, qt_ped, vl_total
select tb_pedido.id_ped,tb_pedido.id_cli,nm_cli ,tb_produtos.id_prod,nm_prod,qt_ped,vl_total
       from tb_clientes, tb_item_pedido,tb_produtos,tb_pedido
       where tb_clientes.id_cli = tb_pedido.id_cli
       and   tb_pedido.id_ped = tb_item_pedido.id_ped
       and   tb_produtos.id_prod = tb_item_pedido.id_prod
       
-- 9) Qual o nome do produto, nome da categoria para o produto com menor qtde de estoque na base tb_produtos?
select nm_prod,nm_categ,qt_est from tb_categoria,tb_produtos
where tb_produtos.id_categ = tb_categoria.id_categ
     and qt_est = (select min(qt_est) from tb_produtos)

-- 10) Listar da base tb_item_pedido: id_produto e valor total deste produto
select id_prod,vl_total from tb_item_pedido

-- 11) Listar da tabela tb_pedidos: id_ped, id_cli, dt_ped e vl_ped em ordem descrescente de vl_ped
select id_ped,id_cli,dt_ped,vl_ped from tb_pedido
order by vl_ped desc

-- 12) Qual o nome do cliente que realizou a maior compra?
select nm_cli,vl_ped from tb_pedido,tb_clientes
where tb_clientes.id_cli = tb_pedido.id_cli
and vl_ped = (select max(vl_ped) from tb_pedido)
