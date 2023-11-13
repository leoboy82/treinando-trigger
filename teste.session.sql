-- Criar um banco de dados
CREATE DATABASE IF NOT EXISTS ExemploDB;
USE ExemploDB;

-- Criar uma tabela de usuários
CREATE TABLE IF NOT EXISTS Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Criar uma tabela de registros de atividade
CREATE TABLE IF NOT EXISTS RegistroAtividade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    acao VARCHAR(50),
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Criar um trigger que registra uma atividade sempre que um novo usuário é inserido
DELIMITER //
CREATE TRIGGER after_insert_usuario
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
    INSERT INTO RegistroAtividade (usuario_id, acao) VALUES (NEW.id, 'Inserção de Usuário');
END;
//
DELIMITER ;
