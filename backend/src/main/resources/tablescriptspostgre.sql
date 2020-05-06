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


CREATE type size_type AS ENUM ('s','m','l');
create type sex_type as enum ('m','f');
create type category_type as ENUM('shirt','tshirt','jeans','skirts','tops','trousers'),
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

CREATE TYPE rating_type AS ENUM ('one','two','three','four','five');
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
);

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

insert into Product VALUES('P10001' ,'cool shirt 1' ,1359.0,'s','m','shirt','PG1001',65,current_timestamp);
insert into Product VALUES('P10002' ,'cool shirt 1' ,1359.0,'m','m','shirt','PG1001',73,current_timestamp);
insert into Product VALUES('P10003' ,'cool shirt 1' ,1359.0,'l','m','shirt','PG1001',45,current_timestamp);
insert into Product VALUES('P10004' ,'cool shirt 2' ,1769.0,'s','m','shirt','PG1002',60,current_timestamp);
insert into Product VALUES('P10005' ,'cool shirt 2' ,1769.0,'m','m','shirt','PG1002',51,current_timestamp);
insert into Product VALUES('P10006' ,'cool shirt 2' ,1769.0,'l','m','shirt','PG1002',78,current_timestamp);
insert into Product VALUES('P10007' ,'cool shirt 3' ,2134.0,'s','f','shirt','PG1003',53,current_timestamp);
insert into Product VALUES('P10008' ,'cool shirt 3' ,2134.0,'m','f','shirt','PG1003',8,current_timestamp);
insert into Product VALUES('P10009' ,'cool shirt 3' ,2134.0,'l','f','shirt','PG1003',73,current_timestamp);
insert into Product VALUES('P10010' ,'cool shirt 4' ,2500.0,'s','f','shirt','PG1004',37,current_timestamp);
insert into Product VALUES('P10011' ,'cool shirt 4' ,2500.0,'m','f','shirt','PG1004',66,current_timestamp);
insert into Product VALUES('P10012' ,'cool shirt 4' ,2500.0,'l','f','shirt','PG1004',55,current_timestamp);
insert into Product VALUES('P10013' ,'osm t-shirt 1' ,1267.0,'s','m','tshirt','PG1005',32,current_timestamp);
insert into Product VALUES('P10014' ,'osm t-shirt 1' ,1267.0,'m','m','tshirt','PG1005',72,current_timestamp);
insert into Product VALUES('P10015' ,'osm t-shirt 1' ,1267.0,'l','m','tshirt','PG1005',44,current_timestamp);
insert into Product VALUES('P10016' ,'osm t-shirt 2' ,1985.0,'s','m','tshirt','PG1006',23,current_timestamp);
insert into Product VALUES('P10017' ,'osm t-shirt 2' ,1985.0,'m','m','tshirt','PG1006',78,current_timestamp);
insert into Product VALUES('P10018' ,'osm t-shirt 2' ,1985.0,'l','m','tshirt','PG1006',19,current_timestamp);
insert into Product VALUES('P10019' ,'osm t-shirt 3' ,2206.0,'s','f','tshirt','PG1007',29,current_timestamp);
insert into Product VALUES('P10020' ,'osm t-shirt 3' ,2206.0,'m','f','tshirt','PG1007',38,current_timestamp);
insert into Product VALUES('P10021' ,'osm t-shirt 3' ,2206.0,'l','f','tshirt','PG1007',65,current_timestamp);
insert into Product VALUES('P10022' ,'osm t-shirt 4' ,2610.0,'s','f','tshirt','PG1008',69,current_timestamp);
insert into Product VALUES('P10023' ,'osm t-shirt 4' ,2610.0,'m','f','tshirt','PG1008',45,current_timestamp);
insert into Product VALUES('P10024' ,'osm t-shirt 4' ,2610.0,'l','f','tshirt','PG1008',23,current_timestamp);
insert into Product VALUES('P10025' ,'cute jeans 1' ,2267.0,'s','m','jeans','PG1009',32,current_timestamp);
insert into Product VALUES('P10026' ,'cute jeans 1' ,2267.0,'m','m','jeans','PG1009',64,current_timestamp);
insert into Product VALUES('P10027' ,'cute jeans 1' ,2267.0,'l','m','jeans','PG1009',10,current_timestamp);
insert into Product VALUES('P10028' ,'cute jeans 2' ,2985.0,'s','m','jeans','PG1010',32,current_timestamp);
insert into Product VALUES('P10029' ,'cute jeans 2' ,2985.0,'m','m','jeans','PG1010',22,current_timestamp);
insert into Product VALUES('P10030' ,'cute jeans 2' ,2985.0,'l','m','jeans','PG1010',20,current_timestamp);
insert into Product VALUES('P10031' ,'cute jeans 3' ,3206.0,'s','f','jeans','PG1011',33,current_timestamp);
insert into Product VALUES('P10032' ,'cute jeans 3' ,3206.0,'m','f','jeans','PG1011',71,current_timestamp);
insert into Product VALUES('P10033' ,'cute jeans 3' ,3206.0,'l','f','jeans','PG1011',39,current_timestamp);
insert into Product VALUES('P10034' ,'cute jeans 4' ,3610.0,'s','f','jeans','PG1012',53,current_timestamp);
insert into Product VALUES('P10035' ,'cute jeans 4' ,3610.0,'m','f','jeans','PG1012',45,current_timestamp);
insert into Product VALUES('P10036' ,'cute jeans 4' ,3610.0,'l','f','jeans','PG1012',65,current_timestamp);
insert into Product VALUES('P10037' ,'hot tops 1' ,3015.0,'s','f','tops','PG1013',67,current_timestamp);
insert into Product VALUES('P10038' ,'hot tops 1' ,3015.0,'m','f','tops','PG1013',34,current_timestamp);
insert into Product VALUES('P10039' ,'hot tops 1' ,3015.0,'l','f','tops','PG1013',22,current_timestamp);
insert into Product VALUES('P10040' ,'hot tops 2' ,2975.0,'s','f','tops','PG1014',19,current_timestamp);
insert into Product VALUES('P10041' ,'hot tops 2' ,2975.0,'m','f','tops','PG1014',66,current_timestamp);
insert into Product VALUES('P10042' ,'hot tops 2' ,2975.0,'l','f','tops','PG1014',32,current_timestamp);
insert into Product VALUES('P10043' ,'hot tops 3' ,2681.0,'s','f','tops','PG1015',62,current_timestamp);
insert into Product VALUES('P10044' ,'hot tops 3' ,2681.0,'m','f','tops','PG1015',58,current_timestamp);
insert into Product VALUES('P10045' ,'hot tops 3' ,2681.0,'l','f','tops','PG1015',49,current_timestamp);
insert into Product VALUES('P10046' ,'hot tops 4' ,3256.0,'s','f','tops','PG1016',43,current_timestamp);
insert into Product VALUES('P10047' ,'hot tops 4' ,3256.0,'m','f','tops','PG1016',6,current_timestamp);
insert into Product VALUES('P10048' ,'hot tops 4' ,3256.0,'l','f','tops','PG1016',37,current_timestamp);
insert into Product VALUES('P10049' ,'sexy skirt 1' ,1782.0,'s','f','skirts','PG1017',45,current_timestamp);
insert into Product VALUES('P10050' ,'sexy skirt 1' ,1782.0,'m','f','skirts','PG1017',59,current_timestamp);
insert into Product VALUES('P10051' ,'sexy skirt 1' ,1782.0,'l','f','skirts','PG1017',25,current_timestamp);
insert into Product VALUES('P10052' ,'sexy skirt 2' ,1803.0,'s','f','skirts','PG1018',48,current_timestamp);
insert into Product VALUES('P10053' ,'sexy skirt 2' ,1803.0,'m','f','skirts','PG1018',38,current_timestamp);
insert into Product VALUES('P10054' ,'sexy skirt 2' ,1803.0,'l','f','skirts','PG1018',77,current_timestamp);
insert into Product VALUES('P10055' ,'sexy skirt 3' ,1506.0,'s','f','skirts','PG1019',46,current_timestamp);
insert into Product VALUES('P10056' ,'sexy skirt 3' ,1506.0,'m','f','skirts','PG1019',78,current_timestamp);
insert into Product VALUES('P10057' ,'sexy skirt 3' ,1506.0,'l','f','skirts','PG1019',9,current_timestamp);
insert into Product VALUES('P10058' ,'sexy skirt 4' ,1410.0,'s','f','skirts','PG1020',12,current_timestamp);
insert into Product VALUES('P10059' ,'sexy skirt 4' ,1410.0,'m','f','skirts','PG1020',54,current_timestamp);
insert into Product VALUES('P10060' ,'sexy skirt 4' ,1410.0,'l','f','skirts','PG1020',32,current_timestamp);
insert into Product VALUES('P10061' ,'gym trousers 1' ,1359.0,'s','m','trousers','PG1021',47,current_timestamp);
insert into Product VALUES('P10062' ,'gym trousers 1' ,1359.0,'m','m','trousers','PG1021',7,current_timestamp);
insert into Product VALUES('P10063' ,'gym trousers 1' ,1359.0,'l','m','trousers','PG1021',62,current_timestamp);
insert into Product VALUES('P10064' ,'gym trousers 2' ,1769.0,'s','m','trousers','PG1022',25,current_timestamp);
insert into Product VALUES('P10065' ,'gym trousers 2' ,1769.0,'m','m','trousers','PG1022',72,current_timestamp);
insert into Product VALUES('P10066' ,'gym trousers 2' ,1769.0,'l','m','trousers','PG1022',13,current_timestamp);
insert into Product VALUES('P10067' ,'gym trousers 3' ,2134.0,'s','f','trousers','PG1023',50,current_timestamp);
insert into Product VALUES('P10068' ,'gym trousers 3' ,2134.0,'m','f','trousers','PG1023',23,current_timestamp);
insert into Product VALUES('P10069' ,'gym trousers 3' ,2134.0,'l','f','trousers','PG1023',52,current_timestamp);
insert into Product VALUES('P10070' ,'gym trousers 4' ,2500.0,'s','f','trousers','PG1024',49,current_timestamp);
insert into Product VALUES('P10071' ,'gym trousers 4' ,2500.0,'m','f','trousers','PG1024',35,current_timestamp);
insert into Product VALUES('P10072' ,'gym trousers 4' ,2500.0,'l','f','trousers','PG1024',54,current_timestamp);

