create database customer;

use customer;

create table customers (
	cid integer primary key auto_increment,
    name varchar(200) not null,
    email varchar(300) not null
    );
    
    
create table orders(
	order_id integer primary key auto_increment,
    cid integer,
    order_date datetime not null default current_timestamp,
    
    constraint order_fk foreign key (cid) references customers(cid)
);

ALTER TABLE customers ADD COLUMN password varchar(300) not null;

ALTER TABLE customers ADD COLUMN surname varchar(500) not null after name;

show tables;

select * from customers;



  