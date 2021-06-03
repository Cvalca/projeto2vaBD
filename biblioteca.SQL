#Criando o banco de dados Biblioteca
create database Biblioteca
default character set utf8
default collate utf8_general_ci;

 drop database biblioteca;
 
use Biblioteca;

create table CLIENTE (
	cpf_cl varchar(14),
	data_nasc_cl date,
	sexo_cl enum('M', 'F'),
	nome_cl varchar(30),
	contato_cl varchar(15),
	rua_end_cl varchar(30),
	cep_end_cl varchar(10),
	numero_end_cl int,
	complemento_end_cl varchar(60),
	bairro_end_cl varchar(40),
	cidade_end_cl varchar(40),

	primary key(cpf_cl)
)DEFAULT CHARSET = utf8; 

create table FUNCIONARIO (
	cpf_f varchar(14),
	data_nasc_f date,
	sexo_f enum('M', 'F'),
	nome_f varchar(30),
	contato_f varchar(15),
	rua_end_f varchar(30),
	cep_end_f varchar(10),
	numero_end_f int,
	complemento_end_f varchar(60),
	bairro_end_f varchar(40),
	cidade_end_f varchar(40),
	data_contratacao_f date,

	primary key(cpf_f)
)DEFAULT CHARSET = utf8; 

create table LIVRO (
	titulo_lv varchar(60),
	autor_lv varchar(60),
	edicao_lv int,
	genero_lv enum('Ação', 'Ficção', 'Terror', 'Comédia', 'Literatura Estrangeira', 'Romance', 'Revista', 
		'Suspense', 'Literatura Nacional', 'Coaching', 'Fantasia', 'Aventura', 'Mistério', 'Religioso', 'Acadêmico', 'Fábula'),
	cpf_f varchar(14),

	primary key (titulo_lv),
	foreign key (cpf_f) references FUNCIONARIO (cpf_f)

)DEFAULT CHARSET = utf8; 

create table EXEMPLAR(
	id_exemplar int not null auto_increment,
	titulo_lv varchar(60),

	primary key (id_exemplar),
	foreign key (titulo_lv) references LIVRO (titulo_lv)

)DEFAULT CHARSET = utf8; 


create table EMPRESTIMO (
	data_emprestimo date,
	data_devolucao date,
	cpf_cl varchar(14),
	id_exemplar int,

	primary key (data_emprestimo, cpf_cl, id_exemplar),
	foreign key (cpf_cl) references CLIENTE (cpf_cl),
	foreign key (id_exemplar) references EXEMPLAR (id_exemplar)
)DEFAULT CHARSET = utf8; 


