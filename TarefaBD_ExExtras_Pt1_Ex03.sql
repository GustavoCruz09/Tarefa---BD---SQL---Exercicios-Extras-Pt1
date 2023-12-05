-- Exercicio 03

Create DataBase TarefaBD_ExExtras_Pt1_Ex03

go

Use TarefaBD_ExExtras_Pt1_Ex03


-- Cria��o da tabela Pacientes
CREATE TABLE Paciente (
    CPF BIGINT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero INT NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Telefone VARCHAR(15),
    Data_Nasc DATE NOT NULL
);

-- Inser��o de dados na tabela Pacientes
INSERT INTO Paciente (CPF, Nome, Rua, Numero, Bairro, Telefone, Data_Nasc)
VALUES
    (35454562890, 'Jos� Rubens', 'Campos Salles', 2750, 'Centro', '21450998', '1954-10-18'),
    (29865439810, 'Ana Claudia', 'Sete de Setembro', 178, 'Centro', '97382764', '1960-05-29'),
    (82176534800, 'Marcos Aur�lio', 'Tim�teo Penteado', 236, 'Vila Galv�o', '68172651', '1980-09-24'),
    (12386758770, 'Maria Rita', 'Castello Branco', 7765, 'Vila Ros�lia', NULL, '1975-03-30'),
    (92173458910, 'Joana de Souza', 'XV de Novembro', 298, 'Centro', '21276578', '1944-04-24');

select * from Paciente

-- Cria��o da tabela M�dico
CREATE TABLE Medico (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Especialidade VARCHAR(50) NOT NULL
);

-- Inser��o de dados na tabela M�dico
INSERT INTO Medico (Codigo, Nome, Especialidade)
VALUES
    (1, 'Wilson Cesar', 'Pediatra'),
    (2, 'Marcia Matos', 'Geriatra'),
    (3, 'Carolina Oliveira', 'Ortopedista'),
    (4, 'Vinicius Araujo', 'Cl�nico Geral');

	
Select * from Medico

-- Cria��o da tabela Prontu�rio
CREATE TABLE Prontuario (
    Data DATE NOT NULL,
    CPF_Paciente BIGINT NOT NULL,
    Codigo_Medico INT NOT NULL,
    Diagn�stico VARCHAR(50) NOT NULL,
    Medicamento VARCHAR(50) NOT NULL,
    PRIMARY KEY (Data, CPF_Paciente, Codigo_Medico),
    FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF),
    FOREIGN KEY (Codigo_Medico) REFERENCES Medico(Codigo)
);

-- Inser��o de dados na tabela Prontu�rio
INSERT INTO Prontuario (Data, CPF_Paciente, Codigo_Medico, Diagn�stico, Medicamento)
VALUES
    ('2020-09-10', 35454562890, 2, 'Reumatismo', 'Celebra'),
    ('2020-09-10', 92173458910, 2, 'Renite Al�rgica', 'Allegra'),
    ('2020-09-12', 29865439810, 1, 'Inflama��o de garganta', 'Nimesulida'),
    ('2020-09-13', 35454562890, 2, 'H1N1', 'Tamiflu'),
    ('2020-09-15', 82176534800, 4, 'Gripe', 'Resprin'),
    ('2020-09-15', 12386758770, 3, 'Bra�o Quebrado', 'Dorflex + Gesso');

select * from Prontuario

Select Nome, Rua + ' ' + CAST(Numero as Varchar(10)) + ' ' + Bairro AS Endereco From Paciente
Where Data_Nasc < '1973-01-01'

Select Especialidade From Medico
Where Nome = 'Carolina Oliveira'

Select Medicamento From Prontuario
Where Diagn�stico = 'Reumatismo'

Select Diagn�stico, Medicamento From Prontuario
Where CPF_Paciente = (
	Select CPF From Paciente
	Where Nome = 'Jos� Rubens'
)

Select Nome, Especialidade From Medico
Where Codigo = (
	Select  Codigo_Medico From Prontuario
	Where CPF_Paciente = 35454562890
)

SELECT 
    M.Nome,
    CASE 
        WHEN LEN(M.Especialidade) > 3 THEN CONCAT(SUBSTRING(M.Especialidade, 1, 3), '.')
        ELSE M.Especialidade
    END AS Especialidade
FROM 
    Prontuario P
JOIN 
    Medico M ON P.Codigo_Medico = M.Codigo
JOIN 
    Paciente Pa ON P.CPF_Paciente = Pa.CPF
WHERE 
    Pa.Nome = 'Jos� Rubens';

SELECT 
    SUBSTRING(CAST(Pa.CPF AS VARCHAR(20)), 1, 3) + '.' +
    SUBSTRING(CAST(Pa.CPF AS VARCHAR(20)), 4, 3) + '.' +
    SUBSTRING(CAST(Pa.CPF AS VARCHAR(20)), 7, 3) + '-' +
    SUBSTRING(CAST(Pa.CPF AS VARCHAR(20)), 10, 2) AS CPF,
    Pa.Nome,
    CONCAT(Pa.Rua, ', ', Pa.Numero, ' - ', Pa.Bairro) AS Endere�o,
    ISNULL(Pa.Telefone, '-') AS Telefone
FROM 
    Prontuario P
JOIN 
    Paciente Pa ON P.CPF_Paciente = Pa.CPF
JOIN 
    Medico M ON P.Codigo_Medico = M.Codigo
WHERE 
    M.Nome = 'Vinicius Araujo';

Select 
	SUBSTRING(CAST(pa.CPF AS VARCHAR(20)), 1, 3) + '.' +
    SUBSTRING(CAST(pa.CPF AS VARCHAR(20)), 4, 3) + '.' +
    SUBSTRING(CAST(pa.CPF AS VARCHAR(20)), 7, 3) + '-' +
    SUBSTRING(CAST(pa.CPF AS VARCHAR(20)), 10, 2) AS CPF,
    pa.Nome,
    CONCAT(pa.Rua, ', ', pa.Numero, ' - ', pa.Bairro) AS Endere�o,
    ISNULL(pa.Telefone, '-') AS Telefone
From Prontuario p, Paciente	 pa, Medico m
Where p.CPF_Paciente = pa.CPF
	AND p.Codigo_Medico = m.Codigo
	AND m.Nome = 'Vinicius Araujo'

UPDATE Paciente
Set Nome = '98345621'
Where Nome = 'Maria Rita'

UPDATE Paciente
Set Rua = 'Volunt�rios da P�tria',
	Numero = 1980,
	Bairro = 'Jd. Aeroporto'
Where Nome = 'Joana de Souza'
