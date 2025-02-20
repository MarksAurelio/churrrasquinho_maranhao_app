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