#PREENCHENDO A TABELA
insert into FUNCIONARIO 
	(cpf_f, data_nasc_f, sexo_f, nome_f, contato_f, rua_end_f, cep_end_f, numero_end_f, complemento_end_f, bairro_end_f, cidade_end_f, data_contratacao_f) 
	values 
	('111.111.111-11', '2001-02-21', 'M', 'João', '(11)11111-1111', 'Rua Alameda Slim', '11.111.111', 3, 'apto', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('222.222.222-22', '1968-07-13', 'F', 'Maria', '(22)22222-2222', 'Rua Inventei Hoje', '22.222.222', 487, 'casa', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('333.333.333-33', '1976-03-19', 'M', 'Adalberto', '(33)33333-3333', 'Rua Alameda Slim', '33.333.333', 123, 'apto', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('444.444.444-44', '1982-12-01', 'M', 'Tiago', '(44)44444-4444', 'Rua Alameda Slim', '44.444.444', 390, 'casa', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('555.555.555-55', '1992-05-30', 'F', 'Carla', '(55)55555-5555', 'Rua Alameda Slim', '55.555.555', 1095, 'casa', 'Tiroleio', 'Cidade Fantasma', '1998-02-21');

insert into CLIENTE
	(cpf_cl, data_nasc_cl, sexo_cl, nome_cl, contato_cl, rua_end_cl, cep_end_cl, numero_end_cl, complemento_end_cl, bairro_end_cl, cidade_end_cl)
	values
	('666.666.666-66', '2002-08-22', 'M', 'Dagoberto', '(66)66666-6666', 'Rua Alameda Slim', '66.666.666', 338, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('777.777.777-77', '1995-11-10', 'M', 'Paulo', '(77)77777-7777', 'Rua Maria Betania', '77.777.777', 981, 'apto', 'Mpbairro', 'Cidade caetânea'),
	('888.888.888-88', '1980-10-30', 'F', 'Josefina', '(88)88888-8888', 'Rua Alameda Slim', '88.888.888', 155, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('999.999.999-99', '2000-12-28', 'M', 'João', '(99)99999-9999', 'Rua Slim Shady', '99.999.999', 78, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('123.123.123-12', '2004-05-31', 'M', 'Carlos', '(12)12121-1212', 'Rua Alameda Slim', '12.121.121', 98, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('456.456.456-45', '1998-02-03', 'F', 'Tiana', '(34)34343-3434', 'Rua Alameda Slim', '34.343.343', 53, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('000.000.000-00', '1992-03-07', 'F', 'Kerline', '(56)56565-5656', 'Rua Alameda Slim', '56.565.565', 007, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('012.012.012-01', '1963-05-15', 'F', 'Karol', '(78)78787-7878', 'Rua Alameda Slim', '56.565.565', 13, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('345.345.345-34', '1970-04-25', 'M', 'Gilberto', '(90)90909-9090', 'Rua Alameda Slim', '78.787.787', 17, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('678.678.678-67', '1982-09-27', 'M', 'Daniel', '(01)01010-0101', 'Rua Alameda Slim', '90.909.909', 190, 'casa', 'Tiroleio', 'Cidade Fantasma');

insert into LIVRO
	(titulo_lv, autor_lv, edicao_lv, genero_lv, cpf_f)
	values
	('O pequeno príncipe', 'Antoine de Saint-Exupéry', 10, 'Fábula', '111.111.111-11'),
	('Trevas trevosas', 'Trevoso', 1, 'Terror', '333.333.333-33'),
	('Percy Jackson', 'Rick Riordan', 6, 'Aventura', '111.111.111-11'),
	('Ace Ventura', 'Jim Carry', 3, 'Comédia', '444.444.444-44'),
	('Mortal Kombat: melhor que o filme', 'Algum autor decente', 1, 'Ação', '222.222.222-22'),
	('A morte dos amigues', 'Sidneiro ah biteiro', 24, 'Suspense', '333.333.333-33'),
	('The big foot', 'American Stranger', 9, 'Literatura Estrangeira', '111.111.111-11'),
	('Uma paixão inesperada', 'Ela e o namorado dela', 3, 'Romance', '222.222.222-22'),
	('Caras', 'Globo', 1, 'Revista', '444.444.444-44'),
	('Alien', 'Forasteiro Fantoura', 5, 'Ficção', '111.111.111-11'),
	('Memórias póstumas de Brás Cubas', 'Machado de Assis', 12, 'Literatura Nacional', '222.222.222-22'),
	('Não seja um líder heroi', 'Conquer', 1, 'Coaching', '444.444.444-44'),
	('Coraline', 'Neil Gaiman', 7, 'Fantasia', '111.111.111-11'),
	('Scooby-doo', 'WhereAreYou', 9, 'Mistério', '333.333.333-33'),
	('Bíblia', 'Vários autores', 90, 'Religioso', '444.444.444-44'),
	('Algoritmos Teoria e prática', 'Cormen', 14, 'Acadêmico', '111.111.111-11'),
	('Game of Thrones', 'George RR Martin', 2, 'Fantasia', '333.333.333-33'),
	('Sistema de Bancos de dados', 'Elmasri & Navathe', 1, 'Acadêmico', '111.111.111-11'),
	('João e o Pé de feijão', 'Autor desconhecido', 4, 'Fábula', '333.333.333-33'),
	('Torá', 'Moisés', 50, 'Religioso', '444.444.444-44'),
	('Branca de Neve e os sete anões', 'Autor desconhecido', 5, 'Literatura Estrangeira', '222.222.222-22');


/*Exemplares: tot = 232
O pequeno príncipe: 7 INTERVALO: 1-7
Trevas trevosas: 4 INTERVALO: 8-11
Percy Jackson: 8 INTERVALO: 12-19
Ace Ventura: 1 INTERVALO: 20
Mortal Kombat: melhor que o filme: 2 INTERVALO: 21-22
A morte dos amigues: 3 INTERVALO: 23-25
The big foot: 10 INTERVALO: 26-35
Uma paixão inesperada: 9 INTERVALO: 36-44
Caras: 24 INTERVALO: 45-68
Alien: 5 INTERVALO: 69-73
Memórias póstumas de Brás Cubas: 3 INTERVALO: 74-76
Não seja um líder heroi: 4 INTERVALO: 77-80
Coraline: 31 INTERVALO: 81-111
ScoobyDoo: 5 INTERVALO: 112-116
Bíblia: 44 INTERVALO: 117-160
Algoritmos Teoria e prática: 4 INTERVALO: 161-164
Game of Thrones: 15 INTERVALO: 165-179
Sistema de Bancos de dados: 3 INTERVALO: 180-182
João e o Pé de feijão: 22 INTERVALO: 183-204
Torá: 1 INTERVALO: 205
Branca de Neve e os sete anões: 27 INTERVALO:  206-232

*/
insert into EXEMPLAR (titulo_lv) values ('O pequeno príncipe');

insert into EXEMPLAR
	(id_exemplar, titulo_lv)
	values
	(default, 'O pequeno príncipe'),
	(default, 'O pequeno príncipe'),
	(default, 'O pequeno príncipe'),
	(default, 'O pequeno príncipe'),
	(default, 'O pequeno príncipe'),
	(default, 'O pequeno príncipe'),
	(default, 'Trevas trevosas'),
	(default, 'Trevas trevosas'),
	(default, 'Trevas trevosas'),
	(default, 'Trevas trevosas'),
	(default, 'Percy Jackson'),
	(default, 'Percy Jackson'),
	(default, 'Percy Jackson'),
	(default, 'Percy Jackson'),
	(default, 'Percy Jackson'),
	(default, 'Percy Jackson'),
	(default, 'Percy Jackson'),
	(default, 'Percy Jackson'),
	(default, 'Ace Ventura'),
	(default, 'Mortal Kombat: melhor que o filme'),
	(default, 'Mortal Kombat: melhor que o filme'),
	(default, 'A morte dos amigues'),
	(default, 'A morte dos amigues'),
	(default, 'A morte dos amigues'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'The big foot'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Uma paixão inesperada'),
	(default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'), (default, 'Caras'),
	(default, 'Alien'), (default, 'Alien'), (default, 'Alien'), (default, 'Alien'), (default, 'Alien'), 
	(default, 'Memórias póstumas de Brás Cubas'), (default, 'Memórias póstumas de Brás Cubas'),  (default, 'Memórias póstumas de Brás Cubas'), 
	(default, 'Não seja um líder heroi'), (default, 'Não seja um líder heroi'), (default, 'Não seja um líder heroi'), (default, 'Não seja um líder heroi'), 
	(default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), (default, 'Coraline'), 
	(default, 'Scooby-doo'), (default, 'Scooby-doo'),  (default, 'Scooby-doo'), (default, 'Scooby-doo'), (default, 'Scooby-doo'), 
	(default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), 
	(default, 'Algoritmos Teoria e prática'), (default, 'Algoritmos Teoria e prática'), (default, 'Algoritmos Teoria e prática'), (default, 'Algoritmos Teoria e prática'), 
	(default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), 
	(default, 'Sistema de Bancos de dados'), (default, 'Sistema de Bancos de dados'), (default, 'Sistema de Bancos de dados'), 
	(default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), 
	(default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'),
	(default, 'Torá');

#Cadastrar emprestimo: Organizar por data para não se perder, e para não dar um exemplar ja emprestado para outro cliente
insert into EMPRESTIMO
	(data_emprestimo, data_devolucao, cpf_cl, id_exemplar)
	values 
	('--', '--', '666.666.666-66', '2'),
	;
	
#1. Listar todos os funcionários em ordem ascendente por nome.
	select * from FUNCIONARIO order by nome_f asc;

#2. Listar todos os livros em ordem ascendente por título.
	select * from LIVRO order by titulo_lv asc;

#3. Listar todos os exemplares em ordem ascendente por id.
	select * from EXEMPLAR order by id_exemplar asc;

#4. Listar todos os empréstimos.
	select * from EMPRESTIMO;

#5. Listar todos os clientes em ordem ascendente por nome.
	select * from CLIENTE order by nome_cl asc;

#6. Listar os clientes que passaram mais de 15 dias com exemplares emprestados, 
#pois a biblioteca aplica multa para os que passam de 15 dias.
	select * from CLIENTE where (SELECT DATEDIFF(data_emprestimo, data_devolucao) from EMPRESTIMO) > 15;

#7. Dizer a quantidade de livros que cada gênero possui.
	select genero_lv, count(*) from LIVRO group by genero_lv;

#8. Listar os livros ordenados ascendentemente por gênero e ascendentemente por titulo.
 	select * from LIVRO order by genero_lv asc, titulo_lv asc;

#9. Liste todos os exemplares que foram emprestados num ano em ordem alfabética pelo seu título.
	select 

#10. Consultar os 5 exemplares mais emprestados na biblioteca (saber quais exemplares estão mais gastos).
	
#11. Consultar a média das idades das pessoas que pediram emprestados livros acadêmicos.
	select AVG((SELECT DATEDIFF(year, data_nasc_cl, sysdate()) from CLIENTE)) from CLIENTE as C join EMPRESTIMO as E on C.cpf_cl = E.cpf_cl
	where 

#12. Listar os livros ordenados ascendentemente pelos autores e ascendentemente pelo título.
	select * from LIVRO order by autor_lv asc, titulo_lv asc;

#13. Listar todos os livros em ordem alfabética (ascendente pelo título) e a quantidade de exemplares que eles possuem.
 	select titulo_lv, count(*) from EXEMPLAR group by titulo_lv; 

#14. Dizer a quantidade de livros em ordem decrescente agrupados por autor.
	select count(*) from LIVRO group by autor_lv order by count(*) desc;

#15. Listar a quantidade de exemplares emprestados agrupados por ano e ordenados ascendentemente por ano.
	select from LIVRO as L join EXEMPLAR as E on L.titulo_lv = E.titulo_lv
	group by

#16. Listar a quantidade de livros cadastrados por cada funcionário.
	select F.cpf_f, F.nome_f, count(*) from FUNCIONARIO as F join LIVRO as L on F.cpf_f = L.cpf_f
	where

#17. Listar todos os livros que estão como 1° edição.
	select * from LIVRO where edicao_lv = 1;

#18. Listar os exemplares que nunca foram emprestados.
	select * from EXEMPLAR where id_exemplar not in (select id_exemplar from EMPRESTIMO);

#19. Consultar o gênero que possui mais exemplares emprestados.
	select 

#20. Consultar os 5 livros que tiveram a maior quantidade de exemplares emprestados (ver os livros mais populares).
	
	
#21. Consultar os 5 livros que tiveram a menor quantidade de exemplares emprestados (ver os livros menos populares).
	

#22. Listar os nomes e os CPFs dos clientes que pegaram mais exemplares emprestados.
	

 #Listar os clientes que não possuem nenhum livro emprestado, ordenados asc pelo nome
	select * from CLIENTE 
	where cpf_cl not in (SELECT nome_cl from EMPRESTIMO)
	order by nome_cl asc;


#9- Listar todos os livros que estão como 1° edição
	select * from LIVRO
	where edicao_lv = 1;

#10- Listar os exemplares que nunca foram emprestados
	select * from EXEMPLAR
	where id_exemplar not in (SELECT id_exemplar from EMPRESTIMO);



#15- Listar todos os livros em ordem alfabética e a quantidade de exemplares que eles possuem.
	select titulo_lv, count(*) from EXEMPLAR
	group by titulo_lv
	order by asc titulo_lv;


#21- Dizer a quantidade de livros que cada gênero possui.
	select genero_lv, count(*) from LIVRO
	group by genero_lv;

