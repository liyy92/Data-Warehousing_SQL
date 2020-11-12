/* ALY 6030-Group 2-Mid-term Data Warehouse Project */ 
/* Team Members: Ketaki Joshi, Tanvi Bhagat, Swetha Daddala, Yuanying Li */ 

DROP DATABASE IF EXISTS `ktsy_store`;
CREATE DATABASE `ktsy_store`; 
USE `ktsy_store`; 

CREATE TABLE jobs (
	job_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);

CREATE TABLE departments (
	department_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL
);
INSERT INTO departments(department_id,department_name) VALUES (1,'Administration');
INSERT INTO departments(department_id,department_name) VALUES (2,'Marketing');
INSERT INTO departments(department_id,department_name) VALUES (3,'Purchasing');
INSERT INTO departments(department_id,department_name) VALUES (4,'Human Resources');
INSERT INTO departments(department_id,department_name) VALUES (5,'Shipping');
INSERT INTO departments(department_id,department_name) VALUES (6,'IT');
INSERT INTO departments(department_id,department_name) VALUES (7,'Public Relations');
INSERT INTO departments(department_id,department_name) VALUES (8,'Sales');
INSERT INTO departments(department_id,department_name) VALUES (9,'Executive');
INSERT INTO departments(department_id,department_name) VALUES (10,'Finance');
INSERT INTO departments(department_id,department_name) VALUES (11,'Accounting');



