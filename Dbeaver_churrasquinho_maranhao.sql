

CREATE TABLE comanda(
    id SERIAL,
    CONSTRAINT PK_id_comanda PRIMARY KEY (id),
    mesa INT,
    data_hora_abertura TIMESTAMP NOT NULL,
    data_hora_fechamento TIMESTAMP,
    nome_cliente VARCHAR(255) 
);

CREATE TABLE cardapio(
    id SERIAL,
    CONSTRAINT PK_id_cardapio PRIMARY KEY (id),
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT 
);

CREATE TABLE pedido ( 
    id SERIAL,
    CONSTRAINT PK_id_item_pedido PRIMARY KEY (id),
    id_pedido INT NOT NULL,
    id_cardapio INT NOT NULL,
    id_comanda INT NOT NULL,  
    quantidade INT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    FOREIGN KEY (id_comanda) REFERENCES comanda(id),
    FOREIGN KEY (id_cardapio) REFERENCES cardapio(id)
);

INSERT INTO comanda (mesa, data_hora_abertura, nome_cliente) VALUES
(1, '2024-07-27 19:00:00', 'João Silva'),
(2, '2024-07-27 19:30:00', 'Maria Souza'),
(3, '2024-07-27 20:00:00', 'Carlos Pereira');

INSERT INTO cardapio (nome, descricao, preco, quantidade_estoque) VALUES
('Picanha', 'Picanha grelhada na brasa', 59.90, 20),
('Linguiça Acebolada', 'Linguiça de porco com cebola', 39.90, 30),
('Frango a Passarinho', 'Frango crocante e temperado', 29.90, 40),
('Refrigerante Cola', 'Refrigerante 2L', 12.00, 50),
('Suco de Laranja', 'Suco natural 500ml', 15.00, 30);

INSERT INTO pedido (id_cardapio, id_comanda, data_hora, quantidade) VALUES	
(1, 1, '2024-07-27 19:00:00', 4),
(2, 2, '2024-07-27 19:01:00', 5),
(5, 3, '2024-07-27 19:00:00', 4),
(1, 2, '2024-07-27 19:00:00', 4);


