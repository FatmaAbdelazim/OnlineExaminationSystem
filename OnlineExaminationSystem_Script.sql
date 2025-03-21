USE [master]
GO
/****** Object:  Database [Examination]    Script Date: 3/10/2025 2:18:46 AM ******/
CREATE DATABASE [Examination]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Examination', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Examination.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Examination_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Examination_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Examination] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examination].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Examination] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examination] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examination] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examination] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examination] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examination] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Examination] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Examination] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examination] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examination] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examination] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examination] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examination] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examination] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examination] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Examination] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examination] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examination] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examination] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examination] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examination] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examination] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examination] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Examination] SET  MULTI_USER 
GO
ALTER DATABASE [Examination] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Examination] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examination] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examination] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Examination] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Examination] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Examination] SET QUERY_STORE = ON
GO
ALTER DATABASE [Examination] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Examination]
GO
/****** Object:  UserDefinedTableType [dbo].[answer_table_types]    Script Date: 3/10/2025 2:18:46 AM ******/
CREATE TYPE [dbo].[answer_table_types] AS TABLE(
	[que_id] [int] NULL,
	[content] [nvarchar](max) NULL,
	[choose_id] [int] NULL
)
GO
/****** Object:  Table [dbo].[chooses]    Script Date: 3/10/2025 2:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chooses](
	[id] [int] NOT NULL,
	[content] [varchar](max) NOT NULL,
	[que_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] NOT NULL,
	[c_name] [varchar](200) NOT NULL,
	[topic_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] NOT NULL,
	[dept_name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[id] [int] NOT NULL,
	[exam_date] [date] NOT NULL,
	[duration] [time](7) NOT NULL,
	[c_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam_ques]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_ques](
	[ex_id] [int] NOT NULL,
	[que_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC,
	[que_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[id] [int] NOT NULL,
	[fname] [varchar](100) NOT NULL,
	[lname] [varchar](100) NULL,
	[dept_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor_Course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor_Course](
	[ins_id] [int] NOT NULL,
	[c_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC,
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[que_id] [int] NOT NULL,
	[question_type] [varchar](100) NOT NULL,
	[que_content] [varchar](max) NOT NULL,
	[que_point] [int] NOT NULL,
	[ans_content] [varchar](max) NOT NULL,
	[c_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[que_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] NOT NULL,
	[fname] [varchar](100) NOT NULL,
	[lname] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[street] [varchar](200) NULL,
	[dept_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_Answer]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_Answer](
	[content] [varchar](max) NOT NULL,
	[st_id] [int] NOT NULL,
	[ex_id] [int] NOT NULL,
	[choose_id] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_Course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_Course](
	[st_id] [int] NOT NULL,
	[c_id] [int] NOT NULL,
	[grade] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC,
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topic]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topic](
	[id] [int] NOT NULL,
	[topic_name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (1, N'True', 1)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (2, N'False', 1)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (3, N'True', 3)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (4, N'False', 3)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (5, N'True', 6)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (6, N'False', 6)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (7, N'True', 8)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (8, N'False', 8)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (9, N'True', 11)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (10, N'False', 11)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (11, N'True', 13)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (12, N'False', 13)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (13, N'True', 16)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (14, N'False', 16)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (15, N'True', 18)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (16, N'False', 18)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (17, N'True', 21)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (18, N'False', 21)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (19, N'True', 23)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (20, N'False', 23)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (21, N'True', 26)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (22, N'False', 26)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (23, N'True', 28)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (24, N'False', 28)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (25, N'True', 31)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (26, N'False', 31)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (27, N'True', 33)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (28, N'False', 33)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (29, N'True', 36)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (30, N'False', 36)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (31, N'True', 38)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (32, N'False', 38)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (33, N'True', 41)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (34, N'False', 41)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (35, N'True', 43)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (36, N'False', 43)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (37, N'True', 46)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (38, N'False', 46)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (39, N'True', 48)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (40, N'False', 48)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (41, N'const', 2)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (42, N'static', 2)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (43, N'final', 2)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (44, N'var', 2)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (45, N'File', 4)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (46, N'Directory', 4)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (47, N'Stream', 4)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (48, N'Path', 4)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (49, N'internal', 5)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (50, N'null', 5)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (51, N'private', 5)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (52, N'protected', 5)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (53, N':', 7)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (54, N'implements', 7)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (55, N'extends', 7)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (56, N'inherits', 7)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (57, N'Start', 9)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (58, N'Run', 9)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (59, N'Execute', 9)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (60, N'Begin', 9)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (61, N'Object', 10)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (62, N'Class', 10)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (63, N'Base', 10)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (64, N'Main', 10)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (65, N'Encapsulation', 12)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (66, N'Abstraction', 12)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (67, N'Polymorphism', 12)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (68, N'Inheritance', 12)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (69, N':', 14)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (70, N'inherits', 14)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (71, N'extends', 14)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (72, N'implements', 14)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (73, N'Inheritance', 15)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (74, N'Polymorphism', 15)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (75, N'Encapsulation', 15)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (76, N'Abstraction', 15)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (77, N'new', 17)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (78, N'create', 17)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (79, N'instantiate', 17)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (80, N'make', 17)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (81, N'Polymorphism', 19)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (82, N'Encapsulation', 19)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (83, N'Inheritance', 19)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (84, N'Abstraction', 19)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (85, N'override', 20)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (86, N'overload', 20)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (87, N'extends', 20)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (88, N'implements', 20)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (89, N'WHERE', 22)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (90, N'FILTER', 22)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (91, N'HAVING', 22)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (92, N'CONDITION', 22)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (93, N'DROP TABLE', 24)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (94, N'DELETE TABLE', 24)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (95, N'REMOVE TABLE', 24)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (96, N'ERASE TABLE', 24)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (97, N'COUNT', 25)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (98, N'SUM', 25)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (99, N'AVG', 25)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (100, N'TOTAL', 25)
GO
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (101, N'UPDATE', 27)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (102, N'MODIFY', 27)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (103, N'CHANGE', 27)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (104, N'ALTER', 27)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (105, N'DISTINCT', 29)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (106, N'UNIQUE', 29)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (107, N'DIFFERENT', 29)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (108, N'SPECIAL', 29)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (109, N'GROUP BY', 30)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (110, N'ORDER BY', 30)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (111, N'SORT BY', 30)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (112, N'FILTER BY', 30)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (113, N'<a>', 32)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (114, N'<link>', 32)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (115, N'<href>', 32)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (116, N'<url>', 32)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (117, N'<tr>', 34)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (118, N'<td>', 34)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (119, N'<th>', 34)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (120, N'<table-row>', 34)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (121, N'Webpage title', 35)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (122, N'Page header', 35)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (123, N'Document title', 35)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (124, N'HTML title', 35)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (125, N'<img>', 37)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (126, N'<image>', 37)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (127, N'<picture>', 37)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (128, N'<photo>', 37)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (129, N'src', 39)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (130, N'source', 39)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (131, N'path', 39)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (132, N'link', 39)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (133, N'<b>', 40)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (134, N'<strong>', 40)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (135, N'<bold>', 40)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (136, N'<em>', 40)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (137, N'char', 42)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (138, N'int', 42)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (139, N'string', 42)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (140, N'byte', 42)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (141, N'malloc', 44)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (142, N'alloc', 44)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (143, N'new', 44)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (144, N'create', 44)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (145, N'printf', 45)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (146, N'print', 45)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (147, N'println', 45)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (148, N'write', 45)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (149, N'scanf', 47)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (150, N'input', 47)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (151, N'read', 47)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (152, N'get', 47)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (153, N'for', 49)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (154, N'while', 49)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (155, N'do-while', 49)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (156, N'loop', 49)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (157, N'//', 50)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (158, N'/*', 50)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (159, N'#', 50)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (160, N'--', 50)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (161, N'True', 51)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (162, N'False', 51)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (163, N'True', 53)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (164, N'False', 53)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (165, N'True', 56)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (166, N'False', 56)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (167, N'True', 58)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (168, N'False', 58)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (169, N'True', 61)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (170, N'False', 61)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (171, N'True', 63)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (172, N'False', 63)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (173, N'True', 66)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (174, N'False', 66)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (175, N'True', 68)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (176, N'False', 68)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (177, N'True', 71)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (178, N'False', 71)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (179, N'True', 73)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (180, N'False', 73)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (181, N'True', 76)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (182, N'False', 76)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (183, N'True', 78)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (184, N'False', 78)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (185, N'True', 81)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (186, N'False', 81)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (187, N'True', 83)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (188, N'False', 83)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (189, N'True', 86)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (190, N'False', 86)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (191, N'True', 88)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (192, N'False', 88)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (193, N'True', 91)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (194, N'False', 91)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (195, N'True', 93)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (196, N'False', 93)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (197, N'True', 96)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (198, N'False', 96)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (199, N'True', 98)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (200, N'False', 98)
GO
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (201, N'integer', 52)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (202, N'float', 52)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (203, N'double', 52)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (204, N'null', 52)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (205, N'.', 54)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (206, N'::', 54)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (207, N'->', 54)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (208, N':', 54)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (209, N'void', 55)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (210, N'int', 55)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (211, N'string', 55)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (212, N'bool', 55)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (213, N'abstract', 57)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (214, N'virtual', 57)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (215, N'override', 57)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (216, N'sealed', 57)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (217, N'int? x;', 59)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (218, N'int x?;', 59)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (219, N'nullable int x;', 59)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (220, N'int x = null;', 59)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (221, N'Hashtable', 60)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (222, N'Dictionary', 60)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (223, N'List', 60)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (224, N'Array', 60)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (225, N'Inheritance', 62)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (226, N'Polymorphism', 62)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (227, N'Encapsulation', 62)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (228, N'Abstraction', 62)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (229, N'virtual', 64)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (230, N'override', 64)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (231, N'abstract', 64)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (232, N'static', 64)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (233, N'Polymorphism', 65)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (234, N'Inheritance', 65)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (235, N'Encapsulation', 65)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (236, N'Abstraction', 65)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (237, N'default', 67)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (238, N'protected', 67)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (239, N'private', 67)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (240, N'public', 67)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (241, N'interface', 69)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (242, N'abstract', 69)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (243, N'class', 69)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (244, N'struct', 69)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (245, N'Encapsulation', 70)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (246, N'Inheritance', 70)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (247, N'Polymorphism', 70)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (248, N'Abstraction', 70)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (249, N'ALTER TABLE', 72)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (250, N'MODIFY TABLE', 72)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (251, N'CHANGE TABLE', 72)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (252, N'UPDATE TABLE', 72)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (253, N'TRUNCATE', 74)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (254, N'DELETE', 74)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (255, N'REMOVE', 74)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (256, N'DROP', 74)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (257, N'MAX', 75)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (258, N'MIN', 75)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (259, N'SUM', 75)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (260, N'AVG', 75)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (261, N'ORDER BY', 77)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (262, N'SORT BY', 77)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (263, N'GROUP BY', 77)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (264, N'FILTER BY', 77)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (265, N'NOT NULL', 79)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (266, N'UNIQUE', 79)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (267, N'PRIMARY KEY', 79)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (268, N'FOREIGN KEY', 79)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (269, N'DROP DATABASE', 80)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (270, N'DELETE DATABASE', 80)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (271, N'REMOVE DATABASE', 80)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (272, N'ERASE DATABASE', 80)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (273, N'<form>', 82)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (274, N'<input>', 82)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (275, N'<fieldset>', 82)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (276, N'<form-group>', 82)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (277, N'<select>', 84)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (278, N'<option>', 84)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (279, N'<dropdown>', 84)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (280, N'<list>', 84)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (281, N'width', 85)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (282, N'height', 85)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (283, N'size', 85)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (284, N'dimension', 85)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (285, N'<video>', 87)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (286, N'<media>', 87)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (287, N'<embed>', 87)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (288, N'<movie>', 87)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (289, N'<i>', 89)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (290, N'<em>', 89)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (291, N'<italic>', 89)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (292, N'<strong>', 89)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (293, N'alt', 90)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (294, N'title', 90)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (295, N'description', 90)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (296, N'caption', 90)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (297, N'stdio.h', 92)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (298, N'stdlib.h', 92)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (299, N'math.h', 92)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (300, N'string.h', 92)
GO
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (301, N'break', 94)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (302, N'continue', 94)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (303, N'exit', 94)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (304, N'return', 94)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (305, N'strcpy', 95)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (306, N'strdup', 95)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (307, N'strcat', 95)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (308, N'strcmp', 95)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (309, N'while', 97)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (310, N'for', 97)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (311, N'do-while', 97)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (312, N'loop', 97)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (313, N'strlen', 99)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (314, N'strlength', 99)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (315, N'strsize', 99)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (316, N'strcount', 99)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (317, N'&', 100)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (318, N'|', 100)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (319, N'^', 100)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (320, N'~', 100)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (321, N'True', 101)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (322, N'False', 101)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (323, N'True', 103)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (324, N'False', 103)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (325, N'True', 106)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (326, N'False', 106)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (327, N'True', 108)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (328, N'False', 108)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (329, N'True', 111)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (330, N'False', 111)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (331, N'True', 113)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (332, N'False', 113)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (333, N'True', 116)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (334, N'False', 116)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (335, N'True', 118)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (336, N'False', 118)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (337, N'True', 121)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (338, N'False', 121)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (339, N'True', 123)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (340, N'False', 123)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (341, N'True', 126)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (342, N'False', 126)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (343, N'True', 128)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (344, N'False', 128)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (345, N'True', 131)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (346, N'False', 131)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (347, N'True', 133)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (348, N'False', 133)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (349, N'True', 136)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (350, N'False', 136)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (351, N'True', 138)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (352, N'False', 138)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (353, N'True', 141)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (354, N'False', 141)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (355, N'True', 143)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (356, N'False', 143)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (357, N'True', 146)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (358, N'False', 146)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (359, N'True', 148)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (360, N'False', 148)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (361, N'try', 102)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (362, N'catch', 102)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (363, N'finally', 102)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (364, N'throw', 102)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (365, N'protected-internal', 104)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (366, N'public', 104)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (367, N'private', 104)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (368, N'internal', 104)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (369, N'Dictionary', 105)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (370, N'List', 105)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (371, N'Hashtable', 105)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (372, N'Array', 105)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (373, N'False', 107)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (374, N'True', 107)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (375, N'Null', 107)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (376, N'Undefined', 107)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (377, N':', 109)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (378, N'inherits', 109)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (379, N'extends', 109)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (380, N'implements', 109)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (381, N'Object', 110)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (382, N'Class', 110)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (383, N'Base', 110)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (384, N'Main', 110)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (385, N'Inheritance', 112)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (386, N'Polymorphism', 112)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (387, N'Encapsulation', 112)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (388, N'Abstraction', 112)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (389, N'Compilation', 114)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (390, N'Inheritance', 114)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (391, N'Polymorphism', 114)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (392, N'Encapsulation', 114)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (393, N'Constructor', 115)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (394, N'Destructor', 115)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (395, N'Main', 115)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (396, N'Initialize', 115)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (397, N'Private constructor', 117)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (398, N'Static constructor', 117)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (399, N'Public constructor', 117)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (400, N'Default constructor', 117)
GO
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (401, N'sealed', 119)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (402, N'final', 119)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (403, N'static', 119)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (404, N'abstract', 119)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (405, N'Destructor', 120)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (406, N'Finalizer', 120)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (407, N'Dispose', 120)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (408, N'Delete', 120)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (409, N'DISTINCT', 122)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (410, N'UNIQUE', 122)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (411, N'DIFFERENT', 122)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (412, N'SPECIAL', 122)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (413, N'UPDATE', 124)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (414, N'MODIFY', 124)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (415, N'CHANGE', 124)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (416, N'ALTER', 124)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (417, N'UNIQUE', 125)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (418, N'PRIMARY', 125)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (419, N'FOREIGN', 125)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (420, N'CHECK', 125)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (421, N'HAVING', 127)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (422, N'WHERE', 127)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (423, N'FILTER', 127)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (424, N'CONDITION', 127)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (425, N'DELETE', 129)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (426, N'REMOVE', 129)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (427, N'DROP', 129)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (428, N'ERASE', 129)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (429, N'CURDATE', 130)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (430, N'NOW', 130)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (431, N'TODAY', 130)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (432, N'GETDATE', 130)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (433, N'<table>', 132)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (434, N'<tr>', 132)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (435, N'<td>', 132)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (436, N'<th>', 132)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (437, N'href', 134)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (438, N'src', 134)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (439, N'link', 134)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (440, N'url', 134)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (441, N'<script>', 135)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (442, N'<javascript>', 135)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (443, N'<js>', 135)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (444, N'<code>', 135)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (445, N'<div>', 137)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (446, N'<section>', 137)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (447, N'<span>', 137)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (448, N'<block>', 137)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (449, N'<input type="checkbox">', 139)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (450, N'<checkbox>', 139)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (451, N'<check>', 139)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (452, N'<input type="check">', 139)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (453, N'src', 140)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (454, N'source', 140)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (455, N'path', 140)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (456, N'link', 140)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (457, N'scanf', 142)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (458, N'input', 142)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (459, N'read', 142)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (460, N'get', 142)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (461, N'*', 144)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (462, N'&', 144)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (463, N'->', 144)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (464, N'::', 144)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (465, N'malloc', 145)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (466, N'alloc', 145)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (467, N'new', 145)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (468, N'create', 145)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (469, N'for', 147)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (470, N'while', 147)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (471, N'do-while', 147)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (472, N'loop', 147)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (473, N'strcmp', 149)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (474, N'strcompare', 149)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (475, N'compare', 149)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (476, N'strdiff', 149)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (477, N'math.h', 150)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (478, N'cmath', 150)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (479, N'mathlib', 150)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (480, N'mathematics.h', 150)
INSERT [dbo].[chooses] ([id], [content], [que_id]) VALUES (490, N'null', 2)
GO
INSERT [dbo].[course] ([id], [c_name], [topic_id]) VALUES (201, N'HTML', 1)
INSERT [dbo].[course] ([id], [c_name], [topic_id]) VALUES (202, N'Object-Oriented Programming (OOP)', 5)
INSERT [dbo].[course] ([id], [c_name], [topic_id]) VALUES (203, N'SQL Server', 2)
INSERT [dbo].[course] ([id], [c_name], [topic_id]) VALUES (204, N'C# Programming', 3)
INSERT [dbo].[course] ([id], [c_name], [topic_id]) VALUES (205, N'C Programming', 4)
GO
INSERT [dbo].[department] ([id], [dept_name]) VALUES (1, N'Computer Science')
INSERT [dbo].[department] ([id], [dept_name]) VALUES (2, N'Information Technology')
INSERT [dbo].[department] ([id], [dept_name]) VALUES (3, N'Software Engineering')
GO
INSERT [dbo].[exam] ([id], [exam_date], [duration], [c_id]) VALUES (1, CAST(N'2025-03-03' AS Date), CAST(N'01:30:00' AS Time), 201)
INSERT [dbo].[exam] ([id], [exam_date], [duration], [c_id]) VALUES (2970, CAST(N'2025-03-09' AS Date), CAST(N'01:30:00' AS Time), 205)
INSERT [dbo].[exam] ([id], [exam_date], [duration], [c_id]) VALUES (3346, CAST(N'2025-03-09' AS Date), CAST(N'01:30:00' AS Time), 201)
INSERT [dbo].[exam] ([id], [exam_date], [duration], [c_id]) VALUES (4227, CAST(N'2025-03-09' AS Date), CAST(N'01:30:00' AS Time), 201)
INSERT [dbo].[exam] ([id], [exam_date], [duration], [c_id]) VALUES (5813, CAST(N'2025-03-09' AS Date), CAST(N'01:30:00' AS Time), 205)
GO
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 101)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 102)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 103)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 104)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 105)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 106)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 107)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 108)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 109)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (1, 110)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (3346, 31)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (3346, 33)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (3346, 34)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (3346, 37)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (3346, 81)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (4227, 81)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (4227, 88)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (4227, 90)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (4227, 132)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (4227, 136)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (5813, 93)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (5813, 143)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (5813, 144)
INSERT [dbo].[exam_ques] ([ex_id], [que_id]) VALUES (5813, 146)
GO
INSERT [dbo].[instructor] ([id], [fname], [lname], [dept_id]) VALUES (301, N'Dr. Smith', NULL, 1)
INSERT [dbo].[instructor] ([id], [fname], [lname], [dept_id]) VALUES (302, N'Dr. Taylor', NULL, 2)
INSERT [dbo].[instructor] ([id], [fname], [lname], [dept_id]) VALUES (303, N'Dr. Brown', NULL, 3)
INSERT [dbo].[instructor] ([id], [fname], [lname], [dept_id]) VALUES (304, N'Dr. White', NULL, 1)
INSERT [dbo].[instructor] ([id], [fname], [lname], [dept_id]) VALUES (305, N'Dr. Green', NULL, 2)
GO
INSERT [dbo].[instructor_Course] ([ins_id], [c_id]) VALUES (301, 201)
INSERT [dbo].[instructor_Course] ([ins_id], [c_id]) VALUES (301, 204)
INSERT [dbo].[instructor_Course] ([ins_id], [c_id]) VALUES (302, 201)
INSERT [dbo].[instructor_Course] ([ins_id], [c_id]) VALUES (302, 202)
INSERT [dbo].[instructor_Course] ([ins_id], [c_id]) VALUES (303, 203)
INSERT [dbo].[instructor_Course] ([ins_id], [c_id]) VALUES (304, 204)
INSERT [dbo].[instructor_Course] ([ins_id], [c_id]) VALUES (305, 205)
GO
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (1, N'True/False', N'C# is case-sensitive.', 1, N'True', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (2, N'MCQ', N'Which keyword is used to define a constant in C#?', 3, N'const', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (3, N'True/False', N'Interfaces in C# can contain fields.', 1, N'False', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (4, N'MCQ', N'Which class is used for file operations in C#?', 3, N'File', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (5, N'MCQ', N'What is the default access modifier for a class in C#?', 3, N'internal', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (6, N'True/False', N'C# supports multiple inheritance.', 1, N'False', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (7, N'MCQ', N'Which keyword is used to implement an interface?', 3, N':', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (8, N'True/False', N'Abstract classes can have constructors in C#.', 1, N'True', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (9, N'MCQ', N'Which method is used to start a thread in C#?', 3, N'Start', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (10, N'MCQ', N'What is the base class of all classes in C#?', 3, N'Object', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (11, N'True/False', N'Polymorphism allows method overriding.', 1, N'True', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (12, N'MCQ', N'Which OOP principle refers to hiding details?', 3, N'Encapsulation', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (13, N'True/False', N'A constructor has a return type.', 1, N'False', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (14, N'MCQ', N'Which keyword is used to inherit a class?', 3, N':', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (15, N'MCQ', N'Which OOP principle allows reusability?', 3, N'Inheritance', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (16, N'True/False', N'Encapsulation means exposing all class variables.', 1, N'False', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (17, N'MCQ', N'Which keyword is used to create an object in Java?', 3, N'new', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (18, N'True/False', N'Abstract classes can be instantiated.', 1, N'False', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (19, N'MCQ', N'Which OOP principle is related to overriding?', 3, N'Polymorphism', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (20, N'MCQ', N'Which keyword is used for method overriding?', 3, N'override', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (21, N'True/False', N'SQL stands for Structured Query Language.', 1, N'True', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (22, N'MCQ', N'Which SQL clause is used to filter records?', 3, N'WHERE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (23, N'True/False', N'The PRIMARY KEY allows duplicate values.', 1, N'False', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (24, N'MCQ', N'Which command is used to delete a table?', 3, N'DROP TABLE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (25, N'MCQ', N'Which function returns the total count of rows?', 3, N'COUNT', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (26, N'True/False', N'SQL is case-sensitive.', 1, N'False', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (27, N'MCQ', N'Which command is used to update a record?', 3, N'UPDATE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (28, N'True/False', N'JOIN is used to combine rows from multiple tables.', 1, N'True', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (29, N'MCQ', N'Which SQL keyword retrieves unique values?', 3, N'DISTINCT', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (30, N'MCQ', N'Which SQL statement is used to remove duplicates?', 3, N'GROUP BY', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (31, N'True/False', N'HTML stands for Hyper Text Markup Language.', 1, N'True', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (32, N'MCQ', N'Which tag is used to create a hyperlink?', 3, N'<a>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (33, N'True/False', N'The <br> tag is used for a horizontal line.', 1, N'False', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (34, N'MCQ', N'Which tag is used to define a table row?', 3, N'<tr>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (35, N'MCQ', N'What does the <title> tag define?', 3, N'Webpage title', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (36, N'True/False', N'HTML is a programming language.', 1, N'False', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (37, N'MCQ', N'Which tag is used for images in HTML?', 3, N'<img>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (38, N'True/False', N'The <p> tag is used for paragraphs.', 1, N'True', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (39, N'MCQ', N'Which attribute specifies an image path?', 3, N'src', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (40, N'MCQ', N'Which tag is used for bold text?', 3, N'<b>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (41, N'True/False', N'C is a procedural programming language.', 1, N'True', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (42, N'MCQ', N'Which data type is used to store a single character?', 3, N'char', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (43, N'True/False', N'C supports function overloading.', 1, N'False', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (44, N'MCQ', N'Which operator is used to allocate memory dynamically?', 3, N'malloc', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (45, N'MCQ', N'Which function is used to print output in C?', 3, N'printf', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (46, N'True/False', N'C supports OOP principles.', 1, N'False', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (47, N'MCQ', N'Which function is used to take input in C?', 3, N'scanf', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (48, N'True/False', N'The main function in C can return void.', 1, N'True', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (49, N'MCQ', N'Which loop is used when the number of iterations is fixed?', 3, N'for', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (50, N'MCQ', N'Which symbol is used for comments in C?', 3, N'//', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (51, N'True/False', N'C# supports automatic garbage collection.', 1, N'True', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (52, N'MCQ', N'Which of the following is NOT a valid C# data type?', 3, N'integer', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (53, N'True/False', N'C# allows multiple class inheritance.', 1, N'False', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (54, N'MCQ', N'Which operator is used to access members of a namespace?', 3, N'.', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (55, N'MCQ', N'Which keyword is used to define a method in C#?', 3, N'void', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (56, N'True/False', N'Static methods belong to an instance of a class.', 1, N'False', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (57, N'MCQ', N'Which keyword is used to create an abstract class?', 3, N'abstract', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (58, N'True/False', N'C# provides both value types and reference types.', 1, N'True', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (59, N'MCQ', N'What is the correct way to declare a nullable integer?', 3, N'int? x;', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (60, N'MCQ', N'Which collection type allows duplicate keys in C#?', 3, N'Hashtable', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (61, N'True/False', N'All classes in Java inherit from Object.', 1, N'True', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (62, N'MCQ', N'Which OOP concept refers to code reusability?', 3, N'Inheritance', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (63, N'True/False', N'A private method can be accessed outside its class.', 1, N'False', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (64, N'MCQ', N'Which keyword is used for dynamic method dispatch?', 3, N'virtual', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (65, N'MCQ', N'Which feature of OOP provides multiple implementations?', 3, N'Polymorphism', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (66, N'True/False', N'Abstract methods must have a body.', 1, N'False', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (67, N'MCQ', N'Which access modifier allows access within the same package?', 3, N'default', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (68, N'True/False', N'Encapsulation means bundling data and methods together.', 1, N'True', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (69, N'MCQ', N'Which keyword is used to create an interface?', 3, N'interface', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (70, N'MCQ', N'Which OOP principle promotes data hiding?', 3, N'Encapsulation', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (71, N'True/False', N'The UNIQUE constraint allows duplicate values.', 1, N'False', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (72, N'MCQ', N'Which SQL command is used to add a new column?', 3, N'ALTER TABLE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (73, N'True/False', N'HAVING clause is used with aggregate functions.', 1, N'True', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (74, N'MCQ', N'Which SQL statement is used to remove all rows from a table?', 3, N'TRUNCATE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (75, N'MCQ', N'Which function returns the highest value in a column?', 3, N'MAX', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (76, N'True/False', N'GROUP BY is used to group rows with similar values.', 1, N'True', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (77, N'MCQ', N'Which SQL clause sorts the result set?', 3, N'ORDER BY', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (78, N'True/False', N'SQL injection is a security threat.', 1, N'True', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (79, N'MCQ', N'Which SQL constraint ensures a column cannot have NULL values?', 3, N'NOT NULL', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (80, N'MCQ', N'Which command is used to remove a database?', 3, N'DROP DATABASE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (81, N'True/False', N'HTML5 introduced the <canvas> element.', 1, N'True', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (82, N'MCQ', N'Which tag is used to define a form in HTML?', 3, N'<form>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (83, N'True/False', N'The <ul> tag is used for numbered lists.', 1, N'False', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (84, N'MCQ', N'Which tag is used for creating a dropdown list?', 3, N'<select>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (85, N'MCQ', N'Which attribute is used to specify an image width?', 3, N'width', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (86, N'True/False', N'HTML comments are written inside <!-- -->.', 1, N'True', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (87, N'MCQ', N'Which element is used for embedding videos?', 3, N'<video>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (88, N'True/False', N'HTML is case-sensitive.', 1, N'False', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (89, N'MCQ', N'Which tag is used for making text italic?', 3, N'<i>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (90, N'MCQ', N'Which HTML attribute specifies an alternative text for an image?', 3, N'alt', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (91, N'True/False', N'The sizeof operator returns the size of a variable.', 1, N'True', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (92, N'MCQ', N'Which header file is used for input/output functions?', 3, N'stdio.h', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (93, N'True/False', N'A struct can contain functions in C.', 1, N'False', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (94, N'MCQ', N'Which keyword is used to exit from a loop?', 3, N'break', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (95, N'MCQ', N'Which function is used to copy strings?', 3, N'strcpy', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (96, N'True/False', N'C uses pass-by-value by default.', 1, N'True', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (97, N'MCQ', N'Which loop is best when the number of iterations is unknown?', 3, N'while', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (98, N'True/False', N'Pointers store the memory address of a variable.', 1, N'True', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (99, N'MCQ', N'Which function is used to find the length of a string?', 3, N'strlen', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (100, N'MCQ', N'Which operator is used for bitwise AND?', 3, N'&', 205)
GO
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (101, N'True/False', N'C# supports method overloading.', 1, N'True', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (102, N'MCQ', N'Which keyword is used to handle exceptions in C#?', 3, N'try', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (103, N'True/False', N'C# arrays can dynamically resize themselves.', 1, N'False', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (104, N'MCQ', N'Which of the following is NOT an access modifier in C#?', 3, N'protected-internal', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (105, N'MCQ', N'Which collection class allows unique keys?', 3, N'Dictionary', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (106, N'True/False', N'Structs in C# are reference types.', 1, N'False', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (107, N'MCQ', N'What is the default value of a boolean variable in C#?', 3, N'False', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (108, N'True/False', N'Interfaces in C# cannot have fields.', 1, N'True', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (109, N'MCQ', N'Which keyword is used to inherit a class?', 3, N':', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (110, N'MCQ', N'What is the base class of all .NET classes?', 3, N'Object', 204)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (111, N'True/False', N'A class can implement multiple interfaces.', 1, N'True', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (112, N'MCQ', N'Which OOP concept helps reduce code duplication?', 3, N'Inheritance', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (113, N'True/False', N'A constructor can be private.', 1, N'True', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (114, N'MCQ', N'Which of these is NOT a fundamental OOP concept?', 3, N'Compilation', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (115, N'MCQ', N'Which function is called automatically when an object is created?', 3, N'Constructor', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (116, N'True/False', N'Static methods can be overridden.', 1, N'False', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (117, N'MCQ', N'Which of the following restricts object creation?', 3, N'Private constructor', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (118, N'True/False', N'A subclass can override a static method.', 1, N'False', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (119, N'MCQ', N'Which keyword is used to prevent inheritance?', 3, N'sealed', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (120, N'MCQ', N'Which function runs when an object is destroyed?', 3, N'Destructor', 202)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (121, N'True/False', N'SQL views can store data permanently.', 1, N'False', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (122, N'MCQ', N'Which SQL clause removes duplicate records?', 3, N'DISTINCT', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (123, N'True/False', N'A primary key can have NULL values.', 1, N'False', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (124, N'MCQ', N'Which SQL statement is used to update records?', 3, N'UPDATE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (125, N'MCQ', N'Which keyword is used to define a unique value constraint?', 3, N'UNIQUE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (126, N'True/False', N'INNER JOIN returns only matching records.', 1, N'True', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (127, N'MCQ', N'Which SQL clause filters aggregated data?', 3, N'HAVING', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (128, N'True/False', N'The COUNT function ignores NULL values.', 1, N'True', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (129, N'MCQ', N'Which SQL statement deletes records from a table?', 3, N'DELETE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (130, N'MCQ', N'Which function is used to get the current date?', 3, N'CURDATE', 203)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (131, N'True/False', N'The <footer> tag is used to define the header of a page.', 1, N'False', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (132, N'MCQ', N'Which tag is used to display a table?', 3, N'<table>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (133, N'True/False', N'HTML supports case-sensitive tags.', 1, N'False', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (134, N'MCQ', N'Which attribute specifies the URL of a hyperlink?', 3, N'href', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (135, N'MCQ', N'Which tag is used for adding JavaScript code?', 3, N'<script>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (136, N'True/False', N'The <strong> tag makes text italic.', 1, N'False', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (137, N'MCQ', N'Which HTML element is used for defining a division?', 3, N'<div>', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (138, N'True/False', N'HTML5 introduced the <article> tag.', 1, N'True', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (139, N'MCQ', N'Which tag is used to create a checkbox?', 3, N'<input type="checkbox">', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (140, N'MCQ', N'Which HTML attribute specifies an image path?', 3, N'src', 201)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (141, N'True/False', N'C allows function overloading.', 1, N'False', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (142, N'MCQ', N'Which function is used to read input in C?', 3, N'scanf', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (143, N'True/False', N'Pointers in C cannot be NULL.', 1, N'False', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (144, N'MCQ', N'Which operator is used for pointer dereferencing?', 3, N'*', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (145, N'MCQ', N'Which function allocates memory dynamically?', 3, N'malloc', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (146, N'True/False', N'The do-while loop executes at least once.', 1, N'True', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (147, N'MCQ', N'Which loop executes a fixed number of times?', 3, N'for', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (148, N'True/False', N'The switch statement can be replaced with if-else.', 1, N'True', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (149, N'MCQ', N'Which function is used to compare two strings?', 3, N'strcmp', 205)
INSERT [dbo].[questions] ([que_id], [question_type], [que_content], [que_point], [ans_content], [c_id]) VALUES (150, N'MCQ', N'Which header file contains mathematical functions?', 3, N'math.h', 205)
GO
INSERT [dbo].[student] ([id], [fname], [lname], [city], [street], [dept_id]) VALUES (101, N'Alice', N'Johnson', N'New York', N'5th Ave', 1)
INSERT [dbo].[student] ([id], [fname], [lname], [city], [street], [dept_id]) VALUES (102, N'Bob', N'Smith', N'Los Angeles', N'Sunset Blvd', 2)
INSERT [dbo].[student] ([id], [fname], [lname], [city], [street], [dept_id]) VALUES (103, N'Charlie', N'Davis', N'Chicago', N'Michigan Ave', 1)
INSERT [dbo].[student] ([id], [fname], [lname], [city], [street], [dept_id]) VALUES (104, N'David', N'Miller', N'Houston', N'Main St', 3)
INSERT [dbo].[student] ([id], [fname], [lname], [city], [street], [dept_id]) VALUES (105, N'Eve', N'Wilson', N'Miami', N'Ocean Dr', 2)
GO
SET IDENTITY_INSERT [dbo].[student_Answer] ON 

INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'True', 103, 1, 321, 1)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'try', 103, 1, 361, 2)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'False', 103, 1, 324, 3)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'protected-internal', 103, 1, 365, 4)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'Dictionary', 103, 1, 369, 5)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'False', 103, 1, 326, 6)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'DISTINCT', 103, 1, 375, 7)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'True', 103, 1, 327, 8)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'extends', 103, 1, 379, 9)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'Base', 103, 1, 383, 10)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'True', 105, 4227, 185, 11)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'False', 105, 4227, 192, 12)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'title', 105, 4227, 294, 13)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'False', 105, 4227, 350, 14)
INSERT [dbo].[student_Answer] ([content], [st_id], [ex_id], [choose_id], [id]) VALUES (N'<table>', 105, 4227, 433, 15)
SET IDENTITY_INSERT [dbo].[student_Answer] OFF
GO
INSERT [dbo].[student_Course] ([st_id], [c_id], [grade]) VALUES (101, 201, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[student_Course] ([st_id], [c_id], [grade]) VALUES (101, 204, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[student_Course] ([st_id], [c_id], [grade]) VALUES (102, 202, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[student_Course] ([st_id], [c_id], [grade]) VALUES (103, 203, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[student_Course] ([st_id], [c_id], [grade]) VALUES (104, 205, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[student_Course] ([st_id], [c_id], [grade]) VALUES (105, 201, CAST(67 AS Decimal(18, 0)))
INSERT [dbo].[student_Course] ([st_id], [c_id], [grade]) VALUES (105, 204, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[topic] ([id], [topic_name]) VALUES (1, N'Web Development')
INSERT [dbo].[topic] ([id], [topic_name]) VALUES (2, N'Database Management')
INSERT [dbo].[topic] ([id], [topic_name]) VALUES (3, N'Software Development')
INSERT [dbo].[topic] ([id], [topic_name]) VALUES (4, N'Low-Level Programming')
INSERT [dbo].[topic] ([id], [topic_name]) VALUES (5, N'OOP Principles')
GO
ALTER TABLE [dbo].[student_Course] ADD  CONSTRAINT [DF_StudentCourse_Grade]  DEFAULT ((0)) FOR [grade]
GO
ALTER TABLE [dbo].[chooses]  WITH CHECK ADD FOREIGN KEY([que_id])
REFERENCES [dbo].[questions] ([que_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD FOREIGN KEY([topic_id])
REFERENCES [dbo].[topic] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD FOREIGN KEY([c_id])
REFERENCES [dbo].[course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[exam_ques]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[exam] ([id])
GO
ALTER TABLE [dbo].[exam_ques]  WITH CHECK ADD FOREIGN KEY([que_id])
REFERENCES [dbo].[questions] ([que_id])
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[department] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[instructor_Course]  WITH CHECK ADD FOREIGN KEY([ins_id])
REFERENCES [dbo].[instructor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[instructor_Course]  WITH CHECK ADD FOREIGN KEY([c_id])
REFERENCES [dbo].[course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD FOREIGN KEY([c_id])
REFERENCES [dbo].[course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[department] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[student_Answer]  WITH CHECK ADD FOREIGN KEY([choose_id])
REFERENCES [dbo].[chooses] ([id])
GO
ALTER TABLE [dbo].[student_Answer]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[exam] ([id])
GO
ALTER TABLE [dbo].[student_Answer]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[student_Course]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[student_Course]  WITH CHECK ADD FOREIGN KEY([c_id])
REFERENCES [dbo].[course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[answer_exam]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[answer_exam]
    @st_id int,              
    @ex_id int,            
    @answers answer_table_types readonly 
as
begin
    if not exists (select 1 from student where id = @st_id)
    begin
        print 'Error: Student ID ' + cast(@st_id as varchar) + ' does not exist.';
        return;
    end;

    if not exists (select 1 from exam where id = @ex_id)
    begin
        print 'Error: Exam ID ' + cast(@ex_id as varchar) + ' does not exist.';
        return;
    end;

    declare @c_id int;
    select @c_id = c_id from exam where id = @ex_id;

    if not exists (select 1 from student_Course where st_id = @st_id and c_id = @c_id)
    begin
        print 'Error: Student ID ' + cast(@st_id as varchar) + ' is not enrolled in the course for Exam ID ' + cast(@ex_id as varchar) + '.';
        return;
    end;

    if not exists (select 1 from exam_ques where ex_id = @ex_id)
    begin
        print 'Error: No questions found for Exam ID ' + cast(@ex_id as varchar) + '.';
        return;
    end;

    if exists (
        select 1
        from @answers a
        where not exists (
            select 1
            from chooses c
            join exam_ques eq on c.que_id = eq.que_id
            where eq.ex_id = @ex_id
              and eq.que_id = a.que_id
              and c.content = a.content
        )
    )
    begin
        print 'Error: One or more answers do not match the valid choices for the questions in the exam.';
        return;
    end;

    insert into student_Answer (content, st_id, ex_id, choose_id)
    select 
        a.content,
        @st_id,
        @ex_id,
        c.id
    from @answers a
    join chooses c on a.content = c.content and a.que_id = c.que_id
    join exam_ques eq on c.que_id = eq.que_id
    where eq.ex_id = @ex_id;

    print 'Answers submitted successfully for Exam ID ' + cast(@ex_id as varchar) + ' by Student ID ' + cast(@st_id as varchar) + '.';
end;

--
GO
/****** Object:  StoredProcedure [dbo].[delete_chooses]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_chooses]
    @chooesId int
as
begin
    if not exists (select 1 from chooses where id = @chooesId)
    begin
        print 'Error: Chooes ID ' + cast(@chooesId as varchar) + ' does not exist.';
        return;
    end;

    delete from chooses
    where id = @chooesId;

    print 'Choices deleted successfully';
end;
GO
/****** Object:  StoredProcedure [dbo].[delete_exam_ques]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_exam_ques]
    @ex_id int
as
begin
  if exists (select ex_id from exam_ques where ex_id = @ex_id)
    delete from exam_ques
    where ex_id = @ex_id ;
  else
	select 'There is no exam with this ID';
end;
GO
/****** Object:  StoredProcedure [dbo].[delete_instructor_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_instructor_course]
    @ins_id int,
    @c_id int
as
begin
   if exists (select 1 from instructor_course where ins_id = @ins_id and c_id = @c_id)
    delete from instructor_course
    where ins_id = @ins_id and c_id = @c_id;
	else 
	  select 'The Instructor not Teach This Course'
end;
GO
/****** Object:  StoredProcedure [dbo].[delete_student_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_student_course]
    @st_id int,
    @c_id int
as
begin
    if exists (select st_id , c_id from student_Course where st_id = @st_id and c_id = @c_id)
    delete from student_course
    where st_id = @st_id and c_id = @c_id;
	else
		select 'There is no Student with this ID enrolled in Course with this ID';
end;
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteCourse]
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM course WHERE id = @id)
    BEGIN
        PRINT 'Course not found';
        RETURN;
    END

    DELETE FROM course WHERE id = @id;
    PRINT 'Course deleted successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteDepartment]
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END

    DELETE FROM department WHERE id = @id;
    PRINT 'Department deleted successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[DeleteExam]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteExam] @id int 
as 
    if exists (select id from exam where id = @id)
	begin
	  delete exam where id = @id
	 end
	 else
	     select 'There is no Exam  with this id' as ErrorMessage;

GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructor]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteInstructor] @id int 
as 
    if exists (select id from instructor where id = @id)
	begin
	  delete instructor where id = @id
	 end
	 else
	     select 'There is no instructor with this id' as ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[DeleteQuestions]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteQuestions] @id int 
as 
    if exists (select que_id from questions where que_id = @id)
	begin
	  delete questions where que_id = @id
	 end
	 else
	     select 'There is no Question  with this id' as ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteStudent]
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @id)
    BEGIN
        PRINT 'Student not found';
        RETURN;
    END

    DELETE FROM student WHERE id = @id;
    PRINT 'Student deleted successfully';
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudentAnswer]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteStudentAnswer] @id int 
as 
    if exists (select id from student_Answer where id = @id)
	begin
	  delete student_Answer where id = @id
	 end
	 else
	     select 'There is no StudentAnswer with this id' as ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[DeleteTopic]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteTopic]
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    DELETE FROM topic WHERE id = @id;
    PRINT 'Topic deleted successfully';
END;

GO
/****** Object:  StoredProcedure [dbo].[ExamCorrection]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ExamCorrection]
    @exam_id INT,
    @student_id INT
AS
BEGIN
     
    IF NOT EXISTS (SELECT 1 FROM exam WHERE id = @exam_id)
    BEGIN
        PRINT 'Exam not found';
        RETURN;
    END

    
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @student_id)
    BEGIN
        PRINT 'Student not found';
        RETURN;
    END
	 
    SELECT 
         q.que_id,
         q.que_content,
         q.ans_content AS correct_answer,
         s.content AS student_answer,
         q.que_point,
         CASE 
             WHEN s.choose_id = ch.id AND ch.content = q.ans_content THEN q.que_point
             ELSE 0 
         END AS Grade
    INTO #TempResults 
    FROM exam_ques eq
    INNER JOIN questions q 
         ON eq.que_id = q.que_id
    INNER JOIN student_answer s
         ON s.ex_id = eq.ex_id 
         AND s.st_id = @student_id
    INNER JOIN chooses ch
         ON ch.id = s.choose_id AND ch.que_id = q.que_id  
    WHERE eq.ex_id = @exam_id;

   
    DECLARE @TotalScore INT;
    SELECT @TotalScore = SUM(
         CASE 
             WHEN s.choose_id = ch.id AND ch.content = q.ans_content THEN q.que_point
             ELSE 0 
         END
    ) 
    FROM exam_ques eq
    INNER JOIN questions q 
         ON eq.que_id = q.que_id
    INNER JOIN student_answer s 
         ON s.ex_id = eq.ex_id 
         AND s.st_id = @student_id
    INNER JOIN chooses ch
         ON ch.id = s.choose_id AND ch.que_id = q.que_id
    WHERE eq.ex_id = @exam_id;


	 
    DECLARE @MaxScore INT;
    SELECT @MaxScore = SUM(que_point) 
    FROM questions q
    INNER JOIN exam_ques eq ON eq.que_id = q.que_id
    WHERE eq.ex_id = @exam_id;

     
    DECLARE @Percentage DECIMAL(5,2);
    IF @MaxScore = 0 
        SET @Percentage = 0;
    ELSE
        SET @Percentage = (CAST(@TotalScore AS DECIMAL) / @MaxScore) * 100;


    DECLARE @course_id INT;
    SELECT @course_id = c_id FROM exam WHERE id = @exam_id;

	 SET @Percentage = ISNULL(@Percentage, 0);

    IF EXISTS (SELECT 1 FROM student_Course WHERE st_id = @student_id AND c_id = @course_id)
    BEGIN
       
        UPDATE student_Course
        SET grade = @Percentage
        WHERE st_id = @student_id AND c_id = @course_id;
    END
    ELSE
    BEGIN
       
        INSERT INTO student_Course (st_id, c_id, grade)
        VALUES (@student_id, @course_id, @Percentage);
    END


    
    SELECT @TotalScore AS TotalScore, @Percentage AS Percentage;

    DROP TABLE #TempResults;
END;

GO
/****** Object:  StoredProcedure [dbo].[GenerateExam]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateExam]  @courseName varchar(20) , @numOfTorF int , @numOfMcq int, @ExamId int output 
as 
             declare @crId int , @totalQues int = @numOfTorF + @numOfMcq , @quesId int , @dateEx date
			 select  @dateEx = GetDate()
             if exists (select id from course where c_name = @courseName) 
			 begin 
			 select @crId = id from course where c_name = @courseName
			 set @ExamId = ABS(CHECKSUM(NEWID())) % 10000 + 1
             EXEC InsertExam  @ExamId, @dateEx , '01:30:00',@crId
			 declare @newTableOfQues table (ques_id int)
		   while @totalQues >0
			  begin
			 while @numOfTorF >0
			  begin
			      select @quesId = que_id 
	              from questions 
				  where question_type = 'True/False' and c_id = @crId 
				  order by NEWID()
			     EXEC insert_exam_ques @ExamId , @quesId
				  set @numOfTorF -= 1
			 end
			 while @numOfMcq >0
			  begin
			      select @quesId = que_id 
	              from questions 
				  where question_type = 'MCQ' and c_id = @crId 
				  order by NEWID()
			      EXEC insert_exam_ques @ExamId , @quesId
				  set @numOfMcq -= 1
			 end
		
				  set @totalQues -= 1
			 end
			 	select 'The exam was created successfully'
			end
	else
	select 'There is no Course with this name '
GO
/****** Object:  StoredProcedure [dbo].[get_instructor_info]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_instructor_info]
    @ins_id int
as
begin
    select 
        c.c_name as course_name,
        count(sc.st_id) as student_count
    from 
        instructor_course ic
    join 
        course c on ic.c_id = c.id
    inner join 
        student_course sc on ic.c_id = sc.c_id
    where 
        ic.ins_id = @ins_id
    group by 
        c.c_name;
end;
GO
/****** Object:  StoredProcedure [dbo].[GetExamQuestAndStudAnswers]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetExamQuestAndStudAnswers]
    @exam_id INT,
    @student_id INT
AS
BEGIN
     
    IF NOT EXISTS (SELECT 1 FROM exam WHERE id = @exam_id)
    BEGIN
        RAISERROR('Exam not found', 16, 1);
        RETURN;
    END

     
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @student_id)
    BEGIN
        RAISERROR('Student not found', 16, 1);
        RETURN;
    END
	
   
    
	    select q.que_id , q.que_content  ,  s.content
		from student_answer s  join  chooses c
		on c.id = s.choose_id 
		join questions q 
		on c.que_id = q.que_id
		join exam_ques ex on q.que_id = ex.que_id
		where ex.ex_id = @exam_id

END;
GO
/****** Object:  StoredProcedure [dbo].[GetExamQuestions]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetExamQuestions]
    @exam_id INT
AS
BEGIN
     
    IF NOT EXISTS (SELECT 1 FROM exam WHERE id = @exam_id)
    BEGIN
         PRINT 'Exam not found';
         RETURN;
    END

    SELECT 
         q.que_content
    FROM  questions q
    INNER JOIN exam_ques eq ON eq.que_id = q.que_id
    WHERE eq.ex_id = @exam_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[getgradeOfAllCoursesForStudent]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getgradeOfAllCoursesForStudent] @StId int 
as 
    if exists (select id from student where id = @StId)
	  begin 
	         declare @newTable table (crName varchar(20) , Stgrade decimal)
			 insert into @newTable
	         select c.c_name ,sc.grade 
	         from student s join student_Course sc
	         on s.id = sc.st_id
			 join course c
			 on sc.c_id = c.id and s.id = @StId
	    IF @@ROWCOUNT = 0
	       select 'There is no grades for this Students ' as ErrorMessage;
		else 
		   select * from @newTable
	 end
	 else
	     select 'There is no Student with this id' as ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[getTopics]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getTopics]
    @c_id int
as
begin
    select 
        t.topic_name
    from 
        course c
    join 
        topic t on c.topic_id = t.id
    where 
        c.id = @c_id;
end;
GO
/****** Object:  StoredProcedure [dbo].[insert_chooses]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insert_chooses]
    @que_id int,              
    @choice varchar(max),
	@choiceId int
as
begin
   
    if not exists (select 1 from questions where que_id = @que_id)
    begin
        print 'Error: Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;
	 if exists (select 1 from chooses where id = @choiceId)
    begin
        print 'Error: Choice ID ' + cast(@que_id as varchar) + ' does exist already.';
        return;
    end;
    insert into chooses (content, que_id,id)
    values (@choice, @que_id,@choiceId)
	  print 'Choices inserted successfully for Question ID ' + cast(@que_id as varchar) + '.';
end;
GO
/****** Object:  StoredProcedure [dbo].[insert_exam_ques]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insert_exam_ques]
    @ex_id int,
    @que_id int
as
begin
    
    if not exists (select 1 from exam where id = @ex_id)
    begin
        print 'Error: Exam ID ' + cast(@ex_id as varchar) + ' does not exist.';
        return;
    end;

   
    if not exists (select 1 from questions where que_id = @que_id)
    begin
        print 'Error: Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;
	if  exists (select ex_id , que_id from exam_ques where que_id = @que_id and ex_id = @ex_id)
    begin
        print 'This Question Dublicated in This Exam';
        return;
    end;
    
    insert into exam_ques (ex_id, que_id)
    values (@ex_id, @que_id);

    print 'Exam question inserted successfully.';
end;
GO
/****** Object:  StoredProcedure [dbo].[insert_instructor_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_instructor_course]
    @ins_id int,
    @c_id int
as
begin

    if not exists (select 1 from instructor where id = @ins_id)
    begin
        print 'Error: Instructor ID ' + cast(@ins_id as varchar) + ' does not exist.';
        return;
    end;

    
    if not exists (select 1 from course where id = @c_id)
    begin
        print 'Error: Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

	if not exists (select ins_id,c_id  from instructor_Course where ins_id = @ins_id and c_id = @c_id)
    insert into instructor_course (ins_id, c_id)
    values (@ins_id, @c_id);
    else
	   	  select 'Dublicated IDs'
end;
GO
/****** Object:  StoredProcedure [dbo].[insert_student_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[insert_student_course]
    @st_id int,
    @c_id int
   
as
begin
    
    if not exists (select 1 from student where id = @st_id)
    begin
        print 'Error: Student ID ' + cast(@st_id as varchar) + ' does not exist.';
        return;
    end;

   
    if not exists (select 1 from course where id = @c_id)
    begin
        print 'Error: Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

    if not exists (select st_id , c_id from student_Course where st_id = @st_id and c_id = @c_id)
    insert into student_course (st_id, c_id)
    values (@st_id, @c_id);
	else 
	  select 'Dublicated IDs'
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertCourse]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertCourse]
    @id INT,
    @c_name VARCHAR(200),
    @topic_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM course WHERE id = @id)
    BEGIN
        PRINT 'Course already exists';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @topic_id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    INSERT INTO course(id, c_name, topic_id)
    VALUES (@id, @c_name, @topic_id);
    PRINT 'Course inserted successfully';
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertDepartment]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertDepartment]
    @id INT,
    @dept_name VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM department WHERE id = @id)
    BEGIN
        PRINT 'Department already exists';
        RETURN;
    END
    ELSE
    BEGIN
        INSERT INTO department(id, dept_name)
        VALUES (@id, @dept_name);
        PRINT 'Department inserted successfully';
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertExam]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- exam

--- insert exam
CREATE PROC [dbo].[InsertExam] @id INT, @ExDate DATE, @Exduration TIME, @cId INT
AS 
BEGIN
    IF NOT EXISTS (SELECT id FROM exam WHERE id = @id)
    BEGIN
        IF EXISTS (SELECT id FROM course WHERE id = @cId)
        BEGIN
            INSERT INTO exam(id, exam_date, duration, c_id)
            VALUES(@id, @ExDate, @Exduration, @cId)
        END
        ELSE
            SELECT 'There is no Course with this id' AS ErrorMessage;
    END
    ELSE
        SELECT 'Duplicate id for Exam' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertInstructor]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- Insert Instructor
CREATE PROC [dbo].[InsertInstructor] @id INT, @name VARCHAR(20), @deptId INT
AS 
BEGIN
    IF NOT EXISTS (SELECT id FROM instructor WHERE id = @id)
    BEGIN
        IF EXISTS (SELECT id FROM department WHERE id = @deptId)
        BEGIN
            INSERT INTO instructor(id, fname, dept_id)
            VALUES(@id, @name, @deptId);
        END
        ELSE
            SELECT 'There is no department with this id' AS ErrorMessage;
    END
    ELSE
        SELECT 'Duplicate id for instructor' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertQuestions]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----- Questions

--- Insert Question
CREATE PROC [dbo].[InsertQuestions] @id INT, @type VARCHAR(200), @content VARCHAR(200), @point INT, @ansContent VARCHAR(200), @cId INT
AS 
BEGIN
    IF NOT EXISTS (SELECT que_id FROM questions WHERE que_id = @id)
    BEGIN
        IF EXISTS (SELECT id FROM course WHERE id = @cId)
        BEGIN
            INSERT INTO questions(que_id, question_type, que_content, que_point, ans_content, c_id)
            VALUES(@id, @type, @content, @point, @ansContent, @cId);
        END
        ELSE
            SELECT 'There is no Course with this id' AS ErrorMessage;
    END
    ELSE
        SELECT 'Duplicate id for Question' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertStudent]
    @id INT,
    @fname VARCHAR(100),
    @lname VARCHAR(100),
    @city VARCHAR(100),
    @street VARCHAR(200),
    @dept_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM student WHERE id = @id)
    BEGIN
        PRINT 'Student already exists';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @dept_id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END

    INSERT INTO student(id, fname, lname, city, street, dept_id)
    VALUES (@id, @fname, @lname, @city, @street, @dept_id);
    PRINT 'Student inserted successfully';
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertStudentAnswer]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[InsertStudentAnswer] @id int,@Anscontent varchar(200), @StId int , @ExId int , @chooseId int
as 
     if not exists (select id from  student_Answer where id = @id)
	 begin
	    if exists (select id from student where id = @StId)
		 begin
		  if exists (select id from exam where id = @ExId)
		  begin
		  if  exists (select id from chooses where id = @chooseId)
		   begin
           insert into student_Answer(id,content,st_id,ex_id)
	       values(@id,@Anscontent,@StId,@ExId)
		   end
		   else
		      select 'There is no Choose equal this Answer' as ErrorMessage;
		  end
		  else
		      select 'There is no Student with this id' as ErrorMessage;
		end
		  else
		      select 'There is no Exam with this id' as ErrorMessage;
	 end
	 else
	     select 'Dublicate id StudentAnswer' as ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[InsertTopic]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertTopic]
    @id INT,
    @topic_name VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM topic WHERE id = @id)
    BEGIN
        PRINT 'Topic already exists';
        RETURN;
    END

    INSERT INTO topic(id, topic_name)
    VALUES (@id, @topic_name);
    PRINT 'Topic inserted successfully';
END;
GO
/****** Object:  StoredProcedure [dbo].[select_chooses]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[select_chooses]
    @id int 
as
begin
    if  exists (select 1 from chooses where id = @id)
    select *
    from chooses
    where id = @id;
	else
	 select 'No Chooses With This ID'
end;
GO
/****** Object:  StoredProcedure [dbo].[select_exam_ques]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[select_exam_ques]
    @ex_id int
as
begin
    if exists (select ex_id from exam_ques where ex_id = @ex_id)
    select *
    from exam_ques
    where ex_id = @ex_id 
	else
	select 'There is no exam with this ID';
end;
GO
/****** Object:  StoredProcedure [dbo].[select_instructor_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[select_instructor_course]
    @ins_id int, 
    @c_id int     
as
begin
    if exists (select ins_id,c_id  from instructor_Course where ins_id = @ins_id and c_id = @c_id)
    select *
    from instructor_course
    where ins_id = @ins_id and c_id = @c_id;
		select 'There is no Instructor with this ID teach Course with this ID';

end;
GO
/****** Object:  StoredProcedure [dbo].[select_student_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[select_student_course]
    @st_id int,  
    @c_id int    
as
begin
    if exists (select st_id , c_id from student_Course where st_id = @st_id and c_id = @c_id)
    select *
    from student_course
    where st_id = @st_id and c_id = @c_id;
	else
	select 'There is no Student with this ID enrolled in Course with this ID';
end;
GO
/****** Object:  StoredProcedure [dbo].[SelectCourse]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectCourse]
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM course;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM course WHERE id = @id)
        BEGIN
            PRINT 'Course not found';
            RETURN;
        END
        SELECT * FROM course WHERE id = @id;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectDepartment]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectDepartment]
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM department;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM department WHERE id = @id)
        BEGIN
            PRINT 'Department not found';
            RETURN;
        END
        SELECT * FROM department WHERE id = @id;
    END
END;


GO
/****** Object:  StoredProcedure [dbo].[SelectExam]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- select exam
CREATE PROC [dbo].[SelectExam] @id INT 
AS 
BEGIN
    IF EXISTS (SELECT id FROM exam WHERE id = @id)
    BEGIN
        SELECT * FROM exam WHERE id = @id;
    END
    ELSE
        SELECT 'There is no Exam with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectInstructor]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- Select Instructor
CREATE PROC [dbo].[SelectInstructor] @id INT 
AS 
BEGIN
    IF EXISTS (SELECT id FROM instructor WHERE id = @id)
    BEGIN
        SELECT * FROM instructor WHERE id = @id;
    END
    ELSE
        SELECT 'There is no instructor with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectQuestions]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- Select Question
CREATE PROC [dbo].[SelectQuestions] @id INT 
AS 
BEGIN
    IF EXISTS (SELECT que_id FROM questions WHERE que_id = @id)
    BEGIN
        SELECT * FROM questions WHERE que_id = @id;
    END
    ELSE
        SELECT 'There is no Question with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectStudent]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectStudent]
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM student;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM student WHERE id = @id)
        BEGIN
            PRINT 'Student not found';
            RETURN;
        END
        SELECT * FROM student WHERE id = @id;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[SelectStudentAnswer]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- select StudentAnswer
CREATE PROC [dbo].[SelectStudentAnswer] @id INT 
AS 
BEGIN
    IF EXISTS (SELECT id FROM student_Answer WHERE id = @id)
    BEGIN
        SELECT * FROM student_Answer WHERE id = @id;
    END
    ELSE
        SELECT 'There is no StudentAnswer with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectTopic]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectTopic]
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM topic;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @id)
        BEGIN
            PRINT 'Topic not found';
            RETURN;
        END
        SELECT * FROM topic WHERE id = @id;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[StudentInfo]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StudentInfo] @DeptId int 
as 
    if exists (select id from department where id = @DeptId)
	  begin 
	    if exists (select  dept_id
		           from student s where dept_id = @DeptId
					)
	     begin
	         select s.* 
	         from student s join department d
	         on d.id = s.dept_id
	         where s.dept_id = @DeptId
		 end
		else
	     select 'There is no Students in this Department' as ErrorMessage;
	 end
	 else
	     select 'There is no Department with this id' as ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[update_chooses]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--update
CREATE procedure [dbo].[update_chooses]
    @que_id int,              
    @newchoice varchar(max),
	@choiceId int
as
begin
   
    if not exists (select 1 from questions where que_id = @que_id)
    begin
        print 'Error: Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;
	 if not exists (select 1 from chooses where id = @choiceId)
    begin
        print 'Error: Choice ID ' + cast(@choiceId as varchar) + ' does not exist ';
        return;
    end;
   declare @correct_answer varchar(max) , @oldChoice varchar(max);
   select @correct_answer = ans_content from questions where que_id = @que_id
   select @oldChoice = content from chooses where id = @choiceId
   if @correct_answer not in (@oldChoice)
   begin
      update chooses
	  set content = @newchoice
	  where id = @choiceId
	  print 'Choices Updated successfully for Question ID ' + cast(@que_id as varchar) + '.';
	end
  else 
    select 'this choice equal answer Correct so upate anthor choice';
 
end;
GO
/****** Object:  StoredProcedure [dbo].[update_exam_ques]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update
create procedure [dbo].[update_exam_ques]
    @ex_id int,
    @que_id int,
    @new_que_id int
as
begin
    if not exists (select 1 from exam_ques where ex_id = @ex_id and que_id = @que_id)
    begin
        print 'Error: Exam question with Exam ID ' + cast(@ex_id as varchar) + ' and Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;

    if not exists (select 1 from questions where que_id = @new_que_id)
    begin
        print 'Error: New Question ID ' + cast(@new_que_id as varchar) + ' does not exist.';
        return;
    end;

    update exam_ques
    set que_id = @new_que_id
    where ex_id = @ex_id and que_id = @que_id;

    print 'Exam question updated successfully.';
end;
GO
/****** Object:  StoredProcedure [dbo].[update_instructor_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_instructor_course]
    @ins_id int,
    @c_id int,
    @new_c_id int
as
begin
   
    if not exists (select 1 from instructor_course where ins_id = @ins_id and c_id = @c_id)
    begin
        print 'Error: Instructor course with Instructor ID ' + cast(@ins_id as varchar) + ' and Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

  
    if not exists (select 1 from course where id = @new_c_id)
    begin
        print 'Error: New Course ID ' + cast(@new_c_id as varchar) + ' does not exist.';
        return;
    end;

    
    update instructor_course
    set c_id = @new_c_id
    where ins_id = @ins_id and c_id = @c_id;

    print 'Instructor course updated successfully.';
end;
GO
/****** Object:  StoredProcedure [dbo].[update_student_course]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_student_course]
    @st_id int,
    @c_id int,
    @new_grade decimal
as
begin
    
    if not exists (select 1 from student_course where st_id = @st_id and c_id = @c_id)
    begin
        print 'Error: Student course with Student ID ' + cast(@st_id as varchar) + ' and Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

   
    update student_course
    set grade = @new_grade
    where st_id = @st_id and c_id = @c_id;

    print 'Student course updated successfully.';
end;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateCourse]
    @id INT,
    @c_name VARCHAR(200),
    @topic_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM course WHERE id = @id)
    BEGIN
        PRINT 'Course not found';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @topic_id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    UPDATE course
    SET c_name = @c_name, topic_id = @topic_id
    WHERE id = @id;
    PRINT 'Course updated successfully';
END;


GO
/****** Object:  StoredProcedure [dbo].[UpdateDepartment]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateDepartment]
    @id INT,
    @dept_name VARCHAR(200)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END
	
    UPDATE department
    SET dept_name = @dept_name
    WHERE id = @id;
    PRINT 'Department updated successfully';
END;


GO
/****** Object:  StoredProcedure [dbo].[UpdateExam]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- update exam
CREATE PROC [dbo].[UpdateExam] @id INT, @Exduration TIME
AS 
BEGIN
    IF EXISTS (SELECT id FROM exam WHERE id = @id)
    BEGIN
        UPDATE exam
        SET duration = @Exduration
        WHERE id = @id;
    END
    ELSE
        SELECT 'There is no Exam with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructor]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- Update Instructor
CREATE PROC [dbo].[UpdateInstructor] @id INT, @name VARCHAR(20), @deptId INT
AS 
BEGIN
    IF EXISTS (SELECT id FROM instructor WHERE id = @id)
    BEGIN
        IF EXISTS (SELECT id FROM department WHERE id = @deptId)
        BEGIN
            UPDATE instructor
            SET fname = @name, dept_id = @deptId
            WHERE id = @id;
        END
        ELSE
            SELECT 'There is no department with this id' AS ErrorMessage;
    END
    ELSE
        SELECT 'There is no instructor with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuestions]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- Update Question
CREATE PROC [dbo].[UpdateQuestions] @id INT, @point INT, @ansContent VARCHAR(200)
AS 
BEGIN
    IF EXISTS (SELECT que_id FROM questions WHERE que_id = @id)
    BEGIN
        UPDATE questions
        SET que_point = @point, ans_content = @ansContent
        WHERE que_id = @id;
    END
    ELSE
        SELECT 'There is no Question with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateStudent]
    @id INT,
    @fname VARCHAR(100),
    @lname VARCHAR(100),
    @city VARCHAR(100),
    @street VARCHAR(200),
    @dept_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @id)
    BEGIN
        PRINT 'Student not found';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @dept_id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END

    UPDATE student
    SET fname = @fname, lname = @lname, city = @city, street = @street, dept_id = @dept_id
    WHERE id = @id;
    PRINT 'Student updated successfully';
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentAnswer]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- update StudentAnswer
CREATE PROC [dbo].[UpdateStudentAnswer] @id INT, @AnsContent VARCHAR(200), @chooseId INT
AS 
BEGIN
    IF EXISTS (SELECT id FROM student_Answer WHERE id = @id)
    BEGIN
        IF EXISTS (SELECT id FROM chooses WHERE id = @chooseId)
        BEGIN
            UPDATE student_Answer
            SET content = @AnsContent, choose_id = @chooseId
            WHERE id = @id;
        END
        ELSE
            SELECT 'There is no Choose equal to this Answer' AS ErrorMessage;
    END
    ELSE
        SELECT 'There is no StudentAnswer with this id' AS ErrorMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTopic]    Script Date: 3/10/2025 2:18:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateTopic]
    @id INT,
    @topic_name VARCHAR(200)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    UPDATE topic
    SET topic_name = @topic_name
    WHERE id = @id;
    PRINT 'Topic updated successfully';
END;

GO
USE [master]
GO
ALTER DATABASE [Examination] SET  READ_WRITE 
GO
