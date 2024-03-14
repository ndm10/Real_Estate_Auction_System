USE [RealEstate]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 14/03/2024 3:15:04 CH ******/
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
	[ApproverId] [int] NULL,
	[Status] [tinyint] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NULL,
	[Reason] [ntext] NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction_Bidding]    Script Date: 14/03/2024 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction_Bidding](
	[BiddingId] [int] IDENTITY(1,1) NOT NULL,
	[AuctionId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[BiddingPrice] [money] NOT NULL,
	[TimeBidding] [datetime] NOT NULL,
 CONSTRAINT [PK_Auction_Bidding] PRIMARY KEY CLUSTERED 
(
	[BiddingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction_Category]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[Auction_Image]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[AuctionParticipant]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[Banking]    Script Date: 14/03/2024 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BankAccount] [ntext] NULL,
	[AccountName] [ntext] NULL,
	[BankName] [ntext] NULL,
	[Status] [bit] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Banking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 14/03/2024 3:15:04 CH ******/
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
	[TransactionDate] [datetime] NULL,
	[UserBankName] [nvarchar](50) NULL,
	[UserBankAccount] [nvarchar](50) NULL,
	[Type] [tinyint] NULL,
	[BankId] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14/03/2024 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Ticket_Image]    Script Date: 14/03/2024 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[Url] [ntext] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketComment]    Script Date: 14/03/2024 3:15:04 CH ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 14/03/2024 3:15:04 CH ******/
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
	[Status] [tinyint] NULL,
	[Wallet] [money] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auction] ON 

INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime], [Reason]) VALUES (1, N'asdf32412321212142124', 1233.0000, 12333333.0000, 12, N'336, Kim Đồng', 1, N'1233', N'32152532552521', 4, 18, 2, 0, CAST(N'2024-03-11T18:06:00.000' AS DateTime), CAST(N'2024-03-21T18:06:00.000' AS DateTime), CAST(N'2024-03-11T18:06:35.307' AS DateTime), NULL, N'1243')
INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime], [Reason]) VALUES (35, N'12333241342142142142121413421', 1233.0000, 124312424221.0000, 12, N'336, Kim Đồng', 1, N'1233', N'44444444444', 4, 18, 2, 0, CAST(N'2024-03-11T19:42:00.000' AS DateTime), CAST(N'2024-03-15T19:42:00.000' AS DateTime), CAST(N'2024-03-11T19:44:10.667' AS DateTime), NULL, NULL)
INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime], [Reason]) VALUES (36, N'asdf32412321212142124', 1233.0000, 12333333.0000, 12, N'336, Kim Đồng', 1, N'Đông', N'125125152252', 4, 18, 2, 0, CAST(N'2024-03-13T10:14:00.000' AS DateTime), CAST(N'2024-03-14T10:15:00.000' AS DateTime), CAST(N'2024-03-12T10:16:01.580' AS DateTime), NULL, NULL)
INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime], [Reason]) VALUES (37, N'tick and tock, once more, you''re hosting', 1233.0000, 12333333.0000, 12, N'336, Kim Đồng', 1, N'abcky', N'21431441414', 4, 18, 4, 0, CAST(N'2024-03-13T22:05:00.000' AS DateTime), CAST(N'2024-03-15T22:05:00.000' AS DateTime), CAST(N'2024-03-12T22:08:46.263' AS DateTime), NULL, NULL)
INSERT [dbo].[Auction] ([Id], [Title], [StartPrice], [EndPrice], [Area], [Address], [Facade], [Direction], [Description], [UserId], [ApproverId], [Status], [DeleteFlag], [StartTime], [EndTime], [CreatedTime], [UpdatedTime], [Reason]) VALUES (38, N'Dahail1234214442142', 1233.0000, 12333333.0000, 12, N'336, Kim Đồng', 1, N'Đông', N'1234123', 4, 10, 1, 0, CAST(N'2024-03-14T22:22:00.000' AS DateTime), CAST(N'2024-03-16T22:22:00.000' AS DateTime), CAST(N'2024-03-12T22:22:21.557' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Auction] OFF
GO
SET IDENTITY_INSERT [dbo].[Auction_Bidding] ON 

INSERT [dbo].[Auction_Bidding] ([BiddingId], [AuctionId], [MemberId], [BiddingPrice], [TimeBidding]) VALUES (1, 37, 5, 3000.0000, CAST(N'2024-03-14T13:13:16.983' AS DateTime))
INSERT [dbo].[Auction_Bidding] ([BiddingId], [AuctionId], [MemberId], [BiddingPrice], [TimeBidding]) VALUES (3, 37, 20, 10000.0000, CAST(N'2024-03-14T15:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Auction_Bidding] OFF
GO
INSERT [dbo].[Auction_Category] ([AuctionId], [CategoryId]) VALUES (1, 1)
INSERT [dbo].[Auction_Category] ([AuctionId], [CategoryId]) VALUES (35, 3)
INSERT [dbo].[Auction_Category] ([AuctionId], [CategoryId]) VALUES (36, 3)
INSERT [dbo].[Auction_Category] ([AuctionId], [CategoryId]) VALUES (37, 1)
GO
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (1, 1)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (2, 1)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (3, 1)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (88, 35)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (89, 36)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (91, 37)
INSERT [dbo].[Auction_Image] ([ImageId], [AuctionId]) VALUES (92, 38)
GO
INSERT [dbo].[AuctionParticipant] ([UserId], [AuctionId]) VALUES (5, 36)
INSERT [dbo].[AuctionParticipant] ([UserId], [AuctionId]) VALUES (5, 37)
INSERT [dbo].[AuctionParticipant] ([UserId], [AuctionId]) VALUES (20, 37)
GO
SET IDENTITY_INSERT [dbo].[Banking] ON 

INSERT [dbo].[Banking] ([Id], [BankAccount], [AccountName], [BankName], [Status], [DeleteFlag]) VALUES (1, N'12345678', N'NGUYEN VAN QUANG', N'BIDV', 1, 0)
SET IDENTITY_INSERT [dbo].[Banking] OFF
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

INSERT [dbo].[Images] ([Id], [Url]) VALUES (1, N'~/img/cc945ea6-e1ee-44e6-add1-152d1ba0b972.gif')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (2, N'~/img/2073fce9-c1e3-456a-8391-8b88b22526e3.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (3, N'~/img/04f95007-e003-4ba4-93cf-8ea9de320697.gif')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (88, N'~/img/2e49ce8c-3631-4099-8c3d-ebdce0965691.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (89, N'~/img/86a19e84-b6bf-47b2-b650-52e45c797966.gif')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (91, N'~/img/092dbe68-03b1-4640-ae80-1db55b826465.png')
INSERT [dbo].[Images] ([Id], [Url]) VALUES (92, N'~/img/664c351d-ad8a-4a55-ba92-b391114e26e5.gif')
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (1, N'Phiên đấu giá bị từ chối', 4, N'/manage-auction', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (2, N'Phiên đấu giá đã được phê duyệt', 4, N'/manage-auction', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (3, N'Phiên đấu giá đã được phê duyệt', 4, N'/manage-auction', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (4, N'Phiên đấu giá 12333241342142142142121413421 đã được phê duyệt', 4, N'/manage-auction', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (5, N'Phiên đấu giá 12333241342142142142121413421 đã được phê duyệt', 4, N'/manage-auction', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (6, N'Nạp thành công 22222,0000 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (7, N'Nạp thành công 22222,0000 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (8, N'Nạp thành công 22222 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (9, N'Nạp thành công 2222 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (10, N'Nạp thành công 22222 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (11, N'Nạp thành công 22222 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (12, N'Nạp thành công 2222 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (13, N'Yêu cầu thanh toán bị từ chối', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (14, N'Yêu cầu thanh toán bị từ chối', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (15, N'Yêu cầu thanh toán bị từ chối', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (16, N'Nạp thành công 2222 vào ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (17, N'Rút thành công 22222 khỏi ví', 4, N'/top-up', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (18, N'Yêu cầu hỗ trợ đã được trả lời', 4, N'/member/list-ticket/1', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (19, N'Phiên đấu giá asdf32412321212142124 đã được phê duyệt', 4, N'/manage-auction', 0)
INSERT [dbo].[Notification] ([Id], [Description], [ToUser], [Link], [IsRead]) VALUES (20, N'Phiên đấu giá tick and tock, once more, you''re hosting đã được phê duyệt', 4, N'/manage-auction', 0)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (2, 100000.0000, 4, 3, N'12345', CAST(N'2024-02-10T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (3, 123450.0000, 4, 1, N'32155', CAST(N'2024-02-10T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (4, 22222.0000, 4, 2, N'NAP_5:20 CH', CAST(N'2024-02-25T17:20:31.990' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (5, 2222.0000, 4, 2, N'RUT_6:54 CH', CAST(N'2024-02-25T18:54:05.013' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (6, 2222.0000, 4, 2, N'RUT_6:54 CH', CAST(N'2024-02-25T18:54:29.210' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (7, 22222.0000, 4, 2, N'NAP_6:57 CH', CAST(N'2024-02-25T18:57:47.800' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (8, 22222.0000, 4, 2, N'NAP_7:02 CH', CAST(N'2024-02-25T19:02:28.200' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (9, 2222.0000, 4, 2, N'RUT_7:07 CH', CAST(N'2024-02-25T19:07:56.997' AS DateTime), NULL, N'123444', 2, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (10, 22222.0000, 4, 1, N'NAP_7:28 CH', CAST(N'2024-02-25T19:28:44.010' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (11, 22222.0000, 4, 1, N'NAP_7:29 CH', CAST(N'2024-02-25T19:29:16.523' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (12, 22222.0000, 4, 1, N'NAP_7:30 CH', CAST(N'2024-02-25T19:30:03.913' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (13, 2222.0000, 4, 1, N'NAP_7:33 CH', CAST(N'2024-02-25T19:33:12.420' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (14, 2222.0000, 4, 1, N'NAP_7:33 CH', CAST(N'2024-02-25T19:33:44.243' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (15, 2222.0000, 4, 1, N'NAP_7:34 CH', CAST(N'2024-02-25T19:34:07.477' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (16, 2222.0000, 4, 1, N'NAP_7:34 CH', CAST(N'2024-02-25T19:34:45.453' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (17, 2222.0000, 4, 1, N'NAP_7:35 CH', CAST(N'2024-02-25T19:35:41.293' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (18, 2222.0000, 4, 1, N'NAP_7:36 CH', CAST(N'2024-02-25T19:36:29.133' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (19, 2222.0000, 4, 1, N'NAP_7:36 CH', CAST(N'2024-02-25T19:36:51.343' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (20, 2222.0000, 4, 1, N'NAP_7:37 CH', CAST(N'2024-02-25T19:37:40.030' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (21, 2222.0000, 4, 1, N'NAP_7:38 CH', CAST(N'2024-02-25T19:38:06.763' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (22, 2222.0000, 4, 1, N'NAP_7:38 CH', CAST(N'2024-02-25T19:38:22.540' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (23, 2222.0000, 4, 1, N'NAP_7:38 CH', CAST(N'2024-02-25T19:38:52.513' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (24, 2222.0000, 4, 1, N'NAP_7:39 CH', CAST(N'2024-02-25T19:39:35.287' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (25, 2222.0000, 4, 2, N'NAP_7:39 CH', CAST(N'2024-02-25T19:39:43.053' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (26, 2222.0000, 4, 3, N'NAP_7:40 CH', CAST(N'2024-02-25T19:40:20.373' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (27, 2222.0000, 4, 3, N'NAP_7:40 CH', CAST(N'2024-02-25T19:40:53.977' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (28, 2222.0000, 4, 3, N'NAP_7:41 CH', CAST(N'2024-02-25T19:41:05.073' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (29, 2222.0000, 4, 3, N'NAP_7:41 CH', CAST(N'2024-02-25T19:41:40.307' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (30, 2222.0000, 4, 3, N'NAP_7:42 CH', CAST(N'2024-02-25T19:42:31.323' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (31, 2222.0000, 4, 3, N'NAP_7:42 CH', CAST(N'2024-02-25T19:42:41.773' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (32, 2222.0000, 4, 3, N'NAP_7:43 CH', CAST(N'2024-02-25T19:43:41.977' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (33, 2222.0000, 4, 3, N'NAP_7:45 CH', CAST(N'2024-02-25T19:45:49.010' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (34, 2222.0000, 4, 2, N'RUT_7:47 CH', CAST(N'2024-02-25T19:47:57.010' AS DateTime), NULL, N'123444', 3, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (35, 2222.0000, 4, 2, N'RUT_10:01 CH', CAST(N'2024-02-25T22:01:17.837' AS DateTime), NULL, N'123444', 3, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (36, 4444.0000, 4, 2, N'NAP_10:03 CH', CAST(N'2024-02-25T22:03:43.520' AS DateTime), NULL, N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (37, 2222.0000, 4, 2, N'RUT_10:07 CH', CAST(N'2024-02-25T22:07:37.897' AS DateTime), NULL, N'123444', 2, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (38, 22222.0000, 4, 2, N'NAP_8:25 CH', CAST(N'2024-03-11T20:25:58.853' AS DateTime), NULL, N'123444', 2, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (39, 22222.0000, 4, 1, N'NAP_10:00 CH', CAST(N'2024-03-11T22:00:06.103' AS DateTime), N'MBBANK', N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (40, 0.0000, 4, 1, N'NAP_10:54 CH', CAST(N'2024-03-11T22:54:49.917' AS DateTime), N'MBBANK', N'123444', 1, 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [UserBankName], [UserBankAccount], [Type], [BankId]) VALUES (41, 100000000000.0000, 4, 1, N'NAP_1:09 CH', CAST(N'2024-03-14T13:09:08.593' AS DateTime), N'MBBANK', N'12342142142', 1, 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([Id], [UserId], [StaffId], [Title], [Description], [Status]) VALUES (1, 4, 10, N'Need Help', N'1235656', 1)
INSERT [dbo].[Ticket] ([Id], [UserId], [StaffId], [Title], [Description], [Status]) VALUES (2, 4, 13, N'asdf', N'12344', 1)
INSERT [dbo].[Ticket] ([Id], [UserId], [StaffId], [Title], [Description], [Status]) VALUES (3, 4, 10, N'Dahail', N'one two three four five', 1)
INSERT [dbo].[Ticket] ([Id], [UserId], [StaffId], [Title], [Description], [Status]) VALUES (4, 4, NULL, N'asdf32412321212142124', N'123412', 1)
INSERT [dbo].[Ticket] ([Id], [UserId], [StaffId], [Title], [Description], [Status]) VALUES (5, 4, NULL, N'asdf32412321212142124', N'12412421', 1)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket_Image] ON 

INSERT [dbo].[Ticket_Image] ([Id], [TicketId], [Url]) VALUES (1, 2, N'~/img/998c3bf9-43d5-4100-b6af-b2995835433c.gif')
INSERT [dbo].[Ticket_Image] ([Id], [TicketId], [Url]) VALUES (2, 2, N'~/img/9923cba7-91c9-445c-b37a-3587a9c54cb4.png')
INSERT [dbo].[Ticket_Image] ([Id], [TicketId], [Url]) VALUES (3, 2, N'~/img/bfe18a38-e043-4ba9-81e1-92a044504a33.gif')
INSERT [dbo].[Ticket_Image] ([Id], [TicketId], [Url]) VALUES (4, 3, N'~/img/5b0ba963-5d0a-452f-b109-e44f8b535b02.gif')
INSERT [dbo].[Ticket_Image] ([Id], [TicketId], [Url]) VALUES (5, 4, N'~/img/70f7ffb5-1f6c-49f2-bc8a-01316261611e.gif')
SET IDENTITY_INSERT [dbo].[Ticket_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketComment] ON 

INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (1, 4, N'abcyxz', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (2, 10, N'xyz123', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (3, 10, N'asdf', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (4, 10, N'a', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (5, 10, N'123', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (6, 10, N'abc', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (7, 10, N'asdf', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (8, 10, N'asdf', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (9, 10, N'asdfsa', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (10, 10, N'123', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (11, 10, N'12345', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (12, 10, N'abcxyz', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (13, 4, N'1234', 2)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (14, 4, N'3455', 2)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (15, 10, N'1234123', 1)
SET IDENTITY_INSERT [dbo].[TicketComment] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (4, N'Linh', N'linh@gmail.com', N'12345678h', N'0987654321', CAST(N'2002-12-04' AS Date), N'SG', N'asas', 3, NULL, 1, 202344442.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (5, N'Long', N'hihi@gmail.com', N'12345678h', N'0987654444', CAST(N'2024-01-31' AS Date), N'asdfasdfasdf', NULL, 3, NULL, 1, 202341442.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (10, N'Chiến', N'staff1@gmail.com', N'12345678h', N'0987654321', CAST(N'2000-02-02' AS Date), N'SG', NULL, 2, NULL, 1, 26666.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (13, N'Hải', N'staff2@gmail.com', N'12345678h', N'0987681237', CAST(N'1989-02-15' AS Date), N'SG', NULL, 2, NULL, 1, 0.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (14, N'Quỳnh Anh', N'admin@gmail.com', N'12345678h', N'0978917892', CAST(N'1999-05-06' AS Date), N'HN', NULL, 1, NULL, 1, 0.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (18, N'Quang 1234', N'staff10@gmail.com', N'12345678h', N'3374984661', CAST(N'2024-03-07' AS Date), N'', NULL, 2, NULL, 1, 5000000.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (19, N'Quang NV', N'staff11@gmail.com', N'12345678h', N'4337498466', CAST(N'2024-03-19' AS Date), N'', NULL, 2, NULL, 1, 119998.0000)
INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Status], [Wallet]) VALUES (20, N'Quang NV', N'quangnv@gmail.com', N'12345678h', N'0337498466', CAST(N'2024-03-05' AS Date), N'336, Kim Đồng', NULL, 3, NULL, 1, 0.0000)
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
ALTER TABLE [dbo].[Auction_Bidding]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Bidding_Auction] FOREIGN KEY([AuctionId])
REFERENCES [dbo].[Auction] ([Id])
GO
ALTER TABLE [dbo].[Auction_Bidding] CHECK CONSTRAINT [FK_Auction_Bidding_Auction]
GO
ALTER TABLE [dbo].[Auction_Bidding]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Bidding_User] FOREIGN KEY([MemberId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Auction_Bidding] CHECK CONSTRAINT [FK_Auction_Bidding_User]
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
ALTER TABLE [dbo].[Ticket_Image]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Image_Ticket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
GO
ALTER TABLE [dbo].[Ticket_Image] CHECK CONSTRAINT [FK_Ticket_Image_Ticket]
GO
ALTER TABLE [dbo].[TicketComment]  WITH CHECK ADD  CONSTRAINT [FK_TicketComment_Ticket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
GO
ALTER TABLE [dbo].[TicketComment] CHECK CONSTRAINT [FK_TicketComment_Ticket]
GO
ALTER TABLE [dbo].[TicketComment]  WITH CHECK ADD  CONSTRAINT [FK_TicketComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketComment] CHECK CONSTRAINT [FK_TicketComment_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role1] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role1]
GO
