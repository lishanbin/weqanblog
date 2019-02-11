USE [master]
GO
/****** Object:  Database [blogcore]    Script Date: 2019/2/11 8:37:15 ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 2019/2/11 8:37:15 ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 2019/2/11 8:37:15 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2019/2/11 8:37:15 ******/
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

INSERT [dbo].[Admin] ([Id], [CreateDate], [UserName], [Password], [Remark]) VALUES (1, CAST(0x0000A9F1008CD9DF AS DateTime), N'admin', N'21232f297a57a5a743894a0e4a801fc3', NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (1, CAST(0x0000A9F1008D148B AS DateTime), N'ASP.NET', N'01', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (2, CAST(0x0000A9F1008D2A64 AS DateTime), N'PHP', N'02', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (3, CAST(0x0000A9F1008D3A53 AS DateTime), N'Android', N'03', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (4, CAST(0x0000A9F1008D4875 AS DateTime), N'JAVA', N'04', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (5, CAST(0x0000A9F1008D55D6 AS DateTime), N'IOS', N'05', N'0', NULL)
INSERT [dbo].[Category] ([Id], [CreateDate], [CaName], [Bh], [Pbh], [Remark]) VALUES (6, CAST(0x0000A9F1008D6278 AS DateTime), N'随笔', N'06', N'0', NULL)
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
