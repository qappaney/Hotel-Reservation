--- Relational (OLTP)

use Hotel 
go 
--Guest
select * from guest
select * from Guest_Phone
select * from Loyalty_Program

--staff
select * from staff
select * from Staff_phone

-- service
select * from Service

--Room
select * from Room

-- Payment , Reservation
select * from Reservations
select * from Payment

--Guest_Room_Reservation ,  Guest_Service
select * from Guest_Room_Reservation
select * from Guest_Service

------------------------------------------------------------
--staging

use Hotel_Stage
go

select * from Guest_stage
select * from Guest_Phone_stage
select * from Loyalty_Program_stage

--staff
select * from staff_stage
select * from Staff_phone_stage

-- service
select * from Service_stage

--Room
select * from Room_stage

-- Payment , 
select * from Reservations_stage
select * from Payment_stage

select p.invoice_id ,p.payment_method,p.reservation_id ,
	   p.payment_date,
	   CONVERT(INT, CONVERT(CHAR(8), CAST(p.payment_date AS DATE), 112)) AS payment_date_code
from Payment_stage p

select 
    r.Reservation_ID,
    r.Guest_ID,
    r.Checkin_Date,
    r.Checkout_Date,
    CAST(CONVERT(CHAR(8), CAST(r.Checkin_Date AS DATE), 112) AS INT) AS Checkin_Date_Code,
    CAST(CONVERT(CHAR(8), CAST(r.Checkout_Date AS DATE), 112) AS INT) AS Checkout_Date_Code,
	l.LoyaltyID,
	l.Points_Accumulated
FROM Reservations_stage r join Guest_stage g 
	on g.guest_ID = r.Guest_ID
join Loyalty_Program_stage l
	on l.LoyaltyID = g.LoyaltyID



--- Guest_Room_Reservation_Service_stage
select * from Guest_Room_Reservation_Service_stage

----------------------------------------------------------
--DWH
use hotel_DWH
go

select * from dim_date
select * from dim_Guest
select * from dim_Staff
select * from dim_Service
select * from dim_Room
select * from dim_Payment
select * from Fact_Reservations



truncate table dim_Payment