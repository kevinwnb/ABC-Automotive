USE [master]
GO
/****** Object:  Database [ABCAutomotive]    Script Date: 2020-06-24 6:48:18 PM ******/
CREATE DATABASE [ABCAutomotive]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ABCAutomotive', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ABCAutomotive.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ABCAutomotive_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ABCAutomotive_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ABCAutomotive] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ABCAutomotive].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ABCAutomotive] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ABCAutomotive] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ABCAutomotive] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ABCAutomotive] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ABCAutomotive] SET ARITHABORT OFF 
GO
ALTER DATABASE [ABCAutomotive] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ABCAutomotive] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ABCAutomotive] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ABCAutomotive] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ABCAutomotive] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ABCAutomotive] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ABCAutomotive] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ABCAutomotive] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ABCAutomotive] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ABCAutomotive] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ABCAutomotive] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ABCAutomotive] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ABCAutomotive] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ABCAutomotive] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ABCAutomotive] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ABCAutomotive] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ABCAutomotive] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ABCAutomotive] SET RECOVERY FULL 
GO
ALTER DATABASE [ABCAutomotive] SET  MULTI_USER 
GO
ALTER DATABASE [ABCAutomotive] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ABCAutomotive] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ABCAutomotive] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ABCAutomotive] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ABCAutomotive] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ABCAutomotive', N'ON'
GO
ALTER DATABASE [ABCAutomotive] SET QUERY_STORE = OFF
GO
USE [ABCAutomotive]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CheckOutDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[CheckInDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[StudentID] [char](8) NOT NULL,
	[RessourceID] [int] NOT NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoginUserName] [nchar](30) NOT NULL,
	[Password] [nchar](30) NOT NULL,
	[DepartementHead] [bit] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [money] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Type] [nvarchar](30) NOT NULL,
	[StudentID] [char](8) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ressource]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ressource](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[ReserveStatus] [bit] NOT NULL,
	[ImagePath] [nvarchar](500) NULL,
	[DateRemoved] [datetime] NULL,
	[ReservingStudentID] [char](8) NULL,
 CONSTRAINT [PK_Ressources] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [char](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BalanceDue] [money] NOT NULL,
	[Status] [bit] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Loan] ON 

INSERT [dbo].[Loan] ([ID], [CheckOutDate], [DueDate], [CheckInDate], [Status], [StudentID], [RessourceID]) VALUES (1086, CAST(N'2019-11-20T14:01:42.147' AS DateTime), CAST(N'2019-11-22T00:00:00.000' AS DateTime), CAST(N'2019-11-20T14:03:19.067' AS DateTime), 2, N'20190002', 1)
INSERT [dbo].[Loan] ([ID], [CheckOutDate], [DueDate], [CheckInDate], [Status], [StudentID], [RessourceID]) VALUES (1087, CAST(N'2019-11-20T14:04:14.903' AS DateTime), CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, 1, N'20190001', 1)
INSERT [dbo].[Loan] ([ID], [CheckOutDate], [DueDate], [CheckInDate], [Status], [StudentID], [RessourceID]) VALUES (1088, CAST(N'2019-11-20T14:05:26.917' AS DateTime), CAST(N'2019-11-22T00:00:00.000' AS DateTime), CAST(N'2019-11-20T14:05:38.533' AS DateTime), 3, N'20190002', 2)
INSERT [dbo].[Loan] ([ID], [CheckOutDate], [DueDate], [CheckInDate], [Status], [StudentID], [RessourceID]) VALUES (1089, CAST(N'2019-11-20T15:35:40.763' AS DateTime), CAST(N'2019-11-22T00:00:00.000' AS DateTime), CAST(N'2019-11-20T16:00:51.613' AS DateTime), 2, N'20190002', 3)
INSERT [dbo].[Loan] ([ID], [CheckOutDate], [DueDate], [CheckInDate], [Status], [StudentID], [RessourceID]) VALUES (1090, CAST(N'2019-11-20T16:00:38.423' AS DateTime), CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, 1, N'20190002', 17)
INSERT [dbo].[Loan] ([ID], [CheckOutDate], [DueDate], [CheckInDate], [Status], [StudentID], [RessourceID]) VALUES (1092, CAST(N'2020-06-24T18:38:36.757' AS DateTime), CAST(N'2020-06-26T00:00:00.000' AS DateTime), NULL, 1, N'20205569', 3)
SET IDENTITY_INSERT [dbo].[Loan] OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([ID], [LoginUserName], [Password], [DepartementHead]) VALUES (1, N'StephenCarter                 ', N'password1                     ', 0)
INSERT [dbo].[Login] ([ID], [LoginUserName], [Password], [DepartementHead]) VALUES (2, N'Luffy                         ', N'password2                     ', 1)
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([ID], [Amount], [Date], [Type], [StudentID]) VALUES (1, 1.0000, CAST(N'2019-11-26T17:46:37.883' AS DateTime), N'Debit', N'20190001')
INSERT [dbo].[Payments] ([ID], [Amount], [Date], [Type], [StudentID]) VALUES (2, 1.0000, CAST(N'2019-11-27T09:48:59.123' AS DateTime), N'Debit', N'20190001')
INSERT [dbo].[Payments] ([ID], [Amount], [Date], [Type], [StudentID]) VALUES (3, 1.0000, CAST(N'2019-11-29T14:10:58.977' AS DateTime), N'Debit', N'20190001')
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([ID], [Type]) VALUES (1, N'Regular Program')
INSERT [dbo].[Program] ([ID], [Type]) VALUES (2, N'Block Release')
SET IDENTITY_INSERT [dbo].[Program] OFF
GO
SET IDENTITY_INSERT [dbo].[Ressource] ON 

INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (1, N'Auto Body Repair TechnologyLL', 1, 1, 48.7000, 1, NULL, NULL, N'20190002')
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (2, N'Automotive Service: Inspection, Maintenance', 1, 1, 47.9600, 1, NULL, NULL, N'20190001')
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (3, N'Automotive Engine Performance', 2, 1, 50.0000, 0, N'C:\Users\Wendpulungo Balima\Desktop\NBCC\COURSES\Y2\S1\N-tierDev\Project\0.Application\ABCAutomotive\Images\Ressources\AEP.jpg', NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (4, N'Auto Mechanics Fundamentals', 1, 1, 64.9900, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (5, N'Nissan Frontier Pickup 98-04', 1, 1, 44.5000, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (6, N'Haynes Publications, Inc.', 1, 1, 50.0000, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (7, N'Gears and Gear Cutting', 1, 1, 50.0000, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (8, N'The Amateur''s  Lathe', 1, 1, 50.0000, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (9, N'Mercedes-Benz 350 & 450 (71 - 80)', 1, 1, 34.0000, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (10, N'Professional Sheet Metal Fabrication', 1, 1, 38.0800, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (11, N'Tuning The A-Series Engine', 1, 1, 39.3500, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (12, N'How to Rebuild Your Volkswagen Air-Cooled Engine', 1, 1, 25.9900, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (13, N'Ford Mustang V8 (July 64 - 73)', 1, 1, 30.2200, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (14, N'Porsche 944 (83 - 89)', 1, 2, 30.9900, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (15, N'Spring Design and Manufacture', 1, 2, 50.0000, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (17, N'How to Diagnose and Repair Automotive', 2, 2, 27.6200, 1, NULL, NULL, N'20190002')
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (18, N'SU Carburettors Tuning Tips and Techniques', 1, 2, 24.9700, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (19, N'H-Point', 1, 2, 53.2400, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (20, N'Engine Builder''s Handbook Hp1245', 1, 2, 33.1100, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (21, N'Weber Carburet Hp774', 1, 3, 35.3300, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (23, N'Performance Fuel Injection Systems', 1, 3, 36.7800, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (24, N'BSA Bantam (48 - 71)', 1, 3, 50.0000, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (25, N'The BMW Century', 1, 3, 51.1700, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (26, N'Chevrolet Camaro (82 - 92)', 1, 3, 35.9500, 0, NULL, NULL, NULL)
INSERT [dbo].[Ressource] ([ID], [Title], [Status], [Type], [Price], [ReserveStatus], [ImagePath], [DateRemoved], [ReservingStudentID]) VALUES (27, N'Mechanical Ignition Handbook', 1, 3, 30.0000, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ressource] OFF
GO
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [BalanceDue], [Status], [ProgramID], [StartDate], [EndDate]) VALUES (N'20152323', N'Kevin', N'Wegner', 0.0000, 0, 1, CAST(N'2015-08-23T00:00:00.000' AS DateTime), CAST(N'2016-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [BalanceDue], [Status], [ProgramID], [StartDate], [EndDate]) VALUES (N'20162345', N'Camille', N'Balima', 0.0000, 0, 1, CAST(N'2016-09-25T00:00:00.000' AS DateTime), CAST(N'2017-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [BalanceDue], [Status], [ProgramID], [StartDate], [EndDate]) VALUES (N'20182345', N'Rachel', N'Compton', 0.0000, 0, 2, CAST(N'2018-10-10T00:00:00.000' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [BalanceDue], [Status], [ProgramID], [StartDate], [EndDate]) VALUES (N'20190001', N'James', N'Downson', 0.0000, 1, 2, CAST(N'2019-11-06T22:27:02.163' AS DateTime), CAST(N'2020-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [BalanceDue], [Status], [ProgramID], [StartDate], [EndDate]) VALUES (N'20190002', N'Jerome', N'Blah', 0.0000, 1, 2, CAST(N'2019-11-06T22:28:55.000' AS DateTime), CAST(N'2020-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [BalanceDue], [Status], [ProgramID], [StartDate], [EndDate]) VALUES (N'20205569', N'Mario', N'Sanders', 0.0000, 1, 1, CAST(N'2022-06-24T18:37:13.000' AS DateTime), CAST(N'2022-06-24T18:37:13.000' AS DateTime))
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Ressources] FOREIGN KEY([RessourceID])
REFERENCES [dbo].[Ressource] ([ID])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Ressources]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Student]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Program]
GO
/****** Object:  StoredProcedure [dbo].[CheckIn_Get_Borrowings]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[CheckIn_Get_Borrowings]
    @ResourceID int
AS
BEGIN
    IF (SELECT [Status] FROM Loan WHERE Ressourceid = @ResourceID) = 1
    BEGIN
        SELECT Ressource.ID AS ResourceID, Title, [Type] AS ResourceType, Ressource.[Status] AS ResourceStatus, Loan.ID AS LoanID ,Loan.CheckOutDate, Loan.DueDate FROM Ressource
        INNER JOIN Loan ON Ressource.ID = Loan.RessourceID WHERE Loan.StudentID = (SELECT StudentID FROM Loan WHERE RessourceID = @ResourceID) AND Loan.[Status] = 1
    END
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteStudent]
@StudentId CHAR(8)
AS 
BEGIN
DELETE Student WHERE ID = @StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[GetStudentByResourceID]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetStudentByResourceID]
@ResourceID INT
AS
BEGIN
  IF(SELECT Status FROM Loan WHERE RessourceID = @ResourceID) = 1
  SELECT * FROM Student INNER JOIN Loan ON Student.ID = Loan.StudentID WHERE RessourceID = @ResourceID
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Loan]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Insert_Loan]

@CheckOutDate DATETIME,
@DueDate DATETIME,
@CheckInDate DATETIME = NULL,
@Status NVARCHAR(50),
@StudentID CHAR(8),
@RessourceID INT
AS
BEGIN 
	INSERT INTO Loan VALUES (@CheckOutDate, @DueDate, @CheckInDate, @Status, @StudentID, @RessourceID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertStudent]
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50),
@BalanceDue DECIMAL,
@Status BIT,
@ProgramID INT,
@StartDate DATETIME,
@EndDate DATETIME
AS
BEGIN
	DECLARE @RandomInt INT;
	SET @RandomInt = CONCAT(2020, (CAST(RAND()*10000 AS INT)));
	WHILE (@RandomInt IN (SELECT ID FROM Student))
		SET @RandomInt = CONCAT(2020, (CAST(RAND()*10000 AS INT)))

	INSERT INTO Student (ID, FirstName , LastName,BalanceDue ,Status, ProgramID , StartDate ,EndDate)
	VALUES 
		(@RandomInt, @FirstName ,@LastName,@BalanceDue ,@Status, @ProgramID , @StartDate ,@EndDate)

END
GO
/****** Object:  StoredProcedure [dbo].[PaymentAddPayment]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PaymentAddPayment]
	@StudentID CHAR(8),
	@Payment MONEY,
	@Date DATETIME,
	@Type NVARCHAR(30)
AS
BEGIN
	INSERT INTO Payments VALUES (@Payment, @Date, @Type, @StudentID)
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentMakePayment]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PaymentMakePayment]
	@StudentID CHAR(8),
	@Payment MONEY
AS
BEGIN
	DECLARE @BalanceDue MONEY = (SELECT BalanceDue FROM Student WHERE ID = @StudentID)
	UPDATE Student SET BalanceDue = @BalanceDue - @Payment WHERE ID = @StudentID
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentRetrieveStudentInfo]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PaymentRetrieveStudentInfo]
	@StudentID NVARCHAR(MAX)
AS
BEGIN
	SELECT FirstName, LastName, BalanceDue, Program.[Type] AS Program, StartDate, EndDate, [Status] FROM Student
	INNER JOIN Program ON Student.ProgramID = Program.ID
	WHERE Student.ID = @StudentID
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentRetrieveStudents]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PaymentRetrieveStudents]
	@SearchCriteria NVARCHAR(MAX),
	@SearchBy INT
AS
BEGIN
	IF @SearchBy = 1
	BEGIN
		SELECT ID, FirstName, LastName FROM Student
		WHERE Student.ID LIKE @SearchCriteria + '%'
	END
	ELSE
	BEGIN
		SELECT ID, FirstName, LastName FROM Student
		WHERE FirstName + ' ' + LastName LIKE @SearchCriteria + '%' OR LastName LIKE @SearchCriteria + '%'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[RetriveMatchingStudents]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RetriveMatchingStudents]
@StudentID CHAR(8) = NULL,
@PartialLastName  NVARCHAR(50) = NULL

AS

BEGIN 
	SELECT ID, FirstName, LastName, [TimeStamp]
	FROM Student 
	WHERE ID = @StudentID  OR LastName LIKE @PartialLastName +'%'
END
GO
/****** Object:  StoredProcedure [dbo].[RetriveRessourceDetails]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RetriveRessourceDetails]
@RessourceID INT

AS

BEGIN 
	SELECT ID ,Title, Type, Price, Status, ReserveStatus,ImagePath ,ReservingStudentID 
	FROM Ressource 
	WHERE ID = @RessourceID
	
END
GO
/****** Object:  StoredProcedure [dbo].[RetriveStudentInformation]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RetriveStudentInformation]
@StudentID CHAR(8)

AS

BEGIN 
	SELECT *  FROM Student 
	WHERE ID = @StudentID
	
END
GO
/****** Object:  StoredProcedure [dbo].[RetriveStudentLoans]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RetriveStudentLoans]
@StudentID CHAR(8) = NULL

AS

BEGIN 
	SELECT * FROM Loan WHERE StudentId = @StudentID
	
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Loan_Status]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Update_Loan_Status]
	@ResourceID int,
	@Status nvarchar(50),
	@CheckInDate datetime = NULL
AS
BEGIN
	UPDATE Loan SET [Status] = @Status, CheckInDate = @CheckInDate WHERE RessourceID = @ResourceID
END

SELECT * FROM Student
GO
/****** Object:  StoredProcedure [dbo].[Update_Resource_Status]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Update_Resource_Status]
	@ResourceID int,
	@ResourceStatus nvarchar(50),
	@DateRemoved Datetime = NULL
AS
BEGIN
	UPDATE Ressource SET [Status] = @ResourceStatus, DateRemoved = @DateRemoved WHERE ID = @ResourceID
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Student_BalanceDue]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Update_Student_BalanceDue]
	@StudentID char(8),
	@NewBalanceDue money
AS
BEGIN
	UPDATE Student SET BalanceDue = @NewBalanceDue WHERE ID = @StudentID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRessource]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateRessource]
@RessourceID INT
AS
BEGIN
Update Ressource SET ReserveStatus = 0 WHERE ID = @RessourceID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRessource_ReserveStatus]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateRessource_ReserveStatus]
@RessourceID INT,
@StudentID CHAR(8)
AS
BEGIN
Update Ressource 
	SET ReserveStatus = 1 , ReservingStudentID = @StudentID
	WHERE ID = @RessourceID AND ReserveStatus = 0
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRessource_Status]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateRessource_Status]
@RessourceID INT
AS
BEGIN
Update Ressource SET Status = 2 WHERE ID = @RessourceID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 2020-06-24 6:48:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateStudent]
@TimeStamp TIMESTAMP OUTPUT,
@StudentID CHAR(8),
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50),
@BalanceDue DECIMAL,
@Status BIT,
@ProgramID INT,
@StartDate DATETIME,
@EndDate DATETIME
AS
BEGIN 
Update Student
	SET FirstName = @FirstName,
	    LastName= @LastName,
		BalanceDue = @BalanceDue,
		Status = @Status,
		ProgramID = @ProgramID,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE ID = @StudentID

	SET @TimeStamp = (SELECT [TimeStamp] FROM Student WHERE ID = @StudentID)
END
GO
USE [master]
GO
ALTER DATABASE [ABCAutomotive] SET  READ_WRITE 
GO
