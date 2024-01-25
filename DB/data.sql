USE [RealEstate]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleId], [Description], [Wallet]) VALUES (4, N'Huy Hai', N'hai@gmail.com', N'12345678@', N'0987654321', CAST(N'2002-12-04' AS Date), N'SG', N'asas', 3, NULL, 0.0000)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (1, N'sdfsd', 1, 0)
INSERT [dbo].[Category] ([Id], [Name], [Status], [DeleteFlag]) VALUES (2, N'2sdfsdf', 0, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
