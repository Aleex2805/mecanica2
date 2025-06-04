CREATE DATABASE mecanica;
   
CREATE TABLE funcionario (
	id_numero_cracha BIGINT(15) PRIMARY KEY,
    nome_funcionario VARCHAR(45),
    telefone BIGINT(14),
    CPF BIGINT(14),
    data_nascimento DATE,
    endereco VARCHAR(45),
    email VARCHAR(45)
    );
    
INSERT INTO funcionario (id_numero_cracha, nome_funcionario, telefone, CPF, data_nascimento, endereco, email)
 VALUES
 (10001, 'João Silva',      11987654321, 12345678901, '1985-03-15', 'Rua A, 123', 'joao.silva@email.com'),
(10002, 'Maria Oliveira',  21998765432, 23456789012, '1990-07-22', 'Av. B, 456', 'maria.oliveira@email.com'),
(10003, 'Carlos Pereira',  31991234567, 34567890123, '1978-11-03', 'Rua C, 789', 'carlos.pereira@email.com'),
(10004, 'Ana Costa',       41999887766, 45678901234, '1995-02-10', 'Av. D, 321', 'ana.costa@email.com'),
(10005, 'Fernanda Souza',  51988776655, 56789012345, '1988-06-25', 'Rua E, 654', 'fernanda.souza@email.com');

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(45),
    CPF BIGINT,
    telefone BIGINT,
    endereco VARCHAR(45),
    RG BIGINT,
    email VARCHAR(45),
    id_funcionario BIGINT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_numero_cracha)
);
INSERT INTO cliente (id_cliente, nome_cliente, CPF, telefone, endereco, RG, email, id_funcionario)
 VALUES
(1, 'Lucas Martins',    12345678901, 11999998888, 'Rua Alfa, 101', 1234567, 'lucas.martins@email.com', 10001),
(2, 'Juliana Ramos',    23456789012, 21988887777, 'Av. Beta, 202', 2345678, 'juliana.ramos@email.com', 10002),
(3, 'Marcos Oliveira',  34567890123, 31977776666, 'Rua Gama, 303', 3456789, 'marcos.oliveira@email.com', 10003),
(4, 'Patrícia Souza',   45678901234, 41966665555, 'Av. Delta, 404', 4567890, 'patricia.souza@email.com', 10004),
(5, 'Renato Lima',      56789012345, 51955554444, 'Rua Épsilon, 505', 5678901, 'renato.lima@email.com', 10005);
    
CREATE TABLE financeiro (
	id_financeiro INT PRIMARY KEY,
    descricao_financas VARCHAR(100),
    orcamentos VARCHAR(80),
    data_pagamentos DATE,
    valor_mao_de_obra FLOAT,
    formas_de_pagamento VARCHAR(45),
    valor_produtos FLOAT,
    id_funcionario BIGINT(15),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_numero_cracha)
    );
INSERT INTO financeiro (id_financeiro, descricao_financas, orcamentos, data_pagamentos,valor_mao_de_obra, formas_de_pagamento, valor_produtos, id_funcionario)
 VALUES
(1, 'Pagamento referente à instalação elétrica','Orçamento #001', '2025-05-10', 800.00, 'Cartão de Crédito', 450.00, 10001),
(2, 'Serviço de manutenção hidráulica','Orçamento #002', '2025-05-15', 600.00, 'Boleto Bancário', 300.00, 10002),
(3, 'Troca de equipamentos de segurança','Orçamento #003', '2025-05-20', 1200.00,'PIX', 950.00, 10003),
(4, 'Limpeza e dedetização do prédio','Orçamento #004', '2025-05-22', 400.00, 'Dinheiro',150.00, 10004),
(5, 'Compra de materiais de escritório','Orçamento #005', '2025-05-25', 0.00,   'Transferência', 700.00, 10005);

CREATE TABLE estoque (
	id_estoque INT PRIMARY KEY,
    codigo_produtos VARCHAR(45),
    data_criacao DATE,
    descricao_produto VARCHAR(45),
    quantidade_produtos INT,
    data_entrada_saida DATETIME,
    produtos_encomendados VARCHAR(100)
    );
INSERT INTO estoque (id_estoque, codigo_produtos, data_criacao, descricao_produto, quantidade_produtos, data_entrada_saida, produtos_encomendados)
VALUES
(1, 'P001', '2025-04-10', 'Cabo HDMI 2m',150, '2025-06-01 09:30:00', 'Cabo HDMI 2m - 50 unidades'),
(2, 'P002', '2025-04-15', 'Teclado Mecânico',80,  '2025-06-01 10:00:00', 'Teclado Mecânico - 20 unidades'),
(3, 'P003', '2025-04-20', 'Mouse Sem Fio',120, '2025-06-01 11:15:00', 'Mouse Sem Fio - 30 unidades'),
(4, 'P004', '2025-04-25', 'Monitor 24 Polegadas',40,  '2025-06-01 12:00:00', 'Monitor 24" - 10 unidades'),
(5, 'P005', '2025-04-28', 'HD Externo 1TB',60,  '2025-06-01 13:45:00', 'HD Externo - 15 unidades');

