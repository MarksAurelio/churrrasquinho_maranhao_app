CREATE DATABASE churrasquinho_maranhao_app;
USE churrasquinho_maranhao_app;

CREATE TABLE comanda(
    id INT AUTO_INCREMENT,
    CONSTRAINT PK_id_comanda PRIMARY KEY (id),
    mesa INT,
    data_hora_abertura TIMESTAMP NOT NULL,
    data_hora_fechamento TIMESTAMP,
    nome_cliente VARCHAR(255) 
);

CREATE TABLE cardapio(
    id INT AUTO_INCREMENT,
    CONSTRAINT PK_id_cardapio PRIMARY KEY (id),
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT 
);

CREATE TABLE pedido ( 
    id INT AUTO_INCREMENT,
    CONSTRAINT PK_id_item_pedido PRIMARY KEY (id),
    id_cardapio INT NOT NULL,
    id_comanda INT NOT NULL,  
    quantidade INT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    FOREIGN KEY (id_comanda) REFERENCES comanda(id),
    FOREIGN KEY (id_cardapio) REFERENCES cardapio(id)
);

INSERT INTO comanda (mesa, data_hora_abertura, data_hora_fechamento, nome_cliente)  
VALUES 
(1, '2024-07-27 19:00:00', '2024-07-27 21:00:00', 'João Silva'),
(2, '2024-07-27 19:30:00', '2024-07-27 21:30:00', 'Maria Souza'),
(3, '2024-07-27 20:00:00', '2024-07-27 22:00:00', 'Carlos Pereira'),
(4, '2024-07-27 20:30:00', '2024-07-27 22:30:00', 'Ana Costa'),
(5, '2024-07-27 21:00:00', '2024-07-27 23:00:00', 'Ricardo Lima'),
(6, '2024-07-27 21:30:00', '2024-07-27 23:30:00', 'Patricia Oliveira'),
(7, '2024-07-27 22:00:00', '2024-07-27 00:00:00', 'Fernanda Souza'),
(8, '2024-07-27 22:30:00', '2024-07-28 00:30:00', 'Lucas Martins'),
(9, '2024-07-27 23:00:00', '2024-07-28 01:00:00', 'Beatriz Silva'),
(10, '2024-07-27 23:30:00', '2024-07-28 01:30:00', 'Gustavo Rocha'),
(11, '2024-07-28 00:00:00', '2024-07-28 02:00:00', 'Mariana Almeida'),
(12, '2024-07-28 00:30:00', '2024-07-28 02:30:00', 'Eduardo Pereira'),
(13, '2024-07-28 01:00:00', '2024-07-28 03:00:00', 'Isabela Costa'),
(14, '2024-07-28 01:30:00', '2024-07-28 03:30:00', 'Rafael Souza'),
(15, '2024-07-28 02:00:00', '2024-07-28 04:00:00', 'Juliana Lima'),
(16, '2024-07-28 02:30:00', '2024-07-28 04:30:00', 'Henrique Martins'),
(17, '2024-07-28 03:00:00', '2024-07-28 05:00:00', 'Tânia Oliveira'),
(18, '2024-07-28 03:30:00', '2024-07-28 05:30:00', 'Marcelo Silva'),
(19, '2024-07-28 04:00:00', '2024-07-28 06:00:00', 'Tatiane Rocha'),
(20, '2024-07-28 04:30:00', '2024-07-28 06:30:00', 'Sérgio Costa');

select * from comanda;

INSERT INTO cardapio (nome, descricao, preco, quantidade_estoque) VALUES
('Feijoada', 'Feijoada completa com arroz e farofa', 49.90, 15),
('Salada de Maionese', 'Salada de batata com maionese', 19.90, 25),
('Espetinho de Carne', 'Espetinho de carne bovina grelhado', 15.90, 40),
('Espetinho de Frango', 'Espetinho de frango grelhado', 12.90, 45),
('Batata Frita', 'Porção de batata frita crocante', 18.90, 35),
('Pizza Marguerita', 'Pizza com molho de tomate, queijo e manjericão', 29.90, 20),
('Pizza Calabresa', 'Pizza com calabresa e queijo', 34.90, 18),
('Pizza Portuguesa', 'Pizza com presunto, ovo e queijo', 39.90, 10),
('Churrasco Misto', 'Churrasco com carne bovina, frango e linguiça', 59.90, 12),
('Bacalhau à Brás', 'Bacalhau desfiado com batatas e ovos', 54.90, 5),
('Risoto de Camarão', 'Risoto cremoso com camarões', 49.90, 8),
('Risoto de Funghi', 'Risoto com cogumelos funghi', 44.90, 10),
('Nhoque ao Molho Pesto', 'Nhoque de batata com molho pesto', 39.90, 20),
('Salmão Grelhado', 'Salmão grelhado com molho de limão', 69.90, 6),
('Camarão Empanado', 'Camarões empanados e crocantes', 49.90, 12),
('Mousse de Maracujá', 'Mousse de maracujá com leite condensado', 14.90, 30),
('Pudim de Leite', 'Pudim de leite condensado', 16.90, 25),
('Café Expresso', 'Café expresso 50ml', 5.90, 100),
('Água Mineral', 'Água mineral 500ml', 4.00, 200),
('Cerveja Lata', 'Cerveja lata 350ml', 7.00, 150);

