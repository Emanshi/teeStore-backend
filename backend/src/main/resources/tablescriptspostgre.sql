drop table Address;
drop table Review;
drop table Product;
drop table Contact;
drop table Users;

create table Users(
user_id varchar (5),
user_name VARCHAR(20) not null,
email_id VARCHAR(50) not null ,
contact_number VARCHAR(10) not null unique,
password VARCHAR(70) not null,
date_of_birth timestamp  not null,
constraint TS_USERS_PK primary key (user_id)
);

create table Address(
address_id varchar(5),
street VARCHAR(30) not null,
city VARCHAR(35) not null,
state VARCHAR(20) not null,
pin_code INTEGER not null,
user_id varchar (5),
constraint TS_ADDRESS_PK primary key (address_id),
constraint TS_ADDRESS_USER_FK foreign key (user_id) references Users (user_id)
);


CREATE type size_type AS ENUM ('S','M','L');
create type sex_type as enum ('M','F');
create type category_type as ENUM('SHIRT','TSHIRT','JEANS','SKIRTS','TOPS','TROUSERS'),
create table Product(
product_id VARCHAR(6),
product_name VARCHAR(50) not null,
cost real not null,
size size_type default 'm',
sex sex_type not null,
category category_type not null,
product_group VARCHAR(6) not null,
quantity integer  not null,
date_of_addition timestamp default CURRENT_TIMESTAMP,
constraint TS_PRODUCT_PK primary key (product_id)
);
alter table product
alter size type size_type USING size::size_type,
alter sex type sex_type USING sex::sex_type,
alter category type category_type USING category::category_type;

CREATE TYPE rating_type AS ENUM ('ONE','TWO','THREE','FOUR','FIVE');
create table Review(
review_id VARCHAR(6),
review_title VARCHAR(30) not null,
review_body VARCHAR(200) not null,
ratings rating_type default 'five',
rating_helpful integer,
review_date timestamp default current_timestamp,
user_id varchar (5) not null,
product_id VARCHAR(6) not null,
constraint TS_REVIEW_PK primary key (review_id),
constraint TS_REVIEW_USERS_FK foreign key (user_id) references Users (user_id),
constraint TS_REVIEW_PRODUCT_FK foreign key (product_id) references Product (product_id)
)
alter table review
alter ratings type rating_type USING ratings::rating_type;

create table Contact(
contact_id VARCHAR(5) ,
contact_email VARCHAR(30) not null,
phone_no VARCHAR(10) not null,
subject VARCHAR(50) not null,
message VARCHAR(200) not null,
user_id varchar (5) ,
constraint TS_CONTACT_PK primary key (contact_id),
constraint TS_CONTACT_USERS_FK foreign  key (user_id) references Users (user_id)
);

insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES ('U1001', 'SCOTT', 'scott@stark.com', '8884967823', '3284cbd43ac6fc733d7c3d2176e7a52bbaeba81471702ec332a0a65689cf16e3', '2002-3-2'::timestamp);
-- Scott@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES ('U1002', 'TONY', 'tony@stark.com', '8875632142', '1f7cbaa9168ffce48872d8fc4e5429dee55ed8f21d8d84bccd6aaa2a72ae1d79', '2001-3-2'::timestamp);
-- Tony@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES ('U1003', 'STEVE', 'steve@gmail.com', '9880253413', '97661249431ccedba1711b78fb58eceb2c03054a07a7b684ad53048691b34435', '1997-3-2'::timestamp);
-- Steve@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES ('U1004', 'BANNER', 'banner@Uv.com', '8882039476', '9a8d7e96acac7b73f1f9c994dd512df9068bb0549961e42333745c67a994e6f1', '1952-3-2'::timestamp);
-- Banner@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES('U1005' ,'James' ,'james14@gmail.com', '7658459834','338c8bf01f4552dff1d4b2eed84c7a38c3a5f001604804fba47e3d28fc6ad4f5', '2002-12-2'::timestamp);
-- James@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES('U1006' ,'Leo Tondis' ,'leondistony@yahoo.com','9826728172', '433a6285c29c0265c19582e53321cc7892554d468576494da9247c6be903b867', '1975-3-2'::timestamp);
-- Leo@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES('U1006' ,'David Sandberg' ,'david1981@hotstar.com','6789273841','011f43602454216a9788b99e03e2bde8eae0a97e5b760507c8402bdd78b6f10d', '2000-10-2'::timestamp);
-- David@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES('U1008' ,'Tim Miller' , 'tom@gmail.com', '8719274910','12a7f5611794b4b0bc39136bc2d62a55e875a0d692d77ef23a285b7f36a9a2fc', '2002-1-2'::timestamp);
-- Tim@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES('U1009' ,'John Cena','johncena@hotmail.com','9182972829' ,'0f4dd6c67bc8c827a2b181bc763f9ab96166d8f50840fe1ae0bbc0e77464da2c', '1998-3-2'::timestamp);
-- John@123
insert into Users(user_id,user_name,email_id,contact_number,password,date_of_birth) VALUES('U1010' ,'Miley Swan' ,'swanmiley@yux.com' , '8920381092','8ecf2ac126d3abe0dc52b92cbc990448e9ae90dfcb9e7e40fbdc4a86bc7a66cf', '2002-3-2'::timestamp);
-- Miley@123

insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1001' ,'8 East Walnut Street' ,'pune' ,'maharashtra' ,'114590' ,'U1001' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1002' ,'720 Rockland Road' ,'bengaluru' ,'karnataka' ,'113449' ,'U1002' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1003' ,'37 Marlborough Street' ,'lucknow' ,'uttar pradesh' ,'110070' ,'U1003' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1004' ,'56 Paranthe Wali Gali' ,'new delhi' ,'delhi' ,'110006' ,'U1004' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1005' ,'120 Andheri West Road' ,'pune' ,'maharashtra' ,'114660' ,'U1005' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1006' ,'2 A Mount Abu Street' ,'bengaluru' ,'karnataka' ,'113455' ,'U1006' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1007' ,'101 B Sai Baba Temple Street' ,'lucknow' ,'uttar pradesh' ,'113370' ,'U1007' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1008' ,'22 C Ambedkar Road' ,'new delhi' ,'delhi' ,'112206' ,'U1008' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1009' ,'83 Silicon Housing Complex' ,'kolkata' ,'west bengal' ,'111190' ,'U1009' );
insert into Address(address_id,street,city,state,pin_code,user_id) VALUES('A1010' ,'671 Rose Garden Street' ,'bengaluru' ,'karnataka' ,'110049' ,'U1010' );

insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10001' ,'cool shirt 1' ,1359.0,'S','M','SHIRT','PG1001',65,'2020-3-2'::timestamp,'25.5',30,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10002' ,'cool shirt 1' ,1359.0,'M','M','SHIRT','PG1001',73,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10003' ,'cool shirt 1' ,1359.0,'L','M','SHIRT','PG1001',45,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10004' ,'cool shirt 2' ,1769.0,'S','M','SHIRT','PG1002',60,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10005' ,'cool shirt 2' ,1769.0,'M','M','SHIRT','PG1002',51,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10006' ,'cool shirt 2' ,1769.0,'L','M','SHIRT','PG1002',78,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10007' ,'cool shirt 3' ,2134.0,'S','F','SHIRT','PG1003',53,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10008' ,'cool shirt 3' ,2134.0,'M','F','SHIRT','PG1003',8,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10009' ,'cool shirt 3' ,2134.0,'L','F','SHIRT','PG1003',73,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10010' ,'cool shirt 4' ,2500.0,'S','F','SHIRT','PG1004',37,'2020-3-2'::timestamp,'25.5',20,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10011' ,'cool shirt 4' ,2500.0,'M','F','SHIRT','PG1004',66,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10012' ,'cool shirt 4' ,2500.0,'L','F','SHIRT','PG1004',55,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10013' ,'osm t-shirt 1' ,1267.0,'S','M','TSHIRT','PG1005',32,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10014' ,'osm t-shirt 1' ,1267.0,'M','M','TSHIRT','PG1005',72,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10015' ,'osm t-shirt 1' ,1267.0,'L','M','TSHIRT','PG1005',44,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10016' ,'osm t-shirt 2' ,1985.0,'S','M','TSHIRT','PG1006',23,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10017' ,'osm t-shirt 2' ,1985.0,'M','M','TSHIRT','PG1006',78,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10018' ,'osm t-shirt 2' ,1985.0,'L','M','TSHIRT','PG1006',19,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10019' ,'osm t-shirt 3' ,2206.0,'S','F','TSHIRT','PG1007',29,'2020-5-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10020' ,'osm t-shirt 3' ,2206.0,'M','F','TSHIRT','PG1007',38,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10021' ,'osm t-shirt 3' ,2206.0,'L','F','TSHIRT','PG1007',65,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10022' ,'osm t-shirt 4' ,2610.0,'S','F','TSHIRT','PG1008',69,'2020-5-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10023' ,'osm t-shirt 4' ,2610.0,'M','F','TSHIRT','PG1008',45,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10024' ,'osm t-shirt 4' ,2610.0,'L','F','TSHIRT','PG1008',23,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10025' ,'cute jeans 1' ,2267.0,'S','M','JEANS','PG1009',32,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10026' ,'cute jeans 1' ,2267.0,'M','M','JEANS','PG1009',64,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10027' ,'cute jeans 1' ,2267.0,'L','M','JEANS','PG1009',10,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10028' ,'cute jeans 2' ,2985.0,'S','M','JEANS','PG1010',32,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10029' ,'cute jeans 2' ,2985.0,'M','M','JEANS','PG1010',22,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10030' ,'cute jeans 2' ,2985.0,'L','M','JEANS','PG1010',20,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10031' ,'cute jeans 3' ,3206.0,'S','F','JEANS','PG1011',33,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10032' ,'cute jeans 3' ,3206.0,'M','F','JEANS','PG1011',71,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10033' ,'cute jeans 3' ,3206.0,'L','F','JEANS','PG1011',39,'2020-5-2'::timestamp,'25.5',10,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10034' ,'cute jeans 4' ,3610.0,'S','F','JEANS','PG1012',53,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10035' ,'cute jeans 4' ,3610.0,'M','F','JEANS','PG1012',45,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10036' ,'cute jeans 4' ,3610.0,'L','F','JEANS','PG1012',65,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10037' ,'hot tops 1' ,3015.0,'S','F','TOPS','PG1013',67,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10038' ,'hot tops 1' ,3015.0,'M','F','TOPS','PG1013',34,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10039' ,'hot tops 1' ,3015.0,'L','F','TOPS','PG1013',22,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10040' ,'hot tops 2' ,2975.0,'S','F','TOPS','PG1014',19,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10041' ,'hot tops 2' ,2975.0,'M','F','TOPS','PG1014',66,'2020-5-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10042' ,'hot tops 2' ,2975.0,'L','F','TOPS','PG1014',32,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10043' ,'hot tops 3' ,2681.0,'S','F','TOPS','PG1015',62,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10044' ,'hot tops 3' ,2681.0,'M','F','TOPS','PG1015',58,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10045' ,'hot tops 3' ,2681.0,'L','F','TOPS','PG1015',49,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10046' ,'hot tops 4' ,3256.0,'S','F','TOPS','PG1016',43,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10047' ,'hot tops 4' ,3256.0,'M','F','TOPS','PG1016',6,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10048' ,'hot tops 4' ,3256.0,'L','F','TOPS','PG1016',37,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10049' ,'sexy skirt 1' ,1782.0,'S','F','SKIRTS','PG1017',45,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10050' ,'sexy skirt 1' ,1782.0,'M','F','SKIRTS','PG1017',59,'2020-5-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10051' ,'sexy skirt 1' ,1782.0,'L','F','SKIRTS','PG1017',25,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10052' ,'sexy skirt 2' ,1803.0,'S','F','SKIRTS','PG1018',48,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10053' ,'sexy skirt 2' ,1803.0,'M','F','SKIRTS','PG1018',38,'2020-5-2'::timestamp,'25.5',10,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10054' ,'sexy skirt 2' ,1803.0,'L','F','SKIRTS','PG1018',77,'2020-3-2'::timestamp,'25.5',10,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10055' ,'sexy skirt 3' ,1506.0,'S','F','SKIRTS','PG1019',46,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10056' ,'sexy skirt 3' ,1506.0,'M','F','SKIRTS','PG1019',78,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10057' ,'sexy skirt 3' ,1506.0,'L','F','SKIRTS','PG1019',9,'2020-5-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10058' ,'sexy skirt 4' ,1410.0,'S','F','SKIRTS','PG1020',12,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10059' ,'sexy skirt 4' ,1410.0,'M','F','SKIRTS','PG1020',54,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10060' ,'sexy skirt 4' ,1410.0,'L','F','SKIRTS','PG1020',32,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10061' ,'gym trousers 1' ,1359.0,'S','M','TROUSERS','PG1021',47,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10062' ,'gym trousers 1' ,1359.0,'M','M','TROUSERS','PG1021',7,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10063' ,'gym trousers 1' ,1359.0,'L','M','TROUSERS','PG1021',62,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10064' ,'gym trousers 2' ,1769.0,'S','M','TROUSERS','PG1022',25,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10065' ,'gym trousers 2' ,1769.0,'M','M','TROUSERS','PG1022',72,'2020-5-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10066' ,'gym trousers 2' ,1769.0,'L','M','TROUSERS','PG1022',13,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10067' ,'gym trousers 3' ,2134.0,'S','F','TROUSERS','PG1023',50,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10068' ,'gym trousers 3' ,2134.0,'M','F','TROUSERS','PG1023',23,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10069' ,'gym trousers 3' ,2134.0,'L','F','TROUSERS','PG1023',52,'2020-3-2'::timestamp,'25.5',20,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10070' ,'gym trousers 4' ,2500.0,'S','F','TROUSERS','PG1024',49,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10071' ,'gym trousers 4' ,2500.0,'M','F','TROUSERS','PG1024',35,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');
insert into Product (product_id,product_name,cost,size,sex,category,product_group,quantity,date_of_addition,avg_rating,discount,product_info) VALUES('P10072' ,'gym trousers 4' ,2500.0,'L','F','TROUSERS','PG1024',54,'2020-3-2'::timestamp,'25.5',0,'Breakfast Protein bars are crunchy, chewy, fruity, delicious bars that are great as part of an on-the-go breakfast. Stacked with good-for-you protein, antioxidants, omega 3s and fiber its much more than just a bar - its nutrition and energy to get you going. Each box contains 6 individually wrapped bars.');

insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1001','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1002','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10001' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1003' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10001' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1004' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1005' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1006' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1007' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1008' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1009' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1010' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10001');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1011','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1012','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10015' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1013' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10015' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1014' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1015' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1016' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1017' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1018' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1019' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1020' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10015');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1021','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1022','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10065' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1023' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10065' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1024' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1025' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1026' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1027' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1028' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1029' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1030' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10065');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1031','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10053');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1032','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10053' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1033' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10053' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1034' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10053');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1035' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10053');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1036' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10053');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1037' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10039');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1038' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10039');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1039' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10039');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1040' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10039');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1041','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10005');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1042','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10005' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1043' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10005' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1044' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10005');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1045' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10005');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1046' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10011');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1047' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10011');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1048' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10011');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1049' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10011');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1050' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10011');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1051','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10061');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1052','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10061' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1053' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10061' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1054' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10021');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1055' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10021');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1056' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10021');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1057' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10021');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1058' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10026');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1059' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10026');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1060' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10026');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1061','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10072');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1062','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10072' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1063' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10072' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1064' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10072');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1065' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10072');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1066' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10044');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1067' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10044');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1068' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10044');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1069' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10044');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1070' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10044');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1071','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1072','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10031' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1073' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10031' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1074' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1075' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1076' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1077' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1078' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1079' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1080' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10031');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1081','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10035');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1082','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10035' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1083' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10035' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1084' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10035');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1085' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10035');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1086' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10048');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1087' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10048');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1088' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10048');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1089' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10048');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1090' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10048');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1091','Great Quality','nice product will get the same set for my friend for twinning','FIVE',6, '2020-3-2'::timestamp, 'U1004' ,'P10068');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1092','Superb' ,'Thanks tee store','FIVE',9, '2020-3-2'::timestamp, 'U1002','P10068' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1093' ,'Good fitting','perfect fitting and best quality','FIVE',3, '2020-3-2'::timestamp, 'U1001','P10068' );
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1094' ,'Worth for the price','above average','FOUR',4, '2020-3-2'::timestamp, 'U1009','P10068');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1095' ,'Thumbs up','nice work done tee store','FOUR',5, '2020-3-2'::timestamp, 'U1008','P10068');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1096' ,'Value for money','better for the price range','THREE',0, '2020-3-2'::timestamp, 'U1003','P10068');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1097' ,'Size is big','very nice but a little big','THREE',6, '2020-3-2'::timestamp, 'U1005','P10068');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1098' ,'Not satisfied','late delivery and color was much different than what it looked online','TWO',0, '2020-3-2'::timestamp, 'U1007','P10068');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1099' ,'Not appealing','an ordinary product not so appealing','TWO',1, '2020-3-2'::timestamp, 'U1008','P10068');
insert into Review (review_id,review_title,review_body,ratings,rating_helpful,review_date,user_user_id,product_product_id) VALUES('R1100' ,'Extremely bad','got a defective one','ONE',0, '2020-3-2'::timestamp, 'U1006','P10068');

insert into Contact (contact_id,contact_email,phone_no,subject,message,user_id) VALUES('C101' ,'willsmit@gmail.com', '7329837629' ,'Nice Website','good products satisfied',null);
insert into Contact (contact_id,contact_email,phone_no,subject,message,user_id) VALUES('C102' ,'ivan@hotmail.com' , '6373838291', 'less varities','less products to chose from',null);
insert into Contact (contact_id,contact_email,phone_no,subject,message,user_id) VALUES('C103' ,'tony@stark.com', '8875632142', 'Quality is awesome' ,'will buy again', 'U1002');
insert into Contact (contact_id,contact_email,phone_no,subject,message,user_id) VALUES('C104' ,'banner@Uv.com' ,'8882039476','want more varities','in different colors and different styles','U1004');

select * from users;
select * from Address;
select * from Product;
select * from Review;
select * from Contact;
--
--Hibernate:
--2020-05-06T14:25:52.257624+00:00 app[web.1]:
--2020-05-06T14:25:52.257632+00:00 app[web.1]:     create table address (
--2020-05-06T14:25:52.257632+00:00 app[web.1]:        address_id varchar(255) not null,
--2020-05-06T14:25:52.257633+00:00 app[web.1]:         city varchar(255),
--2020-05-06T14:25:52.257633+00:00 app[web.1]:         pin_code int4,
--2020-05-06T14:25:52.257634+00:00 app[web.1]:         state varchar(255),
--2020-05-06T14:25:52.257634+00:00 app[web.1]:         street varchar(255),
--2020-05-06T14:25:52.257634+00:00 app[web.1]:         user_id varchar(255),
--2020-05-06T14:25:52.257635+00:00 app[web.1]:         primary key (address_id)
--2020-05-06T14:25:52.257642+00:00 app[web.1]:     )

alter table address
alter address_id type varchar(5),
alter user_id type varchar(5),
alter city type varchar(50),
alter state type varchar(50),
alter street type varchar(100);

--2020-05-06T14:25:52.271211+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.271213+00:00 app[web.1]:
--2020-05-06T14:25:52.271214+00:00 app[web.1]:     create table contact (
--2020-05-06T14:25:52.271215+00:00 app[web.1]:        contact_id varchar(255) not null,
--2020-05-06T14:25:52.271215+00:00 app[web.1]:         contact_email varchar(255),
--2020-05-06T14:25:52.271215+00:00 app[web.1]:         message varchar(255),
--2020-05-06T14:25:52.271215+00:00 app[web.1]:         phone_no varchar(255),
--2020-05-06T14:25:52.271216+00:00 app[web.1]:         subject varchar(255),
--2020-05-06T14:25:52.271217+00:00 app[web.1]:         user_id varchar(255),
--2020-05-06T14:25:52.271217+00:00 app[web.1]:         primary key (contact_id)
--2020-05-06T14:25:52.271282+00:00 app[web.1]:     )

alter table contact
alter contact_id type varchar(5),
alter user_id type varchar(5),
alter contact_email type varchar(70),
alter phone_no type varchar(10),
alter message type varchar(200),
alter subject type varchar(50);

--2020-05-06T14:25:52.280676+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.280677+00:00 app[web.1]:
--2020-05-06T14:25:52.280678+00:00 app[web.1]:     create table product (
--2020-05-06T14:25:52.280679+00:00 app[web.1]:        product_id varchar(255) not null,
--2020-05-06T14:25:52.280679+00:00 app[web.1]:         avg_rating varchar(255),
--2020-05-06T14:25:52.280679+00:00 app[web.1]:         category varchar(255),
--2020-05-06T14:25:52.280680+00:00 app[web.1]:         cost float8,
--2020-05-06T14:25:52.280680+00:00 app[web.1]:         date_of_addition timestamp,
--2020-05-06T14:25:52.280680+00:00 app[web.1]:         discount float8,
--2020-05-06T14:25:52.280681+00:00 app[web.1]:         product_group varchar(255),
--2020-05-06T14:25:52.280681+00:00 app[web.1]:         product_info varchar(255),
--2020-05-06T14:25:52.280681+00:00 app[web.1]:         product_name varchar(255),
--2020-05-06T14:25:52.280682+00:00 app[web.1]:         quantity int4,
--2020-05-06T14:25:52.280682+00:00 app[web.1]:         sex varchar(255),
--2020-05-06T14:25:52.280683+00:00 app[web.1]:         size varchar(255),
--2020-05-06T14:25:52.280683+00:00 app[web.1]:         primary key (product_id)
--2020-05-06T14:25:52.280689+00:00 app[web.1]:     )

alter table product
alter product_id type varchar(6),
alter avg_rating type varchar(10),
alter product_group type varchar(6),
alter product_info type varchar(2000),
alter size type size_type USING size::size_type,
alter sex type sex_type USING sex::sex_type,
alter category type category_type USING category::category_type;

--2020-05-06T14:25:52.291710+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.291712+00:00 app[web.1]:
--2020-05-06T14:25:52.291713+00:00 app[web.1]:     create table review (
--2020-05-06T14:25:52.291713+00:00 app[web.1]:        review_id varchar(255) not null,
--2020-05-06T14:25:52.291714+00:00 app[web.1]:         rating_helpful int4,
--2020-05-06T14:25:52.291714+00:00 app[web.1]:         ratings varchar(255),
--2020-05-06T14:25:52.291714+00:00 app[web.1]:         review_body varchar(255),
--2020-05-06T14:25:52.291714+00:00 app[web.1]:         review_date timestamp,
--2020-05-06T14:25:52.291715+00:00 app[web.1]:         review_title varchar(255),
--2020-05-06T14:25:52.291715+00:00 app[web.1]:         product_product_id varchar(255),
--2020-05-06T14:25:52.291715+00:00 app[web.1]:         user_user_id varchar(255),
--2020-05-06T14:25:52.291715+00:00 app[web.1]:         primary key (review_id)
--2020-05-06T14:25:52.291720+00:00 app[web.1]:     )

