create database DBFaculdade;
GO

use DBFaculdade;
GO

create table Aluno
(
    ra int not null,
    nome varchar(100) not null,
    constraint PK_Aluno primary key (ra)
)

create table Disciplina 
(
     codigo int,
     nome varchar(30) not null,
     carga_horaria int not null,
     constraint PK_Disciplina primary key (codigo)
 )

 create table Matricula
 (
     id int IDENTITY(1,1),
     ra int not null,
     ano int not null,
     semestre int not null,
     constraint PK_Matricula primary key (id),
     constraint FK_Matricula_Aluno foreign key (ra) references Aluno(ra),
     constraint UN_Matricula unique (ra, ano, semestre)
 )
 GO
 create table Item_Matricula 
 (
     id int not null,
     codigo int not null,
     nota1 decimal(4,2),
     nota2 decimal(4,2),
     sub decimal(4,2),
     faltas int not null,
     situacao varchar(19) not null,
     constraint PK_Item_Matricula primary key (id, codigo),
     constraint FK_Item_Matricula_Matricula foreign key (id) references Matricula (id),
     constraint FK_Item_Matricula_Disciplina foreign key (codigo) references Disciplina --Está implícito que é com a PK
 )
GO

INSERT INTO Aluno VALUES(1,'Giovani');
INSERT INTO Aluno VALUES(2,'Ana Maria');
INSERT INTO Aluno VALUES(3,'Felipe');
INSERT INTO Aluno VALUES(4, 'Ari');

SELECT * FROM Aluno;

INSERT INTO Disciplina VALUES(1,'Banco de dados',80),(2,'Inteligência Artificial',80),(3,'Sistema Operacional',60);

INSERT INTO Matricula VALUES(1,2023,1);
INSERT INTO Matricula VALUES(2,2023,1),(3,2023,1);
INSERT INTO Matricula VALUES(4,2023,1);

SELECT * FROM Matricula;

UPDATE Disciplina SET nome = 'IA'
WHERE codigo = 2;

SELECT * FROM Disciplina;

--DELETE FROM Disciplina WHERE codigo = 3;

--DELETE FROM Disciplina WHERE carga_horaria <= 80;

INSERT INTO Item_Matricula(id,codigo,faltas,situacao) VALUES(1,1,0,'Matriculado');
SELECT * FROM Item_Matricula;

INSERT INTO Item_Matricula(id,codigo,faltas,situacao) VALUES(1,2,0,'Matriculado');
INSERT INTO Item_Matricula(id,codigo,faltas,situacao) VALUES(1,2,0,'Matriculado');

select * from disciplina;
select * from aluno;
select * from matricula;
select * from item_matricula;

select RA, ANO, SEMESTRE FROM Matricula;

select Aluno.RA, Matricula.ID from Aluno join Matricula on Aluno.Ra = Matricula.RA; 

select a.nome as 'Nome do aluno', a.ra as 'RA do aluno', m.id as 'ID da matricula', m.semestre as 'Semestre matriculado', m.ano as 'Ano matriculado',
Item_Matricula.nota1 as 'Prova 1', Item_matricula.nota2 as 'Prova 2', Item_matricula.sub as 'Sub', Disciplina.nome
from Aluno a join Matricula m on a.RA = m.ra
join Item_matricula on m.id = item_matricula.id
join Disciplina on Disciplina.codigo = item_matricula.id; 

delete from item_matricula where id = 1 and codigo = 1;
delete from item_matricula where id = 1 and codigo = 2;

select Aluno.ra as 'RA do aluno', Aluno.nome as 'Nome do aluno', Matricula.ID as 'ID da matricula'
from Aluno join Matricula on Aluno.ra = Matricula.ra;

--insert into Item_Matricula(id,codigo,nota1,nota2,sub,situacao,faltas) values (1,1,10,10,0,'Matriculado',0),(1,2,5,0,10,'Matriculado',10),(1,3,5,4,5,'Matriculado',15);
--insert into Item_Matricula(id,codigo,nota1,nota2,sub,situacao,faltas) values (2,1,5,5,4,'Matriculado',2),(2,2,3,7,7,'Matriculado',5),(2,3,5,4,5,'Matriculado',8);
--insert into Item_Matricula(id,codigo,nota1,nota2,sub,situacao,faltas) values (3,1,5,5,4,'Matriculado',2),(3,2,3,7,7,'Matriculado',5),(3,3,5,4,5,'Matriculado',8);

delete from Item_Matricula;
select * from Item_matricula;

INSERT INTO Item_Matricula(id,codigo,nota1,nota2,sub,faltas,situacao) 
                   VALUES (1,   1,    10,    9,   3,   10,   'Aprovado'),
                          (1,   2,     4,    8,   8,    0,   'Aprovado'),
                          (1,   3,     3,    7,   5,    5,   'Aprovado');

select * from Item_Matricula;

INSERT INTO Item_Matricula(id,codigo,nota1,nota2,sub,faltas,situacao) 
                   VALUES (2,   1,     4,    5,   8,    2,   'Aprovado'),
                          (2,   2,     5,    7,   3,    3,   'Aprovado'),
                          (2,   3,     8,    1,   0,    3,   'Aprovado');

INSERT INTO Item_Matricula(id,codigo,nota1,nota2,sub,faltas,situacao) 
                   VALUES (3,   1,     3,    5,   5,    2,   'Aprovado'),
                          (3,   2,     5,    3,   8,    1,   'Aprovado'),
                          (3,   3,     7,    3,   5,    3,   'Aprovado');

INSERT INTO Item_Matricula(id,codigo,nota1,nota2,sub,faltas,situacao) 
                   VALUES (4,   1,     3,    5,   5,    2,   'Aprovado'),
                          (4,   2,     5,    3,   8,    1,   'Aprovado'),
                          (4,   3,     7,    3,   5,    3,   'Aprovado');

select * from Item_Matricula;

select * from matricula;

select a.ra as 'RA', a.nome as 'Nome', m.id as 'ID Matricula', d.nome as 'Nome da Disciplina'
from aluno a join matricula m on a.ra = m.ra
join Item_Matricula im on m.id = im.id
join Disciplina d on im.codigo = d.codigo
where a.ra = 4;


select a.ra as 'RA', a.nome as 'Nome',d.nome as 'Nome da disciplina', im.nota1 as 'Prova 1', im.nota2 as 'Prova 2', im.sub as 'Sub', im.faltas as 'Nro faltas', im.situacao as 'Situação'
from aluno a join matricula m on a.ra = m.ra
join Item_Matricula im on m.id = im.id
join Disciplina d on im.codigo = d.codigo
where a.ra = 1;


SELECT m.ano, m.semestre, m.id as 'ID Matricula', a.nome as 'Nome do aluno', 
    d.nome as 'Nome da disciplina', im.nota1 as "Nota 1", im.nota2 as "Nota 2",
     im.sub as "Sub",
CASE
WHEN (sub IS NULL) THEN (NOTA1 + NOTA2)/2
WHEN (sub > Nota1) AND (Nota1 < Nota2) THEN (sub + Nota2)/2
WHEN (sub > Nota2) AND (Nota2 < Nota1) THEN (sub + Nota1)/2
END AS 'Media'
FROM Aluno a JOIN Matricula m ON a.ra = m.ra
JOIN Item_Matricula im ON m.id = im.id
JOIN Disciplina d ON im.codigo = d.codigo
WHERE a.ra = 2;

ALTER TABLE Item_Matricula ADD
    media DECIMAL(4,2)
GO