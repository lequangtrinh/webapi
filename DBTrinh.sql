USE [master]
GO
/****** Object:  Database [DBTrinh]    Script Date: 25/5/2023 17:26:24 ******/
CREATE DATABASE [DBTrinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBTrinh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\DBTrinh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBTrinh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\DBTrinh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBTrinh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBTrinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBTrinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBTrinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBTrinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBTrinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBTrinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBTrinh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBTrinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBTrinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBTrinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBTrinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBTrinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBTrinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBTrinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBTrinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBTrinh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBTrinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBTrinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBTrinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBTrinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBTrinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBTrinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBTrinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBTrinh] SET RECOVERY FULL 
GO
ALTER DATABASE [DBTrinh] SET  MULTI_USER 
GO
ALTER DATABASE [DBTrinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBTrinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBTrinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBTrinh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBTrinh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBTrinh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBTrinh', N'ON'
GO
ALTER DATABASE [DBTrinh] SET QUERY_STORE = OFF
GO
USE [DBTrinh]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Raised] [datetime] NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[CorrelationId] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Container] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[Module] [nvarchar](255) NULL,
	[Instance] [nvarchar](255) NULL,
	[Environment] [nvarchar](255) NULL,
	[EnvironmentInstance] [nvarchar](255) NULL,
	[MetaData] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Appointment]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Appointment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_id] [nchar](20) NOT NULL,
	[Patient_id] [nchar](20) NOT NULL,
	[Flag] [int] NULL,
	[CreateDate] [nchar](20) NULL,
	[UpdateDate] [nchar](20) NULL,
 CONSTRAINT [PK_T_Appointment] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[Doctor_id] ASC,
	[Patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Bed]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Bed](
	[Bed_Id] [int] IDENTITY(1,1) NOT NULL,
	[Bed_Number] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
	[UserUpdate] [nvarchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Bed_Alotment]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Bed_Alotment](
	[Bed_Allotment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Bed_Id] [int] NOT NULL,
	[Patient_Id] [int] NOT NULL,
	[Allotment_Timestamp] [nvarchar](20) NULL,
	[Discharge_Timestamp] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
	[UserUpdate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Bed_Alotment] PRIMARY KEY CLUSTERED 
(
	[Bed_Allotment_Id] ASC,
	[Bed_Id] ASC,
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Blood_Bank]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Blood_Bank](
	[Blood_Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Blood_Group] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Blood_Bank] PRIMARY KEY CLUSTERED 
(
	[Blood_Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Blood_Donor]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Blood_Donor](
	[Blood_Donor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Blood_Group] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Sex] [nvarchar](20) NULL,
	[Age] [nvarchar](20) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](20) NULL,
	[Last_Donation_Timestamp] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Blood_Donor] PRIMARY KEY CLUSTERED 
(
	[Blood_Donor_Id] ASC,
	[Blood_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_ChildPriceServices]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ChildPriceServices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CodeServicesDetail] [nvarchar](20) NOT NULL,
	[CodeServices] [nvarchar](20) NOT NULL,
	[ServicesName] [nvarchar](500) NULL,
	[NumberUsers] [int] NULL,
	[CreateDate] [nchar](20) NULL,
	[UpdateDate] [nchar](20) NULL,
	[Flag] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_T_ChildPriceServices] PRIMARY KEY CLUSTERED 
(
	[CodeServicesDetail] ASC,
	[CodeServices] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Department]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Department](
	[Department_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Department] PRIMARY KEY CLUSTERED 
(
	[Department_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Diagnosis_Report]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Diagnosis_Report](
	[Diagnosis_Report_Id] [int] IDENTITY(1,1) NOT NULL,
	[Laboratorist_Id] [int] NOT NULL,
	[Prescription_Id] [int] NOT NULL,
	[Report_Type] [nvarchar](200) NULL,
	[Document_Type] [nvarchar](200) NULL,
	[File_Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Timestamp] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Diagnosis_Report] PRIMARY KEY CLUSTERED 
(
	[Diagnosis_Report_Id] ASC,
	[Laboratorist_Id] ASC,
	[Prescription_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Doctor]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Doctor](
	[Doctor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Department_id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[Profile] [nvarchar](max) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Doctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_Id] ASC,
	[Department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Email_Template]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Email_Template](
	[Email_Template_Id] [int] IDENTITY(1,1) NOT NULL,
	[Task] [nvarchar](500) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Email_Template] PRIMARY KEY CLUSTERED 
(
	[Email_Template_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Invoice]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Invoice](
	[Invoice_Id] [int] NOT NULL,
	[Patient_Id] [int] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Amount] [nvarchar](20) NULL,
	[Creation_Timestamp] [nvarchar](100) NULL,
	[Status] [nchar](10) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Invoice_Id] ASC,
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Laboratorist]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Laboratorist](
	[Lboratorist_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Laboratorist] PRIMARY KEY CLUSTERED 
(
	[Lboratorist_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Medicine]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Medicine](
	[Medicine_Id] [int] IDENTITY(1,1) NOT NULL,
	[Medicine_Category_Id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [bigint] NULL,
	[Manufacturing_Company] [nvarchar](max) NULL,
	[Status] [nchar](10) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Medicine] PRIMARY KEY CLUSTERED 
(
	[Medicine_Id] ASC,
	[Medicine_Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Medicine_Category]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Medicine_Category](
	[Medicine_Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Medicine_Category] PRIMARY KEY CLUSTERED 
(
	[Medicine_Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Menu]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](20) NOT NULL,
	[ParentName] [nvarchar](200) NULL,
	[Flags] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[Images] [nvarchar](max) NULL,
 CONSTRAINT [PK_T_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Noticeboard]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Noticeboard](
	[Notice_id] [int] IDENTITY(1,1) NOT NULL,
	[Notice_title] [nvarchar](max) NULL,
	[Notice] [nvarchar](max) NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Noticeboard] PRIMARY KEY CLUSTERED 
(
	[Notice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Nurse]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Nurse](
	[Nurse_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Nurse] PRIMARY KEY CLUSTERED 
(
	[Nurse_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Patient]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Patient](
	[Patient_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](500) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[Sex] [nvarchar](20) NULL,
	[Birth_Date] [nvarchar](20) NULL,
	[Age] [int] NULL,
	[Blood_Group] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Patient] PRIMARY KEY CLUSTERED 
(
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Payment]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Payment](
	[Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_Id] [int] NOT NULL,
	[Invoice_Id] [int] NOT NULL,
	[Patient_Id] [int] NOT NULL,
	[Payment_Type] [nvarchar](20) NULL,
	[Method] [nvarchar](200) NULL,
	[Description] [nvarchar](200) NULL,
	[Amount] [bigint] NULL,
	[Timestamp] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Payment] PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC,
	[Transaction_Id] ASC,
	[Invoice_Id] ASC,
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pharmacist]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pharmacist](
	[Pharmacist_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Pharmacist] PRIMARY KEY CLUSTERED 
(
	[Pharmacist_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Prescription]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Prescription](
	[Prescription_Id] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_Id] [int] NOT NULL,
	[Patient_Id] [int] NOT NULL,
	[Case_History] [nvarchar](500) NULL,
	[Medication] [nvarchar](500) NULL,
	[Medication_From_Pharmacist] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Prescription] PRIMARY KEY CLUSTERED 
