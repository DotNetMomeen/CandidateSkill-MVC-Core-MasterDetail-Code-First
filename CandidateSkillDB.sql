USE [master]
GO
/****** Object:  Database [CandidateSkillDB]    Script Date: 8/31/2024 5:28:14 AM ******/
CREATE DATABASE [CandidateSkillDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CandidateSkillDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CandidateSkillDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CandidateSkillDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CandidateSkillDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CandidateSkillDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CandidateSkillDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CandidateSkillDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CandidateSkillDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CandidateSkillDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CandidateSkillDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CandidateSkillDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CandidateSkillDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CandidateSkillDB] SET  MULTI_USER 
GO
ALTER DATABASE [CandidateSkillDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CandidateSkillDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CandidateSkillDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CandidateSkillDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CandidateSkillDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CandidateSkillDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CandidateSkillDB', N'ON'
GO
ALTER DATABASE [CandidateSkillDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CandidateSkillDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CandidateSkillDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/31/2024 5:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 8/31/2024 5:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[CandidateId] [int] IDENTITY(1,1) NOT NULL,
	[CandidateName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Fresher] [bit] NOT NULL,
 CONSTRAINT [PK_Candidates] PRIMARY KEY CLUSTERED 
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateSkills]    Script Date: 8/31/2024 5:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateSkills](
	[CandidateSkillId] [int] IDENTITY(1,1) NOT NULL,
	[SkillId] [int] NOT NULL,
	[CandidateId] [int] NOT NULL,
 CONSTRAINT [PK_CandidateSkills] PRIMARY KEY CLUSTERED 
(
	[CandidateSkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 8/31/2024 5:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillId] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240830211824_Momeen Ahmed', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[Candidates] ON 

INSERT [dbo].[Candidates] ([CandidateId], [CandidateName], [DateOfBirth], [Phone], [Image], [Fresher]) VALUES (1, N'Sobuj Ali', CAST(N'2024-07-15' AS Date), N'01515283102', N'/Images/638606787766229285_01.jpg', 1)
INSERT [dbo].[Candidates] ([CandidateId], [CandidateName], [DateOfBirth], [Phone], [Image], [Fresher]) VALUES (2, N'Jaher Islam', CAST(N'2024-08-20' AS Date), N'01515226633', N'/Images/638606788021874593_93f40ec756290812571be534e12bcfe7.jpg', 1)
INSERT [dbo].[Candidates] ([CandidateId], [CandidateName], [DateOfBirth], [Phone], [Image], [Fresher]) VALUES (3, N'Kabir Ahmed Raju', CAST(N'2024-08-04' AS Date), N'01515226644', N'/Images/638606788263104515_saiful-bin-a-kalam-passport-size-photo.jpg', 1)
SET IDENTITY_INSERT [dbo].[Candidates] OFF
GO
SET IDENTITY_INSERT [dbo].[CandidateSkills] ON 

INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (1, 2, 1)
INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (2, 6, 1)
INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (3, 6, 1)
INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (4, 3, 2)
INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (5, 9, 2)
INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (6, 3, 3)
INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (7, 7, 3)
INSERT [dbo].[CandidateSkills] ([CandidateSkillId], [SkillId], [CandidateId]) VALUES (8, 8, 3)
SET IDENTITY_INSERT [dbo].[CandidateSkills] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (1, N'MS SQL Server')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (2, N'C#')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (3, N'HTML')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (4, N'ADO .NET')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (5, N'MVC')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (6, N'MVC API')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (7, N'MVC CORE')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (8, N'MVC CORE API')
INSERT [dbo].[Skills] ([SkillId], [SkillName]) VALUES (9, N'Angular')
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
/****** Object:  Index [IX_CandidateSkills_CandidateId]    Script Date: 8/31/2024 5:28:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_CandidateSkills_CandidateId] ON [dbo].[CandidateSkills]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CandidateSkills_SkillId]    Script Date: 8/31/2024 5:28:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_CandidateSkills_SkillId] ON [dbo].[CandidateSkills]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CandidateSkills]  WITH CHECK ADD  CONSTRAINT [FK_CandidateSkills_Candidates_CandidateId] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidates] ([CandidateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CandidateSkills] CHECK CONSTRAINT [FK_CandidateSkills_Candidates_CandidateId]
GO
ALTER TABLE [dbo].[CandidateSkills]  WITH CHECK ADD  CONSTRAINT [FK_CandidateSkills_Skills_SkillId] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([SkillId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CandidateSkills] CHECK CONSTRAINT [FK_CandidateSkills_Skills_SkillId]
GO
USE [master]
GO
ALTER DATABASE [CandidateSkillDB] SET  READ_WRITE 
GO
