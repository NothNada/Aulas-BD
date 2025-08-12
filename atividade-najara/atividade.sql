-- Criar o banco
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Tabela de alunos
CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    data_nascimento DATE
);

-- Tabela de livros
CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    editora VARCHAR(100),
    ano_publicacao YEAR,
    quantidade INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'disponível'
);

-- Tabela de autores
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Tabela intermediária Livro_Autor (N:N)
CREATE TABLE Livro_Autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor) ON DELETE CASCADE
);

-- Tabela de empréstimos
CREATE TABLE Emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro) ON DELETE CASCADE,
    CHECK (data_devolucao IS NULL OR data_devolucao >= data_emprestimo) -- Garantir ordem de datas
);

DELIMITER //
CREATE TRIGGER check_data_devolucao
BEFORE INSERT ON Emprestimos
FOR EACH ROW
BEGIN
    IF NEW.data_devolucao IS NOT NULL AND NEW.data_devolucao < NEW.data_emprestimo THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Data de devolução não pode ser menor que a data de empréstimo.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER atualiza_quantidade_livro
AFTER INSERT ON Emprestimos
FOR EACH ROW
BEGIN
    UPDATE Livros
    SET quantidade = quantidade - 1,
        status = CASE WHEN quantidade - 1 <= 0 THEN 'indisponível' ELSE 'disponível' END
    WHERE id_livro = NEW.id_livro;
END;
//
DELIMITER ;
