USE [master]
GO
/****** Object:  Database [NewPro]    Script Date: 07/31/2019 11:51:03 ******/
CREATE DATABASE [NewPro] ON  PRIMARY 
( NAME = N'NewPro', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\NewPro.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NewPro_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\NewPro_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NewPro] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewPro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewPro] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [NewPro] SET ANSI_NULLS OFF
GO
ALTER DATABASE [NewPro] SET ANSI_PADDING OFF
GO
ALTER DATABASE [NewPro] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [NewPro] SET ARITHABORT OFF
GO
ALTER DATABASE [NewPro] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [NewPro] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [NewPro] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [NewPro] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [NewPro] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [NewPro] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [NewPro] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [NewPro] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [NewPro] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [NewPro] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [NewPro] SET  DISABLE_BROKER
GO
ALTER DATABASE [NewPro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [NewPro] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [NewPro] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [NewPro] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [NewPro] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [NewPro] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [NewPro] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [NewPro] SET  READ_WRITE
GO
ALTER DATABASE [NewPro] SET RECOVERY FULL
GO
ALTER DATABASE [NewPro] SET  MULTI_USER
GO
ALTER DATABASE [NewPro] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [NewPro] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'NewPro', N'ON'
GO
USE [NewPro]
GO
/****** Object:  Table [dbo].[tArticle]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tArticle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](120) NULL,
	[ArticleContent] [nvarchar](max) NULL,
	[Sort] [int] NULL,
	[Editor] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[ArtTyID] [int] NULL,
	[Click] [int] NULL,
	[Remark] [nvarchar](400) NULL,
	[FengMian] [nvarchar](250) NULL,
	[IsEnable] [int] NULL,
 CONSTRAINT [PK_article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tAbout]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAbout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[AboutContent] [nvarchar](max) NULL,
	[Sort] [int] NULL,
	[Editor] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[Click] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[FengMian] [nvarchar](500) NULL,
	[IsEnable] [int] NULL,
 CONSTRAINT [PK_aboutUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tAbout] ON
INSERT [dbo].[tAbout] ([Id], [Title], [AboutContent], [Sort], [Editor], [UpdateTime], [Click], [Remark], [FengMian], [IsEnable]) VALUES (2, N'公司简介', N'', 0, N'', NULL, NULL, N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[tAbout] OFF
/****** Object:  Table [dbo].[tPicture]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPicture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PicTyID] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[Sort] [int] NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Code] [nvarchar](100) NULL,
 CONSTRAINT [PK_picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Onlines]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Onlines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IpAdddress] [nvarchar](50) NULL,
	[LoginTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_S_Onlines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[S_Onlines] ON
INSERT [dbo].[S_Onlines] ([Id], [IpAdddress], [LoginTime], [UpdateTime], [UserId]) VALUES (0, N'::1', CAST(0x0000AA9B00BAC1FF AS DateTime), CAST(0x0000AA9B00BAC1FF AS DateTime), 12)
INSERT [dbo].[S_Onlines] ([Id], [IpAdddress], [LoginTime], [UpdateTime], [UserId]) VALUES (2, N'115.48.210.34', CAST(0x0000AA2701575FE6 AS DateTime), CAST(0x0000AA2701575FE6 AS DateTime), 13)
INSERT [dbo].[S_Onlines] ([Id], [IpAdddress], [LoginTime], [UpdateTime], [UserId]) VALUES (3, N'::1', CAST(0x0000A95400921186 AS DateTime), CAST(0x0000A95400921186 AS DateTime), 14)
INSERT [dbo].[S_Onlines] ([Id], [IpAdddress], [LoginTime], [UpdateTime], [UserId]) VALUES (4, N'::1', CAST(0x0000A9540094FF79 AS DateTime), CAST(0x0000A9540094FF79 AS DateTime), 11)
SET IDENTITY_INSERT [dbo].[S_Onlines] OFF
/****** Object:  Table [dbo].[tLink]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tLink](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Url] [varchar](100) NULL,
	[Sort] [int] NULL,
	[TyID] [int] NULL,
	[Code] [nvarchar](500) NULL,
 CONSTRAINT [PK_link] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tGuestBook]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tGuestBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Leave_name] [nvarchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Telphone] [varchar](30) NULL,
	[Address] [nvarchar](100) NULL,
	[QQ] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[GuestContent] [nvarchar](max) NULL,
	[Leave_time] [datetime] NULL,
	[Leave_ip] [varchar](30) NULL,
	[ReplayContent] [nvarchar](max) NULL,
	[Replay_ip] [varchar](30) NULL,
	[Replay_time] [datetime] NULL,
 CONSTRAINT [PK_guestbook] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tUsers]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tUsers](
	[userId] [int] IDENTITY(10,1) NOT NULL,
	[usersName] [varchar](50) NOT NULL,
	[usersPwd] [varchar](50) NOT NULL,
	[roleCode] [int] NOT NULL,
	[trueName] [varchar](50) NULL,
	[Flag] [int] NOT NULL,
	[Tel] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[usersRemark] [varchar](500) NULL,
	[dptId] [int] NULL,
 CONSTRAINT [PK_tUsers] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tUsers] ON
INSERT [dbo].[tUsers] ([userId], [usersName], [usersPwd], [roleCode], [trueName], [Flag], [Tel], [Address], [usersRemark], [dptId]) VALUES (12, N'admin', N'1BE9A0335E5DEA55', 10, N'开发人员', 1, N'13839870291', N'', N'该用户是系统的开发账户，不可操作', 10000)
SET IDENTITY_INSERT [dbo].[tUsers] OFF
/****** Object:  Table [dbo].[tSysLog]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSysLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[IP] [nvarchar](150) NULL,
	[SysTime] [datetime] NULL,
	[DoWhat] [nvarchar](350) NULL,
	[Remark] [nvarchar](150) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_tSysLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tSysLog] ON
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (77, N'admin888', N'115.59.193.118', CAST(0x0000A976013C902E AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (78, N'admin', N'115.59.193.118', CAST(0x0000A976013CB18D AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (79, N'admin888', N'115.59.193.118', CAST(0x0000A976013CC18D AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (80, N'admin888', N'123.163.186.230', CAST(0x0000A9760154FC2A AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (81, N'admin888', N'123.163.186.230', CAST(0x0000A97601553A85 AS DateTime), N'操作了：4充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (82, N'admin888', N'123.163.186.230', CAST(0x0000A97601554713 AS DateTime), N'操作了：4消费 金额：-500', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (83, N'admin888', N'123.163.186.230', CAST(0x0000A976015596D7 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (84, N'admin888', N'123.163.186.230', CAST(0x0000A9760155E2DB AS DateTime), N'操作了：5充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (85, N'admin888', N'123.163.186.230', CAST(0x0000A9760155ED75 AS DateTime), N'操作了：5消费 金额：-258', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (86, N'admin888', N'123.163.186.230', CAST(0x0000A97601566F73 AS DateTime), N'删除了：4', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (87, N'admin888', N'123.163.186.230', CAST(0x0000A97601567189 AS DateTime), N'删除了：5', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (88, N'admin', N'120.194.250.162', CAST(0x0000A977008D5379 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (89, N'admin', N'120.194.250.162', CAST(0x0000A97700B254F2 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (90, N'admin', N'::1', CAST(0x0000A97700B4B327 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (91, N'admin', N'::1', CAST(0x0000A97700B51211 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (92, N'admin', N'::1', CAST(0x0000A97700B81C88 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (93, N'admin', N'::1', CAST(0x0000A977014FC8CA AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (94, N'admin', N'::1', CAST(0x0000A9790094A7A9 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (95, N'admin', N'::1', CAST(0x0000A9790094D156 AS DateTime), N'修改了会员：6', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (96, N'admin', N'::1', CAST(0x0000A9790094EEDB AS DateTime), N'修改了会员：6', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (97, N'admin', N'::1', CAST(0x0000A9790094F7DC AS DateTime), N'修改了会员：6', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (98, N'admin', N'::1', CAST(0x0000A9790095AA91 AS DateTime), N'修改了会员：6', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (99, N'admin888', N'123.163.180.231', CAST(0x0000A979012360F3 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (100, N'admin888', N'123.163.180.231', CAST(0x0000A9790124B5EE AS DateTime), N'操作了：8充值 金额：484', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (101, N'admin888', N'123.163.180.231', CAST(0x0000A97901253C61 AS DateTime), N'删除了：9', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (102, N'admin888', N'123.163.180.231', CAST(0x0000A979012641D0 AS DateTime), N'操作了：14充值 金额：138', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (103, N'admin888', N'123.163.180.231', CAST(0x0000A9790126F69A AS DateTime), N'操作了：15充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (104, N'admin888', N'123.163.180.231', CAST(0x0000A9790127BF63 AS DateTime), N'操作了：15消费 金额：-395', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (105, N'admin888', N'123.163.180.231', CAST(0x0000A9790127F418 AS DateTime), N'操作了：16充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (106, N'admin888', N'123.163.180.231', CAST(0x0000A9790127F468 AS DateTime), N'操作了：16充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (107, N'admin888', N'123.163.180.231', CAST(0x0000A9790127FEA4 AS DateTime), N'操作了：16消费 金额：-1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (108, N'admin888', N'123.163.180.231', CAST(0x0000A97901280935 AS DateTime), N'操作了：16消费 金额：-805', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (109, N'admin888', N'123.163.180.231', CAST(0x0000A97901545A1B AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (110, N'admin888', N'123.163.180.231', CAST(0x0000A9790154E2C5 AS DateTime), N'操作了：18充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (111, N'admin888', N'123.163.180.231', CAST(0x0000A9790154F963 AS DateTime), N'操作了：18消费 金额：-747', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (112, N'admin', N'120.194.250.162', CAST(0x0000A97A0092AE86 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (113, N'admin', N'120.194.250.162', CAST(0x0000A97A00930B0A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (114, N'admin', N'120.194.250.162', CAST(0x0000A97A0097E6E7 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (115, N'admin', N'120.194.250.162', CAST(0x0000A97A00BAC776 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (116, N'admin', N'120.194.250.162', CAST(0x0000A97A00ED0A1F AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (117, N'admin', N'120.194.250.162', CAST(0x0000A97B0090DF42 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (118, N'admin', N'::1', CAST(0x0000A97B0094BCA0 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (119, N'admin', N'::1', CAST(0x0000A97B009629B7 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (120, N'admin', N'::1', CAST(0x0000A97B00968ABA AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (121, N'admin', N'120.194.250.162', CAST(0x0000A97B00F980C8 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (122, N'admin', N'120.194.250.162', CAST(0x0000A97C008A0349 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (123, N'admin', N'::1', CAST(0x0000A97C00A9D0BE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (124, N'admin', N'::1', CAST(0x0000A97C00AA13DB AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (125, N'admin', N'115.59.202.160', CAST(0x0000A97D00C36902 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (126, N'admin888', N'123.163.185.201', CAST(0x0000A97D013E8B50 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (127, N'admin888', N'123.55.162.230', CAST(0x0000A97D01831C9E AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (128, N'admin', N'120.194.250.162', CAST(0x0000A97E00FE0F6C AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (129, N'admin888', N'123.55.162.230', CAST(0x0000A97E011D3FE6 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (130, N'admin888', N'123.55.162.230', CAST(0x0000A97E011E729D AS DateTime), N'操作了：19充值 金额：500', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (131, N'admin888', N'123.55.162.230', CAST(0x0000A97E011E76A9 AS DateTime), N'操作了：19消费 金额：-320', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (132, N'admin888', N'123.55.162.230', CAST(0x0000A97E011E82CD AS DateTime), N'操作了：19消费 金额：-10', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (133, N'admin888', N'123.55.162.230', CAST(0x0000A97E01308C4C AS DateTime), N'修改了会员：19', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (134, N'admin888', N'123.55.162.230', CAST(0x0000A97F00C1FC9A AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (135, N'admin888', N'123.55.162.230', CAST(0x0000A97F00CCBB32 AS DateTime), N'操作了：20充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (136, N'admin888', N'123.55.162.230', CAST(0x0000A97F00CCC3F2 AS DateTime), N'操作了：20消费 金额：-573', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (137, N'admin888', N'123.55.162.230', CAST(0x0000A97F00D15A7A AS DateTime), N'修改了会员：20', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (138, N'admin888', N'123.55.162.230', CAST(0x0000A97F00D16C55 AS DateTime), N'修改了会员：19', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (139, N'admin888', N'123.55.162.230', CAST(0x0000A97F0104D3A6 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (140, N'admin888', N'123.55.162.230', CAST(0x0000A97F01053950 AS DateTime), N'操作了：21充值 金额：520', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (141, N'admin888', N'123.55.162.230', CAST(0x0000A97F01053DF1 AS DateTime), N'操作了：21消费 金额：-520', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (142, N'admin888', N'123.55.162.230', CAST(0x0000A97F0113AB2E AS DateTime), N'操作了：20充值 金额：110', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (143, N'admin888', N'123.55.162.230', CAST(0x0000A97F013E9637 AS DateTime), N'操作了：22充值 金额：1000', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (144, N'admin888', N'123.55.162.230', CAST(0x0000A97F013E9ADD AS DateTime), N'操作了：22消费 金额：-520', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (145, N'admin888', N'123.55.162.230', CAST(0x0000A9800103076A AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (146, N'admin', N'120.194.250.162', CAST(0x0000A981008C413C AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (147, N'admin888', N'171.12.136.15', CAST(0x0000A98100E5E265 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (148, N'admin888', N'171.12.136.15', CAST(0x0000A98100E6459C AS DateTime), N'操作了：23充值 金额：500', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (149, N'admin888', N'171.12.136.15', CAST(0x0000A98100E64C7F AS DateTime), N'操作了：23消费 金额：-275', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (150, N'admin', N'120.194.250.162', CAST(0x0000A98300955822 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (151, N'admin', N'120.194.250.162', CAST(0x0000A98300B860C3 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (152, N'admin', N'120.194.250.162', CAST(0x0000A98300F1A654 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (153, N'admin', N'120.194.250.162', CAST(0x0000A98301095CE7 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (154, N'admin', N'120.194.250.162', CAST(0x0000A98400B20DE8 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (155, N'admin', N'120.194.250.162', CAST(0x0000A985008BC282 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (156, N'admin888', N'123.163.181.143', CAST(0x0000A98601274064 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (157, N'admin888', N'123.163.181.143', CAST(0x0000A98601277554 AS DateTime), N'操作了：15消费 金额：-252', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (158, N'admin888', N'123.163.181.143', CAST(0x0000A9860127B237 AS DateTime), N'修改了会员：15', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (159, N'admin888', N'123.163.182.204', CAST(0x0000A98700FE7856 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (160, N'admin888', N'123.163.182.204', CAST(0x0000A98700FE851D AS DateTime), N'操作了：15消费 金额：-144', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (161, N'admin', N'115.59.199.181', CAST(0x0000A9870137C1F5 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (162, N'admin', N'120.194.250.162', CAST(0x0000A98800E23A17 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (163, N'admin888', N'123.163.182.204', CAST(0x0000A988018833A1 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (164, N'admin', N'120.194.250.162', CAST(0x0000A98900D31E78 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (165, N'admin888', N'123.163.182.204', CAST(0x0000A9890122C1C3 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (166, N'admin888', N'123.163.182.204', CAST(0x0000A98901230151 AS DateTime), N'操作了：25充值 金额：676', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (167, N'admin888', N'123.163.182.204', CAST(0x0000A989012308F9 AS DateTime), N'操作了：25消费 金额：-353', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (168, N'admin888', N'123.163.182.204', CAST(0x0000A98901289E0A AS DateTime), N'操作了：26充值 金额：310', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (169, N'admin888', N'123.163.182.204', CAST(0x0000A9890128E103 AS DateTime), N'修改了会员：27', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (170, N'admin888', N'123.163.182.204', CAST(0x0000A98901290BF4 AS DateTime), N'操作了：27充值 金额：1024', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (171, N'admin888', N'123.163.182.204', CAST(0x0000A9890129F339 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (172, N'admin888', N'123.163.182.204', CAST(0x0000A989012A15C3 AS DateTime), N'删除了会员：26', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (173, N'admin888', N'123.163.182.204', CAST(0x0000A989012ED450 AS DateTime), N'删除了会员：29', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (174, N'admin888', N'123.163.182.204', CAST(0x0000A989012F2693 AS DateTime), N'修改了会员：30', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (175, N'admin888', N'123.163.182.204', CAST(0x0000A989012F34F9 AS DateTime), N'操作了：28充值 金额：800', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (176, N'admin888', N'123.163.182.204', CAST(0x0000A989012F51E8 AS DateTime), N'修改了会员：28', NULL, 13)
GO
print 'Processed 100 total records'
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (177, N'admin888', N'123.163.182.204', CAST(0x0000A989012F5CCD AS DateTime), N'操作了：30充值 金额：310', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (178, N'admin888', N'123.163.182.204', CAST(0x0000A989012F7278 AS DateTime), N'修改了会员：30', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (179, N'admin888', N'123.163.182.204', CAST(0x0000A98901310C47 AS DateTime), N'删除了会员：30', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (180, N'admin888', N'123.163.182.204', CAST(0x0000A98901310EE3 AS DateTime), N'删除了会员：27', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (181, N'admin888', N'123.163.182.204', CAST(0x0000A98901315F1E AS DateTime), N'操作了：31充值 金额：310', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (182, N'admin888', N'123.163.182.204', CAST(0x0000A98901316AC4 AS DateTime), N'修改了会员：31', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (183, N'admin888', N'123.163.182.204', CAST(0x0000A9890131B236 AS DateTime), N'操作了：32充值 金额：1024', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (184, N'admin888', N'123.163.182.204', CAST(0x0000A9890131D231 AS DateTime), N'修改了会员：18', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (185, N'admin888', N'123.163.182.204', CAST(0x0000A9890131E1D7 AS DateTime), N'修改了会员：8', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (186, N'admin888', N'123.163.182.204', CAST(0x0000A9890131FE44 AS DateTime), N'修改了会员：23', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (187, N'admin888', N'123.163.182.204', CAST(0x0000A98901320968 AS DateTime), N'修改了会员：17', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (188, N'admin888', N'123.163.182.204', CAST(0x0000A98901321242 AS DateTime), N'修改了会员：24', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (189, N'admin888', N'123.163.182.204', CAST(0x0000A9890132235D AS DateTime), N'修改了会员：16', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (190, N'admin888', N'123.163.182.204', CAST(0x0000A98901323211 AS DateTime), N'修改了会员：16', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (191, N'admin888', N'123.163.182.204', CAST(0x0000A98901323777 AS DateTime), N'修改了会员：18', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (192, N'admin888', N'123.163.182.204', CAST(0x0000A98901323D69 AS DateTime), N'修改了会员：20', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (193, N'admin888', N'123.163.182.204', CAST(0x0000A9890132444B AS DateTime), N'修改了会员：17', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (194, N'admin888', N'123.163.182.204', CAST(0x0000A98901324B11 AS DateTime), N'修改了会员：28', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (195, N'admin888', N'123.163.182.204', CAST(0x0000A98901325240 AS DateTime), N'修改了会员：8', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (196, N'admin888', N'123.163.182.204', CAST(0x0000A98901325B47 AS DateTime), N'修改了会员：22', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (197, N'admin888', N'123.163.182.204', CAST(0x0000A98901326F05 AS DateTime), N'修改了会员：21', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (198, N'admin888', N'123.163.182.204', CAST(0x0000A989013278AB AS DateTime), N'修改了会员：23', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (199, N'admin888', N'123.163.182.204', CAST(0x0000A989013280FA AS DateTime), N'修改了会员：19', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (200, N'admin888', N'123.163.182.204', CAST(0x0000A9890132880F AS DateTime), N'修改了会员：24', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (201, N'admin888', N'123.163.182.204', CAST(0x0000A9890132D0A7 AS DateTime), N'修改了会员：25', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (202, N'admin888', N'123.163.182.204', CAST(0x0000A9890132DCD2 AS DateTime), N'修改了会员：31', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (203, N'admin888', N'123.163.182.204', CAST(0x0000A9890132E353 AS DateTime), N'修改了会员：32', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (204, N'admin888', N'123.163.182.204', CAST(0x0000A98901333F03 AS DateTime), N'修改了会员：6', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (205, N'admin888', N'123.163.182.204', CAST(0x0000A98901334927 AS DateTime), N'修改了会员：7', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (206, N'admin888', N'123.163.182.204', CAST(0x0000A9890133533B AS DateTime), N'修改了会员：10', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (207, N'admin888', N'123.163.182.204', CAST(0x0000A98901335D5D AS DateTime), N'修改了会员：11', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (208, N'admin888', N'123.163.182.204', CAST(0x0000A98901336611 AS DateTime), N'修改了会员：12', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (209, N'admin888', N'123.163.182.204', CAST(0x0000A98901336F6A AS DateTime), N'修改了会员：13', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (210, N'admin888', N'123.163.182.204', CAST(0x0000A9890133A345 AS DateTime), N'修改了会员：6', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (211, N'admin888', N'123.163.182.204', CAST(0x0000A9890133B481 AS DateTime), N'修改了会员：8', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (212, N'admin888', N'123.163.182.204', CAST(0x0000A9890133BFD2 AS DateTime), N'修改了会员：8', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (213, N'admin888', N'123.163.182.204', CAST(0x0000A9890133CF4D AS DateTime), N'修改了会员：10', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (214, N'admin888', N'123.163.182.204', CAST(0x0000A9890133DC5F AS DateTime), N'修改了会员：11', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (215, N'admin888', N'123.163.182.204', CAST(0x0000A9890133EA18 AS DateTime), N'修改了会员：12', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (216, N'admin888', N'123.163.182.204', CAST(0x0000A9890133F7B1 AS DateTime), N'修改了会员：13', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (217, N'admin888', N'123.163.182.204', CAST(0x0000A9890133FEDA AS DateTime), N'修改了会员：15', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (218, N'admin888', N'123.163.182.204', CAST(0x0000A98901340DA9 AS DateTime), N'修改了会员：16', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (219, N'admin888', N'123.163.182.204', CAST(0x0000A98901341666 AS DateTime), N'修改了会员：19', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (220, N'admin888', N'123.163.182.204', CAST(0x0000A98901342379 AS DateTime), N'修改了会员：17', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (221, N'admin888', N'123.55.163.128', CAST(0x0000A98A00BBAD82 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (222, N'admin888', N'123.55.163.128', CAST(0x0000A98A00BC3DD4 AS DateTime), N'操作了：19充值 金额：636', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (223, N'admin', N'120.194.250.162', CAST(0x0000A98B0085AADE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (224, N'admin', N'120.194.250.162', CAST(0x0000A98C0087639F AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (225, N'admin888', N'123.55.163.128', CAST(0x0000A98C0115830E AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (226, N'admin888', N'123.163.172.222', CAST(0x0000A98D011B5C17 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (227, N'admin888', N'123.163.172.222', CAST(0x0000A98D011C0744 AS DateTime), N'操作了：33充值 金额：924', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (228, N'admin888', N'123.163.172.222', CAST(0x0000A98D012CEFB7 AS DateTime), N'操作了：34充值 金额：710', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (229, N'admin888', N'123.163.172.222', CAST(0x0000A98E00D6B89D AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (230, N'admin888', N'123.163.172.222', CAST(0x0000A98E00DC5E50 AS DateTime), N'操作了：8消费 金额：-192', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (231, N'admin888', N'123.163.172.222', CAST(0x0000A98E01205A01 AS DateTime), N'操作了：35充值 金额：1155', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (232, N'admin888', N'123.163.172.222', CAST(0x0000A98E0120645B AS DateTime), N'操作了：35消费 金额：-105', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (233, N'admin', N'120.194.250.162', CAST(0x0000A99001134C48 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (234, N'admin888', N'123.55.161.184', CAST(0x0000A99300F87173 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (235, N'admin888', N'123.55.161.184', CAST(0x0000A99300F8A2B7 AS DateTime), N'操作了：32消费 金额：-850', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (236, N'admin888', N'123.55.161.184', CAST(0x0000A993010B969A AS DateTime), N'操作了：36充值 金额：800', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (237, N'admin888', N'123.55.161.184', CAST(0x0000A993010BD542 AS DateTime), N'操作了：36充值 金额：800', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (238, N'admin888', N'123.55.161.184', CAST(0x0000A993010C04F6 AS DateTime), N'操作了：36消费 金额：-800', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (239, N'admin888', N'123.55.161.184', CAST(0x0000A9930110506B AS DateTime), N'操作了：37充值 金额：630', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (240, N'admin888', N'123.55.161.184', CAST(0x0000A99301111607 AS DateTime), N'操作了：37消费 金额：-275', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (241, N'admin888', N'123.55.161.184', CAST(0x0000A99400B445F3 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (242, N'admin888', N'123.55.161.184', CAST(0x0000A99400B799C1 AS DateTime), N'操作了：33消费 金额：-356', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (243, N'admin888', N'123.55.161.184', CAST(0x0000A99500C47F9E AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (244, N'admin888', N'123.55.161.184', CAST(0x0000A99500C4DF74 AS DateTime), N'操作了：38充值 金额：2830', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (245, N'admin888', N'1.199.184.214', CAST(0x0000A9960116198E AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (246, N'admin888', N'1.199.184.214', CAST(0x0000A996011819A2 AS DateTime), N'操作了：37消费 金额：-170', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (247, N'admin888', N'1.199.184.214', CAST(0x0000A996012624E0 AS DateTime), N'操作了：39充值 金额：280', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (248, N'admin888', N'1.199.184.214', CAST(0x0000A9960157A509 AS DateTime), N'操作了：40充值 金额：800', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (249, N'admin888', N'1.199.184.214', CAST(0x0000A996015801AC AS DateTime), N'操作了：40消费 金额：-330', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (250, N'admin888', N'1.199.184.214', CAST(0x0000A99700F399C0 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (251, N'admin888', N'1.199.184.214', CAST(0x0000A99700F48568 AS DateTime), N'操作了：16消费 金额：-192', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (252, N'admin', N'120.194.250.162', CAST(0x0000A99800DFFF07 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (253, N'admin888', N'1.199.184.214', CAST(0x0000A99800E8B773 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (254, N'admin888', N'1.199.184.214', CAST(0x0000A99800E8FBE9 AS DateTime), N'操作了：25消费 金额：-283', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (255, N'admin', N'120.194.250.162', CAST(0x0000A999008AE4FD AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (256, N'admin888', N'123.163.174.3', CAST(0x0000A99A0103FEF0 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (257, N'admin888', N'123.163.174.3', CAST(0x0000A99A01041A80 AS DateTime), N'操作了：19消费 金额：-322', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (258, N'admin888', N'123.163.174.3', CAST(0x0000A99B0119630B AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (259, N'admin888', N'123.163.174.3', CAST(0x0000A99B011A2A6B AS DateTime), N'修改了会员：18', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (260, N'admin888', N'123.163.187.236', CAST(0x0000A99C00E0CD6B AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (261, N'admin888', N'123.163.187.236', CAST(0x0000A99C00E3792B AS DateTime), N'操作了：18消费 金额：-59', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (262, N'admin888', N'123.163.187.236', CAST(0x0000A99C00EE4A3B AS DateTime), N'操作了：35消费 金额：-59', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (263, N'admin888', N'123.163.187.236', CAST(0x0000A99C0109872C AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (264, N'admin888', N'123.163.187.236', CAST(0x0000A99C0109FD22 AS DateTime), N'修改了会员：28', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (265, N'admin888', N'123.163.187.236', CAST(0x0000A99C010A3931 AS DateTime), N'操作了：28消费 金额：-200', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (266, N'admin888', N'123.163.187.236', CAST(0x0000A99D00F5DDD3 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (267, N'admin', N'120.194.250.162', CAST(0x0000A99F009AFD8E AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (268, N'admin888', N'123.55.161.154', CAST(0x0000A99F00BE56EE AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (269, N'admin888', N'123.55.161.154', CAST(0x0000A99F00BE6B84 AS DateTime), N'操作了：38消费 金额：-170', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (270, N'admin888', N'123.55.161.154', CAST(0x0000A99F00F8EEAF AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (271, N'admin888', N'123.55.161.154', CAST(0x0000A99F00F92364 AS DateTime), N'操作了：36消费 金额：-59', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (272, N'admin888', N'123.55.161.154', CAST(0x0000A99F00F92C5A AS DateTime), N'操作了：36消费 金额：-10', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (273, N'admin888', N'123.55.161.154', CAST(0x0000A99F012FABE2 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (274, N'admin888', N'123.55.161.154', CAST(0x0000A99F0133C930 AS DateTime), N'修改了会员：43', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (275, N'admin888', N'123.55.161.154', CAST(0x0000A9A100D70420 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (276, N'admin888', N'123.163.183.204', CAST(0x0000A9A200C6AB5D AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (277, N'admin888', N'123.163.183.204', CAST(0x0000A9A300F51A8D AS DateTime), N'登入系统', NULL, 13)
GO
print 'Processed 200 total records'
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (278, N'admin888', N'123.163.183.204', CAST(0x0000A9A300FE6809 AS DateTime), N'操作了：43充值 金额：119', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (279, N'admin888', N'123.163.181.160', CAST(0x0000A9A700AB4FE4 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (280, N'admin888', N'106.42.48.150', CAST(0x0000A9A9011DE33B AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (281, N'admin888', N'106.42.48.150', CAST(0x0000A9A9011E1C04 AS DateTime), N'操作了：8消费 金额：-192', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (282, N'admin888', N'106.42.48.150', CAST(0x0000A9A901371E35 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (284, N'admin', N'::1', CAST(0x0000A9AF0102156B AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (285, N'admin', N'120.194.250.162', CAST(0x0000A9B200ED69AA AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (286, N'admin', N'120.194.250.162', CAST(0x0000A9B20107DE40 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (287, N'admin', N'120.194.250.162', CAST(0x0000A9B3011CC61A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (288, N'admin', N'::1', CAST(0x0000A9B301288A50 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (289, N'admin', N'120.194.250.162', CAST(0x0000A9B4008A16BE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (290, N'admin', N'120.194.250.162', CAST(0x0000A9B500BC7760 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (291, N'admin888', N'1.199.184.148', CAST(0x0000A9B500FCFD90 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (292, N'admin888', N'1.199.184.148', CAST(0x0000A9B500FD4004 AS DateTime), N'操作了：8充值 金额：52', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (293, N'admin', N'115.59.199.130', CAST(0x0000A9B7009C6A82 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (294, N'admin888', N'1.199.185.231', CAST(0x0000A9B701221576 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (295, N'admin888', N'1.199.185.231', CAST(0x0000A9B701222AE2 AS DateTime), N'操作了：8消费 金额：-60', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (296, N'admin888', N'1.199.185.231', CAST(0x0000A9B70122526A AS DateTime), N'操作了：8消费 金额：-10', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (297, N'admin888', N'1.199.185.231', CAST(0x0000A9B701225503 AS DateTime), N'操作了：8消费 金额：-10', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (298, N'admin888', N'1.199.185.231', CAST(0x0000A9B70122647E AS DateTime), N'操作了：8充值 金额：10', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (299, N'admin', N'::1', CAST(0x0000A9BE01435BF9 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (300, N'admin', N'::1', CAST(0x0000A9BE014A89F0 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (301, N'admin', N'115.48.215.65', CAST(0x0000A9BF011E915A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (302, N'admin888', N'123.163.181.227', CAST(0x0000A9C100F91B02 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (303, N'admin888', N'123.163.181.227', CAST(0x0000A9C100F96403 AS DateTime), N'操作了：45充值 金额：120', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (304, N'admin888', N'123.163.181.227', CAST(0x0000A9C10111CF6D AS DateTime), N'操作了：32消费 金额：-174', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (305, N'admin', N'115.48.211.196', CAST(0x0000A9C2015F0E1C AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (306, N'admin', N'36.63.247.228', CAST(0x0000A9C400C76754 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (307, N'admin', N'120.194.250.162', CAST(0x0000A9C400CD2CC7 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (308, N'admin888', N'123.163.186.204', CAST(0x0000A9C4013161BB AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (309, N'admin888', N'123.163.186.204', CAST(0x0000A9C40132C495 AS DateTime), N'操作了：33消费 金额：-568', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (310, N'admin', N'115.48.215.141', CAST(0x0000A9C401512DA7 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (311, N'admin', N'120.194.250.162', CAST(0x0000A9C500BDEA57 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (312, N'admin888', N'123.163.186.204', CAST(0x0000A9C600E3DA5B AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (313, N'admin888', N'123.163.186.204', CAST(0x0000A9C600E4ABC3 AS DateTime), N'操作了：35消费 金额：-66', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (314, N'admin', N'115.48.214.211', CAST(0x0000A9C801280567 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (315, N'admin', N'115.59.192.160', CAST(0x0000A9CB0152C699 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (316, N'admin', N'120.194.250.162', CAST(0x0000A9CE00C0D90C AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (317, N'admin', N'120.194.250.162', CAST(0x0000A9CE0107B274 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (318, N'admin888', N'123.163.180.206', CAST(0x0000A9CF010A7684 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (319, N'admin888', N'123.163.180.206', CAST(0x0000A9CF010AA519 AS DateTime), N'操作了：31消费 金额：-310', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (320, N'admin888', N'123.163.174.119', CAST(0x0000A9D3012AF96D AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (321, N'admin888', N'123.163.174.119', CAST(0x0000A9D30138B328 AS DateTime), N'操作了：34消费 金额：-458', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (322, N'admin888', N'123.163.174.119', CAST(0x0000A9D30163649A AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (323, N'admin', N'115.48.214.20', CAST(0x0000A9E800FEB8D6 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (324, N'admin', N'115.48.214.20', CAST(0x0000A9E800FEE23A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (325, N'admin', N'115.48.214.20', CAST(0x0000A9E8010220C3 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (326, N'admin', N'36.63.187.193', CAST(0x0000A9F400C7C920 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (327, N'admin', N'120.194.250.162', CAST(0x0000A9F9008550D6 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (328, N'admin888', N'171.14.9.95', CAST(0x0000AA0801091697 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (329, N'admin', N'::1', CAST(0x0000AA0D01774144 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (330, N'admin', N'::1', CAST(0x0000AA0D018144D5 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (331, N'admin', N'::1', CAST(0x0000AA0D018216F8 AS DateTime), N'修改了信息：1', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (332, N'admin', N'::1', CAST(0x0000AA0D01821E1D AS DateTime), N'删除了信息：1', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (333, N'admin', N'::1', CAST(0x0000AA0D0182F996 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (334, N'admin', N'::1', CAST(0x0000AA0D01857088 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (335, N'admin', N'::1', CAST(0x0000AA0D0185C2E6 AS DateTime), N'修改了信息：2', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (336, N'admin', N'115.48.211.202', CAST(0x0000AA0E00F964FB AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (337, N'admin', N'115.48.211.202', CAST(0x0000AA0E00F9840A AS DateTime), N'修改了信息：2', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (338, N'admin', N'115.48.211.202', CAST(0x0000AA0E00F98FFF AS DateTime), N'修改了信息：2', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (339, N'admin', N'182.114.97.210', CAST(0x0000AA0E00F9FD0A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (340, N'admin', N'115.48.211.202', CAST(0x0000AA0E00FB05EE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (341, N'admin', N'115.48.211.202', CAST(0x0000AA0E00FE7645 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (342, N'admin', N'182.114.97.210', CAST(0x0000AA0E00FE8E0C AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (343, N'admin', N'115.48.211.202', CAST(0x0000AA0E00FF1F49 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (344, N'admin', N'182.114.97.210', CAST(0x0000AA0E00FF2E4E AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (345, N'admin888', N'115.48.211.202', CAST(0x0000AA0E00FF5143 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (346, N'admin', N'115.48.211.202', CAST(0x0000AA0E0101E975 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (347, N'admin', N'123.151.77.48', CAST(0x0000AA0E01372FBD AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (348, N'admin', N'117.136.107.214', CAST(0x0000AA0E01373024 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (349, N'admin', N'120.194.250.162', CAST(0x0000AA0F00E20CB6 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (350, N'admin', N'120.194.250.162', CAST(0x0000AA0F00E22F1B AS DateTime), N'修改了信息：2', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (351, N'admin', N'120.194.250.162', CAST(0x0000AA0F00E23FB8 AS DateTime), N'修改了信息：2', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (352, N'admin', N'182.114.96.8', CAST(0x0000AA10009BCC06 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (353, N'admin', N'182.114.96.8', CAST(0x0000AA10009C4290 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (354, N'admin', N'120.194.250.162', CAST(0x0000AA1100B29A08 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (355, N'admin', N'42.228.67.211', CAST(0x0000AA1400C55024 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (356, N'admin', N'42.228.67.211', CAST(0x0000AA1400C5C331 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (357, N'admin', N'123.55.170.192', CAST(0x0000AA1500B4BB0F AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (358, N'admin', N'123.55.170.192', CAST(0x0000AA1500B5F48C AS DateTime), N'修改了信息：2', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (359, N'admin', N'123.55.170.192', CAST(0x0000AA1500B86534 AS DateTime), N'修改了信息：4', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (360, N'admin', N'42.228.65.19', CAST(0x0000AA180096BB4A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (361, N'admin', N'::1', CAST(0x0000AA1901081ADE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (362, N'admin', N'::1', CAST(0x0000AA190109DB36 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (363, N'admin', N'::1', CAST(0x0000AA1A00D92993 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (364, N'admin', N'::1', CAST(0x0000AA1A00DE2FAB AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (365, N'admin', N'::1', CAST(0x0000AA1A00DECFEE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (366, N'admin', N'::1', CAST(0x0000AA1A00E23E9D AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (367, N'admin', N'::1', CAST(0x0000AA1A00EACFEE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (368, N'admin', N'::1', CAST(0x0000AA1A00EB1526 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (369, N'admin', N'::1', CAST(0x0000AA1A00EC715B AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (370, N'admin', N'::1', CAST(0x0000AA1B00D1883C AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (371, N'admin', N'::1', CAST(0x0000AA1B00D482F5 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (372, N'admin', N'::1', CAST(0x0000AA1B00DDF747 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (373, N'admin', N'::1', CAST(0x0000AA1B00DF82A6 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (374, N'admin', N'::1', CAST(0x0000AA1B00E00A90 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (375, N'admin', N'::1', CAST(0x0000AA1B00E215BC AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (376, N'admin', N'::1', CAST(0x0000AA1B00E3AB12 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (377, N'admin', N'::1', CAST(0x0000AA1B00F5EAA4 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (378, N'admin', N'::1', CAST(0x0000AA1B012D01C1 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (379, N'admin', N'::1', CAST(0x0000AA1B012EC04B AS DateTime), N'登入系统', NULL, 12)
GO
print 'Processed 300 total records'
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (380, N'admin', N'::1', CAST(0x0000AA1B0139FCC4 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (381, N'admin', N'::1', CAST(0x0000AA1B0148F875 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (382, N'admin', N'::1', CAST(0x0000AA1B0150ACFA AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (383, N'admin', N'115.59.203.88', CAST(0x0000AA1B0158082D AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (384, N'admin888', N'115.59.203.88', CAST(0x0000AA1B01584396 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (385, N'admin888', N'36.63.221.170', CAST(0x0000AA1C009DD8FC AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (386, N'admin', N'120.194.250.162', CAST(0x0000AA1C00A82D0A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (387, N'admin888', N'183.160.212.188', CAST(0x0000AA1C00B46F5C AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (388, N'admin', N'120.194.250.162', CAST(0x0000AA1C00DB8E55 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (389, N'admin888', N'36.33.4.19', CAST(0x0000AA1C015D4618 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (390, N'admin888', N'60.167.77.116', CAST(0x0000AA1C0162D770 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (391, N'admin', N'115.48.208.232', CAST(0x0000AA1C01750095 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (392, N'admin888', N'36.63.221.170', CAST(0x0000AA1D009F6CC8 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (393, N'admin', N'120.194.250.162', CAST(0x0000AA1D00B6180A AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (394, N'admin', N'45.195.93.220', CAST(0x0000AA1D00C97D13 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (395, N'admin', N'120.194.250.162', CAST(0x0000AA1D00D494C3 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (396, N'admin888', N'36.63.221.170', CAST(0x0000AA1D00D9D6B4 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (397, N'admin888', N'36.63.221.170', CAST(0x0000AA1D00DBA2FA AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (398, N'admin', N'123.55.185.231', CAST(0x0000AA2501095A66 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (399, N'admin', N'115.48.211.45', CAST(0x0000AA26007A06AB AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (400, N'admin888', N'115.48.211.45', CAST(0x0000AA26007B0E2F AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (401, N'admin', N'123.55.184.25', CAST(0x0000AA2701435AF3 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (402, N'admin', N'123.55.184.25', CAST(0x0000AA270143A1A4 AS DateTime), N'操作了：28消费 金额：-570', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (403, N'admin', N'123.55.184.25', CAST(0x0000AA270143C9AB AS DateTime), N'操作了：36消费 金额：-280', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (404, N'admin', N'123.55.184.25', CAST(0x0000AA27014458C4 AS DateTime), N'操作了：45消费 金额：-120', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (405, N'admin', N'123.55.184.25', CAST(0x0000AA2701455BBF AS DateTime), N'操作了：19消费 金额：-290', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (406, N'admin888', N'115.48.210.34', CAST(0x0000AA2701576012 AS DateTime), N'登入系统', NULL, 13)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (407, N'admin', N'123.55.184.25', CAST(0x0000AA2800F1A8EE AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (408, N'admin', N'123.55.184.25', CAST(0x0000AA2800F1B477 AS DateTime), N'操作了：19消费 金额：-150', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (409, N'admin', N'171.14.9.134', CAST(0x0000AA400107DB69 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (410, N'admin', N'171.14.9.134', CAST(0x0000AA400107F162 AS DateTime), N'操作了：35消费 金额：-79', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (411, N'admin', N'171.14.8.175', CAST(0x0000AA570124B3E2 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (412, N'admin', N'171.14.8.175', CAST(0x0000AA570124EF95 AS DateTime), N'操作了：39消费 金额：-200', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (413, N'admin', N'123.55.184.44', CAST(0x0000AA7400E69592 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (414, N'admin', N'123.55.184.44', CAST(0x0000AA7400E6B16C AS DateTime), N'操作了：14消费 金额：-138', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (415, N'admin', N'171.14.8.217', CAST(0x0000AA7801281232 AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (416, N'admin', N'171.14.8.217', CAST(0x0000AA78012E9945 AS DateTime), N'操作了：20消费 金额：260', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (417, N'admin', N'171.14.8.217', CAST(0x0000AA78012EB0D3 AS DateTime), N'操作了：20消费 金额：-260', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (418, N'admin', N'171.14.8.217', CAST(0x0000AA78012EBB0B AS DateTime), N'操作了：20消费 金额：-260', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (419, N'admin', N'171.14.9.13', CAST(0x0000AA830145980D AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (420, N'admin', N'171.14.9.13', CAST(0x0000AA8301472303 AS DateTime), N'操作了：23消费 金额：-214', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (421, N'admin', N'171.14.9.13', CAST(0x0000AA8301479549 AS DateTime), N'操作了：23消费 金额：-11', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (422, N'admin', N'::1', CAST(0x0000AA9B00B384DA AS DateTime), N'登入系统', NULL, 12)
INSERT [dbo].[tSysLog] ([Id], [UserName], [IP], [SysTime], [DoWhat], [Remark], [UserId]) VALUES (423, N'admin', N'::1', CAST(0x0000AA9B00BAC22E AS DateTime), N'登入系统', NULL, 12)
SET IDENTITY_INSERT [dbo].[tSysLog] OFF
/****** Object:  Table [dbo].[tSet]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebName] [nvarchar](150) NULL,
	[Copyright] [nvarchar](150) NULL,
	[KeyWords] [nvarchar](150) NULL,
	[Description] [nvarchar](550) NULL,
	[Tel] [nvarchar](150) NULL,
	[Email] [nvarchar](350) NULL,
	[Address] [nvarchar](350) NULL,
	[BeiAn] [nvarchar](350) NULL,
	[Remark] [nvarchar](350) NULL,
 CONSTRAINT [PK_tSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tSet] ON
INSERT [dbo].[tSet] ([Id], [WebName], [Copyright], [KeyWords], [Description], [Tel], [Email], [Address], [BeiAn], [Remark]) VALUES (1, N'系统', N'', N'', N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[tSet] OFF
/****** Object:  Table [dbo].[tRoleMenu]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRoleMenu](
	[rCode] [int] NOT NULL,
	[mCode] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 11)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 14)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 15)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 16)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 17)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 20)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 50)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 51)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 52)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 56)
INSERT [dbo].[tRoleMenu] ([rCode], [mCode]) VALUES (10, 57)
/****** Object:  Table [dbo].[tRole]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tRole](
	[rCode] [int] IDENTITY(10,1) NOT NULL,
	[rName] [varchar](50) NOT NULL,
	[rRemark] [varchar](100) NULL,
 CONSTRAINT [PK_tRole] PRIMARY KEY CLUSTERED 
(
	[rCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tRole] ON
INSERT [dbo].[tRole] ([rCode], [rName], [rRemark]) VALUES (10, N'超级管理员', N'拥有所有权限')
SET IDENTITY_INSERT [dbo].[tRole] OFF
/****** Object:  Table [dbo].[tPictureType]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPictureType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Sort] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[FatherId] [int] NULL,
 CONSTRAINT [PK_picture_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tPictureType] ON
INSERT [dbo].[tPictureType] ([id], [Name], [Sort], [Remark], [FatherId]) VALUES (2, N'幻灯片', 0, N'', 0)
SET IDENTITY_INSERT [dbo].[tPictureType] OFF
/****** Object:  Table [dbo].[tDepartMent]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDepartMent](
	[dptId] [int] IDENTITY(10000,1) NOT NULL,
	[dptName] [nvarchar](50) NULL,
	[dptRemark] [nvarchar](max) NULL,
	[dptFatherId] [int] NULL,
	[dptType] [int] NULL,
 CONSTRAINT [PK_tDepartMent] PRIMARY KEY CLUSTERED 
(
	[dptId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tDepartMent] ON
INSERT [dbo].[tDepartMent] ([dptId], [dptName], [dptRemark], [dptFatherId], [dptType]) VALUES (10000, N'大禹地产', N'系统默认', NULL, NULL)
INSERT [dbo].[tDepartMent] ([dptId], [dptName], [dptRemark], [dptFatherId], [dptType]) VALUES (10001, N'管理部', N'', 10000, 0)
SET IDENTITY_INSERT [dbo].[tDepartMent] OFF
/****** Object:  Table [dbo].[tArticleType]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tArticleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Sort] [int] NULL,
	[FatherID] [int] NULL,
	[IsEnable] [int] NULL,
 CONSTRAINT [PK_article_type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tArticleType] ON
INSERT [dbo].[tArticleType] ([Id], [Name], [Sort], [FatherID], [IsEnable]) VALUES (3, N'公司新闻', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[tArticleType] OFF
/****** Object:  Table [dbo].[tMenu]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tMenu](
	[mCode] [int] IDENTITY(10,1) NOT NULL,
	[mName] [varchar](50) NULL,
	[mUrl] [varchar](250) NULL,
	[mSort] [int] NULL,
	[mFaherId] [int] NULL,
	[mIcon] [varchar](50) NULL,
	[mRemark] [varchar](50) NULL,
 CONSTRAINT [PK_tMenu] PRIMARY KEY CLUSTERED 
(
	[mCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tMenu] ON
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (11, N'系统设置', N'#', 1, NULL, N'DatabaseConnect', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (14, N'部门管理', N'../Admin/DptMent/DptMentList.aspx', 0, 11, N'DoorOpen', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (15, N'角色管理', N'../Admin/Role/RoleList.aspx', 0, 11, N'User', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (16, N'菜单管理', N'../Admin/Menu/MenuList.aspx', 0, 11, N'BookLink', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (17, N'用户管理', N'../Admin/Users/UserList.aspx', 0, 11, N'UserEdit', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (20, N'系统信息', N'../Admin/Web/WebMsg.aspx', 0, 11, N'Information', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (50, N'单页管理', N'#', 0, NULL, N'Page', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (51, N'单页信息', N'../Admin/SinglePage/SingleList.aspx', 0, 50, N'PageAdd', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (52, N'公司简介', N'../Admin/SinglePage/SingleMsg.aspx?Id=2', 0, 50, N'BookmarkEdit', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (56, N'文章模块', N'#', 0, NULL, N'Book', N'')
INSERT [dbo].[tMenu] ([mCode], [mName], [mUrl], [mSort], [mFaherId], [mIcon], [mRemark]) VALUES (57, N'文章管理', N'../Admin/Articles/ArticlesList.aspx', 0, 56, N'BookmarkAdd', N'')
SET IDENTITY_INSERT [dbo].[tMenu] OFF
/****** Object:  Table [dbo].[tLinkType]    Script Date: 07/31/2019 11:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLinkType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Sort] [int] NULL,
	[FatherID] [int] NULL,
 CONSTRAINT [PK_link_type] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[t_Index_view]    Script Date: 07/31/2019 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[t_Index_view]
AS
SELECT     a.Id, a.Name, a.FatherId, a.SubDptId, a.ApproveDptId, a.Scale, a.Score, a.IsUse, a.SubType, b.dptName AS SubDptName, c.dptName AS ApproveDptName
FROM         dbo.t_Index AS a LEFT OUTER JOIN
                      dbo.tDepartMent AS b ON a.SubDptId = b.dptId LEFT OUTER JOIN
                      dbo.tDepartMent AS c ON a.ApproveDptId = c.dptId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 224
               Bottom = 114
               Right = 362
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 400
               Bottom = 114
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N't_Index_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N't_Index_view'
GO
/****** Object:  Trigger [For_DeleteRole]    Script Date: 07/31/2019 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER   [dbo].[For_DeleteRole]
   ON    [dbo].[tRole] 
   FOR DELETE
AS 
BEGIN
 
delete  from  dbo.tRoleMenu where rCode =(select rCode from deleted)
 
delete  from dbo.tUsers where roleCode=(select rCode from deleted)

 
End
GO
/****** Object:  Trigger [For_DeletePicType]    Script Date: 07/31/2019 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER   [dbo].[For_DeletePicType]
   ON   [dbo].[tPictureType]
   FOR DELETE
AS 
BEGIN
 
delete  from  dbo.tPicture  where  PicTyID =(select Id from deleted)
  
End
GO
/****** Object:  Trigger [For_DeleteMenu]    Script Date: 07/31/2019 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER   [dbo].[For_DeleteMenu]
   ON   [dbo].[tMenu] 
   FOR DELETE
AS 
BEGIN
 
delete  from  dbo.tRoleMenu where mCode =(select mCode from deleted)
  
End
GO
/****** Object:  Trigger [For_DeleteLinkType]    Script Date: 07/31/2019 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER   [dbo].[For_DeleteLinkType]
   ON  [dbo].[tLinkType]
   FOR DELETE
AS 
BEGIN
 
delete  from   dbo.tLink  where  TyID =(select Id from deleted)
  
End
GO
/****** Object:  Trigger [For_DeleteDpt]    Script Date: 07/31/2019 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER   [dbo].[For_DeleteDpt]
   ON  [dbo].[tDepartMent] 
   FOR DELETE
AS 
BEGIN
 
 
delete  from dbo.tUsers where dptId =(select dptId from deleted)
  
 
End
GO
/****** Object:  Trigger [For_DeleteArtType]    Script Date: 07/31/2019 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER   [dbo].[For_DeleteArtType]
   ON   [dbo].[tArticleType] 
   FOR DELETE
AS 
BEGIN
 
delete  from  dbo.tArticle  where ArtTyID =(select Id from deleted)
  
End
GO
/****** Object:  Default [DF__article__clicks__09DE7BCC]    Script Date: 07/31/2019 11:51:04 ******/
ALTER TABLE [dbo].[tArticle] ADD  CONSTRAINT [DF__article__clicks__09DE7BCC]  DEFAULT ((0)) FOR [Click]
GO
