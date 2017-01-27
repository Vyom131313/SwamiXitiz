USE [EventAttendance]
GO
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 01/27/2017 00:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSchedule]'))
ALTER TABLE [dbo].[EventSchedule] DROP CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 01/27/2017 00:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendee]'))
ALTER TABLE [dbo].[Attendee] DROP CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 01/27/2017 00:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 01/27/2017 00:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_EventSchedule]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 01/27/2017 00:09:42 ******/
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
/****** Object:  Table [dbo].[Attendee]    Script Date: 01/27/2017 00:09:42 ******/
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
/****** Object:  Table [dbo].[EventSchedule]    Script Date: 01/27/2017 00:09:42 ******/
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
/****** Object:  Table [dbo].[Zone]    Script Date: 01/27/2017 00:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zone]') AND type in (N'U'))
DROP TABLE [dbo].[Zone]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 01/27/2017 00:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
DROP TABLE [dbo].[Event]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 01/27/2017 00:09:42 ******/
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
/****** Object:  Table [dbo].[Zone]    Script Date: 01/27/2017 00:09:42 ******/
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
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (1, N'South Charlotte')
INSERT [dbo].[Zone] ([Id], [Name]) VALUES (2, N'North Charlotte')
SET IDENTITY_INSERT [dbo].[Zone] OFF
/****** Object:  Table [dbo].[EventSchedule]    Script Date: 01/27/2017 00:09:42 ******/
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
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (1, 1, CAST(0x493C0B00 AS Date), 0)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (2, 1, CAST(0x503C0B00 AS Date), 0)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (3, 1, CAST(0x573C0B00 AS Date), 0)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (4, 1, CAST(0x5E3C0B00 AS Date), 0)
INSERT [dbo].[EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed]) VALUES (5, 1, CAST(0x653C0B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[EventSchedule] OFF
/****** Object:  Table [dbo].[Attendee]    Script Date: 01/27/2017 00:09:42 ******/
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
	[Address] [varchar](500) NULL,
	[ZoneId] [int] NULL,
	[IsKaryakar] [bit] NOT NULL CONSTRAINT [DF_Attendee_IsKaryakar]  DEFAULT ((0)),
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
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Address], [ZoneId], [IsKaryakar]) VALUES (1, N'Hiren', N'Patel', NULL, 1, 1)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Address], [ZoneId], [IsKaryakar]) VALUES (2, N'Sameer', N'Shah', NULL, 1, 1)
INSERT [dbo].[Attendee] ([Id], [FirstName], [LastName], [Address], [ZoneId], [IsKaryakar]) VALUES (3, N'Paresh', N'Sutariya', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Attendee] OFF
/****** Object:  Table [dbo].[Attendance]    Script Date: 01/27/2017 00:09:42 ******/
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
/****** Object:  ForeignKey [FK_EventSchedule_Event]    Script Date: 01/27/2017 00:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSchedule]'))
ALTER TABLE [dbo].[EventSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EventSchedule_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventSchedule]'))
ALTER TABLE [dbo].[EventSchedule] CHECK CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  ForeignKey [FK_Attendee_Zone]    Script Date: 01/27/2017 00:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendee]'))
ALTER TABLE [dbo].[Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Attendee_Zone] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[Zone] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendee]'))
ALTER TABLE [dbo].[Attendee] CHECK CONSTRAINT [FK_Attendee_Zone]
GO
/****** Object:  ForeignKey [FK_Attendance_Attendee]    Script Date: 01/27/2017 00:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Attendee] FOREIGN KEY([AttendeeId])
REFERENCES [dbo].[Attendee] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  ForeignKey [FK_Attendance_EventSchedule]    Script Date: 01/27/2017 00:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_EventSchedule] FOREIGN KEY([EventScheduleId])
REFERENCES [dbo].[EventSchedule] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_EventSchedule]
GO
