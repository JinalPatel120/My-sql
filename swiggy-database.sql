
use Swiggy;

create table User (
user_id VARCHAR(36) DEFAULT (UUID()) PRIMARY KEY,
user_name varchar(50) not null,
phone_number varchar(10) not null unique,
password varchar(50) not null,
email varchar(50) not null unique,
address varchar(100) not null,
created_at timestamp default current_timestamp,
status enum('active','inactive') default 'active');

insert into User( user_id,user_name,phone_number,password,email,address) 
values
('U03','hina lathiya','7354425415','Jinal@12','hina@gmail.com','Baroda'),
('U04','poorvi vithani','4563734389','dixit@29','poorvi@gmail.com','surat'),
('U05','komal kukadiya','4356787654','komal@1','komal@gmail.com','mumbai');



create table Restaurant(
rest_id varchar(36) default(UUID()) primary key,
rest_name varchar(50) not null,
rest_phone_number varchar(10) not null,
rest_email varchar(50) not null,
address varchar(50) not null,
city varchar(50) not null,
is_accepting_order enum('True','False') DEFAULT 'True',
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp );


insert into Restaurant ( rest_id , rest_name , rest_phone_number, rest_email, address , city) values
( 'R05' , 'maruti suzuki' ,'9083254321','marutisuzuki@gmail.com', 'vaghavadi', 'Baroda'),
('R06','9834 fruit shake','5476543215','9834@gmail.com','banasakandha','porbandar'),
('R07','rk center','5643728876','rkcenter@gmail.com','mota varachha','surat');


create table Restaurant_timing(
res_id varchar(36) default(UUID()) primary key,
rest_id varchar(36) not null,
week_day varchar(50) not null,
start_time time not null,
end_time time not null ,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
foreign key(rest_id) references Restaurant(rest_id));

insert into Restaurant_timing (
res_id,rest_id,week_day,start_time,end_time)
values
(
'RT05','R04','5', '09:00:00','22:00:00'),
('RT06','R03', '7','9:00:00','24:00:00'),
('RTO7','R07','67','10:00:00','23:00:00');


create table Menu_categories(
menu_id varchar(36) default(UUID()) primary key,
cat_name varchar(50) not null, 
status varchar(50) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);


insert into Menu_categories (menu_id,cat_name,status)
values
('M05','parathas','accepted'),
('M06','combo','not accpted'),
('M07','chaats','accepted');


create table Menu_item(
menu_item_id varchar(36) default (UUID()) primary key,
rest_id varchar(36) not null,
menu_id varchar(36) not null,
item_name varchar(50) not null,
description varchar(100) not null,
image_name varchar(50) not null,
price int not null,
status varchar(50) not null,
foreign key(rest_id) references Restaurant(rest_id),
foreign key(menu_id) references Menu_categories(menu_id));

insert into Menu_item( menu_item_id,rest_id,menu_id,item_name,description,image_name,price,status)
values
('MI05','R02','M02','aloo paratha','parathas with cheese','paratha',120,'accepted'),
('MI06','R03','M03','jeera-rice combo','served with jeera raice and dry fry','combo',220,'accepted'),
('MI07','R04','M04','sevpuri','served with chutny','chaats',70,'accepted');


create table Cart(
cart_id varchar(36) default (UUID()) primary key,
user_id varchar(36) not null,
menu_item_id varchar(36) not null,
quantity int not null,
created_at timestamp,
foreign key(user_id) references User(user_id),
foreign key(menu_item_id) references Menu_item(menu_item_id));

insert into Cart(cart_id,user_id,menu_item_id,quantity)
values
('C03','U03','MI03',2);

create table Orders(
order_id varchar(36) default (UUID()) primary key,
user_id varchar(36) not null,
rest_id varchar(36) not null,
cart_id varchar(36) not null,
total_amount decimal(10,2) not null,
discount_amount int null,
discount_rate int null,
delivery_charges int not null,
tax_amount int not null,
net_amount decimal(10,2) not null,
status varchar(50) not null,
created_at timestamp ,
foreign key(rest_id) references Restaurant(rest_id),
foreign key (user_id) references User(user_id),
foreign key (cart_id) references Cart(cart_id) );


insert into Orders( order_id,user_id,rest_id,cart_id,total_amount,delivery_charges,tax_amount,net_amount,status)
values
('O01','U03','R02','C02',400,50,20,470,'pending');


create table Dineinreservations (
reservation_id varchar(36) default (UUID ()) primary key,
user_id varchar(36) not null,
rest_id varchar(36) not null,
reservation_date date not null,
no_of_people int not null,
status varchar(50) not null,
foreign key(user_id) references User(user_id),
foreign key(rest_id) references Restaurant(rest_id)
);


insert into Dineinreservations(reservation_id,user_id,rest_id,reservation_date,no_of_people,status)
values
('DR01','U04','R03','2024-5-7',10,'registration success');


select * from Orders;

create table Payment (
payment_id varchar(36) default(UUID()) primary key,
user_id varchar(36) not null,
Amount int not null,
Payment_method varchar(50) not null,
status ENUM('completed', 'pending', 'failed') NOT NULL,
payment_date date not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
foreign key(user_id) references User(user_id)
);


