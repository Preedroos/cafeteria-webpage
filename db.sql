-- Tabela de produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50),
    disponivel BOOLEAN DEFAULT TRUE
);

-- Produtos
INSERT INTO produtos (id_produto, nome, preco, categoria, disponivel) VALUES
    (1, 'Cappuccino', 12.50, 'Bebida', TRUE),
    (2, 'Brigadeiro', 4.00, 'Doce', TRUE),
    (3, 'Pão de Queijo', 6.00, 'Salgado', TRUE);
    
SELECT * FROM produtos;

-- Tabela de pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Em preparo',
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Pedidos
INSERT INTO pedidos (id_pedido, id_produto, quantidade, status) VALUES
    (1, 1, 2, 'Em preparo'),  -- 2 Cappuccinos
    (2, 2, 5, 'Entregue'),     -- 5 Brigadeiros
    (3, 3, 3, 'Cancelado');    -- 3 Pães de Queijo
    
SELECT * FROM pedidos;

-- Consultas de exemplo
-- Listar todos os produtos disponíveis
SELECT * FROM produtos WHERE disponivel = TRUE;

-- Remoção de um produto
DELETE FROM pedidos WHERE id_produto = 3; -- Remove o Pão de Queijo

-- Atualização do status de um pedido
UPDATE pedidos SET status = 'Entregue' WHERE id_pedido = 1; -- Atualiza o status do primeiro pedido para 'Entregue'
