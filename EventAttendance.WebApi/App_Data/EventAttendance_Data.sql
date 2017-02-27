USE [EventAttendance]
GO
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule] DROP CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Att_Attendee_Att_City]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Att_Attendee_Att_City]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_EventSchedule]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendancesByEventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendancesByEventSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendancesByEventSchedule]
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendance]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_SaveAttendance]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByAttendee]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByAttendee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetReportByAttendee]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByEventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByEventSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetReportByEventSchedule]
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_SaveAttendee]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeeById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendeeById]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendees]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendees]
GO
/****** Object:  Table [dbo].[Att_Attendance]    Script Date: 02/26/2017 23:19:53 ******/
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
/****** Object:  Table [dbo].[Att_Attendee]    Script Date: 02/26/2017 23:19:53 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetCities]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetCities]
GO
/****** Object:  Table [dbo].[Att_EventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 02/26/2017 23:19:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetZones]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetZones]
GO
/****** Object:  Table [dbo].[Att_Zone]    Script Date: 02/26/2017 23:19:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Zone]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Zone]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSlotsForDate]    Script Date: 02/26/2017 23:19:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSlotsForDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetSlotsForDate]
GO
/****** Object:  Table [dbo].[Att_City]    Script Date: 02/26/2017 23:19:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_City]') AND type in (N'U'))
DROP TABLE [dbo].[Att_City]
GO
/****** Object:  Table [dbo].[Att_Event]    Script Date: 02/26/2017 23:19:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Event]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Event]
GO
/****** Object:  Table [dbo].[Att_Event]    Script Date: 02/26/2017 23:19:48 ******/
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
/****** Object:  Table [dbo].[Att_City]    Script Date: 02/26/2017 23:19:51 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetSlotsForDate]    Script Date: 02/26/2017 23:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSlotsForDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[GetSlotsForDate](@EventDate DATETIME)
RETURNS @tblSlots TABLE 
(
    Slot1 DATETIME,
    Slot2 DATETIME,
    Slot3 DATETIME
)
AS 
BEGIN

   	DECLARE @Slot1 DATETIME = @EventDate, @Slot2 DATETIME = @EventDate, @Slot3 DATETIME = @EventDate 
	
	SET @Slot1 = DATEADD(HOUR,	 16, @Slot1)
	SET @Slot2 = DATEADD(HOUR,	 16, @Slot2); SET @Slot2 = DATEADD(MINUTE, 15, @Slot2)
	SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 30, @Slot3)

    INSERT @tblSlots
        SELECT @Slot1, @Slot2, @Slot3;
    RETURN;
END;
' 
END
GO
/****** Object:  Table [dbo].[Att_Zone]    Script Date: 02/26/2017 23:19:52 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetZones]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.Att_GetZones
CREATE PROCEDURE [dbo].[Att_GetZones]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.Att_Zone 
END

' 
END
GO
/****** Object:  Table [dbo].[Att_EventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
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
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (7, 1, CAST(0x733C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (8, 1, CAST(0x263C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (9, 1, CAST(0x1F3C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (10, 1, CAST(0xF53B0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (11, 1, CAST(0xEE3B0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (12, 1, CAST(0x7A3C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (13, 1, CAST(0x813C0B00 AS Date), 1)
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (14, 1, CAST(0x883C0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Att_EventSchedule] OFF
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetCities]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.Att_GetZones
CREATE PROCEDURE [dbo].[Att_GetCities]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.Att_City 
END

' 
END
GO
/****** Object:  Table [dbo].[Att_Attendee]    Script Date: 02/26/2017 23:19:53 ******/
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
	[MiddleName] [nvarchar](50) NULL,
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
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (1, N'Aarjav', N'', N'Patel', N'M', N'6827 Creft Cir', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (2, N'Abhi', NULL, N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (3, N'Abhilasha', NULL, N'Mansinghka', N'F', N'11005 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (4, N'Ajay', NULL, N'Patel', N'M', N'280 Indian Trl', N'Yes', 1, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (5, N'Ajay', NULL, N'Patel', N'M', N'302 Salem Rd', N'No', 0, 20, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (6, N'Ajay', N'Mahendrabhai', N'Patel', N'M', N'8767 Savannah Rd', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (7, N'Akash', NULL, N'Patel', N'M', N'2011 Apogee Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (8, N'Aksh', N'Vasant', N'Patel', N'M', N'2766 Lake Wylie Dr', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (9, N'Akshar', NULL, N'Gajjar', N'M', N'8731 Darcy Hopkins Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (10, N'Akshar', NULL, N'Patel', N'M', N'1719 Funny Cide Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (11, N'Akshar', NULL, N'Patel', N'M', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (12, N'Akshar', N'Ashish', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (13, N'Alka', NULL, N'Patel', N'F', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (14, N'Alka', NULL, N'Patel', N'F', N'17416 Campbell Hall Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (15, N'Alpa', NULL, N'Patel', N'F', N'1719 Funny Cide Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (16, N'Alpaben', NULL, N'Patel', N'F', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (17, N'Alpesh', NULL, N'Patel', N'M', N'7318 Timberneck Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (18, N'Aman', NULL, N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (19, N'Ambalal', NULL, N'Patel', N'M', N'4110 Shasta Cir', N'No', 0, 3, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (20, N'Amit', NULL, N'Patel', N'M', N'110 Stone Ridge Dr', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (21, N'Anchal', NULL, N'Patel', N'F', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (22, N'Anil', NULL, N'Patel', N'M', N'132 W Main St', N'No', 0, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (23, N'Anil', NULL, N'Patel', N'M', N'325 US Highway 70 SW', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (24, N'Anil', NULL, N'Patel', N'M', N'5892 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (25, N'Anjana', NULL, N'Patel', N'F', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (26, N'Anju', NULL, N'Patel', N'F', N'6406 Derby Way', N'Yes', 1, 29, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (27, N'Ankit', NULL, N'Babariya', N'M', N'8525 Dahlia Dr Apt 207', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (28, N'Ankit', NULL, N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (29, N'Ankit', NULL, N'Kumbhani', N'M', N'8209 University Ridge Dr, apt # 107', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (30, N'Ankur', NULL, N'Patel', N'M', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (31, N'APUR', NULL, N'KAMDAR', N'M', N'6405 STONE RIDGE CT', N'No', 0, 12, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (32, N'Arti', NULL, N'patel', N'F', N'2616 Brackley Pl NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (33, N'Arvind', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (34, N'Arvind', NULL, N'Patel', N'M', N'2718 Gastonia Dallas Hwy', N'Yes', 1, 6, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (35, N'Ashish', NULL, N'Patel', N'M', N'1236 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (36, N'Ashish', NULL, N'Patel', N'M', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (37, N'Ashok', NULL, N'Patel', N'M', N'2413 Arden Gate Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (38, N'Ashok', NULL, N'Patel', N'M', N'6085 Creekview Ct', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (39, N'Ashok', NULL, N'Patel', N'M', N'9607 Springholm Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (40, N'Ashok', NULL, N'Patel', N'M', N'9607 Springholn Dr', N'No', 0, 2, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (41, N'Ashwi', NULL, N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (42, N'Asit', NULL, N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (43, N'Atul', NULL, N'Patel', N'M', N'1040 Conestoga Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (44, N'Atul', NULL, N'Patel', N'M', N'121 Peoria Ln', N'No', 0, 14, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (45, N'Atul', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (46, N'Avanee', NULL, N'Patel', N'F', N'110 Stone Ridge Dr', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (47, N'Ayushi', NULL, N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (48, N'Babu', NULL, N'Patel', N'M', N'11925 Southcrest Ln', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (49, N'Badal', NULL, N'Patel', N'M', N'413 College Dr', N'Yes', 1, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (50, N'Bakula', N'Jayantibhai', N'Patel', N'F', N'1909 Wexford Meadows Ln Apt H', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (51, N'Baldev', NULL, N'Patel', N'M', N'17416 Campbell Hall Ct', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (52, N'Bela', NULL, N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (53, N'Bhagvati', NULL, N'Gajjar', N'F', N'8731 Darcy Hopkins Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (54, N'Bhakti', NULL, N'patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (55, N'Bhalchandra', NULL, N'Patel', N'M', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (56, N'Bharat', NULL, N'Parmar', N'M', N'2312 US Highway 52 N', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (57, N'Bharat', NULL, N'Patel', N'M', N'1201 Highway 9 Byp W', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (58, N'Bharat', NULL, N'Patel', N'M', N'1213 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (59, N'Bharti', NULL, N'Shah', N'F', N'9946 Nicole Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (60, N'Bhavana', NULL, N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (61, N'Bhavanaben', N'P', N'Patel', N'F', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (62, N'Bhavesh', N'Kanubhai', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (63, N'Bhavin', N'M', N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (64, N'Bhavini', NULL, N'Darji', N'F', N'6732 Allness Glen Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (65, N'Bhavna', NULL, N'Gajjar', N'F', N'3821 Trappers Run Dr', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (66, N'Bholabhai', NULL, N'Patel', N'M', N'2800 Foxwood Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (67, N'Bhowmik', NULL, N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (68, N'Bhumi', NULL, N'Patel', N'F', N'10125 University Park Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (69, N'Bhumi', NULL, N'Patel', N'F', N'132 W Main St', N'No', 0, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (70, N'Bhupendra', NULL, N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (71, N'Bhupesh', NULL, N'Patel', N'M', N'19408 Fridley Ln', N'No', 0, 5, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (72, N'Bindu', NULL, N'Patel', N'F', N'11925 Southcrest Ln', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (73, N'Bipin', NULL, N'Patel', N'M', N'2525 Lawyers Rd W', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (74, N'Bipin', NULL, N'Patel', N'M', N'5891 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (75, N'Chanchal', NULL, N'Patel', N'F', N'6235 Hermsley Rd', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (76, N'Chandni', NULL, N'Patel', N'F', N'413 College Dr', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (77, N'Chandrakant', NULL, N'Gajjar', N'M', N'3821 Trappers Run Dr', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (78, N'Chandrakant', NULL, N'Suthar', N'M', N'10465 Stokeshill Ct', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (79, N'Chandrakant', N'S', N'Suthar', N'M', N'15739 Greythorne Dr. Apt#103', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (80, N'Chandresh', NULL, N'Patel', N'M', N'1719 Funny Cide Dr', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (81, N'Chandrika', NULL, N'Patel', N'F', N'1040 Conestoga Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (82, N'Chandu', NULL, N'Patel', N'M', N'360 Ivy Park Ln', N'No', 0, 31, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (83, N'Chandu', NULL, N'Patel', N'M', N'7413 Chital Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (84, N'Chetan', NULL, N'Desai', N'M', N'2911 Bridle Brook Way', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (85, N'Chiman', NULL, N'Patel', N'M', N'8801 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (86, N'Daksh', NULL, N'Desai', N'M', N'2911 Bridle Brook Way', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (87, N'Daksha', NULL, N'Patel', N'F', N'2525 Lawyers Rd W', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (88, N'Damukaka', NULL, N'Patel', N'M', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (89, N'Darshan', NULL, N'Patel', N'M', N'8347 Marigold Pl', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (90, N'Dasharath', NULL, N'Patel', N'M', N'5444 Allison Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (91, N'Daxa', NULL, N'Patel', N'F', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (92, N'Dev', NULL, N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (93, N'Devan', NULL, N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (94, N'Dharmendra', NULL, N'Patel', N'M', N'4864 Annelise Dr', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (95, N'Dhayana', NULL, N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (96, N'Dhriti', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (97, N'Dhwani', N'Alpesh', N'Patel', N'F', N'7318 Timberneck Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (98, N'Dilip', NULL, N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (99, N'Dilip', NULL, N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (100, N'Dilip', N'Harmanbhai', N'Patel', N'M', N'6406 Derby Way', N'Yes', 1, 29, 7)
GO
print 'Processed 100 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (101, N'Dimpal', N'Rahul', N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (102, N'Dinesh', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (103, N'DIP', NULL, N'PATEL', N'M', N'234 S Main St', N'Yes', 1, 11, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (104, N'Dipika', NULL, N'Patel', N'F', N'9217 Unbridle Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (105, N'Dipti', NULL, N'Desai', N'F', N'2911 Bridle Brook Way', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (106, N'Dipti', NULL, N'Patel', N'F', N'6827 Creft Cir', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (107, N'Divya', NULL, N'Patel', N'F', N'4101 Regency Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (108, N'Divyesh', NULL, N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (109, N'Diya', NULL, N'Patel', N'F', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (110, N'Drashti', NULL, N'Patel', N'F', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (111, N'Drupad', NULL, N'Patel', N'M', N'9424 Autumn Applause Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (112, N'Dushyant', NULL, N'Gajjar', N'M', N'4029 Raccoon Run Ct', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (113, N'Eshani', NULL, N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (114, N'Eshna', NULL, N'Hira', N'F', N'138 Norman Station Blvd', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (115, N'Fatehsinh', NULL, N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (116, N'Gautam', NULL, N'Mansinghka', N'M', N'11005 Sedgemoor Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (117, N'Gautam', NULL, N'Patel', N'M', N'3600 Mooreland Farms Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (118, N'Gautami', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (119, N'Geeta', NULL, N'Patel', N'F', N'5815 Langwell Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (120, N'Geeta', NULL, N'Patel', N'F', N'7301 Conifer Ct', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (121, N'Ghanshyam', NULL, N'Patel', N'M', N'117 Lily Green Ct NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (122, N'Ghanshyam', NULL, N'Patel', N'M', N'12303 Summer Breeze Ct', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (123, N'Ghanshyam', NULL, N'Patel', N'M', N'1516 Concord Pkwy N', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (124, N'Gia', NULL, N'Patel', N'F', N'9016 Tamarron Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (125, N'Girish', NULL, N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (126, N'Girish', NULL, N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (127, N'Hansa', NULL, N'Patel', N'F', N'2013 Gloucester St', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (128, N'Hansa', NULL, N'Patel', N'F', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (129, N'Hari', N'P', N'Parmar', N'M', N'9500 Marsena Ct', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (130, N'Harikrishna', NULL, N'Patel', N'M', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (131, N'Harikrishna', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (132, N'Harini', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (133, N'Harish', NULL, N'Patel', N'M', N'625 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (134, N'Harsha', NULL, N'Parmar', N'F', N'9406 Vera Jones Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (135, N'Harshad', NULL, N'Patel', N'M', N'9620 Puddle Duck Rd Apt 305', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (136, N'Harshadbhai', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (137, N'Harshita', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (138, N'Hasmukh', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (139, N'Hasumati', NULL, N'Patel', N'F', N'625 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (140, N'Hema', NULL, N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (141, N'Hemal', N'V', N'Patadia', N'M', N'8209 Univrsty Rdge Dr Apt 107', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (142, N'Hemani', NULL, N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (143, N'Hemant', NULL, N'Gajjar', N'M', N'8731 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (144, N'Hemant', NULL, N'Patel', N'M', N'10742 Derryrush Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (145, N'Hemlata', NULL, N'Darji', N'F', N'7307 Brigmore Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (146, N'Heta', NULL, N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (147, N'Hetal', N'Ankit', N'Thakkar', N'F', N'11405 Colony Grove Ln Apt 721', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (148, N'Himani', N'Ashish', N'Patel', N'F', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (149, N'Himanshu', NULL, N'Patel', N'M', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (150, N'Himanshu', NULL, N'Patel', N'M', N'2912 Parkway Blvd', N'Yes', 1, 25, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (151, N'Hina', NULL, N'patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (152, N'Hipal', NULL, N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (153, N'Hiral', NULL, N'Patel', N'F', N'4864 Annelise Dr', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (154, N'Hiren', N'Mehul', N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (155, N'Hiren', NULL, N'Patel', N'M', N'4011 Ainsdale Dr', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (156, N'Hiren', N'N', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (157, N'Indira', NULL, N'Patel', N'F', N'2912 Parkway Blvd', N'No', 0, 25, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (158, N'Indrasinh', NULL, N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (159, N'Jagat', NULL, N'Patel', N'M', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (160, N'Jagdish', NULL, N'Patel', N'M', N'1816 Damascus St', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (161, N'Jagdish', NULL, N'Patel', N'M', N'2013 Gloucester St', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (162, N'Jagdish', NULL, N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (163, N'Jagruti', NULL, N'Patel', N'F', N'638 Ridge St', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (164, N'Jagruti', N'H', N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (165, N'Jai', NULL, N'Patel', N'M', N'7318 Timberneck Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (166, N'Jainith', NULL, N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (167, N'Jalpa', NULL, N'Patel', N'F', N'4864 Annelise Dr', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (168, N'Janak', NULL, N'Amin', N'M', N'1395 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (169, N'Janki', NULL, N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (170, N'Janki', NULL, N'Patel', N'F', N'2005 Belleforest Ct', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (171, N'Janki', NULL, N'Patel', N'F', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (172, N'Janu', NULL, N'Patel', N'M', N'1236 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (173, N'Janvi', N'Dharmendra', N'Patel', N'F', N'4864 Annelise Dr', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (174, N'Jash', NULL, N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (175, N'Jay', NULL, N'Parmar', N'M', N'14952 Havasu St', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (176, N'Jay', NULL, N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (177, N'Jaya', NULL, N'Patel', N'F', N'9725 Capella Ave NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (178, N'Jayan', NULL, N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (179, N'Jayant', NULL, N'Patel', N'M', N'200 Henson St', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (180, N'Jayant', NULL, N'Patel', N'M', N'9725 Capella Ave NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (181, N'Jayantibhai', N'Ranchhodbhai', N'Patel', N'M', N'1909 Wexford Meadows Ln Apt H', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (182, N'Jayantilal', NULL, N'Panara', N'M', N'9123 Royal Highlands Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (183, N'Jayantilal', NULL, N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (184, N'Jayendra', NULL, N'Darji', N'M', N'7307 Brigmore Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (185, N'Jayendra', NULL, N'Patel', N'M', N'13410 Mallard Lake Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (186, N'Jayesh', NULL, N'Patel', N'M', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (187, N'Jayna', N'Sanjeet', N'Patel', N'F', N'2413 Arden Gate Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (188, N'Jayshree', NULL, N'Patel', N'F', N'5800 Shadow Creek Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (189, N'Jayshri', NULL, N'Patel', N'F', N'10742 Derryrush Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (190, N'Jeet', NULL, N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (191, N'Jeet', NULL, N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (192, N'Jeram', NULL, N'Patel', N'M', N'1003 Garden Rose Ct', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (193, N'Jigar', NULL, N'Patel', N'M', N'14044 Lissadell Cir', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (194, N'Jigna', NULL, N'Patel', N'F', N'3730 US Highway 601', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (195, N'Jigna', NULL, N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (196, N'Jimmy', NULL, N'Patel', N'M', N'5001 Oxfordshire Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (197, N'Jitendra', NULL, N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', 1, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (198, N'Jual', NULL, N'Patel', N'F', N'4011 Ainsdale Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (199, N'Juhi', N'Kalpesh', N'Ram', N'F', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (200, N'Jyoti', NULL, N'Patel', N'F', N'117 Lily Green Ct NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (201, N'Jyoti', NULL, N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
GO
print 'Processed 200 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (202, N'Jyoti', NULL, N'Patel', N'F', N'9052 Magnolia Lily Ave', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (203, N'Jyotiben', NULL, N'Modi', N'F', N'350 Venus St', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (204, N'Jyotika', NULL, N'Gajjar', N'F', N'3821 Trappers Run Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (205, N'Jyotindra', NULL, N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (206, N'Jyotish', NULL, N'Patel', N'M', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (207, N'Jyotsna', NULL, N'Parmar', N'F', N'2312 US Highway 52 N', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (208, N'Jyotsna', NULL, N'Patel', N'F', N'2710 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (209, N'Kalpana', NULL, N'Parmar', N'F', N'15324 Yellowstone Springs Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (210, N'Kalpana', NULL, N'Patel', N'F', N'109 Country Club Dr', N'No', 0, 27, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (211, N'Kalpana', NULL, N'Patel', N'F', N'12902 Cleopatra Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (212, N'Kalpesh', N'Shantilal', N'Ram', N'M', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (213, N'Kalpu', NULL, N'Patel', N'F', N'1209 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (214, N'Kamala', NULL, N'Patel', N'F', N'5001 Oxfordshire Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (215, N'Kamlesh', NULL, N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (216, N'Kamlesh', NULL, N'Patel', N'M', N'1946 9th Street Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (217, N'Kamu', NULL, N'Patel', N'F', N'1003 Garden Rose Ct', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (218, N'Kanji', N'Kalpesh', N'Ram', N'M', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (219, N'Kanta', NULL, N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (220, N'Kanu', NULL, N'Patel', N'M', N'11214 Sedgemoor Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (221, N'Kaushik', NULL, N'Patel', N'M', N'17123 Westmill Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (222, N'Kaushik', NULL, N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (223, N'Kena', NULL, N'Patel', N'F', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (224, N'Ketan', N'C', N'Suthar', N'M', N'15739 Greythorne Dr. Apt#103', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (225, N'Ketki', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (226, N'Ketu', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (227, N'Ketul', NULL, N'Patel', N'M', N'5891 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (228, N'Keyuri', N'B', N'Patel', N'F', N'4100 Margaret Wallace Rd', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (229, N'Keyuri', N'B', N'Patel', N'F', N'552 Fair Oaks Dr', N'No', 0, 7, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (230, N'Khusbu', NULL, N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (231, N'Khushbu', NULL, N'Patel', N'F', N'421 Elizabeth Ave', N'No', 0, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (232, N'Khushi', NULL, N'Gajjar', N'F', N'8731 Darcy Hopkins Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (233, N'Kinal', NULL, N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (234, N'Kinjal', NULL, N'Patel', N'F', N'5892 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (235, N'Kiran', NULL, N'Patel', N'M', N'8623 Sedgeburn Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (236, N'Kirit', N'D', N'Parmar', N'M', N'9406 Vera Jones Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (237, N'Kirit', NULL, N'Patel', N'M', N'7903 Hereford St', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (238, N'Kiron', NULL, N'Patel', N'M', N'4330 Old Interstate Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (239, N'Kirtan', NULL, N'Patel', N'M', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (240, N'Kirtan', NULL, N'Patel', N'M', N'9217 Unbridle Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (241, N'Kirti', NULL, N'Parmar', N'M', N'14952 Havasu St', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (242, N'Kirti', NULL, N'Patel', N'F', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (243, N'Koki', NULL, N'Rathod', N'F', N'644 W Prospect Rd', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (244, N'Kokila', NULL, N'Patel', N'F', N'4330 Old Interstate Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (245, N'Krina', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (246, N'Krisha', NULL, N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (247, N'Krishna', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (248, N'Krishna', NULL, N'Rathod', N'F', N'644 W Prospect Rd', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (249, N'Krupa', N'B', N'Patel', N'F', N'4100 Margaret Wallace Rd', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (250, N'Kruti', NULL, N'Patel', N'F', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (251, N'Kumud', NULL, N'Brahmbhatt', N'F', N'5908 Hoover St', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (252, N'Kumud', NULL, N'Patel', N'F', N'9607 Springholm Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (253, N'Kunali', NULL, N'Shah', N'F', N'9946 Nicole Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (254, N'Kunjal', NULL, N'Patel', N'F', N'7000 Joyful Noise Ln', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (255, N'Kush', N'Girish', N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (256, N'Laksh', NULL, N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (257, N'Lalita', NULL, N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (258, N'Lata', NULL, N'Patel', N'F', N'3019 Ernest Russell Ct', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (259, N'Laxmi', NULL, N'Parmar', N'F', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (260, N'Leena', NULL, N'Parmar', N'F', N'14952 Havasu St', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (261, N'Lila', NULL, N'Patel', N'F', N'2718 Gastonia Dallas Hwy', N'No', 0, 6, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (262, N'Lila', NULL, N'Patel', N'F', N'5892 Bakers Pt', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (263, N'Lilaben', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (264, N'Madhu', NULL, N'Patel', N'F', N'1201 Highway 9 Byp W', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (265, N'Madhu', NULL, N'Patel', N'M', N'4110 Shasta Cir', N'No', 0, 3, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (266, N'Madhu', NULL, N'Patel', N'F', N'4330 Old Interstate Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (267, N'Mahek', NULL, N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (268, N'Mahendra', NULL, N'Brahmbhatt', N'M', N'5908 Hoover St', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (269, N'Mahendra', NULL, N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (270, N'Mahendra', NULL, N'Patel', N'M', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (271, N'Mahendra', NULL, N'Suthar', N'M', N'7015 Brighton Brook Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (272, N'Mahesh', NULL, N'Patel', N'M', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (273, N'Mahesh', NULL, N'Patel', N'M', N'303 N Maple St', N'Yes', 1, 22, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (274, N'Mahip', N'Prashant', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (275, N'Mamta', NULL, N'Patel', N'F', N'132 W Main St', N'Yes', 1, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (276, N'Manav', NULL, N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (277, N'Mangaldas', NULL, N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (278, N'Manisha', NULL, N'Patel', N'F', N'421 Elizabeth Ave', N'Yes', 1, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (279, N'Manoj', NULL, N'Patel', N'M', N'413 College Dr', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (280, N'Mayur', NULL, N'Patel', N'M', N'10838 Stone Bunker Dr', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (281, N'Mayur', NULL, N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (282, N'Mayur', NULL, N'Patel', N'M', N'7903 Hereford St', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (283, N'Mayur', NULL, N'Patel', N'M', N'818 20th Avenue Pl SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (284, N'Mayuri', N'Prabodhbhai', N'Patel', N'F', N'2630 Gosling Terrace Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (285, N'Meena', NULL, N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (286, N'Meena', NULL, N'Patel', N'F', N'1516 Concord Pkwy N', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (287, N'Meena', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (288, N'Megha', N'Kalpesh', N'Ram', N'F', N'925 Bendix Dr', N'No', 0, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (289, N'Mehul', NULL, N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (290, N'Mehul', NULL, N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (291, N'Mihir', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (292, N'Milan', NULL, N'Patel', N'M', N'1516 Concord Pkwy N', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (293, N'Mina', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (294, N'Minal', NULL, N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (295, N'Minal', NULL, N'Patel', N'F', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (296, N'Minaxi', NULL, N'Patel', N'F', N'8347 Marigold Pl', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (297, N'Mita', NULL, N'Patel', N'F', N'2526 King Arthur Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (298, N'Mital', N'B', N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (299, N'Mumukshu', NULL, N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (300, N'Naiya', NULL, N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (301, N'Nalin', NULL, N'Patel', N'M', N'6625 Rollingridge Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (302, N'Nalini', NULL, N'Patel', N'F', N'12303 Summer Breeze Ct', N'No', 0, 2, 11)
GO
print 'Processed 300 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (303, N'Nalini', NULL, N'Patel', N'F', N'207 N Jackson Rd # A', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (304, N'Nandita', NULL, N'Gajjar', N'F', N'6904 Whitebeam Way', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (305, N'Narendra', NULL, N'Patel', N'M', N'9052 Magnolia Lily Ave', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (306, N'Natasha', NULL, N'Shah', N'F', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (307, N'Natubhai', N'R', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (308, N'Natvar', NULL, N'Patel', N'M', N'1134 Jade Glen Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (309, N'Natvarlal', NULL, N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (310, N'Navin', NULL, N'Patel', N'M', N'3019 Ernest Russell Ct', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (311, N'Nayanjyoth', NULL, N'Patel', N'F', N'6085 Creekview Ct', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (312, N'Neeya', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (313, N'Neeyal', NULL, N'Patel', N'M', N'17416 Campbell Hall Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (314, N'Nehal', NULL, N'Patel', N'M', N'10125 University Park Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (315, N'Nehal', NULL, N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (316, N'Nehal', N'Vasant', N'Patel', N'F', N'2766 Lake Wylie Dr', N'Yes', 1, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (317, N'Neil', NULL, N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', 1, 27, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (318, N'Neti', N'Dharmenrda', N'Patel', N'F', N'4864 Annelise Dr', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (319, N'Nikhil', NULL, N'Patel', N'M', N'9016 Tamarron Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (320, N'Nikita', NULL, N'Parmar', N'F', N'9406 Vera Jones Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (321, N'Nikita', NULL, N'Patel', N'F', N'8767 Savannah Rd', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (322, N'Nikul', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (323, N'Nila', NULL, N'Patel', N'F', N'138 Norman Station Blvd', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (324, N'Nilam', NULL, N'Patel', N'F', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (325, N'Nilanjana', NULL, N'Patel', N'F', N'303 N Maple St', N'No', 0, 22, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (326, N'Nilesh', NULL, N'Patel', N'M', N'10610 Bere Island Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (327, N'Nilesh', NULL, N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (328, N'Nilesh', NULL, N'Shah', N'M', N'9946 Nicole Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (329, N'Nilu', NULL, N'Patel', N'F', N'7318 Timberneck Ct', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (330, N'Nimesh', NULL, N'Patel', N'M', N'552 Fair Oaks Dr', N'Yes', 1, 7, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (331, N'Nimesh', NULL, N'Patel', N'M', N'8623 Sedgeburn Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (332, N'Nimisha', NULL, N'Patel', N'F', N'413 College Dr', N'No', 0, 24, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (333, N'Nimita', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (334, N'Niranjan', NULL, N'Patel', N'M', N'638 Ridge St', N'Yes', 1, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (335, N'Niranjan', NULL, N'Patel', N'M', N'7301 Conifer Ct', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (336, N'Nishal', NULL, N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (337, N'Nita', NULL, N'Patel', N'F', N'221 Cattle Ridge Rd', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (338, N'Nita', NULL, N'Shah', N'F', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (339, N'Niyam', NULL, N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (340, N'Niyati', NULL, N'Patel', N'F', N'17416 Campbell Hall Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (341, N'Padma', NULL, N'Patel', N'F', N'7413 Chital Rd', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (342, N'Pankaj', N'M', N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (343, N'Param', NULL, N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (344, N'Paresh', NULL, N'Patel', N'M', N'1204 Somerset Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (345, N'Paresh', N'K', N'Sutariya', N'M', N'10119 Oxford Landing Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (346, N'Parina', NULL, N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (347, N'Parth', NULL, N'Patel', N'M', N'3275 Edgeland Hwy', N'No', 0, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (348, N'Parth', N'P', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (349, N'Payal', NULL, N'Gajjar', N'F', N'8731 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (350, N'Pinky', NULL, N'Patel', N'F', N'4011 Ainsdale Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (351, N'Pooja', N'A', N'Kamdar', N'F', N'6405 STONE RIDGE CT', N'No', 0, 12, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (352, N'Prabhudas', NULL, N'Darji', N'M', N'7307 Brigmore Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (353, N'Prabhudas', NULL, N'Patel', N'M', N'5815 Langwell Ln', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (354, N'Prabodh', NULL, N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (355, N'PRADIP', NULL, N'PATEL', N'M', N'2721 Winnsboro Rd', N'No', 0, 21, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (356, N'Praful', NULL, N'Patel', N'M', N'8623 Sedgeburn Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (357, N'Pramit', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (358, N'Pranjali', NULL, N'Patel', N'F', N'10610 Bere Island Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (359, N'Prashant', N'D', N'Parmar', N'M', N'9500 Marsena Ct', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (360, N'Prashant', NULL, N'Patel', N'M', N'6827 Creft Cir', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (361, N'Prashant', NULL, N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (362, N'Pravika', N'Ketan', N'Suthar', N'F', N'15739 Greythorne Dr. Apt#103', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (363, N'Pravin', NULL, N'Patel', N'M', N'1608 E Roosevelt Blvd', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (364, N'Pravin', NULL, N'Patel', N'M', N'302 Salem Rd', N'No', 0, 20, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (365, N'Pravin', NULL, N'Patel', N'M', N'5892 Bakers Pt', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (366, N'Pravinchandra', NULL, N'Patel', N'M', N'305 Londonderry Dr', N'Yes', 1, 16, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (367, N'Prayag', N'B', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (368, N'Preet', NULL, N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (369, N'Preet', NULL, N'Patel', N'M', N'4613 9th St NE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (370, N'Prem', NULL, N'Patel', N'M', N'132 W Main St', N'No', 0, 32, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (371, N'Prem', NULL, N'Patel', N'M', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (372, N'Prit', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (373, N'Pritash', NULL, N'Patel', N'M', N'3234 Devon Croft Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (374, N'Pritesh', NULL, N'Patel', N'M', N'3275 Edgeland Hwy', N'Yes', 1, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (375, N'Priya', NULL, N'Patel', N'F', N'1040 Conestoga Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (376, N'Puja', NULL, N'Patel', N'F', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (377, N'Punita', NULL, N'Gajjar', N'F', N'4029 Raccoon Run Ct', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (378, N'Purnima', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (379, N'Purva', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (380, N'Pushpa', NULL, N'Patel', N'F', N'360 Ivy Park Ln', N'Yes', 1, 31, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (381, N'Pushpa', NULL, N'Patel', N'F', N'5444 Allison Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (382, N'Pushpa', NULL, N'Patel', N'F', N'8526 Kershaw Camden Hwy', N'No', 0, 13, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (383, N'Radhikaben', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (384, N'Rahi', NULL, N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (385, N'Rahul', NULL, N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (386, N'Rahul', NULL, N'Shah', N'M', N'802 Pine Valley Ct', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (387, N'Raj', NULL, N'Patel', N'M', N'1040 Conestoga Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (388, N'Rajan', NULL, N'Patel', N'M', N'2525 Lawyers Rd W', N'No', 0, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (389, N'Rajendra', NULL, N'Patel', N'M', N'2005 Belleforest Ct', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (390, N'Rajesh', NULL, N'Patel', N'M', N'12902 Cleopatra Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (391, N'Rajiv', NULL, N'Shah', N'M', N'9946 Nicole Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (392, N'Ramendra', NULL, N'Bhatt', N'M', N'806 Lee St', N'No', 0, 14, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (393, N'Ramesh', NULL, N'Patel', N'M', N'616 S Hampton St', N'No', 0, 13, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (394, N'Ramilaben', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (395, N'Ranjan', NULL, N'Patel', N'F', N'6235 Hermsley Rd', N'Yes', 1, 2, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (396, N'Ranjan', NULL, N'Patel', N'F', N'9620 Puddle Duck Rd Apt 305', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (397, N'Rashmi', NULL, N'Patel', N'F', N'3234 Devon Croft Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (398, N'Rashmita', N'V', N'Patel', N'F', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (399, N'Rasila', NULL, N'Panara', N'F', N'9123 Royal Highlands Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (400, N'Ravi', NULL, N'Patel', N'M', N'2011 Apogee Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (401, N'Rayan', NULL, N'Patel', N'M', N'4011 Ainsdale Dr', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (402, N'Reena', NULL, N'Patel', N'F', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (403, N'Rekha', NULL, N'Parmar', N'F', N'9500 Marsena Ct', N'Yes', 1, 2, 7)
GO
print 'Processed 400 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (404, N'Rekha', NULL, N'Patel', N'F', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (405, N'Rekha', NULL, N'Patel', N'F', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (406, N'Renu', NULL, N'Patel', N'F', N'11142 Tradition View Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (407, N'Renuka', NULL, N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (408, N'Renuka', NULL, N'Patel', N'F', N'2005 Belleforest Ct', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (409, N'Renuka', NULL, N'Suthar', N'F', N'10465 Stokeshill Ct', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (410, N'Renuka', N'C', N'Suthar', N'F', N'15739 Greythorne Dr. Apt#103', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (411, N'Rinali', NULL, N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (412, N'Rinku', N'V', N'Patel', N'F', N'117 Lily Green Ct NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (413, N'Ripal', N'Hiren', N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (414, N'Rishabh', N'Asit', N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (415, N'Riya', NULL, N'Patel', N'F', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (416, N'Riya', NULL, N'Patel', N'F', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (417, N'Riya', NULL, N'Shah', N'F', N'802 Pine Valley Ct', N'No', 0, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (418, N'Roma', NULL, N'Patel', N'F', N'10742 Derryrush Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (419, N'Ronak', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (420, N'Ruhi', NULL, N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (421, N'Ruhi', N'Vasant', N'Patel', N'F', N'2766 Lake Wylie Dr', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (422, N'Rupal', N'S', N'Shah', N'F', N'802 Pine Valley Ct', N'Yes', 1, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (423, N'Rupesh', NULL, N'Patel', N'M', N'1209 Kent Dr', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (424, N'Rushi', NULL, N'Parekh', N'M', N'2521 Clare Olivia Dr Apt 203', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (425, N'Sachin', NULL, N'Devani', N'M', N'51 Astor Ct Apt 107', N'No', 0, 3, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (426, N'Sadhana', NULL, N'Desai', N'F', N'611 W Roosevelt Blvd Apt 127', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (427, N'Sagar', NULL, N'Patel', N'M', N'17123 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (428, N'Sagar', N'J', N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', 1, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (429, N'Sahaj', NULL, N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (430, N'Sahil', NULL, N'Hira', N'M', N'138 Norman Station Blvd', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (431, N'Sajani', NULL, N'Patel', N'F', N'7527 Carrington Forest Ln', N'No', 0, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (432, N'Sameer', NULL, N'Shah', N'M', N'802 Pine Valley Ct', N'Yes', 1, 17, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (433, N'Sandeep', N'Dilip', N'Patil', N'M', N'7305 Hagen Ct Apt 1512', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (434, N'Sangeeta', NULL, N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (435, N'Sangita', NULL, N'Patel', N'F', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (436, N'Sangita', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (437, N'Sangitaben', N'Paresh', N'Sutariya', N'F', N'10119 Oxford Landing Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (438, N'Sanjay', NULL, N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (439, N'Sanjay', NULL, N'Patel', N'M', N'4613 9th St NE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (440, N'Sanjeet', NULL, N'Patel', N'M', N'2413 Arden Gate Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (441, N'Sarju', NULL, N'Patel', N'F', N'1983 8th St SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (442, N'Saroj', NULL, N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (443, N'Saroj', NULL, N'Patel', N'F', N'703 N Pearl St', N'No', 0, 22, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (444, N'Satish', NULL, N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (445, N'Satish', NULL, N'Patel', N'M', N'4101 Regency Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (446, N'Saurin', NULL, N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (447, N'Sejal', NULL, N'Jambusaria', N'F', N'10306 Paxton Run Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (448, N'Shail', NULL, N'Agarwal', N'F', N'Unknown Address', N'No', 0, 2, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (449, N'Shakuntala', NULL, N'Patel', N'F', N'1608 E Roosevelt Blvd', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (450, N'Shalini', NULL, N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (451, N'Shanta', NULL, N'Patel', N'F', N'2413 Arden Gate Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (452, N'Shantaben', NULL, N'Patel', N'F', N'2800 Foxwood Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (453, N'Sharad', NULL, N'Patel', N'M', N'9016 Tamarron Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (454, N'Sharda', N'N', N'Patel', N'F', N'1134 Jade Glen Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (455, N'Shashikant', NULL, N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (456, N'Sheena', NULL, N'Patel', N'F', N'434 Frazier Ave', N'No', 0, 2, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (457, N'Sheetal', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (458, N'Shilpa', NULL, N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (459, N'Shilpa', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (460, N'Shilpa', NULL, N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (461, N'Shilpa', NULL, N'Patel', N'F', N'4613 9th St NE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (462, N'Shilpesh', NULL, N'Patel', N'M', N'109 Country Club Dr', N'Yes', 1, 27, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (463, N'Shiv', NULL, N'Patel', N'M', N'17127 Westmill Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (464, N'Shivanee', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (465, N'Shivang', NULL, N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (466, N'Shivangi', NULL, N'Patel', N'M', N'1213 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (467, N'Shivangini', NULL, N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (468, N'Shyam', NULL, N'Patel', N'M', N'2005 Belleforest Ct', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (469, N'Smita', NULL, N'Amin', N'F', N'1395 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (470, N'Sneha', NULL, N'Patel', N'F', N'2413 Arden Gate Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (471, N'Sneha', NULL, N'Patel', N'F', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (472, N'Sohini', NULL, N'Patel', N'F', N'11925 Southcrest Ln', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (473, N'Sohum', NULL, N'Patel', N'M', N'10610 Bere Island Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (474, N'Sonal', NULL, N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (475, N'Sonia', NULL, N'Patel', N'F', N'221 Cattle Ridge Rd', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (476, N'Soniya', N'P', N'Sompura', N'F', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (477, N'Subhash', NULL, N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', 1, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (478, N'Suchi', N'Ashish', N'Patel', N'F', N'2508 Highland Park Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (479, N'Sudha', NULL, N'Patel', N'F', N'1816 Damascus St', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (480, N'Sulochana', NULL, N'Suthar', N'F', N'7015 Brighton Brook Dr', N'Yes', 1, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (481, N'Sumitra', NULL, N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (482, N'Sunita', NULL, N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (483, N'Sunita', NULL, N'Patel', N'F', N'9016 Tamarron Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (484, N'Suresh', NULL, N'Patel', N'M', N'2120 Savoy Pl', N'No', 0, 7, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (485, N'Surya', NULL, N'Patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (486, N'Suryakant', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (487, N'Suryakant', N'I', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 3)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (488, N'Swamini', N'Hiren', N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (489, N'Swati', NULL, N'Patel', N'F', N'14044 Lissadell Cir', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (490, N'Swayam', NULL, N'Patel', N'M', N'10610 Bere Island Dr', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (491, N'Tanvi', NULL, N'Patel', N'F', N'3730 US Highway 601', N'Yes', 1, 28, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (492, N'Tej', NULL, N'patel', N'M', N'2616 Brackley Pl NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (493, N'Tejal', NULL, N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (494, N'Tejal', NULL, N'Patel', N'F', N'818 20th Avenue Pl SE', N'Yes', 1, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (495, N'Tejas', NULL, N'Patel', N'M', N'7903 Hereford St', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (496, N'Tejas', NULL, N'Patel', N'M', N'9692 Laurie Ave NW', N'Yes', 1, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (497, N'Tilak', NULL, N'Patel', N'M', N'12552 Druids Glen Dr', N'No', 0, 23, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (498, N'Tilak', NULL, N'Patel', N'M', N'8347 Marigold Pl', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (499, N'Tilak', N'Hiren', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (500, N'Toral', NULL, N'Patel', N'F', N'3275 Edgeland Hwy', N'Yes', 1, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (501, N'Tulsi', N'Nehal', N'Patel', N'F', N'10125 University Park Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (502, N'Tushar', NULL, N'Patel', N'M', N'3234 Devon Croft Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (503, N'Tushar', NULL, N'Patel', N'M', N'8767 Savannah Rd', N'No', 0, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (504, N'Upen', NULL, N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2)
GO
print 'Processed 500 total records'
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (505, N'Urmila', NULL, N'Patel', N'F', N'1209 Kent Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (506, N'Urmila', NULL, N'Patel', N'F', N'3600 Mooreland Farms Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (507, N'Urmila', NULL, N'Patel', N'F', N'7149 Cobden Ln', N'No', 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (508, N'Vandan', NULL, N'Patel', N'M', N'1862 Gingercake Cir', N'No', 0, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (509, N'Vanita', NULL, N'Patel', N'F', N'8801 Darcy Hopkins Dr', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (510, N'Vanitaben', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (511, N'Vanlila', N'R', N'Bhatt', N'F', N'806 Lee St', N'No', 0, 14, 4)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (512, N'Varad', NULL, N'Soneji', N'M', N'1110 Yorkmort Ridge Lane Apt 1134', N'Yes', 1, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (513, N'Varsha', NULL, N'Patel', N'F', N'2011 Apogee Dr', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (514, N'Varsha', NULL, N'Patel', N'F', N'3234 Devon Croft Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (515, N'Vasant', NULL, N'Patel', N'M', N'2766 Lake Wylie Dr', N'Yes', 1, 26, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (516, N'Vedi', NULL, N'Patel', N'F', N'3275 Edgeland Hwy', N'No', 0, 25, 9)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (517, N'Vihaan', NULL, N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (518, N'Vikas', N'Prashant', N'Patel', N'M', N'10071 Highland Creek Cir', N'No', 0, 7, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (519, N'Vilash', NULL, N'Patel', N'F', N'7903 Hereford St', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (520, N'Vimal', NULL, N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (521, N'Vimala', NULL, N'Patel', N'F', N'818 20th Avenue Pl SE', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (522, N'Vimarsh', NULL, N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (523, N'Vimla', N'P', N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (524, N'Vinod', NULL, N'Patel', N'M', N'11142 Tradition View Dr', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (525, N'Vipul', NULL, N'Patel', N'M', N'117 Lily Green Ct NW', N'No', 0, 4, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (526, N'Vir', NULL, N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (527, N'Vira', NULL, N'Patel', N'F', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (528, N'Vishal', NULL, N'Parmar', N'M', N'9406 Vera Jones Ln', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (529, N'Vishal', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (530, N'Vivek', NULL, N'Patel', N'M', N'1719 Funny Cide Dr', N'No', 0, 30, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (531, N'Vrajesh', NULL, N'Patel', N'M', N'10742 Derryrush Dr', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (532, N'Vrushali', N'Sandeep', N'Patil', N'F', N'7305 Hagen Ct Apt 1512', N'No', 0, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (533, N'Xitiz', N'P', N'Sutariya', N'F', N'10119 Oxford Landing Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (534, N'Yagnesh', NULL, N'Patel', N'M', N'12303 Summer Breeze Ct', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (535, N'Yagnesh', NULL, N'Patel', N'M', N'8347 Marigold Pl', N'Yes', 1, 8, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (536, N'Yagnesh', NULL, N'Patel', N'M', N'9523 Longstone Ln', N'Yes', 1, 2, 7)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (537, N'Yash', NULL, N'Mansinghka', N'M', N'11005 Sedgemoor Ln', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (538, N'Yogesh', NULL, N'Patel', N'M', N'5800 Shadow Creek Rd', N'No', 0, 2, 11)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (539, N'Yogesh', NULL, N'Patel', N'M', N'7000 Joyful Noise Ln', N'Yes', 1, 10, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (540, N'Yogesh', NULL, N'Patel', N'M', N'703 N Pearl St', N'No', 0, 22, 8)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (541, N'Yogi', NULL, N'Patel', N'M', N'325 US Highway 70 SW', N'No', 0, 9, 5)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (542, N'Rakesh', NULL, N'Gurjar', N'M', NULL, NULL, 0, 2, NULL)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (543, N'Rutav', NULL, N'Dharek', N'M', NULL, NULL, 0, 2, 2)
INSERT [dbo].[Att_Attendee] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId]) VALUES (544, N'Himalay', NULL, N'Oza', N'M', N'', NULL, 0, 2, 7)
SET IDENTITY_INSERT [dbo].[Att_Attendee] OFF
/****** Object:  Table [dbo].[Att_Attendance]    Script Date: 02/26/2017 23:19:53 ******/
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
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1, 7, 345, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0165C92A AS DateTime), CAST(0x0000A71B0165C92A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (2, 7, 156, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0165D2FC AS DateTime), CAST(0x0000A71B0165D2FC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (3, 7, 432, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0165DA68 AS DateTime), CAST(0x0000A71B0165DA68 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (4, 7, 385, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0165E210 AS DateTime), CAST(0x0000A71B0165E210 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (5, 7, 29, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0165E940 AS DateTime), CAST(0x0000A71B0165E940 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (6, 7, 504, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0165F0B6 AS DateTime), CAST(0x0000A71B0165F0B6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (7, 7, 196, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016605E1 AS DateTime), CAST(0x0000A71B016605E1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (8, 7, 344, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01660F7C AS DateTime), CAST(0x0000A71B01660F7C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (9, 7, 125, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0166892F AS DateTime), CAST(0x0000A71B0166892F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (10, 7, 310, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0166925B AS DateTime), CAST(0x0000A71B0166925B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (11, 7, 423, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0166BE39 AS DateTime), CAST(0x0000A71B0166BE39 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (12, 7, 182, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0166CA8D AS DateTime), CAST(0x0000A71B0166CA8D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (13, 7, 38, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016726E3 AS DateTime), CAST(0x0000A71B016726E3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (14, 7, 158, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016760F1 AS DateTime), CAST(0x0000A71B016760F1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (15, 7, 359, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01676D7D AS DateTime), CAST(0x0000A71B01676D7D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (16, 7, 56, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01677B17 AS DateTime), CAST(0x0000A71B01677B17 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (17, 7, 233, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01681A2A AS DateTime), CAST(0x0000A71B01681A2A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (18, 7, 216, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016831B1 AS DateTime), CAST(0x0000A71B016831B1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (19, 7, 43, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016854D1 AS DateTime), CAST(0x0000A71B016854D1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (20, 7, 99, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016878EC AS DateTime), CAST(0x0000A71B016878EC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (21, 7, 540, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0168982B AS DateTime), CAST(0x0000A71B0168982B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (22, 7, 80, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0168F6B3 AS DateTime), CAST(0x0000A71B0168F6B3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (23, 7, 273, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01695588 AS DateTime), CAST(0x0000A71B01695588 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (24, 7, 477, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016962C5 AS DateTime), CAST(0x0000A71B016962C5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (25, 7, 221, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0169A5DE AS DateTime), CAST(0x0000A71B0169A5DE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (26, 7, 222, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0169A74F AS DateTime), CAST(0x0000A71B0169A74F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (27, 7, 520, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0169AF96 AS DateTime), CAST(0x0000A71B0169AF96 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (28, 7, 455, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0169BB4C AS DateTime), CAST(0x0000A71B0169BB4C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (29, 7, 133, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0169CB5C AS DateTime), CAST(0x0000A71B0169CB5C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (30, 7, 176, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0169F89A AS DateTime), CAST(0x0000A71B0169F89A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (31, 7, 237, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016A0BD5 AS DateTime), CAST(0x0000A71B016A0BD5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (32, 7, 103, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016A4710 AS DateTime), CAST(0x0000A71B016A4710 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (33, 7, 35, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016A7401 AS DateTime), CAST(0x0000A71B016A7401 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (34, 7, 36, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016A76B1 AS DateTime), CAST(0x0000A71B016A76B1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (35, 7, 206, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016AA290 AS DateTime), CAST(0x0000A71B016AA290 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (36, 7, 197, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016AB98F AS DateTime), CAST(0x0000A71B016AB98F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (37, 7, 535, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016ACF49 AS DateTime), CAST(0x0000A71B016ACF49 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (38, 7, 342, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016ADA6D AS DateTime), CAST(0x0000A71B016ADA6D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (39, 7, 439, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016AE84D AS DateTime), CAST(0x0000A71B016AE84D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (40, 7, 334, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016B1585 AS DateTime), CAST(0x0000A71B016B1585 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (41, 7, 205, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016B2EA0 AS DateTime), CAST(0x0000A71B016B2EA0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (42, 7, 115, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016B47BD AS DateTime), CAST(0x0000A71B016B47BD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (43, 7, 123, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016B77E3 AS DateTime), CAST(0x0000A71B016B77E3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (44, 7, 121, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016B7967 AS DateTime), CAST(0x0000A71B016B7967 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (45, 7, 305, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016BB76A AS DateTime), CAST(0x0000A71B016BB76A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (46, 7, 502, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016C0A63 AS DateTime), CAST(0x0000A71B016C0A63 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (47, 7, 277, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016C2F82 AS DateTime), CAST(0x0000A71B016C2F82 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (48, 7, 144, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016C4541 AS DateTime), CAST(0x0000A71B016C4541 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (49, 7, 301, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016C51A7 AS DateTime), CAST(0x0000A71B016C51A7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (50, 7, 319, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016C5F89 AS DateTime), CAST(0x0000A71B016C5F89 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (51, 7, 424, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016C8842 AS DateTime), CAST(0x0000A71B016C8842 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (52, 7, 77, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016CD8BD AS DateTime), CAST(0x0000A71B016CD8BD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (53, 7, 4, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016D3E9D AS DateTime), CAST(0x0000A71B016D3E9D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (54, 7, 280, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016D6311 AS DateTime), CAST(0x0000A71B016D6311 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (55, 7, 282, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016D64F4 AS DateTime), CAST(0x0000A71B016D64F4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (56, 7, 135, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016D7A6A AS DateTime), CAST(0x0000A71B016D7A6A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (57, 7, 353, 1, CAST(0x0000A716011148F0 AS DateTime), CAST(0x0000A71B016DE648 AS DateTime), CAST(0x0000A71B016DE648 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (58, 7, 30, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016E7C97 AS DateTime), CAST(0x0000A71B016E7C97 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (59, 7, 70, 1, CAST(0x0000A716012741F0 AS DateTime), CAST(0x0000A71B016E8C4B AS DateTime), CAST(0x0000A71B016E8C4B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (60, 7, 360, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016EB4CD AS DateTime), CAST(0x0000A71B016EB4CD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (61, 7, 433, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016EC180 AS DateTime), CAST(0x0000A71B016EC180 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (62, 7, 55, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016EDF1A AS DateTime), CAST(0x0000A71B016EDF1A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (63, 7, 183, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016F00F9 AS DateTime), CAST(0x0000A71B016F00F9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (64, 7, 66, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016F155C AS DateTime), CAST(0x0000A71B016F155C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (65, 7, 486, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016F257E AS DateTime), CAST(0x0000A71B016F257E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (66, 7, 307, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016F63EA AS DateTime), CAST(0x0000A71B016F63EA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (67, 7, 539, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016FA197 AS DateTime), CAST(0x0000A71B016FA197 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (68, 7, 51, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016FC45F AS DateTime), CAST(0x0000A71B016FC45F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (69, 7, 268, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B016FE2AC AS DateTime), CAST(0x0000A71B016FE2AC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (70, 7, 271, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01704946 AS DateTime), CAST(0x0000A71B01704946 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (71, 7, 361, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01705A30 AS DateTime), CAST(0x0000A71B01705A30 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (72, 7, 327, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0170956E AS DateTime), CAST(0x0000A71B0170956E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (73, 7, 241, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B01709CBB AS DateTime), CAST(0x0000A71B01709CBB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (74, 7, 84, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0170AB2D AS DateTime), CAST(0x0000A71B0170AB2D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (75, 7, 212, 1, CAST(0x0000A71601090B90 AS DateTime), CAST(0x0000A71B0170BFD1 AS DateTime), CAST(0x0000A71B0170BFD1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (76, 8, 197, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0158AFB2 AS DateTime), CAST(0x0000A71C0158AFB2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (77, 8, 279, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0158BD36 AS DateTime), CAST(0x0000A71C0158BD36 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (78, 8, 390, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0158DDFA AS DateTime), CAST(0x0000A71C0158DDFA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (79, 8, 455, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0158EA19 AS DateTime), CAST(0x0000A71C0158EA19 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (80, 8, 282, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0158FD55 AS DateTime), CAST(0x0000A71C0158FD55 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (81, 8, 280, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0158FE2C AS DateTime), CAST(0x0000A71C0158FE2C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (82, 8, 495, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C01591D60 AS DateTime), CAST(0x0000A71C01591D60 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (83, 8, 520, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C01592422 AS DateTime), CAST(0x0000A71C01592422 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (84, 8, 237, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0159375D AS DateTime), CAST(0x0000A71C0159375D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (85, 8, 125, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C01595347 AS DateTime), CAST(0x0000A71C01595347 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (86, 8, 439, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C01596364 AS DateTime), CAST(0x0000A71C01596364 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (87, 8, 36, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015973EB AS DateTime), CAST(0x0000A71C015973EB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (88, 8, 504, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C01597B58 AS DateTime), CAST(0x0000A71C01597B58 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (89, 8, 385, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C01598150 AS DateTime), CAST(0x0000A71C01598150 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (90, 8, 168, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0159A154 AS DateTime), CAST(0x0000A71C0159A154 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (91, 8, 344, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0159AB1A AS DateTime), CAST(0x0000A71C0159AB1A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (92, 8, 345, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0159ACE5 AS DateTime), CAST(0x0000A71C0159ACE5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (93, 8, 11, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0159BE1B AS DateTime), CAST(0x0000A71C0159BE1B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (94, 8, 432, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C0159E108 AS DateTime), CAST(0x0000A71C0159E108 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (95, 8, 144, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015A3467 AS DateTime), CAST(0x0000A71C015A3467 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (96, 8, 326, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015A4363 AS DateTime), CAST(0x0000A71C015A4363 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (97, 8, 354, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015A5B1E AS DateTime), CAST(0x0000A71C015A5B1E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (98, 8, 319, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015A73B7 AS DateTime), CAST(0x0000A71C015A73B7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (99, 8, 94, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015AA900 AS DateTime), CAST(0x0000A71C015AA900 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (100, 8, 437, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015ACB90 AS DateTime), CAST(0x0000A71C015ACB90 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (101, 8, 287, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015AEABB AS DateTime), CAST(0x0000A71C015AEABB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (102, 8, 200, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015B3459 AS DateTime), CAST(0x0000A71C015B3459 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (103, 8, 422, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015BD244 AS DateTime), CAST(0x0000A71C015BD244 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (104, 8, 244, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015C36E2 AS DateTime), CAST(0x0000A71C015C36E2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (105, 8, 380, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015C6AA4 AS DateTime), CAST(0x0000A71C015C6AA4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (106, 8, 480, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015C73AF AS DateTime), CAST(0x0000A71C015C73AF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (107, 8, 407, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015C835B AS DateTime), CAST(0x0000A71C015C835B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (108, 8, 481, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015C96E8 AS DateTime), CAST(0x0000A71C015C96E8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (109, 8, 213, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015CBEB5 AS DateTime), CAST(0x0000A71C015CBEB5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (110, 8, 399, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015D09C4 AS DateTime), CAST(0x0000A71C015D09C4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (111, 8, 519, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015D5D2B AS DateTime), CAST(0x0000A71C015D5D2B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (112, 8, 219, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015D88D5 AS DateTime), CAST(0x0000A71C015D88D5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (113, 8, 278, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015D928F AS DateTime), CAST(0x0000A71C015D928F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (114, 8, 438, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015DA9C3 AS DateTime), CAST(0x0000A71C015DA9C3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (115, 8, 205, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015DCD5D AS DateTime), CAST(0x0000A71C015DCD5D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (116, 8, 446, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015DF0AF AS DateTime), CAST(0x0000A71C015DF0AF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (117, 8, 48, 1, CAST(0x0000A6CB011148F0 AS DateTime), CAST(0x0000A71C015E3B72 AS DateTime), CAST(0x0000A71C015E3B72 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (118, 8, 359, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015E6727 AS DateTime), CAST(0x0000A71C015E6727 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (119, 8, 22, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015EE8D7 AS DateTime), CAST(0x0000A71C015EE8D7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (120, 8, 236, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015EF23D AS DateTime), CAST(0x0000A71C015EF23D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (121, 8, 305, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015F2B89 AS DateTime), CAST(0x0000A71C015F2B89 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (122, 8, 273, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015F3940 AS DateTime), CAST(0x0000A71C015F3940 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (123, 8, 222, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015F6962 AS DateTime), CAST(0x0000A71C015F6962 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (124, 8, 56, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015F7616 AS DateTime), CAST(0x0000A71C015F7616 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (125, 8, 85, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015FA8BA AS DateTime), CAST(0x0000A71C015FA8BA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (126, 8, 80, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015FB63B AS DateTime), CAST(0x0000A71C015FB63B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (127, 8, 299, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015FBE34 AS DateTime), CAST(0x0000A71C015FBE34 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (128, 8, 196, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C015FC819 AS DateTime), CAST(0x0000A71C015FC819 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (129, 8, 308, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C016010F5 AS DateTime), CAST(0x0000A71C016010F5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (130, 8, 180, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01602A23 AS DateTime), CAST(0x0000A71C01602A23 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (131, 8, 82, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C016040D3 AS DateTime), CAST(0x0000A71C016040D3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (132, 8, 102, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01604C66 AS DateTime), CAST(0x0000A71C01604C66 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (133, 8, 424, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01605CB4 AS DateTime), CAST(0x0000A71C01605CB4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (134, 8, 433, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01606FA9 AS DateTime), CAST(0x0000A71C01606FA9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (135, 8, 181, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01621713 AS DateTime), CAST(0x0000A71C01621713 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (136, 8, 66, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01626478 AS DateTime), CAST(0x0000A71C01626478 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (137, 8, 365, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0162B228 AS DateTime), CAST(0x0000A71C0162B228 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (138, 8, 477, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0162BEF0 AS DateTime), CAST(0x0000A71C0162BEF0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (139, 8, 335, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0162F6C5 AS DateTime), CAST(0x0000A71C0162F6C5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (140, 8, 271, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0163078A AS DateTime), CAST(0x0000A71C0163078A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (141, 8, 122, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0163524C AS DateTime), CAST(0x0000A71C0163524C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (142, 8, 158, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C016366C1 AS DateTime), CAST(0x0000A71C016366C1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (143, 8, 121, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01638368 AS DateTime), CAST(0x0000A71C01638368 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (144, 8, 123, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0163846D AS DateTime), CAST(0x0000A71C0163846D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (145, 8, 136, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01639239 AS DateTime), CAST(0x0000A71C01639239 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (146, 8, 35, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C01639A76 AS DateTime), CAST(0x0000A71C01639A76 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (147, 8, 99, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0163AE79 AS DateTime), CAST(0x0000A71C0163AE79 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (148, 8, 268, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0163BF9B AS DateTime), CAST(0x0000A71C0163BF9B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (149, 8, 182, 1, CAST(0x0000A6CB01090B90 AS DateTime), CAST(0x0000A71C0163CA2B AS DateTime), CAST(0x0000A71C0163CA2B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (150, 9, 144, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010AF273 AS DateTime), CAST(0x0000A71D010AF273 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (151, 9, 66, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010AFE3B AS DateTime), CAST(0x0000A71D010AFE3B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (152, 9, 180, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010B1250 AS DateTime), CAST(0x0000A71D010B1250 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (153, 9, 99, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010B8E8D AS DateTime), CAST(0x0000A71D010B8E8D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (154, 9, 334, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010BB77F AS DateTime), CAST(0x0000A71D010BB77F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (155, 9, 172, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010BD4C3 AS DateTime), CAST(0x0000A71D010BD4C3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (156, 9, 271, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010BF67A AS DateTime), CAST(0x0000A71D010BF67A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (157, 9, 345, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010C2211 AS DateTime), CAST(0x0000A71D010C2211 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (158, 9, 309, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010C4250 AS DateTime), CAST(0x0000A71D010C4250 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (159, 9, 477, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010C6E05 AS DateTime), CAST(0x0000A71D010C6E05 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (160, 9, 540, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010C82A2 AS DateTime), CAST(0x0000A71D010C82A2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (161, 9, 55, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010C8C2E AS DateTime), CAST(0x0000A71D010C8C2E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (162, 9, 22, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010C98F4 AS DateTime), CAST(0x0000A71D010C98F4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (163, 9, 115, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010CA3EB AS DateTime), CAST(0x0000A71D010CA3EB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (164, 9, 38, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010CBC34 AS DateTime), CAST(0x0000A71D010CBC34 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (165, 9, 182, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010CCEAC AS DateTime), CAST(0x0000A71D010CCEAC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (166, 9, 168, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010D1DE4 AS DateTime), CAST(0x0000A71D010D1DE4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (167, 9, 56, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010D3425 AS DateTime), CAST(0x0000A71D010D3425 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (168, 9, 150, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010D54FD AS DateTime), CAST(0x0000A71D010D54FD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (169, 9, 80, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010D8B42 AS DateTime), CAST(0x0000A71D010D8B42 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (170, 9, 85, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010D95A8 AS DateTime), CAST(0x0000A71D010D95A8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (171, 9, 335, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010DFFD5 AS DateTime), CAST(0x0000A71D010DFFD5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (172, 9, 181, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010F20A7 AS DateTime), CAST(0x0000A71D010F20A7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (173, 9, 308, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010F45FD AS DateTime), CAST(0x0000A71D010F45FD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (174, 9, 486, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010F566F AS DateTime), CAST(0x0000A71D010F566F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (175, 9, 424, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010F628E AS DateTime), CAST(0x0000A71D010F628E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (176, 9, 102, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010F8593 AS DateTime), CAST(0x0000A71D010F8593 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (177, 9, 344, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010F9CBC AS DateTime), CAST(0x0000A71D010F9CBC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (178, 9, 273, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010FABDF AS DateTime), CAST(0x0000A71D010FABDF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (179, 9, 305, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010FB8A2 AS DateTime), CAST(0x0000A71D010FB8A2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (180, 9, 432, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010FC15C AS DateTime), CAST(0x0000A71D010FC15C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (181, 9, 6, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D010FE589 AS DateTime), CAST(0x0000A71D010FE589 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (182, 9, 196, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01100190 AS DateTime), CAST(0x0000A71D01100190 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (183, 9, 70, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01103F4A AS DateTime), CAST(0x0000A71D01103F4A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (184, 9, 237, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01106390 AS DateTime), CAST(0x0000A71D01106390 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (185, 9, 133, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01108C3A AS DateTime), CAST(0x0000A71D01108C3A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (186, 9, 504, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0110B972 AS DateTime), CAST(0x0000A71D0110B972 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (187, 9, 433, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0110CB3F AS DateTime), CAST(0x0000A71D0110CB3F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (188, 9, 539, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0110DEFA AS DateTime), CAST(0x0000A71D0110DEFA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (189, 9, 17, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0110EA43 AS DateTime), CAST(0x0000A71D0110EA43 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (190, 9, 125, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0110F804 AS DateTime), CAST(0x0000A71D0110F804 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (191, 9, 156, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01110483 AS DateTime), CAST(0x0000A71D01110483 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (192, 9, 188, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01112143 AS DateTime), CAST(0x0000A71D01112143 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (193, 9, 59, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01117121 AS DateTime), CAST(0x0000A71D01117121 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (194, 9, 532, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0111C131 AS DateTime), CAST(0x0000A71D0111C131 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (195, 9, 164, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0112FD31 AS DateTime), CAST(0x0000A71D0112FD31 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (196, 9, 288, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01135418 AS DateTime), CAST(0x0000A71D01135418 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (197, 9, 105, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0116CBB0 AS DateTime), CAST(0x0000A71D0116CBB0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (198, 9, 106, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0116D294 AS DateTime), CAST(0x0000A71D0116D294 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (199, 9, 260, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0116E4C9 AS DateTime), CAST(0x0000A71D0116E4C9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (200, 9, 203, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0116F5E5 AS DateTime), CAST(0x0000A71D0116F5E5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (201, 9, 321, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01172774 AS DateTime), CAST(0x0000A71D01172774 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (202, 9, 187, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01173C95 AS DateTime), CAST(0x0000A71D01173C95 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (203, 9, 474, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01174B0D AS DateTime), CAST(0x0000A71D01174B0D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (204, 9, 253, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01176B1B AS DateTime), CAST(0x0000A71D01176B1B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (205, 9, 459, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011789F0 AS DateTime), CAST(0x0000A71D011789F0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (206, 9, 461, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01178C1B AS DateTime), CAST(0x0000A71D01178C1B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (207, 9, 460, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01179059 AS DateTime), CAST(0x0000A71D01179059 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (208, 9, 228, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01179FBB AS DateTime), CAST(0x0000A71D01179FBB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (209, 9, 295, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0117AF30 AS DateTime), CAST(0x0000A71D0117AF30 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (210, 9, 494, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0117B9F2 AS DateTime), CAST(0x0000A71D0117B9F2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (211, 9, 101, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0117EB45 AS DateTime), CAST(0x0000A71D0117EB45 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (212, 9, 420, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0118149C AS DateTime), CAST(0x0000A71D0118149C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (213, 9, 209, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011824C0 AS DateTime), CAST(0x0000A71D011824C0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (214, 9, 151, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011839F3 AS DateTime), CAST(0x0000A71D011839F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (215, 9, 500, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011851AB AS DateTime), CAST(0x0000A71D011851AB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (216, 9, 296, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01187E9E AS DateTime), CAST(0x0000A71D01187E9E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (217, 9, 177, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0118C44E AS DateTime), CAST(0x0000A71D0118C44E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (218, 9, 454, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0118F90E AS DateTime), CAST(0x0000A71D0118F90E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (219, 9, 394, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01190190 AS DateTime), CAST(0x0000A71D01190190 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (220, 9, 250, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0119270F AS DateTime), CAST(0x0000A71D0119270F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (221, 9, 157, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01193CA0 AS DateTime), CAST(0x0000A71D01193CA0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (222, 9, 521, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011942EA AS DateTime), CAST(0x0000A71D011942EA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (223, 9, 286, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011952AA AS DateTime), CAST(0x0000A71D011952AA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (224, 9, 287, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01195436 AS DateTime), CAST(0x0000A71D01195436 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (225, 9, 442, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01195BFC AS DateTime), CAST(0x0000A71D01195BFC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (226, 9, 443, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01195DB7 AS DateTime), CAST(0x0000A71D01195DB7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (227, 9, 264, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01198728 AS DateTime), CAST(0x0000A71D01198728 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (228, 9, 266, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011988C8 AS DateTime), CAST(0x0000A71D011988C8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (229, 9, 513, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01199705 AS DateTime), CAST(0x0000A71D01199705 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (230, 9, 32, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0119A61A AS DateTime), CAST(0x0000A71D0119A61A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (231, 9, 485, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0119C2D2 AS DateTime), CAST(0x0000A71D0119C2D2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (232, 9, 437, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0119DBA0 AS DateTime), CAST(0x0000A71D0119DBA0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (233, 9, 167, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0119E7A7 AS DateTime), CAST(0x0000A71D0119E7A7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (234, 9, 395, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A12F5 AS DateTime), CAST(0x0000A71D011A12F5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (235, 9, 396, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A142B AS DateTime), CAST(0x0000A71D011A142B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (236, 9, 127, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A37A1 AS DateTime), CAST(0x0000A71D011A37A1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (237, 9, 128, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A3959 AS DateTime), CAST(0x0000A71D011A3959 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (238, 9, 120, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A4DE5 AS DateTime), CAST(0x0000A71D011A4DE5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (239, 9, 119, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A4EEB AS DateTime), CAST(0x0000A71D011A4EEB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (240, 9, 509, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A806D AS DateTime), CAST(0x0000A71D011A806D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (241, 9, 514, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011A92CF AS DateTime), CAST(0x0000A71D011A92CF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (242, 9, 207, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011AAAFC AS DateTime), CAST(0x0000A71D011AAAFC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (243, 9, 64, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011AB4D2 AS DateTime), CAST(0x0000A71D011AB4D2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (244, 9, 278, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011ABC2C AS DateTime), CAST(0x0000A71D011ABC2C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (245, 9, 378, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011AC34F AS DateTime), CAST(0x0000A71D011AC34F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (246, 9, 302, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011AD443 AS DateTime), CAST(0x0000A71D011AD443 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (247, 9, 303, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011AD5C8 AS DateTime), CAST(0x0000A71D011AD5C8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (248, 9, 26, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011AE761 AS DateTime), CAST(0x0000A71D011AE761 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (249, 9, 293, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011AF3D4 AS DateTime), CAST(0x0000A71D011AF3D4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (250, 9, 189, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B0C61 AS DateTime), CAST(0x0000A71D011B0C61 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (251, 9, 15, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B2200 AS DateTime), CAST(0x0000A71D011B2200 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (252, 9, 16, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B237C AS DateTime), CAST(0x0000A71D011B237C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (253, 9, 408, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B351B AS DateTime), CAST(0x0000A71D011B351B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (254, 9, 519, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B4007 AS DateTime), CAST(0x0000A71D011B4007 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (255, 9, 65, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B5636 AS DateTime), CAST(0x0000A71D011B5636 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (256, 9, 204, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B6F4B AS DateTime), CAST(0x0000A71D011B6F4B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (257, 9, 285, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011B82B1 AS DateTime), CAST(0x0000A71D011B82B1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (258, 9, 139, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011BC045 AS DateTime), CAST(0x0000A71D011BC045 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (259, 9, 329, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011BC6A3 AS DateTime), CAST(0x0000A71D011BC6A3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (260, 9, 505, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011BE9FD AS DateTime), CAST(0x0000A71D011BE9FD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (261, 9, 506, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011BECC6 AS DateTime), CAST(0x0000A71D011BECC6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (262, 9, 507, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011BEEA0 AS DateTime), CAST(0x0000A71D011BEEA0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (263, 9, 350, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C0822 AS DateTime), CAST(0x0000A71D011C0822 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (264, 9, 75, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C253F AS DateTime), CAST(0x0000A71D011C253F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (265, 9, 523, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C3286 AS DateTime), CAST(0x0000A71D011C3286 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (266, 9, 451, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C3CE7 AS DateTime), CAST(0x0000A71D011C3CE7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (267, 9, 452, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C3E44 AS DateTime), CAST(0x0000A71D011C3E44 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (268, 9, 50, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C4655 AS DateTime), CAST(0x0000A71D011C4655 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (269, 9, 53, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C7023 AS DateTime), CAST(0x0000A71D011C7023 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (270, 9, 257, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011C8F69 AS DateTime), CAST(0x0000A71D011C8F69 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (271, 9, 259, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011CAFF5 AS DateTime), CAST(0x0000A71D011CAFF5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (272, 9, 219, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011D04F3 AS DateTime), CAST(0x0000A71D011D04F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (273, 9, 142, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011D23D8 AS DateTime), CAST(0x0000A71D011D23D8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (274, 9, 390, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011D5820 AS DateTime), CAST(0x0000A71D011D5820 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (275, 9, 353, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D011D656B AS DateTime), CAST(0x0000A71D011D656B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (276, 9, 487, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01246A23 AS DateTime), CAST(0x0000A71D01246A23 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (277, 9, 197, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D012479ED AS DateTime), CAST(0x0000A71D012479ED AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (278, 9, 185, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01249282 AS DateTime), CAST(0x0000A71D01249282 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (279, 9, 4, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01249F16 AS DateTime), CAST(0x0000A71D01249F16 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (280, 9, 283, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0124A7A0 AS DateTime), CAST(0x0000A71D0124A7A0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (281, 9, 123, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0124C013 AS DateTime), CAST(0x0000A71D0124C013 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (282, 9, 121, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0124C154 AS DateTime), CAST(0x0000A71D0124C154 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (283, 9, 103, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0124D2FF AS DateTime), CAST(0x0000A71D0124D2FF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (284, 9, 186, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01250DFC AS DateTime), CAST(0x0000A71D01250DFC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (285, 9, 385, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01251899 AS DateTime), CAST(0x0000A71D01251899 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (286, 9, 36, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D012525C9 AS DateTime), CAST(0x0000A71D012525C9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (287, 9, 77, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01253388 AS DateTime), CAST(0x0000A71D01253388 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (288, 9, 330, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0125404A AS DateTime), CAST(0x0000A71D0125404A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (289, 9, 361, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01254984 AS DateTime), CAST(0x0000A71D01254984 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (290, 9, 520, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0125781C AS DateTime), CAST(0x0000A71D0125781C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (291, 9, 439, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D012587A5 AS DateTime), CAST(0x0000A71D012587A5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (292, 9, 319, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01259880 AS DateTime), CAST(0x0000A71D01259880 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (293, 9, 158, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0125B60E AS DateTime), CAST(0x0000A71D0125B60E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (294, 9, 328, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D0125E212 AS DateTime), CAST(0x0000A71D0125E212 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (295, 9, 307, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D012607DC AS DateTime), CAST(0x0000A71D012607DC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (296, 9, 135, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D01261967 AS DateTime), CAST(0x0000A71D01261967 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (297, 9, 423, 1, CAST(0x0000A6C401090B90 AS DateTime), CAST(0x0000A71D012621F3 AS DateTime), CAST(0x0000A71D012621F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (298, 10, 107, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BD846D AS DateTime), CAST(0x0000A71E00BD846D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (299, 10, 278, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BD89F3 AS DateTime), CAST(0x0000A71E00BD89F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (300, 10, 64, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BD921A AS DateTime), CAST(0x0000A71E00BD921A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (301, 10, 200, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BDA1CE AS DateTime), CAST(0x0000A71E00BDA1CE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (302, 10, 341, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BDB5DC AS DateTime), CAST(0x0000A71E00BDB5DC AS DateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (303, 10, 87, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BDBE6D AS DateTime), CAST(0x0000A71E00BDBE6D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (304, 10, 505, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BDD0DE AS DateTime), CAST(0x0000A71E00BDD0DE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (305, 10, 454, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BDED71 AS DateTime), CAST(0x0000A71E00BDED71 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (306, 10, 378, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE1582 AS DateTime), CAST(0x0000A71E00BE1582 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (307, 10, 286, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE2556 AS DateTime), CAST(0x0000A71E00BE2556 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (308, 10, 287, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE26B7 AS DateTime), CAST(0x0000A71E00BE26B7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (309, 10, 188, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE3FFB AS DateTime), CAST(0x0000A71E00BE3FFB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (310, 10, 506, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE4B61 AS DateTime), CAST(0x0000A71E00BE4B61 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (311, 10, 337, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE6568 AS DateTime), CAST(0x0000A71E00BE6568 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (312, 10, 251, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE8BC5 AS DateTime), CAST(0x0000A71E00BE8BC5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (313, 10, 407, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BE97FF AS DateTime), CAST(0x0000A71E00BE97FF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (314, 10, 127, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BEA63C AS DateTime), CAST(0x0000A71E00BEA63C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (315, 10, 128, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BEA797 AS DateTime), CAST(0x0000A71E00BEA797 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (316, 10, 408, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BEB769 AS DateTime), CAST(0x0000A71E00BEB769 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (317, 10, 380, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BEC218 AS DateTime), CAST(0x0000A71E00BEC218 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (318, 10, 15, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BED988 AS DateTime), CAST(0x0000A71E00BED988 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (319, 10, 295, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BEE706 AS DateTime), CAST(0x0000A71E00BEE706 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (320, 10, 163, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BF0B17 AS DateTime), CAST(0x0000A71E00BF0B17 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (321, 10, 394, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BF2380 AS DateTime), CAST(0x0000A71E00BF2380 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (322, 10, 316, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BF2D30 AS DateTime), CAST(0x0000A71E00BF2D30 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (323, 10, 321, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BF3552 AS DateTime), CAST(0x0000A71E00BF3552 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (324, 10, 487, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BF858F AS DateTime), CAST(0x0000A71E00BF858F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (325, 10, 158, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BFA5DD AS DateTime), CAST(0x0000A71E00BFA5DD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (326, 10, 455, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00BFBCED AS DateTime), CAST(0x0000A71E00BFBCED AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (327, 10, 354, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C0303F AS DateTime), CAST(0x0000A71E00C0303F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (328, 10, 35, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C036A7 AS DateTime), CAST(0x0000A71E00C036A7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (329, 10, 108, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C07571 AS DateTime), CAST(0x0000A71E00C07571 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (330, 10, 55, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C0B946 AS DateTime), CAST(0x0000A71E00C0B946 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (331, 10, 363, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C0C55B AS DateTime), CAST(0x0000A71E00C0C55B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (332, 10, 365, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C0C68D AS DateTime), CAST(0x0000A71E00C0C68D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (333, 10, 212, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C0F54C AS DateTime), CAST(0x0000A71E00C0F54C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (334, 10, 31, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C0FCF3 AS DateTime), CAST(0x0000A71E00C0FCF3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (335, 10, 345, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C101A5 AS DateTime), CAST(0x0000A71E00C101A5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (336, 10, 319, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C12447 AS DateTime), CAST(0x0000A71E00C12447 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (337, 10, 205, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C12FC1 AS DateTime), CAST(0x0000A71E00C12FC1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (338, 10, 117, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C14AE0 AS DateTime), CAST(0x0000A71E00C14AE0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (339, 10, 301, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C15222 AS DateTime), CAST(0x0000A71E00C15222 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (340, 10, 433, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C16061 AS DateTime), CAST(0x0000A71E00C16061 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (341, 10, 271, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C19946 AS DateTime), CAST(0x0000A71E00C19946 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (342, 10, 66, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C1C5C4 AS DateTime), CAST(0x0000A71E00C1C5C4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (343, 10, 309, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C1D52C AS DateTime), CAST(0x0000A71E00C1D52C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (344, 10, 160, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C21972 AS DateTime), CAST(0x0000A71E00C21972 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (345, 10, 162, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C21AB2 AS DateTime), CAST(0x0000A71E00C21AB2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (346, 10, 115, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C2256A AS DateTime), CAST(0x0000A71E00C2256A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (347, 10, 179, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C22EC0 AS DateTime), CAST(0x0000A71E00C22EC0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (348, 10, 180, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C23078 AS DateTime), CAST(0x0000A71E00C23078 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (349, 10, 83, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C239C9 AS DateTime), CAST(0x0000A71E00C239C9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (350, 10, 172, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C24143 AS DateTime), CAST(0x0000A71E00C24143 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (351, 10, 121, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C26901 AS DateTime), CAST(0x0000A71E00C26901 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (352, 10, 122, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C26A7A AS DateTime), CAST(0x0000A71E00C26A7A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (353, 10, 268, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C2785E AS DateTime), CAST(0x0000A71E00C2785E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (354, 10, 181, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C28711 AS DateTime), CAST(0x0000A71E00C28711 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (355, 10, 183, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C28921 AS DateTime), CAST(0x0000A71E00C28921 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (356, 10, 424, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C2A6ED AS DateTime), CAST(0x0000A71E00C2A6ED AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (357, 10, 48, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C2B15F AS DateTime), CAST(0x0000A71E00C2B15F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (358, 10, 477, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C2B87A AS DateTime), CAST(0x0000A71E00C2B87A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (359, 10, 85, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C2CB18 AS DateTime), CAST(0x0000A71E00C2CB18 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (360, 10, 308, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C3168E AS DateTime), CAST(0x0000A71E00C3168E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (361, 10, 80, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C31CDC AS DateTime), CAST(0x0000A71E00C31CDC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (362, 10, 486, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C33E8B AS DateTime), CAST(0x0000A71E00C33E8B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (363, 10, 156, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C37B3A AS DateTime), CAST(0x0000A71E00C37B3A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (364, 10, 84, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C38413 AS DateTime), CAST(0x0000A71E00C38413 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (365, 10, 38, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C391D2 AS DateTime), CAST(0x0000A71E00C391D2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (366, 10, 102, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C3BAC5 AS DateTime), CAST(0x0000A71E00C3BAC5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (367, 10, 237, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C3CD6D AS DateTime), CAST(0x0000A71E00C3CD6D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (368, 10, 216, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C3D4B0 AS DateTime), CAST(0x0000A71E00C3D4B0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (369, 10, 233, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C3DFCD AS DateTime), CAST(0x0000A71E00C3DFCD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (370, 10, 77, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C42950 AS DateTime), CAST(0x0000A71E00C42950 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (371, 10, 539, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C43792 AS DateTime), CAST(0x0000A71E00C43792 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (372, 10, 98, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C44EF1 AS DateTime), CAST(0x0000A71E00C44EF1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (373, 10, 439, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C45D6F AS DateTime), CAST(0x0000A71E00C45D6F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (374, 10, 444, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C46554 AS DateTime), CAST(0x0000A71E00C46554 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (375, 10, 445, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C466D3 AS DateTime), CAST(0x0000A71E00C466D3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (376, 10, 22, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C4E88A AS DateTime), CAST(0x0000A71E00C4E88A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (377, 10, 182, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C4FA32 AS DateTime), CAST(0x0000A71E00C4FA32 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (378, 10, 277, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C50820 AS DateTime), CAST(0x0000A71E00C50820 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (379, 10, 197, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5136A AS DateTime), CAST(0x0000A71E00C5136A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (380, 10, 100, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C52589 AS DateTime), CAST(0x0000A71E00C52589 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (381, 10, 136, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C52FAF AS DateTime), CAST(0x0000A71E00C52FAF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (382, 10, 334, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5377C AS DateTime), CAST(0x0000A71E00C5377C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (383, 10, 344, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C550FD AS DateTime), CAST(0x0000A71E00C550FD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (384, 10, 155, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C55B22 AS DateTime), CAST(0x0000A71E00C55B22 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (385, 10, 299, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5619B AS DateTime), CAST(0x0000A71E00C5619B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (386, 10, 196, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C56736 AS DateTime), CAST(0x0000A71E00C56736 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (387, 10, 82, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C57990 AS DateTime), CAST(0x0000A71E00C57990 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (388, 10, 23, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C58A54 AS DateTime), CAST(0x0000A71E00C58A54 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (389, 10, 504, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C59600 AS DateTime), CAST(0x0000A71E00C59600 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (390, 10, 385, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C59D1D AS DateTime), CAST(0x0000A71E00C59D1D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (391, 10, 305, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5B6FE AS DateTime), CAST(0x0000A71E00C5B6FE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (392, 10, 56, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5BD85 AS DateTime), CAST(0x0000A71E00C5BD85 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (393, 10, 150, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5C730 AS DateTime), CAST(0x0000A71E00C5C730 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (394, 10, 359, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5CE0D AS DateTime), CAST(0x0000A71E00C5CE0D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (395, 10, 310, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5E8D5 AS DateTime), CAST(0x0000A71E00C5E8D5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (396, 10, 524, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5EE39 AS DateTime), CAST(0x0000A71E00C5EE39 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (397, 10, 125, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C5FE75 AS DateTime), CAST(0x0000A71E00C5FE75 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (398, 10, 432, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C603B6 AS DateTime), CAST(0x0000A71E00C603B6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (399, 10, 269, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C61C5C AS DateTime), CAST(0x0000A71E00C61C5C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (400, 10, 186, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C625B8 AS DateTime), CAST(0x0000A71E00C625B8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (401, 10, 236, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C6AC03 AS DateTime), CAST(0x0000A71E00C6AC03 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (402, 10, 482, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C6C621 AS DateTime), CAST(0x0000A71E00C6C621 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (403, 10, 483, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C6C766 AS DateTime), CAST(0x0000A71E00C6C766 AS DateTime))
GO
print 'Processed 400 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (404, 10, 61, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C6D444 AS DateTime), CAST(0x0000A71E00C6D444 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (405, 10, 474, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C6DC72 AS DateTime), CAST(0x0000A71E00C6DC72 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (406, 10, 513, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C6ECE4 AS DateTime), CAST(0x0000A71E00C6ECE4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (407, 10, 413, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C70750 AS DateTime), CAST(0x0000A71E00C70750 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (408, 10, 412, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C714DC AS DateTime), CAST(0x0000A71E00C714DC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (409, 10, 189, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C72719 AS DateTime), CAST(0x0000A71E00C72719 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (410, 10, 323, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C7312F AS DateTime), CAST(0x0000A71E00C7312F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (411, 10, 167, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C74B83 AS DateTime), CAST(0x0000A71E00C74B83 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (412, 10, 532, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C75CEF AS DateTime), CAST(0x0000A71E00C75CEF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (413, 10, 101, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C76363 AS DateTime), CAST(0x0000A71E00C76363 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (414, 10, 420, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C77BC1 AS DateTime), CAST(0x0000A71E00C77BC1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (415, 10, 421, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C77BFF AS DateTime), CAST(0x0000A71E00C77BFF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (416, 10, 147, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C7BC73 AS DateTime), CAST(0x0000A71E00C7BC73 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (417, 10, 228, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C7E139 AS DateTime), CAST(0x0000A71E00C7E139 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (418, 10, 459, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C7ED40 AS DateTime), CAST(0x0000A71E00C7ED40 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (419, 10, 461, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C7F0F6 AS DateTime), CAST(0x0000A71E00C7F0F6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (420, 10, 351, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C7FB0C AS DateTime), CAST(0x0000A71E00C7FB0C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (421, 10, 253, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C80D3D AS DateTime), CAST(0x0000A71E00C80D3D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (422, 10, 375, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C82E19 AS DateTime), CAST(0x0000A71E00C82E19 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (423, 10, 402, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C84EAB AS DateTime), CAST(0x0000A71E00C84EAB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (424, 10, 153, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C859D4 AS DateTime), CAST(0x0000A71E00C859D4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (425, 10, 296, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C8705E AS DateTime), CAST(0x0000A71E00C8705E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (426, 10, 514, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C8778E AS DateTime), CAST(0x0000A71E00C8778E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (427, 10, 120, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C87D43 AS DateTime), CAST(0x0000A71E00C87D43 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (428, 10, 53, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C88C4A AS DateTime), CAST(0x0000A71E00C88C4A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (429, 10, 219, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C897F6 AS DateTime), CAST(0x0000A71E00C897F6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (430, 10, 50, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C89EBB AS DateTime), CAST(0x0000A71E00C89EBB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (431, 10, 452, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C8B8A5 AS DateTime), CAST(0x0000A71E00C8B8A5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (432, 10, 521, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C8C0FF AS DateTime), CAST(0x0000A71E00C8C0FF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (433, 10, 261, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C8DA4C AS DateTime), CAST(0x0000A71E00C8DA4C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (434, 10, 259, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C8F651 AS DateTime), CAST(0x0000A71E00C8F651 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (435, 10, 177, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C905EE AS DateTime), CAST(0x0000A71E00C905EE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (436, 10, 157, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C910A9 AS DateTime), CAST(0x0000A71E00C910A9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (437, 10, 451, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00C990C9 AS DateTime), CAST(0x0000A71E00C990C9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (438, 10, 204, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CA4FB0 AS DateTime), CAST(0x0000A71E00CA4FB0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (439, 10, 302, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CA74C5 AS DateTime), CAST(0x0000A71E00CA74C5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (440, 10, 303, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CA75E9 AS DateTime), CAST(0x0000A71E00CA75E9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (441, 10, 447, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CA7D69 AS DateTime), CAST(0x0000A71E00CA7D69 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (442, 10, 457, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CA8760 AS DateTime), CAST(0x0000A71E00CA8760 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (443, 10, 209, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CA8F27 AS DateTime), CAST(0x0000A71E00CA8F27 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (444, 10, 151, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CA9A8B AS DateTime), CAST(0x0000A71E00CA9A8B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (445, 10, 500, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CAA034 AS DateTime), CAST(0x0000A71E00CAA034 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (446, 10, 134, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CAB1EE AS DateTime), CAST(0x0000A71E00CAB1EE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (447, 10, 60, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CABFD4 AS DateTime), CAST(0x0000A71E00CABFD4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (448, 10, 349, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CACC34 AS DateTime), CAST(0x0000A71E00CACC34 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (449, 10, 403, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CAEC1C AS DateTime), CAST(0x0000A71E00CAEC1C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (450, 10, 262, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CB0C51 AS DateTime), CAST(0x0000A71E00CB0C51 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (451, 10, 460, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CB2251 AS DateTime), CAST(0x0000A71E00CB2251 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (452, 10, 470, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CB4636 AS DateTime), CAST(0x0000A71E00CB4636 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (453, 10, 338, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00CB5497 AS DateTime), CAST(0x0000A71E00CB5497 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (454, 10, 139, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D058F5 AS DateTime), CAST(0x0000A71E00D058F5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (455, 10, 119, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D06349 AS DateTime), CAST(0x0000A71E00D06349 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (456, 10, 211, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D070F3 AS DateTime), CAST(0x0000A71E00D070F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (457, 10, 494, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D086D8 AS DateTime), CAST(0x0000A71E00D086D8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (458, 10, 519, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D09A87 AS DateTime), CAST(0x0000A71E00D09A87 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (459, 10, 59, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D0AA82 AS DateTime), CAST(0x0000A71E00D0AA82 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (460, 10, 285, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D0BD73 AS DateTime), CAST(0x0000A71E00D0BD73 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (461, 10, 523, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D0D977 AS DateTime), CAST(0x0000A71E00D0D977 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (462, 10, 244, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D0E635 AS DateTime), CAST(0x0000A71E00D0E635 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (463, 10, 32, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D0EBCE AS DateTime), CAST(0x0000A71E00D0EBCE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (464, 10, 437, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D11CDF AS DateTime), CAST(0x0000A71E00D11CDF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (465, 10, 52, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D12942 AS DateTime), CAST(0x0000A71E00D12942 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (466, 10, 214, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D14223 AS DateTime), CAST(0x0000A71E00D14223 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (467, 10, 250, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D15B47 AS DateTime), CAST(0x0000A71E00D15B47 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (468, 10, 507, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D16263 AS DateTime), CAST(0x0000A71E00D16263 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (469, 10, 118, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D16D2F AS DateTime), CAST(0x0000A71E00D16D2F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (470, 10, 485, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D1829F AS DateTime), CAST(0x0000A71E00D1829F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (471, 10, 164, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D18BE1 AS DateTime), CAST(0x0000A71E00D18BE1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (472, 10, 106, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D1AE8C AS DateTime), CAST(0x0000A71E00D1AE8C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (473, 10, 210, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D1D9DD AS DateTime), CAST(0x0000A71E00D1D9DD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (474, 10, 449, 1, CAST(0x0000A69A01090B90 AS DateTime), CAST(0x0000A71E00D1F0F8 AS DateTime), CAST(0x0000A71E00D1F0F8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (475, 11, 487, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D3E9BC AS DateTime), CAST(0x0000A71E00D3E9BC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (476, 11, 197, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D3FE34 AS DateTime), CAST(0x0000A71E00D3FE34 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (477, 11, 156, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D40EDA AS DateTime), CAST(0x0000A71E00D40EDA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (478, 11, 360, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D444E3 AS DateTime), CAST(0x0000A71E00D444E3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (479, 11, 215, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D44BF9 AS DateTime), CAST(0x0000A71E00D44BF9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (480, 11, 233, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D4523A AS DateTime), CAST(0x0000A71E00D4523A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (481, 11, 100, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D45BB9 AS DateTime), CAST(0x0000A71E00D45BB9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (482, 11, 520, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D494EE AS DateTime), CAST(0x0000A71E00D494EE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (483, 11, 319, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D49F5A AS DateTime), CAST(0x0000A71E00D49F5A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (484, 11, 57, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D4CD9A AS DateTime), CAST(0x0000A71E00D4CD9A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (485, 11, 58, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D4CF07 AS DateTime), CAST(0x0000A71E00D4CF07 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (486, 11, 192, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D4DA99 AS DateTime), CAST(0x0000A71E00D4DA99 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (487, 11, 446, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D4E516 AS DateTime), CAST(0x0000A71E00D4E516 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (488, 11, 326, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D4F5AE AS DateTime), CAST(0x0000A71E00D4F5AE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (489, 11, 363, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D51009 AS DateTime), CAST(0x0000A71E00D51009 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (490, 11, 439, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D519CC AS DateTime), CAST(0x0000A71E00D519CC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (491, 11, 268, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5202A AS DateTime), CAST(0x0000A71E00D5202A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (492, 11, 77, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D53016 AS DateTime), CAST(0x0000A71E00D53016 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (493, 11, 135, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5484D AS DateTime), CAST(0x0000A71E00D5484D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (494, 11, 98, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D58187 AS DateTime), CAST(0x0000A71E00D58187 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (495, 11, 160, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D58AE6 AS DateTime), CAST(0x0000A71E00D58AE6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (496, 11, 224, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5A6C2 AS DateTime), CAST(0x0000A71E00D5A6C2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (497, 11, 359, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5AD17 AS DateTime), CAST(0x0000A71E00D5AD17 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (498, 11, 221, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5B5A8 AS DateTime), CAST(0x0000A71E00D5B5A8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (499, 11, 432, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5CA04 AS DateTime), CAST(0x0000A71E00D5CA04 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (500, 11, 222, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5E183 AS DateTime), CAST(0x0000A71E00D5E183 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (501, 11, 237, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5EA40 AS DateTime), CAST(0x0000A71E00D5EA40 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (502, 11, 125, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5F126 AS DateTime), CAST(0x0000A71E00D5F126 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (503, 11, 48, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D5F9D9 AS DateTime), CAST(0x0000A71E00D5F9D9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (504, 11, 524, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D602DB AS DateTime), CAST(0x0000A71E00D602DB AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (505, 11, 83, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D61262 AS DateTime), CAST(0x0000A71E00D61262 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (506, 11, 269, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D623E3 AS DateTime), CAST(0x0000A71E00D623E3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (507, 11, 310, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D63170 AS DateTime), CAST(0x0000A71E00D63170 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (508, 11, 56, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D63F6E AS DateTime), CAST(0x0000A71E00D63F6E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (509, 11, 273, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D6A341 AS DateTime), CAST(0x0000A71E00D6A341 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (510, 11, 444, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D6B24D AS DateTime), CAST(0x0000A71E00D6B24D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (511, 11, 334, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D6BE2D AS DateTime), CAST(0x0000A71E00D6BE2D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (512, 11, 277, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D6D783 AS DateTime), CAST(0x0000A71E00D6D783 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (513, 11, 539, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D6E3B8 AS DateTime), CAST(0x0000A71E00D6E3B8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (514, 11, 150, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D6F3B8 AS DateTime), CAST(0x0000A71E00D6F3B8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (515, 11, 38, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D70059 AS DateTime), CAST(0x0000A71E00D70059 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (516, 11, 180, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D715F3 AS DateTime), CAST(0x0000A71E00D715F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (517, 11, 84, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D7323B AS DateTime), CAST(0x0000A71E00D7323B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (518, 11, 29, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D7412E AS DateTime), CAST(0x0000A71E00D7412E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (519, 11, 385, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D74DD6 AS DateTime), CAST(0x0000A71E00D74DD6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (520, 11, 179, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D75DD8 AS DateTime), CAST(0x0000A71E00D75DD8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (521, 11, 504, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D765F7 AS DateTime), CAST(0x0000A71E00D765F7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (522, 11, 271, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D78CD2 AS DateTime), CAST(0x0000A71E00D78CD2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (523, 11, 183, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D889C9 AS DateTime), CAST(0x0000A71E00D889C9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (524, 11, 182, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D898B6 AS DateTime), CAST(0x0000A71E00D898B6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (525, 11, 392, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D8A3E1 AS DateTime), CAST(0x0000A71E00D8A3E1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (526, 11, 17, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D8ABFA AS DateTime), CAST(0x0000A71E00D8ABFA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (527, 11, 162, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D8BEF2 AS DateTime), CAST(0x0000A71E00D8BEF2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (528, 11, 477, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D8D7AC AS DateTime), CAST(0x0000A71E00D8D7AC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (529, 11, 34, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D8E822 AS DateTime), CAST(0x0000A71E00D8E822 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (530, 11, 99, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D8F9A0 AS DateTime), CAST(0x0000A71E00D8F9A0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (531, 11, 345, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D90720 AS DateTime), CAST(0x0000A71E00D90720 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (532, 11, 424, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D90DC6 AS DateTime), CAST(0x0000A71E00D90DC6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (533, 11, 344, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D923AB AS DateTime), CAST(0x0000A71E00D923AB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (534, 11, 80, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D92C37 AS DateTime), CAST(0x0000A71E00D92C37 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (535, 11, 85, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D933D2 AS DateTime), CAST(0x0000A71E00D933D2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (536, 11, 308, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D93B3B AS DateTime), CAST(0x0000A71E00D93B3B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (537, 11, 309, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D93CFD AS DateTime), CAST(0x0000A71E00D93CFD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (538, 11, 23, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D944B6 AS DateTime), CAST(0x0000A71E00D944B6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (539, 11, 299, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D94A45 AS DateTime), CAST(0x0000A71E00D94A45 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (540, 11, 155, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00D952F3 AS DateTime), CAST(0x0000A71E00D952F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (541, 11, 279, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DB27BC AS DateTime), CAST(0x0000A71E00DB27BC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (542, 11, 103, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DB3FEF AS DateTime), CAST(0x0000A71E00DB3FEF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (543, 11, 390, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DB47C1 AS DateTime), CAST(0x0000A71E00DB47C1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (544, 11, 455, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DB53AB AS DateTime), CAST(0x0000A71E00DB53AB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (545, 11, 35, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DB71D0 AS DateTime), CAST(0x0000A71E00DB71D0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (546, 11, 176, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DB8AFD AS DateTime), CAST(0x0000A71E00DB8AFD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (547, 11, 70, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DC9B50 AS DateTime), CAST(0x0000A71E00DC9B50 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (548, 11, 181, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DCAB8E AS DateTime), CAST(0x0000A71E00DCAB8E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (549, 11, 270, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DCB875 AS DateTime), CAST(0x0000A71E00DCB875 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (550, 11, 496, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DCC26E AS DateTime), CAST(0x0000A71E00DCC26E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (551, 11, 361, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DCDCB1 AS DateTime), CAST(0x0000A71E00DCDCB1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (552, 11, 144, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DD2EB1 AS DateTime), CAST(0x0000A71E00DD2EB1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (553, 11, 115, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DD3570 AS DateTime), CAST(0x0000A71E00DD3570 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (554, 11, 126, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DE74F3 AS DateTime), CAST(0x0000A71E00DE74F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (555, 11, 102, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00DE7B31 AS DateTime), CAST(0x0000A71E00DE7B31 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (556, 11, 423, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E75E5C AS DateTime), CAST(0x0000A71E00E75E5C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (557, 11, 33, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E7B85B AS DateTime), CAST(0x0000A71E00E7B85B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (558, 11, 82, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E7CC20 AS DateTime), CAST(0x0000A71E00E7CC20 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (559, 11, 196, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E7D567 AS DateTime), CAST(0x0000A71E00E7D567 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (560, 11, 238, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E7EAFC AS DateTime), CAST(0x0000A71E00E7EAFC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (561, 11, 515, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E7F03D AS DateTime), CAST(0x0000A71E00E7F03D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (562, 11, 354, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E7FEF6 AS DateTime), CAST(0x0000A71E00E7FEF6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (563, 11, 314, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E816AD AS DateTime), CAST(0x0000A71E00E816AD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (564, 11, 315, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E81816 AS DateTime), CAST(0x0000A71E00E81816 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (565, 11, 272, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8202D AS DateTime), CAST(0x0000A71E00E8202D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (566, 11, 101, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E83A64 AS DateTime), CAST(0x0000A71E00E83A64 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (567, 11, 494, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E84163 AS DateTime), CAST(0x0000A71E00E84163 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (568, 11, 61, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E84902 AS DateTime), CAST(0x0000A71E00E84902 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (569, 11, 15, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E85090 AS DateTime), CAST(0x0000A71E00E85090 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (570, 11, 200, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E85D7C AS DateTime), CAST(0x0000A71E00E85D7C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (571, 11, 405, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E86CDD AS DateTime), CAST(0x0000A71E00E86CDD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (572, 11, 293, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E87C39 AS DateTime), CAST(0x0000A71E00E87C39 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (573, 11, 278, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E88C02 AS DateTime), CAST(0x0000A71E00E88C02 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (574, 11, 151, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E890E5 AS DateTime), CAST(0x0000A71E00E890E5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (575, 11, 214, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8B364 AS DateTime), CAST(0x0000A71E00E8B364 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (576, 11, 485, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8BDD5 AS DateTime), CAST(0x0000A71E00E8BDD5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (577, 11, 163, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8C2F4 AS DateTime), CAST(0x0000A71E00E8C2F4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (578, 11, 120, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8C86F AS DateTime), CAST(0x0000A71E00E8C86F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (579, 11, 157, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8D540 AS DateTime), CAST(0x0000A71E00E8D540 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (580, 11, 295, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8DCC8 AS DateTime), CAST(0x0000A71E00E8DCC8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (581, 11, 337, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8E2CE AS DateTime), CAST(0x0000A71E00E8E2CE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (582, 11, 177, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E8F375 AS DateTime), CAST(0x0000A71E00E8F375 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (583, 11, 208, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E90A71 AS DateTime), CAST(0x0000A71E00E90A71 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (584, 11, 3, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E9115C AS DateTime), CAST(0x0000A71E00E9115C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (585, 11, 474, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E92826 AS DateTime), CAST(0x0000A71E00E92826 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (586, 11, 521, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00E93670 AS DateTime), CAST(0x0000A71E00E93670 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (587, 11, 261, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EEB919 AS DateTime), CAST(0x0000A71E00EEB919 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (588, 11, 286, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EEC155 AS DateTime), CAST(0x0000A71E00EEC155 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (589, 11, 475, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EED18D AS DateTime), CAST(0x0000A71E00EED18D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (590, 11, 394, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EED91B AS DateTime), CAST(0x0000A71E00EED91B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (591, 11, 285, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EEF5F5 AS DateTime), CAST(0x0000A71E00EEF5F5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (592, 11, 442, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF0AA1 AS DateTime), CAST(0x0000A71E00EF0AA1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (593, 11, 480, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF2364 AS DateTime), CAST(0x0000A71E00EF2364 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (594, 11, 437, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF32A0 AS DateTime), CAST(0x0000A71E00EF32A0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (595, 11, 443, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF468F AS DateTime), CAST(0x0000A71E00EF468F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (596, 11, 118, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF5000 AS DateTime), CAST(0x0000A71E00EF5000 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (597, 11, 509, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF550B AS DateTime), CAST(0x0000A71E00EF550B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (598, 11, 217, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF6580 AS DateTime), CAST(0x0000A71E00EF6580 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (599, 11, 513, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF6C8F AS DateTime), CAST(0x0000A71E00EF6C8F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (600, 11, 127, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EF91E8 AS DateTime), CAST(0x0000A71E00EF91E8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (601, 11, 358, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EFA892 AS DateTime), CAST(0x0000A71E00EFA892 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (602, 11, 250, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EFAEC9 AS DateTime), CAST(0x0000A71E00EFAEC9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (603, 11, 207, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EFBB21 AS DateTime), CAST(0x0000A71E00EFBB21 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (604, 11, 213, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EFD291 AS DateTime), CAST(0x0000A71E00EFD291 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (605, 11, 329, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EFD99E AS DateTime), CAST(0x0000A71E00EFD99E AS DateTime))
GO
print 'Processed 600 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (606, 11, 459, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EFE66C AS DateTime), CAST(0x0000A71E00EFE66C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (607, 11, 188, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00EFF729 AS DateTime), CAST(0x0000A71E00EFF729 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (608, 11, 519, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F00045 AS DateTime), CAST(0x0000A71E00F00045 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (609, 11, 395, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0091A AS DateTime), CAST(0x0000A71E00F0091A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (610, 11, 402, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F00D8E AS DateTime), CAST(0x0000A71E00F00D8E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (611, 11, 59, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F02056 AS DateTime), CAST(0x0000A71E00F02056 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (612, 11, 242, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F040F0 AS DateTime), CAST(0x0000A71E00F040F0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (613, 11, 449, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F04715 AS DateTime), CAST(0x0000A71E00F04715 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (614, 11, 52, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0591A AS DateTime), CAST(0x0000A71E00F0591A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (615, 11, 297, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F06D28 AS DateTime), CAST(0x0000A71E00F06D28 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (616, 11, 167, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F08E28 AS DateTime), CAST(0x0000A71E00F08E28 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (617, 11, 164, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0AA33 AS DateTime), CAST(0x0000A71E00F0AA33 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (618, 11, 413, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0C410 AS DateTime), CAST(0x0000A71E00F0C410 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (619, 11, 457, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0CE99 AS DateTime), CAST(0x0000A71E00F0CE99 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (620, 11, 482, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0D928 AS DateTime), CAST(0x0000A71E00F0D928 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (621, 11, 252, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0EEB6 AS DateTime), CAST(0x0000A71E00F0EEB6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (622, 11, 251, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0F0C4 AS DateTime), CAST(0x0000A71E00F0F0C4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (623, 11, 380, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F0FC47 AS DateTime), CAST(0x0000A71E00F0FC47 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (624, 11, 332, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F109F3 AS DateTime), CAST(0x0000A71E00F109F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (625, 11, 104, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F11D46 AS DateTime), CAST(0x0000A71E00F11D46 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (626, 11, 134, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F12346 AS DateTime), CAST(0x0000A71E00F12346 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (627, 11, 60, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F12F9C AS DateTime), CAST(0x0000A71E00F12F9C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (628, 11, 403, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F136A6 AS DateTime), CAST(0x0000A71E00F136A6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (629, 11, 422, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F16125 AS DateTime), CAST(0x0000A71E00F16125 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (630, 11, 13, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F168E0 AS DateTime), CAST(0x0000A71E00F168E0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (631, 11, 294, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F17B71 AS DateTime), CAST(0x0000A71E00F17B71 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (632, 11, 106, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F183BA AS DateTime), CAST(0x0000A71E00F183BA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (633, 11, 316, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F18AAB AS DateTime), CAST(0x0000A71E00F18AAB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (634, 11, 460, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F195AB AS DateTime), CAST(0x0000A71E00F195AB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (635, 11, 461, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F19802 AS DateTime), CAST(0x0000A71E00F19802 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (636, 11, 321, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F1A030 AS DateTime), CAST(0x0000A71E00F1A030 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (637, 11, 350, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F1C53E AS DateTime), CAST(0x0000A71E00F1C53E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (638, 11, 435, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F1DE8B AS DateTime), CAST(0x0000A71E00F1DE8B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (639, 11, 105, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F1F0AE AS DateTime), CAST(0x0000A71E00F1F0AE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (640, 11, 510, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F1FECD AS DateTime), CAST(0x0000A71E00F1FECD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (641, 11, 296, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F206CF AS DateTime), CAST(0x0000A71E00F206CF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (642, 11, 514, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F20C37 AS DateTime), CAST(0x0000A71E00F20C37 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (643, 11, 119, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F2138A AS DateTime), CAST(0x0000A71E00F2138A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (644, 11, 452, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F22CAB AS DateTime), CAST(0x0000A71E00F22CAB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (645, 11, 50, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F232BE AS DateTime), CAST(0x0000A71E00F232BE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (646, 11, 219, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F23A28 AS DateTime), CAST(0x0000A71E00F23A28 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (647, 11, 53, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F24B50 AS DateTime), CAST(0x0000A71E00F24B50 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (648, 11, 523, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F2512D AS DateTime), CAST(0x0000A71E00F2512D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (649, 11, 451, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F269E3 AS DateTime), CAST(0x0000A71E00F269E3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (650, 11, 262, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F27778 AS DateTime), CAST(0x0000A71E00F27778 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (651, 11, 75, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F285D9 AS DateTime), CAST(0x0000A71E00F285D9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (652, 11, 396, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F2992A AS DateTime), CAST(0x0000A71E00F2992A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (653, 11, 257, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F2A0E4 AS DateTime), CAST(0x0000A71E00F2A0E4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (654, 11, 263, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F2EC16 AS DateTime), CAST(0x0000A71E00F2EC16 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (655, 11, 409, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F30827 AS DateTime), CAST(0x0000A71E00F30827 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (656, 11, 211, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F31D30 AS DateTime), CAST(0x0000A71E00F31D30 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (657, 11, 107, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F328AF AS DateTime), CAST(0x0000A71E00F328AF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (658, 11, 64, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F33C80 AS DateTime), CAST(0x0000A71E00F33C80 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (659, 11, 408, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F343B2 AS DateTime), CAST(0x0000A71E00F343B2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (660, 11, 511, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F35806 AS DateTime), CAST(0x0000A71E00F35806 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (661, 11, 302, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F361E1 AS DateTime), CAST(0x0000A71E00F361E1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (662, 11, 505, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F36944 AS DateTime), CAST(0x0000A71E00F36944 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (663, 11, 506, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F37A43 AS DateTime), CAST(0x0000A71E00F37A43 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (664, 11, 128, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F38276 AS DateTime), CAST(0x0000A71E00F38276 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (665, 11, 244, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F39063 AS DateTime), CAST(0x0000A71E00F39063 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (666, 11, 341, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F39939 AS DateTime), CAST(0x0000A71E00F39939 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (667, 11, 436, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F39FF0 AS DateTime), CAST(0x0000A71E00F39FF0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (668, 11, 243, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F3AD47 AS DateTime), CAST(0x0000A71E00F3AD47 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (669, 11, 378, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F3B733 AS DateTime), CAST(0x0000A71E00F3B733 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (670, 11, 404, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F3CF98 AS DateTime), CAST(0x0000A71E00F3CF98 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (671, 11, 25, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F400C2 AS DateTime), CAST(0x0000A71E00F400C2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (672, 11, 407, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E00F40E0A AS DateTime), CAST(0x0000A71E00F40E0A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (673, 11, 235, 1, CAST(0x0000A69301090B90 AS DateTime), CAST(0x0000A71E0136C391 AS DateTime), CAST(0x0000A71E0136C391 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (674, 12, 345, 1, CAST(0x0000A71F01004190 AS DateTime), CAST(0x0000A71F00DF915F AS DateTime), CAST(0x0000A71F00DF915F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (675, 12, 345, 1, CAST(0x0000A71F01004190 AS DateTime), CAST(0x0000A71F00DFA021 AS DateTime), CAST(0x0000A71F00DFA021 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (676, 12, 390, 1, CAST(0x0000A71F010087E0 AS DateTime), CAST(0x0000A71F00DFBEA8 AS DateTime), CAST(0x0000A71F00DFBEA8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (677, 12, 487, 1, CAST(0x0000A71F01011480 AS DateTime), CAST(0x0000A71F00E022DF AS DateTime), CAST(0x0000A71F00E022DF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (678, 12, 36, 1, CAST(0x0000A71F01015AD0 AS DateTime), CAST(0x0000A71F00E08005 AS DateTime), CAST(0x0000A71F00E08005 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (679, 12, 279, 1, CAST(0x0000A71F01015AD0 AS DateTime), CAST(0x0000A71F00E08237 AS DateTime), CAST(0x0000A71F00E08237 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (680, 12, 477, 1, CAST(0x0000A71F0101E770 AS DateTime), CAST(0x0000A71F00E11236 AS DateTime), CAST(0x0000A71F00E11236 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (681, 12, 158, 1, CAST(0x0000A71F010300B0 AS DateTime), CAST(0x0000A71F00E21D7B AS DateTime), CAST(0x0000A71F00E21D7B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (682, 12, 103, 1, CAST(0x0000A71F01034700 AS DateTime), CAST(0x0000A71F00E28E18 AS DateTime), CAST(0x0000A71F00E28E18 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (683, 12, 359, 1, CAST(0x0000A71F0103D3A0 AS DateTime), CAST(0x0000A71F00E2FAC5 AS DateTime), CAST(0x0000A71F00E2FAC5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (684, 12, 56, 1, CAST(0x0000A71F010419F0 AS DateTime), CAST(0x0000A71F00E34A18 AS DateTime), CAST(0x0000A71F00E34A18 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (685, 12, 273, 1, CAST(0x0000A71F01046040 AS DateTime), CAST(0x0000A71F00E371C6 AS DateTime), CAST(0x0000A71F00E371C6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (686, 12, 186, 1, CAST(0x0000A71F01046040 AS DateTime), CAST(0x0000A71F00E3A1A3 AS DateTime), CAST(0x0000A71F00E3A1A3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (687, 12, 174, 1, CAST(0x0000A71F01046040 AS DateTime), CAST(0x0000A71F00E3A269 AS DateTime), CAST(0x0000A71F00E3A269 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (688, 12, 136, 1, CAST(0x0000A71F0104A690 AS DateTime), CAST(0x0000A71F00E3C757 AS DateTime), CAST(0x0000A71F00E3C757 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (689, 12, 99, 1, CAST(0x0000A71F0104A690 AS DateTime), CAST(0x0000A71F00E3EFA5 AS DateTime), CAST(0x0000A71F00E3EFA5 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (690, 12, 82, 1, CAST(0x0000A71F0104ECE0 AS DateTime), CAST(0x0000A71F00E443D2 AS DateTime), CAST(0x0000A71F00E443D2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (691, 12, 305, 1, CAST(0x0000A71F01053330 AS DateTime), CAST(0x0000A71F00E45CE8 AS DateTime), CAST(0x0000A71F00E45CE8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (692, 12, 309, 1, CAST(0x0000A71F01053330 AS DateTime), CAST(0x0000A71F00E46326 AS DateTime), CAST(0x0000A71F00E46326 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (693, 12, 85, 1, CAST(0x0000A71F01057980 AS DateTime), CAST(0x0000A71F00E4CABC AS DateTime), CAST(0x0000A71F00E4CABC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (694, 12, 183, 1, CAST(0x0000A71F0105BFD0 AS DateTime), CAST(0x0000A71F00E4F825 AS DateTime), CAST(0x0000A71F00E4F825 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (695, 12, 445, 1, CAST(0x0000A71F0105BFD0 AS DateTime), CAST(0x0000A71F00E5060B AS DateTime), CAST(0x0000A71F00E5060B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (696, 12, 102, 1, CAST(0x0000A71F01060620 AS DateTime), CAST(0x0000A71F00E53557 AS DateTime), CAST(0x0000A71F00E53557 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (697, 12, 66, 1, CAST(0x0000A71F01064C70 AS DateTime), CAST(0x0000A71F00E563F1 AS DateTime), CAST(0x0000A71F00E563F1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (698, 12, 182, 1, CAST(0x0000A71F01064C70 AS DateTime), CAST(0x0000A71F00E595EA AS DateTime), CAST(0x0000A71F00E595EA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (699, 12, 271, 1, CAST(0x0000A71F010692C0 AS DateTime), CAST(0x0000A71F00E5D49C AS DateTime), CAST(0x0000A71F00E5D49C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (700, 12, 486, 1, CAST(0x0000A71F010692C0 AS DateTime), CAST(0x0000A71F00E5D49C AS DateTime), CAST(0x0000A71F00E5D49C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (701, 12, 115, 1, CAST(0x0000A71F0106D910 AS DateTime), CAST(0x0000A71F00E5FAE1 AS DateTime), CAST(0x0000A71F00E5FAE1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (702, 12, 83, 1, CAST(0x0000A71F0106D910 AS DateTime), CAST(0x0000A71F00E6254F AS DateTime), CAST(0x0000A71F00E6254F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (703, 12, 196, 1, CAST(0x0000A71F01071F60 AS DateTime), CAST(0x0000A71F00E6656F AS DateTime), CAST(0x0000A71F00E6656F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (704, 12, 432, 1, CAST(0x0000A71F010765B0 AS DateTime), CAST(0x0000A71F00E693FF AS DateTime), CAST(0x0000A71F00E693FF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (705, 12, 123, 1, CAST(0x0000A71F010765B0 AS DateTime), CAST(0x0000A71F00E6B06A AS DateTime), CAST(0x0000A71F00E6B06A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (706, 12, 334, 1, CAST(0x0000A71F0107F250 AS DateTime), CAST(0x0000A71F00E7054E AS DateTime), CAST(0x0000A71F00E7054E AS DateTime))
GO
print 'Processed 700 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (707, 12, 335, 1, CAST(0x0000A71F0107F250 AS DateTime), CAST(0x0000A71F00E70F2D AS DateTime), CAST(0x0000A71F00E70F2D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (708, 12, 269, 1, CAST(0x0000A71F010838A0 AS DateTime), CAST(0x0000A71F00E78B08 AS DateTime), CAST(0x0000A71F00E78B08 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (709, 12, 222, 1, CAST(0x0000A71F01087EF0 AS DateTime), CAST(0x0000A71F00E7A4BD AS DateTime), CAST(0x0000A71F00E7A4BD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (710, 12, 433, 1, CAST(0x0000A71F01087EF0 AS DateTime), CAST(0x0000A71F00E7CC4F AS DateTime), CAST(0x0000A71F00E7CC4F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (711, 12, 125, 1, CAST(0x0000A71F0108C540 AS DateTime), CAST(0x0000A71F00E7EA40 AS DateTime), CAST(0x0000A71F00E7EA40 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (712, 12, 237, 1, CAST(0x0000A71F0108C540 AS DateTime), CAST(0x0000A71F00E7F09A AS DateTime), CAST(0x0000A71F00E7F09A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (713, 12, 4, 1, CAST(0x0000A71F0108C540 AS DateTime), CAST(0x0000A71F00E812B2 AS DateTime), CAST(0x0000A71F00E812B2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (714, 12, 29, 1, CAST(0x0000A71F01090B90 AS DateTime), CAST(0x0000A71F00E83362 AS DateTime), CAST(0x0000A71F00E83362 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (715, 12, 55, 1, CAST(0x0000A71F010951E0 AS DateTime), CAST(0x0000A71F00E88419 AS DateTime), CAST(0x0000A71F00E88419 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (716, 12, 504, 1, CAST(0x0000A71F010951E0 AS DateTime), CAST(0x0000A71F00E8878A AS DateTime), CAST(0x0000A71F00E8878A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (717, 12, 84, 1, CAST(0x0000A71F010951E0 AS DateTime), CAST(0x0000A71F00E898E2 AS DateTime), CAST(0x0000A71F00E898E2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (718, 12, 310, 1, CAST(0x0000A71F01099830 AS DateTime), CAST(0x0000A71F00E8BC89 AS DateTime), CAST(0x0000A71F00E8BC89 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (719, 12, 364, 1, CAST(0x0000A71F01099830 AS DateTime), CAST(0x0000A71F00E8CB25 AS DateTime), CAST(0x0000A71F00E8CB25 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (720, 12, 238, 1, CAST(0x0000A71F01099830 AS DateTime), CAST(0x0000A71F00E8CFED AS DateTime), CAST(0x0000A71F00E8CFED AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (721, 12, 365, 1, CAST(0x0000A71F01099830 AS DateTime), CAST(0x0000A71F00E8D41A AS DateTime), CAST(0x0000A71F00E8D41A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (722, 12, 80, 1, CAST(0x0000A71F0109DE80 AS DateTime), CAST(0x0000A71F00E8FBC8 AS DateTime), CAST(0x0000A71F00E8FBC8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (723, 12, 307, 1, CAST(0x0000A71F0109DE80 AS DateTime), CAST(0x0000A71F00E9140B AS DateTime), CAST(0x0000A71F00E9140B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (724, 12, 268, 1, CAST(0x0000A71F010A24D0 AS DateTime), CAST(0x0000A71F00E95D2D AS DateTime), CAST(0x0000A71F00E95D2D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (725, 12, 98, 1, CAST(0x0000A71F010A6B20 AS DateTime), CAST(0x0000A71F00E99577 AS DateTime), CAST(0x0000A71F00E99577 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (726, 12, 520, 1, CAST(0x0000A71F010A6B20 AS DateTime), CAST(0x0000A71F00E9A202 AS DateTime), CAST(0x0000A71F00E9A202 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (727, 12, 385, 1, CAST(0x0000A71F010A6B20 AS DateTime), CAST(0x0000A71F00E9B84F AS DateTime), CAST(0x0000A71F00E9B84F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (728, 12, 133, 1, CAST(0x0000A71F010AB170 AS DateTime), CAST(0x0000A71F00E9F21E AS DateTime), CAST(0x0000A71F00E9F21E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (729, 12, 45, 1, CAST(0x0000A71F010AB170 AS DateTime), CAST(0x0000A71F00EA0012 AS DateTime), CAST(0x0000A71F00EA0012 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (730, 12, 121, 1, CAST(0x0000A71F010AF7C0 AS DateTime), CAST(0x0000A71F00EA5C9E AS DateTime), CAST(0x0000A71F00EA5C9E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (731, 12, 138, 1, CAST(0x0000A71F010B3E10 AS DateTime), CAST(0x0000A71F00EA7421 AS DateTime), CAST(0x0000A71F00EA7421 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (732, 12, 535, 1, CAST(0x0000A71F010B3E10 AS DateTime), CAST(0x0000A71F00EA8706 AS DateTime), CAST(0x0000A71F00EA8706 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (733, 12, 235, 1, CAST(0x0000A71F010B3E10 AS DateTime), CAST(0x0000A71F00EA90CE AS DateTime), CAST(0x0000A71F00EA90CE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (734, 12, 220, 1, CAST(0x0000A71F010B8460 AS DateTime), CAST(0x0000A71F00EAB872 AS DateTime), CAST(0x0000A71F00EAB872 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (735, 12, 155, 1, CAST(0x0000A71F010B8460 AS DateTime), CAST(0x0000A71F00EAD427 AS DateTime), CAST(0x0000A71F00EAD427 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (736, 12, 502, 1, CAST(0x0000A71F010BCAB0 AS DateTime), CAST(0x0000A71F00EB05AF AS DateTime), CAST(0x0000A71F00EB05AF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (737, 12, 439, 1, CAST(0x0000A71F010C1100 AS DateTime), CAST(0x0000A71F00EB5705 AS DateTime), CAST(0x0000A71F00EB5705 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (738, 12, 277, 1, CAST(0x0000A71F010C9DA0 AS DateTime), CAST(0x0000A71F00EBC00D AS DateTime), CAST(0x0000A71F00EBC00D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (739, 12, 299, 1, CAST(0x0000A71F010C9DA0 AS DateTime), CAST(0x0000A71F00EBECB2 AS DateTime), CAST(0x0000A71F00EBECB2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (740, 12, 150, 1, CAST(0x0000A71F010D2A40 AS DateTime), CAST(0x0000A71F00EC4BF7 AS DateTime), CAST(0x0000A71F00EC4BF7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (741, 12, 424, 1, CAST(0x0000A71F010D7090 AS DateTime), CAST(0x0000A71F00EC8577 AS DateTime), CAST(0x0000A71F00EC8577 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (742, 12, 77, 1, CAST(0x0000A71F010DB6E0 AS DateTime), CAST(0x0000A71F00ECFA90 AS DateTime), CAST(0x0000A71F00ECFA90 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (743, 12, 43, 1, CAST(0x0000A71F010E4380 AS DateTime), CAST(0x0000A71F00ED7455 AS DateTime), CAST(0x0000A71F00ED7455 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (744, 12, 363, 1, CAST(0x0000A71F010E89D0 AS DateTime), CAST(0x0000A71F00EDB3B0 AS DateTime), CAST(0x0000A71F00EDB3B0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (745, 12, 51, 1, CAST(0x0000A71F010E89D0 AS DateTime), CAST(0x0000A71F00EDDECB AS DateTime), CAST(0x0000A71F00EDDECB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (746, 12, 62, 1, CAST(0x0000A71F010F5CC0 AS DateTime), CAST(0x0000A71F00EE7CC7 AS DateTime), CAST(0x0000A71F00EE7CC7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (747, 12, 89, 1, CAST(0x0000A71F010F5CC0 AS DateTime), CAST(0x0000A71F00EE9CEA AS DateTime), CAST(0x0000A71F00EE9CEA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (748, 12, 94, 1, CAST(0x0000A71F010F5CC0 AS DateTime), CAST(0x0000A71F00EEAEEF AS DateTime), CAST(0x0000A71F00EEAEEF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (749, 12, 108, 1, CAST(0x0000A71F010FA310 AS DateTime), CAST(0x0000A71F00EEB325 AS DateTime), CAST(0x0000A71F00EEB325 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (750, 12, 111, 1, CAST(0x0000A71F010FA310 AS DateTime), CAST(0x0000A71F00EEB73F AS DateTime), CAST(0x0000A71F00EEB73F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (751, 12, 179, 1, CAST(0x0000A71F010FE960 AS DateTime), CAST(0x0000A71F00EF0168 AS DateTime), CAST(0x0000A71F00EF0168 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (752, 12, 515, 1, CAST(0x0000A71F011102A0 AS DateTime), CAST(0x0000A71F00F0148C AS DateTime), CAST(0x0000A71F00F0148C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (753, 12, 462, 1, CAST(0x0000A71F011102A0 AS DateTime), CAST(0x0000A71F00F02A35 AS DateTime), CAST(0x0000A71F00F02A35 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (754, 12, 116, 1, CAST(0x0000A71F011148F0 AS DateTime), CAST(0x0000A71F00F05EED AS DateTime), CAST(0x0000A71F00F05EED AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (755, 12, 162, 1, CAST(0x0000A71F0113C1C0 AS DateTime), CAST(0x0000A71F00F306A7 AS DateTime), CAST(0x0000A71F00F306A7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (756, 12, 352, 1, CAST(0x0000A71F01144E60 AS DateTime), CAST(0x0000A71F00F36007 AS DateTime), CAST(0x0000A71F00F36007 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (757, 12, 35, 1, CAST(0x0000A71F01152150 AS DateTime), CAST(0x0000A71F00F4679D AS DateTime), CAST(0x0000A71F00F4679D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (758, 12, 184, 1, CAST(0x0000A71F0115F440 AS DateTime), CAST(0x0000A71F00F54537 AS DateTime), CAST(0x0000A71F00F54537 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (759, 12, 455, 1, CAST(0x0000A71F011753D0 AS DateTime), CAST(0x0000A71F00F66AB0 AS DateTime), CAST(0x0000A71F00F66AB0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (760, 12, 374, 1, CAST(0x0000A71F01179A20 AS DateTime), CAST(0x0000A71F00F6C04A AS DateTime), CAST(0x0000A71F00F6C04A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (761, 12, 70, 1, CAST(0x0000A71F0118B360 AS DateTime), CAST(0x0000A71F00F7C5C6 AS DateTime), CAST(0x0000A71F00F7C5C6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (762, 12, 212, 1, CAST(0x0000A71F0118F9B0 AS DateTime), CAST(0x0000A71F00F81A39 AS DateTime), CAST(0x0000A71F00F81A39 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (763, 12, 319, 1, CAST(0x0000A71F01194000 AS DateTime), CAST(0x0000A71F00F87DE8 AS DateTime), CAST(0x0000A71F00F87DE8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (764, 12, 221, 1, CAST(0x0000A71F01198650 AS DateTime), CAST(0x0000A71F00F8C12A AS DateTime), CAST(0x0000A71F00F8C12A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (765, 12, 361, 1, CAST(0x0000A71F011B7280 AS DateTime), CAST(0x0000A71F00FAA64C AS DateTime), CAST(0x0000A71F00FAA64C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (766, 12, 512, 1, CAST(0x0000A71F011B7280 AS DateTime), CAST(0x0000A71F00FAB1BE AS DateTime), CAST(0x0000A71F00FAB1BE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (767, 12, 205, 1, CAST(0x0000A71F011BB8D0 AS DateTime), CAST(0x0000A71F00FAD620 AS DateTime), CAST(0x0000A71F00FAD620 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (768, 12, 539, 1, CAST(0x0000A71F011DEB50 AS DateTime), CAST(0x0000A71F00FD1B51 AS DateTime), CAST(0x0000A71F00FD1B51 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (769, 12, 353, 1, CAST(0x0000A71F011EBE40 AS DateTime), CAST(0x0000A71F00FDD4E1 AS DateTime), CAST(0x0000A71F00FDD4E1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (770, 12, 197, 1, CAST(0x0000A71F011F0490 AS DateTime), CAST(0x0000A71F00FE3FE8 AS DateTime), CAST(0x0000A71F00FE3FE8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (771, 12, 135, 1, CAST(0x0000A71F011F4AE0 AS DateTime), CAST(0x0000A71F00FE794B AS DateTime), CAST(0x0000A71F00FE794B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (772, 12, 122, 1, CAST(0x0000A71F011F4AE0 AS DateTime), CAST(0x0000A71F00FE907A AS DateTime), CAST(0x0000A71F00FE907A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (773, 12, 496, 1, CAST(0x0000A71F01236990 AS DateTime), CAST(0x0000A71F01029921 AS DateTime), CAST(0x0000A71F01029921 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (774, 12, 354, 1, CAST(0x0000A71F01236990 AS DateTime), CAST(0x0000A71F0102B65B AS DateTime), CAST(0x0000A71F0102B65B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (775, 13, 390, 1, CAST(0x0000A7260102BA60 AS DateTime), CAST(0x0000A72600E1E7EF AS DateTime), CAST(0x0000A72600E1E7EF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (776, 13, 197, 1, CAST(0x0000A7260102BA60 AS DateTime), CAST(0x0000A72600E1F517 AS DateTime), CAST(0x0000A72600E1F517 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (777, 13, 36, 1, CAST(0x0000A726010300B0 AS DateTime), CAST(0x0000A72600E20D15 AS DateTime), CAST(0x0000A72600E20D15 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (778, 13, 156, 1, CAST(0x0000A726010300B0 AS DateTime), CAST(0x0000A72600E22172 AS DateTime), CAST(0x0000A72600E22172 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (779, 13, 273, 1, CAST(0x0000A72601034700 AS DateTime), CAST(0x0000A72600E2534D AS DateTime), CAST(0x0000A72600E2534D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (780, 13, 345, 1, CAST(0x0000A72601034700 AS DateTime), CAST(0x0000A72600E26214 AS DateTime), CAST(0x0000A72600E26214 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (781, 13, 279, 1, CAST(0x0000A72601034700 AS DateTime), CAST(0x0000A72600E271B1 AS DateTime), CAST(0x0000A72600E271B1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (782, 13, 85, 1, CAST(0x0000A72601034700 AS DateTime), CAST(0x0000A72600E286D0 AS DateTime), CAST(0x0000A72600E286D0 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (783, 13, 310, 1, CAST(0x0000A72601034700 AS DateTime), CAST(0x0000A72600E29282 AS DateTime), CAST(0x0000A72600E29282 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (784, 13, 309, 1, CAST(0x0000A7260103D3A0 AS DateTime), CAST(0x0000A72600E3131B AS DateTime), CAST(0x0000A72600E3131B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (785, 13, 392, 1, CAST(0x0000A726010419F0 AS DateTime), CAST(0x0000A72600E356F8 AS DateTime), CAST(0x0000A72600E356F8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (786, 13, 121, 1, CAST(0x0000A72601046040 AS DateTime), CAST(0x0000A72600E37214 AS DateTime), CAST(0x0000A72600E37214 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (787, 13, 445, 1, CAST(0x0000A72601046040 AS DateTime), CAST(0x0000A72600E383BC AS DateTime), CAST(0x0000A72600E383BC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (788, 13, 179, 1, CAST(0x0000A7260104A690 AS DateTime), CAST(0x0000A72600E3D4C4 AS DateTime), CAST(0x0000A72600E3D4C4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (789, 13, 504, 1, CAST(0x0000A7260104ECE0 AS DateTime), CAST(0x0000A72600E42093 AS DateTime), CAST(0x0000A72600E42093 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (790, 13, 183, 1, CAST(0x0000A7260104ECE0 AS DateTime), CAST(0x0000A72600E43A00 AS DateTime), CAST(0x0000A72600E43A00 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (791, 13, 477, 1, CAST(0x0000A72601053330 AS DateTime), CAST(0x0000A72600E455EC AS DateTime), CAST(0x0000A72600E455EC AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (792, 13, 55, 1, CAST(0x0000A72601053330 AS DateTime), CAST(0x0000A72600E47135 AS DateTime), CAST(0x0000A72600E47135 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (793, 13, 23, 1, CAST(0x0000A72601057980 AS DateTime), CAST(0x0000A72600E4B05E AS DateTime), CAST(0x0000A72600E4B05E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (794, 13, 520, 1, CAST(0x0000A72601057980 AS DateTime), CAST(0x0000A72600E4BE4A AS DateTime), CAST(0x0000A72600E4BE4A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (795, 13, 359, 1, CAST(0x0000A7260105BFD0 AS DateTime), CAST(0x0000A72600E4D125 AS DateTime), CAST(0x0000A72600E4D125 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (796, 13, 237, 1, CAST(0x0000A72601060620 AS DateTime), CAST(0x0000A72600E4E7F7 AS DateTime), CAST(0x0000A72600E4E7F7 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (797, 13, 224, 1, CAST(0x0000A7260105BFD0 AS DateTime), CAST(0x0000A72600E50B93 AS DateTime), CAST(0x0000A72600E50B93 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (798, 13, 385, 1, CAST(0x0000A72601060620 AS DateTime), CAST(0x0000A72600E527F4 AS DateTime), CAST(0x0000A72600E527F4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (799, 13, 29, 1, CAST(0x0000A726010692C0 AS DateTime), CAST(0x0000A72600E53CD6 AS DateTime), CAST(0x0000A72600E53CD6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (800, 13, 433, 1, CAST(0x0000A72601060620 AS DateTime), CAST(0x0000A72600E5522E AS DateTime), CAST(0x0000A72600E5522E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (801, 13, 186, 1, CAST(0x0000A72601064C70 AS DateTime), CAST(0x0000A72600E586F3 AS DateTime), CAST(0x0000A72600E586F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (802, 13, 27, 1, CAST(0x0000A726010692C0 AS DateTime), CAST(0x0000A72600E5A877 AS DateTime), CAST(0x0000A72600E5A877 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (803, 13, 98, 1, CAST(0x0000A726010692C0 AS DateTime), CAST(0x0000A72600E5BC39 AS DateTime), CAST(0x0000A72600E5BC39 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (804, 13, 99, 1, CAST(0x0000A726010692C0 AS DateTime), CAST(0x0000A72600E5D7DD AS DateTime), CAST(0x0000A72600E5D7DD AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (805, 13, 238, 1, CAST(0x0000A726010692C0 AS DateTime), CAST(0x0000A72600E5DB11 AS DateTime), CAST(0x0000A72600E5DB11 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (806, 13, 136, 1, CAST(0x0000A7260106D910 AS DateTime), CAST(0x0000A72600E5E5F1 AS DateTime), CAST(0x0000A72600E5E5F1 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (807, 13, 206, 1, CAST(0x0000A7260106D910 AS DateTime), CAST(0x0000A72600E5F06D AS DateTime), CAST(0x0000A72600E5F06D AS DateTime))
GO
print 'Processed 800 total records'
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (808, 13, 486, 1, CAST(0x0000A7260106D910 AS DateTime), CAST(0x0000A72600E5FB4D AS DateTime), CAST(0x0000A72600E5FB4D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (809, 13, 66, 1, CAST(0x0000A7260106D910 AS DateTime), CAST(0x0000A72600E60C61 AS DateTime), CAST(0x0000A72600E60C61 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (810, 13, 123, 1, CAST(0x0000A7260106D910 AS DateTime), CAST(0x0000A72600E6140B AS DateTime), CAST(0x0000A72600E6140B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (811, 13, 196, 1, CAST(0x0000A7260106D910 AS DateTime), CAST(0x0000A72600E61FE6 AS DateTime), CAST(0x0000A72600E61FE6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (812, 13, 432, 1, CAST(0x0000A72601071F60 AS DateTime), CAST(0x0000A72600E631A9 AS DateTime), CAST(0x0000A72600E631A9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (813, 13, 102, 1, CAST(0x0000A726010765B0 AS DateTime), CAST(0x0000A72600E67320 AS DateTime), CAST(0x0000A72600E67320 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (814, 13, 319, 1, CAST(0x0000A726010765B0 AS DateTime), CAST(0x0000A72600E6A40C AS DateTime), CAST(0x0000A72600E6A40C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (815, 13, 117, 1, CAST(0x0000A7260107AC00 AS DateTime), CAST(0x0000A72600E6BA95 AS DateTime), CAST(0x0000A72600E6BA95 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (816, 13, 162, 1, CAST(0x0000A7260107AC00 AS DateTime), CAST(0x0000A72600E6D308 AS DateTime), CAST(0x0000A72600E6D308 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (817, 13, 440, 1, CAST(0x0000A7260107AC00 AS DateTime), CAST(0x0000A72600E6EFDE AS DateTime), CAST(0x0000A72600E6EFDE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (818, 13, 125, 1, CAST(0x0000A7260107F250 AS DateTime), CAST(0x0000A72600E70E56 AS DateTime), CAST(0x0000A72600E70E56 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (819, 13, 83, 1, CAST(0x0000A7260107F250 AS DateTime), CAST(0x0000A72600E72CEF AS DateTime), CAST(0x0000A72600E72CEF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (820, 13, 335, 1, CAST(0x0000A72601087EF0 AS DateTime), CAST(0x0000A72600E7B94B AS DateTime), CAST(0x0000A72600E7B94B AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (821, 13, 308, 1, CAST(0x0000A72601087EF0 AS DateTime), CAST(0x0000A72600E7CA8F AS DateTime), CAST(0x0000A72600E7CA8F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (822, 13, 363, 1, CAST(0x0000A7260108C540 AS DateTime), CAST(0x0000A72600E7FD18 AS DateTime), CAST(0x0000A72600E7FD18 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (823, 13, 361, 1, CAST(0x0000A72601099830 AS DateTime), CAST(0x0000A72600E802A3 AS DateTime), CAST(0x0000A72600E802A3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (824, 13, 135, 1, CAST(0x0000A72601090B90 AS DateTime), CAST(0x0000A72600E816C8 AS DateTime), CAST(0x0000A72600E816C8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (825, 13, 150, 1, CAST(0x0000A726010951E0 AS DateTime), CAST(0x0000A72600E89AC6 AS DateTime), CAST(0x0000A72600E89AC6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (826, 13, 424, 1, CAST(0x0000A72601099830 AS DateTime), CAST(0x0000A72600E8E29D AS DateTime), CAST(0x0000A72600E8E29D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (827, 13, 82, 1, CAST(0x0000A7260109DE80 AS DateTime), CAST(0x0000A72600E8F268 AS DateTime), CAST(0x0000A72600E8F268 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (828, 13, 62, 1, CAST(0x0000A726010A24D0 AS DateTime), CAST(0x0000A72600E95C18 AS DateTime), CAST(0x0000A72600E95C18 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (829, 13, 80, 1, CAST(0x0000A726010D2A40 AS DateTime), CAST(0x0000A72600E9756E AS DateTime), CAST(0x0000A72600E9756E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (830, 13, 84, 1, CAST(0x0000A726010A6B20 AS DateTime), CAST(0x0000A72600E9916A AS DateTime), CAST(0x0000A72600E9916A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (831, 13, 344, 1, CAST(0x0000A726010C9DA0 AS DateTime), CAST(0x0000A72600EA0A55 AS DateTime), CAST(0x0000A72600EA0A55 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (832, 13, 205, 1, CAST(0x0000A726010BCAB0 AS DateTime), CAST(0x0000A72600EA31F3 AS DateTime), CAST(0x0000A72600EA31F3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (833, 13, 502, 1, CAST(0x0000A726010AF7C0 AS DateTime), CAST(0x0000A72600EA3DD8 AS DateTime), CAST(0x0000A72600EA3DD8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (834, 13, 212, 1, CAST(0x0000A726010B3E10 AS DateTime), CAST(0x0000A72600EA4C51 AS DateTime), CAST(0x0000A72600EA4C51 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (835, 13, 94, 1, CAST(0x0000A726010B3E10 AS DateTime), CAST(0x0000A72600EA6567 AS DateTime), CAST(0x0000A72600EA6567 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (836, 13, 56, 1, CAST(0x0000A726010B3E10 AS DateTime), CAST(0x0000A72600EA7081 AS DateTime), CAST(0x0000A72600EA7081 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (837, 13, 115, 1, CAST(0x0000A726010DFD30 AS DateTime), CAST(0x0000A72600EAAC73 AS DateTime), CAST(0x0000A72600EAAC73 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (838, 13, 70, 1, CAST(0x0000A726010F5CC0 AS DateTime), CAST(0x0000A72600EACA7A AS DateTime), CAST(0x0000A72600EACA7A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (839, 13, 45, 1, CAST(0x0000A726010F1670 AS DateTime), CAST(0x0000A72600EAE2A4 AS DateTime), CAST(0x0000A72600EAE2A4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (840, 13, 184, 1, CAST(0x0000A726010BCAB0 AS DateTime), CAST(0x0000A72600EAEC6A AS DateTime), CAST(0x0000A72600EAEC6A AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (841, 13, 215, 1, CAST(0x0000A726010C1100 AS DateTime), CAST(0x0000A72600EB4780 AS DateTime), CAST(0x0000A72600EB4780 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (842, 13, 271, 1, CAST(0x0000A726010C5750 AS DateTime), CAST(0x0000A72600EBA824 AS DateTime), CAST(0x0000A72600EBA824 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (843, 13, 355, 1, CAST(0x0000A726010C9DA0 AS DateTime), CAST(0x0000A72600EBACB6 AS DateTime), CAST(0x0000A72600EBACB6 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (844, 13, 192, 1, CAST(0x0000A726010CE3F0 AS DateTime), CAST(0x0000A72600EC0480 AS DateTime), CAST(0x0000A72600EC0480 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (845, 13, 168, 1, CAST(0x0000A726010CE3F0 AS DateTime), CAST(0x0000A72600EC1CC4 AS DateTime), CAST(0x0000A72600EC1CC4 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (846, 13, 122, 1, CAST(0x0000A726010D2A40 AS DateTime), CAST(0x0000A72600EC4952 AS DateTime), CAST(0x0000A72600EC4952 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (847, 13, 299, 1, CAST(0x0000A726010D7090 AS DateTime), CAST(0x0000A72600EC8144 AS DateTime), CAST(0x0000A72600EC8144 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (848, 13, 314, 1, CAST(0x0000A726010E4380 AS DateTime), CAST(0x0000A72600ED5DA2 AS DateTime), CAST(0x0000A72600ED5DA2 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (849, 13, 389, 1, CAST(0x0000A726010E4380 AS DateTime), CAST(0x0000A72600ED9318 AS DateTime), CAST(0x0000A72600ED9318 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (850, 13, 354, 1, CAST(0x0000A726010F1670 AS DateTime), CAST(0x0000A72600EDBE0D AS DateTime), CAST(0x0000A72600EDBE0D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (851, 13, 301, 1, CAST(0x0000A726010ED020 AS DateTime), CAST(0x0000A72600EE156F AS DateTime), CAST(0x0000A72600EE156F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (852, 13, 327, 1, CAST(0x0000A726010FA310 AS DateTime), CAST(0x0000A72600EEBC20 AS DateTime), CAST(0x0000A72600EEBC20 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (853, 13, 536, 1, CAST(0x0000A726010FE960 AS DateTime), CAST(0x0000A72600EF12AF AS DateTime), CAST(0x0000A72600EF12AF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (854, 13, 539, 1, CAST(0x0000A726010FE960 AS DateTime), CAST(0x0000A72600EF18D8 AS DateTime), CAST(0x0000A72600EF18D8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (855, 13, 495, 1, CAST(0x0000A72601102FB0 AS DateTime), CAST(0x0000A72600EF4A83 AS DateTime), CAST(0x0000A72600EF4A83 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (856, 13, 116, 1, CAST(0x0000A72601102FB0 AS DateTime), CAST(0x0000A72600EF6FDF AS DateTime), CAST(0x0000A72600EF6FDF AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (857, 13, 535, 1, CAST(0x0000A72601107600 AS DateTime), CAST(0x0000A72600EF99EE AS DateTime), CAST(0x0000A72600EF99EE AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (858, 13, 353, 1, CAST(0x0000A7260110BC50 AS DateTime), CAST(0x0000A72600F0003C AS DateTime), CAST(0x0000A72600F0003C AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (859, 13, 365, 1, CAST(0x0000A726011148F0 AS DateTime), CAST(0x0000A72600F0899F AS DateTime), CAST(0x0000A72600F0899F AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (860, 13, 22, 1, CAST(0x0000A7260111D590 AS DateTime), CAST(0x0000A72600F0E7E8 AS DateTime), CAST(0x0000A72600F0E7E8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (861, 13, 352, 1, CAST(0x0000A7260111D590 AS DateTime), CAST(0x0000A72600F100D3 AS DateTime), CAST(0x0000A72600F100D3 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (862, 13, 172, 1, CAST(0x0000A72601126230 AS DateTime), CAST(0x0000A72600F1764D AS DateTime), CAST(0x0000A72600F1764D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (863, 13, 216, 1, CAST(0x0000A72601126230 AS DateTime), CAST(0x0000A72600F198C8 AS DateTime), CAST(0x0000A72600F198C8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (864, 13, 222, 1, CAST(0x0000A7260112A880 AS DateTime), CAST(0x0000A72600F1F331 AS DateTime), CAST(0x0000A72600F1F331 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (865, 13, 77, 1, CAST(0x0000A72601140810 AS DateTime), CAST(0x0000A72600F33FCA AS DateTime), CAST(0x0000A72600F33FCA AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (866, 13, 38, 1, CAST(0x0000A72601152150 AS DateTime), CAST(0x0000A72600F44996 AS DateTime), CAST(0x0000A72600F44996 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (867, 13, 268, 1, CAST(0x0000A72601170D80 AS DateTime), CAST(0x0000A72600F6557D AS DateTime), CAST(0x0000A72600F6557D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (868, 13, 144, 1, CAST(0x0000A726011753D0 AS DateTime), CAST(0x0000A72600F69E82 AS DateTime), CAST(0x0000A72600F69E82 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (869, 13, 342, 1, CAST(0x0000A7260117E070 AS DateTime), CAST(0x0000A72600F7193E AS DateTime), CAST(0x0000A72600F7193E AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (870, 13, 4, 1, CAST(0x0000A72601186D10 AS DateTime), CAST(0x0000A72600F7AF52 AS DateTime), CAST(0x0000A72600F7AF52 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (871, 13, 277, 1, CAST(0x0000A7260118B360 AS DateTime), CAST(0x0000A72600F80440 AS DateTime), CAST(0x0000A72600F80440 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (872, 13, 374, 1, CAST(0x0000A7260119CCA0 AS DateTime), CAST(0x0000A72600F8ECF8 AS DateTime), CAST(0x0000A72600F8ECF8 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (873, 13, 305, 1, CAST(0x0000A726011B7280 AS DateTime), CAST(0x0000A72600FAB7BB AS DateTime), CAST(0x0000A72600FAB7BB AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (874, 13, 221, 1, CAST(0x0000A726011C4570 AS DateTime), CAST(0x0000A72600FB8FE9 AS DateTime), CAST(0x0000A72600FB8FE9 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (875, 13, 462, 1, CAST(0x0000A726011FD780 AS DateTime), CAST(0x0000A72600FEE74D AS DateTime), CAST(0x0000A72600FEE74D AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (876, 13, 51, 1, CAST(0x0000A72601201DD0 AS DateTime), CAST(0x0000A72600FF3B44 AS DateTime), CAST(0x0000A72600FF3B44 AS DateTime))
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (877, 13, 182, 1, CAST(0x0000A726012B60A0 AS DateTime), CAST(0x0000A726010AA76E AS DateTime), CAST(0x0000A726010AA76E AS DateTime))
SET IDENTITY_INSERT [dbo].[Att_Attendance] OFF
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendees]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.Att_GetAttendees null
CREATE PROCEDURE [dbo].[Att_GetAttendees] 
	@filter VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Att.*, 
		(Att.FirstName +'' ''+ IsNull(Att.MiddleName,'''') +'' ''+ Att.LastName) AS FullName, 
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName
	FROM dbo.Att_Attendee AS Att
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE ISNULL(@filter, '''') = '''' OR (Att.FirstName LIKE @filter+''%'' OR Att.LastName LIKE @filter+''%'')
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeeById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.Att_GetAttendeeById 11
CREATE PROCEDURE [dbo].[Att_GetAttendeeById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Att.*, 
		(Att.FirstName +'' ''+ IsNull(Att.MiddleName,'''') +'' ''+ Att.LastName) AS FullName, 
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName
	FROM dbo.Att_Attendee AS Att
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE Att.Id = @Id  

END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendee]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.Att_GetAttendeeById 11
CREATE PROCEDURE [dbo].[Att_SaveAttendee]
    @Id INT = 0,
    @FirstName VARCHAR(100),
    @MiddleName VARCHAR(100) = NULL,
    @LastName VARCHAR(100) = NULL,
    @Gender VARCHAR(100) = NULL,
    @Address VARCHAR(500) = NULL,
    @ZoneId INT = NULL,
    @CityId INT = NULL,
    @IsKaryakar BIT = 0
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Id = 0
	BEGIN
		INSERT INTO dbo.Att_Attendee (FirstName, MiddleName, LastName, Gender, [Address], ZoneId, CityId, IsKaryakar)
		VALUES (@FirstName, @MiddleName, @LastName, @Gender, @Address, @ZoneId, @CityId, @IsKaryakar)
	END
	ELSE
	BEGIN
		UPDATE dbo.Att_Attendee SET 
			FirstName = @FirstName, 
			MiddleName = @MiddleName, 
			LastName = @LastName, 
			Gender = @Gender, 
			[Address] = @Address, 
			ZoneId = @ZoneId, 
			CityId = @CityId, 
			IsKaryakar = @IsKaryakar
		WHERE Id = @Id
	END
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByEventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByEventSchedule]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.[Att_GetReportByEventSchedule] 8, ''Pare''
CREATE PROCEDURE [dbo].[Att_GetReportByEventSchedule] 
	@EventScheduleId INT,
	@Filter VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @EventDate DATETIME = (SELECT TOP 1 EventDate FROM dbo.Att_EventSchedule WHERE Id = @EventScheduleId)
	DECLARE @Slot1 DATETIME = @EventDate, @Slot2 DATETIME = @EventDate, @Slot3 DATETIME = @EventDate 
	
	SET @Slot1 = DATEADD(HOUR,	 16, @Slot1)
	SET @Slot2 = DATEADD(HOUR,	 16, @Slot2); SET @Slot2 = DATEADD(MINUTE, 15, @Slot2)
	SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 30, @Slot3)

	SELECT Attendance.*, 
		RIGHT(CONVERT(CHAR(20),AttendanceTime, 0),7) AS AttendanceTimeOnly,
		--@Slot1,@Slot2,@Slot3,
		CASE WHEN AttendanceTime <= @Slot1 THEN ''Slot-1''
			 WHEN AttendanceTime <= @Slot2 THEN ''Slot-2''
			 WHEN AttendanceTime <= @Slot3 THEN ''Slot-3''
			 WHEN AttendanceTime  > @Slot3 THEN ''Slot-4''
		END AS ''Slot'',
		
		CONVERT(VARCHAR(8),@EventDate,101) AS EventShortDate,
		
		Att.FirstName,
		IsNull(Att.MiddleName,'''') AS MiddleName,
		Att.LastName,
		Att.Gender,
		Att.Address,
		Att.IsKaryakar,
		Att.CityId,
		Att.ZoneId,
		(Att.FirstName +'' ''+ IsNull(Att.MiddleName,'''') +'' ''+ Att.LastName) AS AttendeeFullName, 
		
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName
		
	FROM dbo.Att_Attendance AS Attendance
		--INNER JOIN dbo.Att_EventSchedule AS ES ON ES.Id = Attendance.EventScheduleId
		INNER JOIN dbo.Att_Attendee AS Att ON Att.Id = Attendance.AttendeeId
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE Attendance.EventScheduleId = @EventScheduleId AND (ISNULL(@filter, '''') = '''' OR (Att.FirstName LIKE @filter+''%'' OR Att.LastName LIKE @filter+''%''))
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByAttendee]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByAttendee]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- EXEC dbo.[Att_GetReportByAttendee] 345
CREATE PROCEDURE [dbo].[Att_GetReportByAttendee] 
	@AttendeeId INT
AS
BEGIN
	SET NOCOUNT ON;

	--DECLARE @EventDate DATETIME = (SELECT TOP 1 EventDate FROM dbo.Att_EventSchedule WHERE Id = @EventScheduleId)
	--DECLARE @Slot1 DATETIME = @EventDate, @Slot2 DATETIME = @EventDate, @Slot3 DATETIME = @EventDate 
	
	--SET @Slot1 = DATEADD(HOUR,	 16, @Slot1)
	--SET @Slot2 = DATEADD(HOUR,	 16, @Slot2); SET @Slot2 = DATEADD(MINUTE, 15, @Slot2)
	--SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 15, @Slot3)

	SELECT Attendance.*, 
		RIGHT(CONVERT(CHAR(20),AttendanceTime, 0),7) AS AttendanceTimeOnly,
		--@Slot1,@Slot2,@Slot3,
		CASE WHEN AttendanceTime <= SLT.Slot1 THEN ''Slot-1''
			 WHEN AttendanceTime <= SLT.Slot2 THEN ''Slot-2''
			 WHEN AttendanceTime <= SLT.Slot3 THEN ''Slot-3''
			 WHEN AttendanceTime  > SLT.Slot3 THEN ''Slot-4''
		END AS ''Slot'',
		
		CONVERT(VARCHAR(10),ES.EventDate,101) AS EventShortDate,
		
		Att.FirstName,
		IsNull(Att.MiddleName,'''') AS MiddleName,
		Att.LastName,
		Att.Gender,
		Att.Address,
		Att.IsKaryakar,
		Att.CityId,
		Att.ZoneId,
		(Att.FirstName +'' ''+ IsNull(Att.MiddleName,'''') +'' ''+ Att.LastName) AS AttendeeFullName, 
		
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName
		
	FROM dbo.Att_Attendance AS Attendance
		INNER JOIN dbo.Att_EventSchedule AS ES ON ES.Id = Attendance.EventScheduleId
		INNER JOIN dbo.Att_Attendee AS Att ON Att.Id = Attendance.AttendeeId
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
		Cross apply dbo.GetSlotsForDate(ES.EventDate) AS SLT
	WHERE Attendance.AttendeeId = @AttendeeId
	ORDER BY Attendance.CreatedOn DESC
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendance]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendance]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.Att_GetAttendeeById 11
CREATE PROCEDURE [dbo].[Att_SaveAttendance]
    @EventScheduleId INT,
    @AttendeeId INT,
    @AttendanceTime DATETIME,
    @IsAttended BIT = 1
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM dbo.Att_Attendance WHERE EventScheduleId = @EventScheduleId AND AttendeeId = @AttendeeId)
	BEGIN
		INSERT INTO dbo.Att_Attendance (EventScheduleId, AttendeeId, IsAttended, AttendanceTime)
		VALUES (@EventScheduleId, @AttendeeId, @IsAttended, @AttendanceTime)
	END
	ELSE
	BEGIN
		UPDATE dbo.Att_Attendance SET 
			EventScheduleId = @EventScheduleId, 
			AttendeeId = @AttendeeId, 
			IsAttended = @IsAttended, 
			AttendanceTime = @AttendanceTime
		WHERE EventScheduleId = @EventScheduleId AND AttendeeId = @AttendeeId
	END
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendancesByEventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendancesByEventSchedule]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.[Att_GetAttendancesByEventSchedule] 7, ''M'', ''PARESH''
CREATE PROCEDURE [dbo].[Att_GetAttendancesByEventSchedule] 
	@EventScheduleId INT,
	@Gender VARCHAR(100) = ''M'',
	@Filter VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @EventDate DATETIME = (SELECT TOP 1 EventDate FROM dbo.Att_EventSchedule WHERE Id = @EventScheduleId)
	DECLARE @Slot1 DATETIME = @EventDate, @Slot2 DATETIME = @EventDate, @Slot3 DATETIME = @EventDate 
	
	SET @Slot1 = DATEADD(HOUR,	 16, @Slot1)
	SET @Slot2 = DATEADD(HOUR,	 16, @Slot2); SET @Slot2 = DATEADD(MINUTE, 15, @Slot2)
	SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 15, @Slot3)

	SELECT  
		Att.Id AS AttendeeId,
		Att.FirstName,
		IsNull(Att.MiddleName,'''') AS MiddleName,
		Att.LastName,
		Att.Gender,
		Att.Address,
		Att.IsKaryakar,
		Att.CityId,
		Att.ZoneId,
		(Att.FirstName +'' ''+ IsNull(Att.MiddleName,'''') +'' ''+ Att.LastName) AS AttendeeFullName, 
		
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName,
		
		@EventScheduleId as EventScheduleId,
		
		ISNULL(Attendance.Id,0) AS ID,
		ISNULL(Attendance.IsAttended,0) as IsAttended,
		ISNULL(Attendance.AttendanceTime,'''') as AttendanceTime,
		RIGHT(CONVERT(CHAR(20),AttendanceTime, 0),7) AS AttendanceTimeOnly,
		CASE WHEN AttendanceTime <= @Slot1 THEN ''Slot-1''
			 WHEN AttendanceTime <= @Slot2 THEN ''Slot-2''
			 WHEN AttendanceTime <= @Slot3 THEN ''Slot-3''
			 WHEN AttendanceTime  > @Slot3 THEN ''Slot-4''
		END AS ''Slot'',
		
		CONVERT(VARCHAR(8),@EventDate,101) AS EventShortDate
		
	FROM dbo.Att_Attendee AS Att 
		LEFT JOIN dbo.Att_Attendance AS Attendance ON Attendance.AttendeeId = Att.Id AND Attendance.EventScheduleId = @EventScheduleId 
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE 
		(ISNULL(@Gender, '''') = '''' OR Att.Gender = @Gender)
		AND (ISNULL(@filter, '''') = '''' OR (Att.FirstName LIKE @filter+''%'' OR Att.LastName LIKE @filter+''%''))
	ORDER BY Attendance.IsAttended, Att.FirstName, Att.LastName
END

' 
END
GO
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 02/26/2017 23:19:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EventSchedule_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Att_Event] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule] CHECK CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Att_Attendee_Att_City]    Script Date: 02/26/2017 23:19:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Att_Attendee_Att_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[Att_City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] CHECK CONSTRAINT [FK_Att_Attendee_Att_City]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 02/26/2017 23:19:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Attendee_Zone] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[Att_Zone] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] CHECK CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 02/26/2017 23:19:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Attendee] FOREIGN KEY([AttendeeId])
REFERENCES [dbo].[Att_Attendee] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] CHECK CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 02/26/2017 23:19:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_EventSchedule] FOREIGN KEY([EventScheduleId])
REFERENCES [dbo].[Att_EventSchedule] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] CHECK CONSTRAINT [FK_Attendance_EventSchedule]
GO
