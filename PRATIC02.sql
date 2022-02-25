CREATE DATABASE sistema;
USE sistema;

CREATE TABLE cad_cidade (
`codigo` INT AUTO_INCREMENT NOT NULL,
`nome` VARCHAR(30) NOT NULL,
`uf` CHAR(2) NOT NULL,
PRIMARY KEY(`codigo`)
);

INSERT INTO cad_cidade (nome, uf) VALUES ('Curitiba', 'PR');
INSERT INTO cad_cidade (nome, uf) VALUES ('Rio de Janeiro', 'RJ');
INSERT INTO cad_cidade (nome, uf) VALUES ('Ponta Grossa', 'PR');
INSERT INTO cad_cidade (nome, uf) VALUES ('São Paulo', 'SP');
INSERT INTO cad_cidade (nome, uf) VALUES ('Ribeirão', 'SP');

SELECT 
codigo,
nome,
uf
FROM cad_cidade;

DESCRIBE cad_cidade;

ALTER TABLE cad_cidade RENAME TO cidade;

SELECT * FROM cidade WHERE uf='SP';

CREATE TABLE funcionario (
codigo INT(3) AUTO_INCREMENT NOT NULL,
nome VARCHAR(30) NOT NULL,
endereco VARCHAR(40) NOT NULL,
numero INT(6) NOT NULL,
salario DECIMAL(6,2) NOT NULL,
cod_cidade INT(5) NOT NULL,
PRIMARY KEY(codigo));

DROP TABLE funcionario;
SHOW tables;

ALTER TABLE funcionario ADD COLUMN sexo CHAR(1);

INSERT INTO funcionario (nome, endereco, numero, salario, cod_cidade, sexo) VALUES 
('Pedro', 'Rua Flores', 30, 1500.00, 2, 'M');
INSERT INTO funcionario (nome, endereco, numero, salario, cod_cidade, sexo) VALUES
('Maria', 'Av Brasil', 400, 1960.70, 1, 'F');
INSERT INTO funcionario (nome, endereco, numero, salario, cod_cidade, sexo) VALUES
('Jose', 'Rua do João', 759, 3800.00, 4, 'F');
INSERT INTO funcionario (nome, endereco, numero, salario, cod_cidade, sexo) VALUES
('Marco', 'Av Santa Rita', 2, 3450.50, 2, 'M');

SELECT nome, sexo FROM funcionario;
SELECT * FROM funcionario WHERE salario > 2000.00;
SELECT * FROM funcionario WHERE sexo = 'M' AND salario < 1500;
SELECT * FROM funcionario ORDER BY salario ASC;
SELECT * FROM funcionario WHERE salario >= 2000 AND salario <= 3000;
SELECT * FROM funcionario WHERE salario >= 1800 AND salario <= 3000;
SELECT * FROM funcionario WHERE nome LIKE 'M%';
SELECT * FROM funcionario WHERE nome LIKE '%A%';
SELECT * FROM funcionario WHERE nome NOT LIKE 'M%';

ALTER TABLE funcionario ADD COLUMN setor VARCHAR(25) NOT NULL;

DESCRIBE funcionario;

UPDATE funcionario SET setor='produção';
UPDATE funcionario SET setor='Gerência' WHERE codigo = 3;

SELECT * FROM funcionario;

DELETE FROM funcionario WHERE codigo > 3;

DELETE FROM cidade WHERE uf = 'MS';

SELECT funcionario.nome, cidade.nome FROM funcionario, cidade WHERE funcionario.cod_cidade = cidade.codigo;

SELECT sexo, AVG(salario) FROM funcionario GROUP BY sexo;

SELECT cidade.nome, SUM(funcionario.salario)FROM cidade, funcionario WHERE cidade.codigo = funcionario.cod_cidade GROUP BY cidade.nome;

SELECT cidade.nome, count(*) AS 'func_per_city' FROM cidade, funcionario WHERE cidade.codigo = funcionario.cod_cidade GROUP BY cidade.nome; 