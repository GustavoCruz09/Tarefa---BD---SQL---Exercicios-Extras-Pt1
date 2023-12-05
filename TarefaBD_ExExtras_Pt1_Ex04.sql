-- Exercicio 04

Create DataBase TarefaBD_ExExtras_Pt1_Ex04

go

Use TarefaBD_ExExtras_Pt1_Ex04

go 

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    CPF VARCHAR(15) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(15) NOT NULL
);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (CPF, Nome, Telefone)
VALUES
    ('345789092-90', 'Julio Cesar', '8273-6541'),
    ('251865337-10', 'Maria Antonia', '8765-2314'),
    ('876273154-16', 'Luiz Carlos', '6128-9012'),
    ('791826398-00', 'Paulo Cesar', '9076-5273');


-- Criação da tabela Fornecedor
CREATE TABLE Fornecedor (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Logradouro VARCHAR(50) NOT NULL,
    Numero INT NOT NULL,
    Complemento VARCHAR(50),
    Cidade VARCHAR(50) NOT NULL
);

-- Inserção de dados na tabela Fornecedor
INSERT INTO Fornecedor (ID, Nome, Logradouro, Numero, Complemento, Cidade)
VALUES
    (1, 'LG', 'Rod. Bandeirantes', 70000, 'Km 70', 'Itapeva'),
    (2, 'Asus', 'Av. Nações Unidas', 10206, 'Sala 225', 'São Paulo'),
    (3, 'AMD', 'Av. Nações Unidas', 10206, 'Sala 1095', 'São Paulo'),
    (4, 'Leadership', 'Av. Nações Unidas', 10206, 'Sala 87', 'São Paulo'),
    (5, 'Inno', 'Av. Nações Unidas', 10206, 'Sala 34', 'São Paulo');

-- Criação da tabela Produto
CREATE TABLE Produto (
    Código INT PRIMARY KEY,
    Descrição VARCHAR(50) NOT NULL,
    id_Fornecedor INT,
    Preço DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_Fornecedor) REFERENCES Fornecedor(ID)
);

-- Inserção de dados na tabela Produto
INSERT INTO Produto (Código, Descrição, id_Fornecedor, Preço)
VALUES
    (1, 'Monitor 19 pol.', 1, 449.99),
    (2, 'Netbook 1GB Ram 4 Gb HD', 2, 699.99),
    (3, 'Gravador de DVD - Sata', 1, 99.99),
    (4, 'Leitor de CD', 1, 49.99),
    (5, 'Processador - Phenom X3 - 2.1GHz', 3, 349.99),
    (6, 'Mouse', 4, 19.99),
    (7, 'Teclado', 4, 25.99),
    (8, 'Placa de Video - Nvidia 9800 GTX - 256MB/256 bits', 5, 599.99);

-- Criação da tabela Venda
CREATE TABLE Venda (
    Codigo INT,
    produto INT,
    cliente VARCHAR(15),
    Quantidade INT,
    Valor_Total DECIMAL(10, 2),
    Data DATE
	Primary Key(Codigo, Produto, Cliente)
    FOREIGN KEY (produto) REFERENCES Produto(Código),
    FOREIGN KEY (cliente) REFERENCES Cliente(CPF)
);

-- Inserção de dados na tabela Venda
INSERT INTO Venda (Codigo, Produto, Cliente, Quantidade, Valor_Total, Data)
VALUES
    (1, 1, '251865337-10', 1, 449.99, '2009-09-03'),
    (2, 6, '791826398-00', 4, 79.96, '2009-09-06'),
    (3, 8, '876273154-16', 1, 599.99, '2009-09-06'),
    (4, 2, '345789092-90', 2, 1399.98, '2009-09-08');

SELECT Codigo, Produto, Cliente, Quantidade, Valor_Total, CONVERT(VARCHAR, Data, 103) AS dataFormatada
FROM  Venda
WHERE Codigo = 4

ALTER TABLE Fornecedor
ADD Telefone VARCHAR(15)

UPDATE Fornecedor
SET Telefone = '7216-5371'
WHERE ID = 1;

UPDATE Fornecedor
SET Telefone = '8715-3738'
WHERE ID = 2;

UPDATE Fornecedor
SET Telefone = '3654-6289'
WHERE ID = 4;

Select Nome, Logradouro + '	' + CAST(Numero as Varchar(10)) + ' ' + Complemento  as Endereco From Fornecedor
Order By nome ASC

Select p.Descrição, v.Quantidade, v.Valor_Total
From Venda v, Cliente c, Produto p
Where v.produto = p.Código
	and v.cliente = c.CPF
	and  c.Nome = 'Julio Cesar'

Select CONVERT(varchar, v.Data, 103) as dataFormatada, v.Valor_Total
From Cliente c, Venda v, Produto p
Where v.produto = p.Código
	and v.cliente = c.CPF
	and  c.Nome = 'Paulo Cesar'


Select * From Produto
Order by Preço ASC