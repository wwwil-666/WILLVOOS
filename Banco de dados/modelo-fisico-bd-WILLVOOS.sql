-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE `Acomodações` (
`Id_Acomodações` INTEGER PRIMARY KEY,
Quantidade_pessoas NUMERIC(10),
`Tipo_Acomodação` VARCHAR(100),
`Nome_Acomodação` VARCHAR(10),
`Preço_diária` DECIMAL(10),
Bairro VARCHAR(30),
Cidade VARCHAR(30),
Estado VARCHAR(30),
Rua VARCHAR(10),
CEP VARCHAR(15),
`Número` NUMERIC(5),
Id_Fornecedores INTEGER
)

CREATE TABLE Cliente (
Data_nascimento DATETIME,
CPF_cliente VARCHAR(15),
Id_cliente INTEGER PRIMARY KEY,
Telefone NUMERIC(15),
Telefone1 NUMERIC(15),
Telefone2 NUMERIC(15),
Telefone3 NUMERIC(15),
Telefone4 NUMERIC(15),
Email VARCHAR(30),
Bairro VARCHAR(30),
Estado VARCHAR(30),
Cidade VARCHAR(30),
Rua VARCHAR(10),
CEP VARCHAR(15),
`Número` NUMERIC(5),
Nome_Cliente VARCHAR(100),
`Número_passaporte` VARCHAR(15)
)

CREATE TABLE Pagamento (
Id_Pagamento INTEGER PRIMARY KEY,
Tipo_pagamento VARCHAR(30),
Data_pagamento DATETIME,
Status_pagamento VARCHAR(30),
Valor DECIMAL(10)
)

CREATE TABLE Reserva (
Id_Reserva INTEGER PRIMARY KEY,
Data_reserva DATETIME,
Valor_total DECIMAL(10),
Status_reserva VARCHAR(30),
Id_Voos INTEGER,
Id_Pagamento INTEGER,
`Id_Pacotes_Turísticos` INTEGER,
Id_cliente INTEGER,
`Id_Acomodações` INTEGER,
FOREIGN KEY(Id_Pagamento) REFERENCES Pagamento (Id_Pagamento),
FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente),
FOREIGN KEY(`Id_Acomodações`) REFERENCES `Acomodações` (`Id_Acomodações`)
)

CREATE TABLE Fornecedores (
Id_Fornecedores INTEGER PRIMARY KEY,
Nome_Fornecedor VARCHAR(100),
CNPJ VARCHAR(15),
Telefone VARCHAR(15),
Telefone1 VARCHAR(15),
Telefone2 VARCHAR(15),
Telefone3 VARCHAR(15),
Telefone4 VARCHAR(15),
Email VARCHAR(30)
)

CREATE TABLE `Pacotes_Turísticos` (
`Preço` DECIMAL(10),
`Descrição` VARCHAR(200),
Quantidade_pacotes NUMERIC(10),
Data_fim DATETIME,
`Data_início` DATETIME,
`Id_Pacotes_Turísticos` INTEGER PRIMARY KEY,
`Nome_pacote` VARCHAR(100)
)

CREATE TABLE Voos (
Id_Voos INTEGER PRIMARY KEY,
`Nome_companhia_aérea` VARCHAR(100),
`Número_voo` VARCHAR(10),
Destino VARCHAR(10),
`Data_chegada` DATETIME,
`Preço` DECIMAL(10),
`Data_partida` DATETIME,
Aeroporto_chegada VARCHAR(100),
Aeroporto_partida VARCHAR(30)
)

CREATE TABLE fonece_tem (
Id_Fornecedores INTEGER,
Id_Voos INTEGER,
FOREIGN KEY(Id_Fornecedores) REFERENCES Fornecedores (Id_Fornecedores),
FOREIGN KEY(Id_Voos) REFERENCES Voos (Id_Voos)
)

CREATE TABLE fornece_tem (
Id_Fornecedores INTEGER,
`Id_Pacotes_Turísticos` INTEGER,
FOREIGN KEY(Id_Fornecedores) REFERENCES Fornecedores (Id_Fornecedores),
FOREIGN KEY(`Id_Pacotes_Turísticos`) REFERENCES `Pacotes_Turísticos` (`Id_Pacotes_Turísticos`)
)

ALTER TABLE `Acomodações` ADD FOREIGN KEY(Id_Fornecedores) REFERENCES Fornecedores (Id_Fornecedores)
ALTER TABLE Reserva ADD FOREIGN KEY(Id_Voos) REFERENCES Voos (Id_Voos)
ALTER TABLE Reserva ADD FOREIGN KEY(`Id_Pacotes_Turísticos`) REFERENCES `Pacotes_Turísticos` (`Id_Pacotes_Turísticos`)
