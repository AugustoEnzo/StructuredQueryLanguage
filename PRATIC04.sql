USE aula;

CREATE TABLE funcionario (
cod INT(3) NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
sexo CHAR(1) NOT NULL,
salario DECIMAL(8,2) NOT NULL,
PRIMARY KEY(cod));

INSERT INTO funcionario VALUES (NULL, 'Pedro', 'M',  1000.00);
INSERT INTO funcionario VALUES (NULL, 'João', 'M', 1500.00);
INSERT INTO funcionario VALUES (NULL, 'Tiago', 'M', 2000.00);
INSERT INTO funcionario VALUES (NULL, 'Sara', 'F', 3000.00);

SELECT * FROM funcionario;

DELIMITER $$
CREATE PROCEDURE func_minimo (sal decimal)
SELECT COUNT(*) FROM funcionario WHERE salario < sal;
$$

CALL func_minimo(2000);

DELIMITER $$
CREATE PROCEDURE func_salario (id SMALLINT)
SELECT * FROM funcionario WHERE cod = id;
$$

CALL func_salario(2);

DELIMITER $$
CREATE PROCEDURE func_aumento (id SMALLINT, perc DECIMAL(3,2))
UPDATE funcionario SET salario = salario + (salario * perc) WHERE cod = id;
$$

DROP PROCEDURE func_aumento;

CALL func_aumento(2, 0.25);

SELECT * FROM funcionario WHERE cod <3;

DELIMITER $$
CREATE PROCEDURE func_reducao (id SMALLINT, perc DECIMAL(3,2))
UPDATE funcionario SET salario = salario - (salario * perc) WHERE cod = id;
$$

DROP PROCEDURE func_reducao;

CALL func_reducao (2, 0.3);
$$

SELECT * FROM funcionario WHERE cod = 2;

DELIMITER $$
CREATE FUNCTION soma (a INT, b INT)
RETURNS INT
RETURN a + b;
$$

SELECT soma (8,3);

DELIMITER $$
CREATE FUNCTION salario (id smallint)
RETURNS DECIMAL(8,2)
RETURN (SELECT salario FROM funcionario WHERE cod = id);
$$

SELECT salario(1);

DELIMITER $$
CREATE FUNCTION func_sexo (p_sexo char)
RETURNS INT
RETURN (SELECT COUNT(*) FROM funcionario WHERE sexo = p_sexo);
$$

SELECT func_sexo ('M');

DROP FUNCTION soma;

CREATE TABLE backup (
cod INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
salario DECIMAL(8,2) NOT NULL,
PRIMARY KEY(cod));

DELIMITER $$
CREATE TRIGGER make_backup BEFORE DELETE
ON FUNCIONARIO
FOR EACH ROW
BEGIN
INSERT INTO backup (nome, salario) VALUES (OLD.nome, OLD.salario);
END
$$

SELECT * FROM backup;

DELETE FROM funcionario;

DELIMITER $$
CREATE FUNCTION num_BACKUP (id smallint)
RETURNS INT
RETURN (SELECT COUNT(*) FROM backup WHERE cod >= 0);
$$

DROP FUNCTION num_BACKUP;

SELECT num_BACKUP(0);

DELIMITER $$
CREATE PROCEDURE num_sexo (p_sexo char)
	BEGIN
		IF (p_sexo = 'M') THEN
			SELECT COUNT(*) FROM funcionario WHERE sexo = 'M';
		ELSEIF (p_sexo = 'F') THEN
			SELECT COUNT(*) FROM funcionario WHERE sexo = 'F';
		END IF;
	END
$$

CALL num_sexo('M');

DELIMITER $$
CREATE PROCEDURE proc_sexo (p_sex CHAR)
	BEGIN
		IF (p_sex = 'M') THEN
			SELECT * FROM funcionario WHERE sexo = 'M';
		ELSEIF (p_sex = 'F') THEN
			SELECT * FROM funcionario WHERE sexo = 'F';
		END IF;
	END
$$

DROP PROCEDURE proc_sexo;

CALL proc_sexo('M');

DROP TRIGGER make_backup;