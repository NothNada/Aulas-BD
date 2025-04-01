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

INSERT INTO usuarios (nome, senha) VALUES ('João Silva', 'senha123');
INSERT INTO usuarios (nome, senha) VALUES ('Maria Oliveira', 'senha456');
INSERT INTO usuarios (nome, senha) VALUES ('Thomas Turbano', 'senha789');
INSERT INTO usuarios (nome, senha) VALUES ('Deide Costa', 'senha101');
INSERT INTO usuarios (nome, senha) VALUES ('Cuca Beludo', 'senha202');

INSERT INTO produtos (imagem, valor, descricao) VALUES ('imagem1.jpg', 10, 'Naftalina');
INSERT INTO produtos (imagem, valor, descricao) VALUES ('imagem2.jpg', 25, 'Balinha');
INSERT INTO produtos (imagem, valor, descricao) VALUES ('imagem3.jpg', 10, 'Dipirona');
INSERT INTO produtos (imagem, valor, descricao) VALUES ('imagem4.jpg', 10, 'Tadalafila');
INSERT INTO produtos (imagem, valor, descricao) VALUES ('imagem5.jpg', 15, 'Analgesico');