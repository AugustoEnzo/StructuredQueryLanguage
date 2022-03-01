CREATE DATABASE aula;
USE aula;

CREATE TABLE usuario (
codigo INT NOT NULL AUTO_INCREMENT,
login VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
PRIMARY KEY(codigo));

CREATE TABLE cidade (
codigo INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
PRIMARY KEY(codigo));

CREATE USER gerencia@localhost IDENTIFIED BY '123';

GRANT SELECT ON aula.cidade TO gerencia@localhost;

GRANT ALL PRIVILEGES ON aula.cidade TO gerencia@localhost;

INSERT INTO cidade (nome) VALUES ('Irati');
INSERT INTO cidade (nome) VALUES ('Ponta Grossa');

DELETE FROM cidade WHERE nome = 'Ponta Grossa';

INSERT INTO cidade (nome) VALUES ('Ponta grossa');

UPDATE cidade SET nome = 'Ponta Grossa' WHERE codigo = 2;

UPDATE cidade SET codigo = 2 WHERE nome = 'Ponta grossa';

SELECT * FROM cidade;

DELETE FROM cidade WHERE codigo = 1;

GRANT ALL PRIVILEGES ON aula.* TO gerencia@localhost;
GRANT ALL PRIVILEGES ON *.* TO gerencia@localhost;

INSERT INTO usuario (senha, login) VALUES ('3456', 'Joaquim');
INSERT INTO usuario (senha, login) VALUES (8888, 'Joao');

UPDATE usuario SET senha=1234 WHERE codigo = 1;

CREATE INDEX cod_cidade ON cidade (codigo);
CREATE INDEX cod_usuario ON usuario (codigo);

CREATE TABLE resumo_cadastro (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
sexo CHAR(1) NOT NULL,
PRIMARY KEY (id));

DROP TABLE resumo_cadastro;
DELETE INDEX resumo_cadastro.idx_cadastro;

CREATE TABLE resumo_cadastro (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
sexo CHAR(1) NOT NULL,
PRIMARY KEY (id),
INDEX idx_cadastro (id));

CREATE INDEX idx_cadastro ON resumo_cadastro (id);

REVOKE ALL PRIVILEGES ON *.* FROM gerencia@localhost;

DROP USER gerencia@localhost;

CREATE USER chefe@localhost IDENTiFIED BY '456';

GRANT INSERT ON aula.cidade TO chefe@localhost;
REVOKE INSERT ON aula.cidade FROM chefe@localhost;
GRANT INSERT ON aula.usuario TO chefe@localhost;

INSERT INTO usuario (login, senha) VALUES ('Abacaxi', 123);

REVOKE INSERT ON aula.usuario FROM chefe@localhost;
DROP USER chefe@localhost;