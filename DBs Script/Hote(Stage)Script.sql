use Hotel_Stage
go

-- Table: Room
CREATE TABLE Room_stage (
    Room_ID INT PRIMARY KEY,
    Capacity INT,
    Room_Type VARCHAR(20),
    Bed_Type VARCHAR(20),
    Room_Status VARCHAR(20),
    Rate INT
)
go

-- Table: Reservations
CREATE TABLE Reservations_stage (
    Reservation_ID INT PRIMARY KEY,
    Checkin_Date DATETIME,
    Checkout_Date DATETIME,
    ReservationType VARCHAR(50),
    ReservationStatus VARCHAR(20),
    Guest_ID INT,
    CreatedAt DATETIME,

)
go

-- Table: Payment
CREATE TABLE Payment_stage (
    invoice_id INT PRIMARY KEY,
    payment_date DATETIME,
    payment_method VARCHAR(20),
    total_amount DECIMAL(10, 2),
    reservation_id INT

)
go


-- Table: Loyalty_Program
CREATE TABLE Loyalty_Program_stage (
    LoyaltyID INT PRIMARY KEY,
    Points_Accumulated INT
)
go

-- Table: Guest
CREATE TABLE Guest_stage (
    guest_ID INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Bdate DATE,
    Country VARCHAR(50),
    Email VARCHAR(50),
    ReservationType VARCHAR(50),
    LoyaltyID INT
)
go

-- Table: Guest_Phone
CREATE TABLE Guest_Phone_stage (
    Guest_ID INT,
    Phone VARCHAR(20),
    PRIMARY KEY (Guest_ID, Phone)
)
go

-- Table: Staff
CREATE TABLE Staff_stage (
    staff_id INT PRIMARY KEY,
    Fname VARCHAR(20),
    Lname VARCHAR(20),
    Bdate DATE,
    s_Address VARCHAR(20),
    HireDate DATE,
    s_Role VARCHAR(20),
    s_shift VARCHAR(20),
    Salary INT
)
go

-- Table: Staff_phone
CREATE TABLE Staff_phone_stage (
    staff_id INT,
    phone VARCHAR(20),
    PRIMARY KEY (staff_id, phone),
);
go

-- Table: Service
CREATE TABLE Service_stage (
    service_id INT PRIMARY KEY,
    Name VARCHAR(20),
    Description VARCHAR(50),
    rate INT,
    staff_id INT,

)
go



-- Table: Guest_Room_Reservation_Service_stage
CREATE TABLE Guest_Room_Reservation_Service_stage (
    Guest_ID INT,
    Room_ID INT,
    Reservation_ID INT,
	service_id INT,
    PRIMARY KEY ( Room_ID, Reservation_ID)
)


