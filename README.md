# Banco de Dados 🎲
Disciplina ministrada pelo professor Valdir Pedro Tobias
Lattes: http://lattes.cnpq.br/6406295441915248

## 🧱 Comandos DDL (Data Definition Language)

- CREATE TABLE - Criar Tabelas<br>
```sql
CREATE TABLE tb_depto(
    id_depto int primary key,
    nm_depto char(40)
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
- SELECT - Consultar Dados
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
## 🔗 JOINs - Relacionando Tabelas
- INNER JOIN: Retorna apenas registros com correspondência em AMBAS tabelas, deve ser usado quando você só quer os dados que têm relação.

