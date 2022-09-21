-- inserção de dados e queries

use ecommerce;

show tables;

desc clients;
desc product;
-- idClients, Fname, Minit, Lname, CPF, Address

-- alter table Clients alter collumn Address varchar(255);

insert into Clients (Fname, Minit, Lname, CPF, Address)
	values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		  ('Ricardo','F','Silva', 45678913, 'rua almeida 289, Centro - Cidade das flores'),		 
		  ('Matheus','O','Pimentel', 987654321, 'avenida alameda vinha 1009, Centro - Cidade das flores'),
          ('julia','S','França', 789123456, 'rua lareijras 861, Centro - Cidade das flores'),
          ('Roberta','G','Assis', 98745631, 'avenida koller 19, Centro - Cidade das flores'),
          ('Isabela','M','Cruz', 657789123, 'rua alameda das flores 28, Centro - Cidade das flores');
          
-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Moveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values	
		('Fone de ouvido', false, 'Eletrônico', '4', null),
		('Barbie Elsa', true, 'Brinquedos', '3', null),
		('Body Carters', true, 'Vestimenta', '5', null),
		('Microfone Vedo - Youtuber', false, 'Eletrônico', '4', null),
		('Sofá retratil', false, 'Moveis', '2', '3x57x80'),
        ('Farinha de arroz', False, 'Alimentos', '2', null),
		('Fire Stick Amazon', False, 'Eletrônico', '3', null);
 
 select * from clients;
 select * from product;
  -- idOrder, IdOrderClient, orderStatus, orderDescription, sendValue, paymentCash
  
  delete from orders where idOrderClient in (1,2,3,4);
  select * from orders;
 insert into orders (IdOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		(1, default, 'compra via aplicativo',null,1),
        (2, default, 'compra via aplicativo',50,00),
        (3,'Confirmado',null, null,1),
        (4, default, 'compra via web site',150,0);
            
-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						  (1,1,2,null),
                          (2,1,1,null),
                          (3,2,1,null);
                          
-- storageLocation,quantity
select * from productStorage;
insert into  productStorage (storageLocation,quantity) values
							('Rio de Janeiro',1000),	
							('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasilia',60);
 
 -- idLproduct, idLstorage, location
 insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');
                            
--  idSupplier, SocialName, CNPJ, contact                            
insert into supplier (SocialName, CNPJ, contact) values
			         ('Almeida e filhos', 123456789123456, '21985474'),
                     ('Eletrônicos Silva', 854519649143457, '21985474'),						
	                 ('Eletrônicos Valma', 934567893934695, '21985474');


select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
-- id Seller, SocialNAme, AbstName, CNPJ, CPF, location, contact

insert into seller (SocialNAme, AbstName, CNPJ, CPF, location, contact) value
					('Tech aletronics', null, 234456789456321, null, 'Rio de Janeiro', 219946287),
                    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
                    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);
                    
-- idPseller, idPproduct, prodQuantity   
insert into productSeller (idPseller, idProduct, prodQuantity ) values
						  (1,6,80),
                          (2,7,10);
select * from productSeller;

-- para contar a quantidade inserida na tabela cliente
select count(*) from Clients;
select * from Clients c, Orders o where c.idClient = idOrderClient;

select Fname,Lname, idOrder, orderStatus from  Clients c, Orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from Clients c, Orders o where c.idClient = idOrderClient;                        
                    
   insert into orders (IdOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		(2, default, 'compra via aplicativo',null,1);                 

select * from clients c, orders o
			where c.idClient = idOrderClient
            group by idOrder;
            
select COUNT(*) from clients c, orders o
			where c.idClient = idOrderClient
            group by idOrder;

select * from clients left outer join orders on idClient = idOrderClient;  


select * from productOrder;       
select * from clients c inner join orders o ON c.idClient = o.idOrderClient
					inner join productOrder p on p.idPOorder= o.idOrder
                    group by idClient;

-- Recuperar quantos pedidos foram realizados pelosclientes?     
select c.idClient, Fname, count(*) as Number_of_ordrs from clients c 
inner join orders o ON c.idClient = o.idOrderClient
group by idClient;


















                    
                    
                    
                    
                    
                    






