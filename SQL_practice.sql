create  database qa_restaurant; 

use qa_restaurant; 

drop table customers;

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
item_quan int not null,#order_placed datetime not null, 
primary key (order_id),
foreign key (cust_id) references customers(cust_id));

alter table orders drop column item_quan;
alter table orders add order_date date not null;

create table order_items(
oi_id int unique not null auto_increment,
order_id int,
item_id int,
item_quan int not null,#order_placed datetime not null, 
primary key (oi_id),
foreign key (order_id) references orders(order_id),
foreign key (item_id) references menu_items(menu_id));

show tables;
describe customers;
describe order_items;

insert into customers(cust_name, dob, phone_number, house_number, postcode, email) values("Gareth Ireson", 19910419, "07123456789", "16", "SO506FH", "gareth.ireson@nationwide.co.uk");
insert into customers(cust_name, dob, phone_number, house_number, postcode, email, diet_req) values("Alex Brown", 19950323, "07123456000", "Little Cottage", "PO506FX", "alexb@gmail.com", "Diabetic");
insert into customers(cust_name, dob, phone_number, house_number, postcode, email, diet_req) values("Mark Smith", 19850803, "07735294729", "74", "N19GF", "smithy@yahoo.co.uk", "Shellfish");
insert into customers(cust_name, dob, phone_number, house_number, postcode, email, diet_req) values("Emma Hunt", 19990729, "07842098847", "Flat 3, 19", "WD259XY", "ehunt@outlook.co.uk", "nut allergy");
insert into customers(cust_name, dob, phone_number, house_number, postcode, email) values("Jess Brave", 20001231, "07956783922", "34", "PL238WE", "jessieb@hotmail.co.uk");

update customers set cust_name="Emily Hunt", postcode="TW346HJ" where cust_id=4;
update customers set cust_name="Steve Smith", diet_req=null where cust_id=4; #forgot to change cust-id so it changed wrong record

delete from customers where cust_id=2;

insert into customers(cust_name, dob, phone_number, house_number, postcode, email) values("Rob Long", 19941104, "07987253088", "983", "UB548DF", "roblong@outlook.co.uk");

insert into menu_items(item_name, item_desc, price, calories, allergen) values("Prawn Cocktail", "Prawns with a marie rose sauce", "6.95", "600", "Shellfish");
insert into menu_items(item_name, item_desc, price, calories) values("Soup of the day", "Roasted vegetable soup with croutons and buttered roll", "4.95", "575");
insert into menu_items(item_name, item_desc, price, calories, allergen) values("Chicken Pad Thai", "Chicken and thai vegetables stirfried with rice noodles and crushed peanut", "9.95", "850", "Peanut");
insert into menu_items(item_name, item_desc, price, calories, allergen) values("Vegetable Pasta bake and Garlic Bread", "Roasted seasonal veg and pasta baked with cheese with a side of garlic bread", "7.95", "680", "Dairy");
insert into menu_items(item_name, item_desc, price, calories, allergen) values("Chocolate Brownie and Ice Cream", "Warm triple chocolate brownie served with vanilla ice cream and chocolate sauce", "5.95", "900", "Egg, Dairy");


select * from customers;
select * from menu_items;