alter table review
alter review_id type varchar(5),
alter user_user_id type varchar(5),
alter review_title type varchar(50),
alter ratings type rating_type USING ratings::rating_type;,
alter product_product_id type varchar(6);

--2020-05-06T14:25:52.299666+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.299668+00:00 app[web.1]:
--2020-05-06T14:25:52.299668+00:00 app[web.1]:     create table users (
--2020-05-06T14:25:52.299669+00:00 app[web.1]:        user_id varchar(255) not null,
--2020-05-06T14:25:52.299669+00:00 app[web.1]:         contact_number varchar(255),
--2020-05-06T14:25:52.299670+00:00 app[web.1]:         date_of_birth timestamp,
--2020-05-06T14:25:52.299670+00:00 app[web.1]:         email_id varchar(255),
--2020-05-06T14:25:52.299670+00:00 app[web.1]:         password varchar(255),
--2020-05-06T14:25:52.299671+00:00 app[web.1]:         user_name varchar(255),
--2020-05-06T14:25:52.299671+00:00 app[web.1]:         primary key (user_id)
--2020-05-06T14:25:52.299676+00:00 app[web.1]:     )

alter table users
alter user_id type varchar(5),
alter contact_number type varchar(10),
alter email_id type varchar(70),
alter user_name type varchar(50),
alter password type varchar(70);

--2020-05-06T14:25:52.308647+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.308649+00:00 app[web.1]:
--2020-05-06T14:25:52.308650+00:00 app[web.1]:     alter table address
--2020-05-06T14:25:52.308650+00:00 app[web.1]:        add constraint FK6i66ijb8twgcqtetl8eeeed6v
--2020-05-06T14:25:52.308651+00:00 app[web.1]:        foreign key (user_id)
--2020-05-06T14:25:52.308657+00:00 app[web.1]:        references users
--2020-05-06T14:25:52.312388+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.312389+00:00 app[web.1]:
--2020-05-06T14:25:52.312390+00:00 app[web.1]:     alter table contact
--2020-05-06T14:25:52.312391+00:00 app[web.1]:        add constraint FKbxl6anxo14q097g8cd2e51v55
--2020-05-06T14:25:52.312391+00:00 app[web.1]:        foreign key (user_id)
--2020-05-06T14:25:52.312396+00:00 app[web.1]:        references users
--2020-05-06T14:25:52.315594+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.315595+00:00 app[web.1]:
--2020-05-06T14:25:52.315596+00:00 app[web.1]:     alter table review
--2020-05-06T14:25:52.315596+00:00 app[web.1]:        add constraint FK11khguugixv7x8xw8gj99ph6m
--2020-05-06T14:25:52.315597+00:00 app[web.1]:        foreign key (product_product_id)
--2020-05-06T14:25:52.315601+00:00 app[web.1]:        references product
--2020-05-06T14:25:52.320881+00:00 app[web.1]: Hibernate:
--2020-05-06T14:25:52.320882+00:00 app[web.1]:
--2020-05-06T14:25:52.320882+00:00 app[web.1]:     alter table review
--2020-05-06T14:25:52.320883+00:00 app[web.1]:        add constraint FKq6prfoeqnogpi44xmtbgyuj8p
--2020-05-06T14:25:52.320883+00:00 app[web.1]:        foreign key (user_user_id)
--2020-05-06T14:25:52.320887+00:00 app[web.1]:        references users

--create table cart (
--2020-05-11T14:14:23.192506+00:00 app[web.1]:        cart_id varchar(5) not null,
--2020-05-11T14:14:23.192506+00:00 app[web.1]:         product_ids varchar(1000),
--2020-05-11T14:14:23.192507+00:00 app[web.1]:         quantities varchar(1000),
--2020-05-11T14:14:23.192507+00:00 app[web.1]:         total_cost float8,
--2020-05-11T14:14:23.192507+00:00 app[web.1]:         user_id varchar(255),
--2020-05-11T14:14:23.192508+00:00 app[web.1]:         primary key (cart_id)
--2020-05-11T14:14:23.192513+00:00 app[web.1]:     )
--2020-05-11T14:14:23.210893+00:00 app[web.1]: Hibernate:
--2020-05-11T14:14:23.210895+00:00 app[web.1]:
--2020-05-11T14:14:23.210895+00:00 app[web.1]:     create table orders (
--2020-05-11T14:14:23.210896+00:00 app[web.1]:        order_id varchar(5) not null,
--2020-05-11T14:14:23.210897+00:00 app[web.1]:         product_ids varchar(1000),
--2020-05-11T14:14:23.210897+00:00 app[web.1]:         quantities varchar(1000),
--2020-05-11T14:14:23.210897+00:00 app[web.1]:         total_cost float8,
--2020-05-11T14:14:23.210898+00:00 app[web.1]:         user_id varchar(255),
--2020-05-11T14:14:23.210898+00:00 app[web.1]:         primary key (order_id)
--2020-05-11T14:14:23.210931+00:00 app[web.1]:     )
--2020-05-11T14:14:23.256649+00:00 app[web.1]: Hibernate:
--2020-05-11T14:14:23.256650+00:00 app[web.1]:
--2020-05-11T14:14:23.256651+00:00 app[web.1]:     alter table cart
--2020-05-11T14:14:23.256652+00:00 app[web.1]:        add constraint FKg5uhi8vpsuy0lgloxk2h4w5o6
--2020-05-11T14:14:23.256652+00:00 app[web.1]:        foreign key (user_id)
--2020-05-11T14:14:23.259300+00:00 app[web.1]:        references users
--2020-05-11T14:14:23.286326+00:00 app[web.1]: Hibernate:
--2020-05-11T14:14:23.286327+00:00 app[web.1]:
--2020-05-11T14:14:23.286328+00:00 app[web.1]:     alter table orders
--2020-05-11T14:14:23.286329+00:00 app[web.1]:        add constraint FK32ql8ubntj5uh44ph9659tiih
--2020-05-11T14:14:23.286329+00:00 app[web.1]:        foreign key (user_id)
--2020-05-11T14:14:23.286401+00:00 app[web.1]:        references users


--2020-06-03T14:57:09.288202+00:00 app[web.1]: Hibernate:
--2020-06-03T14:57:09.288213+00:00 app[web.1]:
--2020-06-03T14:57:09.288215+00:00 app[web.1]:     create table images (
--2020-06-03T14:57:09.288216+00:00 app[web.1]:        image_id varchar(255) not null,
--2020-06-03T14:57:09.288216+00:00 app[web.1]:         link_image varchar(200),
--2020-06-03T14:57:09.288216+00:00 app[web.1]:         reference varchar(9),
--2020-06-03T14:57:09.288217+00:00 app[web.1]:         primary key (image_id)
--2020-06-03T14:57:09.288224+00:00 app[web.1]:     )


