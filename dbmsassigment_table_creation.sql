create database if not exists `dbmsassignment`;
use dbmsassignment;

CREATE TABLE PASSENGER (
    Passenger_name VARCHAR(40),
    Category VARCHAR(10),
    Gender CHAR(1),
    Boarding_City VARCHAR(20),
    Destination_City VARCHAR(20),
    Distance INT,
    Bus_Type VARCHAR(10)
);


CREATE TABLE PRICE (
    Bus_Type VARCHAR(10),
    Distance INT,
    Price INT
);