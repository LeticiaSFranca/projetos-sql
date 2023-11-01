create database hotel_2e1_29;
use hotel_2e1_29;

create table cliente(
cod integer not null primary key auto_increment,
nome varchar (80) not null,
cpf int not null,
tipo_convenio varchar(40) not null
);

create table reserva(
cod integer not null primary key auto_increment,
data_inicio date not null,
data_fim date not null,
quarto int not null,
valor decimal (9,2),
cod_cliente_fk integer not null,
foreign key (cod_cliente_fk) references data_inicio(data_inicio)
);

create table hospede(
cod integer not null primary key auto_increment,
nome varchar (80) not null,
reserva_cod integer not null,
foreign key (reserva_cod) references reserva(reserva_cod),
telefone char(15),
email varchar(60)
);

create table quarto(
cod integer not null primary key auto_increment,
numero int not null,
andar int not null,
classificacao varchar (40) not null,
cod_hospede_fk integer not null,
foreign key (cod_hospede_fk) references hospede(cod_hospede)
);

create table servicos(
cod integer not null primary key auto_increment,
itens varchar (50) not null,
tipo varchar(50) not null,
observacao varchar(100) not null,
quarto_cod_fk integer not null,
foreign key (quarto_cod_fk) references quarto(quarto_cod_fk),
servico_copa_code_fk integer not null,
foreign key (servico_copa_code_fk) references servicos(servico_copa_code_fk)
);