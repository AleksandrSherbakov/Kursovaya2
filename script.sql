USE [master]
GO
/****** Object:  Database [MaterialsCalculator]    Script Date: 12.03.2024 11:34:38 ******/
CREATE DATABASE [MaterialsCalculator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MaterialsCalculator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MaterialsCalculator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MaterialsCalculator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MaterialsCalculator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MaterialsCalculator] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MaterialsCalculator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MaterialsCalculator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET ARITHABORT OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MaterialsCalculator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MaterialsCalculator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MaterialsCalculator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MaterialsCalculator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MaterialsCalculator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MaterialsCalculator] SET  MULTI_USER 
GO
ALTER DATABASE [MaterialsCalculator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MaterialsCalculator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MaterialsCalculator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MaterialsCalculator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MaterialsCalculator] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MaterialsCalculator] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MaterialsCalculator] SET QUERY_STORE = OFF
GO
USE [MaterialsCalculator]
GO
/****** Object:  Table [dbo].[Calculation]    Script Date: 12.03.2024 11:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calculation](
	[CalculationID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [int] NULL,
	[MaterialID] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CalculationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12.03.2024 11:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 12.03.2024 11:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 12.03.2024 11:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Image] [nvarchar](20) NULL,
	[Square] [nvarchar](20) NULL,
	[Price] [nvarchar](20) NULL,
	[MaterialTypeID] [int] NULL,
	[ManufacturerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 12.03.2024 11:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[MaterialTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Picture] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.03.2024 11:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.03.2024 11:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[GenderID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Calculation] ON 

INSERT [dbo].[Calculation] ([CalculationID], [Price], [MaterialID], [UserID]) VALUES (3, 40, 1, 3)
SET IDENTITY_INSERT [dbo].[Calculation] OFF
GO
INSERT [dbo].[Gender] ([GenderID], [Name], [Description]) VALUES (1, N'Male', N'Male gender')
INSERT [dbo].[Gender] ([GenderID], [Name], [Description]) VALUES (2, N'Female', N'Female gender')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerID], [Name], [Description], [Email]) VALUES (1, N'TileCrafters', N'Specializing in Tile', N'info@tilecrafters.com')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [Name], [Description], [Email]) VALUES (2, N'RoofWorks', N'Experts in Roof', N'contact@roof.com')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [Name], [Description], [Email]) VALUES (3, N'LogsMasters', N'Innovators in Logs manufacturing', N'info@logsmasters.com')
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([MaterialID], [Name], [Description], [Image], [Square], [Price], [MaterialTypeID], [ManufacturerID]) VALUES (1, N'BlackTile', N'Like batman', N'1robin.png', N'25', N'10', 1, 1)
INSERT [dbo].[Material] ([MaterialID], [Name], [Description], [Image], [Square], [Price], [MaterialTypeID], [ManufacturerID]) VALUES (2, N'1', N'2', N'2robin.png', N'10', N'1', 2, 2)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
INSERT [dbo].[MaterialType] ([MaterialTypeID], [Name], [Description], [Picture]) VALUES (1, N'Tile', N'Tile materials', N'Tile.png')
INSERT [dbo].[MaterialType] ([MaterialTypeID], [Name], [Description], [Picture]) VALUES (2, N'Roof', N'Roof materials', N'Roof.png')
INSERT [dbo].[MaterialType] ([MaterialTypeID], [Name], [Description], [Picture]) VALUES (3, N'Logs', N'Logs materials', N'Logs.png')
GO
INSERT [dbo].[Role] ([RoleID], [Name], [Description]) VALUES (1, N'Admin', N'Administrator role')
INSERT [dbo].[Role] ([RoleID], [Name], [Description]) VALUES (2, N'User', N'Regular user role')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [LastName], [FirstName], [MiddleName], [Email], [Password], [GenderID], [RoleID]) VALUES (1, N'admin', N'admin', N'admin', N'admin@admin.com', N'Admin!1', 1, 1)
INSERT [dbo].[Users] ([UserID], [LastName], [FirstName], [MiddleName], [Email], [Password], [GenderID], [RoleID]) VALUES (2, N'admin', N'admin', N'admin', N'admin@admin.com', N'Admin!1', 1, 1)
INSERT [dbo].[Users] ([UserID], [LastName], [FirstName], [MiddleName], [Email], [Password], [GenderID], [RoleID]) VALUES (3, N'user', N'user', N'user', N'user@user.com', N'User!1', 2, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Calculation]  WITH CHECK ADD FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Calculation]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([MaterialTypeID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [MaterialsCalculator] SET  READ_WRITE 
GO
