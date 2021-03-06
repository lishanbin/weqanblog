USE [master]
GO
/****** Object:  Database [blogcore]    Script Date: 2019/2/19 10:57:06 ******/
CREATE DATABASE [blogcore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blogcore', FILENAME = N'C:\Users\李善斌\Desktop\blog\Weqan.Blog\数据库\blogcore.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'blogcore_log', FILENAME = N'C:\Users\李善斌\Desktop\blog\Weqan.Blog\数据库\blogcore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [blogcore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blogcore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blogcore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blogcore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blogcore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blogcore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blogcore] SET ARITHABORT OFF 
GO
ALTER DATABASE [blogcore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [blogcore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [blogcore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blogcore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blogcore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blogcore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blogcore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blogcore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blogcore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blogcore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blogcore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [blogcore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blogcore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blogcore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blogcore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blogcore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blogcore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [blogcore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blogcore] SET RECOVERY FULL 
GO
ALTER DATABASE [blogcore] SET  MULTI_USER 
GO
ALTER DATABASE [blogcore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blogcore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blogcore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blogcore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [blogcore]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2019/2/19 10:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [nvarchar](64) NULL,
	[Password] [nvarchar](64) NULL,
	[Remark] [nvarchar](2048) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2019/2/19 10:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Title] [nvarchar](256) NULL,
	[Body] [ntext] NULL,
	[Body_md] [ntext] NULL,
	[VisitNum] [int] NOT NULL,
	[CaBh] [nvarchar](64) NULL,
	[CaName] [nvarchar](64) NULL,
	[Remark] [nvarchar](2048) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2019/2/19 10:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CaName] [nvarchar](64) NULL,
	[Bh] [nvarchar](64) NULL,
	[Pbh] [nvarchar](64) NULL,
	[Remark] [nvarchar](2048) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [CreateDate], [UserName], [Password], [Remark]) VALUES (1, CAST(0x0000A9F1008CD9DF AS DateTime), N'admin', N'21232F297A57A5A743894A0E4A801FC3', NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (6, CAST(0x0000A9F10100E270 AS DateTime), N'新闻标题0', N'新闻标题0的内容', NULL, 137, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (7, CAST(0x0000A9F10100E271 AS DateTime), N'新闻标题1', N'新闻标题1的内容', NULL, 335, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (8, CAST(0x0000A9D20100E271 AS DateTime), N'新闻标题2', N'新闻标题2的内容', NULL, 301, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (9, CAST(0x0000A9F10100E271 AS DateTime), N'新闻标题3', N'新闻标题3的内容', NULL, 672, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (10, CAST(0x0000A8840100E272 AS DateTime), N'新闻标题4', N'新闻标题4的内容', NULL, 404, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (11, CAST(0x0000A8A00100E272 AS DateTime), N'新闻标题5', N'新闻标题5的内容', NULL, 654, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (12, CAST(0x0000A8A00100E272 AS DateTime), N'新闻标题6', N'新闻标题6的内容', NULL, 863, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (13, CAST(0x0000A8840100E272 AS DateTime), N'新闻标题7', N'新闻标题7的内容', NULL, 640, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (14, CAST(0x0000A9F10100E272 AS DateTime), N'新闻标题8', N'新闻标题8的内容', NULL, 436, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (15, CAST(0x0000A9F10100E272 AS DateTime), N'新闻标题9', N'新闻标题9的内容', NULL, 849, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (16, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题10', N'新闻标题10的内容', NULL, 967, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (17, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题11', N'新闻标题11的内容', NULL, 358, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (18, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题12', N'新闻标题12的内容', NULL, 193, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (19, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题13', N'新闻标题13的内容', NULL, 189, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (20, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题14', N'新闻标题14的内容', NULL, 268, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (21, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题15', N'新闻标题15的内容', NULL, 468, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (22, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题16', N'新闻标题16的内容', NULL, 680, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (23, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题17', N'新闻标题17的内容', NULL, 200, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (24, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题18', N'新闻标题18的内容', NULL, 798, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (25, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题19', N'新闻标题19的内容', NULL, 652, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (26, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题20', N'新闻标题20的内容', NULL, 920, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (27, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题21', N'新闻标题21的内容', NULL, 330, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (28, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题22', N'新闻标题22的内容', NULL, 969, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (29, CAST(0x0000A9F10100E273 AS DateTime), N'新闻标题23', N'新闻标题23的内容', NULL, 898, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (30, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题24', N'新闻标题24的内容', NULL, 292, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (31, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题25', N'新闻标题25的内容', NULL, 871, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (32, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题26', N'新闻标题26的内容', NULL, 152, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (33, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题27', N'新闻标题27的内容', NULL, 485, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (34, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题28', N'新闻标题28的内容', NULL, 620, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (35, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题29', N'新闻标题29的内容', NULL, 618, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (36, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题30', N'新闻标题30的内容', NULL, 851, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (37, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题31', N'新闻标题31的内容', NULL, 361, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (38, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题32', N'新闻标题32的内容', NULL, 395, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (39, CAST(0x0000A9F10100E274 AS DateTime), N'新闻标题33', N'新闻标题33的内容', NULL, 729, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (40, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题34', N'新闻标题34的内容', NULL, 723, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (41, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题35', N'新闻标题35的内容', NULL, 524, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (42, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题36', N'新闻标题36的内容', NULL, 868, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (43, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题37', N'新闻标题37的内容', NULL, 757, N'01', N'ASP.NET', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (44, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题38', N'新闻标题38的内容', NULL, 944, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (45, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题39', N'新闻标题39的内容', NULL, 547, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (46, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题40', N'新闻标题40的内容', NULL, 963, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (47, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题41', N'新闻标题41的内容', NULL, 539, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (48, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题42', N'新闻标题42的内容', NULL, 759, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (49, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题43', N'新闻标题43的内容', NULL, 928, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (50, CAST(0x0000A9F10100E275 AS DateTime), N'新闻标题44', N'新闻标题44的内容', NULL, 987, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (51, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题45', N'新闻标题45的内容', NULL, 423, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (52, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题46', N'新闻标题46的内容', NULL, 264, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (53, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题47', N'新闻标题47的内容', NULL, 959, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (54, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题48', N'新闻标题48的内容', NULL, 968, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (55, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题49', N'新闻标题49的内容', NULL, 228, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (56, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题50', N'新闻标题50的内容', NULL, 191, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (57, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题51', N'新闻标题51的内容', NULL, 566, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (58, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题52', N'新闻标题52的内容', NULL, 197, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (59, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题53', N'新闻标题53的内容', NULL, 601, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (60, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题54', N'新闻标题54的内容', NULL, 533, N'01', N'ASP.NET', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (61, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题55', N'新闻标题55的内容', NULL, 914, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (62, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题56', N'新闻标题56的内容', NULL, 368, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (63, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题57', N'新闻标题57的内容', NULL, 471, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (64, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题58', N'新闻标题58的内容', NULL, 500, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (65, CAST(0x0000A9F10100E276 AS DateTime), N'新闻标题59', N'新闻标题59的内容', NULL, 113, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (66, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题60', N'新闻标题60的内容', NULL, 742, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (67, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题61', N'新闻标题61的内容', NULL, 500, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (68, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题62', N'新闻标题62的内容', NULL, 371, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (69, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题63', N'新闻标题63的内容', NULL, 488, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (70, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题64', N'新闻标题64的内容', NULL, 176, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (71, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题65', N'新闻标题65的内容', NULL, 766, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (72, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题66', N'新闻标题66的内容', NULL, 704, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (73, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题67', N'新闻标题67的内容', NULL, 280, N'01', N'ASP.NET', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (74, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题68', N'新闻标题68的内容', NULL, 431, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (75, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题69', N'新闻标题69的内容', NULL, 549, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (76, CAST(0x0000A9F10100E277 AS DateTime), N'新闻标题70', N'新闻标题70的内容', NULL, 496, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (77, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题71', N'新闻标题71的内容', NULL, 954, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (78, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题72', N'新闻标题72的内容', NULL, 424, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (79, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题73', N'新闻标题73的内容', NULL, 712, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (80, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题74', N'新闻标题74的内容', NULL, 842, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (81, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题75', N'新闻标题75的内容', NULL, 579, N'01', N'ASP.NET', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (82, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题76', N'新闻标题76的内容', NULL, 544, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (83, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题77', N'新闻标题77的内容', NULL, 654, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (84, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题78', N'新闻标题78的内容', NULL, 109, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (85, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题79', N'新闻标题79的内容', NULL, 324, N'01', N'ASP.NET', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (86, CAST(0x0000A9F10100E278 AS DateTime), N'新闻标题80', N'新闻标题80的内容', NULL, 828, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (87, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题81', N'新闻标题81的内容', NULL, 938, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (88, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题82', N'新闻标题82的内容', NULL, 980, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (89, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题83', N'新闻标题83的内容', NULL, 182, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (90, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题84', N'新闻标题84的内容', NULL, 166, N'01', N'ASP.NET', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (91, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题85', N'新闻标题85的内容', NULL, 622, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (92, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题86', N'新闻标题86的内容', NULL, 263, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (93, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题87', N'新闻标题87的内容', NULL, 899, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (94, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题88', N'新闻标题88的内容', NULL, 385, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (95, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题89', N'新闻标题89的内容', NULL, 159, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (96, CAST(0x0000A9F10100E279 AS DateTime), N'新闻标题90', N'新闻标题90的内容', NULL, 828, N'05', N'IOS', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (97, CAST(0x0000A9F10100E27A AS DateTime), N'新闻标题91', N'新闻标题91的内容', NULL, 808, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (98, CAST(0x0000A9F10100E27A AS DateTime), N'新闻标题92', N'新闻标题92的内容', NULL, 297, N'01', N'ASP.NET', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (99, CAST(0x0000A9F10100E27A AS DateTime), N'新闻标题93', N'新闻标题93的内容', NULL, 941, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (100, CAST(0x0000A9F10100E27A AS DateTime), N'新闻标题94', N'新闻标题94的内容', NULL, 593, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (101, CAST(0x0000A9F10100E27A AS DateTime), N'新闻标题95', N'新闻标题95的内容', NULL, 544, N'03', N'Android', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (102, CAST(0x0000A9F10100E27B AS DateTime), N'新闻标题96', N'新闻标题96的内容', NULL, 717, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (103, CAST(0x0000A9F10100E27B AS DateTime), N'新闻标题97', N'新闻标题97的内容', NULL, 711, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (104, CAST(0x0000A9F10100E27B AS DateTime), N'新闻标题98', N'新闻标题98的内容', NULL, 973, N'03', N'Android', NULL, 0)
GO
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (105, CAST(0x0000A9F10100E27B AS DateTime), N'新闻标题99', N'新闻标题99的内容', NULL, 358, N'02', N'PHP', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (106, CAST(0x0000A9F10100E27B AS DateTime), N'新闻标题100', N'新闻标题100的内容', NULL, 553, N'06', N'随笔', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (107, CAST(0x0000A9F10100E27B AS DateTime), N'新闻标题101', N'新闻标题101的内容', NULL, 849, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (109, CAST(0x0000A9F200B19B22 AS DateTime), N'6666666666', N'<p>wwwwwwwwwwwwwwwwwwwww</p><p><br></p><p><img src="/upload/20190212/533ade.png" alt="C:\Users\李善斌\Desktop\blog\Weqan.Blog\Weqan.Blog.Web\wwwroot\upload\20190212\533ade.png"><br></p><p><br></p><p><img src="/upload/20190212/a982e8.png" alt="C:\Users\李善斌\Desktop\blog\Weqan.Blog\Weqan.Blog.Web\wwwroot\upload\20190212\a982e8.png"><br></p>', NULL, 0, N'04', N'JAVA', NULL, 0)
INSERT [dbo].[Blog] ([Id], [CreateDate], [Title], [Body], [Body_md], [VisitNum], [CaBh], [CaName], [Remark], [Sort]) VALUES (110, CAST(0x0000A9F200EC0123 AS DateTime), N'富文本编辑器', N'<p><a target="_self" href="http://weqan.cn">富文本编辑器</a>富<b>文本编辑器富文本编辑器富文本编辑器富文本编辑器富文本编</b>辑器富文本编辑器富文本编辑器富文本编辑器富文本编辑器富文本编辑器富文本编辑器富文本编辑器富文本编辑器富文<i>本编辑器富文本编辑器富文本编辑</i>器富<u>文本编辑器富文本编</u>辑器富文本编辑器富文本编辑器富文本编辑器测试</p><p><br></p><p><img src="https://localhost:44308/layui/images/face/27.gif" alt="[疑问]">&nbsp; &nbsp;&nbsp;<img src="https://localhost:44308/layui/images/face/39.gif" alt="[鼓掌]">&nbsp; &nbsp;<img src="https://localhost:44308/layui/images/face/51.gif" alt="[兔子]"><br></p><p><br></p><p><img src="/upload/aaa.jpg" alt="file"><img src="/upload/aaa.jpg" alt="file"><br></p><p><img src="https://localhost:44308/layui/images/face/40.gif" alt="[晕]"><br></p>', NULL, 0, N'06', N'随笔', NULL, 0)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (1, CAST(0x0000A9F1008D148B AS DateTime), N'ASP.NET', N'01', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (2, CAST(0x0000A9F1008D2A64 AS DateTime), N'PHP', N'02', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (3, CAST(0x0000A9F1008D3A53 AS DateTime), N'Android', N'08', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (4, CAST(0x0000A9F1008D4875 AS DateTime), N'JAVA', N'04', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (5, CAST(0x0000A9F1008D55D6 AS DateTime), N'IOS', N'05', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (6, CAST(0x0000A9F1008D6278 AS DateTime), N'随笔', N'06', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (10, CAST(0x0000A9F7014E1867 AS DateTime), N'ASP.NET MVC5', N'0101', N'01', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (12, CAST(0x0000A9F80087782D AS DateTime), N'ASP.NET Web', N'0102', N'01', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (14, CAST(0x0000A9F800D8965B AS DateTime), N'DotnetCore', N'0103', N'01', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (15, CAST(0x0000A9F800D9DA9D AS DateTime), N'视频教程', N'07', N'0', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_VisitNum]  DEFAULT ((0)) FOR [VisitNum]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'博客表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容md' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'Body_md'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'VisitNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'CaBh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'CaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Blog', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Bh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Pbh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Remark'
GO
USE [master]
GO
ALTER DATABASE [blogcore] SET  READ_WRITE 
GO
