CREATE SCHEMA comercial;


create table if not exists comercial.vendas (
    id_venda serial primary key,
    data_venda date not null,
    id_cliente integer not null,
    id_produto integer not null,
    quantidade integer not null check (quantidade > 0),
    valor_unitario numeric(10,2) not null check (valor_unitario >= 0),
    desconto numeric(10,2) default 0 check (desconto >= 0),
    valor_total numeric(12,2) generated always as 
        ((quantidade * valor_unitario) - desconto) stored,
    forma_pagamento varchar(50),
    status_venda varchar(20) default 'Concluída',
    constraint fk_cliente foreign key (id_cliente) references comercial.clientes(id_cliente),
    constraint fk_produto foreign key (id_produto) references comercial.produtos(id_produto)
);


-- Clientes
create table if not exists comercial.clientes (
    id_cliente serial primary key,
    nome varchar(100) not null,
    email varchar(100),
    telefone varchar(20)
);

-- Produtos
create table if not exists comercial.produtos (
    id_produto serial primary key,
    nome_produto varchar(100) not null,
    preco numeric(10,2) not null
);



insert into comercial.clientes (nome, email, telefone) values
('João Silva', 'joao.silva@email.com', '85999998888'),
('Maria Souza', 'maria.souza@email.com', '85988887777'),
('Carlos Lima', 'carlos.lima@email.com', '85977776666'),
('Fernanda Oliveira', 'fernanda.oli@email.com', '85966665555'),
('Paulo Santos', 'paulo.santos@email.com', '85955554444'),
('Ana Costa', 'ana.costa@email.com', '85944443333'),
('Ricardo Mendes', 'ricardo.mendes@email.com', '85933332222'),
('Juliana Rocha', 'juliana.rocha@email.com', '85922221111'),
('Felipe Araújo', 'felipe.araujo@email.com', '85911112222'),
('Beatriz Nunes', 'beatriz.nunes@email.com', '85910101010'),
('Lucas Almeida', 'lucas.almeida@email.com', '85990909090'),
('Camila Martins', 'camila.martins@email.com', '85989898989'),
('Rafael Gomes', 'rafael.gomes@email.com', '85987878787'),
('Aline Ferreira', 'aline.ferreira@email.com', '85986868686'),
('Marcos Pereira', 'marcos.pereira@email.com', '85985858585'),
('Sabrina Melo', 'sabrina.melo@email.com', '85984848484'),
('Diego Carvalho', 'diego.carvalho@email.com', '85983838383'),
('Priscila Monteiro', 'priscila.monteiro@email.com', '85982828282'),
('André Barbosa', 'andre.barbosa@email.com', '85981818181'),
('Larissa Castro', 'larissa.castro@email.com', '85980808080'),
('Rodrigo Teixeira', 'rodrigo.teixeira@email.com', '85979797979'),
('Tatiane Moreira', 'tatiane.moreira@email.com', '85978787878'),
('Bruno Vieira', 'bruno.vieira@email.com', '85977777777'),
('Patrícia Farias', 'patricia.farias@email.com', '85976767676'),
('Gustavo Duarte', 'gustavo.duarte@email.com', '85975757575'),
('Letícia Lima', 'leticia.lima@email.com', '85974747474'),
('Eduardo Campos', 'eduardo.campos@email.com', '85973737373'),
('Vanessa Moura', 'vanessa.moura@email.com', '85972727272'),
('Thiago Rezende', 'thiago.rezende@email.com', '85971717171'),
('Renata Cavalcante', 'renata.cavalcante@email.com', '85970707070');


