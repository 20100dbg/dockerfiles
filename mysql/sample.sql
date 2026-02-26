CREATE DATABASE sample;

USE sample;

CREATE TABLE users (
    id int auto_increment primary key,
    name varchar(200),
    email varchar(200)
);

INSERT INTO users VALUES 
    (1, 'admin', 'admin@mail.net'),
    (2, 'user', 'user@mail.net'),
    (3, 'test', 'test@mail.net');