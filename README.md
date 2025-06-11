# Banco de Dados🗄️
Disciplina ministrada pelo professor Valdir Pedro Tobias

SGBD: SQL Server Management Studio

Lattes: http://lattes.cnpq.br/6406295441915248

## 🧱 Comandos DDL (Data Definition Language)

- CREATE TABLE - Criar Tabelas<br>
```sql
CREATE TABLE tb_depto (
  id_depto int primary key,
  nm_depto char(40)
)
```
- DROP TABLE - Apagar Tabelas
```sql
-- CUIDADO: Este comando apaga a tabela e todos os seus dados!
DROP TABLE nome_da_tabela;
```
- TRUNCATE TABLE - Limpar Tabela
```sql
TRUNCATE TABLE tb_clientes;
```
## 🛠️ Comandos DML (Manipulação de Dados)
- INSERT - Inserir Dados
```sql
-- Inserindo departamentos
INSERT INTO tb_depto VALUES(1,'depto 1');
INSERT INTO tb_depto VALUES(2,'depto 2');

-- Inserindo funcionários
INSERT INTO tb_funcionarios VALUES(1,'func1',1,1);
```
- SELECT - Consultar dados<br>

Consulta simples: <br>
```sql
SELECT * FROM tb_funcionarios;
```
Consulta com filtros : <br>
```sql
SELECT * FROM tb_socios WHERE id_socio > 3;
```
- UPDATE - Atualizar Dados
```sql
UPDATE tb_funcionarios 
SET nm_func = 'func1 alterado' 
WHERE id_func = 1;
```
-  DELETE - Remover Dados
```sql
DELETE FROM tb_funcionarios WHERE id_func = 5;
```
## 🔗 JOINs - Relacionando Tabelas<br>
- INNER JOIN: Retorna apenas registros com correspondência em AMBAS tabelas, deve ser usado quando você só quer os dados que têm relação.
```sql
select f.id_func as CODIGO, f.nm_func as NOME_FUNCIONARIO, d.nm_depto as NOME_DEPARTAMENTO
	from tb_funcionarios f join tb_depto d on (f.id_depto = d.id_depto)
```
- LEFT JOIN (ou LEFT OUTER JOIN): Retorna todos os registros da tabela da ESQUERDA e os correspondentes da tabela da direita. Se não houver correspondência, os valores da tabela da direita serão NULL.

```
SELECT f.id_func, f.nm_func, d.nm_depto
FROM tb_funcionarios f 
LEFT JOIN tb_depto d ON f.id_depto = d.id_depto;

```

- RIGHT JOIN (ou RIGHT OUTER JOIN): Retorna todos os registros da tabela da DIREITA e os correspondentes da tabela da esquerda. Se não houver correspondência, os valores da tabela da esquerda serão NULL.

```
SELECT f.id_func, f.nm_func, d.nm_depto
FROM tb_funcionarios f 
RIGHT JOIN tb_depto d ON f.id_depto = d.id_depto;

```

- FULL OUTER JOIN: Retorna todos os registros de ambas as tabelas. Quando não há correspondência, os campos da tabela sem correspondente aparecerão como NULL.

```
SELECT f.id_func, f.nm_func, d.nm_depto
FROM tb_funcionarios f 
FULL OUTER JOIN tb_depto d ON f.id_depto = d.id_depto;

```
## 🗝️ Chaves Primárias e Estrangeiras

### PRIMARY KEY
Identifica unicamente cada registro em uma tabela.

```sql
id_socio int primary key
```

### FOREIGN KEY
Estabelece uma relação entre tabelas.

```sql
foreign key (id_socio) references tb_socios(id_socio)
```

## 📊 Funções de Agregação

| Função   | Exemplo                                | Descrição                          |
|----------|----------------------------------------|------------------------------------|
| COUNT()  | `SELECT COUNT(*) FROM tb_clientes;`    | Conta o número de registros        |
| SUM()    | `SELECT SUM(vl_saldo) FROM tb_saldos;` | Soma todos os valores de uma coluna|
| AVG()    | `SELECT AVG(vl_saldo) FROM tb_saldos;` | Calcula a média dos valores        |
| MAX()    | `SELECT MAX(vl_saldo) FROM tb_saldos;` | Encontra o valor máximo            |
| MIN()    | `SELECT MIN(vl_saldo) FROM tb_saldos;` | Encontra o valor mínimo            |

```sql
-- Soma dos saldos
SELECT SUM(vl_saldo) AS total FROM tb_saldos;

-- Menor saldo
SELECT MIN(vl_saldo) AS minimo FROM tb_saldos;

-- Maior saldo
SELECT MAX(vl_saldo) AS maximo FROM tb_saldos;

-- Média dos saldos
SELECT AVG(vl_saldo) AS media FROM tb_saldos;

-- Contagem de registros
SELECT COUNT(*) AS quantidade FROM tb_saldos;
```
## Cláusulas Adicionais

### WHERE
Filtra registros com base em condições específicas.

```sql
select * from tb_socios where id_socio > 3
```

### ORDER BY
Ordena os resultados da consulta.

```sql
order by nm_depto desc
```

### Subconsultas
Consulta aninhada dentro de outra consulta.

```sql
select nm_cliente from tb_saldos
where vl_saldo = (select max(vl_saldo) from tb_saldos) 
```
