create table pizza(
id_pizza int auto_increment primary key,
sabor varchar(250),
igredientes varchar(250));

CREATE USER 'luiz-maia'@'localhost' IDENTIFIED BY 'senai@123';

GRANT SELECT, INSERT, update ON pizzaria TO 'luiz-maia'@'localhost';