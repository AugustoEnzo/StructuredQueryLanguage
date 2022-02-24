CREATE TABLE `fisico`.`pacote`  (
`cod_pacote` INT NOT NULL AUTO_INCREMENT,
`cod_curso` INT NOT NULL,
`nome` VARCHAR(45) NOT NULL,
`numero_aulas` INT NOT NULL,
`valor` DECIMAL(6,2) NOT NULL,
PRIMARY KEY (`cod_pacote`)
);

CREATE TABLE `fisico`.`curso` (
`cod_curso` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`professor` VARCHAR(45) NOT NULL,
PRIMARY KEY (`cod_curso`)
);


CREATE TABLE `fisico`.`pagamento` (
`cod_pagamento` INT NOT NULL AUTO_INCREMENT,
`cod_pacote` INT NOT NULL,
`cod_aluno` INT NOT NULL,
`parcela` INT NOT NULL,
`valor` DECIMAL(6,2) NOT NULL,
`dt_vencimento` DATE NOT NULL,
`dt_pagamento` DATE NOT NULL,
PRIMARY KEY (`cod_pagamento`)
);

CREATE TABLE `fisico`.`aluno` (
`cod_aluno` INT AUTO_INCREMENT NOT NULL,
`nome` VARCHAR(45) NOT NULL,
`endereco` VARCHAR(60) NOT NULL,
`dt_nasc` DATE NOT NULL,
`cidade` VARCHAR(45) NOT NULL,
`telefone` VARCHAR(12) NOT NULL,
PRIMARY KEY (`cod_aluno`)
);