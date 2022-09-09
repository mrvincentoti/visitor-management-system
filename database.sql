DROP DATABASE IF EXISTS vms;

CREATE DATABASE vms;
USE vms;

DROP TABLE IF EXISTS user_type;
CREATE TABLE user_type(
    id int not null primary key auto_increment,
    `type` varchar(16) not null
);

INSERT INTO user_type
  (type)
VALUES('Admin');
INSERT INTO user_type
  (type)
VALUES('Staff');
INSERT INTO user_type
  (type)
VALUES('Visitor');





DROP TABLE IF EXISTS department;
CREATE TABLE department(
    id int not null primary key auto_increment,
    department varchar(16) not null
);

INSERT INTO department
  (department)
VALUES('BlackSentry');
INSERT INTO department
  (department)
VALUES('Cloud Unit');
INSERT INTO department
  (department)
VALUES('Customer Support');
INSERT INTO department
  (department)
VALUES('Procurement');
INSERT INTO department
  (department)
VALUES('Infrastructure');
INSERT INTO department
  (department)
VALUES('Engineering');
INSERT INTO department
  (department)
VALUES('IT Support');
INSERT INTO department
  (department)
VALUES('Product Unit');




DROP TABLE IF EXISTS gender;
CREATE TABLE gender(
    id int not null primary key auto_increment,
    gender varchar(16) not null
);

INSERT INTO gender
  (gender)
VALUES('M');
INSERT INTO gender
  (gender)
VALUES('F');




DROP TABLE IF EXISTS purpose;
CREATE TABLE purpose(
    id int not null primary key auto_increment,
    purpose varchar(16) not null
);

INSERT INTO purpose
  (purpose)
VALUES('enquiry');
INSERT INTO purpose
  (purpose)
VALUES('Job Application');
INSERT INTO purpose
  (purpose)
VALUES('Visiting');
INSERT INTO purpose
  (purpose)
VALUES('Appointment');
INSERT INTO purpose
  (purpose)
VALUES('Work');



DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id int not null primary key auto_increment,
    username varchar(16) not null,
    email varchar(32) not null,
    first_name varchar(32) not null,
    last_name varchar(32) not null,
    phone_number varchar(16),
    gender_id int not null,
    department_id int not null,
    password varchar(255) not null,
    CONSTRAINT FK_DEPARTMENT FOREIGN KEY(department_id) REFERENCES department(id),
    CONSTRAINT FK_GENDER FOREIGN KEY(gender_id) REFERENCES gender(id)
);

INSERT INTO users
  (username, email, first_name, last_name, phone_number, gender_id, department_id, password)
VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123');
INSERT INTO users
  (username, email, first_name, last_name, phone_number, gender_id, department_id, password)
VALUES('Vincento', 'mrvincentito@gmail.com', 'VINCENT', 'ITO', '080467894132', 2, 2, 'Playboy@123');
INSERT INTO users
  (username, email, first_name, last_name, phone_number, gender_id, department_id, password)
VALUES('davido', 'david03@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 3, 'Playboy@123');
INSERT INTO users
  (username, email, first_name, last_name, phone_number, gender_id, department_id, password)
VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 2, 4, 'Playboy@123');
INSERT INTO users
  (username, email, first_name, last_name, phone_number, gender_id, department_id, password)
VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123');
INSERT INTO users
  (username, email, first_name, last_name, phone_number, gender_id, department_id, password)
VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123');



DROP TABLE IF EXISTS visitors;
CREATE TABLE visitors(
    id int(11) not null primary key auto_increment,
    fullname varchar(64) not null,
    user_id int null,
    purpose_id int null,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    address text,
    phone_number varchar(16),
    CONSTRAINT FK_WHOM_TO_SEE FOREIGN KEY(user_id) references users(id),
    CONSTRAINT FK_PURPOSE FOREIGN KEY(purpose_id) references purpose(id)
);

INSERT INTO visitors
  (fullname, user_id, purpose_id, date_added, address, phone_number)
VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja', '08050917923' );



DROP TABLE IF EXISTS tag;
CREATE TABLE tag
(
  tag_number varchar(3) PRIMARY KEY,
  tag_status TINYINT(1)
);


INSERT INTO tag
  (tag_number, tag_status)
VALUES('001', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('002', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('003', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('004', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('005', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('006', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('007', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('008', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('009', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('010', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('011', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('012', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('013', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('014', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('015', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('016', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('017', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('018', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('019', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('020', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('021', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('022', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('023', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('024', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('025', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('026', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('027', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('028', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('029', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('030', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('031', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('032', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('033', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('034', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('035', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('036', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('037', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('038', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('039', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('040', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('041', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('042', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('043', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('044', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('045', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('046', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('047', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('048', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('049', TRUE );
INSERT INTO tag
  (tag_number, tag_status)
VALUES('050', TRUE );

;

DROP TABLE IF EXISTS visitor_tag;
CREATE TABLE visitor_tag
(
  visitor_id int not null,
  tag varchar(3),
  CONSTRAINT FK_VISITORS_ID FOREIGN KEY (visitor_id) references visitors(id),
  CONSTRAINT FK_TAG_NUMBER FOREIGN KEY(tag) references tag(tag_number)
);


DROP TABLE IF EXISTS clock_in;
CREATE TABLE clock_in
(
  visitor_id int not null,
  time_in timestamp DEFAULT CURRENT_TIMESTAMP,-- TIME IN timestamp,
  time_out timestamp default '2000-08-02 00:00:00',
  tag varchar(3),
  CONSTRAINT FK_VISITORS PRIMARY KEY(visitor_id, time_in)
);