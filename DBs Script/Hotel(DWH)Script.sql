use Hotel_DWH
go

-- dim_time 
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT,
    weekday VARCHAR(10),
    quarter INT
)


DECLARE @StartDate DATE = '2000-01-01'
DECLARE @EndDate DATE = '2030-12-31'

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO dim_date (
        date_key,
        full_date,
        year,
        month,
        day,
        weekday,
        quarter
    )
    VALUES (
        CONVERT(INT, CONVERT(CHAR(8), @StartDate, 112)), -- date_key like 20000101
        @StartDate,
        YEAR(@StartDate),
        MONTH(@StartDate),
        DAY(@StartDate),
        DATENAME(WEEKDAY, @StartDate),
        DATEPART(QUARTER, @StartDate)
    );

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END

--- dim_guest
CREATE TABLE dim_Guest (
    guest_ID INT ,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Bdate DATE,
    Country VARCHAR(50),
    Email VARCHAR(50),
    ReservationType VARCHAR(50),
	Phone VARCHAR(20),

    PRIMARY KEY (Guest_ID, Phone)
)
go

--- dim_staff 
CREATE TABLE dim_Staff (
    staff_id INT ,
    Fname VARCHAR(20),
    Lname VARCHAR(20),
    Bdate DATE,
    s_Address VARCHAR(20),
    HireDate DATE,
    s_Role VARCHAR(20),
    s_shift VARCHAR(20),
    Salary INT,
	phone VARCHAR(20),

	PRIMARY KEY (staff_id, phone)
)
go


--- dim_Service
CREATE TABLE dim_Service (
    service_id INT PRIMARY KEY,
    Name VARCHAR(20),
    Description VARCHAR(50),
    rate INT,
)
go

--- dim_Room
CREATE TABLE dim_Room (
    Room_ID INT PRIMARY KEY,
    Capacity INT,
    Room_Type VARCHAR(20),
    Bed_Type VARCHAR(20),
    Room_Status VARCHAR(20),
    Rate INT
)
go


--- dim_payment
CREATE TABLE dim_Payment (
    invoice_id INT PRIMARY KEY,
    payment_date_code int,
    payment_method VARCHAR(20),
	reservation_id INT,
    ReservationType VARCHAR(50),
    ReservationStatus VARCHAR(20)
)
go

--- Fact_Reservations
CREATE TABLE Fact_Reservations (
    Reservation_ID INT ,
	Guest_ID INT,
	invoice_id INT,
	service_id INT,
	staff_id,
	Room_ID INT,
	LoyaltyID INT,
    Checkin_Date_code int,
    Checkout_Date_code int,
	Points_Accumulated INT,
    Total_Amount DECIMAL(10, 2)

	PRIMARY KEY (Reservation_ID, Room_ID)
)
go

drop table Fact_Reservations
drop table dim_Guest