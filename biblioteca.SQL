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
	('012.012.012-01', '1963-05-15', 'F', 'Karol', '(78)78787-7878', 'Rua Alameda Slim', '45.454.454', 13, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('345.345.345-34', '1970-04-25', 'M', 'Gilberto', '(90)90909-9090', 'Rua Alameda Slim', '78.787.787', 17, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('678.678.678-67', '1996-02-22', 'M', 'Daniel', '(01)01010-0101', 'Rua Alameda Slim', '90.909.909', 190, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('901.901.901-90', '1975-09-27', 'F', 'Jandiraí', '(23)2323-2323', 'Rua Alameda Slim', '01.010.010', 46, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('234.234.234-23', '2000-04-22', 'M', 'Dimitri', '(09)09090-0909', 'Rua Alameda Slim', '23.232.232', 23, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('567.567.567-56', '1980-09-12', 'M', 'Josué', '(45)45454-4545', 'Rua Alameda Slim', '67.676.676', 97, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('890.890.890-89', '1999-01-30', 'M', 'Josuke', '(98)98989-9898', 'Rua Alameda Slim', '89.898.898', 1490, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('098.098.098-09', '1973-02-25', 'M', 'José Macarotti', '(67)67676-6767', 'Rua Alameda Slim', '09.090.090', 908, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('876.876.876-87', '2002-10-02', 'M', 'GG', '(87)87878-8787', 'Rua Alameda Slim', '98.989.989', 15, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('765.765.765-76', '2003-01-06', 'F', 'Camila', '(89)01010-0101', 'Rua Alameda Slim', '87.878.878', 743, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('654.654.654-65', '2001-02-08', 'F', 'Débora', '(10)10101-1010', 'Rua Alameda Slim', '76.767.767', 78, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('543.543.543-54', '1993-03-19', 'F', 'Maria Eduarda', '(76)76767-7676', 'Rua Alameda Slim', '65.656.656', 168, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('432.432.432-43', '1997-04-26', 'F', 'Beatriz', '(65)65656-6565', 'Rua Alameda Slim', '54.545.545', 542, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('321.321.321-32', '1984-05-29', 'F', 'Jéssica', '(54)54545-5454', 'Rua Alameda Slim', '43.434.434', 378, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('210.210.210-21', '1964-06-25', 'M', 'Jonathan', '(43)43434-4343', 'Rua Alameda Slim', '32.323.323', 931, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('109.109.109-10', '1956-08-30', 'M', 'Wei', '(32)32323-3232', 'Rua Alameda Slim', '21.212.212', 832, 'casa', 'Tiroleio', 'Cidade Fantasma'),
	('154.276.143-87', '1977-07-31', 'M', 'André', '(21)21212-2121', 'Rua Alameda Slim', '10.101.101', 14, 'apto', 'Tiroleio', 'Cidade Fantasma'),
	('122.535.678-19', '2000-11-27', 'M', 'Felipe', '(24)92567-3254', 'Rua Alameda Slim', '13.456.325', 1, 'casa', 'Tiroleio', 'Cidade Fantasma');

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
	select genero_lv, count(*) from LIVRO group by genero_lv order by cast(genero_lv as char);

#8. Listar os livros ordenados ascendentemente por gênero e ascendentemente por titulo.
 	select * from LIVRO order by cast(genero_lv as char) asc, titulo_lv asc;

#9. Liste todos os exemplares que foram emprestados num ano em ordem alfabética pelo seu título.
	

#10. Consultar os 5 exemplares mais emprestados na biblioteca (saber quais exemplares estão mais gastos).
	

#11. Consultar a média das idades das pessoas que pediram emprestados livros acadêmicos.
    select avg(TIMESTAMPDIFF(year, c.data_nasc_cl, CURDATE())) from cliente c
    join emprestimo e join livro l join exemplar x
    on c.cpf_cl = e.cpf_cl
    where e.id_exemplar = x.id_exemplar && x.titulo_lv = l.titulo_lv && l.genero_lv = 'Acadêmico';

#12. Listar os livros ordenados ascendentemente pelos autores e ascendentemente pelo título.
	select * from LIVRO order by autor_lv asc, titulo_lv asc;

#13. Listar todos os livros em ordem alfabética (ascendente pelo título) e a quantidade de exemplares que eles possuem.
 	select titulo_lv, count(*) from EXEMPLAR group by titulo_lv; 

#14. Dizer a quantidade de livros em ordem decrescente agrupados por autor.
	select count(*) from LIVRO group by autor_lv order by count(*) desc;

#15. Listar a quantidade de exemplares emprestados agrupados por ano e ordenados ascendentemente por ano.
    select year(e.data_emprestimo) as ano, count(*) from exemplar x
    join emprestimo e
    on x.id_exemplar = e.id_exemplar
    group by year(e.data_emprestimo)
    order by year(e.data_emprestimo);

#16. Listar a quantidade de livros cadastrados por cada funcionário.
    select nome_f, f.cpf_f, count(*) from livro l
    join funcionario f
    on l.cpf_f = f.cpf_f
    group by l.cpf_f;

#17. Listar todos os livros que estão como 1° edição ordenado pelo título.
	select * from LIVRO where edicao_lv = 1 order by titulo_lv;

#18. Listar os exemplares que nunca foram emprestados.
	select * from EXEMPLAR where id_exemplar not in (select id_exemplar from EMPRESTIMO);

#19. Consultar o gênero que possui mais exemplares emprestados.
	

#20. Consultar os 5 livros que tiveram a maior quantidade de exemplares emprestados (ver os livros mais populares).
	
	
#21. Consultar os 5 livros que tiveram a menor quantidade de exemplares emprestados (ver os livros menos populares).
	

#22. Listar os nomes e os CPFs dos clientes que pegaram mais exemplares emprestados.