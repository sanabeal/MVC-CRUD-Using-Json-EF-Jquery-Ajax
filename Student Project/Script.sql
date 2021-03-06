USE [master]
GO
/****** Object:  Database [StudentProject]    Script Date: 5/6/2021 11:38:40 PM ******/
CREATE DATABASE [StudentProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\StudentProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\StudentProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudentProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentProject] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentProject] SET  MULTI_USER 
GO
ALTER DATABASE [StudentProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentProject', N'ON'
GO
ALTER DATABASE [StudentProject] SET QUERY_STORE = OFF
GO
USE [StudentProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [StudentProject]
GO
/****** Object:  User [test]    Script Date: 5/6/2021 11:38:40 PM ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[StudentInformation]    Script Date: 5/6/2021 11:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[ContactNo] [nvarchar](50) NULL,
	[MailingAddress] [nvarchar](50) NULL,
	[FatherName] [nvarchar](50) NULL,
	[FatherOccupation] [nvarchar](50) NULL,
	[FatherContactNo] [nvarchar](50) NULL,
	[MotherName] [nvarchar](50) NULL,
	[MotherOccupation] [nvarchar](50) NULL,
	[MotherContactNo] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_StudentInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwStudentList]    Script Date: 5/6/2021 11:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwStudentList]
AS
SELECT        ID, Name
FROM            dbo.StudentInformation


GO
/****** Object:  View [dbo].[vwStudentInformation]    Script Date: 5/6/2021 11:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwStudentInformation]
AS
SELECT        ID, Name, CONVERT(CHAR(10), DOB, 103) AS DOB, ContactNo, MailingAddress, FatherName, FatherOccupation, FatherContactNo, MotherName, MotherOccupation, MotherContactNo, EntryDate, UpdateDate
FROM            dbo.StudentInformation


GO
/****** Object:  Table [dbo].[CourseList]    Script Date: 5/6/2021 11:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](50) NULL,
	[CourceName] [nvarchar](50) NULL,
	[CreditHour] [float] NULL,
	[ContactHour] [float] NULL,
 CONSTRAINT [PK_CourseList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 5/6/2021 11:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[SemisterCode] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CourseList] ON 

INSERT [dbo].[CourseList] ([ID], [CourseCode], [CourceName], [CreditHour], [ContactHour]) VALUES (1, N'01', N'Fundamental', 3, 3)
INSERT [dbo].[CourseList] ([ID], [CourseCode], [CourceName], [CreditHour], [ContactHour]) VALUES (2, N'02', N'C++', 2, 2)
INSERT [dbo].[CourseList] ([ID], [CourseCode], [CourceName], [CreditHour], [ContactHour]) VALUES (4, N'03', N'Digital logic', 3, 3)
INSERT [dbo].[CourseList] ([ID], [CourseCode], [CourceName], [CreditHour], [ContactHour]) VALUES (5, N'04', N'Data Structure', 5, 3.5)
INSERT [dbo].[CourseList] ([ID], [CourseCode], [CourceName], [CreditHour], [ContactHour]) VALUES (7, N'05', N'Physics', 3, 2)
SET IDENTITY_INSERT [dbo].[CourseList] OFF
SET IDENTITY_INSERT [dbo].[StudentCourse] ON 

INSERT [dbo].[StudentCourse] ([ID], [StudentID], [CourseID], [SemisterCode], [EntryDate]) VALUES (33, 3, 1, N'FA', CAST(N'2021-05-06T15:01:55.237' AS DateTime))
INSERT [dbo].[StudentCourse] ([ID], [StudentID], [CourseID], [SemisterCode], [EntryDate]) VALUES (34, 3, 5, N'FA', CAST(N'2021-05-06T15:01:55.237' AS DateTime))
INSERT [dbo].[StudentCourse] ([ID], [StudentID], [CourseID], [SemisterCode], [EntryDate]) VALUES (35, 2, 1, N'SU', CAST(N'2021-05-06T15:02:17.010' AS DateTime))
INSERT [dbo].[StudentCourse] ([ID], [StudentID], [CourseID], [SemisterCode], [EntryDate]) VALUES (36, 2, 2, N'SU', CAST(N'2021-05-06T15:02:17.010' AS DateTime))
INSERT [dbo].[StudentCourse] ([ID], [StudentID], [CourseID], [SemisterCode], [EntryDate]) VALUES (37, 4, 1, N'SP', CAST(N'2021-05-06T23:19:58.177' AS DateTime))
INSERT [dbo].[StudentCourse] ([ID], [StudentID], [CourseID], [SemisterCode], [EntryDate]) VALUES (38, 4, 5, N'SP', CAST(N'2021-05-06T23:19:58.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[StudentCourse] OFF
SET IDENTITY_INSERT [dbo].[StudentInformation] ON 

INSERT [dbo].[StudentInformation] ([ID], [Name], [DOB], [ContactNo], [MailingAddress], [FatherName], [FatherOccupation], [FatherContactNo], [MotherName], [MotherOccupation], [MotherContactNo], [EntryDate], [UpdateDate]) VALUES (1, N'Mr. X', CAST(N'2021-05-01' AS Date), N'5654', N'test entry', N'test entry', N'test entry', N'4534', N'test entry', N'test entry', N'5646', CAST(N'2021-05-06T23:15:27.933' AS DateTime), CAST(N'2021-05-06T23:03:37.627' AS DateTime))
INSERT [dbo].[StudentInformation] ([ID], [Name], [DOB], [ContactNo], [MailingAddress], [FatherName], [FatherOccupation], [FatherContactNo], [MotherName], [MotherOccupation], [MotherContactNo], [EntryDate], [UpdateDate]) VALUES (2, N'Mr. Y', CAST(N'2021-01-02' AS Date), N'657', N'test entry', N'test entry', N'test entry', N'345', N'test entry', N'test entry', N'3663465', CAST(N'2021-05-06T23:15:27.933' AS DateTime), NULL)
INSERT [dbo].[StudentInformation] ([ID], [Name], [DOB], [ContactNo], [MailingAddress], [FatherName], [FatherOccupation], [FatherContactNo], [MotherName], [MotherOccupation], [MotherContactNo], [EntryDate], [UpdateDate]) VALUES (3, N'Mr. Z', CAST(N'2021-01-12' AS Date), N'01723678442', N'test entry', N'test entry', N'test entry', N'345', N'test entry', N'test entry', N'34534', CAST(N'2021-05-06T23:15:27.933' AS DateTime), NULL)
INSERT [dbo].[StudentInformation] ([ID], [Name], [DOB], [ContactNo], [MailingAddress], [FatherName], [FatherOccupation], [FatherContactNo], [MotherName], [MotherOccupation], [MotherContactNo], [EntryDate], [UpdateDate]) VALUES (4, N'Mr. XYZ', CAST(N'2021-05-06' AS Date), N'017236784402', N'test entry', N'test entry', N'test entry', N'34534', N'test entry', N'test entry', N'5643634574', CAST(N'2021-05-06T23:15:27.933' AS DateTime), NULL)
INSERT [dbo].[StudentInformation] ([ID], [Name], [DOB], [ContactNo], [MailingAddress], [FatherName], [FatherOccupation], [FatherContactNo], [MotherName], [MotherOccupation], [MotherContactNo], [EntryDate], [UpdateDate]) VALUES (5, N'Kabr', CAST(N'2020-06-07' AS Date), N'01723678442', N'test entry', N'Md. Mazibar Rahman', N'test etry', N'34234', N'test mother name', N'test entry', N'456456', CAST(N'2021-05-06T23:15:27.933' AS DateTime), NULL)
INSERT [dbo].[StudentInformation] ([ID], [Name], [DOB], [ContactNo], [MailingAddress], [FatherName], [FatherOccupation], [FatherContactNo], [MotherName], [MotherOccupation], [MotherContactNo], [EntryDate], [UpdateDate]) VALUES (9, N'test 3', CAST(N'2021-05-05' AS Date), N'34534', N'test 6', N'test 3', N'test 7', N'456456', N'test 8', N'test 5', N'45645', CAST(N'2021-05-06T23:15:27.933' AS DateTime), CAST(N'2021-05-06T23:15:27.933' AS DateTime))
SET IDENTITY_INSERT [dbo].[StudentInformation] OFF
ALTER TABLE [dbo].[StudentInformation] ADD  CONSTRAINT [DF_StudentInformation_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
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
         Begin Table = "StudentInformation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 341
               Right = 228
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStudentInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStudentInformation'
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
         Begin Table = "StudentInformation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 411
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStudentList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStudentList'
GO
USE [master]
GO
ALTER DATABASE [StudentProject] SET  READ_WRITE 
GO
