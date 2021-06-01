#Criando o banco de dados Biblioteca
create database Biblioteca
default character set utf8
default collate utf8_general_ci;

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
	genero_lv enum('Ação', 'Ficção', 'Terror', 'Comédia', 'Literatura Estrangeira', 'Romance', 'Revista', 'Ficção', 
		'Suspense', 'Literatura Nacional', 'Coaching', 'Fatasia', 'Aventura', 'Mistério', 'Religioso', 'Acadêmico', 'Fábula'),
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
	('111.111.111-11', '2001-02-21', 'M', 'João', '(11)11111-1111', 'Rua Alameda Slim', '11.111.111', 'apto', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('222.222.222-22', '1968-07-13', 'F', 'Maria', '(22)22222-2222', 'Rua Inventei Hoje', '22.222.222', 'casa', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('333.333.333-33', '1976-03-19', 'M', 'Adalberto', '(33)33333-3333', 'Rua Alameda Slim', '33.333.333', 'apto', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('444.444.444-44', '1982-12-01', 'M', 'Tiago', '(44)44444-4444', 'Rua Alameda Slim', '44.444.444', 'casa', 'Tiroleio', 'Cidade Fantasma', '1998-02-21'),
	('555.555.555-55', '1992-05-30', 'F', 'Carla', '(55)55555-5555', 'Rua Alameda Slim', '55.555.555', 'casa', 'Tiroleio', 'Cidade Fantasma', '1998-02-21');

insert into CLIENTE
	(cpf_cl, data_nasc_cl, sexo_cl, nome_cl, contato_cl, rua_end_cl, cep_end_cl, numero_end_cl, complemento_end_cl, bairro_end_cl, cidade_end_cl)
	values
	('666.666.666-66', '2002-08-22', 'M', 'Dagoberto', '(66)66666-6666', 'Rua Alameda Slim', '66.666.666', 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('777.777.777-77', '1995-11-10', 'M', 'Paulo', '(77)77777-7777', 'Rua Maria Betania', '77.777.777', 'apto', 'Mpbairro', 'Cidade caetânea'),
	('888.888.888-88', '1980-10-30', 'F', 'Josefina', '(88)88888-8888', 'Rua Alameda Slim', '88.888.888', 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('999.999.999-99', '2000-12-28', 'M', 'João', '(99)99999-9999', 'Rua Slim Shady', '99.999.999', 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('123.123.123-12', '2004-05-31', 'M', 'Carlos', '(12)12121-1212', 'Rua Alameda Slim', '12.121.121', 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('456.456.456-45', '1998-02-03', 'F', 'Tiana', '(34)34343-3434', 'Rua Alameda Slim', '34.343.343', 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('000.000.000-00', '1992-03-07', 'F', 'Kerline', '(56)56565-5656', 'Rua Alameda Slim', '56.565.565', 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('012.012.012-01', '1963-05-15', 'F', 'Karol', '(78)78787-7878', 'Rua Alameda Slim', '56.565.565', 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('345.345.345-34', '1970-04-25', 'M', 'Gilberto', '(90)90909-9090', 'Rua Alameda Slim', '78.787.787', 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('678.678.678-67', '1982-09-27', 'M', 'Daniel', '(01)01010-0101', 'Rua Alameda Slim', '90.909.909', 'casa', 'Tiroleio', 'Cidade Fantasma');

insert into LIVRO
	(titulo_lv, autor_lv, edicao_lv, genero_lv, cpf_f)
	values
	('O pequeno príncipe', 'Antoine de Saint-Exupéry', 10, 'Fábula', '111.111.111-11'),
	('Trevas trevosas', 'Trevoso', 1, 'Terror', '333.333.333-33'),
	('Percy Jackson', 'Rick Riordan', 6, 'Aventura', '111.111.111-11'),
	('Ace Ventura', 'Jim Carry', 3, 'Comédia', '444.444.444-44'),
	('Mortal Kombat: melhor que o filme', 'Algum autor decente', 1, 'Ação', '222.222.222-22'),
	('A morte dos amigues', 'Sidneiro ah biteiro', 2, 'Suspense', '333.333.333-33'),
	('The big foot', 'American Stranger', 9, 'Literatura Estrangeira', '111.111.111-11'),
	('Uma paixão inesperada', 'Ela e o namorado dela', 3, 'Romance', '222.222.222-22'),
	('Caras', 'Globo', 1, 'Revista', '444.444.444-44'),
	('Alien', 'Forasteiro Fantoura', 5, 'Ficção', '111.111.111-11'),
	('Memórias póstumas de Brás Cubas', 'Machado de Assis', 12, 'Literatura Nacional', '222.222.222-22'),
	('Não seja um líder heroi', 'Conquer', 1, 'Coaching', '444.444.444-44'),
	('Coraline', 'neil gaiman', 7, 'Fatasia', '111.111.111-11'),
	('Scooby-doo', 'WhereAreYou', 9, 'Mistério', '333.333.333-33'),
	('Bíblia', 'Vários autores', 90, 'Religioso', '444.444.444-44'),
	('Algoritmos Teoria e prática', 'Cormen', 14, 'Acadêmico', '111.111.111-11'),
	('Game of Thrones', 'George RR Martin', 2, 'Fantasia', '333.333.333-33'),
	('Sistema de Bancos de dados', 'Elmasri & Navathe', 1, 'Acadêmico', '111.111.111-11'),
	('João e o Pé de feijão', 'autor desconhecido', 4, 'Fábula', '333.333.333-33'),
	('Torá', 'Moisés', 50, 'Religioso', '444.444.444-44'),
	('Branca de Neve e os sete anões', 'Autor desconhecido', 5, 'Literatura Estrangeira', '222.222.222-22');


/*Exemplares:
O pequeno príncipe: 6
Trevas trevosas: 4
Percy Jackson: 8
Ace Ventura: 1
Mortal Kombat: melhor que o filme: 2
A morte dos amigues: 3
The big foot: 10
Uma paixão inesperada: 9
Caras: 24
Alien: 5
Memórias póstumas de Brás Cubas: 3
Não seja um líder heroi: 4
Coraline: 30
ScoobyDoo: 5
Bíblia: 44
Algoritmos Teoria e prática: 4
Game of Thrones: 15
Sistema de Bancos de dados: 3
João e o Pé de feijão: 22
Torá: 1
Branca de Neve e os sete anões: 27

*/
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
	(default, 'ScoobyDoo'), (default, 'ScoobyDoo'),  (default, 'ScoobyDoo'), (default, 'ScoobyDoo'), (default, 'ScoobyDoo'), 
	(default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), (default, 'Bíblia'), 
	(default, 'Algoritmos Teoria e prática'), (default, 'Algoritmos Teoria e prática'), (default, 'Algoritmos Teoria e prática'), (default, 'Algoritmos Teoria e prática'), 
	(default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), (default, 'Game of Thrones'), 
	(default, 'Sistema de Bancos de dados'), (default, 'Sistema de Bancos de dados'), (default, 'Sistema de Bancos de dados'), 
	(default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), (default, 'João e o Pé de feijão'), 
	(default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'), (default, 'Branca de Neve e os sete anões'),
	(default, 'Torá');

insert into EMPRESTIMO
	(data_emprestimo, data_devolucao, cpf_cl, id_exemplar)
	values
	('--', '--', '', ''),
	;
	
#1- Listar os livros que o título começa com a letra "a" e terminam com "s".
	select * from LIVRO 
	where titulo_lv like 'a%s';
#2- Listar os Clientes que o último nome termina com o caractere "s".
	select * from CLIENTE 
	where nome_cl like '%s';
#3- Listar o titulo, e a edição de todos os livros em ordem crescente quanto aos nomes.
	select titulo_lv, edicao_lv  from LIVRO
	order by asc titulo_lv;
#4- Listar clientes do sexo masculino, agrupados por cidade e em ordem crescente quanto ao nome.
	select * from CLIENTE
	where sexo_cl = 'M'
	group by cidade_end_cl
	order by asc nome_cl;
#5- Listar os funcionarios que tem mais de 30 anos
	select * from FUNCIONARIO
	where (SELECT DATEDIFF(year, data_nasc_f, '2021-06-10')) > 30;
#6- Listar todos os clientes que possuem idade igual ou maior que 18 anos
	select * from CLIENTE
	where (SELECT DATEDIFF(year, data_nasc_cl, '2021-06-10')) >= 18;
#7- Listar os clientes que não possuem nenhum livro emprestado, ordenados asc pelo nome
	select * from CLIENTE 
	where cpf_cl not in (SELECT nome_cl from EMPRESTIMO)
	order by asc nome_cl;
#8- Listar todos os funcionários que cadastraram pelo menos um livro do gênero Ação ou Comédia
	select * from FUNCIONARIO
	where 
#9- Listar todos os livros que estão como 1° edição
	select * from LIVRO
	where edicao_lv = 1;
#10- Listar os exemplares que nunca foram emprestados
	select * from EXEMPLAR
	where id_exemplar not in (SELECT id_exemplar from EMPRESTIMO);


#CONSULTAS E RELATÓRIOS

/*ANDRÉ
1.
2.
3.
4. 
5. 

WEI
1- Listar os livros que o título começa com a letra "a" e terminam com "s".
2- Listar os Clientes que o último nome termina com o caractere "s".
3- Listar o nome, e a edição de todos os livros em ordem crescente quanto aos nomes.
4- Listar clientes do sexo masculino, agrupados por cidade e em ordem crescente quanto ao nome.
5- Listar os funcionarios que tem mais de 30 anos

TIAGO
1 - Listar todos os clientes que possuem idade igual ou maior que 18 anos
2 - Listar os clientes que não possuem nenhum livro emprestado, ordenados asc pelo nome
3 - Listar todos os funcionários que cadastraram um livro do gênero Ação ou Comédia
4 - Listar todos os livros que estão como 1° edição
5 - Listar os exemplares que nunca foram emprestados

JOÃO 
1. Listar os livros que são de edições mais antigas que 7.
2. Listar os funcionários que cadastraram mais que 4 livros e a quantidade de livros que eles cadastraram.
3. Listar os clientes que passaram mais de 10 dias com exemplares emprestados.
4. Listar os títulos e a quantidade de exemplares dos livros que possuem como autor: "Autor desconhecido" ou "Vários autores".
5. Listar todos os livros em ordem alfabética e a quantidade de exemplares que eles possuem.

DANIEL
1. Listar o cliente que mais pegou emprétimos dos livros de romance.
2. Consultar a média das idade das pessoas que pediram emprestados livros acadêmicos.
3. 
4.
5.

DIEGO.
1. Dizer a quantidade de livros que cada gênero possui.
2. Liste todos os livros que foram emprestados no mes de setembro de 2001 em ordem alfabética pelo seu título.
3. Consultar os 5 exemplares mais emprestados da biblioteca.
4. 
5. 
*/

