USE [RealEstate]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Auction_Category]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Auction_Image]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[AuctionParticipant]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Banking]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 24/02/2024 8:55:11 CH ******/
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
	[BankId] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[TicketComment]    Script Date: 24/02/2024 8:55:11 CH ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 24/02/2024 8:55:11 CH ******/
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
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [BankId]) VALUES (2, 100000.0000, 4, 4, N'12345', CAST(N'2024-02-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [Status], [Code], [TransactionDate], [BankId]) VALUES (3, 123450.0000, 4, 1, N'32155', CAST(N'2024-02-10T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([Id], [UserId], [StaffId], [Title], [Description], [Status]) VALUES (1, 4, 10, N'Need Help', N'1235656', 2)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketComment] ON 

INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (1, 4, N'abcyxz', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (2, 10, N'xyz123', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (3, 10, N'asdf', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (4, 10, N'a', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (5, 10, N'123', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (6, 10, N'abc', 1)
INSERT [dbo].[TicketComment] ([Id], [UserId], [Comment], [TicketId]) VALUES (7, 10, N'asdf', 1)
SET IDENTITY_INSERT [dbo].[TicketComment] OFF
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
