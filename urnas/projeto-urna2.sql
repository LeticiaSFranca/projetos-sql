create database banco_urna;
use banco_urna;

create table partido(
id int auto_increment not null primary key,
nome varchar(80) not null,
sigla varchar(15) not null
);

create table candidato(
id int auto_increment not null primary key,
nome varchar(80) not null,
endereco varchar(120) not null,
partido_id_fk int not null,
foreign key (partido_id_fk) references partido(id),
cargo_id_fk int not null,
foreign key (cargo_id_fk) references cargo(id)
);

create table cargo(
id int auto_increment not null primary key,
nome varchar(80) not null,
descricao varchar(120) not null
);

create table eleitor(
id int not null auto_increment primary key,
nome varchar(80) not null,
endereco varchar(120) not null,
secoes_id_fk int not null,
foreign key (secoes_id_fk) references secoes(id)
);

create table voto(
id int not null auto_increment primary key,
data_data date not null,
quantidade int not null,
eleitor_id_fk int not null,
foreign key (eleitor_id_fk) references eleitor(id),
cargo_id_fk int not null,
foreign key (cargo_id_fk) references cargo(id)
);

select * from partido; 
select nome from partido;
insert into partido(nome, sigla) values
("Aline Aguiar", "AA");

select * from candidato;
select nome from candidato; 
insert into candidato(nome, endereco, partido_id_fk, cargo_id_fk) values
("Aline Aguiar", "Rua Alfaville", 1, 1);

select * from cargo;
select nome from cargo; 
insert into cargo(nome, descricao) values
("Aline Aguiar", "Nenhuma Descrição");

select * from eleitor;
select nome from eleitor; 
insert into eleitor(nome, endereco, secoes_id_fk) values
("Almirante Breckler", "Rua Abacaxi", 1);

select * from voto;
select data_data from voto; 
insert into voto(data_data, quantidade, eleitor_id_fk, cargo_id_fk) values
(2022/02/02, 15, 2, 2);

delete from candidato where nome = "Aline Aguiar";
delete from cargo where nome = '2023/03/17';
delete from eleitor where nome = "Almirante Breckler";
delete from partido where nome = "Aline Aguiar";
delete from voto where data_data = 2022/02/02;