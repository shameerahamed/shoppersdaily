# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         172.24.23.94
# Database:                     shopdetails
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2010-03-11 11:29:18
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'shopdetails'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ shopdetails /*!40100 DEFAULT CHARACTER SET latin1 */;

USE shopdetails;


#
# Table structure for table 'customer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ customer (
  Cust_id int(10) unsigned NOT NULL auto_increment,
  custname varchar(100) default NULL,
  Address varchar(255) default NULL,
  Phone_no bigint(15) unsigned default NULL,
  E_mail varchar(60) default NULL,
  Reg_date date default NULL,
  PRIMARY KEY  (Cust_id)
) AUTO_INCREMENT=4;



#
# Dumping data for table 'customer'
#

LOCK TABLES customer WRITE;
/*!40000 ALTER TABLE customer DISABLE KEYS;*/
INSERT INTO customer (Cust_id, custname, Address, Phone_no, E_mail, Reg_date) VALUES
	('1','Haripriya','Anna nagar,Chennai.','987654321','hari@gmail.com','2010-03-10');
INSERT INTO customer (Cust_id, custname, Address, Phone_no, E_mail, Reg_date) VALUES
	('2','Ramya','Porur,Chennai.','2147483645','ramya@gmail.com','2010-03-10');
INSERT INTO customer (Cust_id, custname, Address, Phone_no, E_mail, Reg_date) VALUES
	('3','testcust','address','9001212345','cust@gmail.com','2010-03-10');
