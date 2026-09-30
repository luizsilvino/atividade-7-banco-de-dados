USE oficina_mecanica_db;
GO

CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    cidade VARCHAR(60) NOT NULL
);

CREATE TABLE Veiculo (
    id_veiculo INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    placa VARCHAR(7) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL,
    chassi VARCHAR(17) NOT NULL UNIQUE,

    FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    funcao VARCHAR(80) NOT NULL
);

CREATE TABLE Ordem_Servico (
    id_ordem INT IDENTITY(1,1) PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_mecanico INT NOT NULL,
    data_abertura DATETIME NOT NULL,
    estimativa_entrega DATETIME NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL,

    FOREIGN KEY (id_veiculo)
        REFERENCES Veiculo(id_veiculo),

    FOREIGN KEY (id_mecanico)
        REFERENCES Mecanico(id_mecanico)
);
GO