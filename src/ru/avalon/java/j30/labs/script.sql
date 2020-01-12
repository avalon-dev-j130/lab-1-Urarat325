/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
create table Supplier (
    id int not null unique 
        generated always as identity(start with 1 , increment by 1),
    "name" varchar(255) primary key,
    address varchar(255) not null,
    phone varchar(255),
    representative varchar(255) not null
); 

create table Product (
    id int not null unique 
       generated always as identity(start with 1 , increment by 1),
    code varchar(255) primary key,
    title varchar(255),
    supplier int references Supplier(id),
    initial_price double,
    retail_value double
);

create table Order2product(
    "order" int references "Order"(id),
    product int references Product(id)
);

create table "Order" (
    id int primary key 
       generated always as identity(start with 1 , increment by 1),
    "user" integer references "User"(id),
    created timestamp
);

create table "User"(
    id int not null unique 
       generated always as identity(start with 1 , increment by 1),
    email varchar(255) primary key not null,
    password varchar(255) not null,
    info int references Userinfo(id),
    "role" varchar(255) references Roles(id)
);

create table Userinfo(
    id int not null unique 
       generated always as identity(start with 1 , increment by 1),
    "name" varchar(255) not null,
    surname varchar(255) not null
);

create table Roles (
    id int not null unique 
       generated always as identity(start with 1 , increment by 1),
    "name" varchar (255) primary key
);

insert into Supplier ("name",address,phone,representative)
values ('Sufficient Support','1399  Khale Street','(358) 521-5329','How?');

insert into Supplier ("name",address,phone,representative)
values ('Assorted Assets','4458  Patton Lane','(248) 288-8507','Who?');

insert into Supplier ("name",address,phone,representative)
values ('Resource Refresh','4028  Jefferson Street','(690) 441-7064','Why?');


insert into Product (code, title, supplier, initial_price, retail_value)
values ('64581', 'ORE!!!', '1', '0.25$', '0.65$');

insert into Product (code, title, supplier, initial_price, retail_value)
values ('64582', 'Metal!!!', '2', '0.25$', '0.65$');

insert into Product (code, title, supplier, initial_price, retail_value)
values ('64583', 'Copper!!!', '3', '0.25', '0.65');


insert into Userinfo (name, surname)
values ('Vasua', 'Pypkin');

insert into Userinfo (name, surname)
values ('Egor', 'Pypkin');

insert into Userinfo (name, surname)
values ('Yurii', 'Pypkin');

insert into Roles ("name")
values ('Client');
insert into Roles ("name")
values ('Vip Client');
insert into Roles ("name")
values ('MultiClient');

insert into "User" (email, password, info, role)
values ('dhd@mail.com', 'sk956GFDdf', 1, 'Client');

insert into "User" (email, password, info, role)
values ('kgjnbd@mail.com', 'kdhJGV465', 2, 'Vip Client');

insert into "User" (email, password, info, role)
values ('dhfgjug@mail.com', 'oihgIBN786', 3, 'MultiClient');

insert into "Order" ("user")
values (1);
insert into "Order" ("user")
values (2);
insert into "Order" ("user")
values (3);


insert into Order2product ("order", product)
values (1,1);
insert into Order2product ("order", product)
values (2,2);
insert into Order2product ("order", product)
values (3,3);
