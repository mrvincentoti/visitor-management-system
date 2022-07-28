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




