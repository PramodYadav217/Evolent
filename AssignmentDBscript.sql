USE [master]
GO
/****** Object:  Database [AssignmentDB]    Script Date: 05/11/2018 14:01:44 ******/
CREATE DATABASE [AssignmentDB] ON  PRIMARY 
( NAME = N'AssignmentDB', FILENAME = N'D:\PramodY_Personal\Test\Assignment\AssignmentDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AssignmentDB_log', FILENAME = N'D:\PramodY_Personal\Test\Assignment\AssignmentDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AssignmentDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssignmentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssignmentDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AssignmentDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AssignmentDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AssignmentDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AssignmentDB] SET ARITHABORT OFF
GO
ALTER DATABASE [AssignmentDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [AssignmentDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AssignmentDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AssignmentDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AssignmentDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AssignmentDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AssignmentDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AssignmentDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AssignmentDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AssignmentDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AssignmentDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [AssignmentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AssignmentDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AssignmentDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AssignmentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AssignmentDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AssignmentDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AssignmentDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AssignmentDB] SET  READ_WRITE
GO
ALTER DATABASE [AssignmentDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [AssignmentDB] SET  MULTI_USER
GO
ALTER DATABASE [AssignmentDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AssignmentDB] SET DB_CHAINING OFF
GO
USE [AssignmentDB]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 05/11/2018 14:01:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ContactMaster] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON
INSERT [dbo].[Contact] ([ContactId], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (1, N'F11122', N'L111', N'email1@gmail.com', N'111-222-3333', 1)
INSERT [dbo].[Contact] ([ContactId], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (2, N'f2', N'l2', N'test2@gmail.com', N'222-333-4444', 1)
INSERT [dbo].[Contact] ([ContactId], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (5, N'f7', N'L7', N'test7@gmail.com', N'123-456-7890', 1)
INSERT [dbo].[Contact] ([ContactId], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (6, N'f8', N'l8', N'test8@gmail.com', N'456-123-7890', 0)
SET IDENTITY_INSERT [dbo].[Contact] OFF
/****** Object:  Default [DF_Table_1_IsActive]    Script Date: 05/11/2018 14:01:45 ******/
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Table_1_IsActive]  DEFAULT ((0)) FOR [Status]
GO
