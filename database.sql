-- USER TYPE - LOOKUP TABLE
-- USER - BASE TABLE
-- VISITORS - BASE TABLE
-- DEPARTMENT - LOOKUP
-- GENDER - LOOKUP
-- PURPOSE - LOOKUP
-- CLOCKIN - BASE TABLE
------------------------------------

-- USER TYPE
    -- ID
    -- NAME

-- DEPARTMENT
    -- ID
    -- NAME

-- GENDER
    -- ID
    -- NAME

-- PURPOSE
    -- ID
    -- NAME

-- USER TABLE --
    -- USER ID
    -- USERRNAME
    -- EMAIL 
    -- FIRST NAME
    -- LAST LASTNAME
    -- DEPARTMENT [LOOKUP DATA]
    -- PHONE NUMBER
    -- GENDER [LOOKUP DATA]

-- VISITORS
    -- VISITOR ID int(11)
    -- FULLNAME varchar(64)
    -- WHOM TO SEE [USER ID] int fk from user table
    -- PURPOSE [LOOK UP] int fk from purpose table
    -- DATE ADDED timestamp
    -- ADDRESS text

-- CLOCK IN
    -- VISITOR ID [VISITOR TABLE] int fk from visitor table
    -- TIME IN timestamp
    -- TIME OUT timestamp default '0000-00-00 00:00:00'

DROP DATABASE IF EXISTS VMS;

CREATE DATABASE VMS;
USE VMS;

DROP TABLE IF EXISTS user_type;
CREATE TABLE user_type(
    id int not null primary key auto_increment,
    `type` varchar(16) not null
);

DROP TABLE IF EXISTS department;
CREATE TABLE department(
    id int not null primary key auto_increment,
    department varchar(16) not null
);

DROP TABLE IF EXISTS gender;
CREATE TABLE gender(
    id int not null primary key auto_increment,
    genger varchar(16) not null
);

DROP TABLE IF EXISTS purpose;
CREATE TABLE purpose(
    id int not null primary key auto_increment,
    purpose varchar(16) not null
);

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id int not null primary key auto_increment,
    username varchar(16) not null,
    email varchar(32) not null,
    first_name varchar(32) not null,
    last_name varchar(32) not null,
    phone_number varchar(16),
    gender int not null,
    department int not null,
    CONSTRAINT FK_DEPARTMENT FOREIGN KEY(id) REFERENCES department(id),
    CONSTRAINT FK_GENDER FOREIGN KEY(id) REFERENCES gender(id)
);

DROP TABLE IF EXISTS visitors;
CREATE TABLE visitors(
    id int(11) not null primary key auto_increment,
    fullname varchar(64),
    whom_to_see int not null,
    purpose int not null,
    date_added timestamp,
    address text,
    CONSTRAINT FK_WHOM_TO_SEE FOREIGN KEY (id) references users(id),
    CONSTRAINT FK_PURPOSE FOREIGN KEY(id) references purpose(id)
    -- WHOM TO SEE [USER ID] int fk from user table
    -- PURPOSE [LOOK UP] int fk from purpose table
    -- ADDRESS text    -- DATE ADDED timestamp

);

DROP TABLE IF EXISTS clock_in;
CREATE TABLE clock_in(
	visitors_id int not null, -- VISITOR ID [VISITOR TABLE] int fk from visitor table
    time_in timestamp,-- TIME IN timestamp,
    time_out timestamp default '0000-00-00 00:00:00',
    CONSTRAINT FK_VISITORS_ID FOREIGN KEY (id) references visitors(id)
);