insert into comercial.produtos (nome_produto, preco) values
('Notebook Lenovo Ideapad', 3500.00),
('Mouse Logitech M280', 120.00),
('Monitor Dell 24"', 1100.00),
('Teclado Mecânico Redragon', 250.00),
('Cadeira Gamer ThunderX3', 950.00),
('Headset HyperX Cloud II', 700.00),
('Impressora HP Deskjet', 600.00),
('Smartphone Samsung Galaxy S22', 4200.00),
('Smartphone iPhone 14', 6500.00),
('Tablet iPad Air', 5200.00),
('HD Externo Seagate 1TB', 400.00),
('SSD Kingston 500GB', 320.00),
('Placa de Vídeo RTX 3060', 2400.00),
('Memória RAM 16GB DDR4', 350.00),
('Fonte Corsair 650W', 520.00),
('Gabinete Gamer NZXT', 680.00),
('Webcam Logitech C920', 450.00),
('Microfone Blue Yeti', 800.00),
('Roteador TP-Link Archer AX50', 600.00),
('Switch 8 Portas TP-Link', 250.00),
('Projetor Epson PowerLite', 3100.00),
('Caixa de Som JBL Charge 5', 850.00),
('Fone Bluetooth Sony WH-1000XM4', 1800.00),
('Kindle Paperwhite', 650.00),
('Relógio Smartwatch Amazfit', 700.00),
('Drone DJI Mini 2', 3200.00),
('Câmera Canon EOS Rebel', 4500.00),
('Console PlayStation 5', 4700.00),
('Console Xbox Series X', 4500.00),
('TV Samsung 55" 4K', 3600.00);



insert into comercial.vendas (
    data_venda, id_cliente, id_produto, quantidade, valor_unitario, desconto, forma_pagamento, status_venda
) values
(current_date, 1, 1, 1, 3500.00, 100.00, 'Cartão de Crédito', 'Concluída'),
(current_date, 2, 2, 2, 120.00, 0.00, 'PIX', 'Concluída'),
(current_date - interval '1 day', 3, 3, 1, 1100.00, 50.00, 'Dinheiro', 'Pendente'),
(current_date - interval '2 day', 4, 4, 1, 250.00, 0.00, 'Cartão de Débito', 'Concluída'),
(current_date, 5, 5, 1, 950.00, 100.00, 'PIX', 'Concluída'),
(current_date - interval '3 day', 6, 6, 2, 700.00, 0.00, 'Boleto', 'Concluída'),
(current_date, 7, 7, 1, 600.00, 20.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '5 day', 8, 8, 1, 4200.00, 200.00, 'PIX', 'Cancelada'),
(current_date - interval '4 day', 9, 9, 1, 6500.00, 300.00, 'Dinheiro', 'Concluída'),
(current_date, 10, 10, 2, 5200.00, 500.00, 'Cartão de Débito', 'Concluída'),
(current_date - interval '7 day', 11, 11, 1, 400.00, 0.00, 'PIX', 'Concluída'),
(current_date - interval '6 day', 12, 12, 2, 320.00, 20.00, 'Dinheiro', 'Concluída'),
(current_date, 13, 13, 1, 2400.00, 100.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '2 day', 14, 14, 2, 350.00, 0.00, 'PIX', 'Concluída'),
(current_date - interval '8 day', 15, 15, 1, 520.00, 10.00, 'Boleto', 'Concluída'),
(current_date, 16, 16, 1, 680.00, 30.00, 'Cartão de Débito', 'Pendente'),
(current_date, 17, 17, 1, 450.00, 0.00, 'PIX', 'Concluída'),
(current_date - interval '9 day', 18, 18, 1, 800.00, 50.00, 'Cartão de Crédito', 'Cancelada'),
(current_date - interval '3 day', 19, 19, 1, 600.00, 0.00, 'PIX', 'Concluída'),
(current_date, 20, 20, 2, 250.00, 10.00, 'Dinheiro', 'Concluída'),
(current_date, 21, 21, 1, 3100.00, 150.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '1 day', 22, 22, 2, 850.00, 50.00, 'PIX', 'Concluída'),
(current_date - interval '10 day', 23, 23, 1, 1800.00, 100.00, 'Cartão de Débito', 'Concluída'),
(current_date, 24, 24, 1, 650.00, 0.00, 'Dinheiro', 'Concluída'),
(current_date, 25, 25, 1, 700.00, 0.00, 'PIX', 'Concluída'),
(current_date - interval '11 day', 26, 26, 1, 3200.00, 200.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '12 day', 27, 27, 1, 4500.00, 300.00, 'PIX', 'Concluída'),
(current_date, 28, 28, 1, 4700.00, 200.00, 'Cartão de Crédito', 'Pendente'),
(current_date - interval '15 day', 29, 29, 1, 4500.00, 100.00, 'Dinheiro', 'Concluída'),
(current_date - interval '14 day', 30, 30, 1, 3600.00, 150.00, 'PIX', 'Concluída'),

