create database bd_clientes; #criando o arquivo  #DDL
use bd_clientes; #usando o arquivo

create table tbl_clientes ( #criando a tabela clientes     #DDL
codigo int not null primary key auto_increment, #criando a chave primaria
nome varchar(40) not null, #criando topico da tabela
sexo char(1) not null #criando topico da tabela
);

insert into tbl_clientes(nome,sexo) #inserindo dados      #DML
values("Humberto","M"),("Ayrton Sena","M"),("Xuxa","F");

select * from tbl_clientes; #mostrando a tabela     #DML

DELIMITER $$
create procedure sp_lista_clientes(IN opcao int)
begin
    if opcao = 0 then
		select * from tbl_clientes where sexo = "F";
	elseif opcao = 1 then
        select * from tbl_clientes where sexo = "M";
	else
        select * from tbl_clientes;
	end if;
end $$
DELIMITER ;

show procedure status;

#lista sexo Feminino:
call sp_lista_clientes(0);
#lista sexo Masculino:
call sp_lista_clientes(1);
#lista todos:
call sp_lista_clientes(2);

#exemplo 2 stored procedure
DELIMITER $$

create procedure sp_busca_cliente_por_nome(IN nome_parcial varchar(100))
begin
    select * from tbl_clientes
    where nome like concat('%', nome_parcial, '%');
end $$

DELIMITER ;

call sp_busca_cliente_por_nome('A');
