USE [master]
GO
/****** Object:  Database [Project]    Script Date: 2/23/2024 10:34:06 PM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUULOC\MSSQL\DATA\Project.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUULOC\MSSQL\DATA\Project_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project', N'ON'
GO
ALTER DATABASE [Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDetail]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDetail](
	[uid] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[dob] [nvarchar](max) NULL,
 CONSTRAINT [PK_AccountDetail] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentid] ASC,
	[pid] ASC,
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[date] [nvarchar](max) NULL,
	[totalmoney] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[oid] ASC,
	[pid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[sid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 2/23/2024 10:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uid], [username], [password], [isAdmin], [isActive]) VALUES (1, N'123', N'123', 1, 1)
INSERT [dbo].[Account] ([uid], [username], [password], [isAdmin], [isActive]) VALUES (2, N'huuloc', N'123', 1, 1)
INSERT [dbo].[Account] ([uid], [username], [password], [isAdmin], [isActive]) VALUES (3, N'cin', N'123', 0, 1)
INSERT [dbo].[Account] ([uid], [username], [password], [isAdmin], [isActive]) VALUES (4, N'tuanvm', N'123', 0, 1)
INSERT [dbo].[Account] ([uid], [username], [password], [isAdmin], [isActive]) VALUES (8, N'as', N'ad', 0, 1)
INSERT [dbo].[Account] ([uid], [username], [password], [isAdmin], [isActive]) VALUES (15, N'vanquyet', N'123', 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[AccountDetail] ([uid], [name], [address], [phone], [email], [image], [dob]) VALUES (1, N'Ngo Huu Loc', N'Hà Nội', N'0965736358', N'ngohuuloc54@gmail.com', N'ngohuuloc54@gmail.com', N'16/11/2003')
INSERT [dbo].[AccountDetail] ([uid], [name], [address], [phone], [email], [image], [dob]) VALUES (2, N'loc', N'', N'', N'', N'', N'')
INSERT [dbo].[AccountDetail] ([uid], [name], [address], [phone], [email], [image], [dob]) VALUES (3, N'Chu Yến Nhi', N'Bắc Giang', N'0965736358', N'ngohuuloc54@gmail.com', N'ngohuuloc54@gmail.com', N'16/11/2003')
INSERT [dbo].[AccountDetail] ([uid], [name], [address], [phone], [email], [image], [dob]) VALUES (4, N'Tuấn VM', N'23', N'0965736358', N'ngohuuloc54@gmail.com', N'ngohuuloc54@gmail.com', N'16/11/2003')
INSERT [dbo].[AccountDetail] ([uid], [name], [address], [phone], [email], [image], [dob]) VALUES (8, N'm', N'as', N'as', N'asd@gmail.com', N'asd@gmail.com', N'16/11/2003')
INSERT [dbo].[AccountDetail] ([uid], [name], [address], [phone], [email], [image], [dob]) VALUES (15, N'Nguyễn Văn Quyết', N'ngohuuloc54@gmail.com', N'0966745365', N'ngohuuloc54@gmail.com', N'ngohuuloc54@gmail.com', N'16/11/2003')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [name]) VALUES (1, N'Giày bóng chuyền')
INSERT [dbo].[Category] ([cid], [name]) VALUES (2, N'Quần áo bóng chuyền')
INSERT [dbo].[Category] ([cid], [name]) VALUES (3, N'Bóng chính hãng')
INSERT [dbo].[Category] ([cid], [name]) VALUES (4, N'Phụ kiện hỗ trợ')
INSERT [dbo].[Category] ([cid], [name]) VALUES (5, N'Đồ lưu niệm')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (1, 1, 1, N'123', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (2, 1, 1, N'a', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (3, 1, 1, N'a', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (5, 1, 1, N'<p><span style="font-size:20px"><span style="color:#2ecc71">abc</span></span></p>
', CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (6, 1, 1, N'<p>&nbsp;</p>

<p><img alt="" src="https://i.ibb.co/nbgsrwJ/52-efa6b66504a24e4b9e5a431ba1c3fefa.png" style="height:100px; width:100px" />SẢN PHẨM CHẤT LƯỢNG</p>
', CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (7, 1, 2, N'', CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (8, 1, 2, N'<p>abasasđ</p>
', CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Comment] ([commentid], [pid], [uid], [comment], [date]) VALUES (9, 2, 4, N'<p>123123</p>
', CAST(N'2023-10-06' AS Date))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (1, 1, N'2023-07-03', 4000000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (3, 1, N'2023-07-05', 1040000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (4, 1, N'2023-07-05', 800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (5, 1, N'2023-07-05', 600000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (6, 3, N'2023-07-05', 260000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (7, 3, N'2023-07-05', 800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (8, 1, N'2023-07-06', 600000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (9, 1, N'2023-07-06', 900000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (10, 1, N'2023-07-08', 900000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (11, 4, N'2023-07-08', 800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (12, 4, N'2023-07-08', 600000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (13, 1, N'2023-07-08', 800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (14, 4, N'2023-07-08', 130000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (15, 3, N'2023-07-08', 800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (16, 3, N'2023-07-08', 600000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (17, 1, N'2023-07-08', 1700000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (18, 1, N'2023-07-09', 130000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (19, 4, N'2023-07-09', 2000000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (20, 15, N'2023-07-09', 4000000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (21, 15, N'2023-07-10', 1800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (22, 15, N'2023-07-10', 0.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (23, 15, N'2023-07-10', 1800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (24, 15, N'2023-07-10', 520000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (25, 15, N'2023-07-10', 800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (26, 1, N'2023-07-10', 1500000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (27, 1, N'2023-07-10', 130000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (28, 1, N'2023-07-10', 130000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (29, 1, N'2023-07-10', 2300000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (30, 4, N'2023-07-10', 800000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (31, 4, N'2023-07-10', 50000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (32, 4, N'2023-07-10', 900000.0000)
INSERT [dbo].[Order] ([oid], [uid], [date], [totalmoney]) VALUES (33, 4, N'2023-10-06', 2000000.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (1, 1, 4, 1, 2000000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (1, 1, 5, 1, 2000000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (3, 9, 6, 4, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (3, 9, 8, 4, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (4, 8, 3, 1, 800000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (5, 7, 4, 1, 600000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (6, 10, 8, 2, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (7, 19, 6, 1, 800000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (8, 7, 3, 1, 600000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (9, 6, 4, 1, 900000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (10, 6, 1, 1, 900000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (11, 8, 2, 1, 800000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (12, 7, 1, 1, 600000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (13, 19, 6, 1, 800000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (14, 9, 7, 1, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (15, 16, 6, 1, 800000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (16, 7, 1, 1, 600000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (17, 5, 1, 1, 1700000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (18, 9, 8, 1, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (19, 1, 1, 1, 2000000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (20, 1, 1, 1, 2000000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (20, 1, 4, 1, 2000000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (21, 6, 1, 1, 900000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (21, 6, 4, 1, 900000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (23, 6, 1, 1, 900000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (23, 6, 4, 1, 900000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (24, 10, 6, 2, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (24, 10, 7, 2, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (25, 8, 1, 1, 800000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (26, 4, 1, 1, 1500000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (27, 9, 6, 1, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (28, 9, 8, 1, 130000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (29, 3, 3, 1, 2300000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (30, 21, 6, 1, 800000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (31, 29, 6, 1, 50000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (32, 6, 1, 1, 900000.0000)
INSERT [dbo].[OrderLine] ([oid], [pid], [sid], [quantity], [price]) VALUES (33, 1, 1, 1, 2000000.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (1, 1, N'Giày Asics Gel Blade 8', N'https://product.hstatic.net/200000333667/product/z4336396863061_e9c525be589b0e0c7c4c0c7e7fe11759_7608bad7271b4b4788f5be404cc7c632_master.jpg', N'Lớp lót bên trong giày có khả năng tăng thêm độ thoáng khí, giúp giữ sự thông thoáng cho bàn chân kết hợp với thiết kế không đường may hỗ trợ cải thiện độ linh hoạt và ôm chân của giày. Thân giày được làm từ chất liệu da tổng hợp, sự dụng các dung dịch nhuộm cùng tỷ lệ nước rất ít nhằm giữ màu lâu và tăng độ bền cho sản phẩm', 2000000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (2, 1, N'Giày Asics Control FF 3', N'https://product.hstatic.net/200000333667/product/z4336487238830_4846a184c92b0f61897ffe21d00ecb93_87f24cef0d444d27b5f728306d63a473_master.jpg', N'Giày Court Control™ FF 3 là lựa chọn được đề xuất cho những người chơi cầu lông và bóng chuyền có phong cách chơi nhảy cao và tấn công.', 2500000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (3, 1, N'Giày Asics GeL Rocket 10', N'https://product.hstatic.net/200000333667/product/z3738748961382_0fb2e68498476816e8a7d59a8878e319_90407dcabf464c61aac7b4eadff3da67_master.jpg', N'Asics Gel-Rocket 10 là phiên bản nâng cấp mới nhất của dòng Rocket huyền thoại. Trải qua 10 lần cải biến, Asics Rocket 10 luôn nhận được sự tín nhiệm từ các vận động viên và sử dụng rộng rãi trên toàn cầu. Đặc biệt là đây phiên bản phối màu dành riêng cho các bóng hồng yêu thể thao.', 2300000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (4, 1, N'Giày Mizuno Dynablitz', N'https://shopvnb.com/uploads/images/giay-cau-long-mizuno-dynablitz-trang-vang-chinh-hang.png', N'Mẫu giày cầu lông tầm trung Mizuno Dynablitz thuộc phân khúc tầm trung nhưng cho khả năng bám sân rất tốt cùng độ êm ái cực cao khi di chuyển trên sân.', 1500000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (5, 1, N'Giày Bóng Chuyền Mizuno Wave Dimension', N'https://product.hstatic.net/200000333667/product/z4304552626623_f611a9f5ee9b426c92f785bff29343a8_d3c18d5a571247749908035b2ba2553c_master.jpg', N'Wave Dimension mới là giày bóng chuyền áp dụng công nghệ kỹ thuật mới nhất của Mizuno được thiết kế theo tiêu chí ổn định và thoải mái. Với thiết kế tiên tiến và hiện đại liên kết trực tiếp với Wave Momentum, đôi giày sẽ hỗ trợ bạn một cách an toàn và thoải mái nhất với đế được áp dụng một số công nghệ cao cấp nhất của nhà Mizuno', 1700000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (6, 1, N'Giày Bóng Chuyền Beyono Thunder', N'https://thanhloisport.com/wp-content/uploads/2022/12/giay-bong-chuyen-beyono-thunder-trang-4.jpg', N'Beyono Thunder ra đời khẳng định rằng : "Giày bóng chuyền thuần Việt không chỉ có “chất” riêng mà còn đại diện cho đam mê, con người và đất nước Việt Nam', 900000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (7, 1, N'Giày Bóng Chuyền Sao Vàng', N'https://thanhloisport.com/wp-content/uploads/2022/12/giay-bong-chuyen-sao-vang-mau-trang-0.jpg', N'Giày đặc biệt sử dụng công nghệ gel giảm chấn và có độ đàn hồi cao, đặc biệt rất nhẹ và êm.', 600000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (8, 1, N'Giày Kawasaki K098', N'https://product.hstatic.net/200000333667/product/thiet_ke_chua_co_ten_30997f231f0c4743a7d2abdbaa604b73_master.png', N'Các sản phẩm giày của thương hiệu này có thiết kế bắt mắt với khả năng vượt trội trong môi trường thể thao đặc biệt là dành cho bộ môn cầu lông/bóng chuyền.', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (9, 2, N'ÁO BÓNG CHUYỀN BEYONO KANE', N'https://beyono.vn/wp-content/uploads/2023/05/342400544_935203100952977_6344684210443937415_n-600x600.webp', N'Sau thành công vang dội của các bộ sưu tập trước, Beyono Việt Nam đã nhận được nhiều phản hồi tích cực từ phía khách hàng về chất lượng sản phẩm và uy tín thương hiệu. Đây là động lực để Beyono tiếp tục nghiên cứu và cho ra đời dòng trang phục bóng chuyền cao cấp – Beyono Kane đáp ứng thị hiếu người dùng, đồng thời khẳng định và nâng cao vị thế của Beyono trên thị trường.', 130000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (10, 2, N'Áo Bóng Chuyền HERON Đỏ', N'https://beyono.vn/wp-content/uploads/2023/05/294745167_1401314883710253_2583207215130055374_n-600x600.webp', N'RỰC RỠ – MÃNH LIỆT VÀ NỔI BẬT, BEYONO HERON SẮC ĐỎ Cuốn hút mọi ánh nhìn với sắc màu đầy táo bạo, BEYONO HERON sắc Đỏ chinh phục mọi trận đấu thiêu đốt mọi ánh nhìn và tính bền vững trong thời trang Rực rỡ trong mọi chuyển động.', 130000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (11, 2, N'Áo Bóng Chuyền BENGAL', N'https://beyono.vn/wp-content/uploads/2023/05/anh-6.webp', N'Mở đầu năm mới 2023, Beyono Việt Nam  gây “sốt” trên thị trường bằng bộ sưu tập trang phục bóng chuyền Beyono Bengal cực chất. Sản phẩm hiện đang thu hút sự quan tâm của đông đảo khách hàng vì không chỉ có thiết kế đẹp mắt mà còn tích hợp nhiều tính năng vượt trội, đạt chuẩn của một bộ trang phục thể thao chất lượng và chuyên nghiệp.', 130000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (12, 2, N'Áo Bóng Chuyền Beyono King', N'https://beyono.vn/wp-content/uploads/2023/05/276228226_1322967698211639_3746295191409090402_n.webp', N'Tự hào là người con đất Việt, BEYONO luôn đề cao việc thông qua ngôn ngữ thời trang, những hình ảnh mang đậm giá trị văn hóa có thể tiếp cận lớp trẻ hiện đại. Cùng BST KING với trí tưởng tượng phong phú NTK đã khéo léo dẫn dắt biểu tượng thể thao “bắt gặp” văn hoá lịch sử tại NINH BÌNH, tạo nên chất DNA đương đại nhưng vẫn cực gần gũi.', 130000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (13, 2, N'QUẦN ÁO BÓNG CHUYỀN BST Vol2', N'https://khuongngocsports.vn/wp-content/uploads/2023/03/IMG_20230309_114700.jpg', N'Thiết kế thời thượng : Các điểm cắt phối mới lạ và ấn tượng. Hoạ tiết thân áo dập nổi độc đáo, được thiết kế bởi đội ngũ giàu kinh nghiệm nhà Riki giúp bạn trở thành một fashion thực thụ trên sân.', 130000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (14, 2, N'Quần áo Bóng Chuyền CP SAVIA ', N'https://hidosport.vn/wp-content/uploads/2022/10/quan-ao-bong-chuyen-cp-savia-cam.jpg', N'BST bóng chuyền Savia được ra đời với điểm nhấn là những hoa văn dòng chảy bất quy tắc nhưng lại gặp nhau tại một điểm. Thể hiện mỗi cá thể khác nhau nhưng đều có chung tinh thần mạnh mẽ, sự đoàn kết cùng nhau tỏa sáng làm nên kỳ tích.', 130000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (15, 2, N'Beyono-Áo Bóng Chuyền Nữ Thunder 4', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/180/515/products/thunder-xanh-3423f7f0-7b61-4c05-81ac-b1514bb24f14.jpg?v=1615362548537', N'Điểm nhấn của Beyono Thunder là những họa tiết sấm sét cách điệu đan xen vào nhau. Thể hiện sự mạnh mẽ, sức mạnh vượt bậc tựa như những pha đập bóng trên sân bất ngờ, đầy sự khéo léo khiến đối thủ phải ngã mũ thán phục.Cùng những đường nét được phối ghép uyển chuyển, tinh tế trên nền màu cơ bản, tạo nét chấm phá vừa phong cách, vừa cổ điển pha chút hiện đại, trẻ trung, để bộ trang phục năng động, trẻ trung và hiện đại.', 130000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (16, 3, N'Bóng chuyền Thăng Long VB7000', N'https://cdn.yousport.vn/Media/Products/280121052219559/bong-chuyen-thang-long-vb7000_large.jpg?width=284&height=213&quality=99&scale=downscaleonly', N'Banh bóng chuyền thi đấu da Nhật VB7000 chính hãng Thăng Long được may cực chắc chắn, tròn đều từ chất liệu da PU nhung cho độ nảy chính xác. Quả bóng giữ hơi tốt và tạo cảm giác êm tay khi chơi.', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (17, 3, N'Bóng chuyền Thăng Long VB7400', N'https://cdn.yousport.vn/Media/Products/280121052127695/bong-chuyen-thang-long-vb7400_large.jpg?width=284&height=213&quality=99&scale=downscaleonly', N' Banh bóng chuyền thi đấu da Nhật VB7400 được may chắc chắn, tròn đều từ chất liệu da nhung nhập khẩu và đạt tiêu chuẩn thi đấu chuyên nghiệp. Bóng có độ nảy cực chuẩn, giữ hơi tốt và tạo cảm giác êm dịu tay khi đánh.', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (18, 3, N'Bóng chuyền DL 200', N'https://cdn.yousport.vn/Media/Products/280121053420419/bong-chuyen-dl-200_large.jpg?width=284&height=213&quality=99&scale=downscaleonly', N'Banh bóng chuyền DL 200 sản xuất theo tiêu chuẩn thi đấu, đáp ứng mọi nhu cầu thi đấu trong nước và quốc tế', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (19, 3, N'Bóng chuyền Thăng Long PVC5030X', N'https://cdn.yousport.vn/Media/Products/250921092031077/bong-chuyen-thang-long-pvc5030x_large.jpg?width=284&height=213&quality=99&scale=downscaleonly', N'Quả bóng chuyền Thăng Long thi đấu PVC 5030 được may tròn đều từ chất liệu da cao cấp, cho độ nảy cực chuẩn và rất êm tay khi chơi. Bóng có độ bền cao + giữ hơi rất tốt.', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (20, 3, N'Bóng chuyền Thăng Long PVC5020', N'https://cdn.yousport.vn/Media/Products/100222040831546/bong-chuyen-thang-long-pvc5020_large.png?width=284&height=213&quality=99&scale=downscaleonly', N'Quả bóng chuyền da Thăng Long 5020 vô cùng chắc chắn, đồng đều từ chất liệu da PVC xịn và độ nảy chính xác. Bóng giữ hơi tốt và tạo cảm giác êm dịu khi chơi.', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (21, 3, N'Bóng chuyền Thăng Long 6600X', N'https://cdn.yousport.vn/Media/Products/091021021411726/bong-chuyen-thang-long-6600x_large.png?width=284&height=213&quality=99&scale=downscaleonly', N'Bóng chuyền Thăng Long 6600X là sản phẩm quả bóng chuyền được sản xuất với tiêu chuẩn tập luyện và thi đấu bóng chuyền phong trào tại Việt Nam. Với thiết kế xoáy đẹp mắt và chất liệu da mề mại thì TL6600 được rất nhiều đội bóng chuyền phong trào ở Việt Nam lựa chọn để tập luyện.', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (22, 3, N'Bóng chuyền Thăng Long TL6600', N'https://cdn.yousport.vn/Media/Products/290121093207062/bong-chuyen-thang-long-tl6600_large.jpg?width=284&height=213&quality=99&scale=downscaleonly', N'Banh bóng chuyền Thăng Long TL6600 là mẫu bóng đạt tiêu chuẩn thi đấu và phù hợp sử dụng cho tập luyện + thi đấu bóng chuyền tại nhà hoặc trường học.', 800000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (23, 4, N'Bó Gối Ngắn Đệm Mizuno FreeSize', N'https://bizweb.dktcdn.net/thumb/large/100/180/515/products/z3345028535592-57f6a8948c0f43368fca0dad22d34eb7.jpg?v=1650099965000', N'Khi chơi thể thao, đặc biệt là bóng chuyền, việc dùng lực ở toàn thân với tốc độ phản xạ khá cao nên rất dễ gây ra tình trạng tổn thương dây chằng, bong gân, căng cơ,… Đồng thời, các mô mềm như đầu gối, khuỷu tay thường xuyên va chạm với mặt sân gây tình trạng bầm, tím, sưng, trầy.', 250000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (24, 4, N'Băng gối bảo vệ 360º VN Support', N'https://bizweb.dktcdn.net/thumb/large/100/180/515/products/mg-4959.jpg?v=1597638309587', N'Băng Bảo Vệ Khớp Gối 360º - chuyên hỗ trợ cho chấn thương khớp đầu gối trong thể thao. Giảm đau nhức trong vận động, hỗ trợ chân bị thoái hóa khớp, giãn dây chằng và đứt dây chằng. Băng gối 360º còn giúp phục hồi sau chấn thương, phù hợp cho hầu hết các môn thể thao trên mặt đất. ', 250000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (25, 4, N'Lưới bóng chuyền thi đấu VF419535', N'https://s.meta.com.vn/img/thumb.ashx/300x300x95/Data/image/2020/03/05/luoi-bong-chuyen-thi-dau-vf419535-423110-300.jpg', N'Lưới bóng chuyền thi đấu VF419535 (423110) được thiết kế chắc chắn với chất liệu cao cấp, dùng để thi đấu chuyên nghiệp. ', 600000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (26, 4, N'Lưới bóng chuyền tập luyện 402411N', N'https://s.meta.com.vn/img/thumb.ashx/300x300x95/Data/Image/product_images/chang/Dothethao/2011/t3/tuan%202/luyen1.jpg', N' Sợi CPE đã qua xử lý UV chống lão hóa- Định hình qua máy hấp chuyên dụng giúp hỗ trợ tập luyện', 600000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (27, 4, N'Bảng điểm bóng chuyền 2 số có chân S358', N'https://s.meta.com.vn/Data/image/2019/04/17/bang-diem-bong-chuyen-2-so-co-chan-s358-402358.jpg', N' Bảng điểm bóng chuyền là dụng cụ không thể thiếu khi thi đấu, giúp chấm điểm 2 đội chính xác. Bảng điểm bóng chuyền S358 thiết kế chia làm 2 đội, điểm có 2 chữ số giúp trọng tài chấm điểm dễ dàng hơn. ', 400000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (28, 4, N'Xe đựng bóng chuyền', N'https://s.meta.com.vn/Data/image/2021/06/16/may-nen-khi-khong-dau-puma-off1500-x-2-6hp-50l-1.jpg', N' Khoang chứa rộng rãi có khả năng đựng tới 25 quả bóng tiêu chuẩn. Xe sử dụng rất đơn giản, khi không sử dụng bạn chỉ cần gập lại 1 cách dễ dàng.', 500000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (29, 5, N'Huy Chương Bóng Chuyền Hợp Kim Màu', N'https://bizweb.dktcdn.net/thumb/large/100/180/515/products/e4c449ca5c35ba6be324.jpg?v=1573005745173', N'Huy chương màu cao cấp, không bay màu, đúc theo khuôn đẹp dành cho bóng chuyền cùng dây đeo bằng lụa màu đường kính 8cm.', 50000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (30, 5, N'Huy Chương Bóng Chuyền Kim Loại', N'https://bizweb.dktcdn.net/thumb/large/100/180/515/products/f5c14bd85e27b879e136.jpg?v=1573005504680', N'Huy chương được làm bằng kim loại, đúc theo khuôn, in nổi hình ảnh đam mê bóng chuyền cùng dây đeo vải với đường kính 7cm.', 70000.0000)
INSERT [dbo].[Product] ([pid], [cid], [name], [image], [description], [price]) VALUES (31, 5, N'Cup Lưu Niệm Bóng Chuyền', N'https://bizweb.dktcdn.net/thumb/large/100/180/515/products/ec75c36ad69530cb6984.jpg?v=1573004266490', N'Cúp lưu niệm là quà tặng không thể thiếu trong mỗi giải đấu bóng chuyền, đó là phần thưởng cho cá nhân hoặc tập thể xuất sắc nhất.', 200000.0000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 1, 9)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 2, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 3, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 4, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 5, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 6, 16)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 7, 18)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (1, 8, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 1, 10)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 2, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 3, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 4, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 5, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 6, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 7, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (2, 8, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 1, 10)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 2, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 3, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 4, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 5, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 6, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 7, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (3, 8, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 1, 8)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 2, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 3, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 4, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 5, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 6, 17)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 7, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (4, 8, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 1, 10)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 2, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 3, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 4, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 5, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 6, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 7, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (5, 8, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 9, 15)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 10, 18)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 11, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 12, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 13, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 14, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 15, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 16, 4)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 17, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 18, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 19, 3)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 20, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 21, 4)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 22, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 23, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 24, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 25, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 26, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 27, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 28, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 29, 4)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 30, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (6, 31, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (7, 9, 19)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (7, 10, 18)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (7, 11, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (7, 12, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (7, 13, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (7, 14, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (7, 15, 5)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (8, 9, 14)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (8, 10, 18)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (8, 11, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (8, 12, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (8, 13, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (8, 14, 20)
INSERT [dbo].[ProductDetail] ([sid], [pid], [quantity]) VALUES (8, 15, 5)
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id], [name]) VALUES (1, N'40')
INSERT [dbo].[Size] ([id], [name]) VALUES (2, N'41')
INSERT [dbo].[Size] ([id], [name]) VALUES (3, N'42')
INSERT [dbo].[Size] ([id], [name]) VALUES (4, N'43')
INSERT [dbo].[Size] ([id], [name]) VALUES (5, N'44')
INSERT [dbo].[Size] ([id], [name]) VALUES (6, N'XL')
INSERT [dbo].[Size] ([id], [name]) VALUES (7, N'L')
INSERT [dbo].[Size] ([id], [name]) VALUES (8, N'M')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[AccountDetail]  WITH CHECK ADD  CONSTRAINT [FK_AccountDetail_Account] FOREIGN KEY([uid])
REFERENCES [dbo].[Account] ([uid])
GO
ALTER TABLE [dbo].[AccountDetail] CHECK CONSTRAINT [FK_AccountDetail_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_AccountDetail] FOREIGN KEY([uid])
REFERENCES [dbo].[AccountDetail] ([uid])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_AccountDetail]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AccountDetail] FOREIGN KEY([uid])
REFERENCES [dbo].[AccountDetail] ([uid])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AccountDetail]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([oid])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Order]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Product]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Size] FOREIGN KEY([sid])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Size]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category1] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category1]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Size] FOREIGN KEY([sid])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Size]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