insert into Payment(payment_id,user_id,Amount,Payment_method,status,payment_date)
values
('P01','U03',470,'Cash on Delivery','completed','2024-9-9');


create table Payment_junction(
payment_junction_id varchar(36) primary key,
payment_id varchar(36) not null,
service_type ENUM('Instamart', 'Genie', 'FoodDelivery') NOT NULL,
order_id varchar(36) null,
insta_order_id varchar(36) null,
request_id varchar(36) null,
amount DECIMAL(10,2) NOT NULL,
description VARCHAR(100),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),
foreign key(order_id) references Orders(order_id),
foreign key(insta_order_id) references Insta_order(insta_order_id),
foreign key(request_id) references GenieRequest(request_id)
);

insert into Payment_junction( payment_junction_id , payment_id,service_type,order_id,amount,description)
values
('PJ01','P01','FoodDelivery','O01',470,'amount was paid by user');

create table Review(
review_id varchar(36) default(UUID()) primary key,
user_id varchar(36) not null,
rest_id varchar(36) not null,
rating varchar(5) not null,
comment varchar(100) null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
foreign key(user_id) references User(user_id),
foreign key(rest_id) references Restaurant(rest_id));


insert into Review(review_id,user_id,rest_id,rating,comment)
values
('RE01','U03','R03',5,'service and food was delicious');


create table GenieRequest(
request_id varchar(36) default(UUID()) primary key,
user_id varchar(36) not null,
pickup_location varchar(100) not null,
dropoff_location varchar(100) not null,
item_description varchar(50) null,
request_status varchar(50) not null,
request_date date not null,
delivery_charges decimal(10,2) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
foreign key(user_id) references User(user_id)
);

insert into GenieRequest( request_id,user_id,pickup_location,dropoff_location,item_description,request_status,request_date,delivery_charges)
values
('GR01','U03','Satellite','Sola','small package','accepted','2024-4-4',80);

select * from GenieRequest;
create table Delivery_person(
delivery_id varchar(36) default (UUID()) primary key,
d_name varchar(36) not null,
d_phone varchar(36) not null,
d_email varchar(50) not null,
vehicle_no varchar(50) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp);


insert into Delivery_person ( delivery_id,d_name,d_phone,d_email,vehicle_no) values
('DP02','rakesh bhai','9873243456','rakesh@gmail.com','GJ045299'),
('DP03','Rahul Bhai', '6745367908','rahulbhai@gmail.com','GJ013423');


CREATE TABLE Order_assignment (
    assignment_id VARCHAR(36) PRIMARY KEY,
    delivery_id VARCHAR(36) NOT NULL,
    order_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (delivery_id) REFERENCES Delivery_person(delivery_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

insert into Order_assignment(assignment_id,delivery_id,order_id)
values
('OA02','DP02','O01');

CREATE TABLE Genie_assignment (
    assignment_id VARCHAR(36) PRIMARY KEY,
    delivery_id VARCHAR(36) NOT NULL,
    request_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (delivery_id) REFERENCES Delivery_person(delivery_id),
    FOREIGN KEY (request_id) REFERENCES GenieRequest(request_id)
);

insert into Genie_assignment(assignment_id,delivery_id,request_id)
values
('GA01','DP02','GR01');


create table Product(
product_id varchar(36) default(UUID()) primary key,
product_name varchar(50) not null,
product_description varchar(1000) not null,
product_price int (50) not null,
product_category varchar(50) not null,
product_stock int(50) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp);


insert into Product(product_id,product_name,product_description,product_price,product_category,product_stock)
values
('P01','electric appliance','its good electic kattle with less electricity conductor',4000,'electric',20);


create table Insta_cart(
insta_cart_id varchar(50) default(UUID()) primary key,
user_id varchar(50) not null,
product_id varchar(50) not null,
quantity int(50) not null,
price decimal(10,2) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
foreign key(user_id) references User(user_id),
foreign key(product_id) references Product(product_id));

insert into Insta_cart( insta_cart_id,user_id,product_id,quantity,price)
values
('IC01','U04','P01',1,4000);


create table Insta_order(
insta_order_id varchar(50) default(UUID()) primary key,
user_id varchar(50) not null,
insta_cart_id varchar(50) not null,
total_amount decimal(10,2) not null,
discount_amount int(50) null,
tax_charges decimal(10,2) not null,
order_date date not null,
delivery_charges int(50) not null,
net_amount decimal(10,2) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
foreign key(user_id) references User(user_id) ,
foreign key(insta_cart_id) references Insta_cart(insta_cart_id)
);


insert into Insta_order(insta_order_id,user_id,insta_cart_id,total_amount,tax_charges,order_date,delivery_charges,net_amount)
values
('IO01','U04','IC01',4000,20,'2024-3-3',50,4070);


create table Instacart_order_assignment(
assignment_id varchar(36)  primary key,
delivery_id varchar(36) not null,
insta_order_id varchar(36) not null,
foreign key(delivery_id) references Delivery_person(delivery_id),
foreign key(insta_order_id) references Insta_order(insta_order_id),
created_at timestamp default current_timestamp );


insert into Instacart_order_assignment(assignment_id,delivery_id,insta_order_id) values
('IOA01','DP03','IO01');





