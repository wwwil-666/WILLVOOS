-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE `Acomoda��es` (
`Id_Acomoda��es` INTEGER PRIMARY KEY,
Quantidade_pessoas NUMERIC(10),
`Tipo_Acomoda��o` VARCHAR(100),
`Nome_Acomoda��o` VARCHAR(10),
`Pre�o_di�ria` DECIMAL(10),
Bairro VARCHAR(30),
Cidade VARCHAR(30),
Estado VARCHAR(30),
Rua VARCHAR(10),
CEP VARCHAR(15),
`N�mero` NUMERIC(5),
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
`N�mero` NUMERIC(5),
Nome_Cliente VARCHAR(100),
`N�mero_passaporte` VARCHAR(15)
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
`Id_Pacotes_Tur�sticos` INTEGER,
Id_cliente INTEGER,
`Id_Acomoda��es` INTEGER,
FOREIGN KEY(Id_Pagamento) REFERENCES Pagamento (Id_Pagamento),
FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente),
FOREIGN KEY(`Id_Acomoda��es`) REFERENCES `Acomoda��es` (`Id_Acomoda��es`)
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

CREATE TABLE `Pacotes_Tur�sticos` (
`Pre�o` DECIMAL(10),
`Descri��o` VARCHAR(200),
Quantidade_pacotes NUMERIC(10),
Data_fim DATETIME,
`Data_in�cio` DATETIME,
`Id_Pacotes_Tur�sticos` INTEGER PRIMARY KEY,
`Nome_pacote` VARCHAR(100)
)

CREATE TABLE Voos (
Id_Voos INTEGER PRIMARY KEY,
`Nome_companhia_a�rea` VARCHAR(100),
`N�mero_voo` VARCHAR(10),
Destino VARCHAR(10),
`Data_chegada` DATETIME,
`Pre�o` DECIMAL(10),
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
`Id_Pacotes_Tur�sticos` INTEGER,
FOREIGN KEY(Id_Fornecedores) REFERENCES Fornecedores (Id_Fornecedores),
FOREIGN KEY(`Id_Pacotes_Tur�sticos`) REFERENCES `Pacotes_Tur�sticos` (`Id_Pacotes_Tur�sticos`)
)

ALTER TABLE `Acomoda��es` ADD FOREIGN KEY(Id_Fornecedores) REFERENCES Fornecedores (Id_Fornecedores)
ALTER TABLE Reserva ADD FOREIGN KEY(Id_Voos) REFERENCES Voos (Id_Voos)
ALTER TABLE Reserva ADD FOREIGN KEY(`Id_Pacotes_Tur�sticos`) REFERENCES `Pacotes_Tur�sticos` (`Id_Pacotes_Tur�sticos`)
