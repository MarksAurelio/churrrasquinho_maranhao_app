select user, host from mysql.user;

create user 'novo-usuario'@'localhost' IDENTIFIED BY 'senai@123';

create database pizzaria;

grant all privileges on pizzaria.* to 'novo-usuario'@'localhost';

revoke create on pizzaria.* from 'novo-usuario'@'localhost';

use pizzaria;

create table pizza(
id_pizza int auto_increment primary key,
sabor varchar(250),
ingredientes varchar(250));

show grants for 'novo-usuario'@'localhost';

create table au_pizza(
id_aupizza int auto_increment primary key,
id_pizza int,
sabor varchar(250),
ingredientes varchar(250),
usuario varchar(250),
data_hora datetime,
operacao varchar (10));

DELIMITER $$
create trigger depois_insert_pizza
after insert on pizza
for each row
BEGIN
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (new.id_pizza, new.sabor, new.ingredientes, user(), now(), 'insert');
END$$

DELIMITER ;

create database pizzaria;

grant all privileges on pizzaria.* to 'novo-usuario'@'localhost';

revoke create on pizzaria.* from 'novo-usuario'@'localhost';

use pizzaria;
create table pizza(
id_pizza int auto_increment primary key,
sabor varchar(250),
ingredientes varchar(250));

show grants for 'novo-usuario'@'localhost';

create table au_pizza(
id_aupizza int auto_increment primary key,
id_pizza int,
sabor varchar(250),
ingredientes varchar(250),
usuario varchar(250),
data_hora datetime,
operacao varchar (10));
drop trigger depois_insert_pizza;
DELIMITER $$

create trigger depois_insert_pizza
after insert on pizza
for each row
BEGIN
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (new.id_pizza, new.sabor, new.ingredientes, user(), now(), 'insert');
END$$

DELIMITER ;


CREATE USER 'luiz-maia'@'%' IDENTIFIED BY 'senai@123';

GRANT SELECT, INSERT, update ON pizzaria .pizza to 'luiz-maia'@'%';

SHOW GRANTS FOR 'luiz-maia'@'%';

--  Construa uma trigger para identificar os updates na tabela pizza e grave as antigas informações na tabela au_pizza.

drop trigger trg_before_update;
DELIMITER $$

create trigger trg_before_update
before update on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
     VALUES (OLD.id_pizza, OLD.sabor, OLD.ingredientes, USER(), NOW(), 'update');
END $$

DELIMITER ;

select * from pizza;
select * from au_pizza;

-- Construa uma trigger para identificar os deletes na tabela pizza e grave as antigas informações na tabela au_pizza.
drop trigger indentificar_deletes;
DELIMITER $$

create trigger indentificar_deletes
before delete on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
     VALUES (OLD.id_pizza, OLD.sabor, OLD.ingredientes, USER(), NOW(), 'delete');
END$$

DELIMITER ;

-- Conceda a permissão de delete para o usuário "luiz-maia"@"%"

GRANT DELETE ON pizzaria .pizza to 'luiz-maia'@'%';

SHOW GRANTS FOR 'luiz-maia'@'%';

-- Conceda a permissão de select para o usuário "luiz-maia"@"%" na tabela au_pizza

GRANT select ON pizzaria .pizza to 'luiz-maia'@'%';

SHOW GRANTS FOR 'luiz-maia'@'%';

GRANT SELECT ON pizzaria.au_pizza to 'luiz-maia'@'%';