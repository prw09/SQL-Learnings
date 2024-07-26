create database campusx;

use campusx;

create table users(
	user_id INTEGER PRIMARY KEY auto_increment,
    name varchar(300) not null,
    email varchar(500) not null,
    password varchar(255) not null
);


insert into campusx.users values
(null, 'piyush', 'piyush@gmail.com', '123456'),
(null, 'ram', 'ram@gmail.com', '29809'),
(null, 'sagar', 'sagar@gmail.com', '3493'),
(null, 'dange', 'dange@gmail.com', '34678990')

