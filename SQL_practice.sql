create  database qa_restaurant; 

use qa_restaurant; 

create table customers(
cust_id int unique not null auto_increment,
cust_name varchar(100) not null,
phone_number char(11) not null,
primary key (cust_id)); 

show tables;
describe customers;