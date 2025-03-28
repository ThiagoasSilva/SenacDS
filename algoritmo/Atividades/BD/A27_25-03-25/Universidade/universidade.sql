drop schema universidade;
create schema universidade;
use universidade;

create table alunos(
	mat int,
	nome varchar(255),
	endereco varchar(255),
	cidade varchar(255),
		primary key (mat)
);

create table disciplinas(
	cod_disc varchar(5),
	nome_disc varchar(100), 
	carga_hor int,
		primary key (cod_disc)
);

create table professores(
	cod_prof int,
	nome varchar(255),
	endereco varchar(255),
	cidade varchar(255),
		primary key (cod_prof)
);

create table turma(
	cod_disc varchar(5), 
	cod_turma int, 
	cod_prof int, 
	ano year, 
	horario varchar(20),
		primary key (cod_disc, cod_turma, cod_prof, ano),
		foreign key(cod_disc) references disciplinas(cod_disc),
		foreign key(cod_prof) references professores(cod_prof)		
);

create table historico(
	mat int, 
	cod_disc varchar(5),
	cod_turma int,
	cod_prof int,
	ano year,
	frequencia int,
	nota decimal (10,2),
		primary key(mat, cod_disc, cod_turma, cod_prof, ano),
		foreign key(mat) references alunos(mat),
		foreign key(cod_disc) references disciplinas(cod_disc)		
);

insert into alunos(mat, nome, endereco, cidade) values
(2015010101, "JORGE DE ALENCAR", "RUA DAS ALMAS", "NATAL"),
(2015010102, "JOÃO PAULO", "AVENIDA RUY CARNEIRO", "JOÃO PESSOA"),
(2015010103, "MARINA", "RUA CARROSSEL", "RECIFE"),
(2015010104, "MARIA DAS DORES", "RUA DAS LADEIRAS", "FORTALEZA"),
(2015010105, "JOSUÉ EDUARDO DOS SANTOS", "CENTRO", "NATAL"),
(2015010106, "JOSUÉLISSON CLAUDINO DOS SANTOS", "CENTRO", "NATAL");

insert into disciplinas(cod_disc, nome_disc, carga_hor) values
("BD", "BANCO DE DADOS", 100),
("POO", "PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS", 100),
("WEB", "AUTORIA WEB", 50),
("ENG", "ENGENHARIA DE SOFTWARE", 80);

insert into professores(cod_prof, nome, endereco, cidade) values
(212131, "NICKERSON FERREIRA", "RUA MANAÍRA", "JOÃO PESSOA"),
(122135, "ADORILSON BEZERRA", "AVENIDA SALGADO FILHO", "NATAL"),
(192011, "DIEGO OLIVEIRA", "AVENIDA ROBERTO FREIRE", "NATAL");

insert into turma(cod_disc, cod_turma, cod_prof, ano, horario) values
("BD", 1, 212131, 2015, "11H-12H"),
("BD", 2, 212131, 2015, "13H-14H"),
("POO", 1, 192011, 2015, "08H-09H"),
("WEB", 1, 192011, 2015, "07H-08H"),
("ENG", 1, 122135, 2015, "10H-11H");

insert into historico(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota) values
(2015010101,'BD',1,212131,2015,5,9.00),
(2015010101,'ENG',1,122135,2015,1,10.00),
(2015010101,'POO',1,192011,2015,4,8.00),
(2015010101,'WEB',1,192011,2015,2,9.00),
(2015010102,'BD',1,212131,2015,3,7.00),
(2015010102,'ENG',1,122135,2015,7,6.90),
(2015010102,'POO',1,192011,2015,1,6.00),
(2015010102,'WEB',1,192011,2015,1,9.00),
(2015010103,'BD',1,212131,2015,10,4.00),
(2015010103,'ENG',1,122135,2015,4,7.50),
(2015010103,'POO',1,192011,2015,5,8.50),
(2015010103,'WEB',1,192011,2015,2,9.50),
(2015010104,'BD',1,212131,2015,2,7.00),
(2015010104,'ENG',1,122135,2015,6,8.50),
(2015010104,'POO',1,192011,2015,1,6.00),
(2015010104,'WEB',1,192011,2015,2,8.40),
(2015010105,'BD',1,212131,2015,4,5.50),
(2015010105,'ENG',1,122135,2015,8,6.00),
(2015010105,'POO',1,192011,2015,3,8.00),
(2015010105,'WEB',1,192011,2015,2,6.00),
(2015010106,'BD',1,212131,2015,2,4.90),
(2015010106,'ENG',1,122135,2015,1,10.00),
(2015010106,'POO',1,192011,2015,1,6.00),
(2015010106,'WEB',1,192011,2015,2,7.00);

