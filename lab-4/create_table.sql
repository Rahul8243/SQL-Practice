CREATE TABLE List_bus (
    Bus_no VARCHAR(10) PRIMARY KEY,
    Bus_name VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Fare INT,
    Date DATE,
    Time TIME
);

CREATE TABLE Bus_Status (
    Bus_no VARCHAR(10),
    Available_seats INT,
    Booked_seats INT,
    FOREIGN KEY (Bus_no) REFERENCES List_bus(Bus_no)
);

CREATE TABLE Passenger_details (
    Passenger_id VARCHAR(10),
    P_Name VARCHAR(50),
    Bus_no VARCHAR(10),
    Age INT,
    Gender VARCHAR(10),
    Status VARCHAR(20),
    PRIMARY KEY (Passenger_id),
    FOREIGN KEY (Bus_no) REFERENCES List_bus(Bus_no)
);