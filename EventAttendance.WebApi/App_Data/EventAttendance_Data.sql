USE [EventAttendance]
GO
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule] DROP CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Att_Attendee_Att_City]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Att_Attendee_Att_City]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_EventSchedule]
GO
/****** Object:  Table [dbo].[Att_Attendance]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_Attendee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_EventSchedule]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendance_IsAttended]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [DF_Attendance_IsAttended]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendance_CreatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [DF_Attendance_CreatedOn]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendance_ModifiedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [DF_Attendance_ModifiedOn]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Attendance]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Attendance]
GO
/****** Object:  Table [dbo].[Att_Attendee]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Att_Attendee_Att_City]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Attendee_Zone]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Attendee_IsKaryakar]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [DF_Attendee_IsKaryakar]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Attendee]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Attendee]
GO
/****** Object:  Table [dbo].[Att_EventSchedule]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule] DROP CONSTRAINT [FK_EventSchedule_Event]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_EventSchedule_IsFreezed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Att_EventSchedule] DROP CONSTRAINT [DF_EventSchedule_IsFreezed]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[Att_EventSchedule]
GO
/****** Object:  Table [dbo].[Att_Zone]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Zone]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Zone]
GO
/****** Object:  Table [dbo].[Att_City]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_City]') AND type in (N'U'))
DROP TABLE [dbo].[Att_City]
GO
/****** Object:  Table [dbo].[Att_Event]    Script Date: 02/15/2017 22:25:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Event]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Event]
GO
/****** Object:  Table [dbo].[Att_Event]    Script Date: 02/15/2017 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Event]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_Event](
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
SET IDENTITY_INSERT [dbo].[Att_Event] ON
INSERT [dbo].[Att_Event] ([Id], [Name]) VALUES (1, N'Ravi Sabha')
SET IDENTITY_INSERT [dbo].[Att_Event] OFF
/****** Object:  Table [dbo].[Att_City]    Script Date: 02/15/2017 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Att_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Att_City] ON
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (1, N'Albemarle')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (2, N'Charlotte')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (3, N'Clover')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (4, N'Concord')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (5, N'Cornelius')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (6, N'Dallas')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (7, N'Fort Mill')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (8, N'Harrisburg')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (9, N'Hickory')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (10, N'Indian Trail')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (11, N'Jefferson')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (12, N'KANNAPOLIS')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (13, N'Kershaw')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (14, N'Kings Mountain')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (15, N'Lancaster')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (16, N'Lumberton')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (17, N'Matthews')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (18, N'Monroe')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (19, N'Mooresville')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (20, N'Morganton')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (21, N'Newberry')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (22, N'Pageland')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (23, N'Pineville')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (24, N'Raeford')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (25, N'Richburg')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (26, N'Rock Hill')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (27, N'Rockingham')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (28, N'Salisbury')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (29, N'Trinity')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (30, N'Waxhaw')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (31, N'Winston Salem')
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (32, N'Yadkinville')
SET IDENTITY_INSERT [dbo].[Att_City] OFF
/****** Object:  Table [dbo].[Att_Zone]    Script Date: 02/15/2017 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Zone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_Zone](
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
SET IDENTITY_INSERT [dbo].[Att_Zone] ON
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (1, N'Albermarle')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (2, N'East Charlotte')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (3, N'Fort Mill')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (4, N'Gastonia')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (5, N'Hickory')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (6, N'Lancaster')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (7, N'North Charlotte')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (8, N'Other')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (9, N'Rockhill')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (10, N'Salisbury')
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (11, N'South Charlotte')
SET IDENTITY_INSERT [dbo].[Att_Zone] OFF
/****** Object:  Table [dbo].[Att_EventSchedule]    Script Date: 02/15/2017 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_EventSchedule](
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
SET IDENTITY_INSERT [dbo].[Att_EventSchedule] ON
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (1, 1, CAST(0x493C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (2, 1, CAST(0x503C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (3, 1, CAST(0x573C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (4, 1, CAST(0x5E3C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (5, 1, CAST(0x653C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (6, 1, CAST(0x6C3C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (7, 1, CAST(0x733C0B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[Att_EventSchedule] OFF
/****** Object:  Table [dbo].[Att_Attendee]    Script Date: 02/15/2017 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Attendee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_Attendee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Address] [varchar](500) NULL,
	[Karyakar] [varchar](50) NULL,
	[IsKaryakar] [bit] NOT NULL CONSTRAINT [DF_Attendee_IsKaryakar]  DEFAULT ((0)),
	[CityId] [int] NOT NULL,
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
SET IDENTITY_INSERT [dbo].[Att_Attendee] ON
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (1, N'Aarjav', N'Patel', N'M', N'6827 Creft Cir', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (2, N'Abhi', N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (3, N'Abhilasha', N'Mansinghka', N'F', N'11005 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (4, N'Ajay', N'Patel', N'M', N'280 Indian Trl', N'Yes', 1, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (5, N'Ajay', N'Patel', N'M', N'302 Salem Rd', N'No', 0, 20, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (6, N'Ajay', N'Patel', N'M', N'8767 Savannah Rd', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (7, N'Akash', N'Patel', N'M', N'2011 Apogee Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (8, N'Aksh', N'Patel', N'M', N'2766 Lake Wylie Dr', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (9, N'Akshar', N'Gajjar', N'M', N'8731 Darcy Hopkins Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (10, N'Akshar', N'Patel', N'M', N'1719 Funny Cide Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (11, N'Akshar', N'Patel', N'M', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (12, N'Akshar', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (13, N'Alka', N'Patel', N'F', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (14, N'Alka', N'Patel', N'F', N'17416 Campbell Hall Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (15, N'Alpa', N'Patel', N'F', N'1719 Funny Cide Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (16, N'Alpaben', N'Patel', N'F', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (17, N'Alpesh', N'Patel', N'M', N'7318 Timberneck Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (18, N'Aman', N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (19, N'Ambalal', N'Patel', N'M', N'4110 Shasta Cir', N'No', 0, 3, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (20, N'Amit', N'Patel', N'M', N'110 Stone Ridge Dr', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (21, N'Anchal', N'Patel', N'F', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (22, N'Anil', N'Patel', N'M', N'132 W Main St', N'No', 0, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (23, N'Anil', N'Patel', N'M', N'325 US Highway 70 SW', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (24, N'Anil', N'Patel', N'M', N'5892 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (25, N'Anjana', N'Patel', N'F', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (26, N'Anju', N'Patel', N'F', N'6406 Derby Way', N'Yes', 1, 29, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (27, N'Ankit', N'Babariya', N'M', N'8525 Dahlia Dr Apt 207', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (28, N'Ankit', N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (29, N'Ankit', N'Kumbhani', N'M', N'8209 University Ridge Dr, apt # 107', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (30, N'Ankur', N'Patel', N'M', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (31, N'APUR', N'KAMDAR', N'M', N'6405 STONE RIDGE CT', N'No', 0, 12, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (32, N'Arti', N'patel', N'F', N'2616 Brackley Pl NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (33, N'Arvind', N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (34, N'Arvind', N'Patel', N'M', N'2718 Gastonia Dallas Hwy', N'Yes', 1, 6, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (35, N'Ashish', N'Patel', N'M', N'1236 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (36, N'Ashish', N'Patel', N'M', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (37, N'Ashok', N'Patel', N'M', N'2413 Arden Gate Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (38, N'Ashok', N'Patel', N'M', N'6085 Creekview Ct', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (39, N'Ashok', N'Patel', N'M', N'9607 Springholm Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (40, N'Ashok', N'Patel', N'M', N'9607 Springholn Dr', N'No', 0, 2, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (41, N'Ashwi', N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (42, N'Asit', N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (43, N'Atul', N'Patel', N'M', N'1040 Conestoga Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (44, N'Atul', N'Patel', N'M', N'121 Peoria Ln', N'No', 0, 14, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (45, N'Atul', N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (46, N'Avanee', N'Patel', N'F', N'110 Stone Ridge Dr', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (47, N'Ayushi', N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (48, N'Babu', N'Patel', N'M', N'11925 Southcrest Ln', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (49, N'Badal', N'Patel', N'M', N'413 College Dr', N'Yes', 1, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (50, N'Bakula', N'Patel', N'F', N'1909 Wexford Meadows Ln Apt H', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (51, N'Baldev', N'Patel', N'M', N'17416 Campbell Hall Ct', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (52, N'Bela', N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (53, N'Bhagvati', N'Gajjar', N'F', N'8731 Darcy Hopkins Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (54, N'Bhakti', N'patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (55, N'Bhalchandra', N'Patel', N'M', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (56, N'Bharat', N'Parmar', N'M', N'2312 US Highway 52 N', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (57, N'Bharat', N'Patel', N'M', N'1201 Highway 9 Byp W', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (58, N'Bharat', N'Patel', N'M', N'1213 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (59, N'Bharti', N'Shah', N'F', N'9946 Nicole Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (60, N'Bhavana', N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (61, N'Bhavanaben', N'Patel', N'F', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (62, N'Bhavesh', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (63, N'Bhavin', N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (64, N'Bhavini', N'Darji', N'F', N'6732 Allness Glen Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (65, N'Bhavna', N'Gajjar', N'F', N'3821 Trappers Run Dr', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (66, N'Bholabhai', N'Patel', N'M', N'2800 Foxwood Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (67, N'Bhowmik', N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (68, N'Bhumi', N'Patel', N'F', N'10125 University Park Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (69, N'Bhumi', N'Patel', N'F', N'132 W Main St', N'No', 0, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (70, N'Bhupendra', N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (71, N'Bhupesh', N'Patel', N'M', N'19408 Fridley Ln', N'No', 0, 5, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (72, N'Bindu', N'Patel', N'F', N'11925 Southcrest Ln', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (73, N'Bipin', N'Patel', N'M', N'2525 Lawyers Rd W', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (74, N'Bipin', N'Patel', N'M', N'5891 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (75, N'Chanchal', N'Patel', N'F', N'6235 Hermsley Rd', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (76, N'Chandni', N'Patel', N'F', N'413 College Dr', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (77, N'Chandrakant', N'Gajjar', N'M', N'3821 Trappers Run Dr', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (78, N'Chandrakant', N'Suthar', N'M', N'10465 Stokeshill Ct', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (79, N'Chandrakant', N'Suthar', N'M', N'15739 Greythorne Dr. Apt#103', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (80, N'Chandresh', N'Patel', N'M', N'1719 Funny Cide Dr', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (81, N'Chandrika', N'Patel', N'M', N'1040 Conestoga Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (82, N'Chandu', N'Patel', N'M', N'360 Ivy Park Ln', N'No', 0, 31, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (83, N'Chandu', N'Patel', N'M', N'7413 Chital Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (84, N'Chetan', N'Desai', N'M', N'2911 Bridle Brook Way', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (85, N'Chiman', N'Patel', N'M', N'8801 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (86, N'Daksh', N'Desai', N'M', N'2911 Bridle Brook Way', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (87, N'Daksha', N'Patel', N'F', N'2525 Lawyers Rd W', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (88, N'Damukaka', N'Patel', N'M', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (89, N'Darshan', N'Patel', N'M', N'8347 Marigold Pl', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (90, N'Dasharath', N'Patel', N'M', N'5444 Allison Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (91, N'Daxa', N'Patel', N'F', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (92, N'Dev', N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (93, N'Devan', N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (94, N'Dharmendra', N'Patel', N'M', N'4864 Annelise Dr', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (95, N'Dhayana', N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (96, N'Dhriti', N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (97, N'Dhwani', N'Patel', N'F', N'7318 Timberneck Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (98, N'Dilip', N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (99, N'Dilip', N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (100, N'Dilip', N'Patel', N'M', N'6406 Derby Way', N'Yes', 1, 29, 7)
GO
print 'Processed 100 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (101, N'Dimpal', N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (102, N'Dinesh', N'Patel', N'M', N'6235 Hermsley Rd', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (103, N'DIP', N'PATEL', N'M', N'234 S Main St', N'Yes', 1, 11, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (104, N'Dipika', N'Patel', N'F', N'9217 Unbridle Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (105, N'Dipti', N'Desai', N'F', N'2911 Bridle Brook Way', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (106, N'Dipti', N'Patel', N'F', N'6827 Creft Cir', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (107, N'Divya', N'Patel', N'F', N'4101 Regency Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (108, N'Divyesh', N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (109, N'Diya', N'Patel', N'F', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (110, N'Drashti', N'Patel', N'F', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (111, N'Drupad', N'Patel', N'M', N'9424 Autumn Applause Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (112, N'Dushyant', N'Gajjar', N'M', N'4029 Raccoon Run Ct', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (113, N'Eshani', N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (114, N'Eshna', N'Hira', N'F', N'138 Norman Station Blvd', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (115, N'Fatehsinh', N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (116, N'Gautam', N'Mansinghka', N'M', N'11005 Sedgemoor Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (117, N'Gautam', N'Patel', N'M', N'3600 Mooreland Farms Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (118, N'Gautami', N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (119, N'Geeta', N'Patel', N'F', N'5815 Langwell Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (120, N'Geeta', N'Patel', N'F', N'7301 Conifer Ct', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (121, N'Ghanshyam', N'Patel', N'M', N'117 Lily Green Ct NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (122, N'Ghanshyam', N'Patel', N'M', N'12303 Summer Breeze Ct', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (123, N'Ghanshyam', N'Patel', N'M', N'1516 Concord Pkwy N', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (124, N'Gia', N'Patel', N'F', N'9016 Tamarron Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (125, N'Girish', N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (126, N'Girish', N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (127, N'Hansa', N'Patel', N'F', N'2013 Gloucester St', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (128, N'Hansa', N'Patel', N'F', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (129, N'Hari', N'Parmar', N'M', N'9500 Marsena Ct', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (130, N'Harikrishna', N'Patel', N'M', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (131, N'Harikrishna', N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (132, N'Harini', N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (133, N'Harish', N'Patel', N'M', N'625 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (134, N'Harsha', N'Parmar', N'F', N'9406 Vera Jones Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (135, N'Harshad', N'Patel', N'M', N'9620 Puddle Duck Rd Apt 305', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (136, N'Harshadbhai', N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (137, N'Harshita', N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (138, N'Hasmukh', N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (139, N'Hasumati', N'Patel', N'F', N'625 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (140, N'Hema', N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (141, N'Hemal', N'Patadia', N'M', N'8209 Univrsty Rdge Dr Apt 107', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (142, N'Hemani', N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (143, N'Hemant', N'Gajjar', N'M', N'8731 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (144, N'Hemant', N'Patel', N'M', N'10742 Derryrush Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (145, N'Hemlata', N'Darji', N'F', N'7307 Brigmore Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (146, N'Heta', N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (147, N'Hetal', N'Thakkar', N'F', N'11405 Colony Grove Ln Apt 721', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (148, N'Himani', N'Patel', N'F', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (149, N'Himanshu', N'Patel', N'M', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (150, N'Himanshu', N'Patel', N'M', N'2912 Parkway Blvd', N'Yes', 1, 25, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (151, N'Hina', N'patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (152, N'Hipal', N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (153, N'Hiral', N'Patel', N'F', N'4864 Annelise Dr', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (154, N'Hiren', N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (155, N'Hiren', N'Patel', N'M', N'4011 Ainsdale Dr', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (156, N'Hiren', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (157, N'Indira', N'Patel', N'F', N'2912 Parkway Blvd', N'No', 0, 25, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (158, N'Indrasinh', N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (159, N'Jagat', N'Patel', N'M', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (160, N'Jagdish', N'Patel', N'M', N'1816 Damascus St', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (161, N'Jagdish', N'Patel', N'M', N'2013 Gloucester St', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (162, N'Jagdish', N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (163, N'Jagruti', N'Patel', N'F', N'638 Ridge St', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (164, N'Jagruti', N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (165, N'Jai', N'Patel', N'M', N'7318 Timberneck Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (166, N'Jainith', N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (167, N'Jalpa', N'Patel', N'F', N'4864 Annelise Dr', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (168, N'Janak', N'Amin', N'M', N'1395 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (169, N'Janki', N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (170, N'Janki', N'Patel', N'F', N'2005 Belleforest Ct', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (171, N'Janki', N'Patel', N'F', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (172, N'Janu', N'Patel', N'M', N'1236 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (173, N'Janvi', N'Patel', N'F', N'4864 Annelise Dr', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (174, N'Jash', N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (175, N'Jay', N'Parmar', N'M', N'14952 Havasu St', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (176, N'Jay', N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (177, N'Jaya', N'Patel', N'F', N'9725 Capella Ave NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (178, N'Jayan', N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (179, N'Jayant', N'Patel', N'M', N'200 Henson St', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (180, N'Jayant', N'Patel', N'M', N'9725 Capella Ave NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (181, N'Jayantibhai', N'Patel', N'M', N'1909 Wexford Meadows Ln Apt H', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (182, N'Jayantilal', N'Panara', N'M', N'9123 Royal Highlands Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (183, N'Jayantilal', N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (184, N'Jayendra', N'Darji', N'M', N'7307 Brigmore Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (185, N'Jayendra', N'Patel', N'M', N'13410 Mallard Lake Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (186, N'Jayesh', N'Patel', N'M', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (187, N'Jayna', N'Patel', N'F', N'2413 Arden Gate Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (188, N'Jayshree', N'Patel', N'F', N'5800 Shadow Creek Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (189, N'Jayshri', N'Patel', N'F', N'10742 Derryrush Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (190, N'Jeet', N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (191, N'Jeet', N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (192, N'Jeram', N'Patel', N'M', N'1003 Garden Rose Ct', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (193, N'Jigar', N'Patel', N'M', N'14044 Lissadell Cir', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (194, N'Jigna', N'Patel', N'F', N'3730 US Highway 601', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (195, N'Jigna', N'Patel', N'M', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (196, N'Jimmy', N'Patel', N'M', N'5001 Oxfordshire Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (197, N'Jitendra', N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', 1, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (198, N'Jual', N'Patel', N'F', N'4011 Ainsdale Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (199, N'Juhi', N'Ram', N'F', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (200, N'Jyoti', N'Patel', N'F', N'117 Lily Green Ct NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (201, N'Jyoti', N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
GO
print 'Processed 200 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (202, N'Jyoti', N'Patel', N'F', N'9052 Magnolia Lily Ave', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (203, N'Jyotiben', N'Modi', N'F', N'350 Venus St', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (204, N'Jyotika', N'Gajjar', N'F', N'3821 Trappers Run Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (205, N'Jyotindra', N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (206, N'Jyotish', N'Patel', N'M', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (207, N'Jyotsna', N'Parmar', N'F', N'2312 US Highway 52 N', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (208, N'Jyotsna', N'Patel', N'F', N'2710 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (209, N'Kalpana', N'Parmar', N'F', N'15324 Yellowstone Springs Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (210, N'Kalpana', N'Patel', N'F', N'109 Country Club Dr', N'No', 0, 27, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (211, N'Kalpana', N'Patel', N'F', N'12902 Cleopatra Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (212, N'Kalpesh', N'Ram', N'M', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (213, N'Kalpu', N'Patel', N'F', N'1209 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (214, N'Kamala', N'Patel', N'F', N'5001 Oxfordshire Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (215, N'Kamlesh', N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (216, N'Kamlesh', N'Patel', N'M', N'1946 9th Street Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (217, N'Kamu', N'Patel', N'F', N'1003 Garden Rose Ct', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (218, N'Kanji', N'Ram', N'M', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (219, N'Kanta', N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (220, N'Kanu', N'Patel', N'M', N'11214 Sedgemoor Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (221, N'Kaushik', N'Patel', N'M', N'17123 Westmill Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (222, N'Kaushik', N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (223, N'Kena', N'Patel', N'F', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (224, N'Ketan', N'Suthar', N'M', N'15739 Greythorne Dr. Apt#103', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (225, N'Ketki', N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (226, N'Ketu', N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (227, N'Ketul', N'Patel', N'F', N'5891 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (228, N'Keyuri', N'Patel', N'F', N'4100 Margaret Wallace Rd', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (229, N'Keyuri', N'Patel', N'F', N'552 Fair Oaks Dr', N'No', 0, 7, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (230, N'Khusbu', N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (231, N'Khushbu', N'Patel', N'F', N'421 Elizabeth Ave', N'No', 0, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (232, N'Khushi', N'Gajjar', N'F', N'8731 Darcy Hopkins Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (233, N'Kinal', N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (234, N'Kinjal', N'Patel', N'F', N'5892 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (235, N'Kiran', N'Patel', N'F', N'8623 Sedgeburn Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (236, N'Kirit', N'Parmar', N'M', N'9406 Vera Jones Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (237, N'Kirit', N'Patel', N'M', N'7903 Hereford St', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (238, N'Kiron', N'Patel', N'M', N'4330 Old Interstate Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (239, N'Kirtan', N'Patel', N'M', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (240, N'Kirtan', N'Patel', N'M', N'9217 Unbridle Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (241, N'Kirti', N'Parmar', N'M', N'14952 Havasu St', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (242, N'Kirti', N'Patel', N'F', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (243, N'Koki', N'Rathod', N'M', N'644 W Prospect Rd', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (244, N'Kokila', N'Patel', N'F', N'4330 Old Interstate Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (245, N'Krina', N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (246, N'Krisha', N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (247, N'Krishna', N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (248, N'Krishna', N'Rathod', N'M', N'644 W Prospect Rd', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (249, N'Krupa', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (250, N'Kruti', N'Patel', N'F', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (251, N'Kumud', N'Brahmbhatt', N'F', N'5908 Hoover St', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (252, N'Kumud', N'Patel', N'F', N'9607 Springholm Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (253, N'Kunali', N'Shah', N'F', N'9946 Nicole Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (254, N'Kunjal', N'Patel', N'F', N'7000 Joyful Noise Ln', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (255, N'Kush', N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (256, N'Laksh', N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (257, N'Lalita', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (258, N'Lata', N'Patel', N'F', N'3019 Ernest Russell Ct', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (259, N'Laxmi', N'Parmar', N'F', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (260, N'Leena', N'Parmar', N'F', N'14952 Havasu St', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (261, N'Lila', N'Patel', N'F', N'2718 Gastonia Dallas Hwy', N'No', 0, 6, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (262, N'Lila', N'Patel', N'F', N'5892 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (263, N'Lilaben', N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (264, N'Madhu', N'Patel', N'F', N'1201 Highway 9 Byp W', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (265, N'Madhu', N'Patel', N'M', N'4110 Shasta Cir', N'No', 0, 3, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (266, N'Madhu', N'Patel', N'F', N'4330 Old Interstate Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (267, N'Mahek', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (268, N'Mahendra', N'Brahmbhatt', N'M', N'5908 Hoover St', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (269, N'Mahendra', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (270, N'Mahendra', N'Patel', N'M', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (271, N'Mahendra', N'Suthar', N'M', N'7015 Brighton Brook Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (272, N'Mahesh', N'Patel', N'M', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (273, N'Mahesh', N'Patel', N'M', N'303 N Maple St', N'Yes', 1, 22, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (274, N'Mahip', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (275, N'Mamta', N'Patel', N'F', N'132 W Main St', N'Yes', 1, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (276, N'Manav', N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (277, N'Mangaldas', N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (278, N'Manisha', N'Patel', N'F', N'421 Elizabeth Ave', N'Yes', 1, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (279, N'Manoj', N'Patel', N'M', N'413 College Dr', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (280, N'Mayur', N'Patel', N'M', N'10838 Stone Bunker Dr', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (281, N'Mayur', N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (282, N'Mayur', N'Patel', N'M', N'7903 Hereford St', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (283, N'Mayur', N'Patel', N'M', N'818 20th Avenue Pl SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (284, N'Mayuri', N'Patel', N'F', N'2630 Gosling Terrace Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (285, N'Meena', N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (286, N'Meena', N'Patel', N'F', N'1516 Concord Pkwy N', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (287, N'Meena', N'Patel', N'F', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (288, N'Megha', N'Ram', N'F', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (289, N'Mehul', N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (290, N'Mehul', N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (291, N'Mihir', N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (292, N'Milan', N'Patel', N'M', N'1516 Concord Pkwy N', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (293, N'Mina', N'Patel', N'F', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (294, N'Minal', N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (295, N'Minal', N'Patel', N'F', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (296, N'Minaxi', N'Patel', N'F', N'8347 Marigold Pl', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (297, N'Mita', N'Patel', N'F', N'2526 King Arthur Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (298, N'Mital', N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (299, N'Mumukshu', N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (300, N'Naiya', N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (301, N'Nalin', N'Patel', N'M', N'6625 Rollingridge Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (302, N'Nalini', N'Patel', N'F', N'12303 Summer Breeze Ct', N'No', 0, 2, 11)
GO
print 'Processed 300 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (303, N'Nalini', N'Patel', N'F', N'207 N Jackson Rd # A', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (304, N'Nandita', N'Gajjar', N'F', N'6904 Whitebeam Way', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (305, N'Narendra', N'Patel', N'M', N'9052 Magnolia Lily Ave', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (306, N'Natasha', N'Shah', N'F', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (307, N'Natubhai', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (308, N'Natvar', N'Patel', N'M', N'1134 Jade Glen Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (309, N'Natvarlal', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (310, N'Navin', N'Patel', N'M', N'3019 Ernest Russell Ct', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (311, N'Nayanjyoth', N'Patel', N'F', N'6085 Creekview Ct', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (312, N'Neeya', N'Patel', N'F', N'10838 Stone Bunker Dr', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (313, N'Neeyal', N'Patel', N'M', N'17416 Campbell Hall Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (314, N'Nehal', N'Patel', N'M', N'10125 University Park Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (315, N'Nehal', N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (316, N'Nehal', N'Patel', N'F', N'2766 Lake Wylie Dr', N'Yes', 1, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (317, N'Neil', N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', 1, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (318, N'Neti', N'Patel', N'F', N'4864 Annelise Dr', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (319, N'Nikhil', N'Patel', N'M', N'9016 Tamarron Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (320, N'Nikita', N'Parmar', N'F', N'9406 Vera Jones Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (321, N'Nikita', N'Patel', N'F', N'8767 Savannah Rd', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (322, N'Nikul', N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (323, N'Nila', N'Patel', N'F', N'138 Norman Station Blvd', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (324, N'Nilam', N'Patel', N'F', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (325, N'Nilanjana', N'Patel', N'F', N'303 N Maple St', N'No', 0, 22, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (326, N'Nilesh', N'Patel', N'M', N'10610 Bere Island Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (327, N'Nilesh', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (328, N'Nilesh', N'Shah', N'M', N'9946 Nicole Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (329, N'Nilu', N'Patel', N'F', N'7318 Timberneck Ct', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (330, N'Nimesh', N'Patel', N'M', N'552 Fair Oaks Dr', N'Yes', 1, 7, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (331, N'Nimesh', N'Patel', N'M', N'8623 Sedgeburn Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (332, N'Nimisha', N'Patel', N'F', N'413 College Dr', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (333, N'Nimita', N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (334, N'Niranjan', N'Patel', N'M', N'638 Ridge St', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (335, N'Niranjan', N'Patel', N'M', N'7301 Conifer Ct', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (336, N'Nishal', N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (337, N'Nita', N'Patel', N'F', N'221 Cattle Ridge Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (338, N'Nita', N'Shah', N'F', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (339, N'Niyam', N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (340, N'Niyati', N'Patel', N'F', N'17416 Campbell Hall Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (341, N'Padma', N'Patel', N'F', N'7413 Chital Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (342, N'Pankaj', N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (343, N'Param', N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (344, N'Paresh', N'Patel', N'M', N'1204 Somerset Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (345, N'Paresh', N'Sutariya', N'M', N'10119 Oxford Landing Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (346, N'Parina', N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (347, N'Parth', N'Patel', N'M', N'3275 Edgeland Hwy', N'No', 0, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (348, N'Parth', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (349, N'Payal', N'Gajjar', N'F', N'8731 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (350, N'Pinky', N'Patel', N'F', N'4011 Ainsdale Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (351, N'Pooja', N'Kamdar', N'F', N'6405 STONE RIDGE CT', N'No', 0, 12, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (352, N'Prabhudas', N'Darji', N'M', N'7307 Brigmore Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (353, N'Prabhudas', N'Patel', N'M', N'5815 Langwell Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (354, N'Prabodh', N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (355, N'PRADIP', N'PATEL', N'M', N'2721 Winnsboro Rd', N'No', 0, 21, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (356, N'Praful', N'Patel', N'M', N'8623 Sedgeburn Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (357, N'Pramit', N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (358, N'Pranjali', N'Patel', N'F', N'10610 Bere Island Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (359, N'Prashant', N'Parmar', N'M', N'9500 Marsena Ct', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (360, N'Prashant', N'Patel', N'M', N'6827 Creft Cir', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (361, N'Prashant', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (362, N'Pravika', N'Suthar', N'F', N'15739 Greythorne Dr. Apt#103', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (363, N'Pravin', N'Patel', N'M', N'1608 E Roosevelt Blvd', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (364, N'Pravin', N'Patel', N'M', N'302 Salem Rd', N'No', 0, 20, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (365, N'Pravin', N'Patel', N'M', N'5892 Bakers Pt', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (366, N'Pravinchandra', N'Patel', N'M', N'305 Londonderry Dr', N'Yes', 1, 16, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (367, N'Prayag', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (368, N'Preet', N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (369, N'Preet', N'Patel', N'M', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (370, N'Prem', N'Patel', N'M', N'132 W Main St', N'No', 0, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (371, N'Prem', N'Patel', N'M', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (372, N'Prit', N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (373, N'Pritash', N'Patel', N'M', N'3234 Devon Croft Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (374, N'Pritesh', N'Patel', N'M', N'3275 Edgeland Hwy', N'Yes', 1, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (375, N'Priya', N'Patel', N'F', N'1040 Conestoga Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (376, N'Puja', N'Patel', N'F', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (377, N'Punita', N'Gajjar', N'F', N'4029 Raccoon Run Ct', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (378, N'Purnima', N'Patel', N'F', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (379, N'Purva', N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (380, N'Pushpa', N'Patel', N'F', N'360 Ivy Park Ln', N'Yes', 1, 31, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (381, N'Pushpa', N'Patel', N'F', N'5444 Allison Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (382, N'Pushpa', N'Patel', N'F', N'8526 Kershaw Camden Hwy', N'No', 0, 13, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (383, N'Radhikaben', N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (384, N'Rahi', N'Patel', N'M', N'280 Indian Trl', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (385, N'Rahul', N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (386, N'Rahul', N'Shah', N'M', N'802 Pine Valley Ct', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (387, N'Raj', N'Patel', N'M', N'1040 Conestoga Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (388, N'Rajan', N'Patel', N'M', N'2525 Lawyers Rd W', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (389, N'Rajendra', N'Patel', N'M', N'2005 Belleforest Ct', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (390, N'Rajesh', N'Patel', N'M', N'12902 Cleopatra Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (391, N'Rajiv', N'Shah', N'F', N'9946 Nicole Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (392, N'Ramendra', N'Bhatt', N'M', N'806 Lee St', N'No', 0, 14, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (393, N'Ramesh', N'Patel', N'M', N'616 S Hampton St', N'No', 0, 13, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (394, N'Ramilaben', N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (395, N'Ranjan', N'Patel', N'F', N'6235 Hermsley Rd', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (396, N'Ranjan', N'Patel', N'F', N'9620 Puddle Duck Rd Apt 305', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (397, N'Rashmi', N'Patel', N'M', N'3234 Devon Croft Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (398, N'Rashmita', N'Patel', N'F', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (399, N'Rasila', N'Panara', N'F', N'9123 Royal Highlands Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (400, N'Ravi', N'Patel', N'M', N'2011 Apogee Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (401, N'Rayan', N'Patel', N'M', N'4011 Ainsdale Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (402, N'Reena', N'Patel', N'F', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (403, N'Rekha', N'Parmar', N'F', N'9500 Marsena Ct', N'Yes', 1, 2, 7)
GO
print 'Processed 400 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (404, N'Rekha', N'Patel', N'F', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (405, N'Rekha', N'Patel', N'F', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (406, N'Renu', N'Patel', N'F', N'11142 Tradition View Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (407, N'Renuka', N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (408, N'Renuka', N'Patel', N'F', N'2005 Belleforest Ct', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (409, N'Renuka', N'Suthar', N'F', N'10465 Stokeshill Ct', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (410, N'Renuka', N'Suthar', N'F', N'15739 Greythorne Dr. Apt#103', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (411, N'Rinali', N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (412, N'Rinku', N'Patel', N'F', N'117 Lily Green Ct NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (413, N'Ripal', N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (414, N'Rishabh', N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (415, N'Riya', N'Patel', N'F', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (416, N'Riya', N'Patel', N'F', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (417, N'Riya', N'Shah', N'F', N'802 Pine Valley Ct', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (418, N'Roma', N'Patel', N'F', N'10742 Derryrush Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (419, N'Ronak', N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (420, N'Ruhi', N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (421, N'Ruhi', N'Patel', N'F', N'2766 Lake Wylie Dr', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (422, N'Rupal', N'Shah', N'F', N'802 Pine Valley Ct', N'Yes', 1, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (423, N'Rupesh', N'Patel', N'M', N'1209 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (424, N'Rushi', N'Parekh', N'M', N'2521 Clare Olivia Dr Apt 203', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (425, N'Sachin', N'Devani', N'M', N'51 Astor Ct Apt 107', N'No', 0, 3, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (426, N'Sadhana', N'Desai', N'F', N'611 W Roosevelt Blvd Apt 127', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (427, N'Sagar', N'Patel', N'M', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (428, N'Sagar', N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (429, N'Sahaj', N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (430, N'Sahil', N'Hira', N'M', N'138 Norman Station Blvd', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (431, N'Sajani', N'Patel', N'F', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (432, N'Sameer', N'Shah', N'M', N'802 Pine Valley Ct', N'Yes', 1, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (433, N'Sandeep', N'Patil', N'M', N'7305 Hagen Ct Apt 1512', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (434, N'Sangeeta', N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (435, N'Sangita', N'Patel', N'F', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (436, N'Sangita', N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (437, N'Sangitaben', N'Sutariya', N'F', N'10119 Oxford Landing Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (438, N'Sanjay', N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (439, N'Sanjay', N'Patel', N'M', N'4613 9th St NE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (440, N'Sanjeet', N'Patel', N'M', N'2413 Arden Gate Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (441, N'Sarju', N'Patel', N'M', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (442, N'Saroj', N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (443, N'Saroj', N'Patel', N'F', N'703 N Pearl St', N'No', 0, 22, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (444, N'Satish', N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (445, N'Satish', N'Patel', N'M', N'4101 Regency Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (446, N'Saurin', N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (447, N'Sejal', N'Jambusaria', N'F', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (448, N'Shail', N'Agarwal', N'F', N'Unknown Address', N'No', 0, 2, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (449, N'Shakuntala', N'Patel', N'F', N'1608 E Roosevelt Blvd', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (450, N'Shalini', N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (451, N'Shanta', N'Patel', N'F', N'2413 Arden Gate Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (452, N'Shantaben', N'Patel', N'F', N'2800 Foxwood Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (453, N'Sharad', N'Patel', N'M', N'9016 Tamarron Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (454, N'Sharda', N'Patel', N'F', N'1134 Jade Glen Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (455, N'Shashikant', N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (456, N'Sheena', N'Patel', N'F', N'434 Frazier Ave', N'No', 0, 2, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (457, N'Sheetal', N'Patel', N'F', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (458, N'Shilpa', N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (459, N'Shilpa', N'Patel', N'F', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (460, N'Shilpa', N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (461, N'Shilpa', N'Patel', N'F', N'4613 9th St NE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (462, N'Shilpesh', N'Patel', N'M', N'109 Country Club Dr', N'Yes', 1, 27, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (463, N'Shiv', N'Patel', N'M', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (464, N'Shivanee', N'Patel', N'F', N'10838 Stone Bunker Dr', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (465, N'Shivang', N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (466, N'Shivangi', N'Patel', N'M', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (467, N'Shivangini', N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (468, N'Shyam', N'Patel', N'M', N'2005 Belleforest Ct', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (469, N'Smita', N'Amin', N'F', N'1395 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (470, N'Sneha', N'Patel', N'F', N'2413 Arden Gate Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (471, N'Sneha', N'Patel', N'F', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (472, N'Sohini', N'Patel', N'F', N'11925 Southcrest Ln', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (473, N'Sohum', N'Patel', N'M', N'10610 Bere Island Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (474, N'Sonal', N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (475, N'Sonia', N'Patel', N'F', N'221 Cattle Ridge Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (476, N'Soniya', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (477, N'Subhash', N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (478, N'Suchi', N'Patel', N'F', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (479, N'Sudha', N'Patel', N'F', N'1816 Damascus St', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (480, N'Sulochana', N'Suthar', N'F', N'7015 Brighton Brook Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (481, N'Sumitra', N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (482, N'Sunita', N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (483, N'Sunita', N'Patel', N'F', N'9016 Tamarron Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (484, N'Suresh', N'Patel', N'M', N'2120 Savoy Pl', N'No', 0, 7, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (485, N'Surya', N'Patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (486, N'Suryakant', N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (487, N'Suryakant', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (488, N'Swamini', N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (489, N'Swati', N'Patel', N'F', N'14044 Lissadell Cir', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (490, N'Swayam', N'Patel', N'M', N'10610 Bere Island Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (491, N'Tanvi', N'Patel', N'F', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (492, N'Tej', N'patel', N'M', N'2616 Brackley Pl NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (493, N'Tejal', N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (494, N'Tejal', N'Patel', N'F', N'818 20th Avenue Pl SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (495, N'Tejas', N'Patel', N'M', N'7903 Hereford St', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (496, N'Tejas', N'Patel', N'M', N'9692 Laurie Ave NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (497, N'Tilak', N'Patel', N'M', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (498, N'Tilak', N'Patel', N'M', N'8347 Marigold Pl', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (499, N'Tilak', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (500, N'Toral', N'Patel', N'F', N'3275 Edgeland Hwy', N'Yes', 1, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (501, N'Tulsi', N'Patel', N'F', N'10125 University Park Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (502, N'Tushar', N'Patel', N'M', N'3234 Devon Croft Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (503, N'Tushar', N'Patel', N'M', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (504, N'Upen', N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2)
GO
print 'Processed 500 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (505, N'Urmila', N'Patel', N'F', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (506, N'Urmila', N'Patel', N'F', N'3600 Mooreland Farms Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (507, N'Urmila', N'Patel', N'F', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (508, N'Vandan', N'Patel', N'M', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (509, N'Vanita', N'Patel', N'F', N'8801 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (510, N'Vanitaben', N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (511, N'Vanlila', N'Bhatt', N'F', N'806 Lee St', N'No', 0, 14, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (512, N'Varad', N'Soneji', N'M', N'1110 Yorkmort Ridge Lane Apt 1134', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (513, N'Varsha', N'Patel', N'F', N'2011 Apogee Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (514, N'Varsha', N'Patel', N'F', N'3234 Devon Croft Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (515, N'Vasant', N'Patel', N'M', N'2766 Lake Wylie Dr', N'Yes', 1, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (516, N'Vedi', N'Patel', N'F', N'3275 Edgeland Hwy', N'No', 0, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (517, N'Vihaan', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (518, N'Vikas', N'Patel', N'M', N'10071 Highland Creek Cir', N'No', 0, 7, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (519, N'Vilash', N'Patel', N'F', N'7903 Hereford St', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (520, N'Vimal', N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (521, N'Vimala', N'Patel', N'F', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (522, N'Vimarsh', N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (523, N'Vimla', N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (524, N'Vinod', N'Patel', N'M', N'11142 Tradition View Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (525, N'Vipul', N'Patel', N'M', N'117 Lily Green Ct NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (526, N'Vir', N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (527, N'Vira', N'Patel', N'F', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (528, N'Vishal', N'Parmar', N'M', N'9406 Vera Jones Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (529, N'Vishal', N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (530, N'Vivek', N'Patel', N'M', N'1719 Funny Cide Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (531, N'Vrajesh', N'Patel', N'M', N'10742 Derryrush Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (532, N'Vrushali', N'Patil', N'M', N'7305 Hagen Ct Apt 1512', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (533, N'Xitiz', N'Sutariya', N'F', N'10119 Oxford Landing Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (534, N'Yagnesh', N'Patel', N'M', N'12303 Summer Breeze Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (535, N'Yagnesh', N'Patel', N'M', N'8347 Marigold Pl', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (536, N'Yagnesh', N'Patel', N'M', N'9523 Longstone Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (537, N'Yash', N'Mansinghka', N'M', N'11005 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (538, N'Yogesh', N'Patel', N'M', N'5800 Shadow Creek Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (539, N'Yogesh', N'Patel', N'M', N'7000 Joyful Noise Ln', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (540, N'Yogesh', N'Patel', N'M', N'703 N Pearl St', N'No', 0, 22, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (541, N'Yogi', N'Patel', N'M', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (542, N'Rakesh', N'Gurjar', N'M', NULL, NULL, 0, 2, NULL)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (543, N'Rutav', N'Dharek', N'M', NULL, NULL, 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (544, N'Himalay', N'Oza', N'M', N'', NULL, 0, 2, 7)
SET IDENTITY_INSERT [dbo].[Att_Attendee] OFF
/****** Object:  Table [dbo].[Att_Attendance]    Script Date: 02/15/2017 22:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Attendance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_Attendance](
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
SET IDENTITY_INSERT [dbo].[Att_Attendance] ON
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1, 7, 345, 1, CAST(0x0000A71B01659AE0 AS DateTime), CAST(0x0000A71B0165C92A AS DateTime), CAST(0x0000A71B0165C92A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (2, 7, 156, 1, CAST(0x0000A71B01659AE0 AS DateTime), CAST(0x0000A71B0165D2FC AS DateTime), CAST(0x0000A71B0165D2FC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (3, 7, 432, 1, CAST(0x0000A71B01659AE0 AS DateTime), CAST(0x0000A71B0165DA68 AS DateTime), CAST(0x0000A71B0165DA68 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (4, 7, 385, 1, CAST(0x0000A71B0165E130 AS DateTime), CAST(0x0000A71B0165E210 AS DateTime), CAST(0x0000A71B0165E210 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (5, 7, 29, 1, CAST(0x0000A71B0165E130 AS DateTime), CAST(0x0000A71B0165E940 AS DateTime), CAST(0x0000A71B0165E940 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (6, 7, 504, 1, CAST(0x0000A71B0165E130 AS DateTime), CAST(0x0000A71B0165F0B6 AS DateTime), CAST(0x0000A71B0165F0B6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (7, 7, 196, 1, CAST(0x0000A71B0165E130 AS DateTime), CAST(0x0000A71B016605E1 AS DateTime), CAST(0x0000A71B016605E1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (8, 7, 344, 1, CAST(0x0000A71B0165E130 AS DateTime), CAST(0x0000A71B01660F7C AS DateTime), CAST(0x0000A71B01660F7C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (9, 7, 125, 1, CAST(0x0000A71B01666DD0 AS DateTime), CAST(0x0000A71B0166892F AS DateTime), CAST(0x0000A71B0166892F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (10, 7, 310, 1, CAST(0x0000A71B01666DD0 AS DateTime), CAST(0x0000A71B0166925B AS DateTime), CAST(0x0000A71B0166925B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (11, 7, 423, 1, CAST(0x0000A71B0166B420 AS DateTime), CAST(0x0000A71B0166BE39 AS DateTime), CAST(0x0000A71B0166BE39 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (12, 7, 182, 1, CAST(0x0000A71B0166B420 AS DateTime), CAST(0x0000A71B0166CA8D AS DateTime), CAST(0x0000A71B0166CA8D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (13, 7, 38, 1, CAST(0x0000A71B0166FA70 AS DateTime), CAST(0x0000A71B016726E3 AS DateTime), CAST(0x0000A71B016726E3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (14, 7, 158, 1, CAST(0x0000A71B016740C0 AS DateTime), CAST(0x0000A71B016760F1 AS DateTime), CAST(0x0000A71B016760F1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (15, 7, 359, 1, CAST(0x0000A71B016740C0 AS DateTime), CAST(0x0000A71B01676D7D AS DateTime), CAST(0x0000A71B01676D7D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (16, 7, 56, 1, CAST(0x0000A71B016740C0 AS DateTime), CAST(0x0000A71B01677B17 AS DateTime), CAST(0x0000A71B01677B17 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (17, 7, 233, 1, CAST(0x0000A71B016813B0 AS DateTime), CAST(0x0000A71B01681A2A AS DateTime), CAST(0x0000A71B01681A2A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (18, 7, 216, 1, CAST(0x0000A71B016813B0 AS DateTime), CAST(0x0000A71B016831B1 AS DateTime), CAST(0x0000A71B016831B1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (19, 7, 43, 1, CAST(0x0000A71B016813B0 AS DateTime), CAST(0x0000A71B016854D1 AS DateTime), CAST(0x0000A71B016854D1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (20, 7, 99, 1, CAST(0x0000A71B01685A00 AS DateTime), CAST(0x0000A71B016878EC AS DateTime), CAST(0x0000A71B016878EC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (21, 7, 540, 1, CAST(0x0000A71B01685A00 AS DateTime), CAST(0x0000A71B0168982B AS DateTime), CAST(0x0000A71B0168982B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (22, 7, 80, 1, CAST(0x0000A71B0168E6A0 AS DateTime), CAST(0x0000A71B0168F6B3 AS DateTime), CAST(0x0000A71B0168F6B3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (23, 7, 273, 1, CAST(0x0000A71B01692CF0 AS DateTime), CAST(0x0000A71B01695588 AS DateTime), CAST(0x0000A71B01695588 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (24, 7, 477, 1, CAST(0x0000A71B01692CF0 AS DateTime), CAST(0x0000A71B016962C5 AS DateTime), CAST(0x0000A71B016962C5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (25, 7, 221, 1, CAST(0x0000A71B01697340 AS DateTime), CAST(0x0000A71B0169A5DE AS DateTime), CAST(0x0000A71B0169A5DE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (26, 7, 222, 1, CAST(0x0000A71B01697340 AS DateTime), CAST(0x0000A71B0169A74F AS DateTime), CAST(0x0000A71B0169A74F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (27, 7, 520, 1, CAST(0x0000A71B01697340 AS DateTime), CAST(0x0000A71B0169AF96 AS DateTime), CAST(0x0000A71B0169AF96 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (28, 7, 455, 1, CAST(0x0000A71B0169B990 AS DateTime), CAST(0x0000A71B0169BB4C AS DateTime), CAST(0x0000A71B0169BB4C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (29, 7, 133, 1, CAST(0x0000A71B0169B990 AS DateTime), CAST(0x0000A71B0169CB5C AS DateTime), CAST(0x0000A71B0169CB5C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (30, 7, 176, 1, CAST(0x0000A71B0169B990 AS DateTime), CAST(0x0000A71B0169F89A AS DateTime), CAST(0x0000A71B0169F89A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (31, 7, 237, 1, CAST(0x0000A71B0169FFE0 AS DateTime), CAST(0x0000A71B016A0BD5 AS DateTime), CAST(0x0000A71B016A0BD5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (32, 7, 103, 1, CAST(0x0000A71B016A4630 AS DateTime), CAST(0x0000A71B016A4710 AS DateTime), CAST(0x0000A71B016A4710 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (33, 7, 35, 1, CAST(0x0000A71B016A4630 AS DateTime), CAST(0x0000A71B016A7401 AS DateTime), CAST(0x0000A71B016A7401 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (34, 7, 36, 1, CAST(0x0000A71B016A4630 AS DateTime), CAST(0x0000A71B016A76B1 AS DateTime), CAST(0x0000A71B016A76B1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (35, 7, 206, 1, CAST(0x0000A71B016A8C80 AS DateTime), CAST(0x0000A71B016AA290 AS DateTime), CAST(0x0000A71B016AA290 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (36, 7, 197, 1, CAST(0x0000A71B016A8C80 AS DateTime), CAST(0x0000A71B016AB98F AS DateTime), CAST(0x0000A71B016AB98F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (37, 7, 535, 1, CAST(0x0000A71B016A8C80 AS DateTime), CAST(0x0000A71B016ACF49 AS DateTime), CAST(0x0000A71B016ACF49 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (38, 7, 342, 1, CAST(0x0000A71B016AD2D0 AS DateTime), CAST(0x0000A71B016ADA6D AS DateTime), CAST(0x0000A71B016ADA6D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (39, 7, 439, 1, CAST(0x0000A71B016AD2D0 AS DateTime), CAST(0x0000A71B016AE84D AS DateTime), CAST(0x0000A71B016AE84D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (40, 7, 334, 1, CAST(0x0000A71B016AD2D0 AS DateTime), CAST(0x0000A71B016B1585 AS DateTime), CAST(0x0000A71B016B1585 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (41, 7, 205, 1, CAST(0x0000A71B016B1920 AS DateTime), CAST(0x0000A71B016B2EA0 AS DateTime), CAST(0x0000A71B016B2EA0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (42, 7, 115, 1, CAST(0x0000A71B016B1920 AS DateTime), CAST(0x0000A71B016B47BD AS DateTime), CAST(0x0000A71B016B47BD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (43, 7, 123, 1, CAST(0x0000A71B016B5F70 AS DateTime), CAST(0x0000A71B016B77E3 AS DateTime), CAST(0x0000A71B016B77E3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (44, 7, 121, 1, CAST(0x0000A71B016B5F70 AS DateTime), CAST(0x0000A71B016B7967 AS DateTime), CAST(0x0000A71B016B7967 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (45, 7, 305, 1, CAST(0x0000A71B016BA5C0 AS DateTime), CAST(0x0000A71B016BB76A AS DateTime), CAST(0x0000A71B016BB76A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (46, 7, 502, 1, CAST(0x0000A71B016BEC10 AS DateTime), CAST(0x0000A71B016C0A63 AS DateTime), CAST(0x0000A71B016C0A63 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (47, 7, 277, 1, CAST(0x0000A71B016BEC10 AS DateTime), CAST(0x0000A71B016C2F82 AS DateTime), CAST(0x0000A71B016C2F82 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (48, 7, 144, 1, CAST(0x0000A71B016C3260 AS DateTime), CAST(0x0000A71B016C4541 AS DateTime), CAST(0x0000A71B016C4541 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (49, 7, 301, 1, CAST(0x0000A71B016C3260 AS DateTime), CAST(0x0000A71B016C51A7 AS DateTime), CAST(0x0000A71B016C51A7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (50, 7, 319, 1, CAST(0x0000A71B016C3260 AS DateTime), CAST(0x0000A71B016C5F89 AS DateTime), CAST(0x0000A71B016C5F89 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (51, 7, 424, 1, CAST(0x0000A71B016C78B0 AS DateTime), CAST(0x0000A71B016C8842 AS DateTime), CAST(0x0000A71B016C8842 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (52, 7, 77, 1, CAST(0x0000A71B016CBF00 AS DateTime), CAST(0x0000A71B016CD8BD AS DateTime), CAST(0x0000A71B016CD8BD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (53, 7, 4, 1, CAST(0x0000A71B016D0550 AS DateTime), CAST(0x0000A71B016D3E9D AS DateTime), CAST(0x0000A71B016D3E9D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (54, 7, 280, 1, CAST(0x0000A71B016D4BA0 AS DateTime), CAST(0x0000A71B016D6311 AS DateTime), CAST(0x0000A71B016D6311 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (55, 7, 282, 1, CAST(0x0000A71B016D4BA0 AS DateTime), CAST(0x0000A71B016D64F4 AS DateTime), CAST(0x0000A71B016D64F4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (56, 7, 135, 1, CAST(0x0000A71B016D4BA0 AS DateTime), CAST(0x0000A71B016D7A6A AS DateTime), CAST(0x0000A71B016D7A6A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (57, 7, 353, 1, CAST(0x0000A71B016DD840 AS DateTime), CAST(0x0000A71B016DE648 AS DateTime), CAST(0x0000A71B016DE648 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (58, 7, 30, 1, CAST(0x0000A71B016E64E0 AS DateTime), CAST(0x0000A71B016E7C97 AS DateTime), CAST(0x0000A71B016E7C97 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (59, 7, 70, 1, CAST(0x0000A71B016E64E0 AS DateTime), CAST(0x0000A71B016E8C4B AS DateTime), CAST(0x0000A71B016E8C4B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (60, 7, 360, 1, CAST(0x0000A71B016EAB30 AS DateTime), CAST(0x0000A71B016EB4CD AS DateTime), CAST(0x0000A71B016EB4CD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (61, 7, 433, 1, CAST(0x0000A71B016EAB30 AS DateTime), CAST(0x0000A71B016EC180 AS DateTime), CAST(0x0000A71B016EC180 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (62, 7, 55, 1, CAST(0x0000A71B016EAB30 AS DateTime), CAST(0x0000A71B016EDF1A AS DateTime), CAST(0x0000A71B016EDF1A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (63, 7, 183, 1, CAST(0x0000A71B016EF180 AS DateTime), CAST(0x0000A71B016F00F9 AS DateTime), CAST(0x0000A71B016F00F9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (64, 7, 66, 1, CAST(0x0000A71B016EF180 AS DateTime), CAST(0x0000A71B016F155C AS DateTime), CAST(0x0000A71B016F155C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (65, 7, 486, 1, CAST(0x0000A71B016EF180 AS DateTime), CAST(0x0000A71B016F257E AS DateTime), CAST(0x0000A71B016F257E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (66, 7, 307, 1, CAST(0x0000A71B016F37D0 AS DateTime), CAST(0x0000A71B016F63EA AS DateTime), CAST(0x0000A71B016F63EA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (67, 7, 539, 1, CAST(0x0000A71B016F7E20 AS DateTime), CAST(0x0000A71B016FA197 AS DateTime), CAST(0x0000A71B016FA197 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (68, 7, 51, 1, CAST(0x0000A71B016F7E20 AS DateTime), CAST(0x0000A71B016FC45F AS DateTime), CAST(0x0000A71B016FC45F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (69, 7, 268, 1, CAST(0x0000A71B016FC470 AS DateTime), CAST(0x0000A71B016FE2AC AS DateTime), CAST(0x0000A71B016FE2AC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (70, 7, 271, 1, CAST(0x0000A71B01700AC0 AS DateTime), CAST(0x0000A71B01704946 AS DateTime), CAST(0x0000A71B01704946 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (71, 7, 361, 1, CAST(0x0000A71B01705110 AS DateTime), CAST(0x0000A71B01705A30 AS DateTime), CAST(0x0000A71B01705A30 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (72, 7, 327, 1, CAST(0x0000A71B01705110 AS DateTime), CAST(0x0000A71B0170956E AS DateTime), CAST(0x0000A71B0170956E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (73, 7, 241, 1, CAST(0x0000A71B01709760 AS DateTime), CAST(0x0000A71B01709CBB AS DateTime), CAST(0x0000A71B01709CBB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (74, 7, 84, 1, CAST(0x0000A71B01709760 AS DateTime), CAST(0x0000A71B0170AB2D AS DateTime), CAST(0x0000A71B0170AB2D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (75, 7, 212, 1, CAST(0x0000A71B01709760 AS DateTime), CAST(0x0000A71B0170BFD1 AS DateTime), CAST(0x0000A71B0170BFD1 AS DateTime))
SET IDENTITY_INSERT [dbo].[Att_Attendance] OFF
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 02/15/2017 22:25:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EventSchedule_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Att_Event] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule] CHECK CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Att_Attendee_Att_City]    Script Date: 02/15/2017 22:25:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Att_Attendee_Att_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[Att_City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] CHECK CONSTRAINT [FK_Att_Attendee_Att_City]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 02/15/2017 22:25:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Attendee_Zone] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[Att_Zone] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] CHECK CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 02/15/2017 22:25:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Attendee] FOREIGN KEY([AttendeeId])
REFERENCES [dbo].[Att_Attendee] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] CHECK CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 02/15/2017 22:25:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_EventSchedule] FOREIGN KEY([EventScheduleId])
REFERENCES [dbo].[Att_EventSchedule] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] CHECK CONSTRAINT [FK_Attendance_EventSchedule]
GO
