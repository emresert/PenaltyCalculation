USE [master]
GO
/****** Object:  Database [PenaltyCalculateDB]    Script Date: 25.09.2019 09:12:20 ******/
CREATE DATABASE [PenaltyCalculateDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PenaltyCalculateDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PenaltyCalculateDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PenaltyCalculateDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PenaltyCalculateDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PenaltyCalculateDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PenaltyCalculateDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PenaltyCalculateDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PenaltyCalculateDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PenaltyCalculateDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PenaltyCalculateDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PenaltyCalculateDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PenaltyCalculateDB] SET  MULTI_USER 
GO
ALTER DATABASE [PenaltyCalculateDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PenaltyCalculateDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PenaltyCalculateDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PenaltyCalculateDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PenaltyCalculateDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PenaltyCalculateDB]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 25.09.2019 09:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [nvarchar](70) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 25.09.2019 09:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[holidayId] [int] IDENTITY(1,1) NOT NULL,
	[holidayName] [nvarchar](70) NULL,
	[holidayDate] [date] NULL,
	[fkCountry] [int] NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[holidayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (1, N'Istanbul')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (2, N'Paris')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (3, N'Dubai')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Holiday] ON 

INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (1, N'New Year', CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (2, N'Children''s Day', CAST(N'2020-04-23' AS Date), 1)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (3, N'Democracy Day', CAST(N'2020-07-15' AS Date), 1)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (4, N'Republic  Day', CAST(N'2019-10-29' AS Date), 1)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (5, N'Youthall Day', CAST(N'2020-05-19' AS Date), 1)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (6, N'New Year', CAST(N'2020-01-01' AS Date), 2)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (7, N'Eastern', CAST(N'2020-04-21' AS Date), 2)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (8, N'White Sunday', CAST(N'2020-06-09' AS Date), 2)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (9, N'Noel', CAST(N'2019-12-25' AS Date), 2)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (10, N'Saints Day', CAST(N'2019-11-01' AS Date), 2)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (11, N'National 1 Day', CAST(N'2019-12-02' AS Date), 3)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (12, N'National 2 Day', CAST(N'2019-12-03' AS Date), 3)
INSERT [dbo].[Holiday] ([holidayId], [holidayName], [holidayDate], [fkCountry]) VALUES (13, N'New Year', CAST(N'2020-01-01' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Holiday] OFF
ALTER TABLE [dbo].[Holiday]  WITH CHECK ADD  CONSTRAINT [FK_Holiday_Country] FOREIGN KEY([fkCountry])
REFERENCES [dbo].[Country] ([countryId])
GO
ALTER TABLE [dbo].[Holiday] CHECK CONSTRAINT [FK_Holiday_Country]
GO
/****** Object:  StoredProcedure [dbo].[spFindingHoliday]    Script Date: 25.09.2019 09:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spFindingHoliday](@datefirst nvarchar(11),@datelast nvarchar(11),@fkCountry int)
as
begin
select * from Country c inner join Holiday h on c.countryId = h.fkCountry
where holidayDate between @datefirst and @datelast and c.countryId = @fkCountry
end
GO
USE [master]
GO
ALTER DATABASE [PenaltyCalculateDB] SET  READ_WRITE 
GO
