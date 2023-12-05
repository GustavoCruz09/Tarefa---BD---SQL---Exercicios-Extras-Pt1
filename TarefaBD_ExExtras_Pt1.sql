-- Exericicio 01

CREATE DATABASE TarefaBD_ExExtras_Pt1
go
USE TarefaBD_ExExtras_Pt1

go

CREATE TABLE Aluno (
ra			int				not null,
nome		varchar(100)	not null,
sobrenome	varchar(100)	not null,
rua			varchar(100)	not null,
num			int				not null,
bairro		varchar(100)	not null,
cep			char(8)			not null,
telefone	char(11)		null
PRIMARY KEY (ra)
)

go

CREATE TABLE Cursos (
cod_curso	int				not null,
nome		varchar(20)		not null,
carga_hora	int				not null,
turno		char(5)			not null
PRIMARY KEY (cod_curso)	
)

go

CREATE TABLE Disciplina (
cod_disci	int				not null,
nome		varchar(20)		not null,
carga_hora	int				not null,
turno		char(5)			not null,
semestre	int				not null,
PRIMARY KEY (cod_disci)
)

go

INSERT INTO Aluno Values 
('12345', 'José', 'Silva', 'Almirante Noronha', 236, 'Jardim São Paulo', '15890000', '69875287000'),
('12346', 'Ana', 'Maria Bastos', 'Anhaia', 1568, 'Barra Funda', '35690000', '25698526000'),
('12347', 'Mario', 'Santos', 'XV de Novembro',	1841, 'Centro',	'10200300', NULL),
('12348', 'Marcia',	'Neves', 'Voluntários da Patria', 225, 'Santana', '27850900', '78964152000')

select * from Aluno

INSERT INTO Cursos Values
(1,	'Informática', 2800, 'Tarde'),
(2,	'Informática', 2800, 'Noite'),
(3, 'Logística', 2650, 'Tarde'),
(4, 'Logística', 2650, 'Noite'),
(5,	'Plásticos', 2500, 'Tarde'),
(6, 'Plásticos', 2500, 'Noite')

select * from Cursos

INSERT INTO Disciplina Values
(1, 'Informática', 4, 'Tarde',	1),
(2, 'Informática', 4, 'Noite',	1),
(3, 'Quimica', 4, 'Tarde',	1),
(4, 'Quimica', 4, 'Noite',	1),
(5, 'Banco de Dados I', 2, 'Tarde',	3),
(6, 'Banco de Dados I', 2, 'Noite',	3),
(7, 'Estrutura de Dados', 4, 'Terde',	1),
(8, 'Estrutura de Dados', 4, 'Noite',	1)

select * from Disciplina

Select nome + ' ' + sobrenome as NomeCompleto From Aluno

Select rua + ' ' + CAST(num as varchar(20)) + ' ' + bairro + ' ' + cep as Endereco From Aluno Where telefone IS NULL

Select telefone From Aluno Where ra = 12348

Select nome, turno From Cursos Where carga_hora = 2800

Select semestre From Disciplina Where turno = 'Noite' and nome = 'Banco de Dados I' 