select * from cardapio;

INSERT INTO pedido (id_cardapio, id_comanda, data_hora, quantidade) VALUES
(3, 4, '2024-07-27 20:30:00', 3),
(4, 5, '2024-07-27 21:00:00', 2),
(7, 6, '2024-07-27 21:30:00', 6),
(9, 7, '2024-07-27 22:00:00', 1),
(6, 8, '2024-07-27 22:30:00', 3),
(2, 9, '2024-07-27 23:00:00', 4),
(8, 10, '2024-07-27 23:30:00', 2),
(11, 11, '2024-07-28 00:00:00', 2),
(10, 12, '2024-07-28 00:30:00', 3),
(12, 13, '2024-07-28 01:00:00', 1),
(13, 14, '2024-07-28 01:30:00', 5),
(14, 15, '2024-07-28 02:00:00', 4),
(16, 16, '2024-07-28 02:30:00', 3),
(18, 17, '2024-07-28 03:00:00', 2),
(17, 18, '2024-07-28 03:30:00', 6),
(20, 19, '2024-07-28 04:00:00', 3),
(19, 20, '2024-07-28 04:30:00', 4),
(5, 19, '2024-07-28 04:45:00', 7),
(6, 20, '2024-07-28 05:00:00', 3),
(3, 18, '2024-07-28 05:15:00', 5);

select * from pedido;

-- Listar todas as comandas abertas.
select * from comanda;

-- Consultar o cardápio completo.
select * from cardapio;

-- Obter o histórico de pedidos realizados.
select id_comanda, quantidade from pedido as p
inner join comanda as c on p.id_comanda = c.id;

-- Verificar quais pratos foram pedidos em uma determinada comanda.
SELECT c.*, SUM(p.quantidade) AS comanda
FROM cardapio AS c
INNER JOIN pedido AS p ON p.id_cardapio = c.id
GROUP BY c.id
HAVING SUM(p.quantidade) = 6;

-- Calcular o total gasto por cada comanda.
SELECT c.id, c.nome, c.descricao, SUM(p.quantidade * c.preco) AS "TOTAL GASTO POR COMANDA"
FROM cardapio AS c
INNER JOIN pedido AS p ON p.id_cardapio = c.id
GROUP BY c.id, c.nome, c.descricao;

-- Implemente uma consulta SQL para identificar qual prato foi o mais pedido e quantas vezes ele foi solicitado.

SELECT c.nome, COUNT(p.id) AS quantidade_solicitada
FROM pedido AS p
INNER JOIN cardapio AS c ON p.id_cardapio = c.id
GROUP BY c.nome
ORDER BY quantidade_solicitada DESC
LIMIT 1;

--  Criar uma procedure que atualize a quantidade em estoque de um item do cardápio.

DELIMITER $$

CREATE PROCEDURE AtualizarEstoqueItem(
    IN p_id_cardapio INT,       
    IN p_quantidade INT         
)
BEGIN

    UPDATE cardapio
    SET quantidade_estoque = p_quantidade
    WHERE id = p_id_cardapio;
    -- Verifica se a atualização foi bem-sucedida
    IF ROW_COUNT() > 0 THEN
        SELECT 'Estoque atualizado com sucesso.' AS mensagem;
    ELSE
        SELECT 'Erro: Item não encontrado.' AS mensagem;
    END IF;
END $$

DELIMITER ;

--  Criar uma trigger que subtraia a quantidade em estoque de um tem do cardápio quando for solicitado em um pedido.

DELIMITER $$

CREATE TRIGGER AtualizarEstoqueApósPedido
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
   
    UPDATE cardapio
    SET quantidade_estoque = quantidade_estoque - NEW.quantidade
    WHERE id = NEW.id_cardapio;
    
END $$

CREATE TABLE au_pizza (
id int auto_increment primary key,
pizza_id int not null,
nome_antigo varchar (255) not null,
preco_antigo decimal (10,2) not null,
data_alteracao timestamp default current_timestamp)