insert into Images(image_id,link_image,reference) VALUES('I10001','https://lh3.googleusercontent.com/kilUEc3t0Zzc5q55X-Oj558V5T2etKN2Gc2EOzEdJgJJHc2RQ1DrNiX9Tr4NWBzu1ifJsAMQCPIleXl6u7CRk_xizafvveSwLuSzfbLBOg-j2MltylVvryP8dtqQRMwKbkyUWpHt8A','PG1001');
insert into Images(image_id,link_image,reference) VALUES('I10002','https://lh3.googleusercontent.com/6DpQGIiU8iXXdja6dTbxp-GGlLbjkUvZJt2_rKgYDTV_2bysNdRS6K7aR4Lz7ULEAC_8tpstlE_btPf_92DCrUjwD3-t38DLPhkckcMYcsWDlZC3rCeEeBOkMtPNWxUyUw3CW7o1Cg','PG1001');
insert into Images(image_id,link_image,reference) VALUES('I10003','https://lh3.googleusercontent.com/B2LWq_g1RX_dgHfLWCux8Y0AgX6jQkNpTVwFvBDhvVlJJsjiVjLpWq5Bd9LvYLxoNQkhtJaEREsPATKNqWCkWjrFfA_7_xsjLLAvWoNQLwm9JGraYwwt0gQtVdFN3AhOsnQJ7In1Lw','PG1001');
insert into Images(image_id,link_image,reference) VALUES('I10004','https://lh3.googleusercontent.com/DTyUDERL-mO3u4B0or9ADkul_dWM2O1mWEzPSNO3GT98wk_gVABNyTKfANxSQSDSeA9SCsbwiyW9m8sX0pNyfX4o-6WU6xNbTjiA8Z8hYePcvsoSDJwVlzA0CPTIBUe_jVgcg4mzMg','PG1002');
insert into Images(image_id,link_image,reference) VALUES('I10005','https://lh3.googleusercontent.com/SiWUtj8pDpR_DaivtU2_ngka2FG65iSzG7ZM4wjYkcyh3pqQAeCzvuHQV_GA76y9gvaW-vHdSX9Yt_lrPaMm7DWuQ8PnYLiUvsGUrs5MPYBIouaoWEGjRlwVnVOn1Nzc2nbWeD55MQ','PG1002');
insert into Images(image_id,link_image,reference) VALUES('I10006','https://lh3.googleusercontent.com/9jkwd6v4tgOoiRhAQkIW3UeKUpdwOILMczy5GcY8IOEc5aI5kXhdLO34UNhuG2q30_BlkpNdXTMK0T29CQUpbeldAGay8g8thn_3PnqCi56nhqjWCk1jKNo84KaK9Q_tZ8LW7PQ97g','PG1002');
insert into Images(image_id,link_image,reference) VALUES('I10007','https://lh3.googleusercontent.com/90ZGKLshSVZBRPTN_mWZtLPuEAN2PQLLF3Ng6h6FSsxBrNab9HzDMjg_xc50OUWmm8NlFgwqlykKHa5L-6ZBo06Q7ibUlfiWkUJfg2ro5BTo4Wcgtqdv7wnTjgyjGz4A7BsLt1phQA','PG1003');
insert into Images(image_id,link_image,reference) VALUES('I10008','https://lh3.googleusercontent.com/bghhtyV5tnLO5QLXpr3pNtLIxQK6eOnjWU1p3zNYBgoLbMsiPNglHX1aaoEN3NXGptSl454bqvtQw8RVXTuOap4zNl7VYm_S-uCszJCpihVN50Kze2kaVhpN5YInErM9eCknjg_m_w','PG1003');
insert into Images(image_id,link_image,reference) VALUES('I10009','https://lh3.googleusercontent.com/3LEzyR5b0QmiDzji-YN13D0lENalWzKYiMnVwZAW0_PbzzBPp7lmAZihBMCMDplo5kwybf_NvtdGD8dwrZix-OHMuN_XFNjN-PKQ0tj5y8pi6o84JHF2IW7ozUKR09fmroC2hjDFXg','PG1003');
insert into Images(image_id,link_image,reference) VALUES('I10010','https://lh3.googleusercontent.com/7Ub9oACbKPeACzP9Q7T49XjsOv2WuYdWtPZLgXiY5voe1lIiRsI_qTYFfGuGEBXGJh6zNzjWF7n2BwtXTrtrSFzr0ICvfRjwlfHPCEvxsRq9Ewov729Z9KB0F9-3x2FabYZ8-t4--A','PG1004');
insert into Images(image_id,link_image,reference) VALUES('I10011','https://lh3.googleusercontent.com/HfelBDQ8wDnC6Peso1qf7LgFP-Mezj_EwECqHDC--Lb7Ath8KImC-cvF7NmiOKW__KESDKWt0cjIsf_v8jB24omL5Gzv9xTEnDo5O-ykVNOxI3bxGQONQzTuz4fgZ7OhNLd0KRAx_g','PG1004');
insert into Images(image_id,link_image,reference) VALUES('I10012','https://lh3.googleusercontent.com/hGCIsmM3wDyR1PLL7wVuFw2kA8xeVnc1rHVPI7pSI2UJOP_ha9AzMxSyklnvblHm3KiQrS-jE7O8MHrYHc_LOm8avBzY4o8motIgTN1YbakL7BmDv1LTwKMD3eWElkZ3Xvn_6w-cNg','PG1004');
insert into Images(image_id,link_image,reference) VALUES('I10013','https://lh3.googleusercontent.com/d0CKi5PwDYN-4wvqnbKFGsol85hL9-49gdJ237ElC7AGgFTBxZFYSPgbRIGKpD49DqYnk_S3lzqcFeqSH_POa-p83CafUCoT-DjqshTdPitPz2BkD-6CaTWGkc5gVNzB9vZvOmqEXg','PG1005');
insert into Images(image_id,link_image,reference) VALUES('I10014','https://lh3.googleusercontent.com/hrJJKsE4ZdOAQNZaAKV3s3tLVvYdYerXNLGKW0eZBTmIM4xKeMWU9LhYTgikrnphjSdYs44k1289XpgT1DeX8UnfzHp8kTkQGg5WaQuIAd9q_TQcrE8W96QEtOktJOMmTTOOhcURmA','PG1005');
insert into Images(image_id,link_image,reference) VALUES('I10015','https://lh3.googleusercontent.com/GQmm--Ye96vEWN_JlXXL_Gs56AaFcHiAvYH7obgKdnnzhkUCEjnWhwdbYEQoqXiaELsbIGgLH3eFrsT188eThDR70t_hXcB-r6dgpdUusxN2wALNLucea00Zaofr1-Zs_0BRc3gqPw','PG1005');
insert into Images(image_id,link_image,reference) VALUES('I10016','https://lh3.googleusercontent.com/Qd3fxZvAiLH2MN-Ku4MTnRijCLQzvNg47rWPk2ecxv2ll9aE6z2HdZ7AM6p_Nj_LZZg47svAGt-8ELKdiiDXseuATvdty4GPNvOgPChdb3upzys6gx5BEpVjnt3SjyOUtn6agc1Gbg','PG1006');
insert into Images(image_id,link_image,reference) VALUES('I10017','https://lh3.googleusercontent.com/qNm9YMqYhDqXz5xfvL91VB-AnZgx_jE9YhOZD6AQ9fpON9xgS-RYI458ltGK02Z5ocsSZBaRYT2px8RfjDcMysYRXAtTy560ReEbYgL4p-Ak3LXq2OY3shmQKYlNdqjdmAMghq-t-A','PG1006');
insert into Images(image_id,link_image,reference) VALUES('I10018','https://lh3.googleusercontent.com/6qAtBtaX9Yblesy57WRuR0LvU6Tix9he_tdFlLRA3alMwpFVFN4VPXnycpzVYlASOU8zdVz6uIvA_38ReMX1qTN5R6ti3pVoU0DWkM955DTqDItulznx-AAyIBu_jGRebfaKXumhbA','PG1006');
insert into Images(image_id,link_image,reference) VALUES('I10019','https://lh3.googleusercontent.com/OGXDzy2CkZ-0Qq7NJcI_65A9DWELRgMOjJryKiYQFEVdx3RbHeeX009Y4VTIrATJE87XYeIqbOBJPzVYIcjrBgCnEtPKuTG0BosMkqWMCs30g_0oaJrqhJY2iOWerRhPs_f25h_x_Q','PG1007');
insert into Images(image_id,link_image,reference) VALUES('I10020','https://lh3.googleusercontent.com/fD6NtKNCrz6PqZ1yWPnjhFhcf5Hzm7Z0DxKR4DLj6DjLc5AZ5ZpgGPKUPCI0BSVS2FAtkj1djfmRGfCsXF78i1e1CGeKvy_wx53EXVuPvoRB20JRf_kW56LMMXNSrCDljTtAoKFLHw','PG1007');
insert into Images(image_id,link_image,reference) VALUES('I10021','https://lh3.googleusercontent.com/qV4gIw995FpGqRNZKtCBZc9FL4rKEU6EZN5gXfoWJDBbF8I0DYz9GFEuGM785ao-yGNuGRJVHdhuNyDIREkS7BHbTiRp-bIzIzFCQQpdXLucLR0yDBZ9yM7vb_Oc6Mu3BhuHmuOkJg','PG1007');
insert into Images(image_id,link_image,reference) VALUES('I10022','https://lh3.googleusercontent.com/W8cDlTgDmZVc6mRQ3cKHT2jmVm5m-Q87qjkPfYuQMYE6kniWCDTlYcKR_UWiXSlAgcZiYllxJNWBghrGxp0BGoNl8WZglVzJEvvCjecvfsn7KRr_cYkXvQie32UowIlAHR6JOvngVg','PG1008');
insert into Images(image_id,link_image,reference) VALUES('I10023','https://lh3.googleusercontent.com/XOzq8hJD1vrp82uhQ53DesM15Z6ezImuzsyrEFIU3YtHLfR7bU0ajOjEFH17YB7nEHiswasgymlN2ESAA9P9O36sCroAd5i2rtsybjDTk9PNWX-AQI6phwgVS4opnTBNbzV3TrN3Ow','PG1008');
insert into Images(image_id,link_image,reference) VALUES('I10024','https://lh3.googleusercontent.com/M1mam-k_i1hA4RUg7IQBE1zHMoeQ1F7qPmtzlZ6nW426J4PLXe9Vzpw8RheKJBhrmx9F-DIPrjAXT5ptrPCrV86CgGa2YdJhmHvfmAQ1garvqzZNPkH7_z3nhejiSeFGTqKiMvg1-g','PG1008');
insert into Images(image_id,link_image,reference) VALUES('I10025','https://lh3.googleusercontent.com/djZEphQnv_Ecop8YngB3cpV2QsQQaWMNZAWMms7-_CUhRmCtdr4FYCWfDJ2aVtjUUp417drRikwcNCm4OOA6LggcGLURAg2KdogPQ1lbRyw0IKEC_3pTlGILTqllwgbkjPXOg1_e2Q','PG1009');
insert into Images(image_id,link_image,reference) VALUES('I10026','https://lh3.googleusercontent.com/z7BdNxgG1lUQBIK_mlliDE2zpPUY1NbEfpyGOV2_m4NdX5WZDYS2B9WM9cIpVWC4ft6eGM3zhRM72VVn72nObWYRksibuEKSQ9Q73pXAajw_h6nB3tVc4En_Oeo6EGFkkAZnGLFnfw','PG1009');
insert into Images(image_id,link_image,reference) VALUES('I10027','https://lh3.googleusercontent.com/5u2ba6b4B7W8aYGPiOxvcZIBYXqi8TRTswaUJOQoT75QT67-b8UCRB-pKYcj6l5uq8OlYXXlgc8-_YZbPMUKGaPOM_7_Ff_37xY8DIFqC3gAaTKre2grUMrDDznuXfsCJTfkiiT6Jg','PG1009');
insert into Images(image_id,link_image,reference) VALUES('I10028','https://lh3.googleusercontent.com/yUlWDmG0u-V9Xgh1MHwvqY0AkfsSROnEnKG90C_darjdlw7gHGmdW8PP8gqDwqLt_kGb812TEzD9noT7Paant4lSM6Hbka4KFY3VRE9ktiW8KKGTAap2j-yM69j8roSPP4-0fKxWiw','PG1010');
insert into Images(image_id,link_image,reference) VALUES('I10029','https://lh3.googleusercontent.com/gp_q0VGx9cNOU3wdUWvOZJiYpGtl5R1C5qKlEh6plSwhdyfBKEdp07O_rv1SZ7cWfyEc0w-RKJYhlDjJoffB0f_jjsc8Ahm8vdgSWq0MZkW3MnmHW8K3ssGU_zrdKdYb-39XDZ0xsQ','PG1010');
insert into Images(image_id,link_image,reference) VALUES('I10030','https://lh3.googleusercontent.com/kzbJ8dzx2kS6hZBMrpHMl5BXfLKthCs-pbuMjCPWF2D_ytyFdZW0KnRHd6hYTbT4tmSzQLoJ1TgCGL9xLEW-UuUImnsfU-IuZKJM9o1qFeES3xw_QWsj6R32AcgKVWm6AHnwQAEvhg','PG1010');
insert into Images(image_id,link_image,reference) VALUES('I10031','https://lh3.googleusercontent.com/qD1bgT6QpbJCKUtl0mfdmUwxU_5xxdrtvUvNRNX5UBjHFXg9y8DdFTTKeIwFICpWjs-ylAGNaMz8lPgbRMFy_17ecTFfAstW7NnACf-srnqPHLOoRBcgIgQjDUhcP8Y7IDmHuOpj5Q','PG1011');
insert into Images(image_id,link_image,reference) VALUES('I10032','https://lh3.googleusercontent.com/lNxBFYHoSBcaeKMLSUAVQTUy70Cq2EX81uSCoEykc312vamwbgE6esiiKXXuA3UvckaHHG8BvZFRcUOLgilHnXVl5EIMFfR-Oshqe4WMRe9NJ8sLEjeSN0HDk286hBPcjYDoHuUFCg','PG1011');
insert into Images(image_id,link_image,reference) VALUES('I10033','https://lh3.googleusercontent.com/1_3H9q9zJV8EndX3ebGqb7ohr-Snd8_WkxQQDxGvtKoxiCGEFiEJjraf92pKLIc7fdNvK1r-4d93glvYUCwNrIZWAlvQc9XO5SstflTFYa38wBFJY7VhLfIYracoKnQKTqUShM63iw','PG1011');
insert into Images(image_id,link_image,reference) VALUES('I10034','https://lh3.googleusercontent.com/lFelhx8z0lpnWdYZVcRS6Wz7UCTqim4jNp19hRczc8j2ybiWfm1qPF7p6hK_HzPN-gyRcukA9GN2uwVdp-XoS-oz-i3ZSya5qVT2buHO3Umfmqb7k-dv5dGE6rpWcKfeRg_-Dafx-w','PG1012');
insert into Images(image_id,link_image,reference) VALUES('I10035','https://lh3.googleusercontent.com/BWAozduzuUpdSq3iXWCoTSfGOAF_AbZfZ4w2IWZ8Am4xZMJoREQdKGf3X8ZmnMlQWMBFp9drWF5aASy7s7UGfIKGqWcQNkgufwmqcXfHLyZxTU274Uezx16Vhk4A-dSAxijeN53uCg','PG1012');
insert into Images(image_id,link_image,reference) VALUES('I10036','https://lh3.googleusercontent.com/ZoXeqFCZ5cg_a18Wl_hqtLRTPf1EysQbQCB5RS4KCkFsNf6cOYrhlsIy9Kd_ES5CX-wxP5u7zceVkvbVn0L7KzruXAsKwz5U47gtGoQa7fB056Lhdof8EOR445wSM5Uch0T3hLjYVQ','PG1012');
insert into Images(image_id,link_image,reference) VALUES('I10037','https://lh3.googleusercontent.com/GZYMKjFY9jcQfzX1RfgMu3zX4Gv2kzyedk4MH4Rmilw2toIK-Ad22KPhuhzWfIzzMM4WkE0N9If2UADRqFDdWqRPYkr-NbkKQlOC3auTYYN8gTplfL2ae0jl_IdA3l1z9CxuBKLYLA','PG1013');
insert into Images(image_id,link_image,reference) VALUES('I10038','https://lh3.googleusercontent.com/PUUuD-eCkkHmn8KPsOy75xNKYwFWJnaHU9WDbD35Ij0zPnStiZXapdMV5aad11JR02XWCrXmCkZepy6_qCl0P0C5bQAcQeAfNNR5bfujs05Zx3CCS4nVDpYtQAim1ZSBPPRNFQP_2w','PG1013');
insert into Images(image_id,link_image,reference) VALUES('I10039','https://lh3.googleusercontent.com/gFGwbf8iAYbyuwfXSXWXfJeKgYQJ9WmqvoxZPDr1bdMxkxxbc_lpdijXH--acdcudSfhMjYrJCoRfBOyGB9QnD4d2pP2pYip04PwP2bUATXUN_M2zfeuCdGYWL7wdckxJa8ynZznlA','PG1013');
insert into Images(image_id,link_image,reference) VALUES('I10040','https://lh3.googleusercontent.com/rCehN0cgRiWd03dQrSaOMNN54KSCPbWAG71e078XKKxGC23iUbJ4QNvMj_4uzZVTwCNWJU6Mu9sfybB_Z409anLJmMN3V_-wW67DMVQBVhdBK3ufCFPU7ULicxiZMR37RkYa0D81pw','PG1014');
insert into Images(image_id,link_image,reference) VALUES('I10041','https://lh3.googleusercontent.com/fMIj3-etK2lO5cIO3_fMLuHM3eZ5Q3rT5L4cY5rpSdmnM2Tc-PVt4fVXI7BGBPDwz_QUFv67JqDEQK9Wso29ZR9hyirEG23OKZFrT64DbKYVW1eFUnGFIJvNeFqXNTa5hgzHGEYM5Q','PG1014');
insert into Images(image_id,link_image,reference) VALUES('I10042','https://lh3.googleusercontent.com/XmzvloFhP-NLi-FwR3Fni-WjR6993p-gGWpopYJZafoa30HQ7cu-5wgm0iwdoElIJSMjX6u8ULQoSyE8S4Mq-ZrI8UsNRxhq8mdv26i20gd_rPzvC2gumcGkcvhPc4vTuNLADAEtqg','PG1014');
insert into Images(image_id,link_image,reference) VALUES('I10043','https://lh3.googleusercontent.com/xnBmS1d_W_MGl7CVH79wtMzo6BisoZrb5eGqoi7zZG-ymeBa0FGsObS5Iv1Vlb7p4HOXXro0p7dvvud2HoGC-ePxQ5GslyoOmjxEO3-wu7B2pbOyY_7_jTzBilzCmCloKvNtcaF91A','PG1015');
insert into Images(image_id,link_image,reference) VALUES('I10044','https://lh3.googleusercontent.com/vKaRdgaNCmfcVfptNN4Ej3GrFOFzzhblgFZlsbAkzodmdZoP97l0QMr_sboq1jblnehI1E2q8HA3KUFhK-LpfmpyERgrfQdBo4H2IrjbdbO5eYcw03zm_QaBSkOZEcVKLRMR8bLI8Q','PG1015');
insert into Images(image_id,link_image,reference) VALUES('I10045','https://lh3.googleusercontent.com/yxOIMHGOmxmIjy8j0PXJ0JNVLMNLtUsS6ZYCncSDcTjNeIdOH5QKXUIF_r8iiF5e00jFvnngMOrzuvlUw0XFJgDUep4cmZZfng-yS9IA-I9DzXny-okvMypIPig6g3vGZRQF4BkgLg','PG1015');
insert into Images(image_id,link_image,reference) VALUES('I10046','https://lh3.googleusercontent.com/O0me3T5sLKkw9BwEeG25wYO4TJOYq2Rl5Ug2IUsRcjfzMCp-uXG5gg8xTD9pIirIR1on9m4HbP96t-QUnhZcaOJ7w2EjprsEj3w8JrYob5h0BGv6yYQN9OiUIsjiAkyl8K4JIiW8Qw','PG1016');
insert into Images(image_id,link_image,reference) VALUES('I10047','https://lh3.googleusercontent.com/FV-bmLPyZrN_qJGzdgzYat03UN5Acdmlqxs4_NtSmP1P9qX1MayzhQIt18MvWrWqKlPcAZj8FzOLTt6T6gOwFkrTqJ1cX9P4f6cQBI65z6cq1N5bHZERUipUIGm3_xK-aH9uPMfQLg','PG1016');
insert into Images(image_id,link_image,reference) VALUES('I10048','https://lh3.googleusercontent.com/VO4AOdXm-j2yDd00VbNcTitPnXvW4yEQpqmZgoULp46ODK8X3lPm3__mqp6jGjPKL2w9I9TtVCsrOk6todaoszTExqGZRqwSr2-0nLkmTZSmBmo9fW4-pZR5X_mPcthqey8wQZq5pQ','PG1016');
insert into Images(image_id,link_image,reference) VALUES('I10049','https://lh3.googleusercontent.com/fyxH3TGAaWIM26kjOWzuRqQdrEuNj3ouQk0hKZ-oVRR3cEpgXmMw2Zts6KZksEudYNlxSWvsouSUlssVqf92Xh4G1pbeGWd0IWuwv-RZpHXz2qm1Z9iLChKAfj36Now6kv5mfGO2OQ','PG1017');
insert into Images(image_id,link_image,reference) VALUES('I10050','https://lh3.googleusercontent.com/oYZUigDSZsN1w3vsCXpe4xN2m0qt5JisdO-13RXEdg3zENiLXTLuXZd1ScrEetEqLRvB_33WqsahcKGcUAyyi-d2xYlY6kDpALXRkBGrBCQ6PqKigVEQDISGA91na3-MnnuU3FYG6g','PG1017');
insert into Images(image_id,link_image,reference) VALUES('I10051','https://lh3.googleusercontent.com/YWznG7ZjusYvWeJYZMsqKfq4a8V-0qsTX23ohjKiogP1NnswVLohPY2vgDWUdL643yXkpVdjVNqKVTcJjeuUUxT7EbSauvz-gNuKt249sZW61YzjZcHMyS2m_0cNyywu325T7hZvCQ','PG1017');
insert into Images(image_id,link_image,reference) VALUES('I10052','https://lh3.googleusercontent.com/fjcEc9up1echYJbectE1EgeI--6-vyVhJXgVJ1U7RIwx8pfZs1_DMPC6taCkXMsnQdoivnSozlohSvv5ZV2s6ZurxOCuu-WoP_coDvZ2391aI2gQbDIBFNSTDz0_Wm4J9XePwI14WQ','PG1018');
insert into Images(image_id,link_image,reference) VALUES('I10053','https://lh3.googleusercontent.com/zKC963X20KgWdSb6QhmSFnCkNOQpKW-8dUHeAgOzvVDM4dE0EXsbjPbaXdDAA17mAN6tKnHw1UhPCgWWqnJi7PvPo659XTe-FQNPKkvphlKum0fKTdBVDLXcOQ8VCcdigO1JKzPr9Q','PG1018');
insert into Images(image_id,link_image,reference) VALUES('I10054','https://lh3.googleusercontent.com/ZahSs_T3HRzsyQu8YxdsuEuQhNITLAXGYsvBvZcapgaNXp4KPcTp1EwSESaPT8884JRMNyfV6ID6BUdz4QinpWc9BB7aEQXtod0qdQQm2J4s1ccKrw_cZ1XElJZyfh9c8f7_pf73RA','PG1018');
insert into Images(image_id,link_image,reference) VALUES('I10055','https://lh3.googleusercontent.com/I9CYcc7J9r2S8oN3yx4gfxP1mM2Y_a_at5qeuw8_iFWZfgLdwR4v78hizBCiaSex9VR5a10xslEA-r72V3x2FfQ-hPkstix_ohtToNm8tBc8eCRoNt9ViJvsNzeaczIzoImodCezlQ','PG1019');
insert into Images(image_id,link_image,reference) VALUES('I10056','https://lh3.googleusercontent.com/viDmvhI6mwlrV1qaI1Me2o1L9F_bPqHLCUM9gs3FyCvUxnN-9BaEY_8Ewea2y-WCwNmcaKAEA9BPj6itYSuZBRe-93AAUfuAlViGAnkUOSQpqhdURugjZZs9F7ndQHX24trTEQYwOg','PG1019');
insert into Images(image_id,link_image,reference) VALUES('I10057','https://lh3.googleusercontent.com/vXKdzGVQLGDX3y-CjYF1Z_dzRqcXa5lB9iL_x7HFuy-9Ijo-Z26PBRR0Q9WmA46KW4zFciPj7USyHLpT6n0exRo_ZwpX6T6xiGVrSkPiDvqxXdidI_bxNxvNHYqSCmdIgf1KC6uWrw','PG1019');
insert into Images(image_id,link_image,reference) VALUES('I10058','https://lh3.googleusercontent.com/tNGrupdYOx7gfp6p7UNGpGzmfueHRakbK5H9RqPhBieUstRKHw1s6jaOGTeImD6mEuH5xXDHTiISYaiicLnwYsL8pB9eEPGsIAh-B62MPJZB_kH1-XVcaEANkVsENcITcvI2xZr3eQ','PG1020');
insert into Images(image_id,link_image,reference) VALUES('I10059','https://lh3.googleusercontent.com/sq0yTKGWL_VKtDMIlTF9LRodCPeIFG7N2EwUfLIvcIOhyJRqm1cgfpsgrR6alNuCIYbf02xoVE9hfg4qzd8S05HYcYXvFqlcChwhokcYfA_uFgyPRQT3dgGACMfs-qW-h9osGD0FyA','PG1020');
insert into Images(image_id,link_image,reference) VALUES('I10060','https://lh3.googleusercontent.com/6YLmCxLG4IdiTUh0ZFK2l26oD1HrNjCU9j00DHKqia0ZV2KRvkB7MP0WZJDcaZY2-d4wzBsj7W5KJjLS2XER1AeJ4cV4eVdi8HZtCRVTmVgNq0sZqG1ZoGX-xergAcW5XmPG-fU_tA','PG1020');
insert into Images(image_id,link_image,reference) VALUES('I10061','https://lh3.googleusercontent.com/Sbsm_4-X9J0RdN1XoKpHOuh5meFF4R3RP3ASJPhH7XNeufxuD6ssNTwqkOjt2QfW3RaJgYjJVHg2RdeCLBOX9IMIVLzoi3ksQk9_f5ljMTfFlvaDPPydkWN5ypa1IltCBNUS6ka3RQ','PG1021');
insert into Images(image_id,link_image,reference) VALUES('I10062','https://lh3.googleusercontent.com/sIK7zlQLbqq-vuxCBJ3qCCFIcXNE3zg6PL6pkblL9JFKInRgq_F7aZ2ubtWYIn7_vYTvCrzI0RbA5MkV02V2zThZLi6C7Oj4xzz158RWKAPtmYDAkgmnBixOycyzUKKisgsgTB63JQ','PG1021');
insert into Images(image_id,link_image,reference) VALUES('I10063','https://lh3.googleusercontent.com/_Ot07GraRJbgKCUO-ojgKZu5qrjZHapItnjEGzk3Zc83pZsz2UgZi9ePhmrBmVGQBdbrFB29V575WLxkqsa2eC9xmcLq4O3n3agrnkzspuD8CnyMdM1YDIAY223PRcfzyzQYITDN4w','PG1021');
insert into Images(image_id,link_image,reference) VALUES('I10064','https://lh3.googleusercontent.com/8CDcxpD8TKS1-I-_jOZeyP6hhlTK6_5Zvn8pB9ZKZ_l_G1E4weecevmuaGH6K_P5zBeOk8yrv8t2f8ytDa2Mc7xLBB5ZBVGJJuAaWjkLRvXxXTQsc2DB1WLh8iMPh1qopPx2L_gkhw','PG1022');
insert into Images(image_id,link_image,reference) VALUES('I10065','https://lh3.googleusercontent.com/krGwXG3VsVR1XBSKckT5eDFdQ4RewpmJkr6MPX4W3HNkyikL1aAV2DWS1W-66wt-Narp3Rfj5WnQYAXBS1HFrDitePFf_OBWfZnVMWEVnODKUA8nA4vxO2HPFoMEy9GmwE3kUtYZHg','PG1022');
insert into Images(image_id,link_image,reference) VALUES('I10066','https://lh3.googleusercontent.com/8GomOWOkjS8E7xlnCdVK-Kex_vGeT9R3zkcE-mrc2mYjWOsEofvHw24W4xd5Zohc21_7pxE1DbyK6VM2XKItEcwSmWaiT8J8fTj5sQ0e8k0Hn1AMQFyuVkkWHpKRlVHZeMaEzVAZVw','PG1022');
insert into Images(image_id,link_image,reference) VALUES('I10067','https://lh3.googleusercontent.com/H6iOI1WohNM4W6lSZNWmAg9H3prTJtFGmDQV7CWW1N3UTsw0OsW4lXYvK1YXCOtX_AsY8vNE8vCZ55-3gFkLgwLLwlmUtnXtqTMNMqyB9_s_pcEsSHJ_fMLNWPExh7DiLw8m3KWeDA','PG1023');
insert into Images(image_id,link_image,reference) VALUES('I10068','https://lh3.googleusercontent.com/9euZ3TYk-ObIF3-lXcYFfBfEVF4xQ55UkgEHk56R4G0oRpetV8XLYApkW3cJ2ec4b_TxTjD_5SK2zqqbOJxmdfJixgGnkNH9UIY776bljECtiRMgN_hLXJA0p1-QklNkXsPJ_uYb9Q','PG1023');
insert into Images(image_id,link_image,reference) VALUES('I10069','https://lh3.googleusercontent.com/6mvToPGB_jW-Vo5-ve71rJgXN3UxGWBEafO2SKgpU48qM5OrK-_LXzqnKXFYHH0VBrxjONaLLnib7508A9I7ld8Q4NP4SxroITBUesUoGgHa4vkTkg_661LOyDClVBQ_hVw-3BnhTA','PG1023');
insert into Images(image_id,link_image,reference) VALUES('I10070','https://lh3.googleusercontent.com/wRto43U_zDTaXk_ebg4n6sIhELth5ICnnX3tfao4qKZ8XstkYBYtPhGhMnY-U2Hdcm-IHmh-hbjrg5vgtHYxuqUzlsNqWOmRPguKIqctZrydVTBFm14RovqCt7pZpqMwQQYPbnscRA','PG1024');
insert into Images(image_id,link_image,reference) VALUES('I10071','https://lh3.googleusercontent.com/4UIgVZ6z6jAW1zX5bg9Ia2TgoPiqEgznXeACS6-wO44_UxHYCtXSbsOZwKhe0T0P-m7bHM6ulXY9dHVC3pC5FdS_GnYdkTDhjq3ulG9lHGZYWLJ-BSKGnFtVne3KtO6HmWDYG5RQog','PG1024');
insert into Images(image_id,link_image,reference) VALUES('I10072','https://lh3.googleusercontent.com/y7lsMqVMF2mUXs58NjbHuD_9yxNoT8aYk5uMUYGnG2n3gnrFW1e7FbfgM4Pv3piaSjrTwuPNoxHUvD8Z0emAp6GAGk-ED_mauCiszkIPKr1ogmeRMis7DPuVCVtQUEgt2Mfa8w4tFQ','PG1024');



