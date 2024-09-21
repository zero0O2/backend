
create database fs34;

/*
Textos
  - char(10) <-- maximo de caracteres
  - varchar(255) <-- suporta 255 caracteres
  - text <-- suporta +65k caracteres
  
Numeros
  - int
  - decimal / float / double
  - boolean
  
Datas
  - date - 2025-8-31
  - time - 09:25:45
  - datetime - 2025-8-31 09:25:45
  - timestamp - 2025-8-31 09:25:45
*/

CREATE TABLE IF NOT EXISTS fs34.alunos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(45) NOT NULL,
    nota decimal(4,2),
    idade int NOT NULL,
    data_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into fs34.alunos (nome,idade,nota) 
values ("Pietra", 17, 8.3), ("Carlos", 17, 9.5), ("Lucas" , 14, 7.0), ("Joao" , 16, 8.5);

select * from fs34.alunos;
select * from fs34.alunos where id = 4;

delete from fs34.alunos where id = 5; 

set sql_safe_updates=1;
update fs34.alunos set nome="Pietra" where id = 2;

-- Apagar tabela
drop table fs34.alunos;

select current_timestamp();

/*

1. Criar banco de dados do blog
2. Criar uma tabela pra guardar os posts
3. Fazer as operaçoes de CRUD nessa tabela

*/

CREATE DATABASE blog;



insert into blog.posts(autor,title,content)
values ("Rodrigo" ,"Aprenda HTML", "bla blaa bla bla blaa bla "),
("Paulinho" ,"Aprenda CSS", "bla blaa bla bla blaa bla blaaa bla "),
("Almeida" ,"Aprenda JavaScript", "bla blaa bla bla blaa bla blaaa ");

select * from blog.posts where titulo like "%html%";

select * from blog.posts;

drop database world;
drop table blog.posts;
drop database if exists blog;


/*====================== BLOG ========================*/


create database if not exists blog;

create table blog.users(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 firsname VARCHAR(50) NOT NULL,
 surname VARCHAR(50) NOT NULL,
 username VARCHAR(50) NOT NULL,
 email VARCHAR(250) NOT NULL,
 password VARCHAR(255) NOT NULL,
 create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 UNIQUE username_unique (username ASC),
 UNIQUE email_unique (email ASC)
);

create table blog.user_address(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    postcode VARCHAR(8) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(10) NOT NULL,
    complement VARCHAR(255),
    region VARCHAR(50),
    province VARCHAR(50),
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_address_users  
		FOREIGN KEY (user_id) 
        REFERENCES blog.users(id)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

create table blog.posts(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title varchar(50) not null,
    content TEXT,
    image VARCHAR(255),
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES blog.users(id) ON DELETE CASCADE
); 

create table blog.tags(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

create table blog.post_tags(
	post_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES blog.posts(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES blog.tags(id) ON DELETE CASCADE
);





