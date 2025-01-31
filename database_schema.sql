CREATE TABLE member (
    Member_ID VARCHAR(20) PRIMARY KEY,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Date_Of_Birth DATE,
    Gender ENUM('M', 'F'),
    Email_ID VARCHAR(30),
    Phone_Number VARCHAR(30),
    Member_Address VARCHAR(30),
    Postcode VARCHAR(10),
    Disable_Access ENUM('Yes', 'No')
);

CREATE TABLE instructor (
    Instructor_ID VARCHAR(20) PRIMARY KEY,
    Instructor_Name VARCHAR(30),
    Instructor_Address VARCHAR(30),
    Instructor_Postcode VARCHAR(10),
    Instructor_Contact VARCHAR(20)
);

CREATE TABLE room (
    Room_ID VARCHAR(20) PRIMARY KEY,
    Room_Name VARCHAR(20),
    Room_Capacity INT
);

CREATE TABLE activity (
    Activity_ID VARCHAR(20) PRIMARY KEY,
    Activity_Name VARCHAR(30),
    Duration INT,
    Activity_Capacity INT,
    Room_ID VARCHAR(20),
    Instructor_ID VARCHAR(20),
    Minimum_Age INT,
    Booking_Fee DECIMAL(6,2),
    FOREIGN KEY (Room_ID) REFERENCES room(Room_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES instructor(Instructor_ID)
);

CREATE TABLE slot (
    Slot_ID VARCHAR(20) PRIMARY KEY,
    Schedule_Day VARCHAR(20),
    Schedule_Time TIME,
    Activity_ID VARCHAR(20),
    FOREIGN KEY (Activity_ID) REFERENCES activity(Activity_ID)
);

CREATE TABLE booking (
    Booking_ID VARCHAR(20) PRIMARY KEY,
    Member_ID VARCHAR(20),
    Slot_ID VARCHAR(20),
    Booking_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Member_ID) REFERENCES member(Member_ID),
    FOREIGN KEY (Slot_ID) REFERENCES slot(Slot_ID)
);
