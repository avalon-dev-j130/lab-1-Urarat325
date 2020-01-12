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
    "user" int references "User"(id),
    created timestamp
);

create table "User"(
    id int not null unique 
       generated always as identity(start with 1 , increment by 1),
    email varchar(255) primary key not null,
    password varchar(255) not null,
    info int references Userinfo(id),
    role int references Roles(id)
);

create table Userinfo(
    id int not null unique 
       generated always as identity(start with 1 , increment by 1),
    name varchar(255) not null,
    surname varchar(255) not null
);

create table Roles (
    id int not null unique 
       generated always as identity(start with 1 , increment by 1),
    "name" varchar (255) primary key
);
