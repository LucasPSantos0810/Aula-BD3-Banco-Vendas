use master
go

drop database aulaBD;
go

create database aulaBD;
go

use aulaBD;
go

create table cad_cli (
	id						int identity(1,1),
	nome					nvarchar(100) not null,
	sobrenome				nvarchar(100) not null,
	cpf						int unique not null,
	idade					int	not null,
	
	primary key (id)
);

create table cad_prod (
	id						int identity(1,1),
	nome					nvarchar(100) not null,
	preco					money not null,
	marca					nvarchar(50) not null,
	
	primary key (id)
);

create table venda (
	id						int identity(1,1),
	data					date not null,
	id_cli					int not null,
	id_prod					int not null,
	quantidade				int not null,
	valor					money not null,
	
	primary key (id),
	constraint FK_cad_prod_venda
	foreign key (id_prod) references cad_prod (id),
	constraint FK_cad_cli_venda
	foreign key (id_cli) references cad_cli (id)
);

create table nota_venda (
	id						int identity(1,1),
	id_cli					int not null,
	quantidade_vendas		int not null,
	valor_final				money not null,
	
	primary key (id),
	constraint FK_cad_cli_nota_venda 
	foreign key (id_cli) references venda (id)
);

go 

insert into cad_cli (nome,sobrenome,cpf,idade)
values ('Carlos','Souza',123456781,32),
	   ('Fernando','Jesus',123456782,37),
	   ('Gisele','Antunes',123456783,21),
	   ('Lucas','Santos',123456784,18),
	   ('Tania','Souza',123456785,54);
	   

insert into cad_prod (nome,preco,marca)
values ('Tenis',39.90,'Nike'),
	   ('Camiseta',29.90,'Fatal Surf'),
	   ('Calça',69.90,'Auge');
	   
insert into venda (data,id_cli,id_prod,quantidade,valor)
values ('2020-03-03',4,1,2,79.80),
       ('2020-03-03',1,3,1,69.90),
       ('2020-03-03',5,2,1,29.90),
       ('2020-03-03',4,2,2,59.80),
       ('2020-03-03',3,3,2,139.80);
       
insert into nota_venda (id_cli,quantidade_vendas,valor_final)
values (1,1,69.90),
       (3,1,139.80),
       (4,2,139.60),
       (5,1,29.90);

select * from cad_cli;
select * from cad_prod;
select * from venda;
select * from nota_venda;