CREATE TABLE employees (
	employee_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT (11) NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT (11) DEFAULT NULL,
	department_id INT (11) DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

CREATE TABLE suppliers (
    supplier_id INT NOT NULL PRIMARY KEY,
    company_name CHARACTER VARYING(40) NOT NULL,
    contact_name CHARACTER VARYING(30),
    contact_title CHARACTER VARYING(30),
    address CHARACTER VARYING(60),
    city CHARACTER VARYING(15),
    region CHARACTER VARYING(15),
    postal_code CHARACTER VARYING(10),
    country CHARACTER VARYING(15),
    phone CHARACTER VARYING(24),
    fax CHARACTER VARYING(24),
    homepage TEXT
);
INSERT INTO suppliers VALUES (1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL);
INSERT INTO suppliers VALUES (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#');
INSERT INTO suppliers VALUES (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);
INSERT INTO suppliers VALUES (4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL);
INSERT INTO suppliers VALUES (5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL);
INSERT INTO suppliers VALUES (6, 'Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO suppliers VALUES (7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL);
INSERT INTO suppliers VALUES (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL);
INSERT INTO suppliers VALUES (9, 'PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL);
INSERT INTO suppliers VALUES (10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL);
INSERT INTO suppliers VALUES (11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL);
INSERT INTO suppliers VALUES (12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO suppliers VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL);
INSERT INTO suppliers VALUES (14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#');
INSERT INTO suppliers VALUES (15, 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL);
INSERT INTO suppliers VALUES (16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL);


CREATE TABLE customer_info (
    customer_id INT NOT NULL AUTO_INCREMENT,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    email_add VARCHAR(50) ,
    customer_phone BIGINT,
    PRIMARY KEY (customer_id)
);
INSERT INTO customer_info (customer_id, birth_date, first_name, last_name, gender, email_add, customer_phone)
VALUES (10001,'1953-09-02','Georgi','Facello','M','gef@yahoo.com', 1986062634),
(10002,'1964-06-02','Bezalel','Simmel','F','bz@hotmail.com', 1234567890),
(10003,'1959-12-03','Parto','Bamford','M','pbam@gamilcom', 3456548741),
(10004,'1954-05-01','Chirstian','Koblick','M','chik@gmail.com', 1985612301),
(10005,'1955-01-21','Kyoichi','Maliniak','M','mal32@outlook.com', 2349890912),
(10006,'1953-04-20','Anneke','Preusig','F','annpre2@yahoo.com', 9890062025),
(10007,'1957-05-23','Tzvetan','Zielinski','F','tz234@hotmail.com', 5891023104),
(10008,'1958-02-19','Saniya','Malloufi','M','saniyam@gmail.com', 2944091150),
(10009,'1952-04-19','Sumant','Peac','F','spec18@gmail.com', 2985027187),
(10010,'1963-06-01','Diaz','Piveteau','F','diap08@yahoo.com', 3894087249),
(10011,'1953-11-07','Mary','Sluis','F','mars@hotmailcom',8502718768),
(10012,'1960-10-04','Patricio','Bridgland','M','brip34@yahoo.com',6202514509),
(10013,'1963-06-07','Eberhardt','Terkki','M','terki63@gmail.com', 9084567231),
(10014,'1956-02-12','Berni','Genin','M','bernig@hotmail.com', 7659802413),
(10015,'1959-08-19','Guoxiang','Nooteboom','M','noot08@gmail.com', 3427603318),
(10016,'1961-05-02','Kazuhito','Cappelletti','M','kacap@yahoo.com', 9867532105),
(10017,'1958-07-06','Cristinel','Bouloucos','F','crisb06@gmail.com', 4084678902),
(10018,'1954-06-19','Kazuhide','Peha','F','pehak54@hotmail.com', 5648973412),
(10019,'1953-01-23','Lillian','Haddadi','M','hadli01@gmail.com', 9257473682),
(10020,'1952-12-24','Mayuko','Warwick','M','maywar24@gmail.com', 4159347217),
(10021,'1960-02-20','Ramzi','Erde','M','ma6@hotmail.com', 3459085128),
(10022,'1952-07-08','Shahaf','Famili','M','shaf2@gmail.com',4254985422),
(10023,'1953-09-29','Bojan','Montemayor','F','monbo@yahoo.com', 9891123417),
(10024,'1958-09-05','Suzette','Pettey','F','petty58@gmail.com',9371570931),
(10025,'1958-10-31','Prasadram','Heyers','M','prahey@gmail.com',9870087179),
(10026,'1953-04-03','Yongqiao','Berztiss','M','yongb@yahoo.com','3952030203'),
(10027,'1962-07-10','Divier','Reistad','F','divir07@gmail.com','2893074075'),
(10028,'1963-11-26','Domenick','Tempesti','M','tempd@hotmail.com',5915106228),
(10029,'1956-12-13','Otmar','Herbst','M','otma@hotmail.com',9851312097),
(10030,'1958-07-14','Elvis','Demeyer','M','elvis07@yahoo.com',2943025157),
(10031,'1959-01-27','Karsten','Joslin','M','josk01@gmail.com',9132091201),
(10032,'1960-08-09','Jeong','Reistad','F','jer09@hotmail.com',4900562670),
(10033,'1956-11-14','Arif','Merlo','M','arifm11@yahoo.com',4874334518),
(10034,'1962-12-29','Bader','Swan','M','bars12@yahoo.com',2889492174),
(10035,'1953-02-08','Alain','Chappelet','M','alac@yahoo.com',9481296545),
(10036,'1959-08-10','Adamantios','Portugali','M','adam10@gamil.com',2923414987),
(10037,'1963-07-22','Pradeep','Makrucki','M','prad22@gamil.com',2901272385),
(10038,'1960-07-20','Huan','Lortz','M','lorh@hotmail.com',2893862058),
(10039,'1959-10-01','Alejandro','Brender','M','alexb59@gmail.com',3894351289),
(10040,'1959-09-13','Weiyi','Meriste','F','weim13@hotmail.com',2937121439);


CREATE TABLE categories (
    category_id INT NOT NULL PRIMARY KEY,
    category_name CHARACTER VARYING(15) NOT NULL,
    description TEXT
);
INSERT INTO categories VALUES (11, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales');
INSERT INTO categories VALUES (22, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO categories VALUES (33, 'Confections', 'Desserts, candies, and sweet breads');
INSERT INTO categories VALUES (44, 'Dairy Products', 'Cheeses');
INSERT INTO categories VALUES (55, 'Grains/Cereals', 'crackers, pasta, and cereal');
INSERT INTO categories VALUES (66, 'Meat/Poultry', 'Prepared meats');
INSERT INTO categories VALUES (77, 'Produce', 'Dried fruit and bean curd');
INSERT INTO categories VALUES (88, 'Seafood', 'Seaweed and fish');
INSERT INTO categories VALUES (99, 'Personal Care', 'Bath tissues');


CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(40) NOT NULL,
    category_id INT NOT NULL,
    brand CHAR(50),
    unit_price DECIMAL(5 , 2 ) NOT NULL,
    inventory_count INT NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories (category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
);

INSERT INTO products VALUES (10, 'Pepperjack Cheese', 44,'Kraft' ,3.75,100,11);
INSERT INTO products VALUES (11, 'Roasted Coffee', 11,'Starbucks',8.75,150,1);
INSERT INTO products VALUES (12, 'Vanilla Yogurt', 44,'Clover' ,4.75,213,4);
INSERT INTO products VALUES (13, 'Milk', 44,'Lucerne' ,9.25,350, 12);
INSERT INTO products VALUES (14, 'Salted Butter', 44,'Clover',6.75, 312, 12);
INSERT INTO products VALUES (15, 'Ice-cream', 33,'Magnum' ,6.00,350,14);
INSERT INTO products VALUES (16, 'cereals', 55,'Kellogs' ,10.50,525,9);
INSERT INTO products VALUES (17, 'Garlic Bread', 33,'Texas Toast',4.75,200,8);
INSERT INTO products VALUES (18, 'Tiramisu', 33,'Local',4.75,375,15);
INSERT INTO products VALUES (19, 'Tissues', 99,'kirkland',10.50,670,13);
INSERT INTO products VALUES (20, 'Ground Chicken', 66,'Poultry',12.75,175,10);
INSERT INTO products VALUES (21, 'Rotini Pasta', 55,'Signature' ,6.95,98,10);
INSERT INTO products VALUES (22, 'Toothpaste', 99,'Colgate' ,3.75,395,7);
INSERT INTO products VALUES (23, 'Prawns', 99,'Local' ,11.75,529,8);
INSERT INTO products VALUES (24, 'Pesto sauce', 22,'Ralph' ,5.35,215,12);
INSERT INTO products VALUES (25, 'Nutella', 22,'Ferrero' ,9.75,622,12);
INSERT INTO products VALUES (26, 'Ketchup', 22,'Heinz',7.77,300,12);
INSERT INTO products VALUES (27, 'Cream cookies', 33,'Oreo',5.75,297, 14);
INSERT INTO products VALUES (28, 'Roasted Coffee', 11,'Peets',6.99,128,2);
INSERT INTO products VALUES (29, 'Dark chocolate', 33,'Hersheys',3.75,275,8);
INSERT INTO products VALUES (30, 'Waffle', 33,'Eggo' ,3.75, 275,8);
INSERT INTO products VALUES (31, 'Chocolate cookie', 33,'Twix',4.59,300,8);
INSERT INTO products VALUES (32, 'Almond Milk', 44,'Silk' ,4.75,450,16);
INSERT INTO products VALUES (33, 'Coca cola Soda', 11,'Coca-cola',7.75,422,1);
INSERT INTO products VALUES (34, 'Body wash', 99,'Dove' ,13.75,374,15);
INSERT INTO products VALUES (35, 'Makeup remover', 99,'Neutrogena',15.75,115,13);
INSERT INTO products VALUES (36, 'Orange Juice', 11,'Simply' ,5.39,230,13);
INSERT INTO products VALUES (37, 'Caramel Frappe', 11,'Starbucks',4.75,410,11);
INSERT INTO products VALUES (38, 'Macoroni Pasta', 55,'Barilla' ,4.95,309,11);
INSERT INTO products VALUES (39, 'Tomato Basil sauce', 22,'Prego' ,6.66,266,13);
INSERT INTO products VALUES (40, 'Protein Oats', 55,'Nature Valley' ,5.55,200,2);
INSERT INTO products VALUES (41, 'Bacon', 66,'Farmer John' ,9.75,345,2);
INSERT INTO products VALUES (42, 'Cheddar Cheese', 44,'Clover' ,4.75,470,5);
INSERT INTO products VALUES (43, 'Nuts', 77,'Local' ,6.75,254,8);
INSERT INTO products VALUES (44, 'cookie biscuits', 33,'Chips Ohio',6.35,143,10);
INSERT INTO products VALUES (45, 'Body Lotion', 99,'Aveno' ,12.99,378,14);
INSERT INTO products VALUES (46, 'Mayonnaise', 22,'Best Foods' ,7.35,450,9);
INSERT INTO products VALUES (47, 'Mayonnaise', 22,'Kraft' ,5.35,200,10);
INSERT INTO products VALUES (48, 'Body wash', 99,'Victoria Secret' ,10.35,150,13);
INSERT INTO products VALUES (49, 'Rotini Pasta', 55,'Rego' ,7.35,350,2);
INSERT INTO products VALUES (50, 'Salted Butter', 44,'Signature' ,5.35,120,13);
INSERT INTO products VALUES (51, 'Roasted Coffee', 11,'Nestle' ,6.35,190,6);
INSERT INTO products VALUES (52, 'Dark Cholocate', 33,'Lindt' ,9.35,550,8);
INSERT INTO products VALUES (53, 'Whipping Cream', 44,'Clover' ,11.35,170,10);
INSERT INTO products VALUES (54, 'Body Lotion', 99, 'Victoria Secret' ,8.35,100,14);
INSERT INTO products VALUES (55, 'Milk', 44,'Clover' ,8.09,55,12);

CREATE TABLE time_info (
    time_key INT PRIMARY KEY NOT NULL,
    full_date TIMESTAMP NULL,
    month_name VARCHAR(10) NULL,
    cal_month INT NULL,
    cal_quarter INT NULL,
    cal_year INT NULL
);
INSERT INTO time_info VALUES (1,'2020-01-21' ,'January',1, 1, 2020); 
INSERT INTO time_info VALUES (2,'2020-01-22' ,'January',1, 1, 2020);
INSERT INTO time_info VALUES (3,'2020-01-23' ,'January', 1, 1, 2020);
INSERT INTO time_info VALUES (4,'2020-01-24' ,'January', 1, 1, 2020);
INSERT INTO time_info VALUES (5,'2020-01-25' ,'January', 1, 1, 2020);
INSERT INTO time_info VALUES (6,'2020-01-26' ,'January', 1, 1, 2020);
INSERT INTO time_info VALUES (7,'2020-01-27' ,'January', 1, 1, 2020);
INSERT INTO time_info VALUES (8,'2020-01-28' ,'January', 1, 1, 2020);
INSERT INTO time_info VALUES (9,'2020-01-29' ,'January', 1, 1,2020);
INSERT INTO time_info VALUES (10,'2020-01-30' ,'January', 1, 1,2020);
INSERT INTO time_info VALUES (11,'2020-01-31' ,'January', 1, 1, 2020);
INSERT INTO time_info VALUES (12,'2020-02-01' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (13,'2020-02-02' ,'February', 2,1, 2020);
INSERT INTO time_info VALUES (14,'2020-02-03' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (15,'2020-02-04' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (16,'2020-02-05' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (17,'2020-02-06' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (18,'2020-02-07' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (19,'2020-02-08' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (20,'2020-02-09' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (21,'2020-02-10' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (22,'2020-02-11' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (23,'2020-02-12' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (24,'2020-02-13' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (25,'2020-02-14' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (26,'2020-02-15' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (27,'2020-02-16' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (28,'2020-02-17' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (29,'2020-02-18' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (30,'2020-02-19' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (31,'2020-02-20' ,'February', 2,1, 2020);
INSERT INTO time_info VALUES (32,'2020-02-21' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (33,'2020-02-22' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (34,'2020-02-23' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (35,'2020-02-24' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (36,'2020-02-25' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (37,'2020-02-26' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (38,'2020-02-27' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (39,'2020-02-28' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (40,'2020-02-29' ,'February', 2, 1, 2020);
INSERT INTO time_info VALUES (41,'2020-03-01' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (42,'2020-03-02' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (43,'2020-03-03' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (44,'2020-03-04' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (45,'2020-03-05' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (46,'2020-03-06' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (47,'2020-03-07' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (48,'2020-03-08' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (49,'2020-03-09' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (50,'2020-03-10' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (51,'2020-03-11' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (52,'2020-03-12' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (53,'2020-03-13' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (54,'2020-03-14' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (55,'2020-03-15' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (56,'2020-03-16' ,'March', 3,1, 2020);
INSERT INTO time_info VALUES (57,'2020-03-17' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (58,'2020-03-18' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (59,'2020-03-19' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (60,'2020-03-20' ,'March', 3, 1, 2020); 
INSERT INTO time_info VALUES (61,'2020-03-21' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (62,'2020-03-22' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (63,'2020-03-23' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (64,'2020-03-24' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (65,'2020-03-25' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (66,'2020-03-26' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (67,'2020-03-27' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (68,'2020-03-28' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (69,'2020-03-29' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (70,'2020-03-30' ,'March', 3, 1, 2020); 
INSERT INTO time_info VALUES (71,'2020-03-31' ,'March', 3, 1, 2020);
INSERT INTO time_info VALUES (72,'2020-06-01' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (73,'2020-06-02' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (74,'2020-06-03' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (75,'2020-06-04' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (76,'2020-06-05' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (77,'2020-06-06' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (78,'2020-06-07' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (79,'2020-06-08' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (80,'2020-06-09' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (81,'2020-06-10' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (82,'2020-06-11' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (83,'2020-06-12' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (84,'2020-06-13' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (85,'2020-06-14' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (86,'2020-06-15' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (87,'2020-06-16' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (88,'2020-06-17' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (89,'2020-06-18' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (90,'2020-06-19' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (91,'2020-06-20' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (92,'2020-06-21' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (93,'2020-06-22' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (94,'2020-06-23' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (95,'2020-06-24' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (96,'2020-06-25' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (97,'2020-06-26' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (98,'2020-06-27' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (99,'2020-06-28' ,'June', 6, 2, 2020);
INSERT INTO time_info VALUES (100,'2020-06-29','June', 6, 2, 2020);
INSERT INTO time_info VALUES (101,'2020-06-30','June', 6, 2, 2020);
INSERT INTO time_info VALUES (102,'2020-07-01' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (103,'2020-07-02' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (104,'2020-07-03' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (105,'2020-07-04' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (106,'2020-07-05' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (107,'2020-07-06' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (108,'2020-07-07' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (109,'2020-07-08' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (110,'2020-07-09' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (111,'2020-07-10' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (112,'2020-07-11' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (113,'2020-07-12' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (114,'2020-07-13' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (115,'2020-07-14' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (116,'2020-07-15' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (117,'2020-07-16' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (118,'2020-07-17' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (119,'2020-07-18' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (120,'2020-07-19' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (121,'2020-07-20' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (122,'2020-07-21' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (123,'2020-07-22' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (124,'2020-07-23' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (125,'2020-07-24' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (126,'2020-07-25' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (127,'2020-07-26' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (128,'2020-07-27' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (129,'2020-07-28' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (130,'2020-07-29' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (131,'2020-07-30' ,'July', 7, 3, 2020);
INSERT INTO time_info VALUES (132,'2020-07-31' ,'July', 7, 3, 2020);



CREATE TABLE orders (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT (11),
    time_key INT NOT NULL,
    comments VARCHAR(2000) DEFAULT NULL,
    FOREIGN KEY (time_key) REFERENCES time_info(time_key),
    FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO orders VALUES (900, 10001, 104, 1,'I love the grocery range and service! The service is always friendly and quick.');
INSERT INTO orders VALUES (901, 10002, 104, 1, 'Great selection of vegetables, Indian items at a reasonable price.');
INSERT INTO orders VALUES (902, 10002, 105, 2,'Spacious store');
INSERT INTO orders VALUES (903, 10009, 105, 5, 'A decent stop for your daily needs and grocery.');
INSERT INTO orders VALUES (904, 10005, 106, 8, 'Overcrowded during weekends');
INSERT INTO orders VALUES (905, 10004, 107, 4, 'It is a great neighborhood grocery store with everything you would ever need! I recommend it to people looking for a store that can supply your daily needs.');
INSERT INTO orders VALUES (906, 10014, 108, 1,'Less prices compared to nearby grocers. Good collection only downside is it gets crowded. Especially with covid situations, gotta be very careful.');
INSERT INTO orders VALUES (907, 10008, 146, 30,'Great variety at reasonable prices and helpful staff.');
INSERT INTO orders VALUES (908, 10003, 117, 100,'The remodel is nice because the flow of the store is better.  Love the added self checkout stations which helps people through with smaller items.');
INSERT INTO orders VALUES (909, 10020, 177, 110, 'The hand sanitizer station at the door was out of sanitizer. There is  no shopping cart sanitizer wipes or spray. This is during COVID-19 time, 5 months since the start of the pandemic.');
INSERT INTO orders VALUES (910, 10016, 116, 121, 'Good place for visiting');
INSERT INTO orders VALUES (911, 10015, 179, 10, 'Very good shopping but a little bit crowded for COVID-19.');
INSERT INTO orders VALUES (912, 10011, 179, 45, 'It is sad to see how rude the staff is, not friendly and not at all helpful. I am a senior and I have to use a cane, several times I came close to getting hit by associates pushing carts and no apology.');
INSERT INTO orders VALUES (913, 10005, 109, 41,'They never pick up the phone. I have been waiting for my pickup order for 30 minutes now . This is the second time I am experiencing this.');
INSERT INTO orders VALUES (914, 10008, 110, 90, 'Very organized,  nice and clean.  So many self checkout terminals are available that checking out becomes prompt and fun.');
INSERT INTO orders VALUES (915, 10010, 101, 98,'Finest collections and great range of hand picked items');
INSERT INTO orders VALUES (916, 10012, 100, 33, 'Delay in delivery, not upto the expectations');
INSERT INTO orders VALUES (917, 10013, 106, 78,'Poor customer service');
INSERT INTO orders VALUES (918, 10015, 103, 79,'Executive Lily was customer friendly and joyous person');
INSERT INTO orders VALUES (919, 10001, 117, 90,'Did not deliver all the products ordered, worst service');
INSERT INTO orders VALUES (920, 10007, 146, 28,'Delay in issuing refunds.');
INSERT INTO orders VALUES (921, 10006, 119, 125,'One of the best grocery stories in the town, prompt customer support');
INSERT INTO orders VALUES (922, 10011, 119, 100,'Wide range of items available with a great quality’ and at affordable pricing');
INSERT INTO orders VALUES (923, 10012, 119, 11, 'Amazing staff, keep up the good work.');
INSERT INTO orders VALUES (924, 10014, 110, 12,'Must visit the store.');
INSERT INTO orders VALUES (925, 10020, 179, 17,'Manager Kate is an adorable person and customer friendly, acts promptly on customer’s complaints. Best service!');
INSERT INTO orders VALUES (926, 10020, 109, 22,'Poor service, there is not fresh meat!');
INSERT INTO orders VALUES (927, 10029, 119, 7, 'Less number of cash counters. Billing took a lot of time.');
INSERT INTO orders VALUES (928, 10028, 177, 107,'Love the products range in the store. The meat produce is really fresh!');
INSERT INTO orders VALUES (929, 10031, 108, 114,'I love the store, their food selection and their grocery pick up service');
INSERT INTO orders VALUES (930, 10020, 100, 111,'I have already loved this store but I am loving them even more with their delivery services');
INSERT INTO orders VALUES (931, 10012, 145, 117,'Good price on fish and nice specials on fruit.');
INSERT INTO orders VALUES (932, 10040, 178, 117,'Good selection of international foods(some imported) and gluten free');
INSERT INTO orders VALUES (933, 10039, 177, 117, 'Fresh food and friendly staff');
INSERT INTO orders VALUES (934, 10038, 103, 117,'Delicious bread pie and drinks to choose from');
INSERT INTO orders VALUES (935, 10037, 103, 127, 'Amazing offers on products and nice discounts');
INSERT INTO orders VALUES (936, 10036, 114, 127, 'Nice food market, quality produce and very friendly service.');
INSERT INTO orders VALUES (937, 10035, 109, 131, 'Okayish deals, okayish service');
INSERT INTO orders VALUES (938, 10034, 101, 37,'Terrible service by the meat department.');
INSERT INTO orders VALUES (939, 10033, 103, 37,'This is my favorite grocery store and place to grab a quick healthy dinner.' );
INSERT INTO orders VALUES (940, 10032, 120, 120,'This is the best grocery!');
INSERT INTO orders VALUES (941, 10031, 146, 17,'Great place for cookies and liquor');
INSERT INTO orders VALUES (942, 10025, 178, 3,'Great place for cookies and liquor');
INSERT INTO orders VALUES (943, 10025, 177, 11,'This is one of my favorite WF markets it has massive and well stocked.');
INSERT INTO orders VALUES (944, 10024, 115, 29,'Good place to sit for a coffee or icecream while doing some studying or work');
INSERT INTO orders VALUES (945, 10023, 108, 101,'Easy shopping large aisles, great selection on be veggies fish meat');
INSERT INTO orders VALUES (946, 10022, 178, 108,'Love the quality of the products. Will definitely visit more often!’');
INSERT INTO orders VALUES (947, 10020, 115, 96,'Less number of cash counters. Billing took a lot of time.');
INSERT INTO orders VALUES (948, 10019, 107, 44,'Love the products range in the store. The meat produce is really fresh!');
INSERT INTO orders VALUES (949, 10017, 102, 55,'The store owner Tanvi was very friendly as always and will be ready to answer any questions you have the store has merchandise that is there at a very good price.  Come by and see for your self.');
INSERT INTO orders VALUES (950, 10016, 110, 67,'Donuts and coffee, scratchers! Its great. Packages too!');
INSERT INTO orders VALUES (951, 10006, 103, 88,'Great location for small buying.');
INSERT INTO orders VALUES (952, 10007, 105, 99,'Great prices on beer and great selection with quality service.');
INSERT INTO orders VALUES (953, 10009, 115, 35, 'I love Swetha, Yes, she is the best sales girl in the store');
INSERT INTO orders VALUES (954, 10005, 146, 39,'Everything was over priced. Not worth it.');
INSERT INTO orders VALUES (955, 10030, 178, 130,'Poor service! It is sad to see how rude the staff is, not friendly and not at all helpful. I am a senior and I have to use a cane, several times I came close to getting hit by associates pushing carts and no apology.');


CREATE TABLE order_details (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    unit_price DECIMAL (5,2) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO order_details (order_id, product_id, unit_price, quantity)
VALUES 
(900, 10, 3.75, 3),
(901, 11, 8.75, 2),
(902, 12, 4.75, 4),
(903, 14, 6.75, 6),
(904, 11, 8.75, 2),
(905, 12, 4.75, 4),
(906, 13, 9.25, 3),
(907, 13, 9.25, 1),
(908, 16, 10.50, 1),
(909, 19, 10.50, 3),
(910, 21, 6.95, 2),
(911, 16, 10.50, 1),
(912, 22, 3.65, 2),
(913, 55, 8.09, 2),
(914, 25, 9.75, 1),
(915, 27, 5.75, 3),
(916, 26, 7.77, 2),
(917, 29, 3.75, 3),
(918, 31, 4.59, 2),
(919, 16, 10.50, 1),
(920, 34, 13.75, 2),
(921, 37, 4.75, 2),
(922, 39, 6.66, 1),
(923, 40, 5.55, 2),
(924, 43, 6.75, 1),
(925, 46, 7.35, 1),
(926, 45, 12.99, 3),
(927, 45, 12.99, 3),
(928, 41, 9.75, 3),
(929, 46, 7.35, 5),
(930, 45, 12.99, 1),
(931, 32, 4.75, 1),
(932, 27, 5.75, 4),
(933, 35, 15.75, 4),
(934, 37, 4.75, 2),
(935, 28, 6.99, 2),
(936, 27, 5.75, 6),
(937, 34, 13.75, 2),
(938, 50, 5.35, 1),
(909, 51, 6.35, 2),
(939, 36, 5.39, 4),
(940, 33, 7.75, 2),
(941, 25, 9.75, 2),
(942, 11, 8.75, 1),
(943, 13, 9.25, 2),
(944, 17, 4.75, 5),
(945, 17, 4.75, 3),
(946, 21, 6.95, 2),
(947, 24, 5.35, 2),
(948, 14, 6.75, 2),
(949, 12, 4.75, 10),
(950, 28, 6.99, 3),
(951, 14, 6.75, 4),
(952, 45, 12.99, 6),
(953, 11, 8.75, 2),
(954, 33, 7.75, 4),
(955, 16, 10.50, 3),
(900, 11, 8.75, 2),
(900, 45, 12.99, 3),
(901, 14, 6.75, 2),
(901,33,7.75,1),
(904,16, 10.50, 4),
(907,21, 6.95, 2),
(908,21, 6.95, 2),
(915,21, 6.95, 3),
(916,21, 6.95, 2),
(918,26, 7.77, 1),
(920,12, 4.75, 5),
(921,12, 4.75, 2),
(922,32, 4.75, 7),
(922,34, 13.75, 2),
(924,32, 4.75, 4),
(930,34, 13.75, 6),
(931,34, 13.75, 1),
(933,42, 4.75, 3),
(955,42, 4.75, 1),
(953,42, 4.75, 4),
(949,42, 4.75, 4),
(945,42, 4.75, 3),
(950,14, 6.75, 3),
(949,14, 6.75, 2),
(939,14, 6.75, 2),
(929,14, 6.75, 4),
(919,25, 9.75, 1),
(932,25, 9.75, 4),
(927,25, 9.75, 3),
(925,25, 9.75, 6),
(907,25, 9.75, 2),
(911,28, 6.99, 3),
(914,28, 6.99, 2),
(909,28, 6.99, 1),
(903,28, 6.99, 1),
(915,53, 11.35, 1),
(904,51, 6.35, 3),
(909,49, 7.35, 2),
(931, 47, 5.35, 3),
(916,53, 11.35, 1),
(923,52, 9.35, 8),
(948,51, 6.35, 2),
(949,50, 5.35, 3);

/* Business Questions */ 

/* 1. What is the resource head count and salary expenses for each department */ 
SELECT 
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS 'Resource head count ',
    SUM(e.salary) AS 'Expenses'
FROM
    departments d
        JOIN
    employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY d.department_id ASC;


/* 2. How many distinct products ktsy_store have? */ 
SELECT 
    COUNT(DISTINCT product_name) AS 'Total number of Products'
FROM
    products;

    
/* 3. What is the inventory count for each categories? */
SELECT 
    products.category_id,
    categories.category_name,
    SUM(products.inventory_count) AS 'Total inventory count by categories'
FROM
    products
        JOIN
    categories ON products.category_id = categories.category_id
GROUP BY categories.category_name
ORDER BY products.category_id ASC;


/* 4. Which are the top 10 expensive products? */ 
SELECT DISTINCT
    product_name AS Ten_Most_Expensive_Products, unit_price
FROM
    products AS a
WHERE
    10 >= (SELECT 
            COUNT(DISTINCT unit_price)
        FROM
            Products AS b
        WHERE
            b.unit_price >= a.unit_price)
ORDER BY unit_price DESC;


/* 5. What types of products are not getting sold? */ 
SELECT 
    product_id, product_name, brand, unit_price
FROM
    products
WHERE
    product_id NOT IN (SELECT 
            product_id
        FROM
            order_details
        WHERE
            product_id IS NOT NULL)
ORDER BY product_name ASC;


/* 6. Which is the most favoured brand by categories and most favoured product in that category*/ 
SELECT 
    products.supplier_id,
    suppliers.company_name,
    products.product_id,
    products.product_name,
    products.brand,
    categories.category_name,
    COUNT(products.product_name) AS 'Items sold'
FROM
    products
        JOIN
    order_details ON products.product_id = order_details.product_id
        JOIN
    orders ON order_details.order_id = orders.order_id
        JOIN
    categories ON products.category_id = categories.category_id
        JOIN
    suppliers ON products.supplier_id = suppliers.supplier_id
GROUP BY products.category_id
ORDER BY products.supplier_id ASC;



/* 7.What is the sales revenue by products for each quarter? */ 
SELECT 
    products.product_name,
    categories.category_name,
    time_info.cal_quarter,
    ROUND(SUM(order_details.unit_price * order_details.quantity),
            2) AS 'Sales revenue'
FROM
    products
        JOIN
    order_details ON products.product_id = order_details.product_id
        JOIN
    orders ON order_details.order_id = orders.order_id
        JOIN
    categories ON products.category_id = categories.category_id
        JOIN
    time_info ON orders.time_key = time_info.time_key
GROUP BY products.product_name
ORDER BY time_info.cal_quarter ASC;


/* 8. What is the demand for products based on the month */ 
/* Provide quantity sales for every product per month and provide ranking based on that. */
WITH test_1 AS(
   SELECT 
ti.Month_Name,
SUM(od.quantity) AS quantity_sales,
p.product_name,
p.brand,
ti.cal_month
FROM orders o
JOIN customer_info ci
    ON o.customer_id = ci.customer_id
JOIN order_details od
	ON o.order_id = od.order_id
JOIN products p
    ON p.product_id = od.product_id
JOIN time_info ti
    ON ti.time_key = o.time_key
GROUP BY p.product_name, p.brand
)
  SELECT
      Month_Name,
      product_name,
      brand,
      quantity_sales,
      DENSE_RANK() OVER (PARTITION BY cal_month ORDER BY quantity_sales DESC) AS demand_rank
 FROM test_1
 ORDER BY cal_month ASC; 
 
 
 /* 9. What is the customer footfall for each quarter? */ 
SELECT 
    t.Month_name,
    t.cal_quarter,
    COUNT(o.customer_id) AS 'Customer Footfall'
FROM
    time_info t
        JOIN
    orders o ON t.time_key = o.time_key
GROUP BY t.Month_name
ORDER BY t.cal_quarter ASC;
 
 
/* 10. What type of products are oftenly purchased by customers? */ 
SELECT 
    cat.category_name,
    cat.description,
    COUNT(category_name) AS purchased_amount
FROM
    categories cat
        JOIN
    products p ON cat.category_id = p.category_id
        JOIN
    order_details od ON od.product_id = p.product_id
        JOIN
    orders o ON od.order_id = o.order_id
GROUP BY category_name
ORDER BY purchased_amount DESC;


/* 11. What is the purchse pattern of customers looks like? */ 
SELECT 
    ti.Full_date, ci.first_name, ci.last_name, p.product_name
FROM
    orders o
        JOIN
    customer_info ci ON o.customer_id = ci.customer_id
        JOIN
    order_details od ON o.order_id = od.order_id
        JOIN
    products p ON p.product_id = od.product_id
        JOIN
    time_info ti ON ti.time_key = o.time_key
ORDER BY ti.Full_date ASC; 


/* 12. Rank products based on monthly sales. Display the results for each month */ 
WITH test_1 AS(
   SELECT 
   ti.Month_Name,
   ROUND(SUM(od.unit_price*quantity),2) AS month_sales_amount,
   p.product_name,
   p.brand,
   ti.cal_month
FROM  order_details od
JOIN  orders o
    ON o.order_id = od.order_id
JOIN time_info ti
    ON ti.time_key = o.time_key
JOIN products p
    ON p.product_id = od.product_id
GROUP BY product_name, p.brand
ORDER BY cal_month, month_sales_amount DESC
)
  SELECT
      Month_Name,
      product_name,
	  brand,
      month_sales_amount,
      DENSE_RANK() OVER (PARTITION BY cal_month ORDER BY month_sales_amount DESC) AS sales_amount_rank
 FROM test_1
 ORDER BY cal_month ASC;
 
 
/* 13. What is the average amount spent by each customer ?*/
SELECT 
    ci.customer_id,
    ci.first_name,
    ci.last_name,
    ROUND(AVG(od.unit_price * quantity), 2) AS average_amount_spent
FROM
    order_details od
        JOIN
    orders o ON o.order_id = od.order_id
        JOIN
    customer_info ci ON o.customer_id = ci.customer_id
        JOIN
    time_info ti ON ti.time_key = o.time_key
        JOIN
    products p ON p.product_id = od.product_id
GROUP BY first_name , last_name
ORDER BY ci.customer_id ASC;


/* 14. Which is the best sales month in ktsy_store? */
SELECT 
    ti.Month_Name,
    ROUND(SUM(od.unit_price * quantity), 2) AS monthly_sales
FROM
    order_details od
        JOIN
    orders o ON o.order_id = od.order_id
        JOIN
    time_info ti ON ti.time_key = o.time_key
GROUP BY Month_Name
ORDER BY monthly_sales DESC;

/* 15. What is the growth rate in sales revenue? Compare the sales revenue of the current month with the previous month sales revenue*/
WITH monthly_sales AS(
   SELECT 
	   ti.Month_Name,
	   ROUND(SUM(od.unit_price*quantity),5) AS monthly_sales,
       ti.Full_date
	FROM  order_details od
	JOIN  orders o
		ON o.order_id = od.order_id
	JOIN time_info ti
		ON ti.time_key = o.time_key
	GROUP BY Month_Name
	ORDER BY ti.Full_date 
)
  SELECT
      Month_Name,
      monthly_sales,
      LAG(monthly_sales,1) OVER( ORDER BY Full_date)  previous_sales,
      FORMAT ( (monthly_sales - previous_sales) / previous_sales  *100,
      4
      ) AS growth_rate,'%'
 FROM (SELECT 
    Month_Name, monthly_sales,
    Full_date,
    LAG(monthly_sales,1) OVER(ORDER BY Full_date)  previous_sales
    FROM monthly_sales) AS growth_rate;
    
    
/* 16. From comments, what kind of information management can get so that they can implement some necessary changes?*/
/* Filter reviews which is likely positive*/
SELECT 
    *
FROM
    orders
WHERE
    comments REGEXP 'best|love|favorite|awesome|great'; 
/* Filter reviews which is likely negative*/
SELECT 
    *
FROM
    orders
WHERE
    comments REGEXP 'bad|poor|not';
    
    
/* 17. What is the number of units in stock by category and supplier continent */ 
SELECT 
    categories.category_name AS 'Product Category',
    CASE
        WHEN
            suppliers.country IN ('UK' , 'Spain',
                'Sweden',
                'Germany',
                'Norway',
                'Denmark',
                'Netherlands',
                'Finland',
                'Italy',
                'France')
        THEN
            'Europe'
        WHEN suppliers.country IN ('USA' , 'Canada', 'Brazil') THEN 'America'
        ELSE 'Asia-Pacific'
    END AS 'Supplier Continent',
    SUM(products.inventory_count) AS Units_In_Stock
FROM
    suppliers suppliers
        INNER JOIN
    products products ON products.supplier_id = suppliers.supplier_id
        INNER JOIN
    categories categories ON categories.category_id = products.category_id
GROUP BY categories.category_name , CASE
    WHEN
        suppliers.country IN ('UK' , 'Spain',
            'Sweden',
            'Germany',
            'Norway',
            'Denmark',
            'Netherlands',
            'Finland',
            'Italy',
            'France')
    THEN
        'Europe'
    WHEN suppliers.country IN ('USA' , 'Canada', 'Brazil') THEN 'America'
    ELSE 'Asia-Pacific'
END; 