-- A ----------
select 
	mat,
	nota
from historico
where cod_disc = 'BD' 
		and ano = 2015 
			and nota < 5;
-- B -------------
select 
	mat,
	avg(nota)
from historico
where cod_disc = 'POO' 
	and ano = 2015
group by mat;
-- C --------------
select
	mat,
	avg(nota) as média
from historico
where cod_disc = 'POO'
	and ano = 2015
group by 1
having avg(nota) > 6;
-- D --------------
select 
	* 
from alunos 
	where cidade != 'NATAL';

-- PARTE 02 ---------------------------------
-- INSERT -----------------------------------
-- A ----------------------------------------
select * from alunos;
insert into alunos (mat,nome,endereco,cidade) values
(2015010107, 'AUGUSTO ALEGRE','RUA MANGUEIRÃO','BELÉM'),
(2015010108, 'PEDRO ROCHA','AVENIDA NAZARÉ','BELÉM'),
(2015010109, 'ALEXA DIAS','TAGUATINGA','BRASÍLIA'),
(2015010110, 'RAISSA ANDREIA','SAMAMBAIA','BRASÍLIA');

-- B ----------------------------------------
insert into professores (cod_prof, nome, endereco, cidade) values
(777888,'ANTONIO SOARES','RIACHO FUNDO II','BRASÍLIA'),
(121721,'THIAGO ANTONIO','RIACHO FUNDO I','BRASÍLIA'),
(123968,'BRENA COSTA','NÚCLEO BANDEIRANTE','BRASÍLIA');

insert into turma(cod_disc, cod_turma, cod_prof, ano, horario) values 
('WEB',2,777888,2025,'9H-10H'),
('ENG',2,121721,2025,'12H-13H'),
('POO',2,123968,2025,'10H-11H');

-- C ----------------------------------------
insert into historico(mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota) values
(2015010107,'POO',2,123968,2025,8,8.8),
(2015010107,'WEB',2,777888,2025,9,7.8),
(2015010108,'ENG',2,121721,2025,5,5.4),
(2015010109,'WEB',2,777888,2025,10,8.0),
(2015010110,'ENG',2,121721,2025,7,9.2);

-- DELETE -----------------------------------
-- A ---------------------------------------
delete from historico where cod_turma = 2 and cod_disc = 'BD';

-- B ---------------------------------------
-- delete from alunos where mat > 2015010109; ERRO DE FK
-- update alunos set mat = 0 where mat > 2015010109; ERRO DE FK
update alunos set nome = null, endereco = null, cidade = null where mat > 2015010109;
select * from alunos where mat > 2015010109;


-- UDPATE -----------------------------------
-- A ----------------------------------------
update historico set nota = nota + 0.5 where cod_disc = 'ENG' and cod_turma = 2;

select nota from historico where cod_disc = 'ENG' and cod_turma = 2;
-- B ----------------------------------------
update historico set nota = 10 where mat = 2015010102 and cod_disc = "POO";

select 
	mat, 
	nota
from historico
	where mat = 2015010102 and cod_disc like "POO";

-- PARTE 03 ---------------------------------
-- A ----------------------------------------
select 
	nome 
from alunos 
	where mat in (
	select
		mat 
	from historico 
		where cod_disc = "BD");

-- 1 ----------------------------------------

-- SUBSELECT
select 
	mat,
	nome,
	endereco,
	cidade
from alunos 
	where mat in (
	select 
		mat
	from historico
		where nota = 10);
-- com JOIN
select 
	* 
from alunos a  
	inner join historico h
		on a.mat = h.mat
where h.nota = 10;

-- 2 ----------------------------------------
-- SUBSELECT
select 
	* 
from alunos 
	where mat in (
	select 
		mat
	from historico 
		where nota >7);

-- com JOIN
select
	*
from alunos a 
	inner join historico h
		on a.mat = h.mat 
	where nota > 7;

-- 3 ----------------------------------------
select
	p.nome,
	count(cod_turma) as turmas
from professores p
	inner join turma t
		on p.cod_prof = t.cod_prof
group by 1
having count(cod_turma) > 1;
	

select * from alunos;
select * from disciplinas;
select * from turma;
select * from professores;
select * from historico;