insert into Review VALUES('R1001','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10001');
insert into Review VALUES('R1002','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10001' );
insert into Review VALUES('R1003' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10001' );
insert into Review VALUES('R1004' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10001');
insert into Review VALUES('R1005' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10001');
insert into Review VALUES('R1006' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10001');
insert into Review VALUES('R1007' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10001');
insert into Review VALUES('R1008' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10001');
insert into Review VALUES('R1009' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10001');
insert into Review VALUES('R1010' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10001');
insert into Review VALUES('R1011','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10015');
insert into Review VALUES('R1012','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10015' );
insert into Review VALUES('R1013' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10015' );
insert into Review VALUES('R1014' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10015');
insert into Review VALUES('R1015' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10015');
insert into Review VALUES('R1016' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10015');
insert into Review VALUES('R1017' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10015');
insert into Review VALUES('R1018' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10015');
insert into Review VALUES('R1019' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10015');
insert into Review VALUES('R1020' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10015');
insert into Review VALUES('R1021','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10065');
insert into Review VALUES('R1022','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10065' );
insert into Review VALUES('R1023' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10065' );
insert into Review VALUES('R1024' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10065');
insert into Review VALUES('R1025' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10065');
insert into Review VALUES('R1026' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10065');
insert into Review VALUES('R1027' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10065');
insert into Review VALUES('R1028' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10065');
insert into Review VALUES('R1029' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10065');
insert into Review VALUES('R1030' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10065');
insert into Review VALUES('R1031','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10053');
insert into Review VALUES('R1032','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10053' );
insert into Review VALUES('R1033' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10053' );
insert into Review VALUES('R1034' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10053');
insert into Review VALUES('R1035' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10053');
insert into Review VALUES('R1036' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10053');
insert into Review VALUES('R1037' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10039');
insert into Review VALUES('R1038' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10039');
insert into Review VALUES('R1039' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10039');
insert into Review VALUES('R1040' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10039');
insert into Review VALUES('R1041','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10005');
insert into Review VALUES('R1042','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10005' );
insert into Review VALUES('R1043' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10005' );
insert into Review VALUES('R1044' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10005');
insert into Review VALUES('R1045' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10005');
insert into Review VALUES('R1046' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10011');
insert into Review VALUES('R1047' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10011');
insert into Review VALUES('R1048' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10011');
insert into Review VALUES('R1049' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10011');
insert into Review VALUES('R1050' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10011');
insert into Review VALUES('R1051','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10061');
insert into Review VALUES('R1052','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10061' );
insert into Review VALUES('R1053' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10061' );
insert into Review VALUES('R1054' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10021');
insert into Review VALUES('R1055' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10021');
insert into Review VALUES('R1056' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10021');
insert into Review VALUES('R1057' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10021');
insert into Review VALUES('R1058' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10026');
insert into Review VALUES('R1059' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10026');
insert into Review VALUES('R1060' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10026');
insert into Review VALUES('R1061','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10072');
insert into Review VALUES('R1062','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10072' );
insert into Review VALUES('R1063' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10072' );
insert into Review VALUES('R1064' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10072');
insert into Review VALUES('R1065' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10072');
insert into Review VALUES('R1066' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10044');
insert into Review VALUES('R1067' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10044');
insert into Review VALUES('R1068' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10044');
insert into Review VALUES('R1069' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10044');
insert into Review VALUES('R1070' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10044');
insert into Review VALUES('R1071','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10031');
insert into Review VALUES('R1072','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10031' );
insert into Review VALUES('R1073' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10031' );
insert into Review VALUES('R1074' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10031');
insert into Review VALUES('R1075' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10031');
insert into Review VALUES('R1076' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10031');
insert into Review VALUES('R1077' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10031');
insert into Review VALUES('R1078' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10031');
insert into Review VALUES('R1079' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10031');
insert into Review VALUES('R1080' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10031');
insert into Review VALUES('R1081','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10035');
insert into Review VALUES('R1082','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10035' );
insert into Review VALUES('R1083' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10035' );
insert into Review VALUES('R1084' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10035');
insert into Review VALUES('R1085' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10035');
insert into Review VALUES('R1086' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10048');
insert into Review VALUES('R1087' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10048');
insert into Review VALUES('R1088' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10048');
insert into Review VALUES('R1089' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10048');
insert into Review VALUES('R1090' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10048');
insert into Review VALUES('R1091','Great Quality','nice product will get the same set for my friend for twinning','five',6, current_timestamp, 'U1004' ,'P10068');
insert into Review VALUES('R1092','Superb' ,'Thanks tee store','five',9, current_timestamp, 'U1002','P10068' );
insert into Review VALUES('R1093' ,'Good fitting','perfect fitting and best quality','five',3, current_timestamp, 'U1001','P10068' );
insert into Review VALUES('R1094' ,'Worth for the price','above average','four',4, current_timestamp, 'U1009','P10068');
insert into Review VALUES('R1095' ,'Thumbs up','nice work done tee store','four',5, current_timestamp, 'U1008','P10068');
insert into Review VALUES('R1096' ,'Value for money','better for the price range','three',0, current_timestamp, 'U1003','P10068');
insert into Review VALUES('R1097' ,'Size is big','very nice but a little big','three',6, current_timestamp, 'U1005','P10068');
insert into Review VALUES('R1098' ,'Not satisfied','late delivery and color was much different than what it looked online','two',0, current_timestamp, 'U1007','P10068');
insert into Review VALUES('R1099' ,'Not appealing','an ordinary product not so appealing','two',1, current_timestamp, 'U1008','P10068');
insert into Review VALUES('R1100' ,'Extremely bad','got a defective one','one',0, current_timestamp, 'U1006','P10068');

insert into Contact VALUES('C101' ,'willsmit@gmail.com', '7329837629' ,'Nice Website','good products satisfied',null);
insert into Contact VALUES('C102' ,'ivan@hotmail.com' , '6373838291', 'less varities','less products to chose from',null);
insert into Contact VALUES('C103' ,'tony@stark.com', '8875632142', 'Quality is awesome' ,'will buy again', 'U1002');
insert into Contact VALUES('C104' ,'banner@Uv.com' ,'8882039476','want more varities','in different colors and different styles','U1004');

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