/*!40000 ALTER TABLE customer ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'employee'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ employee (
  Emp_id int(10) unsigned NOT NULL auto_increment,
  Ename varchar(100) default NULL,
  Gender char(1) default NULL,
  Address varchar(255) default NULL,
  Phone_no bigint(20) default NULL,
  E_mail varchar(60) default NULL,
  Designation varchar(60) default NULL,
  DOJ date default NULL,
  DOB date default NULL,
  Username varchar(60) default NULL,
  Password varchar(50) NOT NULL default '',
  PRIMARY KEY  (Emp_id),
  KEY unique (Username)
) AUTO_INCREMENT=11;



#
# Dumping data for table 'employee'
#

LOCK TABLES employee WRITE;
/*!40000 ALTER TABLE employee DISABLE KEYS;*/
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('1','Samir','m','chennai','9876543215','samir@gmail.com','administrator','2010-03-10','1987-09-17','admin','admin1234');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('2','Ramalakshmi','f','vadapalani','9876987654','rama@gmail.com','sales','1987-10-15','2010-02-10','rama','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('3','HariPriya','f','Perambur','9876543256','hari@gmail.com','sales executive','1987-07-19','2010-02-10','haripriya','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('4','Ramya','f','Porur','9876543214','ramya@gmail.com','sales executive','1987-02-18','2010-02-10','ramya','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('5','Sneha','f','Anna Nagar','9876543687','sneha@gmail.com','sales','1987-10-24','2010-02-10','sneha','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('6','Ramanadhan','m','Ambatur','9765487893','ramandhan@gmail.com','sales','1987-03-03','2010-02-10','raman','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('7','Sam','m','Avadi','9808746372','sam@gmail.com','sales executive','1987-08-03','2010-02-10','sam','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('8','Sampath','m','Anna Nagar','9807647283','sampath@gmail.com','sales','1987-03-02','2010-02-10','sampath','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('9','Rakesh','m','ambatur','9876578634','rakesh@gmail.com','sales','1987-09-09','2010-02-10','rakesh','helloworld');
INSERT INTO employee (Emp_id, Ename, Gender, Address, Phone_no, E_mail, Designation, DOJ, DOB, Username, Password) VALUES
	('10','Rajesh','m','T.Nagar','9876546576','rajesh@gmail.com','sales','1987-02-02','2010-02-10','rajesh','helloworld');
/*!40000 ALTER TABLE employee ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'product'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ product (
  Prod_id int(10) unsigned NOT NULL auto_increment,
  Pname varchar(100) default NULL,
  Qty int(10) unsigned default '0',
  Price float unsigned default '0',
  Brand_name varchar(100) default NULL,
  qty_sold int(10) unsigned default '0',
  PRIMARY KEY  (Prod_id)
) AUTO_INCREMENT=35;



#
# Dumping data for table 'product'
#

LOCK TABLES product WRITE;
/*!40000 ALTER TABLE product DISABLE KEYS;*/
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('1','Toothpaste','30','40','Colgate','20');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('2','Soap','50','45','Dove','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('3','Tea Powder','40','35','3 Roses','10');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('4','Rice Bag','50','525','Ponni','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('5','Wheat Atta','48','35','Ashirvad','2');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('6','Cream','50','75','Garnier','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('7','Shampoo','50','65','Sunsilk','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('8','Conditioner','47','65','Sunsilk','3');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('9','Salt','65','2000','TATA','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('10','Toothpaste','35','45','Pepsodent','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('11','Perfume','24','100','Axe','1');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('12','Edible Oil','50','55','Gold Winner','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('13','Edible Oil','50','75','Sundrop','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('14','Coconut Oil','30','25','Parachute','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('15','Coffee Powder','40','65','Sunrise','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('16','Soap','35','20','Hamam','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('17','Wheat Atta','35','32','Pillsbury','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('18','Coconut Oil','25','20','VVD','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('19','Tea Powder','50','50','Taj','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('20','Coffee Powder','35','65','BRU','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('21','Chocolates','50','10','Dairy Milk-ordinary','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('22','Chocolates','45','35','Dairy Milk-Fruits and Nuts','5');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('23','Cool Drinks','35','50','Mirinda','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('24','Cool Drinks','39','25','Sprite','1');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('25','Noodles','60','20','Maggi','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('26','Noodles','25','25','Horlicks-Foodles','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('27','Health Drink','20','65','Boost','5');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('28','Health Drink','25','65','Complan','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('29','Health Drink','40','75','Horlicks','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('30','Chocolates','75','5','Munch','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('31','Biscuits','45','25','Hearts','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('32','Biscuits','32','15','Hide And Seek','5');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('33','Biscuits','50','15','Britannia','0');
INSERT INTO product (Prod_id, Pname, Qty, Price, Brand_name, qty_sold) VALUES
	('34','Biscuits','43','15','Britannia-Chocolate','0');
/*!40000 ALTER TABLE product ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_order'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ tbl_order (
  ord_id int(10) unsigned NOT NULL auto_increment,
  cust_id int(10) unsigned default NULL,
  ord_date date default NULL,
  total_amount float unsigned default '0',
  PRIMARY KEY  (ord_id)
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_order'
#

LOCK TABLES tbl_order WRITE;
/*!40000 ALTER TABLE tbl_order DISABLE KEYS;*/
INSERT INTO tbl_order (ord_id, cust_id, ord_date, total_amount) VALUES
	('1','1','2010-03-10','70');
INSERT INTO tbl_order (ord_id, cust_id, ord_date, total_amount) VALUES
	('2','0','2010-03-10','195');
INSERT INTO tbl_order (ord_id, cust_id, ord_date, total_amount) VALUES
	('3','2','2010-03-10','275');
INSERT INTO tbl_order (ord_id, cust_id, ord_date, total_amount) VALUES
	('4','2','2010-03-10','25');
INSERT INTO tbl_order (ord_id, cust_id, ord_date, total_amount) VALUES
	('5','3','2010-03-10','1350');
/*!40000 ALTER TABLE tbl_order ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_orderitem'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ tbl_orderitem (
  id int(10) unsigned NOT NULL auto_increment,
  ord_id int(10) unsigned default NULL,
  prod_id int(10) unsigned default NULL,
  amt float unsigned default '0',
  quantity int(10) unsigned default '0',
  PRIMARY KEY  (id)
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_orderitem'
#

LOCK TABLES tbl_orderitem WRITE;
/*!40000 ALTER TABLE tbl_orderitem DISABLE KEYS;*/
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('1','1','5','70','2');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('2','2','8','195','3');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('3','3','22','175','5');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('4','3','11','100','1');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('5','4','24','25','1');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('6','5','32','75','5');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('7','5','3','350','10');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('8','5','27','325','5');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('9','5','1','300','10');
INSERT INTO tbl_orderitem (id, ord_id, prod_id, amt, quantity) VALUES
	('10','5','1','300','10');
/*!40000 ALTER TABLE tbl_orderitem ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
