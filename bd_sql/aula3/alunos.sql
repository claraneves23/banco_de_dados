
-- create
CREATE TABLE alunos (
  id_aluno int primary key,
  nm_aluno char(50)
);

-- insert
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (1, 'Aluno 1');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (2, 'Aluno 2');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (3, 'Aluno 3');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (4, 'Aluno 4');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (5, 'Aluno 5');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (6, 'Aluno 6');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (7, 'Aluno 7');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (8, 'Aluno 8');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (9, 'Aluno 9');
INSERT INTO alunos(id_aluno,nm_aluno) VALUES (10, 'Aluno 10');


CREATE TABLE media_final (
  id_aluno int primary key,
  nr_aluno int
);

-- insert
INSERT INTO media_final(id_aluno,nr_aluno) VALUES (1, 8);
INSERT INTO media_final(id_aluno,nr_aluno) VALUES (3, 7);
INSERT INTO media_final(id_aluno,nr_aluno) VALUES (4, 9);
INSERT INTO media_final(id_aluno,nr_aluno) VALUES (5, 6);
INSERT INTO media_final(id_aluno,nr_aluno) VALUES (7, 10);
INSERT INTO media_final(id_aluno,nr_aluno) VALUES (8, 10);
INSERT INTO media_final(id_aluno,nr_aluno) VALUES (10, 9);


-- fetch 
SELECT
alunos.nm_aluno,
media_final.nr_aluno
FROM
alunos
INNER JOIN
media_final ON alunos.id_aluno = media_final.id_aluno


