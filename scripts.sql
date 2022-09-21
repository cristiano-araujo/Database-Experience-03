-- criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
-- drop table client;

show tables;

create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(255),
        constraint unique_cpf_client unique (CPF)
);
    
    alter table clients auto_increment=1;
    
    
    desc clients;
    
-- criar tabela produto
-- size = dimensão do produto
create table product( 
		idProduct int auto_increment primary key,
        Pname varchar(50) not null,
        classification_kids boolean default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'),
        avaliação float default 0,
        size varchar(10)
);

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessarias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraint relacionadas ao pagamento

-- create table payments(
--		idClient int,
 --       idPayment int,
	--	typePayment Enum('Boleto','Cartão','Dois cartôes'),
  --      limitAvailable float,
--        primary key(idClient, idPayment)
-- );


-- criar tabela pedido
create table orders(
		idOrder int auto_increment primary key,
        idOrderClient int,
		orderStatus enum('Cancelado', 'Confirmado','Em processamento') default 'Em processamento',
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false,
        constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
        on update cascade
);
desc orders;

-- criar tabela estoque

create table productStorage (
		idProdStorage int auto_increment primary key,
        storageLocation varchar(255),
        quantity int default 0
);
-- drop table prdutcstorage;
desc productStorage;

-- criar tabela fornecedor
create table supplier (
		idSupplier int auto_increment primary key,
        SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
);

desc supplier;

-- criar tabela vendedor
create table seller (
		idSeller int auto_increment primary key,
        SocialName varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(11),
        location varchar(255),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
);

-- criar tabela produto vendedor
create table productSeller (
		idPseller int,
        idProduct int,
        prodQuantity int default 1,
        primary key (idPseller, idProduct),
        constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
        constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

desc productSeller; 

-- criar tabela produto pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel', 'Sem estoque') default 'Disponivel',
    primary key (idPOproduct, idPOorder),
    constraint fk_productOrder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrder)
);

desc productOrder;

create table storageLocation(
		idLproduct int,
        idLstorage int,
        location varchar(255) not null,
        primary key(idLproduct, idLstorage),
        constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
        constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);
desc storageLocation;
show tables;
-- drop table prductstorage;

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

desc productSupplier;

show tables;

show databases;
use information_schema;
show tables;
desc table_constraints;
desc referential_constraints;

select * from referential_constraints where constraint_schema = 'ecommerce';













