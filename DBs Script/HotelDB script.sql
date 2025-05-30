USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 4/25/2025 6:43:52 AM ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Hotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Hotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY FULL 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hotel', N'ON'
GO
ALTER DATABASE [Hotel] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hotel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_ID] [int] IDENTITY(1,1) NOT NULL,
	[Capacity] [int] NULL,
	[Room_Type] [varchar](20) NULL,
	[Bed_Type] [varchar](20) NULL,
	[Room_Status] [varchar](20) NULL,
	[Rate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[guest_ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Bdate] [date] NULL,
	[Country] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ReservationType] [varchar](50) NULL,
	[Loyalty_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[guest_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Reservation_ID] [int] IDENTITY(1,1) NOT NULL,
	[Checkin_Date] [datetime] NULL,
	[Checkout_Date] [datetime] NULL,
	[ReservationType] [varchar](50) NULL,
	[ReservationStatus] [varchar](20) NULL,
	[Guest_ID] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Reservation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest_Room_Reservation]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest_Room_Reservation](
	[Guest_ID] [int] NULL,
	[Room_ID] [int] NOT NULL,
	[Reservation_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC,
	[Reservation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Current_Reservitions]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Current_Reservitions]
AS
SELECT concat(g.Fname,g.Lname) FullName,r.Reservation_ID,r.Checkin_Date,r.Checkout_Date , ro.Room_ID FROM Guest g JOIN Reservations r on g.guest_ID=r.Guest_ID 
join Guest_Room_Reservation g_r on r.Reservation_ID=g_r.Reservation_ID join Room ro ON g_r.Room_ID=ro.Room_ID
WHERE ro.Room_Status='Occupied'

GO
/****** Object:  Table [dbo].[Guest_Phone]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest_Phone](
	[Guest_ID] [int] NOT NULL,
	[Phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_guest_phone] PRIMARY KEY CLUSTERED 
(
	[Guest_ID] ASC,
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Guest_Phone]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Guest_Phone]
AS
SELECT g.guest_ID,CONCAT(g.Fname,g.Lname) FullName ,p.Phone FROM  Guest g JOIN Guest_Phone p ON g.guest_ID=p.Guest_ID
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](20) NULL,
	[Lname] [varchar](20) NULL,
	[Bdate] [date] NULL,
	[s_Address] [varchar](20) NULL,
	[HireDate] [date] NULL,
	[s_Role] [varchar](20) NULL,
	[s_shift] [varchar](20) NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[Description] [varchar](20) NULL,
	[rate] [int] NULL,
	[staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Staff_With_Service]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Staff_With_Service]
AS
SELECT st.staff_id, concat(st.Fname,st.Lname) FullName,se.Name Service_Name FROM Staff st JOIN Service se ON st.staff_id=se.staff_id

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_date] [datetime] NULL,
	[payment_method] [varchar](20) NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[reservation_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_MonthlyRevenue]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MonthlyRevenue] AS
SELECT 
    MONTH(p.payment_date) AS MonthNumber,
    DATENAME(MONTH, p.payment_date) AS MonthName,
    SUM(p.total_amount) AS TotalRevenue
FROM Payment p
GROUP BY MONTH(p.payment_date), DATENAME(MONTH, p.payment_date);
GO
/****** Object:  View [dbo].[vw_AnnualRevenue]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AnnualRevenue] AS
SELECT 
    YEAR(p.payment_date) AS Year,
    SUM(p.total_amount) AS TotalRevenue
FROM Payment p
GROUP BY YEAR(p.payment_date);
GO
/****** Object:  View [dbo].[vw_DailyRevenue]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_DailyRevenue] AS
SELECT 
    CAST(p.payment_date AS DATE) AS PaymentDate,
    SUM(p.total_amount) AS DailyRevenue,
    COUNT(*) AS NumberOfTransactions
FROM Payment p
GROUP BY CAST(p.payment_date AS DATE);
GO
/****** Object:  View [dbo].[vw_AverageLengthOfStay]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AverageLengthOfStay] AS
SELECT 
    AVG(DATEDIFF(DAY, r.Checkin_Date, r.Checkout_Date)) AS AvgStayDuration,
    COUNT(*) AS TotalReservations FROM Reservations r
GO
/****** Object:  View [dbo].[vw_TopNumberOfReservations]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TopNumberOfReservations]
AS
SELECT TOP(10) 
  g.guest_ID,  
  COUNT(r.Reservation_ID) AS NumberOfReservations,
  CONCAT(g.Fname, ' ', g.Lname) AS GuestFullName
FROM 
    Guest g 
JOIN 
    Reservations r ON g.guest_ID = r.Guest_ID
GROUP BY 
    g.guest_ID, g.Fname, g.Lname
ORDER BY 
    NumberOfReservations DESC;
GO
/****** Object:  View [dbo].[vw_AverageRoomRates]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AverageRoomRates] AS
SELECT 
    r.Room_Type,
    AVG(r.Rate) AS AverageRate,
    MIN(r.Rate) AS MinimumRate,
    MAX(r.Rate) AS MaximumRate,
    COUNT(*) AS RoomCount
FROM 
    Room r
GROUP BY 
    r.Room_Type;
GO
/****** Object:  View [dbo].[vw_RoomTypePerformance]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_RoomTypePerformance] AS
SELECT 
    r.Room_Type,
    AVG(r.Rate) AS AvgRate,
    COUNT(DISTINCT gr.Reservation_ID) AS ReservationCount,
    SUM(DATEDIFF(DAY, res.Checkin_Date, res.Checkout_Date)) AS OccupiedNights,
    SUM(DATEDIFF(DAY, res.Checkin_Date, res.Checkout_Date)) * AVG(r.Rate) AS EstimatedRevenue
FROM 
    Room r
LEFT JOIN 
    Guest_Room_Reservation gr ON r.Room_ID = gr.Room_ID
LEFT JOIN 
    Reservations res ON gr.Reservation_ID = res.Reservation_ID
    AND res.ReservationStatus NOT IN ('Cancelled')
GROUP BY 
    r.Room_Type
GO
/****** Object:  Table [dbo].[Guest_Service]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest_Service](
	[guest_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
 CONSTRAINT [c5] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC,
	[guest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_MostRepeatedServices]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--11
CREATE VIEW [dbo].[vw_MostRepeatedServices] AS
SELECT 
    s.service_id,
    s.Name AS ServiceName,
    COUNT(*) AS TotalUsage,
    COUNT(DISTINCT gs.guest_id) AS UniqueGuests,
    COUNT(*) / NULLIF(COUNT(DISTINCT gs.guest_id), 0) AS UsesPerGuest,
    COUNT(CASE WHEN usage_count > 1 THEN 1 END) AS RepeatUsageCount
FROM 
    Service s
JOIN 
    Guest_Service gs ON s.service_id = gs.service_id
JOIN (
    SELECT 
        guest_id, 
        service_id, 
        COUNT(*) AS usage_count
    FROM 
        Guest_Service
    GROUP BY 
        guest_id, service_id
) AS usage_stats ON gs.service_id = usage_stats.service_id AND gs.guest_id = usage_stats.guest_id
GROUP BY 
    s.service_id, s.Name
GO
/****** Object:  Table [dbo].[Loyalty_Program]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loyalty_Program](
	[Loyalty_ID] [int] IDENTITY(1,1) NOT NULL,
	[Points_Accumulated] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Loyalty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_phone]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_phone](
	[staff_id] [int] NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [c1] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC,
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (sysdatetime()) FOR [payment_date]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (sysdatetime()) FOR [Checkin_Date]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (sysdatetime()) FOR [Checkout_Date]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF_ReservationStatus]  DEFAULT ('Pending') FOR [ReservationStatus]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD FOREIGN KEY([Loyalty_ID])
REFERENCES [dbo].[Loyalty_Program] ([Loyalty_ID])
GO
ALTER TABLE [dbo].[Guest_Phone]  WITH CHECK ADD FOREIGN KEY([Guest_ID])
REFERENCES [dbo].[Guest] ([guest_ID])
GO
ALTER TABLE [dbo].[Guest_Room_Reservation]  WITH CHECK ADD FOREIGN KEY([Guest_ID])
REFERENCES [dbo].[Guest] ([guest_ID])
GO
ALTER TABLE [dbo].[Guest_Room_Reservation]  WITH CHECK ADD FOREIGN KEY([Reservation_ID])
REFERENCES [dbo].[Reservations] ([Reservation_ID])
GO
ALTER TABLE [dbo].[Guest_Room_Reservation]  WITH CHECK ADD FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
ALTER TABLE [dbo].[Guest_Service]  WITH CHECK ADD  CONSTRAINT [c3] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Guest_Service] CHECK CONSTRAINT [c3]
GO
ALTER TABLE [dbo].[Guest_Service]  WITH CHECK ADD  CONSTRAINT [c4] FOREIGN KEY([guest_id])
REFERENCES [dbo].[Guest] ([guest_ID])
GO
ALTER TABLE [dbo].[Guest_Service] CHECK CONSTRAINT [c4]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [c6] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservations] ([Reservation_ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [c6]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([Guest_ID])
REFERENCES [dbo].[Guest] ([guest_ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [c2] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [c2]
GO
ALTER TABLE [dbo].[Staff_phone]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [CK_Guest_Bdate] CHECK  (([Bdate]<=getdate() AND [Bdate]>=dateadd(year,(-120),getdate())))
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [CK_Guest_Bdate]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [CK_Payment_Date] CHECK  (([Payment_date]<=getdate()))
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [CK_Payment_Date]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CK_Emp_Salary] CHECK  (([Salary]>=(3000)))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CK_Emp_Salary]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CK_Staff_Age] CHECK  (([Bdate]<=getdate() AND [Bdate]<=dateadd(year,(-18),getdate())))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CK_Staff_Age]
GO
/****** Object:  StoredProcedure [dbo].[AddLoyaltyPoints]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLoyaltyPoints]
    @guest_id INT,
    @checkin DATE,
    @checkout DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @loyalty_id INT;
    DECLARE @num_nights INT = DATEDIFF(DAY, @checkin, @checkout);

    SELECT @loyalty_id = Loyality_ID
    FROM Guest
    WHERE Guest_ID = @guest_id;

    IF @loyalty_id IS NOT NULL
    BEGIN
        UPDATE Loyalty_Program
        SET Points_Accumulated = Points_Accumulated + (@num_nights * 10)
        WHERE Loyalty_ID = @loyalty_id;

        SELECT 'Points added successfully.';
    END
    ELSE
    BEGIN
        SELECT 'Guest is not enrolled in a loyalty program.';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CreateLoyaltyAccount]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateLoyaltyAccount]
    @guest_id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Guest WHERE Guest_ID = @guest_id AND Loyality_ID IS NULL)
    BEGIN
        DECLARE @new_id INT;

        INSERT INTO Loyalty_Program (Points_Accumulated) VALUES (0);
        SET @new_id = SCOPE_IDENTITY();

        UPDATE Guest SET Loyality_ID = @new_id WHERE Guest_ID = @guest_id;

        SELECT 'Loyalty account created and linked to guest.';
    END
    ELSE
    BEGIN
        SELECT 'Guest already has a loyalty account.';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetLoyaltyPoints]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLoyaltyPoints]
    @guest_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT g.Fname + ' ' + g.Lname AS GuestName, lp.Points_Accumulated
    FROM Guest g
    JOIN Loyalty_Program lp ON g.Loyality_ID = lp.Loyalty_ID
    WHERE g.Guest_ID = @guest_id;
END
GO
/****** Object:  StoredProcedure [dbo].[MakeReservation]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MakeReservation]
    @guest_id INT,
    @room_id INT,
    @checkin_date DATE,
    @checkout_date DATE,
    @reservation_type VARCHAR(50) = 'Online',
    @reservation_status VARCHAR(20) = 'Confirmed'
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the Guest exists
    IF NOT EXISTS (SELECT 1 FROM Guest WHERE Guest_ID = @guest_id)
    BEGIN
        RAISERROR('The guest does not exist.', 16, 1);
        RETURN;
    END

    -- 2. Check if the Room exists
    IF NOT EXISTS (SELECT 1 FROM Room WHERE Room_ID = @room_id)
    BEGIN
        RAISERROR('The room does not exist.', 16, 1);
        RETURN;
    END

    -- 3. Check if the room is already reserved during the period
    IF EXISTS (
        SELECT 1
        FROM Guest_Room_Reservation grr
        JOIN Reservations r ON grr.Reservation_ID = r.Reservation_ID
        WHERE grr.Room_ID = @room_id
          AND (
              (@checkin_date BETWEEN r.Checkin_Date AND r.Checkout_Date)
              OR (@checkout_date BETWEEN r.Checkin_Date AND r.Checkout_Date)
              OR (r.Checkin_Date BETWEEN @checkin_date AND @checkout_date)
          )
    )
    BEGIN
        RAISERROR('The room is already reserved for this period.', 16, 1);
        RETURN;
    END

    -- 4. Insert into Reservations
    INSERT INTO Reservations (Checkin_Date, Checkout_Date, ReservationType, ReservationStatus, Guest_ID)
    VALUES (@checkin_date, @checkout_date, @reservation_type, @reservation_status, @guest_id);

    -- 5. Get the new Reservation_ID
    DECLARE @reservation_id INT = SCOPE_IDENTITY();

    -- 6. Link Guest with Room
    INSERT INTO Guest_Room_Reservation (Guest_ID, Room_ID, Reservation_ID)
    VALUES (@guest_id, @room_id, @reservation_id);

    PRINT 'Reservation completed successfully.';
END;
GO
/****** Object:  StoredProcedure [dbo].[RedeemPointsForDiscount]    Script Date: 4/25/2025 6:43:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RedeemPointsForDiscount]
    @guest_id INT,
    @reservation_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @loyalty_id INT, 
	@points INT, 
	@discount DECIMAL(10,2),
    @total_amount DECIMAL(10,2);

    -- 1. الحصول على Loyalty_ID
    SELECT @loyalty_id = Loyality_ID
    FROM Guest
    WHERE Guest_ID = @guest_id;

    IF @loyalty_id IS NULL
    BEGIN
        SELECT 'Guest is not enrolled in a loyalty program.' AS Message;
		RETURN;

    END

    -- 2. الحصول على النقاط الحالية
    SELECT @points = Points_Accumulated
    FROM Loyalty_Program
    WHERE Loyalty_ID = @loyalty_id;

    -- 3. حساب الخصم (كل 10 نقاط = 1 وحدة خصم)
    SET @discount = @points / 10.0;

    -- 4. الحصول على المبلغ الأصلي
    SELECT @total_amount = total_amount
    FROM Payment
    WHERE reservation_id = @reservation_id;

    -- 5. لا يكون الخصم أكثر من المبلغ
    IF @discount > @total_amount
    BEGIN
        SET @discount = @total_amount;
        SET @points = CEILING(@total_amount * 10);  -- إعادة حساب النقاط المطلوبة
    END

    -- 6. تحديث المبلغ بعد الخصم
    UPDATE Payment
    SET total_amount = total_amount - @discount
    WHERE reservation_id = @reservation_id;

    -- 7. خصم النقاط المستخدمة
    UPDATE Loyalty_Program
    SET Points_Accumulated = Points_Accumulated - @points
    WHERE Loyalty_ID = @loyalty_id;

    PRINT 'Discount applied successfully.';
END
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO
