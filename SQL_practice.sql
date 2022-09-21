create  database qa_restaurant; 

use qa_restaurant; 

create table customers(
cust_id int unique not null auto_increment,
cust_name varchar(100) not null,
dob date not null,
phone_number char(11) not null,
house_number varchar(30) not null,
postcode varchar (7) not null,
email varchar (50) default "no email provided",
diet_req varchar(100) default "none",
primary key (cust_id)); 

create table menu_items(
menu_id int unique not null auto_increment,
item_name varchar (50) not null,
item_desc varchar (100) not null, 
price decimal (4,2) not null,
calories int not null,
allergen varchar(100) default "none",
primary key (menu_id));

create table orders(
order_id int unique not null auto_increment,
cust_id int,
menu_id int,
item_quan int not null,
order_placed datetime not null, 
primary key (order_id),
foreign key cust_id references customers(cust_id),
foreign key menu_id references menu_items(menu_id))


show tables;
describe customers;