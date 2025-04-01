CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome TEXT,
    senha TEXT
);

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    imagem TEXT,
    valor INT,
    descricao TEXT
);