CREATE TABLE fornecedor (
	CNPJ BIGINT(14) PRIMARY KEY,
    nome_fornecedor VARCHAR(45),
    telefone BIGINT(14),
    id_fornecedor INT,
    email VARCHAR(45),
    endereco VARCHAR(45),
    historico_pedidos VARCHAR(100)
    );
    
INSERT INTO fornecedor (CNPJ, nome_fornecedor, telefone, id_fornecedor, email, endereco, historico_pedidos)
VALUES
(12345678000101, 'Tech Distribuidora',11987654321, 1, 'contato@techdistrib.com', 'Rua Alpha, 123', 'Pedido #1001 - 2025-04-10'),
(23456789000102, 'Eletrônicos BR',21988776655, 2, 'vendas@eletronicosbr.com', 'Av. Beta, 456', 'Pedido #1002 - 2025-04-12'),
(34567890000103, 'InovaTech Soluções',31981234567, 3, 'suporte@inovatech.com', 'Rua Gama, 789', 'Pedido #1003 - 2025-04-15'),
(45678901000104, 'Fornec Sistemas Ltda.',41999887766, 4, 'atendimento@fornecsis.com', 'Av. Delta, 321', 'Pedido #1004 - 2025-04-18'),
(56789012000105, 'Max Office Importações',51988776644, 5, 'comercial@maxoffice.com', 'Rua Épsilon, 654', 'Pedido #1005 - 2025-04-20');
    
CREATE TABLE produto (
	codigo_produto INT PRIMARY KEY,
    nome_produto VARCHAR(45),
    id_produto INT,
    descricao VARCHAR(45),
    preco_produto FLOAT,
    nota_fiscal VARCHAR(45),
    categoria_produto VARCHAR(45),
    id_fornecedor BIGINT(14),
    id_estoque INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(CNPJ),
    FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque)
    );
INSERT INTO produto (codigo_produto, nome_produto, id_produto, descricao, preco_produto, nota_fiscal, categoria_produto, id_fornecedor, id_estoque)
VALUES 
(1, 'Notebook Dell Inspiron', 1001, 'Notebook 15 polegadas', 3500.00, 'NF123456', 'Informática',12345678000199, 1),
(2, 'Mouse Logitech', 1002, 'Mouse sem fio', 120.50, 'NF123457', 'Periféricos', 12345678000199, 1),
(3, 'Cadeira Gamer', 1003, 'Cadeira ergonômica com encosto reclinável', 899.90, 'NF123458', 'Móveis',98765432000155, 2),
(4, 'Monitor LG 24"', 1004, 'Monitor Full HD', 799.00, 'NF123459', 'Informática', 12345678000199, 3),
(5, 'Teclado Mecânico Redragon', 1005, 'Teclado com iluminação RGB', 250.00, 'NF123460', 'Periféricos',98765432000155, 2);
    
CREATE TABLE tipo_servico (
	id_tipo_servico INT PRIMARY KEY,
    nome_servico VARCHAR(45),
    data_servico DATETIME,
    valor_servico FLOAT,
    produto_usado VARCHAR(45),
    tempo_servico DATETIME,
    descricao_servico VARCHAR(100),
    id_funcionario BIGINT(15),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_numero_cracha)
    );
 INSERT INTO tipo_servico (id_tipo_servico, nome_servico, data_servico, valor_servico, produto_usado, tempo_servico, descricao_servico, 
    id_funcionario, id_cliente)
VALUES
(1, 'Troca de Óleo', '2025-06-01 09:00:00', 120.00, 
 'Óleo 10W40 + Filtro', '0000-00-00 00:30:00', 'Troca de óleo lubrificante e filtro',
 100000000000001, 1),
(2, 'Alinhamento e Balanceamento', '2025-06-02 10:30:00', 180.00, 
 'Pesos e ferramentas de alinhamento', '0000-00-00 01:00:00', 'Correção da geometria da suspensão e balanceamento das rodas', 
 100000000000002, 2),
(3, 'Revisão Geral', '2025-06-03 08:45:00', 450.00, 
 'Velas, filtros, óleo, aditivos', '0000-00-00 03:00:00', 'Inspeção completa, troca de peças e fluidos essenciais', 
 100000000000001, 3),
(4, 'Troca de Pastilhas de Freio', '2025-06-03 14:00:00', 220.00, 
 'Pastilhas de freio dianteiras', '0000-00-00 01:15:00', 'Substituição das pastilhas de freio dianteiras', 
 100000000000002, 1),
(5, 'Troca de Bateria', '2025-06-01 16:30:00', 350.00, 
 'Bateria 60Ah Moura', '0000-00-00 00:45:00', 'Troca da bateria do veículo e teste de carga', 
 100000000000001, 2);
 
 CREATE TABLE tipo_servico_produto (
    id_produto_servico INT PRIMARY KEY AUTO_INCREMENT,
    id_tipo_servico INT,
    id_produto INT,
    FOREIGN KEY (id_tipo_servico) REFERENCES tipo_servico(id_tipo_servico),
    FOREIGN KEY (id_produto) REFERENCES produto(codigo_produto)
);
    
    SELECT * FROM fornecedor;
    
    SELECT * FROM estoque;
    
    SELECT * FROM financeiro;
    
    
    
    
	
    
    
        
    