-- agora repetindo combinações variadas para gerar mais 30
(current_date - interval '1 day', 5, 2, 3, 120.00, 0.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '2 day', 10, 3, 2, 1100.00, 50.00, 'PIX', 'Concluída'),
(current_date - interval '4 day', 15, 6, 1, 700.00, 0.00, 'Dinheiro', 'Pendente'),
(current_date, 20, 8, 1, 4200.00, 300.00, 'Cartão de Crédito', 'Concluída'),
(current_date, 25, 9, 1, 6500.00, 500.00, 'PIX', 'Concluída'),
(current_date - interval '5 day', 30, 11, 2, 400.00, 0.00, 'Dinheiro', 'Concluída'),
(current_date, 2, 13, 1, 2400.00, 100.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '3 day', 7, 14, 3, 350.00, 0.00, 'PIX', 'Concluída'),
(current_date, 12, 16, 1, 680.00, 20.00, 'Cartão de Débito', 'Concluída'),
(current_date - interval '6 day', 17, 18, 1, 800.00, 50.00, 'PIX', 'Cancelada'),
(current_date, 22, 20, 2, 250.00, 20.00, 'Cartão de Crédito', 'Concluída'),
(current_date, 27, 22, 1, 850.00, 0.00, 'PIX', 'Concluída'),
(current_date - interval '7 day', 3, 24, 2, 650.00, 0.00, 'Dinheiro', 'Concluída'),
(current_date, 8, 26, 1, 3200.00, 100.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '8 day', 13, 28, 1, 4700.00, 0.00, 'PIX', 'Concluída'),
(current_date, 18, 30, 1, 3600.00, 150.00, 'Dinheiro', 'Concluída'),
(current_date, 23, 5, 1, 950.00, 50.00, 'Cartão de Débito', 'Concluída'),
(current_date - interval '2 day', 28, 7, 1, 600.00, 20.00, 'PIX', 'Concluída'),
(current_date, 4, 10, 1, 5200.00, 200.00, 'Dinheiro', 'Concluída'),
(current_date - interval '9 day', 9, 15, 1, 520.00, 0.00, 'Cartão de Crédito', 'Pendente'),
(current_date, 14, 19, 2, 600.00, 0.00, 'PIX', 'Concluída'),
(current_date - interval '3 day', 19, 21, 1, 3100.00, 150.00, 'Dinheiro', 'Concluída'),
(current_date, 24, 23, 1, 1800.00, 100.00, 'Cartão de Crédito', 'Concluída'),
(current_date - interval '10 day', 29, 25, 1, 700.00, 0.00, 'PIX', 'Concluída'),
(current_date, 1, 27, 1, 4500.00, 200.00, 'Cartão de Crédito', 'Concluída'),
(current_date, 6, 29, 1, 4500.00, 300.00, 'Dinheiro', 'Concluída'),
(current_date - interval '12 day', 11, 30, 1, 3600.00, 150.00, 'PIX', 'Concluída'),
(current_date, 16, 1, 1, 3500.00, 0.00, 'PIX', 'Concluída'),
(current_date, 21, 2, 2, 120.00, 10.00, 'Cartão de Débito', 'Concluída');



