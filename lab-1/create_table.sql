CREATE TABLE list_buses (
    Bus_no VARCHAR(10) PRIMARY KEY,
    Bus_name VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Fare INT,
    Date DATE,
    Time TIME
);

CREATE TABLE bus_status (
    Bus_no VARCHAR(10) PRIMARY KEY,
    Available_seats INT,
    Booked_seats INT
);

CREATE TABLE passengers (
    passenger_id VARCHAR(20),
    p_name VARCHAR(20),
    bus_no VARCHAR(10),
    gender VARCHAR(20),
    age INT,
    status VARCHAR(10)
);