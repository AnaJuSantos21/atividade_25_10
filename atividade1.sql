CREATE DATABASE bd_clientes_1e;
USE bd_clientes_1e;

CREATE TABLE tbl_clientes2 (
id int not null primary key auto_increment,
nome varchar(100) not null,
idade int not null,
sexo char(1) not null,
email varchar(100) not null,
telefone varchar(15) not null,
endereco varchar(255) not null
);

insert into tbl_clientes2(nome,idade,sexo,email,telefone,endereco)
values ("Carlos", 25, "M", "carlos@example.com", "(11)987654321", "São Paulo"),
       ("Mariana", 30, "F", "mariana@example.com", "(21)988887766", "Rio de Janeiro"),
       ("João", 45, "M", "joao@example.com", "(31)999665544", "Belo Horizonte"),
       ("Ana", 28, "F", "ana@example.com", "(71)977766655", "Salvador"),
       ("Pedro", 38, "M", "pedro@example.com", "(41)944332211", "Curitiba");
        
SELECT * FROM tbl_clientes2;

DELIMITER $$
CREATE PROCEDURE sp_maiores_18(IN idade2 INT)
    BEGIN
    IF idade2 > 18 THEN
    SELECT * FROM tbl_clientes2 WHERE idade > 18;
    ELSEIF idade2 < 18 THEN
    SELECT * FROM tbl_clientes2 WHERE idade < 18;
    END IF;
    END $$
DELIMITER ;

drop procedure sp_maiores_18;

#LISTA MAIORES DE 18
CALL sp_maiores_18 (19);
#LISTA MENORES 18
CALL sp_menores_18(12);