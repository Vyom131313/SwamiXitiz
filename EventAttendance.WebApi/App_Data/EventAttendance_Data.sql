USE [EventAttendance]
GO
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSchedule]'))
ALTER TABLE [dbo].[EventSchedule] DROP CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendee]'))
ALTER TABLE [dbo].[Attendee] DROP CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_EventSchedule]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_Attendee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_EventSchedule]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendance_IsAttended]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [DF_Attendance_IsAttended]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendance_CreatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [DF_Attendance_CreatedOn]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendance_ModifiedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [DF_Attendance_ModifiedOn]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attendance]') AND type in (N'U'))
DROP TABLE [dbo].[Attendance]
GO
/****** Object:  Table [dbo].[Attendee]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendee]'))
ALTER TABLE [dbo].[Attendee] DROP CONSTRAINT [FK_Attendee_Zone]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendee_IsKaryakar]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Attendee] DROP CONSTRAINT [DF_Attendee_IsKaryakar]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attendee]') AND type in (N'U'))
DROP TABLE [dbo].[Attendee]
GO
/****** Object:  Table [dbo].[EventSchedule]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSchedule]'))
ALTER TABLE [dbo].[EventSchedule] DROP CONSTRAINT [FK_EventSchedule_Event]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_EventSchedule_IsFreezed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EventSchedule] DROP CONSTRAINT [DF_EventSchedule_IsFreezed]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[EventSchedule]
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zone]') AND type in (N'U'))
DROP TABLE [dbo].[Zone]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 02/09/2017 21:18:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
DROP TABLE [dbo].[Event]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 02/09/2017 21:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON
INSERT [dbo].[Event] ([Id], [Name]) VALUES (1, N'Ravi Sabha')
SET IDENTITY_INSERT [dbo].[Event] OFF
/****** Object:  Table [dbo].[Zone]    Script Date: 02/09/2017 21:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Zone](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Zone] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Zone] ON
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (1, N'Albermarle')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (2, N'East Charlotte')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (3, N'Fort Mill')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (4, N'Gastonia')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (5, N'Hickory')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (6, N'Lancaster')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (7, N'North Charlotte')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (8, N'Other')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (9, N'Rockhill')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (10, N'Salisbury')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (11, N'South Charlotte')
SET IDENTITY_INSERT [dbo].[Zone] OFF
/****** Object:  Table [dbo].[EventSchedule]    Script Date: 02/09/2017 21:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSchedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[EventDate] [date] NOT NULL,
	[IsFreezed] [bit] NOT NULL CONSTRAINT [DF_EventSchedule_IsFreezed]  DEFAULT ((0)),
 CONSTRAINT [PK_EventSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EventSchedule] ON
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (1, 1, CAST(0x493C0B00 AS Date), 1)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (2, 1, CAST(0x503C0B00 AS Date), 1)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (3, 1, CAST(0x573C0B00 AS Date), 1)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (4, 1, CAST(0x5E3C0B00 AS Date), 1)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (5, 1, CAST(0x653C0B00 AS Date), 1)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (6, 1, CAST(0x6C3C0B00 AS Date), 1)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (7, 1, CAST(0x733C0B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[EventSchedule] OFF
/****** Object:  Table [dbo].[Attendee]    Script Date: 02/09/2017 21:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attendee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attendee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Address] [varchar](500) NULL,
	[Karyakar] [varchar](50) NULL,
	[ZoneName] [varchar](50) NULL,
	[IsKaryakar] [bit] NOT NULL CONSTRAINT [DF_Attendee_IsKaryakar]  DEFAULT ((0)),
	[ZoneId] [int] NULL,
 CONSTRAINT [PK_Attendee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Attendee] ON
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (1, N'Aarjav', N'Patel', N'M', N'6827 Creft Cir', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (2, N'Abhi', N'Patel', N'M', N'1918 8th St SE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (3, N'Ajay', N'Patel', N'M', N'8767 Savannah Rd', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (4, N'Ajay', N'Patel', N'M', N'280 Indian Trl', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (5, N'Ajay', N'Patel', N'M', N'302 Salem Rd', N'No', N'Other', 0, 8)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (6, N'Akash', N'Patel', N'M', N'2011 Apogee Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (7, N'Aksh', N'Patel', N'M', N'2766 Lake Wylie Dr', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (8, N'Akshar', N'Gajjar', N'M', N'8731 Darcy Hopkins Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (9, N'Akshar', N'Patel', N'M', N'1719 Funny Cide Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (10, N'Akshar', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (11, N'Akshar', N'Patel', N'M', N'2508 Highland Park Dr', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (12, N'Alpesh', N'Patel', N'M', N'7318 Timberneck Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (13, N'Aman', N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (14, N'Ambalal', N'Patel', N'M', N'4110 Shasta Cir', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (15, N'Amit', N'Patel', N'M', N'110 Stone Ridge Dr', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (16, N'Anil', N'Patel', N'M', N'325 US Highway 70 SW', N'Yes', N'Hickory', 1, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (17, N'Anil', N'Patel', N'M', N'132 W Main St', N'No', N'Salisbury', 0, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (18, N'Anil', N'Patel', N'M', N'5892 Bakers Pt', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (19, N'Ankit', N'Babariya', N'M', N'8525 Dahlia Dr Apt 207', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (20, N'Ankit', N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (21, N'Ankit', N'Kumbhani', N'M', N'8209 University Ridge Dr, apt # 107', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (22, N'Ankur', N'Patel', N'M', N'17123 Westmill Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (23, N'APUR', N'KAMDAR', N'M', N'6405 STONE RIDGE CT', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (24, N'Arvind', N'Patel', N'M', N'1209 Kent Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (25, N'Arvind', N'Patel', N'M', N'2718 Gastonia Dallas Hwy', N'Yes', N'Gastonia', 1, 4)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (26, N'Ashish', N'Patel', N'M', N'1236 Kent Dr', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (27, N'Ashish', N'Patel', N'M', N'2508 Highland Park Dr', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (28, N'Ashok', N'Patel', N'M', N'9607 Springholm Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (29, N'Ashok', N'Patel', N'M', N'2413 Arden Gate Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (30, N'Ashok', N'Patel', N'M', N'6085 Creekview Ct', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (31, N'Ashok', N'Patel', N'M', N'9607 Springholn Dr', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (32, N'Asit', N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (33, N'Atul', N'Patel', N'M', N'121 Peoria Ln', N'No', N'Gastonia', 0, 4)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (34, N'Atul', N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (35, N'Atul', N'Patel', N'M', N'1040 Conestoga Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (36, N'Babu', N'Patel', N'M', N'11925 Southcrest Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (37, N'Badal', N'Patel', N'M', N'413 College Dr', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (38, N'Baldev', N'Patel', N'M', N'17416 Campbell Hall Ct', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (39, N'Bhalchandra', N'Patel', N'M', N'1983 8th St SE', N'Yes', N'Hickory', 1, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (40, N'Bharat', N'Parmar', N'M', N'2312 US Highway 52 N', N'Yes', N'Albermarle', 1, 1)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (41, N'Bharat', N'Patel', N'M', N'1213 Kent Dr', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (42, N'Bharat', N'Patel', N'M', N'1201 Highway 9 Byp W', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (43, N'Bhavesh', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (44, N'Bhavin', N'Patel', N'M', N'599 Cranborne Chase', N'No', N'Fort Mill', 0, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (45, N'Bholabhai', N'Patel', N'M', N'2800 Foxwood Rd', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (46, N'Bhowmik', N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (47, N'Bhupendra', N'Patel', N'M', N'3730 US Highway 601', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (48, N'Bhupesh', N'Patel', N'M', N'19408 Fridley Ln', N'No', N'Other', 0, 8)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (49, N'Bipin', N'Patel', N'M', N'2525 Lawyers Rd W', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (50, N'Bipin', N'Patel', N'M', N'5891 Bakers Pt', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (51, N'Chandrakant', N'Gajjar', N'M', N'3821 Trappers Run Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (52, N'Chandrakant', N'Suthar', N'M', N'10465 Stokeshill Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (53, N'Chandrakant', N'Suthar', N'M', N'15739 Greythorne Dr. Apt#103', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (54, N'Chandresh', N'Patel', N'M', N'1719 Funny Cide Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (55, N'Chandrika', N'Patel', N'M', N'1040 Conestoga Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (56, N'Chandu', N'Patel', N'M', N'7413 Chital Rd', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (57, N'Chandu', N'Patel', N'M', N'360 Ivy Park Ln', N'No', N'Salisbury', 0, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (58, N'Chetan', N'Desai', N'M', N'2911 Bridle Brook Way', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (59, N'Chiman', N'Patel', N'M', N'8801 Darcy Hopkins Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (60, N'Daksh', N'Desai', N'M', N'2911 Bridle Brook Way', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (61, N'Damukaka', N'Patel', N'M', N'200 Henson St', N'No', N'Albermarle', 0, 1)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (62, N'Darshan', N'Patel', N'M', N'8347 Marigold Pl', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (63, N'Dasharath', N'Patel', N'M', N'5444 Allison Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (64, N'Dev', N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (65, N'Devan', N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (66, N'Dharmendra', N'Patel', N'M', N'4864 Annelise Dr', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (67, N'Dilip', N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (68, N'Dilip', N'Patel', N'M', N'6406 Derby Way', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (69, N'Dilip', N'Patel', N'M', N'1125 Boxelder Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (70, N'Dinesh', N'Patel', N'M', N'6235 Hermsley Rd', N'Yes', N'Fort Mill', 1, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (71, N'DIP', N'PATEL', N'M', N'234 S Main St', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (72, N'Divyesh', N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (73, N'Drupad', N'Patel', N'M', N'9424 Autumn Applause Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (74, N'Dushyant', N'Gajjar', N'M', N'4029 Raccoon Run Ct', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (75, N'Fatehsinh', N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (76, N'Gautam', N'Mansinghka', N'M', N'11005 Sedgemoor Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (77, N'Gautam', N'Patel', N'M', N'3600 Mooreland Farms Rd', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (78, N'Ghanshyam', N'Patel', N'M', N'12303 Summer Breeze Ct', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (79, N'Ghanshyam', N'Patel', N'M', N'117 Lily Green Ct NW', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (80, N'Ghanshyam', N'Patel', N'M', N'1516 Concord Pkwy N', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (81, N'Girish', N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (82, N'Girish', N'Patel', N'M', N'7149 Cobden Ln', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (83, N'Hari', N'Parmar', N'M', N'9500 Marsena Ct', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (84, N'Harikrishna', N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (85, N'Harikrishna', N'Patel', N'M', N'1213 Kent Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (86, N'Harish', N'Patel', N'M', N'625 Beauhaven Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (87, N'Harshad', N'Patel', N'M', N'9620 Puddle Duck Rd Apt 305', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (88, N'Harshadbhai', N'Patel', N'M', N'1391 Charlotte Hwy', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (89, N'Hasmukh', N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (90, N'Hemal', N'Patadia', N'M', N'8209 Univrsty Rdge Dr Apt 107', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (91, N'Hemant', N'Gajjar', N'M', N'8731 Darcy Hopkins Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (92, N'Hemant', N'Patel', N'M', N'10742 Derryrush Dr', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (93, N'Himanshu', N'Patel', N'M', N'1204 Somerset Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (94, N'Himanshu', N'Patel', N'M', N'2912 Parkway Blvd', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (95, N'Hiren', N'Patel', N'M', N'4011 Ainsdale Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (96, N'Hiren', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (97, N'Hiren', N'Patel', N'M', N'1125 Boxelder Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (98, N'Indrasinh', N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (99, N'Jagat', N'Patel', N'M', N'12552 Druids Glen Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (100, N'Jagdish', N'Patel', N'M', N'1816 Damascus St', N'Yes', N'North Charlotte', 1, 7)
GO
print 'Processed 100 total records'
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (101, N'Jagdish', N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (102, N'Jagdish', N'Patel', N'M', N'2013 Gloucester St', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (103, N'Jai', N'Patel', N'M', N'7318 Timberneck Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (104, N'Jainith', N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (105, N'Janak', N'Amin', N'M', N'1395 Charlotte Hwy', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (106, N'Janu', N'Patel', N'M', N'1236 Kent Dr', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (107, N'Jash', N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (108, N'Jay', N'Parmar', N'M', N'14952 Havasu St', N'No', N'Fort Mill', 0, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (109, N'Jay', N'Patel', N'M', N'599 Cranborne Chase', N'No', N'Fort Mill', 0, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (110, N'Jayan', N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (111, N'Jayant', N'Patel', N'M', N'200 Henson St', N'Yes', N'Albermarle', 1, 1)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (112, N'Jayant', N'Patel', N'M', N'9725 Capella Ave NW', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (113, N'Jayantibhai', N'Patel', N'M', N'1909 Wexford Meadows Ln Apt H', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (114, N'Jayantilal', N'Panara', N'M', N'9123 Royal Highlands Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (115, N'Jayantilal', N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (116, N'Jayendra', N'Darji', N'M', N'7307 Brigmore Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (117, N'Jayendra', N'Patel', N'M', N'13410 Mallard Lake Rd', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (118, N'Jayesh', N'Patel', N'M', N'439 Anvil Draw Pl', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (119, N'Jeet', N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (120, N'Jeet', N'Patel', N'M', N'3730 US Highway 601', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (121, N'Jeram', N'Patel', N'M', N'1003 Garden Rose Ct', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (122, N'Jigar', N'Patel', N'M', N'14044 Lissadell Cir', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (123, N'Jigna', N'Patel', N'M', N'4613 9th St NE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (124, N'Jimmy', N'Patel', N'M', N'5001 Oxfordshire Rd', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (125, N'Jitendra', N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (126, N'Jyotindra', N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (127, N'Jyotish', N'Patel', N'M', N'1862 Gingercake Cir', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (128, N'Kalpesh', N'Ram', N'M', N'925 Bendix Dr', N'No', N'Salisbury', 0, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (129, N'Kamlesh', N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (130, N'Kamlesh', N'Patel', N'M', N'1946 9th Street Pl SE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (131, N'Kanji', N'Ram', N'M', N'925 Bendix Dr', N'No', N'Salisbury', 0, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (132, N'Kanu', N'Patel', N'M', N'11214 Sedgemoor Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (133, N'Kaushik', N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (134, N'Kaushik', N'Patel', N'M', N'17123 Westmill Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (135, N'Ketan', N'Suthar', N'M', N'15739 Greythorne Dr. Apt#103', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (136, N'Ketu', N'Patel', N'M', N'6235 Hermsley Rd', N'No', N'Fort Mill', 0, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (137, N'Kinal', N'Patel', N'M', N'1918 8th St SE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (138, N'Kirit', N'Parmar', N'M', N'9406 Vera Jones Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (139, N'Kirit', N'Patel', N'M', N'7903 Hereford St', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (140, N'Kiron', N'Patel', N'M', N'4330 Old Interstate Rd', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (141, N'Kirtan', N'Patel', N'M', N'9217 Unbridle Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (142, N'Kirtan', N'Patel', N'M', N'1983 8th St SE', N'Yes', N'Hickory', 1, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (143, N'Kirti', N'Parmar', N'M', N'14952 Havasu St', N'Yes', N'Fort Mill', 1, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (144, N'Koki', N'Rathod', N'M', N'644 W Prospect Rd', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (145, N'Krishna', N'Rathod', N'M', N'644 W Prospect Rd', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (146, N'Krupa', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (147, N'Kush', N'Patel', N'M', N'7149 Cobden Ln', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (148, N'Laksh', N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (149, N'Lalita', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (150, N'Madhu', N'Patel', N'M', N'4110 Shasta Cir', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (151, N'Mahek', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (152, N'Mahendra', N'Brahmbhatt', N'M', N'5908 Hoover St', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (153, N'Mahendra', N'Patel', N'M', N'8767 Savannah Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (154, N'Mahendra', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', N'Rockhill', 1, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (155, N'Mahendra', N'Suthar', N'M', N'7015 Brighton Brook Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (156, N'Mahesh', N'Patel', N'M', N'303 N Maple St', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (157, N'Mahesh', N'Patel', N'M', N'17127 Westmill Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (158, N'Mahip', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (159, N'Manav', N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (160, N'Mangaldas', N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (161, N'Manoj', N'Patel', N'M', N'413 College Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (162, N'Mayur', N'Patel', N'M', N'818 20th Avenue Pl SE', N'Yes', N'Hickory', 1, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (163, N'Mayur', N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (164, N'Mayur', N'Patel', N'M', N'7903 Hereford St', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (165, N'Mayur', N'Patel', N'M', N'10838 Stone Bunker Dr', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (166, N'Mehul', N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (167, N'Mehul', N'Patel', N'M', N'1125 Boxelder Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (168, N'Mihir', N'Patel', N'M', N'1209 Kent Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (169, N'Milan', N'Patel', N'M', N'1516 Concord Pkwy N', N'No', N'Salisbury', 0, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (170, N'Mumukshu', N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (171, N'Nalin', N'Patel', N'M', N'6625 Rollingridge Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (172, N'Narendra', N'Patel', N'M', N'6217 Chavel Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (173, N'Natubhai', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (174, N'Natvar', N'Patel', N'M', N'1134 Jade Glen Dr', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (175, N'Natvarlal', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (176, N'Navin', N'Patel', N'M', N'3019 Ernest Russell Ct', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (177, N'Neeyal', N'Patel', N'M', N'17416 Campbell Hall Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (178, N'Nehal', N'Patel', N'M', N'10125 University Park Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (179, N'Nehal', N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (180, N'Neil', N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (181, N'Nikhil', N'Patel', N'M', N'9016 Tamarron Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (182, N'Nikul', N'Patel', N'M', N'6235 Hermsley Rd', N'No', N'Fort Mill', 0, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (183, N'Nilesh', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', N'Fort Mill', 1, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (184, N'Nilesh', N'Patel', N'M', N'10610 Bere Island Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (185, N'Nilesh', N'Shah', N'M', N'9946 Nicole Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (186, N'Nimesh', N'Patel', N'M', N'8623 Sedgeburn Dr', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (187, N'Nimesh', N'Patel', N'M', N'552 Fair Oaks Dr', N'Yes', N'Rockhill', 1, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (188, N'Niranjan', N'Patel', N'M', N'7301 Conifer Ct', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (189, N'Niranjan', N'Patel', N'M', N'638 Ridge St', N'Yes', N'Albermarle', 1, 1)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (190, N'Nishal', N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (191, N'Niyam', N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (192, N'Pankaj', N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (193, N'Param', N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (194, N'Paresh', N'Patel', N'M', N'1204 Somerset Dr', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (195, N'Paresh', N'Sutariya', N'M', N'10119 Oxford Landing Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (196, N'Parth', N'Patel', N'M', N'3275 Edgeland Hwy', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (197, N'Parth', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (198, N'Prabhudas', N'Darji', N'M', N'7307 Brigmore Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (199, N'Prabhudas', N'Patel', N'M', N'5815 Langwell Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (200, N'Prabodh', N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (201, N'PRADIP', N'PATEL', N'M', N'2721 Winnsboro Rd', N'No', N'East Charlotte', 0, 2)
GO
print 'Processed 200 total records'
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (202, N'Praful', N'Patel', N'M', N'8623 Sedgeburn Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (203, N'Pramit', N'Patel', N'M', N'6235 Hermsley Rd', N'No', N'Fort Mill', 0, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (204, N'Prashant', N'Parmar', N'M', N'9500 Marsena Ct', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (205, N'Prashant', N'Patel', N'M', N'6827 Creft Cir', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (206, N'Prashant', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (207, N'Pravin', N'Patel', N'M', N'1608 E Roosevelt Blvd', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (208, N'Pravin', N'Patel', N'M', N'5892 Bakers Pt', N'Yes', N'Hickory', 1, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (209, N'Pravin', N'Patel', N'M', N'302 Salem Rd', N'No', N'Other', 0, 8)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (210, N'Pravinchandra', N'Patel', N'M', N'305 Londonderry Dr', N'Yes', N'Other', 1, 8)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (211, N'Prayag', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (212, N'Preet', N'Patel', N'M', N'1918 8th St SE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (213, N'Preet', N'Patel', N'M', N'4613 9th St NE', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (214, N'Prem', N'Patel', N'M', N'325 US Highway 70 SW', N'No', N'Hickory', 0, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (215, N'Prem', N'Patel', N'M', N'132 W Main St', N'No', N'Salisbury', 0, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (216, N'Prit', N'Patel', N'M', N'1209 Kent Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (217, N'Pritash', N'Patel', N'M', N'3234 Devon Croft Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (218, N'Pritesh', N'Patel', N'M', N'3275 Edgeland Hwy', N'Yes', N'Rockhill', 1, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (219, N'Rahi', N'Patel', N'M', N'280 Indian Trl', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (220, N'Rahul', N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (221, N'Rahul', N'Shah', N'M', N'802 Pine Valley Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (222, N'Raj', N'Patel', N'M', N'1040 Conestoga Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (223, N'Rajan', N'Patel', N'M', N'2525 Lawyers Rd W', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (224, N'Rajendra', N'Patel', N'M', N'2005 Belleforest Ct', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (225, N'Rajesh', N'Patel', N'M', N'12902 Cleopatra Dr', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (226, N'Ramendra', N'Bhatt', N'M', N'806 Lee St', N'No', N'Gastonia', 0, 4)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (227, N'Ramesh', N'Patel', N'M', N'616 S Hampton St', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (228, N'Rashmi', N'Patel', N'M', N'3234 Devon Croft Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (229, N'Ravi', N'Patel', N'M', N'2011 Apogee Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (230, N'Rayan', N'Patel', N'M', N'4011 Ainsdale Dr', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (231, N'Ripal', N'Patel', N'M', N'1125 Boxelder Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (232, N'Rishabh', N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (233, N'Ronak', N'Patel', N'M', N'1391 Charlotte Hwy', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (234, N'Rupesh', N'Patel', N'M', N'1209 Kent Dr', N'Yes', N'Lancaster', 1, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (235, N'Rushi', N'Parekh', N'M', N'2521 Clare Olivia Dr Apt 203', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (236, N'Sachin', N'Devani', N'M', N'51 Astor Ct Apt 107', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (237, N'Sagar', N'Patel', N'M', N'17123 Westmill Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (238, N'Sagar', N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (239, N'Sahaj', N'Patel', N'M', N'599 Cranborne Chase', N'No', N'Fort Mill', 0, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (240, N'Sahil', N'Hira', N'M', N'138 Norman Station Blvd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (241, N'Sameer', N'Shah', N'M', N'802 Pine Valley Ct', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (242, N'Sandeep', N'Patil', N'M', N'7305 Hagen Ct Apt 1512', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (243, N'Sanjay', N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (244, N'Sanjay', N'Patel', N'M', N'4613 9th St NE', N'Yes', N'Hickory', 1, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (245, N'Sanjeet', N'Patel', N'M', N'2413 Arden Gate Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (246, N'Sarju', N'Patel', N'M', N'1983 8th St SE', N'Yes', N'Hickory', 1, 5)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (247, N'Satish', N'Patel', N'M', N'4101 Regency Dr', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (248, N'Satish', N'Patel', N'M', N'3730 US Highway 601', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (249, N'Saurin', N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (250, N'Sharad', N'Patel', N'M', N'9016 Tamarron Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (251, N'Shashikant', N'Patel', N'M', N'7149 Cobden Ln', N'No', N'East Charlotte', 0, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (252, N'Shilpesh', N'Patel', N'M', N'109 Country Club Dr', N'Yes', N'Other', 1, 8)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (253, N'Shiv', N'Patel', N'M', N'17127 Westmill Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (254, N'Shivang', N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (255, N'Shivangi', N'Patel', N'M', N'1213 Kent Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (256, N'Shyam', N'Patel', N'M', N'2005 Belleforest Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (257, N'Sohum', N'Patel', N'M', N'10610 Bere Island Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (258, N'Soniya', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (259, N'Subhash', N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (260, N'Suresh', N'Patel', N'M', N'2120 Savoy Pl', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (261, N'Suryakant', N'Patel', N'M', N'1209 Kent Dr', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (262, N'Suryakant', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', N'Fort Mill', 1, 3)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (263, N'Swayam', N'Patel', N'M', N'10610 Bere Island Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (264, N'Tej', N'patel', N'M', N'2616 Brackley Pl NW', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (265, N'Tejas', N'Patel', N'M', N'7903 Hereford St', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (266, N'Tejas', N'Patel', N'M', N'9692 Laurie Ave NW', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (267, N'Tilak', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (268, N'Tilak', N'Patel', N'M', N'8347 Marigold Pl', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (269, N'Tilak', N'Patel', N'M', N'12552 Druids Glen Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (270, N'Tushar', N'Patel', N'M', N'3234 Devon Croft Ln', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (271, N'Tushar', N'Patel', N'M', N'8767 Savannah Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (272, N'Upen', N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (273, N'Vandan', N'Patel', N'M', N'1862 Gingercake Cir', N'No', N'Rockhill', 0, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (274, N'Varad', N'Soneji', N'M', N'1110 Yorkmort Ridge Lane Apt 1134', N'Yes', N'South Charlotte', 1, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (275, N'Vasant', N'Patel', N'M', N'2766 Lake Wylie Dr', N'Yes', N'Rockhill', 1, 9)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (276, N'Vihaan', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (277, N'Vikas', N'Patel', N'M', N'10071 Highland Creek Cir', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (278, N'Vimal', N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (279, N'Vimarsh', N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (280, N'Vinod', N'Patel', N'M', N'11142 Tradition View Dr', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (281, N'Vipul', N'Patel', N'M', N'117 Lily Green Ct NW', N'No', N'Salisbury', 0, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (282, N'Vir', N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (283, N'Vishal', N'Parmar', N'M', N'9406 Vera Jones Ln', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (284, N'Vishal', N'Patel', N'M', N'1391 Charlotte Hwy', N'No', N'Lancaster', 0, 6)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (285, N'Vivek', N'Patel', N'M', N'1719 Funny Cide Dr', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (286, N'Vrajesh', N'Patel', N'M', N'10742 Derryrush Dr', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (287, N'Vrushali', N'Patil', N'M', N'7305 Hagen Ct Apt 1512', N'No', N'North Charlotte', 0, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (288, N'Yagnesh', N'Patel', N'M', N'12303 Summer Breeze Ct', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (289, N'Yagnesh', N'Patel', N'M', N'8347 Marigold Pl', N'Yes', N'North Charlotte', 1, 7)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (290, N'Yagnesh', N'Patel', N'M', N'9523 Longstone Ln', N'Yes', N'Salisbury', 1, 10)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (291, N'Yash', N'Mansinghka', N'M', N'11005 Sedgemoor Ln', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (292, N'Yogesh', N'Patel', N'M', N'5800 Shadow Creek Rd', N'No', N'South Charlotte', 0, 11)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (293, N'Yogesh', N'Patel', N'M', N'7000 Joyful Noise Ln', N'Yes', N'East Charlotte', 1, 2)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (294, N'Yogesh', N'Patel', N'M', N'703 N Pearl St', N'No', N'Other', 0, 8)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [ZoneName], [IsKaryakar], [ZoneId]) VALUES (295, N'Yogi', N'Patel', N'M', N'325 US Highway 70 SW', N'No', N'Hickory', 0, 5)
SET IDENTITY_INSERT [dbo].[Attendee] OFF
/****** Object:  Table [dbo].[Attendance]    Script Date: 02/09/2017 21:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attendance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventScheduleId] [int] NOT NULL,
	[AttendeeId] [int] NOT NULL,
	[IsAttended] [bit] NOT NULL CONSTRAINT [DF_Attendance_IsAttended]  DEFAULT ((0)),
	[AttendanceTime] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Attendance_CreatedOn]  DEFAULT (getdate()),
	[ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_Attendance_ModifiedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 02/09/2017 21:18:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSchedule]'))
ALTER TABLE [dbo].[EventSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EventSchedule_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSchedule]'))
ALTER TABLE [dbo].[EventSchedule] CHECK CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 02/09/2017 21:18:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendee]'))
ALTER TABLE [dbo].[Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Attendee_Zone] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[Zone] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendee]'))
ALTER TABLE [dbo].[Attendee] CHECK CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 02/09/2017 21:18:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Attendee] FOREIGN KEY([AttendeeId])
REFERENCES [dbo].[Attendee] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 02/09/2017 21:18:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_EventSchedule] FOREIGN KEY([EventScheduleId])
REFERENCES [dbo].[EventSchedule] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_EventSchedule]
GO
