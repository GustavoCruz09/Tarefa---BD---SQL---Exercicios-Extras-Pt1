-- Exercicio 02

CREATE DATABASE TarefaBD_ExExtras_Pt1_Ex02

go

use TarefaBD_ExExtras_Pt1_Ex02

CREATE TABLE Carro (
placa		char(7)			not null,
marca		varchar(15)		not null,
modelo		varchar(25)		not null,
cor			varchar(10)		not null,
ano			int				not null
Primary Key (placa)
)

go

CREATE TABLE Peca (
cod_peca	int				not null,
nome		varchar(30)		not null,
valor		int				not null
Primary Key (cod_peca)
)

go 

CREATE TABLE Cliente (
nome		varchar(50)		not null,
logradouro	varchar(50)		not null,
num			int				not null,
bairro		varchar(50)		not null,
telefone	char(9)			not null,
placa		char(7)			not null
Primary Key (placa)
Foreign Key (placa) references Carro(placa)
)

go

CREATE TABLE Servico (
placa		char(7)			not null,
cod_peca	int				not null,
quantidade	int				not null,
valor		int				not null,
data_serv	date			not null
Primary Key (placa, cod_peca, data_serv)
Foreign Key (placa) references Carro(placa),
Foreign Key	(cod_peca) references Peca(cod_peca)
)

INSERT INTO Carro (placa, marca, modelo, cor, ano) VALUES
('AFT9087', 'VW', 'Gol', 'Preto', 2007),
('DXO9876', 'Ford', 'Ka', 'Azul', 2000),
('EGT4631', 'Renault', 'Clio', 'Verde', 2004),
('LKM7380', 'Fiat', 'Palio', 'Prata', 1997),
('BCD7521', 'Ford', 'Fiesta', 'Preto', 1999);

select * from Carro

INSERT INTO Peca (cod_peca, nome, valor)
VALUES
    (1, 'Vela', 70),
    (2, 'Correia Dentada', 125),
    (3, 'Trambulador', 90),
    (4, 'Filtro de Ar', 30);

select * from Peca

INSERT INTO Cliente (nome, logradouro, num, bairro, telefone, placa)
VALUES
    ('João Alves', 'R. Pereira Barreto', 1258, 'Jd. Oliveiras', '21549658', 'DXO9876') ,
    ('Ana Maria', 'R. 7 de Setembro', 259, 'Centro', '96588541', 'LKM7380'),
    ('Clara Oliveira', 'Av. Nações Unidas', 10254, 'Pinheiros', '24589658', 'EGT4631'),
    ('José Simões', 'R. XV de Novembro', 36, 'Água Branca', '78952459', 'BCD7521'),
    ('Paula Rocha', 'R. Anhaia', 548, 'Barra Funda', '69582548', 'AFT9087');

Select * from Cliente

INSERT INTO Servico (placa, cod_peca, quantidade, valor, data_serv)
VALUES
    ('DXO9876', 1, 4, 280, '2020-08-01'),
    ('DXO9876', 4, 1, 30, '2020-08-01'),
    ('EGT4631', 3, 1, 90, '2020-08-02'),
    ('DXO9876', 2, 1, 125, '2020-08-07');

Select * from Servico


Select  telefone 
From Cliente
Where placa = (
	Select placa From Carro
	Where modelo = 'ka' And cor = 'Azul'
)

Select logradouro + ' ' + CAST(num as varchar(10)) + ' ' + bairro as Endereco
From Cliente 
Where placa = (
	Select placa From Servico
	Where  data_serv = '2020-08-02'
)

Select placa From Carro
Where ano < 2001

Select marca + ' ' + modelo + ' ' + cor as InfosCarro From Carro
where ano > 2005

Select cod_peca, nome From Peca
Where valor < 80