(
	[Prescription_Id] ASC,
	[Doctor_Id] ASC,
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_PriceServices]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PriceServices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CodeServices] [nchar](10) NULL,
	[Name] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[Images] [nchar](100) NULL,
	[CreateDate] [nchar](50) NULL,
	[UpdateDate] [nchar](50) NULL,
	[Flags] [int] NULL,
	[UserUpdate] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Report]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Report](
	[Report_Id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_Id] [int] NOT NULL,
	[Doctor_Id] [int] NOT NULL,
	[Type] [nvarchar](20) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Report] PRIMARY KEY CLUSTERED 
(
	[Report_Id] ASC,
	[Patient_Id] ASC,
	[Doctor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Settings]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Settings](
	[Settings_Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
	[CreateDate] [nvarchar](20) NULL,
	[UpdateDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_Settings] PRIMARY KEY CLUSTERED 
(
	[Settings_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_SubMenu]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SubMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Name] [nvarchar](200) NULL,
	[Url] [nvarchar](200) NULL,
	[CreateDate] [nvarchar](20) NULL,
	[ChildID] [int] NULL,
 CONSTRAINT [PK_T_SubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableChat]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableChat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nchar](20) NOT NULL,
	[UserIDTo] [nchar](20) NOT NULL,
	[ValueMess] [nvarchar](max) NULL,
	[CreateDate] [nchar](20) NULL,
	[UpdateDate] [nchar](20) NULL,
	[FlagsDiv] [int] NULL,
 CONSTRAINT [PK_TableChat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableChatFriend]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableChatFriend](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nchar](20) NULL,
	[IDFriend] [nchar](20) NULL,
	[Status] [int] NULL,
	[CreateDate] [nvarchar](10) NULL,
	[UpdateDate] [nvarchar](10) NULL,
 CONSTRAINT [PK_TableChatFriend] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableStatusChatUser]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableStatusChatUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nchar](20) NULL,
	[Status] [int] NULL,
	[TimeOnline] [nchar](10) NULL,
	[FlagsDiv] [int] NULL,
	[CreateDate] [nchar](10) NULL,
	[UpdateDate] [nchar](10) NULL,
 CONSTRAINT [PK_TableStatusChatUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T-Admin]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T-Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Admin_id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Flag] [int] NULL,
	[CreateDate] [nchar](20) NULL,
	[UpdateDate] [nchar](20) NULL,
 CONSTRAINT [PK_T-Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [char](5) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[Password] [char](60) NULL,
	[Image] [nvarchar](100) NULL,
	[LoginFailTimes] [int] NULL,
	[PassReissueKey] [char](60) NULL,
	[DeleteDiv] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_MstStaff] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Appointment] ON 

INSERT [dbo].[T_Appointment] ([id], [Doctor_id], [Patient_id], [Flag], [CreateDate], [UpdateDate]) VALUES (1, N'8                   ', N'8                   ', 0, N'May 16 2023  9:25AM ', N'May 16 2023  9:25AM ')
INSERT [dbo].[T_Appointment] ([id], [Doctor_id], [Patient_id], [Flag], [CreateDate], [UpdateDate]) VALUES (2, N'11                  ', N'6                   ', 0, N'May 16 2023  9:25AM ', N'May 16 2023  9:25AM ')
INSERT [dbo].[T_Appointment] ([id], [Doctor_id], [Patient_id], [Flag], [CreateDate], [UpdateDate]) VALUES (3, N'8                   ', N'5                   ', 0, N'May 16 2023  9:25AM ', N'May 16 2023  9:25AM ')
SET IDENTITY_INSERT [dbo].[T_Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Bed] ON 

INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (1, N'W1', N'ward', 0, N'Ward Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (2, N'W2', N'ward', 0, N'Ward Number 2', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (3, N'ICU1', N'icu', 0, N'ICU 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (4, N'CB1', N'cabin', 0, N'Cabin Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (5, N'A1', N'ward', 1, N'Ward Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (6, N'A2', N'ward', 1, N'Ward Number 2', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (7, N'ICU2', N'icu', 0, N'ICU 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (8, N'CB2', N'cabin', 0, N'Cabin Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (9, N'B1', N'ward', 0, N'Ward Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (10, N'B2', N'ward', 1, N'Ward Number 2', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (11, N'CT1', N'icu', 1, N'ICU 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (12, N'CTU', N'cabin', 1, N'Cabin Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (13, N'A3', N'ward', 0, N'Ward Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (14, N'A4', N'ward', 1, N'Ward Number 2', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (15, N'TUI', N'icu', 1, N'ICU 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
INSERT [dbo].[T_Bed] ([Bed_Id], [Bed_Number], [Type], [Status], [Description], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (16, N'CTR', N'cabin', 0, N'Cabin Number 1', 0, N'May 16 2023  5:20PM', N'May 16 2023  5:20PM', N'00001')
SET IDENTITY_INSERT [dbo].[T_Bed] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Bed_Alotment] ON 

INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (1, 2, 6, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (2, 3, 4, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (3, 2, 1, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (4, 3, 2, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (5, 2, 6, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (6, 1, 7, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (7, 8, 2, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (8, 5, 9, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (9, 10, 11, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
INSERT [dbo].[T_Bed_Alotment] ([Bed_Allotment_Id], [Bed_Id], [Patient_Id], [Allotment_Timestamp], [Discharge_Timestamp], [Flag], [CreateDate], [UpdateDate], [UserUpdate]) VALUES (10, 11, 5, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', 0, N'May 16 2023  5:22PM', N'May 16 2023  5:22PM', NULL)
SET IDENTITY_INSERT [dbo].[T_Bed_Alotment] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Department] ON 

INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (1, N'Anesthesiology', N'Anesthesiology', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (2, N'Bacteriological Laboratory', N'Bacteriological Laboratory', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (3, N'Physical Therapy', N'Physical Therapy', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (4, N'Plastic Surgery', N'Plastic Surgery', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (5, N'Infectious disease doctors', N'Infectious disease doctors specialize in diseases and conditions that are contagious. Includes: influenza, stomach issues, hiv, pneumonia, tuberclosis', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (6, N'Dermatologists', N'Dermatologists focus on diseases and conditions of the skin, nails, and hair. They treat conditions such as eczema, skin cancer, acne, and psoriasis.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (7, N'Allergists', N'An allergist or immunologist focuses on preventing and treating allergic diseases and conditions. These usually include various types of allergies and asthma.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (8, N'Ophthalmologists', N'Ophthalmologists specialize in eye and vision care. They treat diseases and conditions of the eyes and can perform eye surgery.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (9, N'Obstetrician/Gynecologists', N'For female health conditions: female reproductive health, cancer prevention and diagnosis in the female reproductive organs, breast care, pregnancy, labor and delivery, infertility, menopause', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (10, N'Cardiologists', N'Cardiologists focus on the cardiovascular system, which includes the heart and blood vessels. high blood pressure, high cholesterol, heart attack and stroke', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (11, N'Endocrinologists', N'Endocrinologists treat hormone-related conditions such as: diabetes, thyroid conditions, hormone imbalances, infertility, growth problems in children', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (12, N'Gastroenterologists', N'Gastroenterologists focus on the digestive system. This includes the esophagus, pancreas, stomach, liver, small intestine, colon, and gallbladder.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (13, N'Nephrologists', N'A nephrologist focuses on kidney care and conditions that affect the kidneys.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (14, N'Urologists', N'Urologists treat conditions of the urinary tract in both males and females.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (15, N'Pulmonologists', N'Pulmonologists focus on the organs involved with breathing. These include the lungs and heart.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (16, N'Otolaryngologists', N'An ENT doctor may treat problems with the sinuses, throat, tonsils, ears, mouth, head, and neck.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (17, N'Neurologists', N'A neurologist treats conditions of the nerves, spine, and brain.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (18, N'Psychiatrists', N'A psychiatrist is a doctor who treats mental health conditions. They may use counseling, medication, or hospitalization as part of their treatment.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (19, N'Oncologists', N'Oncologists treat cancer and its symptoms. During treatment for cancer, a person may have several types of healthcare professional in their care team.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (20, N'Radiologists', N'A radiologist specializes in diagnosing and treating conditions using medical imaging tests. They may read and interpret scans such as X-rays, MRIs, mammograms, ultrasound, and CT scans.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (21, N'General Surgeons', N'General surgeons perform surgical procedures on many organs and bodily systems. ', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (22, N'Orthopedic Surgeons', N'An orthopedic surgeon specializes in diseases and conditions of the bones, muscles, ligaments, tendons, and joints.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
INSERT [dbo].[T_Department] ([Department_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (23, N'Cardiac Surgeons', N'Cardiac surgeons perform heart surgery and may work with a cardiologist to determine what a person needs.', 0, N'May 16 2023  5:15PM', N'May 16 2023  5:15PM')
SET IDENTITY_INSERT [dbo].[T_Department] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Doctor] ON 

INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (1, 4, N'David K. Murphy', N'davidmur@mail.com', N'password123', N'52 Kelly Drive', N'3240006965', N'none', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (2, 3, N'William Dcruz', N'williamd@mail.com', N'password', N'65 Bloomfield Way', N'7777777777', N'none', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (3, 18, N'Ethel M. Drake', N'etheld@mail.com', N'password', N'15 C Street', N'4589998888', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (4, 5, N'Peter N. Cundiff', N'peterc@mail.com', N'password', N'17 Wayback Lane', N'3545557777', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (5, 6, N'Anne K. Alden', N'annek@mail.com', N'password', N'23 Allison Avenue', N'8888885547', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (6, 8, N'Gary B. Bartz', N'garybb@mail.com', N'password', N'24 James Martin Circle', N'1458745877', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (7, 9, N'Benjamin M. Moran', N'benjamin@mail.com', N'password', N'19 Ritter Avenue', N'7458966666', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (8, 10, N'Sandra T. Carter', N'carter@mail.com', N'password123', N'61 Mudlick Road', N'7774445877', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (9, 12, N'Alberto J. Merritt', N'albertoj@mail.com', N'password', N'15 Tator Patch Road', N'7415554470', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (10, 13, N'Sarah R. Culbertson', N'sarahrr@mail.com', N'password', N'28 Harry Place', N'4445552210', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (11, 14, N'Zoila C. Vicini', N'zoilac@mail.com', N'password', N'79 Wildwood Street', N'7850000010', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (12, 14, N'Deanne C. Johnson', N'deannec@mail.com', N'password', N'34 Johnson Street', N'7458887777', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
INSERT [dbo].[T_Doctor] ([Doctor_Id], [Department_id], [Name], [Email], [Password], [Address], [Phone], [Profile], [Flag], [CreateDate], [UpdateDate]) VALUES (13, 20, N'Pauline J. Chambers', N'pauline@mail.com', N'password', N'19 Layman Avenue', N'74588888888', N'Test', 0, N'May 16 2023  9:19AM', N'May 16 2023  9:19AM')
SET IDENTITY_INSERT [dbo].[T_Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Laboratorist] ON 

INSERT [dbo].[T_Laboratorist] ([Lboratorist_Id], [Name], [Email], [Password], [Address], [Phone], [Flag], [CreateDate], [UpdateDate]) VALUES (1, N'Melvin R. Jones', N'mrj@mail.com', N'lab789', N'26 Shinn Avenue', N'3365478880', 0, N'May 16 2023  5:13PM', N'May 16 2023  5:13PM')
INSERT [dbo].[T_Laboratorist] ([Lboratorist_Id], [Name], [Email], [Password], [Address], [Phone], [Flag], [CreateDate], [UpdateDate]) VALUES (2, N'Robert V. Jacob', N'robert@mail.com', N'password', N'14 Trainer Avenue', N'7125698569', 0, N'May 16 2023  5:13PM', N'May 16 2023  5:13PM')
INSERT [dbo].[T_Laboratorist] ([Lboratorist_Id], [Name], [Email], [Password], [Address], [Phone], [Flag], [CreateDate], [UpdateDate]) VALUES (3, N'Mark T. Weiss', N'mark@mail.com', N'password', N'72 Lincoln Street', N'7000002560', 0, N'May 16 2023  5:13PM', N'May 16 2023  5:13PM')
INSERT [dbo].[T_Laboratorist] ([Lboratorist_Id], [Name], [Email], [Password], [Address], [Phone], [Flag], [CreateDate], [UpdateDate]) VALUES (4, N'Winston C. Hensley', N'winston@mail.com', N'password', N'95 Hartland Avenue', N'3745696969', 0, N'May 16 2023  5:13PM', N'May 16 2023  5:13PM')
INSERT [dbo].[T_Laboratorist] ([Lboratorist_Id], [Name], [Email], [Password], [Address], [Phone], [Flag], [CreateDate], [UpdateDate]) VALUES (5, N'Rose J. Walters', N'walters@mail.com', N'password', N'82 Winifred Way', N'7125896565', 0, N'May 16 2023  5:13PM', N'May 16 2023  5:13PM')
INSERT [dbo].[T_Laboratorist] ([Lboratorist_Id], [Name], [Email], [Password], [Address], [Phone], [Flag], [CreateDate], [UpdateDate]) VALUES (6, N'Danny C. Williamson', N'dannyc@mail.com', N'password123', N'29 Emeral Dreams Drive', N'7145552450', 0, N'May 16 2023  5:13PM', N'May 16 2023  5:13PM')
SET IDENTITY_INSERT [dbo].[T_Laboratorist] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Medicine] ON 

INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (1, 1, N'Aber C 500', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 1, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (2, 2, N'Benzonatate', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 44, N'TESSALON', N'112       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (3, 3, N'Cephalexin', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 27, N'Lupin Pharmaceuticals', N'68        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (4, 4, N'Lisinopril', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 30, N'Apotex', N'110       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (5, 5, N'Methotrexate', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 9, N'Bristol Myers Squibb', N'80        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (6, 1, N'Phanadol', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (7, 2, N'Vitamin C1', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 45, N'TESSALON', N'110       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (8, 3, N'Betborin', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 70, N'Lupin Pharmaceuticals', N'60        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (9, 4, N'Decocven', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 50, N'Apotex', N'167       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (10, 5, N'Trinh', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 19, N'Bristol Myers Squibb', N'90        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (11, 7, N'Vitamin B', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (12, 8, N'Vitamin A', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 44, N'TESSALON', N'112       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (13, 3, N'Phanadol Blue', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 27, N'Lupin Pharmaceuticals', N'68        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (14, 9, N'Phanadol Red', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 30, N'Apotex', N'110       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (15, 10, N'Methotrexate 1', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 9, N'Bristol Myers Squibb', N'80        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (16, 1, N'Betborin C1', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (17, 5, N'Vitamin F1', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 45, N'TESSALON', N'110       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (18, 3, N'Betborin 2', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 70, N'Lupin Pharmaceuticals', N'60        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (19, 12, N'Decocven 3', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 50, N'Apotex', N'167       ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (20, 13, N'Trinh 34', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 19, N'Bristol Myers Squibb', N'90        ', 0, N'May 16 2023  2:42PM', N'May 16 2023  2:42PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (21, 11, N'Aber C 500', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (22, 12, N'Benzonatate', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 44, N'TESSALON', N'112       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (23, 13, N'Cephalexin', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 27, N'Lupin Pharmaceuticals', N'68        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (24, 4, N'Lisinopril', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 30, N'Apotex', N'110       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (25, 5, N'Methotrexate', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 9, N'Bristol Myers Squibb', N'80        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (26, 11, N'Phanadol', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (27, 12, N'Vitamin C1', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 45, N'TESSALON', N'110       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (28, 13, N'Betborin', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 70, N'Lupin Pharmaceuticals', N'60        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (29, 4, N'Decocven', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 50, N'Apotex', N'167       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (30, 5, N'Trinh', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 19, N'Bristol Myers Squibb', N'90        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (31, 7, N'Vitamin B', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (32, 8, N'Vitamin A', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 44, N'TESSALON', N'112       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (33, 3, N'Phanadol Blue', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 27, N'Lupin Pharmaceuticals', N'68        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (34, 9, N'Phanadol Red', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 30, N'Apotex', N'110       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (35, 10, N'Methotrexate 1', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 9, N'Bristol Myers Squibb', N'80        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (36, 11, N'Betborin C1', N'Vitamin C 500gm', 25, N'Company Cipla', N'50        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (37, 5, N'Vitamin F1', N'Benzonatate is a non-narcotic cough medicine.  Benzonatate works by numbing the throat and lungs, making the cough reflex less active.', 45, N'TESSALON', N'110       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (38, 13, N'Betborin 2', N'Cephalexin is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body.', 70, N'Lupin Pharmaceuticals', N'60        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (39, 12, N'Decocven 3', N'Lisinopril is used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', 50, N'Apotex', N'167       ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
INSERT [dbo].[T_Medicine] ([Medicine_Id], [Medicine_Category_Id], [Name], [Description], [Price], [Manufacturing_Company], [Status], [Flag], [CreateDate], [UpdateDate]) VALUES (40, 13, N'Trinh 34', N'Methotrexate is used to treat leukemia and certain types of cancer of the breast, skin, head and neck, lung, or uterus.', 19, N'Bristol Myers Squibb', N'90        ', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
SET IDENTITY_INSERT [dbo].[T_Medicine] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Medicine_Category] ON 

INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (1, N'Allergy Liquids', N'Allergic medicines', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (2, N'Vitamins Tablets', N'Vitamins tablets only', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (3, N'Liquid', N'A liquid may also be called a ‘mixture’, ‘solution’ or ‘syrup’. Many common liquids are now available without any added colouring or sugar.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (4, N'Tablet', N'The active ingredient is combined with another substance and pressed into a round or oval solid shape. There are different types of tablet. Soluble or dispersible tablets can safely be dissolved in water.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (5, N'Capsules', N'The active part of the medicine is contained inside a plastic shell that dissolves slowly in the stomach. You can take some capsules apart and mix the contents with your child’s favourite food. ', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (6, N'Topical medicines', N'These are creams, lotions or ointments applied directly onto the skin. They come in tubs, bottles or tubes depending on the type of medicine. ', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (7, N'Drops', N'These are often used where the active part of the medicine works best if it reaches the affected area directly. They tend to be used for eye, ear or nose.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (8, N'Inhalers', N'The active part of the medicine is released under pressure directly into the lungs. Young children may need to use a ‘spacer’ device to take the medicine properly.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (9, N'Injections', N'There are different types of injection, in how and where they\re injected. Subcutaneous or SC injections are given just under the surface of the skin.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (10, N'Implants or patches', N'These medicines are absorbed through the skin, such as nicotine patches for help in giving up smoking, or contraceptive implants.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (11, N'Type of Bottle/jar', N'These medicines are absorbed through the skin, such as nicotine patches for help in giving up smoking, or contraceptive implants.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (12, N'Type of Nicotin', N'These medicines are absorbed through the skin, such as nicotine patches for help in giving up smoking, or contraceptive implants.', 0, N'May 16 2023  2:36PM', N'May 16 2023  2:36PM')
INSERT [dbo].[T_Medicine_Category] ([Medicine_Category_Id], [Name], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (13, N'Type of bag', N'Allergic medicines', 0, N'May 16 2023  2:43PM', N'May 16 2023  2:43PM')
SET IDENTITY_INSERT [dbo].[T_Medicine_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Menu] ON 

INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (1, N'00001', N'Dashboards', 0, N'2023-04-10 07:06:25 ', N'fa fa-tachometer')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (3, N'00001', N'Doctor', 0, N'2023-04-10 07:06:25 ', N'fa fa-user-md')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (4, N'00001', N'Patient', 0, N'2023-04-10 07:06:25 ', N'fa fa-users')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (5, N'00001', N'Nurse', 0, N'2023-04-10 07:06:25 ', N'fa fa-user-md')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (7, N'00001', N'Pharmacist', 0, N'2023-04-10 07:06:25 ', N'fa fa-graduation-cap')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (8, N'00001', N'Report', 0, N'2023-04-10 07:06:25 ', N'fa fa-flag')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (9, N'00001', N'Settings', 0, N'2023-04-10 07:06:25 ', N'fa fa-cogs')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (10, N'00001', N'Payment', 0, N'2023-04-10 07:06:25 ', N'fa fa-money')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (11, N'00001', N'Appointment', 0, N'2023-04-10 07:06:25 ', N'fa fa-calendar-plus-o')
INSERT [dbo].[T_Menu] ([id], [UserID], [ParentName], [Flags], [CreateDate], [Images]) VALUES (12, N'00001', N'Medicine', 0, N'2023-04-10 07:06:25 ', N'fa fa-medkit')
SET IDENTITY_INSERT [dbo].[T_Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Patient] ON 

INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (1, N'Marc Jones', N'marc@mail.com', N'patient13309', N'44 Burton Avenue', N'2354547878', N'male', N'03/04/1981', 34, N'B+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (2, N'Thomas', N'thomasw@mail.com', N'password', N'7775 Alac Avenue', N'7450002650', N'male', N'03/31/1990', 32, N'AB+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (3, N'Elon Depp', N'elondp@mail.com', N'password', N'114 Test', N'7774441144', N'male', N'12/14/1993', 27, N'A-', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (4, N'Kyle E. Moore', N'kyle@mail.com', N'password123', N'33 Williams Avenue', N'2365554500', N'male', N'04/14/1994', 28, N'AB+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (5, N'Chester H. Smith', N'chesterm@mail.com', N'password', N'54 West Drive', N'3332221450', N'male', N'04/06/1999', 23, N'O+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (6, N'Sherie A. Phipps', N'sherie@mail.com', N'password', N'54 Tori Lane', N'4521216996', N'female', N'04/01/1990', 32, N'B+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (7, N'Julie J. Gentry', N'juliee@mail.com', N'password', N'2 Webster Street', N'3214569999', N'female', N'02/03/1990', 32, N'B+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (8, N'Robert L. Thompson', N'thompson@mail.com', N'password', N'94 Stewart Street', N'3458887777', N'male', N'06/03/1990', 31, N'A-', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (9, N'Yesenia J. Denby', N'yesenia@mail.com', N'password', N'10 Twin Oaks Drive', N'7850002222', N'female', N'07/08/1997', 24, N'B-', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (10, N'Matthew J. Davis', N'matthw@mail.com', N'password', N'74 Ruckman Road', N'3560001450', N'male', N'01/05/2000', 21, N'O+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (11, N'Christian R. Bergstrom', N'christianb@mail.com', N'pass', N'25 Locust Court', N'3450001010', N'male', N'03/23/1998', 24, N'O-', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (12, N'Roy J. Woods', N'royw@mail.com', N'password', N'73 Eagles Nest Drive', N'7850012457', N'male', N'02/12/1980', 42, N'O+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (13, N'Misty A. Brennen', N'mistya@mail.com', N'pass', N'55 Lyndon Street', N'32566666660', N'female', N'04/28/1975', 46, N'A+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (14, N'Francis Thomason', N'francis@mail.com', N'password', N'21 Spinnaker Lane', N'4445550012', N'male', N'02/17/1968', 54, N'B+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
INSERT [dbo].[T_Patient] ([Patient_Id], [Name], [Email], [Password], [Address], [Phone], [Sex], [Birth_Date], [Age], [Blood_Group], [Flag], [CreateDate], [UpdateDate]) VALUES (15, N'Mary Rockwell', N'maryrr@mail.com', N'password', N'709 Froe Street', N'7896547800', N'female', N'04/10/1987', 35, N'A+', 0, N'May 16 2023  9:20AM', N'May 16 2023  9:20AM')
SET IDENTITY_INSERT [dbo].[T_Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Payment] ON 

INSERT [dbo].[T_Payment] ([Payment_Id], [Transaction_Id], [Invoice_Id], [Patient_Id], [Payment_Type], [Method], [Description], [Amount], [Timestamp]) VALUES (1, 4, 3, 5, N'Demo', N'cash', N'This is a demo payment', 1255454, N'1651201325')
INSERT [dbo].[T_Payment] ([Payment_Id], [Transaction_Id], [Invoice_Id], [Patient_Id], [Payment_Type], [Method], [Description], [Amount], [Timestamp]) VALUES (2, 3, 4, 6, N'Op104', N'cash', N'Test. Test. Test. Test. Test. Test. Test. Test. Test.?', 2335454, N'1651170342')
SET IDENTITY_INSERT [dbo].[T_Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Prescription] ON 

INSERT [dbo].[T_Prescription] ([Prescription_Id], [Doctor_Id], [Patient_Id], [Case_History], [Medication], [Medication_From_Pharmacist], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (1, 11, 6, N'Test. Test Test. Test Test. Test Test. Test', N'Test. Test Test. Test Test. Test Test. Test', N'Test. Test Test. Test Test. Test', N'Test. Test Test. Test Test. Test', 0, N'May 16 2023  9:27AM', N'May 16 2023  9:27AM')
INSERT [dbo].[T_Prescription] ([Prescription_Id], [Doctor_Id], [Patient_Id], [Case_History], [Medication], [Medication_From_Pharmacist], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (2, 8, 5, N'This is a demo case history for testing purpose!', N'This is a sample medication for testing purpose!', N'This is a sample medication&nbsp;for testing purpose!', N'This is a demo description for testing purpose!', 0, N'May 16 2023  9:27AM', N'May 16 2023  9:27AM')
INSERT [dbo].[T_Prescription] ([Prescription_Id], [Doctor_Id], [Patient_Id], [Case_History], [Medication], [Medication_From_Pharmacist], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (3, 9, 7, N'Test. Test Test. Test Test. Test Test. Test', N'Test. Test Test. Test Test. Test Test. Test', N'Test. Test Test. Test Test. Test', N'Test. Test Test. Test Test. Test', 0, N'May 16 2023  9:27AM', N'May 16 2023  9:27AM')
INSERT [dbo].[T_Prescription] ([Prescription_Id], [Doctor_Id], [Patient_Id], [Case_History], [Medication], [Medication_From_Pharmacist], [Description], [Flag], [CreateDate], [UpdateDate]) VALUES (4, 7, 5, N'This is tRINH!', N'This is a DFDSF!', N'This is a sample medication&nbsp;for SDFSD purpose!', N'This is a demo description for GFGF purpose!', 0, N'May 16 2023  9:27AM', N'May 16 2023  9:27AM')
SET IDENTITY_INSERT [dbo].[T_Prescription] OFF
GO
SET IDENTITY_INSERT [dbo].[T_PriceServices] ON 

INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (1, N'00001     ', N'Nhà cung cấp labo', 854255, N'Supplier.png                                                                                        ', N'2023-04-10 07:06:25                               ', N'2023-04-11 17:05:50                               ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (2, N'00002     ', N'Phân quyền đánh giá', 400007, N'authenticrvaluate.png                                                                               ', N'2023-04-10 07:06:25                               ', N'2023-04-11 17:05:50                               ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (3, N'00003     ', N'Phân quyền đặt lịch', 1370027, N'authentic-schedule.png                                                                              ', N'2023-04-10 07:06:25                               ', N'2023-04-11 17:05:50                               ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (4, N'00004     ', N'Mobile', 3270079, N'chevron.png                                                                                         ', N'2023-04-10 07:06:25                               ', N'2023-04-11 17:05:50                               ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (5, N'00005     ', N'Nhập xuất Kho', 2545447, N'import-and-export.png                                                                               ', N'2023-04-10 07:06:25                               ', N'2023-04-11 17:07:00                               ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (6, N'00006     ', N'Telesale', 500000, N'Telesale.png                                                                                        ', N'2023-04-10 07:06:25                               ', N'2023-04-10 07:06:25                               ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (7, N'00008     ', N'Ticket', 491265, N'ticket.png                                                                                          ', N'2023-04-10 07:06:25                               ', N'2023-04-11 17:05:50                               ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (8, N'00011     ', N'Doanh thu', 789194, N'Business.gif                                                                                        ', N'2023-04-10 07:06:25                               ', N'                                                  ', 1, N'00001')
INSERT [dbo].[T_PriceServices] ([id], [CodeServices], [Name], [Price], [Images], [CreateDate], [UpdateDate], [Flags], [UserUpdate]) VALUES (9, N'00012     ', N'ChatBots', 1000000, N'chat.png                                                                                            ', N'2023-04-10 07:06:25                               ', N'2023-04-10 07:06:25                               ', 1, N'00001')
SET IDENTITY_INSERT [dbo].[T_PriceServices] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Report] ON 

INSERT [dbo].[T_Report] ([Report_Id], [Patient_Id], [Doctor_Id], [Type], [Description], [CreateDate]) VALUES (1, 8, 5, N'other', N'This is a sample report.', N'May 16 2023 10:47AM')
INSERT [dbo].[T_Report] ([Report_Id], [Patient_Id], [Doctor_Id], [Type], [Description], [CreateDate]) VALUES (2, 11, 6, N'other', N'This is a sample report.', N'May 16 2023 10:47AM')
INSERT [dbo].[T_Report] ([Report_Id], [Patient_Id], [Doctor_Id], [Type], [Description], [CreateDate]) VALUES (3, 9, 7, N'other', N'This is a sample report.', N'May 16 2023 10:47AM')
INSERT [dbo].[T_Report] ([Report_Id], [Patient_Id], [Doctor_Id], [Type], [Description], [CreateDate]) VALUES (4, 1, 2, N'other', N'This is a sample report.', N'May 16 2023 10:47AM')
INSERT [dbo].[T_Report] ([Report_Id], [Patient_Id], [Doctor_Id], [Type], [Description], [CreateDate]) VALUES (5, 7, 5, N'other', N'This is a sample report.', N'May 16 2023 10:47AM')
INSERT [dbo].[T_Report] ([Report_Id], [Patient_Id], [Doctor_Id], [Type], [Description], [CreateDate]) VALUES (6, 11, 6, N'other', N'This is a sample report.', N'May 16 2023 10:47AM')
SET IDENTITY_INSERT [dbo].[T_Report] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Settings] ON 

INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (1, N'system_name', N'Hospital Management System', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (2, N'system_name', N'Hospital Management System', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (3, N'system_email', N'hmsciproject@mail.com', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (4, N'system_title', N'Hospital Management System', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (5, N'address', N'177 Blecker Street', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (6, N'phone', N'36977785444', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (7, N'paypal_email', N'paypal@paypol.com', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
INSERT [dbo].[T_Settings] ([Settings_Id], [Type], [Description], [CreateDate], [UpdateDate]) VALUES (8, N'currency', N'USD', N'May 14 2023  7:07PM', N'May 14 2023  7:07PM')
SET IDENTITY_INSERT [dbo].[T_Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[T_SubMenu] ON 

INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (1, 1, N'User', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (2, 1, N'Role', N'/Dash/Role', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (3, 1, N'User2', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (4, 3, N'Manufacture', N'/Doctor/Manufacture/Manufacture_Setting', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (5, 3, N'Doctor 2', N'/Doctor/Manufacture/Manufacture_Setting', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (6, 3, N'Doctor 3', N'/Doctor/Manufacture/Manufacture_Setting', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (7, 3, N'Doctor 4', N'/Doctor/Manufacture/Manufacture_Setting', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (8, 3, N'Doctor 5', N'/Doctor/Manufacture/Manufacture_Setting', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (9, 7, N'Pharmacist 1', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (10, 7, N'Pharmacist 2', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (11, 7, N'Pharmacist 3', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (12, 7, N'Pharmacist 4', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (13, 7, N'Pharmacist 5', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (14, 4, N'Patient', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (15, 5, N'Nurse', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (16, 9, N'Role User', N'/Setting/SettingRoleUser', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (17, 9, N'Settings 1', N'/Setting/Services/SettingPriceServices', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (18, 9, N'Price Services', N'/Setting/Services/SettingPriceServices', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (19, 9, N'Settings 1', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (20, 9, N'Settings 1', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (21, 9, N'Settings 1', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (22, 8, N'Medicine', N'/Report/Medicine/MedicineReport', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (23, 8, N'Report', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (24, 8, N'Report', N'/Login/User', N'2023-04-10 07:06:25 ', NULL)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (25, 0, N'User Edit', N'/Login/User', N'2023-04-10 07:06:25 ', 1)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (26, 0, N'User Test', N'/Login/User', N'2023-04-10 07:06:25 ', 1)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (27, 0, N'User 1New', N'/Login/User', N'2023-04-10 07:06:25 ', 25)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (28, 0, N'Settings 1.1', N'/Login/User', N'2023-04-10 07:06:25 ', 16)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (29, 0, N'Settings 1.2', N'/Login/User', N'2023-04-10 07:06:25 ', 16)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (30, 0, N'Settings 1.3', N'/Login/User', N'2023-04-10 07:06:25 ', 16)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (32, 0, N'Pharmacist 5.1', N'/Login/User', N'2023-04-10 07:06:25 ', 13)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (33, 0, N'Pharmacist 5.2', N'/Login/User', N'2023-04-10 07:06:25 ', 13)
INSERT [dbo].[T_SubMenu] ([Id], [ParentID], [Name], [Url], [CreateDate], [ChildID]) VALUES (34, 0, N'Pharmacist 5.2.1', N'/Login/User', N'2023-04-10 07:06:25 ', 32)
SET IDENTITY_INSERT [dbo].[T_SubMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[TableChatFriend] ON 

INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (1, N'00001               ', N'00002               ', 0, N'20221223', N'20221223')
INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (2, N'00001               ', N'00003               ', 0, N'20221223', N'20221223')
INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (3, N'00001               ', N'00004               ', 0, N'20221223', N'20221223')
INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (4, N'00001               ', N'00005               ', 0, N'20221223', N'20221223')
INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (5, N'00002               ', N'00001               ', 0, N'20221223', N'20221223')
INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (6, N'00002               ', N'00003               ', 0, N'20221223', N'20221223')
INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (7, N'00002               ', N'00004               ', 0, N'20221223', N'20221223')
INSERT [dbo].[TableChatFriend] ([id], [UserID], [IDFriend], [Status], [CreateDate], [UpdateDate]) VALUES (8, N'00003               ', N'00001               ', 0, N'20221223', N'20221223')
SET IDENTITY_INSERT [dbo].[TableChatFriend] OFF
GO
SET IDENTITY_INSERT [dbo].[TableStatusChatUser] ON 

INSERT [dbo].[TableStatusChatUser] ([ID], [UserID], [Status], [TimeOnline], [FlagsDiv], [CreateDate], [UpdateDate]) VALUES (1, N'00001               ', 0, N'10        ', 0, N'20221223  ', N'20221223  ')
INSERT [dbo].[TableStatusChatUser] ([ID], [UserID], [Status], [TimeOnline], [FlagsDiv], [CreateDate], [UpdateDate]) VALUES (2, N'00002               ', 0, N'10        ', 0, N'20221223  ', N'20221223  ')
INSERT [dbo].[TableStatusChatUser] ([ID], [UserID], [Status], [TimeOnline], [FlagsDiv], [CreateDate], [UpdateDate]) VALUES (3, N'00003               ', 0, N'10        ', 0, N'20221223  ', N'20221223  ')
INSERT [dbo].[TableStatusChatUser] ([ID], [UserID], [Status], [TimeOnline], [FlagsDiv], [CreateDate], [UpdateDate]) VALUES (4, N'00004               ', 0, N'10        ', 0, N'20221223  ', N'20221223  ')
INSERT [dbo].[TableStatusChatUser] ([ID], [UserID], [Status], [TimeOnline], [FlagsDiv], [CreateDate], [UpdateDate]) VALUES (5, N'00005               ', 0, N'10        ', 0, N'20221223  ', N'20221223  ')
SET IDENTITY_INSERT [dbo].[TableStatusChatUser] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([id], [UserID], [UserName], [Password], [Image], [LoginFailTimes], [PassReissueKey], [DeleteDiv], [Email], [Role], [Phone], [Address]) VALUES (4, N'00001', N'Ahihi', N'FX3GMX2LQjVfWYaoXBjkuquRkB6PoxxTLAsiWoxUVuQ=                ', N'avatar.png', 0, N'1234                                                        ', 0, N'lequangtrinh0811@gmail.com', N'Admin', N'0903545421', N'71/34 nguyen cong hoan')
INSERT [dbo].[UserLogin] ([id], [UserID], [UserName], [Password], [Image], [LoginFailTimes], [PassReissueKey], [DeleteDiv], [Email], [Role], [Phone], [Address]) VALUES (5, N'00002', N'Ahihi1', N'$2a$08$/XHNMhdeAxrSE5Yg9OvA9uRwcE0cI8Rp7EY4dtwOjOV9XVVdIe64e', N'avatar.png', 0, N'1234                                                        ', 0, N'lequangtrinh0811@gmail.com', N'Admin', N'0903545421', N'71/34 nguyen cong hoan')
INSERT [dbo].[UserLogin] ([id], [UserID], [UserName], [Password], [Image], [LoginFailTimes], [PassReissueKey], [DeleteDiv], [Email], [Role], [Phone], [Address]) VALUES (6, N'00003', N'TrinhLQ', N'$2a$08$/XHNMhdeAxrSE5Yg9OvA9uRwcE0cI8Rp7EY4dtwOjOV9XVVdIe64e', N'apple-icon.png', 0, N'1234                                                        ', 0, N'lequangtrinh0811@gmail.com', N'User', N'0903545421', N'71/34 nguyen cong hoan')
INSERT [dbo].[UserLogin] ([id], [UserID], [UserName], [Password], [Image], [LoginFailTimes], [PassReissueKey], [DeleteDiv], [Email], [Role], [Phone], [Address]) VALUES (7, N'00004', N'TrinhLQ1', N'$2a$08$/XHNMhdeAxrSE5Yg9OvA9uRwcE0cI8Rp7EY4dtwOjOV9XVVdIe64e', N'bruce-mars.jpg', 0, N'1234                                                        ', 0, N'lequangtrinh0811@gmail.com', N'User', N'0903545421', N'71/34 nguyen cong hoan')
INSERT [dbo].[UserLogin] ([id], [UserID], [UserName], [Password], [Image], [LoginFailTimes], [PassReissueKey], [DeleteDiv], [Email], [Role], [Phone], [Address]) VALUES (8, N'00005', N'TrinhLQ2', N'$2a$08$/XHNMhdeAxrSE5Yg9OvA9uRwcE0cI8Rp7EY4dtwOjOV9XVVdIe64e', N'logo-ct.jpg', 0, N'1234                                                        ', 0, N'lequangtrinh0811@gmail.com', N'User', N'0903545421', N'71/34 nguyen cong hoan')
INSERT [dbo].[UserLogin] ([id], [UserID], [UserName], [Password], [Image], [LoginFailTimes], [PassReissueKey], [DeleteDiv], [Email], [Role], [Phone], [Address]) VALUES (9, N'00006', N'TrinhLQ3', N'$2a$08$/XHNMhdeAxrSE5Yg9OvA9uRwcE0cI8Rp7EY4dtwOjOV9XVVdIe64e', N'logo-ct.jpg', 0, N'1234                                                        ', 0, N'lequangtrinh0811@gmail.com', N'User', N'0903545421', N'71/34 nguyen cong hoancong hoan')
INSERT [dbo].[UserLogin] ([id], [UserID], [UserName], [Password], [Image], [LoginFailTimes], [PassReissueKey], [DeleteDiv], [Email], [Role], [Phone], [Address]) VALUES (10, N'00007', N'TrinhLQ4', N'$2a$08$/XHNMhdeAxrSE5Yg9OvA9uRwcE0cI8Rp7EY4dtwOjOV9XVVdIe64e', N'logo-ct.jpg', 0, N'1234                                                        ', 0, N'lequangtrinh0811@gmail.com', N'User', N'0903545421', N'71/34 nguyen cong hoan')
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_CheckLoginUser]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YYY_sp_CheckLoginUser]
@UserID NVARCHAR(20)
AS
BEGIN
DECLARE @SetLogin INT;
SET @SetLogin =(SELECT COUNT(*) FROM UserLogin
WHERE	UserID			=	@UserID 
  AND	LoginFailTimes	<=	10);
	IF @SetLogin = 0
		BEGIN
		UPDATE UserLogin 
		SET LoginFailTimes=(CAST((SELECT LoginFailTimes 
								FROM	UserLogin
								WHERE	UserID			=	@UserID ) AS INT)+1)
		WHERE	UserID			=	@UserID 
		END
	ELSE
		BEGIN
		SELECT * 
		FROM UserLogin
		 WHERE	UserID			=	@UserID 
		END 
END

GO
/****** Object:  StoredProcedure [dbo].[yyy_sp_CountHeardDashBoard]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yyy_sp_CountHeardDashBoard]
AS
BEGIN
  DECLARE @APPOINTMENT_COUNT	INT ,
		  @DOCTOR_COUNT			INT,
		  @PATIENT_COUNT		INT ,
		  @PRESCRIPTION_COUNT	INT
	SET NOCOUNT ON
	SET @DOCTOR_COUNT		=	(SELECT COUNT(*) 
								 FROM	T_Doctor 
								 WHERE	Flag	=	0);
	SET @PATIENT_COUNT		=	(SELECT COUNT(*) 
								 FROM	T_Patient
								 WHERE	Flag	=	0);
	SET @APPOINTMENT_COUNT	=	(SELECT COUNT(*) 
								 FROM	T_Appointment
								 WHERE	Flag	=	0);
	SET @PRESCRIPTION_COUNT	=	(SELECT COUNT(*) 
								 FROM	T_Prescription 
								 WHERE	Flag	=	0);
	SELECT @APPOINTMENT_COUNT	AS	APPOINTMENT_COUNT
		  ,@DOCTOR_COUNT		AS	DOCTOR_COUNT
		  ,@PATIENT_COUNT		AS	PATIENT_COUNT
		  ,@PRESCRIPTION_COUNT	AS	PRESCRIPTION_COUNT

END;	  
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_InsertUser]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[YYY_sp_InsertUser]
@UserID NVARCHAR(20),
@UserName NVARCHAR(20)
,@Password NVARCHAR(MAX)
,@Image NVARCHAR(200)
,@PassReissueKey NVARCHAR(20)
,@Email NVARCHAR(100)
,@Role NVARCHAR(20)
AS
BEGIN
INSERT INTO UserLogin ([UserID]
					   ,[UserName]
					   ,[Password]
					   ,[Image]
					   ,[LoginFailTimes]
					   ,[PassReissueKey]
					   ,[DeleteDiv]
					   ,[Email]
					   ,[Role])
VALUES (@UserID
,@UserName
,@Password
,@Image
,0
,@PassReissueKey
,0
,@Email
,@Role);
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_InstUpMessagesUser]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[YYY_sp_InstUpMessagesUser]
  @UserID       NVARCHAR(20),
  @UserIDTo		NVARCHAR(20),
  @ValueMess	NVARCHAR(300),
  @CreateDate	NVARCHAR(20),
  @UpdateDate	NVARCHAR(20)
AS
BEGIN
DECLARE @CountUser INT
SET @CountUser=(SELECT IIF((SELECT COUNT(*) 
FROM TableChat
WHERE UserID	=	@UserID
AND UserIDTo	=	@UserIDTo
AND FlagsDiv	=	0)<>0,1,IIF((SELECT COUNT(*) 
							FROM TableChat
							WHERE UserID	=	@UserIDTo
							AND UserIDTo	=	@UserID
							AND FlagsDiv	=	0)<>0,1,0)));
IF @CountUser=0
	BEGIN
		INSERT INTO TableChat ([UserID]
								,[UserIDTo]
								,[ValueMess]
								,[CreateDate]
								,[UpdateDate]
								,[FlagsDiv])
		VALUES (@UserID
		,@UserIDTo
		,@ValueMess
		,@CreateDate
		,@UpdateDate
		,0);
		INSERT INTO TableChat ([UserID]
								,[UserIDTo]
								,[ValueMess]
								,[CreateDate]
								,[UpdateDate]
								,[FlagsDiv])
		VALUES (@UserIDTo
		,@UserID
		,@ValueMess
		,@CreateDate
		,@UpdateDate
		,0);
	END 
ELSE
	BEGIN
		UPDATE TableChat
		SET UpdateDate	=	@UpdateDate
			,ValueMess	=	@ValueMess
		WHERE UserID	=	@UserID
		AND UserIDTo	=	@UserIDTo
		AND FlagsDiv	=	0 

		UPDATE TableChat
		SET UpdateDate	=	@UpdateDate
			,ValueMess	=	@ValueMess
		WHERE UserID	=	@UserIDTo
		AND UserIDTo	=	@UserID
		AND FlagsDiv	=	0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_Load_PriceServicesId]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YYY_sp_Load_PriceServicesId]
@CodeServices Nvarchar(12)
AS
BEGIN
SET NOCOUNT ON
SELECT *
FROM T_PriceServices
WHERE	Flags=1
  And	CodeServices=@CodeServices
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_Load_T_PriceServices]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YYY_sp_Load_T_PriceServices]
@UserID Nvarchar(20)
AS
BEGIN
SELECT T_PriceServices.id
		,Name     
		,Price	 
		,Images	 
		,TRIM(UpdateDate) as UpdateDate
		,UserLogin.Image as ImageUser
		,UserLogin.UserName
FROM T_PriceServices
JOIN UserLogin
ON
UserLogin.UserID	=	T_PriceServices.UserUpdate
AND UserLogin.DeleteDiv=0
WHERE Flags=1
AND ((@UserID IS NOT NULL AND @UserID <> '' AND T_PriceServices.UserUpdate = N''+ TRIM(@UserID)) 
  	OR
  	(@UserID IS NULL OR @UserID = '')) 
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_LoadDashboard]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[YYY_sp_LoadDashboard]
@UserID NVARCHAR(20)
AS
BEGIN
SELECT * FROM TabelMenu
WHERE userID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[yyy_sp_LoadData_Medicine]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yyy_sp_LoadData_Medicine]
AS
BEGIN
SET NOCOUNT ON
	SELECT	T_Medicine .*
			,T_Medicine_Category.Name
  FROM	T_Medicine
  LEFT JOIN	T_Medicine_Category
	ON	T_Medicine.Medicine_Category_Id	=	T_Medicine_Category.Medicine_Category_Id
  WHERE	T_Medicine.Flag	=	0;
END;	  
GO
/****** Object:  StoredProcedure [dbo].[yyy_sp_LoadData_Medicine_Category]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[yyy_sp_LoadData_Medicine_Category]
AS
BEGIN
SET NOCOUNT ON
	SELECT *
	FROM [T_Medicine_Category] 
	WHERE Flag=0;
END;	  
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_LoadDataChatUsers]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YYY_sp_LoadDataChatUsers]
@UserID NVARCHAR(20),
@UserIDTo NVARCHAR(20)
AS
BEGIN
SELECT Top(1)*
FROM TableChat
WHERE UserID	=	TRIM(@UserID)
  AND UserIDTo	=	TRIM(@UserIDTo)
  AND FlagsDiv	=	0
ORDER BY CreateDate
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_LoadDataFriendChat]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YYY_sp_LoadDataFriendChat]
@UserID NVARCHAR(20)
AS
BEGIN
SELECT *
FROM TableChatFriend		AS	ChatFriend
jOIN TableStatusChatUser	AS	ChatUser
  ON ChatUser.UserID		=	@UserID
 AND  ChatUser.[Status]		=	0
JOIN  UserLogin
  ON  UserLogin.UserID		=	ChatFriend.IDFriend
 AND  DeleteDiv				=	0
WHERE ChatFriend.UserID		=	@UserID
  AND ChatFriend.[Status]	=	0;
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_LoadMenu]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YYY_sp_LoadMenu]
AS
SET NOCOUNT ON
BEGIN
SELECT	ParentID
		,T_SubMenu.id
		,Name
		,Url
		,T_Menu.ParentName
		,T_Menu.Images
		,T_Menu.id as idMenu
INTO #T_ChildMenu
FROM T_SubMenu
JOIN T_Menu
ON T_SubMenu.ParentID=T_Menu.id

SELECT DISTINCT idMenu
	,ParentName 
	,Images
INTO #T_ChildMenu1
FROM #T_ChildMenu

SELECT	ParentName
		,Images
		, STUFF((SELECT ','+#T_ChildMenu.Name ,':'+#T_ChildMenu.Url
		                             FROM #T_ChildMenu
		                             WHERE #T_ChildMenu1.idMenu	=	#T_ChildMenu.ParentID
		                            FOR XML PATH('')), 1, 1, '') AS MenuName 
		, STUFF((SELECT ','+CAST(#T_ChildMenu.id AS NVARCHAR(20))
                             FROM #T_ChildMenu
                             WHERE #T_ChildMenu1.idMenu	=	#T_ChildMenu.ParentID
                            FOR XML PATH('')), 1, 1, '') AS MenuID
FROM #T_ChildMenu1

DROP TABLE #T_ChildMenu1
DROP TABLE #T_ChildMenu
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_LoadSubMenu]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YYY_sp_LoadSubMenu]
AS
SET NOCOUNT ON
BEGIN
WITH SubMenu(id, [Name], [Url],ParentID ,ChildID,Level)
        as (
                Select	id
						, [Name]
						, [Url]
						,ChildID
						,ParentID
						,Level=0
                FROM T_SubMenu
                WHERE ParentID <>0
                UNION All
                SELECT	b.id
						, b.[Name]
						, a.[Url]
						,b.ChildID
						,a.ParentID
				,Level +1
                FROM SubMenu as a, T_SubMenu as b
                WHERE a.id = b.[ChildID]
        )
        SELECT id, [Name], [Url],ISNULL(ParentID,0) AS ParentID,ISNULL(ChildID,0) AS ChildID,Level
        FROM SubMenu
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_LoadUsers]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[YYY_sp_LoadUsers]
@UserID NVARCHAR(20)
AS
BEGIN
SET NOCOUNT ON
	SELECT * 
	FROM UserLogin
	WHERE	DeleteDiv		=0
	AND ((@UserID IS NOT NULL AND @UserID <> '' AND UserLogin.UserID = N''+ TRIM(@UserID)) 
  	OR
  	(@UserID IS NULL OR @UserID = '')) 
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_UpdateInfoUser]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[YYY_sp_UpdateInfoUser]
@UserID NVARCHAR(20),
@UserName NVARCHAR(20)
,@Password NVARCHAR(MAX)
,@Image NVARCHAR(200)
,@Email NVARCHAR(100)
,@Role NVARCHAR(20)
AS
BEGIN
UPDATE UserLogin 
SET						[UserName]=@UserName
					   ,[Password]=@Password
					   ,[Image]=@Image
					   ,[Email]=@Email
					   ,[Role]=@Role
WHERE UserID=@UserID
AND DeleteDiv=0;
END
GO
/****** Object:  StoredProcedure [dbo].[YYY_sp_UpdateInfoUserLgoinFailed]    Script Date: 25/5/2023 17:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[YYY_sp_UpdateInfoUserLgoinFailed]
@UserID NVARCHAR(20)
AS
BEGIN
UPDATE UserLogin 
SET						LoginFailTimes=(CAST((SELECT COUNT(*)
						FROM UserLogin
						WHERE UserID=@UserID
						AND DeleteDiv=0)AS INT) +1)
WHERE UserID=@UserID
AND DeleteDiv=0;
END
GO
USE [master]
GO
ALTER DATABASE [DBTrinh] SET  READ_WRITE 
GO
