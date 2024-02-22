USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 2/23/2024 2:29:04 AM ******/
CREATE DATABASE [RealEstate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\RealEstate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RealEstate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\RealEstate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RealEstate] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstate] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstate] SET RECOVERY FULL 
GO
ALTER DATABASE [RealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RealEstate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RealEstate] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RealEstate', N'ON'
GO
ALTER DATABASE [RealEstate] SET QUERY_STORE = OFF
GO
USE [RealEstate]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[StartPrice] [money] NOT NULL,
	[EndPrice] [money] NOT NULL,
	[Area] [float] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Facade] [float] NOT NULL,
	[Direction] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[UserId] [int] NOT NULL,
	[ApproverId] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction_Category]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction_Category](
	[AuctionId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Auction_Category] PRIMARY KEY CLUSTERED 
(
	[AuctionId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction_Image]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction_Image](
	[ImageId] [int] NOT NULL,
	[AuctionId] [int] NOT NULL,
 CONSTRAINT [PK_Auction_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC,
	[AuctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionParticipant]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionParticipant](
	[UserId] [int] NOT NULL,
	[AuctionId] [int] NOT NULL,
 CONSTRAINT [PK_AuctionParticipant_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AuctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banking]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banking](
	[Id] [int] NOT NULL,
	[BankAccount] [ntext] NULL,
	[BankName] [ntext] NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Banking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [ntext] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [ntext] NULL,
	[ToUser] [int] NULL,
	[Link] [ntext] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [money] NULL,
	[UserId] [int] NULL,
	[Status] [tinyint] NULL,
	[Code] [ntext] NULL,
	[BankId] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[StaffId] [int] NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketComment]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [ntext] NOT NULL,
	[TicketId] [int] NOT NULL,
 CONSTRAINT [PK_TicketComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/23/2024 2:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[DOB] [date] NOT NULL,
	[Address] [ntext] NOT NULL,
	[Avatar] [ntext] NULL,
	[RoleId] [int] NOT NULL,
	[Description] [ntext] NULL,
	[Wallet] [money] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auction] ON 

INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime]) VALUES (8, N'Đấu giá nhà đất thổ cư', 50000000.0000, 100000000.0000, 50, N'Giải phóng, Hà Nội', 3, N'Tây', N'zzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzzz
z
z



zzzzzzzzzzzzzzzzzzzzzzz', 4, 10, 2, 0, CAST(N'2024-02-23T22:10:00.000' AS DateTime), CAST(N'2024-02-24T14:14:00.000' AS DateTime), CAST(N'2024-02-19T22:10:24.950' AS DateTime), CAST(N'2024-02-22T22:18:03.020' AS DateTime))
INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime]) VALUES (9, N'Đấu giá nhà đất thổ cư', 500000.0000, 1000000.0000, 42, N'Sài Gòn', 4, N'Tây', N'dsfasdfasd
fasdfasdfas
fasdfa
fdsssdsfsdfsdfasdfasdfsdfasdfsfa', 5, 13, 2, 0, CAST(N'2024-02-23T14:27:00.000' AS DateTime), CAST(N'2024-02-24T02:28:00.000' AS DateTime), CAST(N'2024-02-19T23:25:33.970' AS DateTime), NULL)
INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime]) VALUES (10, N'Đấu giá nhà đất thổ cư', 500000.0000, 1000000.0000, 42, N'Sài Gòn', 4, N'Tây', N'fgdfgdfgd', 4, 10, 2, 0, CAST(N'2024-02-22T22:18:00.000' AS DateTime), CAST(N'2024-02-24T01:19:00.000' AS DateTime), CAST(N'2024-02-22T22:16:52.183' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Auction] OFF
GO
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (25, 8)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (26, 8)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (27, 8)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (28, 9)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (29, 9)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (30, 9)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (31, 10)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (32, 10)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (33, 10)
GO
INSERT [dbo].[AuctionParticipant] ([UserId], [AuctionId]) VALUES (5, 10)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (1, N'Nhà riêng', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (2, N'Nhà mặt phố', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (3, N'Nhà chung cư', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (4, N'Nhà biệt thự liền kề', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (5, N'Đất', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (6, N'Đất nền dự án', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (7, N'Cửa hàng, ki ốt', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (8, N'Đất công nghiệp', 1, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Url]) VALUES (25, N'~/img/44cec290-b98f-4d39-a96d-83afea10be26.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (26, N'~/img/9bbe489e-76db-4f17-8c48-72bb67a61595.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (27, N'~/img/2b121c04-9883-469b-b563-aba12127803f.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (28, N'~/img/cbdc3f15-a361-45f9-96ca-dc1e672ba5f4.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (29, N'~/img/6ef18954-75d1-431c-a06e-28a0bbaccb42.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (30, N'~/img/853cc69c-aaf7-4357-a0ee-81c078a079d2.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (31, N'~/img/2fea5c22-e284-45fc-a8e3-02a458e40ce3.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (32, N'~/img/b76c4971-44a2-41e0-a4af-ded3e8829316.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (33, N'~/img/60246cb7-4135-4252-9176-64c9b5648318.png')
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Wallet]) VALUES (4, N'Linh', N'linh@gmail.com', N'12345678h', N'0987654321', CAST(N'2002-12-04' AS Date), N'SG', N'asas', 3, NULL, 0.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Wallet]) VALUES (5, N'Long', N'hihi@gmail.com', N'12345678h', N'0987654444', CAST(N'2024-01-31' AS Date), N'asdfasdfasdf', NULL, 3, NULL, 0.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Wallet]) VALUES (10, N'Chiến', N'staff1@gmail.com', N'12345678h', N'0987654321', CAST(N'2000-02-02' AS Date), N'SG', NULL, 2, NULL, 0.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Wallet]) VALUES (13, N'Hải', N'staff2@gmail.com', N'12345678h', N'0987681237', CAST(N'1989-02-15' AS Date), N'SG', NULL, 2, NULL, 0.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Wallet]) VALUES (14, N'Quỳnh Anh', N'staff3@gmail.com', N'12345678h', N'0978917892', CAST(N'1999-05-06' AS Date), N'HN', NULL, 2, NULL, 0.0000)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Wallet]  DEFAULT ((0)) FOR [Wallet]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_User]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_User1] FOREIGN KEY([ApproverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_User1]
GO
ALTER TABLE [dbo].[Auction_Category]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Category_Auction] FOREIGN KEY([AuctionId])
REFERENCES [dbo].[Auction] ([Id])
GO
ALTER TABLE [dbo].[Auction_Category] CHECK CONSTRAINT [FK_Auction_Category_Auction]
GO
ALTER TABLE [dbo].[Auction_Category]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Category_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Auction_Category] CHECK CONSTRAINT [FK_Auction_Category_Category]
GO
ALTER TABLE [dbo].[Auction_Image]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Image_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[Auction_Image] CHECK CONSTRAINT [FK_Auction_Image_Images]
GO
ALTER TABLE [dbo].[Auction_Image]  WITH CHECK ADD  CONSTRAINT [FK_AuctionImage_Auction] FOREIGN KEY([AuctionId])
REFERENCES [dbo].[Auction] ([Id])
GO
ALTER TABLE [dbo].[Auction_Image] CHECK CONSTRAINT [FK_AuctionImage_Auction]
GO
ALTER TABLE [dbo].[AuctionParticipant]  WITH CHECK ADD  CONSTRAINT [FK_AuctionParticipant_Auction] FOREIGN KEY([AuctionId])
REFERENCES [dbo].[Auction] ([Id])
GO
ALTER TABLE [dbo].[AuctionParticipant] CHECK CONSTRAINT [FK_AuctionParticipant_Auction]
GO
ALTER TABLE [dbo].[AuctionParticipant]  WITH CHECK ADD  CONSTRAINT [FK_AuctionParticipant_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AuctionParticipant] CHECK CONSTRAINT [FK_AuctionParticipant_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User1] FOREIGN KEY([ToUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User1]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Banking] FOREIGN KEY([BankId])
REFERENCES [dbo].[Banking] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Banking]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User1]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_User]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_User1] FOREIGN KEY([StaffId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_User1]
GO
ALTER TABLE [dbo].[TicketComment]  WITH CHECK ADD  CONSTRAINT [FK_TicketComment_Ticket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
GO
ALTER TABLE [dbo].[TicketComment] CHECK CONSTRAINT [FK_TicketComment_Ticket]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role1] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role1]
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
