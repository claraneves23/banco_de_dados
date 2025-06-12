

-- DROP TABLE tb_clientes;
-- DROP TABLE tb_produtos;
-- DROP TABLE tb_pedidos;

-- Tabela de clientes 
CREATE TABLE tb_clientes ( 
    id_cliente INT PRIMARY KEY, 
    nm_cliente VARCHAR(100), 
    ds_email VARCHAR(100), 
    ds_cidade VARCHAR(50) 
); 
INSERT INTO tb_clientes VALUES 
(1, 'Ana Silva', 'ana.silva@email.com', 'São Paulo'), 
(2, 'Bruno Rocha', 'bruno.rocha@email.com', 'Curitiba'), 
(3, 'Camila Mendes', 'camila.mendes@email.com', 'Salvador'), 
(4, 'Diego Torres', 'diego.torres@email.com', 'Fortaleza'), 
(5, 'Eduarda Lima', 'eduarda.lima@email.com', 'Recife'); 

-- Tabela de produtos 
CREATE TABLE tb_produtos ( 
    id_produto INT PRIMARY KEY, 
    nm_produto VARCHAR(100), 
    vl_produto DECIMAL(10, 2), 
    qt_estoque INT 
); 
INSERT INTO tb_produtos VALUES 
(101, 'Notebook', 3500.00, 10), 
(102, 'Mouse', 50.00, 100), 
(103, 'Teclado', 120.00, 50), 
(104, 'Monitor', 900.00, 30), 
(105, 'Impressora', 650.00, 15); 

-- Tabela de pedidos 
CREATE TABLE tb_pedidos ( 
    id_pedido INT PRIMARY KEY, 
    id_cliente INT, 
    id_produto INT, 
    dt_pedido DATE, 
    qt_pedido INT, 
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente), 
    FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto) 
);
INSERT INTO tb_pedidos VALUES 
(1001, 1, 101, '2025-06-01', 1), 
(1002, 1, 102, '2025-06-01', 2), 
(1003, 2, 103, '2025-06-02', 1), 
(1004, 2, 101, '2025-06-03', 1), 
(1005, 3, 102, '2025-06-04', 3), 
(1006, 3, 104, '2025-06-04', 1), 
(1007, 4, 103, '2025-06-05', 2),
(1008, 1, 104, '2025-06-06', 1),
(1009, 2, 104, '2025-06-06', 1),
(1010, 4, 102, '2025-06-07', 1);

-- 1. Quantos clientes existem na base?
select count(id_cliente) from tb_clientes;

-- 2. Qual o valor máximo, o mínimo e o médio de preços na base de produtos?
select max(vl_produto) from tb_produtos;
select min(vl_produto) from tb_produtos;
select avg(vl_produto) from tb_produtos;

-- 3. Quais os nomes dos clientes que realizam pedidos?
select distinct(nm_cliente) from tb_clientes, tb_pedidos where tb_clientes.id_cliente = tb_pedidos.id_cliente;

-- 4. Listar o nome do cliente, nome do produto, data do pedido e quantidade do pedido.
select nm_cliente, nm_produto, dt_pedido, qt_pedido from tb_pedidos
join tb_clientes on tb_pedidos.id_cliente = tb_clientes.id_cliente 
join tb_produtos on tb_pedidos.id_produto = tb_produtos.id_produto;

-- 5. Quais clientes não realizaram nenhum pedido?
select tb_clientes.nm_cliente 
from tb_clientes 
left join tb_pedidos on tb_clientes.id_cliente = tb_pedidos.id_cliente
where tb_pedidos.id_cliente is null;

-- 6. Qual produto teve o maior número de pedidos (quantidade total vendida)?

SELECT p.nm_produto, SUM(pe.qt_pedido) AS total_vendido 
FROM tb_pedidos pe
JOIN tb_produtos p ON pe.id_produto = p.id_produto
GROUP BY p.nm_produto
HAVING SUM(pe.qt_pedido) = (
  SELECT MAX(total_por_produto) 
  FROM (
    SELECT SUM(qt_pedido) AS total_por_produto 
    FROM tb_pedidos 
    GROUP BY id_produto
  ) AS sub 
);

-- 7. Quais produtos nunca foram vendidos?

SELECT tb_produtos.nm_produto 
FROM tb_produtos
left join tb_pedidos on tb_produtos.id_produto = tb_pedidos.id_produto
where tb_pedidos.id_pedido is null;


-- 8. Qual cliente realizou o maior volume de compras (soma de qt_pedido)?
SELECT 
  tb_clientes.nm_cliente, 
    sum(tb_pedidos.qt_pedido) as total_comprado
    FROM tb_pedidos
      join tb_clientes on tb_pedidos.id_cliente = tb_clientes.id_cliente
      group by tb_clientes.nm_cliente
        having sum(tb_pedidos.qt_pedido) = (
          select max(total_por_produto)
          from (
           select sum(qt_pedido) as total_por_produto
           from tb_pedidos
           group by id_cliente
          ) as sub
  );

