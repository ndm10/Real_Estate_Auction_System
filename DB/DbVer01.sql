USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 1/22/2024 5:10:33 PM ******/
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
ALTER DATABASE [RealEstate] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[Auction]    Script Date: 1/22/2024 5:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[StartPrice] [money] NOT NULL,
	[EndPrice] [money] NOT NULL,
	[Area] [float] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Facade] [float] NOT NULL,
	[Drirection] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[UserId] [int] NOT NULL,
	[ApproverId] [int] NULL,
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
/****** Object:  Table [dbo].[Auction_Category]    Script Date: 1/22/2024 5:10:34 PM ******/
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
/****** Object:  Table [dbo].[AuctionParticipant]    Script Date: 1/22/2024 5:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionParticipant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AuctionId] [int] NOT NULL,
	[BiddingPrice] [money] NOT NULL,
	[BiddingTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AuctionParticipant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banking]    Script Date: 1/22/2024 5:10:34 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 1/22/2024 5:10:34 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 1/22/2024 5:10:34 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 1/22/2024 5:10:34 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 1/22/2024 5:10:34 PM ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 1/22/2024 5:10:34 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 1/22/2024 5:10:34 PM ******/
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
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role1] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role1]
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
