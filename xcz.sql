USE [master]
GO
/****** Object:  Database [CityJumpCab]    Script Date: 17-Aug-20 12:10:06 AM ******/
CREATE DATABASE [CityJumpCab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CityJumpCab', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CityJumpCab.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CityJumpCab_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CityJumpCab_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CityJumpCab] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CityJumpCab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CityJumpCab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CityJumpCab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CityJumpCab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CityJumpCab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CityJumpCab] SET ARITHABORT OFF 
GO
ALTER DATABASE [CityJumpCab] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CityJumpCab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CityJumpCab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CityJumpCab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CityJumpCab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CityJumpCab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CityJumpCab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CityJumpCab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CityJumpCab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CityJumpCab] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CityJumpCab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CityJumpCab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CityJumpCab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CityJumpCab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CityJumpCab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CityJumpCab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CityJumpCab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CityJumpCab] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CityJumpCab] SET  MULTI_USER 
GO
ALTER DATABASE [CityJumpCab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CityJumpCab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CityJumpCab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CityJumpCab] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CityJumpCab] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CityJumpCab]
GO
/****** Object:  Table [dbo].[CarCategory]    Script Date: 17-Aug-20 12:10:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCar] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_CarCategory_IsActive]  DEFAULT ((1)),
	[IsDeleted] [bit] NULL CONSTRAINT [DF_CarCategory_IsDeleted]  DEFAULT ((0)),
	[RatesperKm] [decimal](18, 2) NULL,
	[DriverAllow] [decimal](18, 2) NULL,
	[createdby] [int] NULL,
	[createddate] [date] NULL CONSTRAINT [DF_CarCategory_createddate]  DEFAULT (getdate()),
	[modifiedby] [int] NULL,
	[modifieddate] [date] NULL,
 CONSTRAINT [PK_CarCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GetTaxiEnquriy]    Script Date: 17-Aug-20 12:10:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GetTaxiEnquriy](
	[TaxiID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_GetTaxiEnquriy] PRIMARY KEY CLUSTERED 
(
	[TaxiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategryCar]    Script Date: 17-Aug-20 12:10:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategryCar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [nchar](10) NULL,
	[SubCategoryCar] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_SubCategryCar_IsActive]  DEFAULT ((1)),
	[IsDeleted] [bit] NULL CONSTRAINT [DF_SubCategryCar_IsDeleted]  DEFAULT ((0)),
	[createdby] [int] NULL,
	[createddate] [date] NULL CONSTRAINT [DF_SubCategryCar_createddate]  DEFAULT (getdate()),
	[modifiedby] [int] NULL,
	[modifieddate] [date] NULL,
 CONSTRAINT [PK_SubCategryCar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaxiEnquiry]    Script Date: 17-Aug-20 12:10:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaxiEnquiry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[Phone] [varchar](50) NULL,
	[Car] [int] NULL,
	[ToDate] [date] NULL,
	[FormDate] [date] NULL,
	[ToLocation] [varchar](max) NULL,
	[FormLocaton] [varchar](max) NULL,
	[Trip] [varchar](50) NULL CONSTRAINT [DF_TaxiEnquiry_Trip]  DEFAULT ((0)),
 CONSTRAINT [PK_TaxiEnquiry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CarCategory] ON 

INSERT [dbo].[CarCategory] ([id], [CategoryCar], [IsActive], [IsDeleted], [RatesperKm], [DriverAllow], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (1, N'Mini', 1, 0, NULL, NULL, 1, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[CarCategory] ([id], [CategoryCar], [IsActive], [IsDeleted], [RatesperKm], [DriverAllow], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (2, N'Sedan', 1, 0, NULL, NULL, 1, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[CarCategory] ([id], [CategoryCar], [IsActive], [IsDeleted], [RatesperKm], [DriverAllow], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (3, N'SUV', 1, 0, NULL, NULL, 1, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[CarCategory] ([id], [CategoryCar], [IsActive], [IsDeleted], [RatesperKm], [DriverAllow], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (4, N'Mini Bus', 1, 0, NULL, NULL, 1, CAST(N'2020-07-06' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CarCategory] OFF
SET IDENTITY_INSERT [dbo].[SubCategryCar] ON 

INSERT [dbo].[SubCategryCar] ([id], [CatId], [SubCategoryCar], [IsActive], [IsDeleted], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (1, N'1         ', N'Wagner', 1, 0, NULL, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[SubCategryCar] ([id], [CatId], [SubCategoryCar], [IsActive], [IsDeleted], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (2, N'1         ', N'Ritz', 1, 0, NULL, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[SubCategryCar] ([id], [CatId], [SubCategoryCar], [IsActive], [IsDeleted], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (3, N'2         ', N'Dzire', 1, 0, NULL, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[SubCategryCar] ([id], [CatId], [SubCategoryCar], [IsActive], [IsDeleted], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (4, N'2         ', N'Honda City', 1, 0, NULL, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[SubCategryCar] ([id], [CatId], [SubCategoryCar], [IsActive], [IsDeleted], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (5, N'3         ', N'Toyota Innova', 1, 0, NULL, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[SubCategryCar] ([id], [CatId], [SubCategoryCar], [IsActive], [IsDeleted], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (6, N'3         ', N'Ertiga', 1, 0, NULL, CAST(N'2020-07-06' AS Date), NULL, NULL)
INSERT [dbo].[SubCategryCar] ([id], [CatId], [SubCategoryCar], [IsActive], [IsDeleted], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (7, N'4         ', N'Mini Bus Tempo', 1, 0, NULL, CAST(N'2020-07-06' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCategryCar] OFF
SET IDENTITY_INSERT [dbo].[TaxiEnquiry] ON 

INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (1, N'MD ZIAUL', N'8766364552', NULL, NULL, NULL, N'Noida', NULL, NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (2, N'MD ZIAUL', N'8766364552', NULL, NULL, NULL, N'Noida', NULL, NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (3, N'Hemant', N'8285251698', NULL, NULL, NULL, N'Noida', NULL, NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (4, N'Hemant', N'8285251698', NULL, NULL, NULL, N'Trilok Puri', NULL, NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (5, N'Dashrath chauhan', N'8285251698', 3, NULL, NULL, N'Delhi', N'Dahradun', NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (6, N'MD ZIAUL', N'8766364552', 4, NULL, NULL, N'Noida', N'HOUSE No. 45 BLOCK EXTRA 9 A TRILOK', NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (7, N'MD ZIAUL', N'8766364552', 1, NULL, NULL, N'Delhi', N'HOUSE No. 45 BLOCK EXTRA 9 A TRILOK', NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (8, N'Naushad', N'9873785148', 2, NULL, NULL, N'Delhi', N'Hydrabad', NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (9, N'Hemant Kashyap', N'8285251698', 2, CAST(N'2020-06-08' AS Date), CAST(N'2020-12-08' AS Date), N'Kalyanpuri, Delhi, India', N'TRILOK PURI, Trilok Puri Road, Himmatpuri, Trilokpuri, Delhi, India', NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (10, N'naushad', NULL, NULL, NULL, NULL, N'TRILOK PURI, Trilok Puri Road, Himmatpuri, Trilokpuri, Delhi, India', N'Kalyanpur, Kanpur, Uttar Pradesh, India', NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (11, N'Hemant Kashyap', NULL, NULL, NULL, NULL, N'Noida Sector 18, Noida, Uttar Pradesh, India', N'Delhi, India', NULL)
INSERT [dbo].[TaxiEnquiry] ([Id], [Name], [Phone], [Car], [ToDate], [FormDate], [ToLocation], [FormLocaton], [Trip]) VALUES (12, N'Naushad Alam', N'9873785148', 4, CAST(N'2020-11-08' AS Date), CAST(N'2020-12-08' AS Date), N'Noida, Uttar Pradesh, India', N'Delhi, India', N'Roundtrip')
SET IDENTITY_INSERT [dbo].[TaxiEnquiry] OFF
ALTER TABLE [dbo].[GetTaxiEnquriy] ADD  CONSTRAINT [DF_GetTaxiEnquriy_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[getTaxiDetails]    Script Date: 17-Aug-20 12:10:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[getTaxiDetails]
@id int
AS
BEGIN
			select A.* from TaxiEnquiry as A
			where A.Id=@id
	
END
GO
USE [master]
GO
ALTER DATABASE [CityJumpCab] SET  READ_WRITE 
GO
