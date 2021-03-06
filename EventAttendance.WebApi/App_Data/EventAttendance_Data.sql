USE [XitizNet]
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_SaveAttendee]
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendance]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_SaveAttendance]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetZones]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetZones]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetSevas]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetSevas]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetSevas]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByEventSchedule]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByEventSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetReportByEventSchedule]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByAttendee]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByAttendee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetReportByAttendee]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetCities]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetCities]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeesForActive]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeesForActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendeesForActive]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendees]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendees]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeeById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendeeById]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendancesByEventSchedule]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendancesByEventSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendancesByEventSchedule]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule] DROP CONSTRAINT [FK_EventSchedule_Event]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Attendee_Zone]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] DROP CONSTRAINT [FK_Att_Attendee_Att_City]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_EventSchedule]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] DROP CONSTRAINT [FK_Attendance_Attendee]
GO
/****** Object:  Table [dbo].[Att_Zone]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Zone]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Zone]
GO
/****** Object:  Table [dbo].[Att_Seva]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Seva]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Seva]
GO
/****** Object:  Table [dbo].[Att_EventSchedule]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[Att_EventSchedule]
GO
/****** Object:  Table [dbo].[Att_Event]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Event]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Event]
GO
/****** Object:  Table [dbo].[Att_City]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_City]') AND type in (N'U'))
DROP TABLE [dbo].[Att_City]
GO
/****** Object:  Table [dbo].[Att_AttendeeSeva]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_AttendeeSeva]') AND type in (N'U'))
DROP TABLE [dbo].[Att_AttendeeSeva]
GO
/****** Object:  Table [dbo].[Att_Attendee]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Attendee]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Attendee]
GO
/****** Object:  Table [dbo].[Att_Attendance]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Attendance]') AND type in (N'U'))
DROP TABLE [dbo].[Att_Attendance]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitStringAsTable]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SplitStringAsTable]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[SplitStringAsTable]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSlotsForDate]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSlotsForDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetSlotsForDate]
GO
/****** Object:  UserDefinedFunction [dbo].[Att_GetSevaFullNamesForAttendee]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetSevaFullNamesForAttendee]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Att_GetSevaFullNamesForAttendee]
GO
/****** Object:  UserDefinedFunction [dbo].[Att_GetSevaCodesForAttendee]    Script Date: 4/9/2017 11:19:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetSevaCodesForAttendee]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Att_GetSevaCodesForAttendee]
GO
/****** Object:  UserDefinedFunction [dbo].[Att_GetSevaCodesForAttendee]    Script Date: 4/9/2017 11:19:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetSevaCodesForAttendee]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- SELECT dbo.Att_GetSevaCodesForAttendee(1)
CREATE FUNCTION [dbo].[Att_GetSevaCodesForAttendee] 
(
	@AttendeeId INT
)
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @SevaCodes VARCHAR(8000) 
	SELECT @SevaCodes = COALESCE(@SevaCodes + '','', '''') + 
		ISNULL(Code, ''N/A'')
	FROM dbo.Att_AttendeeSeva as ATS
		INNER JOIN dbo.Att_Seva as S on S.Id = ATS.Sevaid
	WHERE ATS.AttendeeId = @AttendeeId

	RETURN @SevaCodes 
END
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[Att_GetSevaFullNamesForAttendee]    Script Date: 4/9/2017 11:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetSevaFullNamesForAttendee]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- SELECT dbo.Att_GetSevaFullNamesForAttendee(1)
CREATE FUNCTION [dbo].[Att_GetSevaFullNamesForAttendee] 
(
	@AttendeeId INT
)
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @SevaFullNames VARCHAR(8000) 
	SELECT @SevaFullNames = COALESCE(@SevaFullNames + '','', '''') + 
		ISNULL(DepartmentName+'' --> ''+ SevaName, ''N/A'')
	FROM dbo.Att_AttendeeSeva as ATS
		INNER JOIN dbo.Att_Seva as S on S.Id = ATS.Sevaid
	WHERE ATS.AttendeeId = @AttendeeId

	RETURN @SevaFullNames 
END
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetSlotsForDate]    Script Date: 4/9/2017 11:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSlotsForDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- SELECT * FROM [dbo].[GetSlotsForDate](''03/05/2017'')
CREATE FUNCTION [dbo].[GetSlotsForDate](@EventDate DATETIME)
RETURNS @tblSlots TABLE 
(
    Slot1 DATETIME,
    Slot2 DATETIME,
    Slot3 DATETIME,
    Slot4 DATETIME,
    Slot5 DATETIME
)
AS 
BEGIN

   	DECLARE @Slot1 DATETIME = @EventDate, 
   			@Slot2 DATETIME = @EventDate, 
   			@Slot3 DATETIME = @EventDate,
   			@Slot4 DATETIME = @EventDate,
   			@Slot5 DATETIME = @EventDate 
	
	SET @Slot1 = DATEADD(HOUR,	 16, @Slot1)										   -- 4:00PM
	SET @Slot2 = DATEADD(HOUR,	 16, @Slot2); SET @Slot2 = DATEADD(MINUTE, 15, @Slot2) -- 4:15PM
	SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 30, @Slot3) -- 4:30PM
	SET @Slot4 = DATEADD(HOUR,	 17, @Slot4);										   -- 5:00PM
	SET @Slot5 = DATEADD(HOUR,	 17, @Slot5); SET @Slot5 = DATEADD(MINUTE, 30, @Slot5) -- 5:30PM

    INSERT @tblSlots
        SELECT @Slot1, @Slot2, @Slot3, @Slot4, @Slot5;
    RETURN;
END;
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[SplitStringAsTable]    Script Date: 4/9/2017 11:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SplitStringAsTable]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[SplitStringAsTable] 
(
    @inputString varchar(MAX),
    @delimiter char(1) = '',''
)
RETURNS 
@Result TABLE 
(
    Value varchar(MAX)
)
AS
BEGIN
    DECLARE @chIndex int
    DECLARE @item varchar(100)

    -- While there are more delimiters...
    WHILE CHARINDEX(@delimiter, @inputString, 0) <> 0
        BEGIN
            -- Get the index of the first delimiter.
            SET @chIndex = CHARINDEX(@delimiter, @inputString, 0)

            -- Get all of the characters prior to the delimiter and insert the string into the table.
            SELECT @item = SUBSTRING(@inputString, 1, @chIndex - 1)

            IF LEN(@item) > 0
                BEGIN
                    INSERT INTO @Result(Value)
                    VALUES (@item)
                END

            -- Get the remainder of the string.
            SELECT @inputString = SUBSTRING(@inputString, @chIndex + 1, LEN(@inputString))
        END

    -- If there are still characters remaining in the string, insert them into the table.
    IF LEN(@inputString) > 0
        BEGIN
            INSERT INTO @Result(Value)
            VALUES (@inputString)
        END

    RETURN 
END' 
END

GO
/****** Object:  Table [dbo].[Att_Attendance]    Script Date: 4/9/2017 11:19:19 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Att_Attendee]    Script Date: 4/9/2017 11:19:20 PM ******/
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
	[ImsId] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Address] [varchar](500) NULL,
	[Karyakar] [varchar](50) NULL,
	[IsKaryakar] [bit] NOT NULL CONSTRAINT [DF_Attendee_IsKaryakar]  DEFAULT ((0)),
	[CityId] [int] NOT NULL,
	[ZoneId] [int] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Att_Attendee_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Attendee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Att_AttendeeSeva]    Script Date: 4/9/2017 11:19:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_AttendeeSeva]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_AttendeeSeva](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttendeeId] [int] NOT NULL,
	[Sevaid] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Att_AttendeeSeva_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Att_AttendeeSeva] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Att_City]    Script Date: 4/9/2017 11:19:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Att_Event]    Script Date: 4/9/2017 11:19:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Att_EventSchedule]    Script Date: 4/9/2017 11:19:20 PM ******/
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
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Att_Seva]    Script Date: 4/9/2017 11:19:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_Seva]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Att_Seva](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[SevaName] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Att_Seva_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Att_Seva] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Att_Zone]    Script Date: 4/9/2017 11:19:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Att_Attendance] ON 

GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1, 7, 345, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:42:39.500' AS DateTime), CAST(N'2017-02-15 21:42:39.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (2, 7, 156, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:42:47.880' AS DateTime), CAST(N'2017-02-15 21:42:47.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (3, 7, 432, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:42:54.213' AS DateTime), CAST(N'2017-02-15 21:42:54.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (4, 7, 385, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:43:00.747' AS DateTime), CAST(N'2017-02-15 21:43:00.747' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (5, 7, 29, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:43:06.880' AS DateTime), CAST(N'2017-02-15 21:43:06.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (6, 7, 504, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:43:13.247' AS DateTime), CAST(N'2017-02-15 21:43:13.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (7, 7, 196, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:43:31.310' AS DateTime), CAST(N'2017-02-15 21:43:31.310' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (8, 7, 344, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:43:39.507' AS DateTime), CAST(N'2017-02-15 21:43:39.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (9, 7, 125, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:45:23.357' AS DateTime), CAST(N'2017-02-15 21:45:23.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (10, 7, 310, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:45:31.183' AS DateTime), CAST(N'2017-02-15 21:45:31.183' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (11, 7, 423, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:46:08.617' AS DateTime), CAST(N'2017-02-15 21:46:08.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (12, 7, 182, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:46:19.137' AS DateTime), CAST(N'2017-02-15 21:46:19.137' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (13, 7, 38, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:47:37.930' AS DateTime), CAST(N'2017-02-15 21:47:37.930' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (14, 7, 158, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:48:27.470' AS DateTime), CAST(N'2017-02-15 21:48:27.470' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (15, 7, 359, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:48:38.177' AS DateTime), CAST(N'2017-02-15 21:48:38.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (16, 7, 56, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:48:49.783' AS DateTime), CAST(N'2017-02-15 21:48:49.783' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (17, 7, 233, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:51:05.527' AS DateTime), CAST(N'2017-02-15 21:51:05.527' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (18, 7, 216, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:51:25.603' AS DateTime), CAST(N'2017-02-15 21:51:25.603' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (19, 7, 43, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:51:55.577' AS DateTime), CAST(N'2017-02-15 21:51:55.577' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (20, 7, 99, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:52:26.387' AS DateTime), CAST(N'2017-02-15 21:52:26.387' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (21, 7, 540, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:52:53.050' AS DateTime), CAST(N'2017-02-15 21:52:53.050' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (22, 7, 80, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:54:13.717' AS DateTime), CAST(N'2017-02-15 21:54:13.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (23, 7, 273, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:55:34.640' AS DateTime), CAST(N'2017-02-15 21:55:34.640' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (24, 7, 477, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:55:45.937' AS DateTime), CAST(N'2017-02-15 21:55:45.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (25, 7, 221, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:56:43.193' AS DateTime), CAST(N'2017-02-15 21:56:43.193' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (26, 7, 222, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:56:44.423' AS DateTime), CAST(N'2017-02-15 21:56:44.423' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (27, 7, 520, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:56:51.487' AS DateTime), CAST(N'2017-02-15 21:56:51.487' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (28, 7, 455, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:57:01.480' AS DateTime), CAST(N'2017-02-15 21:57:01.480' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (29, 7, 133, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:57:15.187' AS DateTime), CAST(N'2017-02-15 21:57:15.187' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (30, 7, 176, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:57:53.793' AS DateTime), CAST(N'2017-02-15 21:57:53.793' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (31, 7, 237, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:58:10.203' AS DateTime), CAST(N'2017-02-15 21:58:10.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (32, 7, 103, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:59:00.747' AS DateTime), CAST(N'2017-02-15 21:59:00.747' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (33, 7, 35, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:59:39.097' AS DateTime), CAST(N'2017-02-15 21:59:39.097' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (34, 7, 36, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 21:59:41.390' AS DateTime), CAST(N'2017-02-15 21:59:41.390' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (35, 7, 206, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:00:18.827' AS DateTime), CAST(N'2017-02-15 22:00:18.827' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (36, 7, 197, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:00:38.450' AS DateTime), CAST(N'2017-02-15 22:00:38.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (37, 7, 535, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:00:56.990' AS DateTime), CAST(N'2017-02-15 22:00:56.990' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (38, 7, 342, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:01:06.497' AS DateTime), CAST(N'2017-02-15 22:01:06.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (39, 7, 439, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:01:18.337' AS DateTime), CAST(N'2017-02-15 22:01:18.337' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (40, 7, 334, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:01:56.923' AS DateTime), CAST(N'2017-02-15 22:01:56.923' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (41, 7, 205, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:02:18.347' AS DateTime), CAST(N'2017-02-15 22:02:18.347' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (42, 7, 115, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:02:39.777' AS DateTime), CAST(N'2017-02-15 22:02:39.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (43, 7, 123, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:03:20.863' AS DateTime), CAST(N'2017-02-15 22:03:20.863' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (44, 7, 121, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:03:22.157' AS DateTime), CAST(N'2017-02-15 22:03:22.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (45, 7, 305, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:04:15.073' AS DateTime), CAST(N'2017-02-15 22:04:15.073' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (46, 7, 502, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:05:25.877' AS DateTime), CAST(N'2017-02-15 22:05:25.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (47, 7, 277, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:05:57.553' AS DateTime), CAST(N'2017-02-15 22:05:57.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (48, 7, 144, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:06:16.110' AS DateTime), CAST(N'2017-02-15 22:06:16.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (49, 7, 301, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:06:26.690' AS DateTime), CAST(N'2017-02-15 22:06:26.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (50, 7, 319, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:06:38.537' AS DateTime), CAST(N'2017-02-15 22:06:38.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (51, 7, 424, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:07:13.287' AS DateTime), CAST(N'2017-02-15 22:07:13.287' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (52, 7, 77, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:08:21.963' AS DateTime), CAST(N'2017-02-15 22:08:21.963' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (53, 7, 4, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:09:48.897' AS DateTime), CAST(N'2017-02-15 22:09:48.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (54, 7, 280, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:10:20.003' AS DateTime), CAST(N'2017-02-15 22:10:20.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (55, 7, 282, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:10:21.613' AS DateTime), CAST(N'2017-02-15 22:10:21.613' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (56, 7, 135, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:10:39.927' AS DateTime), CAST(N'2017-02-15 22:10:39.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (57, 7, 353, 1, CAST(N'2017-02-10 16:35:00.000' AS DateTime), CAST(N'2017-02-15 22:12:11.973' AS DateTime), CAST(N'2017-02-15 22:12:11.973' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (58, 7, 30, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:14:20.237' AS DateTime), CAST(N'2017-02-15 22:14:20.237' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (59, 7, 70, 1, CAST(N'2017-02-10 17:55:00.000' AS DateTime), CAST(N'2017-02-15 22:14:33.637' AS DateTime), CAST(N'2017-02-15 22:14:33.637' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (60, 7, 360, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:15:08.203' AS DateTime), CAST(N'2017-02-15 22:15:08.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (61, 7, 433, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:15:19.040' AS DateTime), CAST(N'2017-02-15 22:15:19.040' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (62, 7, 55, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:15:44.300' AS DateTime), CAST(N'2017-02-15 22:15:44.300' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (63, 7, 183, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:16:13.203' AS DateTime), CAST(N'2017-02-15 22:16:13.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (64, 7, 66, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:16:30.600' AS DateTime), CAST(N'2017-02-15 22:16:30.600' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (65, 7, 486, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:16:44.367' AS DateTime), CAST(N'2017-02-15 22:16:44.367' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (66, 7, 307, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:17:37.633' AS DateTime), CAST(N'2017-02-15 22:17:37.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (67, 7, 539, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:18:30.263' AS DateTime), CAST(N'2017-02-15 22:18:30.263' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (68, 7, 51, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:18:59.943' AS DateTime), CAST(N'2017-02-15 22:18:59.943' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (69, 7, 268, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:19:25.800' AS DateTime), CAST(N'2017-02-15 22:19:25.800' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (70, 7, 271, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:20:53.353' AS DateTime), CAST(N'2017-02-15 22:20:53.353' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (71, 7, 361, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:21:07.787' AS DateTime), CAST(N'2017-02-15 22:21:07.787' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (72, 7, 327, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:21:58.340' AS DateTime), CAST(N'2017-02-15 22:21:58.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (73, 7, 241, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:22:04.570' AS DateTime), CAST(N'2017-02-15 22:22:04.570' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (74, 7, 84, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:22:16.897' AS DateTime), CAST(N'2017-02-15 22:22:16.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (75, 7, 212, 1, CAST(N'2017-02-10 16:05:00.000' AS DateTime), CAST(N'2017-02-15 22:22:34.510' AS DateTime), CAST(N'2017-02-15 22:22:34.510' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (76, 8, 197, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:54:57.873' AS DateTime), CAST(N'2017-02-16 20:54:57.873' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (77, 8, 279, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:55:09.407' AS DateTime), CAST(N'2017-02-16 20:55:09.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (78, 8, 390, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:55:37.367' AS DateTime), CAST(N'2017-02-16 20:55:37.367' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (79, 8, 455, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:55:47.710' AS DateTime), CAST(N'2017-02-16 20:55:47.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (80, 8, 282, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:56:04.123' AS DateTime), CAST(N'2017-02-16 20:56:04.123' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (81, 8, 280, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:56:04.840' AS DateTime), CAST(N'2017-02-16 20:56:04.840' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (82, 8, 495, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:56:31.467' AS DateTime), CAST(N'2017-02-16 20:56:31.467' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (83, 8, 520, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:56:37.233' AS DateTime), CAST(N'2017-02-16 20:56:37.233' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (84, 8, 237, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:56:53.643' AS DateTime), CAST(N'2017-02-16 20:56:53.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (85, 8, 125, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:57:17.463' AS DateTime), CAST(N'2017-02-16 20:57:17.463' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (86, 8, 439, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:57:31.213' AS DateTime), CAST(N'2017-02-16 20:57:31.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (87, 8, 36, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:57:45.317' AS DateTime), CAST(N'2017-02-16 20:57:45.317' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (88, 8, 504, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:57:51.653' AS DateTime), CAST(N'2017-02-16 20:57:51.653' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (89, 8, 385, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:57:56.747' AS DateTime), CAST(N'2017-02-16 20:57:56.747' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (90, 8, 168, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:58:24.067' AS DateTime), CAST(N'2017-02-16 20:58:24.067' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (91, 8, 344, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:58:32.407' AS DateTime), CAST(N'2017-02-16 20:58:32.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (92, 8, 345, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 20:58:33.937' AS DateTime), CAST(N'2017-02-16 20:58:33.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (93, 8, 11, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:58:48.623' AS DateTime), CAST(N'2017-02-16 20:58:48.623' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (94, 8, 432, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 20:59:18.427' AS DateTime), CAST(N'2017-02-16 20:59:18.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (95, 8, 144, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:00:29.570' AS DateTime), CAST(N'2017-02-16 21:00:29.570' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (96, 8, 326, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:00:42.357' AS DateTime), CAST(N'2017-02-16 21:00:42.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (97, 8, 354, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:01:02.607' AS DateTime), CAST(N'2017-02-16 21:01:02.607' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (98, 8, 319, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:01:23.597' AS DateTime), CAST(N'2017-02-16 21:01:23.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (99, 8, 94, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:02:09.067' AS DateTime), CAST(N'2017-02-16 21:02:09.067' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (100, 8, 437, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:02:38.560' AS DateTime), CAST(N'2017-02-16 21:02:38.560' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (101, 8, 287, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:03:05.157' AS DateTime), CAST(N'2017-02-16 21:03:05.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (102, 8, 200, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:04:07.977' AS DateTime), CAST(N'2017-02-16 21:04:07.977' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (103, 8, 422, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:06:22.733' AS DateTime), CAST(N'2017-02-16 21:06:22.733' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (104, 8, 244, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:07:48.593' AS DateTime), CAST(N'2017-02-16 21:07:48.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (105, 8, 380, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:08:32.760' AS DateTime), CAST(N'2017-02-16 21:08:32.760' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (106, 8, 480, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:08:40.477' AS DateTime), CAST(N'2017-02-16 21:08:40.477' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (107, 8, 407, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:08:53.850' AS DateTime), CAST(N'2017-02-16 21:08:53.850' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (108, 8, 481, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:09:10.533' AS DateTime), CAST(N'2017-02-16 21:09:10.533' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (109, 8, 213, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:09:44.497' AS DateTime), CAST(N'2017-02-16 21:09:44.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (110, 8, 399, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:10:48.547' AS DateTime), CAST(N'2017-02-16 21:10:48.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (111, 8, 519, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:11:59.717' AS DateTime), CAST(N'2017-02-16 21:11:59.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (112, 8, 219, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:12:36.977' AS DateTime), CAST(N'2017-02-16 21:12:36.977' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (113, 8, 278, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:12:45.277' AS DateTime), CAST(N'2017-02-16 21:12:45.277' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (114, 8, 438, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:13:05.077' AS DateTime), CAST(N'2017-02-16 21:13:05.077' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (115, 8, 205, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:13:35.457' AS DateTime), CAST(N'2017-02-16 21:13:35.457' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (116, 8, 446, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:14:05.597' AS DateTime), CAST(N'2017-02-16 21:14:05.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (117, 8, 48, 1, CAST(N'2016-11-27 16:35:00.000' AS DateTime), CAST(N'2017-02-16 21:15:09.393' AS DateTime), CAST(N'2017-02-16 21:15:09.393' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (118, 8, 359, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:15:46.690' AS DateTime), CAST(N'2017-02-16 21:15:46.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (119, 8, 22, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:17:37.357' AS DateTime), CAST(N'2017-02-16 21:17:37.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (120, 8, 236, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:17:45.377' AS DateTime), CAST(N'2017-02-16 21:17:45.377' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (121, 8, 305, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:18:34.270' AS DateTime), CAST(N'2017-02-16 21:18:34.270' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (122, 8, 273, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:18:45.973' AS DateTime), CAST(N'2017-02-16 21:18:45.973' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (123, 8, 222, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:19:27.047' AS DateTime), CAST(N'2017-02-16 21:19:27.047' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (124, 8, 56, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:19:37.887' AS DateTime), CAST(N'2017-02-16 21:19:37.887' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (125, 8, 85, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:20:21.100' AS DateTime), CAST(N'2017-02-16 21:20:21.100' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (126, 8, 80, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:20:32.623' AS DateTime), CAST(N'2017-02-16 21:20:32.623' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (127, 8, 299, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:20:39.427' AS DateTime), CAST(N'2017-02-16 21:20:39.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (128, 8, 196, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:20:47.870' AS DateTime), CAST(N'2017-02-16 21:20:47.870' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (129, 8, 308, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:21:50.043' AS DateTime), CAST(N'2017-02-16 21:21:50.043' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (130, 8, 180, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:22:11.530' AS DateTime), CAST(N'2017-02-16 21:22:11.530' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (131, 8, 82, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:22:30.890' AS DateTime), CAST(N'2017-02-16 21:22:30.890' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (132, 8, 102, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:22:40.767' AS DateTime), CAST(N'2017-02-16 21:22:40.767' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (133, 8, 424, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:22:54.680' AS DateTime), CAST(N'2017-02-16 21:22:54.680' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (134, 8, 433, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:23:10.857' AS DateTime), CAST(N'2017-02-16 21:23:10.857' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (135, 8, 181, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:29:12.170' AS DateTime), CAST(N'2017-02-16 21:29:12.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (136, 8, 66, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:30:18.213' AS DateTime), CAST(N'2017-02-16 21:30:18.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (137, 8, 365, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:31:24.507' AS DateTime), CAST(N'2017-02-16 21:31:24.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (138, 8, 477, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:31:35.413' AS DateTime), CAST(N'2017-02-16 21:31:35.413' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (139, 8, 335, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:32:23.057' AS DateTime), CAST(N'2017-02-16 21:32:23.057' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (140, 8, 271, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:32:37.367' AS DateTime), CAST(N'2017-02-16 21:32:37.367' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (141, 8, 122, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:33:41.160' AS DateTime), CAST(N'2017-02-16 21:33:41.160' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (142, 8, 158, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:33:58.617' AS DateTime), CAST(N'2017-02-16 21:33:58.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (143, 8, 121, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:34:23.067' AS DateTime), CAST(N'2017-02-16 21:34:23.067' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (144, 8, 123, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:34:23.937' AS DateTime), CAST(N'2017-02-16 21:34:23.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (145, 8, 136, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:34:35.710' AS DateTime), CAST(N'2017-02-16 21:34:35.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (146, 8, 35, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:34:42.740' AS DateTime), CAST(N'2017-02-16 21:34:42.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (147, 8, 99, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:34:59.817' AS DateTime), CAST(N'2017-02-16 21:34:59.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (148, 8, 268, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:35:14.437' AS DateTime), CAST(N'2017-02-16 21:35:14.437' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (149, 8, 182, 1, CAST(N'2016-11-27 16:05:00.000' AS DateTime), CAST(N'2017-02-16 21:35:23.450' AS DateTime), CAST(N'2017-02-16 21:35:23.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (150, 9, 144, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:11:55.477' AS DateTime), CAST(N'2017-02-17 16:11:55.477' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (151, 9, 66, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:12:05.530' AS DateTime), CAST(N'2017-02-17 16:12:05.530' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (152, 9, 180, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:12:22.667' AS DateTime), CAST(N'2017-02-17 16:12:22.667' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (153, 9, 99, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:14:08.683' AS DateTime), CAST(N'2017-02-17 16:14:08.683' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (154, 9, 334, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:14:43.623' AS DateTime), CAST(N'2017-02-17 16:14:43.623' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (155, 9, 172, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:15:08.597' AS DateTime), CAST(N'2017-02-17 16:15:08.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (156, 9, 271, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:15:37.367' AS DateTime), CAST(N'2017-02-17 16:15:37.367' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (157, 9, 345, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:16:14.563' AS DateTime), CAST(N'2017-02-17 16:16:14.563' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (158, 9, 309, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:16:42.080' AS DateTime), CAST(N'2017-02-17 16:16:42.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (159, 9, 477, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:17:19.377' AS DateTime), CAST(N'2017-02-17 16:17:19.377' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (160, 9, 540, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:17:36.967' AS DateTime), CAST(N'2017-02-17 16:17:36.967' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (161, 9, 55, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:17:45.113' AS DateTime), CAST(N'2017-02-17 16:17:45.113' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (162, 9, 22, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:17:56.013' AS DateTime), CAST(N'2017-02-17 16:17:56.013' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (163, 9, 115, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:18:05.370' AS DateTime), CAST(N'2017-02-17 16:18:05.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (164, 9, 38, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:18:26.093' AS DateTime), CAST(N'2017-02-17 16:18:26.093' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (165, 9, 182, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:18:41.853' AS DateTime), CAST(N'2017-02-17 16:18:41.853' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (166, 9, 168, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:19:49.453' AS DateTime), CAST(N'2017-02-17 16:19:49.453' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (167, 9, 56, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:20:08.443' AS DateTime), CAST(N'2017-02-17 16:20:08.443' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (168, 9, 150, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:20:36.470' AS DateTime), CAST(N'2017-02-17 16:20:36.470' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (169, 9, 80, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:21:22.780' AS DateTime), CAST(N'2017-02-17 16:21:22.780' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (170, 9, 85, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:21:31.653' AS DateTime), CAST(N'2017-02-17 16:21:31.653' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (171, 9, 335, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:23:02.257' AS DateTime), CAST(N'2017-02-17 16:23:02.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (172, 9, 181, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:27:08.717' AS DateTime), CAST(N'2017-02-17 16:27:08.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (173, 9, 308, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:27:40.577' AS DateTime), CAST(N'2017-02-17 16:27:40.577' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (174, 9, 486, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:27:54.610' AS DateTime), CAST(N'2017-02-17 16:27:54.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (175, 9, 424, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:28:04.953' AS DateTime), CAST(N'2017-02-17 16:28:04.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (176, 9, 102, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:28:34.837' AS DateTime), CAST(N'2017-02-17 16:28:34.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (177, 9, 344, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:28:54.600' AS DateTime), CAST(N'2017-02-17 16:28:54.600' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (178, 9, 273, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:29:07.517' AS DateTime), CAST(N'2017-02-17 16:29:07.517' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (179, 9, 305, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:29:18.407' AS DateTime), CAST(N'2017-02-17 16:29:18.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (180, 9, 432, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:29:25.853' AS DateTime), CAST(N'2017-02-17 16:29:25.853' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (181, 9, 6, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:29:56.723' AS DateTime), CAST(N'2017-02-17 16:29:56.723' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (182, 9, 196, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:30:20.640' AS DateTime), CAST(N'2017-02-17 16:30:20.640' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (183, 9, 70, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:31:13.313' AS DateTime), CAST(N'2017-02-17 16:31:13.313' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (184, 9, 237, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:31:44.267' AS DateTime), CAST(N'2017-02-17 16:31:44.267' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (185, 9, 133, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:32:18.967' AS DateTime), CAST(N'2017-02-17 16:32:18.967' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (186, 9, 504, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:32:57.553' AS DateTime), CAST(N'2017-02-17 16:32:57.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (187, 9, 433, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:33:12.743' AS DateTime), CAST(N'2017-02-17 16:33:12.743' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (188, 9, 539, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:33:29.580' AS DateTime), CAST(N'2017-02-17 16:33:29.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (189, 9, 17, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:33:39.210' AS DateTime), CAST(N'2017-02-17 16:33:39.210' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (190, 9, 125, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:33:50.947' AS DateTime), CAST(N'2017-02-17 16:33:50.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (191, 9, 156, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:34:01.610' AS DateTime), CAST(N'2017-02-17 16:34:01.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (192, 9, 188, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:34:26.143' AS DateTime), CAST(N'2017-02-17 16:34:26.143' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (193, 9, 59, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:35:34.297' AS DateTime), CAST(N'2017-02-17 16:35:34.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (194, 9, 532, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:36:42.617' AS DateTime), CAST(N'2017-02-17 16:36:42.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (195, 9, 164, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:41:12.270' AS DateTime), CAST(N'2017-02-17 16:41:12.270' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (196, 9, 288, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:42:26.427' AS DateTime), CAST(N'2017-02-17 16:42:26.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (197, 9, 105, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:55:03.840' AS DateTime), CAST(N'2017-02-17 16:55:03.840' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (198, 9, 106, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:55:09.720' AS DateTime), CAST(N'2017-02-17 16:55:09.720' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (199, 9, 260, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:55:25.257' AS DateTime), CAST(N'2017-02-17 16:55:25.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (200, 9, 203, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:55:39.857' AS DateTime), CAST(N'2017-02-17 16:55:39.857' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (201, 9, 321, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:56:22.147' AS DateTime), CAST(N'2017-02-17 16:56:22.147' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (202, 9, 187, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:56:40.177' AS DateTime), CAST(N'2017-02-17 16:56:40.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (203, 9, 474, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:56:52.523' AS DateTime), CAST(N'2017-02-17 16:56:52.523' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (204, 9, 253, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:57:19.877' AS DateTime), CAST(N'2017-02-17 16:57:19.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (205, 9, 459, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:57:46.187' AS DateTime), CAST(N'2017-02-17 16:57:46.187' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (206, 9, 461, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:57:48.037' AS DateTime), CAST(N'2017-02-17 16:57:48.037' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (207, 9, 460, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:57:51.657' AS DateTime), CAST(N'2017-02-17 16:57:51.657' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (208, 9, 228, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:58:04.783' AS DateTime), CAST(N'2017-02-17 16:58:04.783' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (209, 9, 295, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:58:17.973' AS DateTime), CAST(N'2017-02-17 16:58:17.973' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (210, 9, 494, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:58:27.153' AS DateTime), CAST(N'2017-02-17 16:58:27.153' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (211, 9, 101, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:59:09.243' AS DateTime), CAST(N'2017-02-17 16:59:09.243' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (212, 9, 420, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:59:44.520' AS DateTime), CAST(N'2017-02-17 16:59:44.520' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (213, 9, 209, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 16:59:58.293' AS DateTime), CAST(N'2017-02-17 16:59:58.293' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (214, 9, 151, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:00:16.383' AS DateTime), CAST(N'2017-02-17 17:00:16.383' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (215, 9, 500, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:00:36.623' AS DateTime), CAST(N'2017-02-17 17:00:36.623' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (216, 9, 296, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:01:14.980' AS DateTime), CAST(N'2017-02-17 17:01:14.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (217, 9, 177, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:02:14.447' AS DateTime), CAST(N'2017-02-17 17:02:14.447' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (218, 9, 454, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:02:59.460' AS DateTime), CAST(N'2017-02-17 17:02:59.460' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (219, 9, 394, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:03:06.720' AS DateTime), CAST(N'2017-02-17 17:03:06.720' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (220, 9, 250, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:03:38.717' AS DateTime), CAST(N'2017-02-17 17:03:38.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (221, 9, 157, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:03:57.120' AS DateTime), CAST(N'2017-02-17 17:03:57.120' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (222, 9, 521, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:04:02.487' AS DateTime), CAST(N'2017-02-17 17:04:02.487' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (223, 9, 286, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:04:15.927' AS DateTime), CAST(N'2017-02-17 17:04:15.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (224, 9, 287, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:04:17.247' AS DateTime), CAST(N'2017-02-17 17:04:17.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (225, 9, 442, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:04:23.880' AS DateTime), CAST(N'2017-02-17 17:04:23.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (226, 9, 443, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:04:25.357' AS DateTime), CAST(N'2017-02-17 17:04:25.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (227, 9, 264, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:05:00.720' AS DateTime), CAST(N'2017-02-17 17:05:00.720' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (228, 9, 266, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:05:02.107' AS DateTime), CAST(N'2017-02-17 17:05:02.107' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (229, 9, 513, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:05:14.257' AS DateTime), CAST(N'2017-02-17 17:05:14.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (230, 9, 32, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:05:27.127' AS DateTime), CAST(N'2017-02-17 17:05:27.127' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (231, 9, 485, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:05:51.633' AS DateTime), CAST(N'2017-02-17 17:05:51.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (232, 9, 437, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:06:12.800' AS DateTime), CAST(N'2017-02-17 17:06:12.800' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (233, 9, 167, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:06:23.063' AS DateTime), CAST(N'2017-02-17 17:06:23.063' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (234, 9, 395, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:07:00.017' AS DateTime), CAST(N'2017-02-17 17:07:00.017' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (235, 9, 396, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:07:01.050' AS DateTime), CAST(N'2017-02-17 17:07:01.050' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (236, 9, 127, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:07:31.310' AS DateTime), CAST(N'2017-02-17 17:07:31.310' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (237, 9, 128, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:07:32.777' AS DateTime), CAST(N'2017-02-17 17:07:32.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (238, 9, 120, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:07:50.310' AS DateTime), CAST(N'2017-02-17 17:07:50.310' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (239, 9, 119, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:07:51.183' AS DateTime), CAST(N'2017-02-17 17:07:51.183' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (240, 9, 509, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:08:33.430' AS DateTime), CAST(N'2017-02-17 17:08:33.430' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (241, 9, 514, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:08:49.117' AS DateTime), CAST(N'2017-02-17 17:08:49.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (242, 9, 207, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:09:09.747' AS DateTime), CAST(N'2017-02-17 17:09:09.747' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (243, 9, 64, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:09:18.140' AS DateTime), CAST(N'2017-02-17 17:09:18.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (244, 9, 278, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:09:24.413' AS DateTime), CAST(N'2017-02-17 17:09:24.413' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (245, 9, 378, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:09:30.503' AS DateTime), CAST(N'2017-02-17 17:09:30.503' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (246, 9, 302, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:09:44.970' AS DateTime), CAST(N'2017-02-17 17:09:44.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (247, 9, 303, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:09:46.267' AS DateTime), CAST(N'2017-02-17 17:09:46.267' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (248, 9, 26, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:10:01.283' AS DateTime), CAST(N'2017-02-17 17:10:01.283' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (249, 9, 293, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:10:11.907' AS DateTime), CAST(N'2017-02-17 17:10:11.907' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (250, 9, 189, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:10:32.857' AS DateTime), CAST(N'2017-02-17 17:10:32.857' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (251, 9, 15, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:10:51.307' AS DateTime), CAST(N'2017-02-17 17:10:51.307' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (252, 9, 16, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:10:52.573' AS DateTime), CAST(N'2017-02-17 17:10:52.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (253, 9, 408, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:11:07.610' AS DateTime), CAST(N'2017-02-17 17:11:07.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (254, 9, 519, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:11:16.930' AS DateTime), CAST(N'2017-02-17 17:11:16.930' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (255, 9, 65, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:11:35.860' AS DateTime), CAST(N'2017-02-17 17:11:35.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (256, 9, 204, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:11:57.263' AS DateTime), CAST(N'2017-02-17 17:11:57.263' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (257, 9, 285, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:12:13.817' AS DateTime), CAST(N'2017-02-17 17:12:13.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (258, 9, 139, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:13:06.363' AS DateTime), CAST(N'2017-02-17 17:13:06.363' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (259, 9, 329, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:13:11.797' AS DateTime), CAST(N'2017-02-17 17:13:11.797' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (260, 9, 505, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:13:41.963' AS DateTime), CAST(N'2017-02-17 17:13:41.963' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (261, 9, 506, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:13:44.340' AS DateTime), CAST(N'2017-02-17 17:13:44.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (262, 9, 507, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:13:45.920' AS DateTime), CAST(N'2017-02-17 17:13:45.920' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (263, 9, 350, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:14:07.687' AS DateTime), CAST(N'2017-02-17 17:14:07.687' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (264, 9, 75, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:14:32.530' AS DateTime), CAST(N'2017-02-17 17:14:32.530' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (265, 9, 523, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:14:43.860' AS DateTime), CAST(N'2017-02-17 17:14:43.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (266, 9, 451, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:14:52.717' AS DateTime), CAST(N'2017-02-17 17:14:52.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (267, 9, 452, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:14:53.880' AS DateTime), CAST(N'2017-02-17 17:14:53.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (268, 9, 50, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:15:00.763' AS DateTime), CAST(N'2017-02-17 17:15:00.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (269, 9, 53, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:15:36.437' AS DateTime), CAST(N'2017-02-17 17:15:36.437' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (270, 9, 257, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:16:03.123' AS DateTime), CAST(N'2017-02-17 17:16:03.123' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (271, 9, 259, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:16:30.897' AS DateTime), CAST(N'2017-02-17 17:16:30.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (272, 9, 219, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:17:43.423' AS DateTime), CAST(N'2017-02-17 17:17:43.423' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (273, 9, 142, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:18:09.787' AS DateTime), CAST(N'2017-02-17 17:18:09.787' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (274, 9, 390, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:18:54.400' AS DateTime), CAST(N'2017-02-17 17:18:54.400' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (275, 9, 353, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:19:05.743' AS DateTime), CAST(N'2017-02-17 17:19:05.743' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (276, 9, 487, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:44:38.943' AS DateTime), CAST(N'2017-02-17 17:44:38.943' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (277, 9, 197, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:44:52.417' AS DateTime), CAST(N'2017-02-17 17:44:52.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (278, 9, 185, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:45:13.393' AS DateTime), CAST(N'2017-02-17 17:45:13.393' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (279, 9, 4, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:45:24.127' AS DateTime), CAST(N'2017-02-17 17:45:24.127' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (280, 9, 283, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:45:31.413' AS DateTime), CAST(N'2017-02-17 17:45:31.413' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (281, 9, 123, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:45:52.277' AS DateTime), CAST(N'2017-02-17 17:45:52.277' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (282, 9, 121, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:45:53.347' AS DateTime), CAST(N'2017-02-17 17:45:53.347' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (283, 9, 103, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:46:08.423' AS DateTime), CAST(N'2017-02-17 17:46:08.423' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (284, 9, 186, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:46:58.760' AS DateTime), CAST(N'2017-02-17 17:46:58.760' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (285, 9, 385, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:47:07.817' AS DateTime), CAST(N'2017-02-17 17:47:07.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (286, 9, 36, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:47:19.070' AS DateTime), CAST(N'2017-02-17 17:47:19.070' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (287, 9, 77, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:47:30.800' AS DateTime), CAST(N'2017-02-17 17:47:30.800' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (288, 9, 330, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:47:41.687' AS DateTime), CAST(N'2017-02-17 17:47:41.687' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (289, 9, 361, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:47:49.560' AS DateTime), CAST(N'2017-02-17 17:47:49.560' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (290, 9, 520, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:48:29.320' AS DateTime), CAST(N'2017-02-17 17:48:29.320' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (291, 9, 439, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:48:42.577' AS DateTime), CAST(N'2017-02-17 17:48:42.577' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (292, 9, 319, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:48:56.960' AS DateTime), CAST(N'2017-02-17 17:48:56.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (293, 9, 158, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:49:22.180' AS DateTime), CAST(N'2017-02-17 17:49:22.180' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (294, 9, 328, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:49:59.740' AS DateTime), CAST(N'2017-02-17 17:49:59.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (295, 9, 307, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:50:31.987' AS DateTime), CAST(N'2017-02-17 17:50:31.987' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (296, 9, 135, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:50:46.957' AS DateTime), CAST(N'2017-02-17 17:50:46.957' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (297, 9, 423, 1, CAST(N'2016-11-20 16:05:00.000' AS DateTime), CAST(N'2017-02-17 17:50:54.250' AS DateTime), CAST(N'2017-02-17 17:50:54.250' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (298, 10, 107, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:30:00.683' AS DateTime), CAST(N'2017-02-18 11:30:00.683' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (299, 10, 278, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:30:05.397' AS DateTime), CAST(N'2017-02-18 11:30:05.397' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (300, 10, 64, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:30:12.353' AS DateTime), CAST(N'2017-02-18 11:30:12.353' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (301, 10, 200, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:30:25.753' AS DateTime), CAST(N'2017-02-18 11:30:25.753' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (302, 10, 341, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:30:42.867' AS DateTime), CAST(N'2017-02-18 11:30:42.867' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (303, 10, 87, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:30:50.177' AS DateTime), CAST(N'2017-02-18 11:30:50.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (304, 10, 505, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:31:05.913' AS DateTime), CAST(N'2017-02-18 11:31:05.913' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (305, 10, 454, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:31:30.297' AS DateTime), CAST(N'2017-02-18 11:31:30.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (306, 10, 378, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:32:04.487' AS DateTime), CAST(N'2017-02-18 11:32:04.487' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (307, 10, 286, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:32:17.993' AS DateTime), CAST(N'2017-02-18 11:32:17.993' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (308, 10, 287, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:32:19.170' AS DateTime), CAST(N'2017-02-18 11:32:19.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (309, 10, 188, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:32:40.730' AS DateTime), CAST(N'2017-02-18 11:32:40.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (310, 10, 506, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:32:50.457' AS DateTime), CAST(N'2017-02-18 11:32:50.457' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (311, 10, 337, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:33:12.667' AS DateTime), CAST(N'2017-02-18 11:33:12.667' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (312, 10, 251, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:33:45.403' AS DateTime), CAST(N'2017-02-18 11:33:45.403' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (313, 10, 407, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:33:55.837' AS DateTime), CAST(N'2017-02-18 11:33:55.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (314, 10, 127, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:34:07.987' AS DateTime), CAST(N'2017-02-18 11:34:07.987' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (315, 10, 128, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:34:09.143' AS DateTime), CAST(N'2017-02-18 11:34:09.143' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (316, 10, 408, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:34:22.643' AS DateTime), CAST(N'2017-02-18 11:34:22.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (317, 10, 380, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:34:31.760' AS DateTime), CAST(N'2017-02-18 11:34:31.760' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (318, 10, 15, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:34:51.760' AS DateTime), CAST(N'2017-02-18 11:34:51.760' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (319, 10, 295, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:35:03.273' AS DateTime), CAST(N'2017-02-18 11:35:03.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (320, 10, 163, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:35:34.050' AS DateTime), CAST(N'2017-02-18 11:35:34.050' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (321, 10, 394, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:35:54.880' AS DateTime), CAST(N'2017-02-18 11:35:54.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (322, 10, 316, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:36:03.147' AS DateTime), CAST(N'2017-02-18 11:36:03.147' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (323, 10, 321, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:36:10.087' AS DateTime), CAST(N'2017-02-18 11:36:10.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (324, 10, 487, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:37:18.557' AS DateTime), CAST(N'2017-02-18 11:37:18.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (325, 10, 158, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:37:46.123' AS DateTime), CAST(N'2017-02-18 11:37:46.123' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (326, 10, 455, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:38:05.803' AS DateTime), CAST(N'2017-02-18 11:38:05.803' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (327, 10, 354, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:39:44.210' AS DateTime), CAST(N'2017-02-18 11:39:44.210' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (328, 10, 35, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:39:49.677' AS DateTime), CAST(N'2017-02-18 11:39:49.677' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (329, 10, 108, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:40:43.257' AS DateTime), CAST(N'2017-02-18 11:40:43.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (330, 10, 55, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:41:41.140' AS DateTime), CAST(N'2017-02-18 11:41:41.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (331, 10, 363, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:41:51.450' AS DateTime), CAST(N'2017-02-18 11:41:51.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (332, 10, 365, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:41:52.470' AS DateTime), CAST(N'2017-02-18 11:41:52.470' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (333, 10, 212, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:42:32.360' AS DateTime), CAST(N'2017-02-18 11:42:32.360' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (334, 10, 31, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:42:38.890' AS DateTime), CAST(N'2017-02-18 11:42:38.890' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (335, 10, 345, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:42:42.897' AS DateTime), CAST(N'2017-02-18 11:42:42.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (336, 10, 319, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:43:12.450' AS DateTime), CAST(N'2017-02-18 11:43:12.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (337, 10, 205, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:43:22.243' AS DateTime), CAST(N'2017-02-18 11:43:22.243' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (338, 10, 117, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:43:45.387' AS DateTime), CAST(N'2017-02-18 11:43:45.387' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (339, 10, 301, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:43:51.580' AS DateTime), CAST(N'2017-02-18 11:43:51.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (340, 10, 433, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:44:03.737' AS DateTime), CAST(N'2017-02-18 11:44:03.737' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (341, 10, 271, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:44:52.287' AS DateTime), CAST(N'2017-02-18 11:44:52.287' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (342, 10, 66, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:45:30.253' AS DateTime), CAST(N'2017-02-18 11:45:30.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (343, 10, 309, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:45:43.400' AS DateTime), CAST(N'2017-02-18 11:45:43.400' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (344, 10, 160, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:46:41.660' AS DateTime), CAST(N'2017-02-18 11:46:41.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (345, 10, 162, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:46:42.727' AS DateTime), CAST(N'2017-02-18 11:46:42.727' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (346, 10, 115, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:46:51.873' AS DateTime), CAST(N'2017-02-18 11:46:51.873' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (347, 10, 179, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:46:59.840' AS DateTime), CAST(N'2017-02-18 11:46:59.840' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (348, 10, 180, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:47:01.307' AS DateTime), CAST(N'2017-02-18 11:47:01.307' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (349, 10, 83, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:47:09.257' AS DateTime), CAST(N'2017-02-18 11:47:09.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (350, 10, 172, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:47:15.637' AS DateTime), CAST(N'2017-02-18 11:47:15.637' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (351, 10, 121, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:47:49.550' AS DateTime), CAST(N'2017-02-18 11:47:49.550' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (352, 10, 122, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:47:50.807' AS DateTime), CAST(N'2017-02-18 11:47:50.807' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (353, 10, 268, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:48:02.660' AS DateTime), CAST(N'2017-02-18 11:48:02.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (354, 10, 181, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:48:15.203' AS DateTime), CAST(N'2017-02-18 11:48:15.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (355, 10, 183, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:48:16.963' AS DateTime), CAST(N'2017-02-18 11:48:16.963' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (356, 10, 424, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:48:42.390' AS DateTime), CAST(N'2017-02-18 11:48:42.390' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (357, 10, 48, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:48:51.303' AS DateTime), CAST(N'2017-02-18 11:48:51.303' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (358, 10, 477, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:48:57.367' AS DateTime), CAST(N'2017-02-18 11:48:57.367' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (359, 10, 85, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:49:13.253' AS DateTime), CAST(N'2017-02-18 11:49:13.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (360, 10, 308, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:50:17.647' AS DateTime), CAST(N'2017-02-18 11:50:17.647' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (361, 10, 80, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:50:23.027' AS DateTime), CAST(N'2017-02-18 11:50:23.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (362, 10, 486, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:50:51.770' AS DateTime), CAST(N'2017-02-18 11:50:51.770' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (363, 10, 156, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:51:43.553' AS DateTime), CAST(N'2017-02-18 11:51:43.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (364, 10, 84, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:51:51.103' AS DateTime), CAST(N'2017-02-18 11:51:51.103' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (365, 10, 38, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:52:02.833' AS DateTime), CAST(N'2017-02-18 11:52:02.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (366, 10, 102, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:52:37.777' AS DateTime), CAST(N'2017-02-18 11:52:37.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (367, 10, 237, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:52:53.697' AS DateTime), CAST(N'2017-02-18 11:52:53.697' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (368, 10, 216, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:52:59.893' AS DateTime), CAST(N'2017-02-18 11:52:59.893' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (369, 10, 233, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:53:09.377' AS DateTime), CAST(N'2017-02-18 11:53:09.377' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (370, 10, 77, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:54:12.107' AS DateTime), CAST(N'2017-02-18 11:54:12.107' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (371, 10, 539, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:54:24.273' AS DateTime), CAST(N'2017-02-18 11:54:24.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (372, 10, 98, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:54:44.217' AS DateTime), CAST(N'2017-02-18 11:54:44.217' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (373, 10, 439, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:54:56.583' AS DateTime), CAST(N'2017-02-18 11:54:56.583' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (374, 10, 444, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:55:03.320' AS DateTime), CAST(N'2017-02-18 11:55:03.320' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (375, 10, 445, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:55:04.597' AS DateTime), CAST(N'2017-02-18 11:55:04.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (376, 10, 22, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:56:55.287' AS DateTime), CAST(N'2017-02-18 11:56:55.287' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (377, 10, 182, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:57:10.353' AS DateTime), CAST(N'2017-02-18 11:57:10.353' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (378, 10, 277, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:57:22.240' AS DateTime), CAST(N'2017-02-18 11:57:22.240' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (379, 10, 197, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:57:31.873' AS DateTime), CAST(N'2017-02-18 11:57:31.873' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (380, 10, 100, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:57:47.337' AS DateTime), CAST(N'2017-02-18 11:57:47.337' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (381, 10, 136, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:57:55.997' AS DateTime), CAST(N'2017-02-18 11:57:55.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (382, 10, 334, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:58:02.653' AS DateTime), CAST(N'2017-02-18 11:58:02.653' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (383, 10, 344, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:58:24.417' AS DateTime), CAST(N'2017-02-18 11:58:24.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (384, 10, 155, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:58:33.073' AS DateTime), CAST(N'2017-02-18 11:58:33.073' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (385, 10, 299, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:58:38.597' AS DateTime), CAST(N'2017-02-18 11:58:38.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (386, 10, 196, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:58:43.380' AS DateTime), CAST(N'2017-02-18 11:58:43.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (387, 10, 82, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:58:59.040' AS DateTime), CAST(N'2017-02-18 11:58:59.040' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (388, 10, 23, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:59:13.347' AS DateTime), CAST(N'2017-02-18 11:59:13.347' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (389, 10, 504, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:59:23.307' AS DateTime), CAST(N'2017-02-18 11:59:23.307' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (390, 10, 385, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:59:29.377' AS DateTime), CAST(N'2017-02-18 11:59:29.377' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (391, 10, 305, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:59:51.460' AS DateTime), CAST(N'2017-02-18 11:59:51.460' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (392, 10, 56, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 11:59:57.030' AS DateTime), CAST(N'2017-02-18 11:59:57.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (393, 10, 150, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:00:05.280' AS DateTime), CAST(N'2017-02-18 12:00:05.280' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (394, 10, 359, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:00:11.137' AS DateTime), CAST(N'2017-02-18 12:00:11.137' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (395, 10, 310, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:00:33.990' AS DateTime), CAST(N'2017-02-18 12:00:33.990' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (396, 10, 524, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:00:38.590' AS DateTime), CAST(N'2017-02-18 12:00:38.590' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (397, 10, 125, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:00:52.443' AS DateTime), CAST(N'2017-02-18 12:00:52.443' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (398, 10, 432, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:00:56.927' AS DateTime), CAST(N'2017-02-18 12:00:56.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (399, 10, 269, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:01:17.960' AS DateTime), CAST(N'2017-02-18 12:01:17.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (400, 10, 186, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:01:25.947' AS DateTime), CAST(N'2017-02-18 12:01:25.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (401, 10, 236, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:03:20.543' AS DateTime), CAST(N'2017-02-18 12:03:20.543' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (402, 10, 482, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:03:42.830' AS DateTime), CAST(N'2017-02-18 12:03:42.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (403, 10, 483, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:03:43.913' AS DateTime), CAST(N'2017-02-18 12:03:43.913' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (404, 10, 61, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:03:54.893' AS DateTime), CAST(N'2017-02-18 12:03:54.893' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (405, 10, 474, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:04:01.873' AS DateTime), CAST(N'2017-02-18 12:04:01.873' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (406, 10, 513, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:04:15.907' AS DateTime), CAST(N'2017-02-18 12:04:15.907' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (407, 10, 413, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:04:38.453' AS DateTime), CAST(N'2017-02-18 12:04:38.453' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (408, 10, 412, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:04:50.013' AS DateTime), CAST(N'2017-02-18 12:04:50.013' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (409, 10, 189, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:05:05.577' AS DateTime), CAST(N'2017-02-18 12:05:05.577' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (410, 10, 323, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:05:14.183' AS DateTime), CAST(N'2017-02-18 12:05:14.183' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (411, 10, 167, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:05:36.650' AS DateTime), CAST(N'2017-02-18 12:05:36.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (412, 10, 532, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:05:51.517' AS DateTime), CAST(N'2017-02-18 12:05:51.517' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (413, 10, 101, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:05:57.023' AS DateTime), CAST(N'2017-02-18 12:05:57.023' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (414, 10, 420, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:06:17.817' AS DateTime), CAST(N'2017-02-18 12:06:17.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (415, 10, 421, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:06:18.023' AS DateTime), CAST(N'2017-02-18 12:06:18.023' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (416, 10, 147, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:07:13.023' AS DateTime), CAST(N'2017-02-18 12:07:13.023' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (417, 10, 228, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:07:44.403' AS DateTime), CAST(N'2017-02-18 12:07:44.403' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (418, 10, 459, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:07:54.667' AS DateTime), CAST(N'2017-02-18 12:07:54.667' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (419, 10, 461, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:07:57.833' AS DateTime), CAST(N'2017-02-18 12:07:57.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (420, 10, 351, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:08:06.440' AS DateTime), CAST(N'2017-02-18 12:08:06.440' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (421, 10, 253, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:08:21.963' AS DateTime), CAST(N'2017-02-18 12:08:21.963' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (422, 10, 375, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:08:50.003' AS DateTime), CAST(N'2017-02-18 12:08:50.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (423, 10, 402, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:09:17.797' AS DateTime), CAST(N'2017-02-18 12:09:17.797' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (424, 10, 153, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:09:27.320' AS DateTime), CAST(N'2017-02-18 12:09:27.320' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (425, 10, 296, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:09:46.553' AS DateTime), CAST(N'2017-02-18 12:09:46.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (426, 10, 514, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:09:52.687' AS DateTime), CAST(N'2017-02-18 12:09:52.687' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (427, 10, 120, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:09:57.557' AS DateTime), CAST(N'2017-02-18 12:09:57.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (428, 10, 53, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:10:10.380' AS DateTime), CAST(N'2017-02-18 12:10:10.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (429, 10, 219, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:10:20.340' AS DateTime), CAST(N'2017-02-18 12:10:20.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (430, 10, 50, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:10:26.117' AS DateTime), CAST(N'2017-02-18 12:10:26.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (431, 10, 452, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:10:48.230' AS DateTime), CAST(N'2017-02-18 12:10:48.230' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (432, 10, 521, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:10:55.357' AS DateTime), CAST(N'2017-02-18 12:10:55.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (433, 10, 261, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:11:16.947' AS DateTime), CAST(N'2017-02-18 12:11:16.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (434, 10, 259, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:11:40.857' AS DateTime), CAST(N'2017-02-18 12:11:40.857' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (435, 10, 177, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:11:54.180' AS DateTime), CAST(N'2017-02-18 12:11:54.180' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (436, 10, 157, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:12:03.337' AS DateTime), CAST(N'2017-02-18 12:12:03.337' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (437, 10, 451, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:13:52.670' AS DateTime), CAST(N'2017-02-18 12:13:52.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (438, 10, 204, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:16:35.573' AS DateTime), CAST(N'2017-02-18 12:16:35.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (439, 10, 302, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:07.217' AS DateTime), CAST(N'2017-02-18 12:17:07.217' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (440, 10, 303, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:08.190' AS DateTime), CAST(N'2017-02-18 12:17:08.190' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (441, 10, 447, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:14.590' AS DateTime), CAST(N'2017-02-18 12:17:14.590' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (442, 10, 457, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:23.093' AS DateTime), CAST(N'2017-02-18 12:17:23.093' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (443, 10, 209, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:29.730' AS DateTime), CAST(N'2017-02-18 12:17:29.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (444, 10, 151, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:39.450' AS DateTime), CAST(N'2017-02-18 12:17:39.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (445, 10, 500, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:44.280' AS DateTime), CAST(N'2017-02-18 12:17:44.280' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (446, 10, 134, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:17:59.407' AS DateTime), CAST(N'2017-02-18 12:17:59.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (447, 10, 60, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:18:11.267' AS DateTime), CAST(N'2017-02-18 12:18:11.267' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (448, 10, 349, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:18:21.827' AS DateTime), CAST(N'2017-02-18 12:18:21.827' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (449, 10, 403, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:18:49.053' AS DateTime), CAST(N'2017-02-18 12:18:49.053' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (450, 10, 262, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:19:16.537' AS DateTime), CAST(N'2017-02-18 12:19:16.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (451, 10, 460, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:19:35.310' AS DateTime), CAST(N'2017-02-18 12:19:35.310' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (452, 10, 470, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:20:05.940' AS DateTime), CAST(N'2017-02-18 12:20:05.940' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (453, 10, 338, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:20:18.210' AS DateTime), CAST(N'2017-02-18 12:20:18.210' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (454, 10, 139, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:38:34.203' AS DateTime), CAST(N'2017-02-18 12:38:34.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (455, 10, 119, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:38:43.017' AS DateTime), CAST(N'2017-02-18 12:38:43.017' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (456, 10, 211, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:38:54.677' AS DateTime), CAST(N'2017-02-18 12:38:54.677' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (457, 10, 494, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:39:13.360' AS DateTime), CAST(N'2017-02-18 12:39:13.360' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (458, 10, 519, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:39:30.157' AS DateTime), CAST(N'2017-02-18 12:39:30.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (459, 10, 59, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:39:43.793' AS DateTime), CAST(N'2017-02-18 12:39:43.793' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (460, 10, 285, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:39:59.957' AS DateTime), CAST(N'2017-02-18 12:39:59.957' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (461, 10, 523, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:40:23.863' AS DateTime), CAST(N'2017-02-18 12:40:23.863' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (462, 10, 244, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:40:34.737' AS DateTime), CAST(N'2017-02-18 12:40:34.737' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (463, 10, 32, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:40:39.513' AS DateTime), CAST(N'2017-02-18 12:40:39.513' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (464, 10, 437, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:41:21.383' AS DateTime), CAST(N'2017-02-18 12:41:21.383' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (465, 10, 52, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:41:31.953' AS DateTime), CAST(N'2017-02-18 12:41:31.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (466, 10, 214, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:41:53.183' AS DateTime), CAST(N'2017-02-18 12:41:53.183' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (467, 10, 250, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:42:14.637' AS DateTime), CAST(N'2017-02-18 12:42:14.637' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (468, 10, 507, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:42:20.703' AS DateTime), CAST(N'2017-02-18 12:42:20.703' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (469, 10, 118, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:42:29.917' AS DateTime), CAST(N'2017-02-18 12:42:29.917' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (470, 10, 485, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:42:48.210' AS DateTime), CAST(N'2017-02-18 12:42:48.210' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (471, 10, 164, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:42:56.110' AS DateTime), CAST(N'2017-02-18 12:42:56.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (472, 10, 106, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:43:25.693' AS DateTime), CAST(N'2017-02-18 12:43:25.693' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (473, 10, 210, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:44:02.657' AS DateTime), CAST(N'2017-02-18 12:44:02.657' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (474, 10, 449, 1, CAST(N'2016-10-09 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:44:22.373' AS DateTime), CAST(N'2017-02-18 12:44:22.373' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (475, 11, 487, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:51:33.107' AS DateTime), CAST(N'2017-02-18 12:51:33.107' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (476, 11, 197, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:51:50.573' AS DateTime), CAST(N'2017-02-18 12:51:50.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (477, 11, 156, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:52:04.780' AS DateTime), CAST(N'2017-02-18 12:52:04.780' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (478, 11, 360, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:52:50.890' AS DateTime), CAST(N'2017-02-18 12:52:50.890' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (479, 11, 215, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:52:56.937' AS DateTime), CAST(N'2017-02-18 12:52:56.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (480, 11, 233, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:53:02.273' AS DateTime), CAST(N'2017-02-18 12:53:02.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (481, 11, 100, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:53:10.377' AS DateTime), CAST(N'2017-02-18 12:53:10.377' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (482, 11, 520, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:53:59.193' AS DateTime), CAST(N'2017-02-18 12:53:59.193' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (483, 11, 319, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:54:08.087' AS DateTime), CAST(N'2017-02-18 12:54:08.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (484, 11, 57, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:54:47.553' AS DateTime), CAST(N'2017-02-18 12:54:47.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (485, 11, 58, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:54:48.770' AS DateTime), CAST(N'2017-02-18 12:54:48.770' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (486, 11, 192, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:54:58.643' AS DateTime), CAST(N'2017-02-18 12:54:58.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (487, 11, 446, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:55:07.593' AS DateTime), CAST(N'2017-02-18 12:55:07.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (488, 11, 326, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:55:21.753' AS DateTime), CAST(N'2017-02-18 12:55:21.753' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (489, 11, 363, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:55:44.243' AS DateTime), CAST(N'2017-02-18 12:55:44.243' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (490, 11, 439, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:55:52.573' AS DateTime), CAST(N'2017-02-18 12:55:52.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (491, 11, 268, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:55:58.007' AS DateTime), CAST(N'2017-02-18 12:55:58.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (492, 11, 77, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:56:11.593' AS DateTime), CAST(N'2017-02-18 12:56:11.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (493, 11, 135, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:56:32.257' AS DateTime), CAST(N'2017-02-18 12:56:32.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (494, 11, 98, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:57:21.090' AS DateTime), CAST(N'2017-02-18 12:57:21.090' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (495, 11, 160, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:57:29.087' AS DateTime), CAST(N'2017-02-18 12:57:29.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (496, 11, 224, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:57:52.860' AS DateTime), CAST(N'2017-02-18 12:57:52.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (497, 11, 359, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:57:58.263' AS DateTime), CAST(N'2017-02-18 12:57:58.263' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (498, 11, 221, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:58:05.573' AS DateTime), CAST(N'2017-02-18 12:58:05.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (499, 11, 432, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:58:22.947' AS DateTime), CAST(N'2017-02-18 12:58:22.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (500, 11, 222, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:58:42.997' AS DateTime), CAST(N'2017-02-18 12:58:42.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (501, 11, 237, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:58:50.453' AS DateTime), CAST(N'2017-02-18 12:58:50.453' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (502, 11, 125, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:58:56.340' AS DateTime), CAST(N'2017-02-18 12:58:56.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (503, 11, 48, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:59:03.763' AS DateTime), CAST(N'2017-02-18 12:59:03.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (504, 11, 524, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:59:11.450' AS DateTime), CAST(N'2017-02-18 12:59:11.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (505, 11, 83, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:59:24.700' AS DateTime), CAST(N'2017-02-18 12:59:24.700' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (506, 11, 269, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:59:39.637' AS DateTime), CAST(N'2017-02-18 12:59:39.637' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (507, 11, 310, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 12:59:51.200' AS DateTime), CAST(N'2017-02-18 12:59:51.200' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (508, 11, 56, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:00:03.140' AS DateTime), CAST(N'2017-02-18 13:00:03.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (509, 11, 273, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:01:28.323' AS DateTime), CAST(N'2017-02-18 13:01:28.323' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (510, 11, 444, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:01:41.163' AS DateTime), CAST(N'2017-02-18 13:01:41.163' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (511, 11, 334, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:01:51.297' AS DateTime), CAST(N'2017-02-18 13:01:51.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (512, 11, 277, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:02:12.917' AS DateTime), CAST(N'2017-02-18 13:02:12.917' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (513, 11, 539, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:02:23.333' AS DateTime), CAST(N'2017-02-18 13:02:23.333' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (514, 11, 150, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:02:36.987' AS DateTime), CAST(N'2017-02-18 13:02:36.987' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (515, 11, 38, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:02:47.763' AS DateTime), CAST(N'2017-02-18 13:02:47.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (516, 11, 180, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:03:06.197' AS DateTime), CAST(N'2017-02-18 13:03:06.197' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (517, 11, 84, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:03:30.330' AS DateTime), CAST(N'2017-02-18 13:03:30.330' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (518, 11, 29, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:03:43.087' AS DateTime), CAST(N'2017-02-18 13:03:43.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (519, 11, 385, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:03:53.887' AS DateTime), CAST(N'2017-02-18 13:03:53.887' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (520, 11, 179, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:04:07.547' AS DateTime), CAST(N'2017-02-18 13:04:07.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (521, 11, 504, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:04:14.477' AS DateTime), CAST(N'2017-02-18 13:04:14.477' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (522, 11, 271, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:04:47.633' AS DateTime), CAST(N'2017-02-18 13:04:47.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (523, 11, 183, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:08:23.497' AS DateTime), CAST(N'2017-02-18 13:08:23.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (524, 11, 182, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:08:36.233' AS DateTime), CAST(N'2017-02-18 13:08:36.233' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (525, 11, 392, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:08:45.763' AS DateTime), CAST(N'2017-02-18 13:08:45.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (526, 11, 17, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:08:52.673' AS DateTime), CAST(N'2017-02-18 13:08:52.673' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (527, 11, 162, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:09:08.860' AS DateTime), CAST(N'2017-02-18 13:09:08.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (528, 11, 477, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:09:29.960' AS DateTime), CAST(N'2017-02-18 13:09:29.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (529, 11, 34, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:09:44.007' AS DateTime), CAST(N'2017-02-18 13:09:44.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (530, 11, 99, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:09:58.933' AS DateTime), CAST(N'2017-02-18 13:09:58.933' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (531, 11, 345, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:10:10.453' AS DateTime), CAST(N'2017-02-18 13:10:10.453' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (532, 11, 424, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:10:16.127' AS DateTime), CAST(N'2017-02-18 13:10:16.127' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (533, 11, 344, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:10:34.810' AS DateTime), CAST(N'2017-02-18 13:10:34.810' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (534, 11, 80, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:10:42.103' AS DateTime), CAST(N'2017-02-18 13:10:42.103' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (535, 11, 85, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:10:48.593' AS DateTime), CAST(N'2017-02-18 13:10:48.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (536, 11, 308, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:10:54.917' AS DateTime), CAST(N'2017-02-18 13:10:54.917' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (537, 11, 309, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:10:56.417' AS DateTime), CAST(N'2017-02-18 13:10:56.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (538, 11, 23, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:11:03.007' AS DateTime), CAST(N'2017-02-18 13:11:03.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (539, 11, 299, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:11:07.750' AS DateTime), CAST(N'2017-02-18 13:11:07.750' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (540, 11, 155, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:11:15.157' AS DateTime), CAST(N'2017-02-18 13:11:15.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (541, 11, 279, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:17:55.187' AS DateTime), CAST(N'2017-02-18 13:17:55.187' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (542, 11, 103, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:18:15.837' AS DateTime), CAST(N'2017-02-18 13:18:15.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (543, 11, 390, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:18:22.510' AS DateTime), CAST(N'2017-02-18 13:18:22.510' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (544, 11, 455, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:18:32.677' AS DateTime), CAST(N'2017-02-18 13:18:32.677' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (545, 11, 35, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:18:58.400' AS DateTime), CAST(N'2017-02-18 13:18:58.400' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (546, 11, 176, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:19:19.883' AS DateTime), CAST(N'2017-02-18 13:19:19.883' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (547, 11, 70, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:23:12.267' AS DateTime), CAST(N'2017-02-18 13:23:12.267' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (548, 11, 181, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:23:26.127' AS DateTime), CAST(N'2017-02-18 13:23:26.127' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (549, 11, 270, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:23:37.137' AS DateTime), CAST(N'2017-02-18 13:23:37.137' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (550, 11, 496, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:23:45.647' AS DateTime), CAST(N'2017-02-18 13:23:45.647' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (551, 11, 361, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:24:08.057' AS DateTime), CAST(N'2017-02-18 13:24:08.057' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (552, 11, 144, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:25:18.030' AS DateTime), CAST(N'2017-02-18 13:25:18.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (553, 11, 115, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:25:23.787' AS DateTime), CAST(N'2017-02-18 13:25:23.787' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (554, 11, 126, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:29:56.437' AS DateTime), CAST(N'2017-02-18 13:29:56.437' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (555, 11, 102, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 13:30:01.763' AS DateTime), CAST(N'2017-02-18 13:30:01.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (556, 11, 423, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:02:23.240' AS DateTime), CAST(N'2017-02-18 14:02:23.240' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (557, 11, 33, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:03:40.037' AS DateTime), CAST(N'2017-02-18 14:03:40.037' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (558, 11, 82, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:03:56.907' AS DateTime), CAST(N'2017-02-18 14:03:56.907' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (559, 11, 196, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:04:04.823' AS DateTime), CAST(N'2017-02-18 14:04:04.823' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (560, 11, 238, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:04:23.240' AS DateTime), CAST(N'2017-02-18 14:04:23.240' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (561, 11, 515, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:04:27.723' AS DateTime), CAST(N'2017-02-18 14:04:27.723' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (562, 11, 354, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:04:40.287' AS DateTime), CAST(N'2017-02-18 14:04:40.287' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (563, 11, 314, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:05:00.523' AS DateTime), CAST(N'2017-02-18 14:05:00.523' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (564, 11, 315, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:05:01.727' AS DateTime), CAST(N'2017-02-18 14:05:01.727' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (565, 11, 272, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:05:08.630' AS DateTime), CAST(N'2017-02-18 14:05:08.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (566, 11, 101, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:05:31.000' AS DateTime), CAST(N'2017-02-18 14:05:31.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (567, 11, 494, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:05:36.970' AS DateTime), CAST(N'2017-02-18 14:05:36.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (568, 11, 61, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:05:43.473' AS DateTime), CAST(N'2017-02-18 14:05:43.473' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (569, 11, 15, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:05:49.920' AS DateTime), CAST(N'2017-02-18 14:05:49.920' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (570, 11, 200, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:06:00.947' AS DateTime), CAST(N'2017-02-18 14:06:00.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (571, 11, 405, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:06:14.070' AS DateTime), CAST(N'2017-02-18 14:06:14.070' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (572, 11, 293, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:06:27.177' AS DateTime), CAST(N'2017-02-18 14:06:27.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (573, 11, 278, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:06:40.647' AS DateTime), CAST(N'2017-02-18 14:06:40.647' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (574, 11, 151, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:06:44.817' AS DateTime), CAST(N'2017-02-18 14:06:44.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (575, 11, 214, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:07:14.253' AS DateTime), CAST(N'2017-02-18 14:07:14.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (576, 11, 485, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:07:23.163' AS DateTime), CAST(N'2017-02-18 14:07:23.163' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (577, 11, 163, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:07:27.533' AS DateTime), CAST(N'2017-02-18 14:07:27.533' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (578, 11, 120, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:07:32.210' AS DateTime), CAST(N'2017-02-18 14:07:32.210' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (579, 11, 157, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:07:43.147' AS DateTime), CAST(N'2017-02-18 14:07:43.147' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (580, 11, 295, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:07:49.573' AS DateTime), CAST(N'2017-02-18 14:07:49.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (581, 11, 337, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:07:54.713' AS DateTime), CAST(N'2017-02-18 14:07:54.713' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (582, 11, 177, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:08:08.923' AS DateTime), CAST(N'2017-02-18 14:08:08.923' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (583, 11, 208, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:08:28.537' AS DateTime), CAST(N'2017-02-18 14:08:28.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (584, 11, 3, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:08:34.440' AS DateTime), CAST(N'2017-02-18 14:08:34.440' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (585, 11, 474, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:08:53.887' AS DateTime), CAST(N'2017-02-18 14:08:53.887' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (586, 11, 521, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:09:06.080' AS DateTime), CAST(N'2017-02-18 14:09:06.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (587, 11, 261, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:29:09.843' AS DateTime), CAST(N'2017-02-18 14:29:09.843' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (588, 11, 286, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:29:16.870' AS DateTime), CAST(N'2017-02-18 14:29:16.870' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (589, 11, 475, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:29:30.710' AS DateTime), CAST(N'2017-02-18 14:29:30.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (590, 11, 394, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:29:37.157' AS DateTime), CAST(N'2017-02-18 14:29:37.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (591, 11, 285, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:30:01.777' AS DateTime), CAST(N'2017-02-18 14:30:01.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (592, 11, 442, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:30:19.417' AS DateTime), CAST(N'2017-02-18 14:30:19.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (593, 11, 480, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:30:40.547' AS DateTime), CAST(N'2017-02-18 14:30:40.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (594, 11, 437, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:30:53.547' AS DateTime), CAST(N'2017-02-18 14:30:53.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (595, 11, 443, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:31:10.557' AS DateTime), CAST(N'2017-02-18 14:31:10.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (596, 11, 118, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:31:18.613' AS DateTime), CAST(N'2017-02-18 14:31:18.613' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (597, 11, 509, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:31:22.917' AS DateTime), CAST(N'2017-02-18 14:31:22.917' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (598, 11, 217, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:31:36.960' AS DateTime), CAST(N'2017-02-18 14:31:36.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (599, 11, 513, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:31:42.983' AS DateTime), CAST(N'2017-02-18 14:31:42.983' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (600, 11, 127, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:32:14.853' AS DateTime), CAST(N'2017-02-18 14:32:14.853' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (601, 11, 358, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:32:34.193' AS DateTime), CAST(N'2017-02-18 14:32:34.193' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (602, 11, 250, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:32:39.497' AS DateTime), CAST(N'2017-02-18 14:32:39.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (603, 11, 207, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:32:50.030' AS DateTime), CAST(N'2017-02-18 14:32:50.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (604, 11, 213, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:33:10.030' AS DateTime), CAST(N'2017-02-18 14:33:10.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (605, 11, 329, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:33:16.047' AS DateTime), CAST(N'2017-02-18 14:33:16.047' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (606, 11, 459, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:33:26.973' AS DateTime), CAST(N'2017-02-18 14:33:26.973' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (607, 11, 188, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:33:41.257' AS DateTime), CAST(N'2017-02-18 14:33:41.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (608, 11, 519, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:33:49.030' AS DateTime), CAST(N'2017-02-18 14:33:49.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (609, 11, 395, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:33:56.567' AS DateTime), CAST(N'2017-02-18 14:33:56.567' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (610, 11, 402, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:34:00.367' AS DateTime), CAST(N'2017-02-18 14:34:00.367' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (611, 11, 59, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:34:16.393' AS DateTime), CAST(N'2017-02-18 14:34:16.393' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (612, 11, 242, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:34:44.213' AS DateTime), CAST(N'2017-02-18 14:34:44.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (613, 11, 449, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:34:49.457' AS DateTime), CAST(N'2017-02-18 14:34:49.457' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (614, 11, 52, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:35:04.833' AS DateTime), CAST(N'2017-02-18 14:35:04.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (615, 11, 297, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:35:21.947' AS DateTime), CAST(N'2017-02-18 14:35:21.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (616, 11, 167, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:35:50.107' AS DateTime), CAST(N'2017-02-18 14:35:50.107' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (617, 11, 164, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:36:14.037' AS DateTime), CAST(N'2017-02-18 14:36:14.037' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (618, 11, 413, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:36:36.107' AS DateTime), CAST(N'2017-02-18 14:36:36.107' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (619, 11, 457, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:36:45.097' AS DateTime), CAST(N'2017-02-18 14:36:45.097' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (620, 11, 482, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:36:54.107' AS DateTime), CAST(N'2017-02-18 14:36:54.107' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (621, 11, 252, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:37:12.500' AS DateTime), CAST(N'2017-02-18 14:37:12.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (622, 11, 251, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:37:14.253' AS DateTime), CAST(N'2017-02-18 14:37:14.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (623, 11, 380, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:37:24.077' AS DateTime), CAST(N'2017-02-18 14:37:24.077' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (624, 11, 332, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:37:35.743' AS DateTime), CAST(N'2017-02-18 14:37:35.743' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (625, 11, 104, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:37:52.233' AS DateTime), CAST(N'2017-02-18 14:37:52.233' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (626, 11, 134, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:37:57.353' AS DateTime), CAST(N'2017-02-18 14:37:57.353' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (627, 11, 60, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:38:07.880' AS DateTime), CAST(N'2017-02-18 14:38:07.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (628, 11, 403, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:38:13.887' AS DateTime), CAST(N'2017-02-18 14:38:13.887' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (629, 11, 422, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:38:50.150' AS DateTime), CAST(N'2017-02-18 14:38:50.150' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (630, 11, 13, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:38:56.747' AS DateTime), CAST(N'2017-02-18 14:38:56.747' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (631, 11, 294, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:39:12.590' AS DateTime), CAST(N'2017-02-18 14:39:12.590' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (632, 11, 106, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:39:19.660' AS DateTime), CAST(N'2017-02-18 14:39:19.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (633, 11, 316, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:39:25.583' AS DateTime), CAST(N'2017-02-18 14:39:25.583' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (634, 11, 460, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:39:34.970' AS DateTime), CAST(N'2017-02-18 14:39:34.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (635, 11, 461, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:39:36.967' AS DateTime), CAST(N'2017-02-18 14:39:36.967' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (636, 11, 321, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:39:43.947' AS DateTime), CAST(N'2017-02-18 14:39:43.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (637, 11, 350, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:40:15.567' AS DateTime), CAST(N'2017-02-18 14:40:15.567' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (638, 11, 435, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:40:37.157' AS DateTime), CAST(N'2017-02-18 14:40:37.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (639, 11, 105, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:40:52.633' AS DateTime), CAST(N'2017-02-18 14:40:52.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (640, 11, 510, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:41:04.683' AS DateTime), CAST(N'2017-02-18 14:41:04.683' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (641, 11, 296, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:41:11.517' AS DateTime), CAST(N'2017-02-18 14:41:11.517' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (642, 11, 514, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:41:16.130' AS DateTime), CAST(N'2017-02-18 14:41:16.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (643, 11, 119, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:41:22.380' AS DateTime), CAST(N'2017-02-18 14:41:22.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (644, 11, 452, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:41:43.823' AS DateTime), CAST(N'2017-02-18 14:41:43.823' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (645, 11, 50, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:41:49.007' AS DateTime), CAST(N'2017-02-18 14:41:49.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (646, 11, 219, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:41:55.333' AS DateTime), CAST(N'2017-02-18 14:41:55.333' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (647, 11, 53, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:42:09.973' AS DateTime), CAST(N'2017-02-18 14:42:09.973' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (648, 11, 523, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:42:14.977' AS DateTime), CAST(N'2017-02-18 14:42:14.977' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (649, 11, 451, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:42:36.063' AS DateTime), CAST(N'2017-02-18 14:42:36.063' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (650, 11, 262, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:42:47.653' AS DateTime), CAST(N'2017-02-18 14:42:47.653' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (651, 11, 75, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:42:59.923' AS DateTime), CAST(N'2017-02-18 14:42:59.923' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (652, 11, 396, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:43:16.407' AS DateTime), CAST(N'2017-02-18 14:43:16.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (653, 11, 257, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:43:23.000' AS DateTime), CAST(N'2017-02-18 14:43:23.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (654, 11, 263, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:44:27.167' AS DateTime), CAST(N'2017-02-18 14:44:27.167' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (655, 11, 409, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:44:51.117' AS DateTime), CAST(N'2017-02-18 14:44:51.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (656, 11, 211, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:45:09.067' AS DateTime), CAST(N'2017-02-18 14:45:09.067' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (657, 11, 107, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:45:18.877' AS DateTime), CAST(N'2017-02-18 14:45:18.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (658, 11, 64, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:45:35.787' AS DateTime), CAST(N'2017-02-18 14:45:35.787' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (659, 11, 408, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:45:41.927' AS DateTime), CAST(N'2017-02-18 14:45:41.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (660, 11, 511, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:45:59.273' AS DateTime), CAST(N'2017-02-18 14:45:59.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (661, 11, 302, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:46:07.683' AS DateTime), CAST(N'2017-02-18 14:46:07.683' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (662, 11, 505, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:46:13.987' AS DateTime), CAST(N'2017-02-18 14:46:13.987' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (663, 11, 506, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:46:28.490' AS DateTime), CAST(N'2017-02-18 14:46:28.490' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (664, 11, 128, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:46:35.487' AS DateTime), CAST(N'2017-02-18 14:46:35.487' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (665, 11, 244, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:46:47.370' AS DateTime), CAST(N'2017-02-18 14:46:47.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (666, 11, 341, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:46:54.910' AS DateTime), CAST(N'2017-02-18 14:46:54.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (667, 11, 436, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:47:00.640' AS DateTime), CAST(N'2017-02-18 14:47:00.640' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (668, 11, 243, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:47:12.023' AS DateTime), CAST(N'2017-02-18 14:47:12.023' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (669, 11, 378, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:47:20.490' AS DateTime), CAST(N'2017-02-18 14:47:20.490' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (670, 11, 404, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:47:41.307' AS DateTime), CAST(N'2017-02-18 14:47:41.307' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (671, 11, 25, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:48:23.260' AS DateTime), CAST(N'2017-02-18 14:48:23.260' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (672, 11, 407, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 14:48:34.593' AS DateTime), CAST(N'2017-02-18 14:48:34.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (673, 11, 235, 1, CAST(N'2016-10-02 16:05:00.000' AS DateTime), CAST(N'2017-02-18 18:51:27.417' AS DateTime), CAST(N'2017-02-18 18:51:27.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (674, 12, 345, 1, CAST(N'2017-02-19 15:33:00.000' AS DateTime), CAST(N'2017-02-19 13:33:59.143' AS DateTime), CAST(N'2017-02-19 13:33:59.143' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (675, 12, 345, 1, CAST(N'2017-02-19 15:33:00.000' AS DateTime), CAST(N'2017-02-19 13:34:11.737' AS DateTime), CAST(N'2017-02-19 13:34:11.737' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (676, 12, 390, 1, CAST(N'2017-02-19 15:34:00.000' AS DateTime), CAST(N'2017-02-19 13:34:37.787' AS DateTime), CAST(N'2017-02-19 13:34:37.787' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (677, 12, 487, 1, CAST(N'2017-02-19 15:36:00.000' AS DateTime), CAST(N'2017-02-19 13:36:03.303' AS DateTime), CAST(N'2017-02-19 13:36:03.303' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (678, 12, 36, 1, CAST(N'2017-02-19 15:37:00.000' AS DateTime), CAST(N'2017-02-19 13:37:22.790' AS DateTime), CAST(N'2017-02-19 13:37:22.790' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (679, 12, 279, 1, CAST(N'2017-02-19 15:37:00.000' AS DateTime), CAST(N'2017-02-19 13:37:24.663' AS DateTime), CAST(N'2017-02-19 13:37:24.663' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (680, 12, 477, 1, CAST(N'2017-02-19 15:39:00.000' AS DateTime), CAST(N'2017-02-19 13:39:27.540' AS DateTime), CAST(N'2017-02-19 13:39:27.540' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (681, 12, 158, 1, CAST(N'2017-02-19 15:43:00.000' AS DateTime), CAST(N'2017-02-19 13:43:15.610' AS DateTime), CAST(N'2017-02-19 13:43:15.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (682, 12, 103, 1, CAST(N'2017-02-19 15:44:00.000' AS DateTime), CAST(N'2017-02-19 13:44:51.707' AS DateTime), CAST(N'2017-02-19 13:44:51.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (683, 12, 359, 1, CAST(N'2017-02-19 15:46:00.000' AS DateTime), CAST(N'2017-02-19 13:46:24.443' AS DateTime), CAST(N'2017-02-19 13:46:24.443' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (684, 12, 56, 1, CAST(N'2017-02-19 15:47:00.000' AS DateTime), CAST(N'2017-02-19 13:47:32.133' AS DateTime), CAST(N'2017-02-19 13:47:32.133' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (685, 12, 273, 1, CAST(N'2017-02-19 15:48:00.000' AS DateTime), CAST(N'2017-02-19 13:48:05.993' AS DateTime), CAST(N'2017-02-19 13:48:05.993' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (686, 12, 186, 1, CAST(N'2017-02-19 15:48:00.000' AS DateTime), CAST(N'2017-02-19 13:48:46.837' AS DateTime), CAST(N'2017-02-19 13:48:46.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (687, 12, 174, 1, CAST(N'2017-02-19 15:48:00.000' AS DateTime), CAST(N'2017-02-19 13:48:47.497' AS DateTime), CAST(N'2017-02-19 13:48:47.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (688, 12, 136, 1, CAST(N'2017-02-19 15:49:00.000' AS DateTime), CAST(N'2017-02-19 13:49:19.010' AS DateTime), CAST(N'2017-02-19 13:49:19.010' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (689, 12, 99, 1, CAST(N'2017-02-19 15:49:00.000' AS DateTime), CAST(N'2017-02-19 13:49:53.403' AS DateTime), CAST(N'2017-02-19 13:49:53.403' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (690, 12, 82, 1, CAST(N'2017-02-19 15:50:00.000' AS DateTime), CAST(N'2017-02-19 13:51:05.233' AS DateTime), CAST(N'2017-02-19 13:51:05.233' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (691, 12, 305, 1, CAST(N'2017-02-19 15:51:00.000' AS DateTime), CAST(N'2017-02-19 13:51:26.640' AS DateTime), CAST(N'2017-02-19 13:51:26.640' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (692, 12, 309, 1, CAST(N'2017-02-19 15:51:00.000' AS DateTime), CAST(N'2017-02-19 13:51:31.967' AS DateTime), CAST(N'2017-02-19 13:51:31.967' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (693, 12, 85, 1, CAST(N'2017-02-19 15:52:00.000' AS DateTime), CAST(N'2017-02-19 13:53:00.360' AS DateTime), CAST(N'2017-02-19 13:53:00.360' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (694, 12, 183, 1, CAST(N'2017-02-19 15:53:00.000' AS DateTime), CAST(N'2017-02-19 13:53:39.110' AS DateTime), CAST(N'2017-02-19 13:53:39.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (695, 12, 445, 1, CAST(N'2017-02-19 15:53:00.000' AS DateTime), CAST(N'2017-02-19 13:53:50.970' AS DateTime), CAST(N'2017-02-19 13:53:50.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (696, 12, 102, 1, CAST(N'2017-02-19 15:54:00.000' AS DateTime), CAST(N'2017-02-19 13:54:31.330' AS DateTime), CAST(N'2017-02-19 13:54:31.330' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (697, 12, 66, 1, CAST(N'2017-02-19 15:55:00.000' AS DateTime), CAST(N'2017-02-19 13:55:11.097' AS DateTime), CAST(N'2017-02-19 13:55:11.097' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (698, 12, 182, 1, CAST(N'2017-02-19 15:55:00.000' AS DateTime), CAST(N'2017-02-19 13:55:53.740' AS DateTime), CAST(N'2017-02-19 13:55:53.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (699, 12, 271, 1, CAST(N'2017-02-19 15:56:00.000' AS DateTime), CAST(N'2017-02-19 13:56:47.240' AS DateTime), CAST(N'2017-02-19 13:56:47.240' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (700, 12, 486, 1, CAST(N'2017-02-19 15:56:00.000' AS DateTime), CAST(N'2017-02-19 13:56:47.240' AS DateTime), CAST(N'2017-02-19 13:56:47.240' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (701, 12, 115, 1, CAST(N'2017-02-19 15:57:00.000' AS DateTime), CAST(N'2017-02-19 13:57:19.897' AS DateTime), CAST(N'2017-02-19 13:57:19.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (702, 12, 83, 1, CAST(N'2017-02-19 15:57:00.000' AS DateTime), CAST(N'2017-02-19 13:57:56.103' AS DateTime), CAST(N'2017-02-19 13:57:56.103' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (703, 12, 196, 1, CAST(N'2017-02-19 15:58:00.000' AS DateTime), CAST(N'2017-02-19 13:58:50.823' AS DateTime), CAST(N'2017-02-19 13:58:50.823' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (704, 12, 432, 1, CAST(N'2017-02-19 15:59:00.000' AS DateTime), CAST(N'2017-02-19 13:59:30.557' AS DateTime), CAST(N'2017-02-19 13:59:30.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (705, 12, 123, 1, CAST(N'2017-02-19 15:59:00.000' AS DateTime), CAST(N'2017-02-19 13:59:54.807' AS DateTime), CAST(N'2017-02-19 13:59:54.807' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (706, 12, 334, 1, CAST(N'2017-02-19 16:01:00.000' AS DateTime), CAST(N'2017-02-19 14:01:07.247' AS DateTime), CAST(N'2017-02-19 14:01:07.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (707, 12, 335, 1, CAST(N'2017-02-19 16:01:00.000' AS DateTime), CAST(N'2017-02-19 14:01:15.670' AS DateTime), CAST(N'2017-02-19 14:01:15.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (708, 12, 269, 1, CAST(N'2017-02-19 16:02:00.000' AS DateTime), CAST(N'2017-02-19 14:03:01.360' AS DateTime), CAST(N'2017-02-19 14:03:01.360' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (709, 12, 222, 1, CAST(N'2017-02-19 16:03:00.000' AS DateTime), CAST(N'2017-02-19 14:03:23.297' AS DateTime), CAST(N'2017-02-19 14:03:23.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (710, 12, 433, 1, CAST(N'2017-02-19 16:03:00.000' AS DateTime), CAST(N'2017-02-19 14:03:57.063' AS DateTime), CAST(N'2017-02-19 14:03:57.063' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (711, 12, 125, 1, CAST(N'2017-02-19 16:04:00.000' AS DateTime), CAST(N'2017-02-19 14:04:22.613' AS DateTime), CAST(N'2017-02-19 14:04:22.613' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (712, 12, 237, 1, CAST(N'2017-02-19 16:04:00.000' AS DateTime), CAST(N'2017-02-19 14:04:28.033' AS DateTime), CAST(N'2017-02-19 14:04:28.033' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (713, 12, 4, 1, CAST(N'2017-02-19 16:04:00.000' AS DateTime), CAST(N'2017-02-19 14:04:57.127' AS DateTime), CAST(N'2017-02-19 14:04:57.127' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (714, 12, 29, 1, CAST(N'2017-02-19 16:05:00.000' AS DateTime), CAST(N'2017-02-19 14:05:25.020' AS DateTime), CAST(N'2017-02-19 14:05:25.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (715, 12, 55, 1, CAST(N'2017-02-19 16:06:00.000' AS DateTime), CAST(N'2017-02-19 14:06:33.897' AS DateTime), CAST(N'2017-02-19 14:06:33.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (716, 12, 504, 1, CAST(N'2017-02-19 16:06:00.000' AS DateTime), CAST(N'2017-02-19 14:06:36.833' AS DateTime), CAST(N'2017-02-19 14:06:36.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (717, 12, 84, 1, CAST(N'2017-02-19 16:06:00.000' AS DateTime), CAST(N'2017-02-19 14:06:51.633' AS DateTime), CAST(N'2017-02-19 14:06:51.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (718, 12, 310, 1, CAST(N'2017-02-19 16:07:00.000' AS DateTime), CAST(N'2017-02-19 14:07:22.057' AS DateTime), CAST(N'2017-02-19 14:07:22.057' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (719, 12, 364, 1, CAST(N'2017-02-19 16:07:00.000' AS DateTime), CAST(N'2017-02-19 14:07:34.523' AS DateTime), CAST(N'2017-02-19 14:07:34.523' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (720, 12, 238, 1, CAST(N'2017-02-19 16:07:00.000' AS DateTime), CAST(N'2017-02-19 14:07:38.603' AS DateTime), CAST(N'2017-02-19 14:07:38.603' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (721, 12, 365, 1, CAST(N'2017-02-19 16:07:00.000' AS DateTime), CAST(N'2017-02-19 14:07:42.167' AS DateTime), CAST(N'2017-02-19 14:07:42.167' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (722, 12, 80, 1, CAST(N'2017-02-19 16:08:00.000' AS DateTime), CAST(N'2017-02-19 14:08:16.027' AS DateTime), CAST(N'2017-02-19 14:08:16.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (723, 12, 307, 1, CAST(N'2017-02-19 16:08:00.000' AS DateTime), CAST(N'2017-02-19 14:08:36.730' AS DateTime), CAST(N'2017-02-19 14:08:36.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (724, 12, 268, 1, CAST(N'2017-02-19 16:09:00.000' AS DateTime), CAST(N'2017-02-19 14:09:39.137' AS DateTime), CAST(N'2017-02-19 14:09:39.137' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (725, 12, 98, 1, CAST(N'2017-02-19 16:10:00.000' AS DateTime), CAST(N'2017-02-19 14:10:27.170' AS DateTime), CAST(N'2017-02-19 14:10:27.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (726, 12, 520, 1, CAST(N'2017-02-19 16:10:00.000' AS DateTime), CAST(N'2017-02-19 14:10:37.873' AS DateTime), CAST(N'2017-02-19 14:10:37.873' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (727, 12, 385, 1, CAST(N'2017-02-19 16:10:00.000' AS DateTime), CAST(N'2017-02-19 14:10:56.903' AS DateTime), CAST(N'2017-02-19 14:10:56.903' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (728, 12, 133, 1, CAST(N'2017-02-19 16:11:00.000' AS DateTime), CAST(N'2017-02-19 14:11:46.233' AS DateTime), CAST(N'2017-02-19 14:11:46.233' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (729, 12, 45, 1, CAST(N'2017-02-19 16:11:00.000' AS DateTime), CAST(N'2017-02-19 14:11:58.140' AS DateTime), CAST(N'2017-02-19 14:11:58.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (730, 12, 121, 1, CAST(N'2017-02-19 16:12:00.000' AS DateTime), CAST(N'2017-02-19 14:13:17.113' AS DateTime), CAST(N'2017-02-19 14:13:17.113' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (731, 12, 138, 1, CAST(N'2017-02-19 16:13:00.000' AS DateTime), CAST(N'2017-02-19 14:13:37.177' AS DateTime), CAST(N'2017-02-19 14:13:37.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (732, 12, 535, 1, CAST(N'2017-02-19 16:13:00.000' AS DateTime), CAST(N'2017-02-19 14:13:53.300' AS DateTime), CAST(N'2017-02-19 14:13:53.300' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (733, 12, 235, 1, CAST(N'2017-02-19 16:13:00.000' AS DateTime), CAST(N'2017-02-19 14:14:01.647' AS DateTime), CAST(N'2017-02-19 14:14:01.647' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (734, 12, 220, 1, CAST(N'2017-02-19 16:14:00.000' AS DateTime), CAST(N'2017-02-19 14:14:35.473' AS DateTime), CAST(N'2017-02-19 14:14:35.473' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (735, 12, 155, 1, CAST(N'2017-02-19 16:14:00.000' AS DateTime), CAST(N'2017-02-19 14:14:59.117' AS DateTime), CAST(N'2017-02-19 14:14:59.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (736, 12, 502, 1, CAST(N'2017-02-19 16:15:00.000' AS DateTime), CAST(N'2017-02-19 14:15:41.383' AS DateTime), CAST(N'2017-02-19 14:15:41.383' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (737, 12, 439, 1, CAST(N'2017-02-19 16:16:00.000' AS DateTime), CAST(N'2017-02-19 14:16:50.790' AS DateTime), CAST(N'2017-02-19 14:16:50.790' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (738, 12, 277, 1, CAST(N'2017-02-19 16:18:00.000' AS DateTime), CAST(N'2017-02-19 14:18:20.417' AS DateTime), CAST(N'2017-02-19 14:18:20.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (739, 12, 299, 1, CAST(N'2017-02-19 16:18:00.000' AS DateTime), CAST(N'2017-02-19 14:18:58.513' AS DateTime), CAST(N'2017-02-19 14:18:58.513' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (740, 12, 150, 1, CAST(N'2017-02-19 16:20:00.000' AS DateTime), CAST(N'2017-02-19 14:20:19.810' AS DateTime), CAST(N'2017-02-19 14:20:19.810' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (741, 12, 424, 1, CAST(N'2017-02-19 16:21:00.000' AS DateTime), CAST(N'2017-02-19 14:21:08.877' AS DateTime), CAST(N'2017-02-19 14:21:08.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (742, 12, 77, 1, CAST(N'2017-02-19 16:22:00.000' AS DateTime), CAST(N'2017-02-19 14:22:48.800' AS DateTime), CAST(N'2017-02-19 14:22:48.800' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (743, 12, 43, 1, CAST(N'2017-02-19 16:24:00.000' AS DateTime), CAST(N'2017-02-19 14:24:32.710' AS DateTime), CAST(N'2017-02-19 14:24:32.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (744, 12, 363, 1, CAST(N'2017-02-19 16:25:00.000' AS DateTime), CAST(N'2017-02-19 14:25:26.773' AS DateTime), CAST(N'2017-02-19 14:25:26.773' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (745, 12, 51, 1, CAST(N'2017-02-19 16:25:00.000' AS DateTime), CAST(N'2017-02-19 14:26:03.557' AS DateTime), CAST(N'2017-02-19 14:26:03.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (746, 12, 62, 1, CAST(N'2017-02-19 16:28:00.000' AS DateTime), CAST(N'2017-02-19 14:28:18.370' AS DateTime), CAST(N'2017-02-19 14:28:18.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (747, 12, 89, 1, CAST(N'2017-02-19 16:28:00.000' AS DateTime), CAST(N'2017-02-19 14:28:45.793' AS DateTime), CAST(N'2017-02-19 14:28:45.793' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (748, 12, 94, 1, CAST(N'2017-02-19 16:28:00.000' AS DateTime), CAST(N'2017-02-19 14:29:01.170' AS DateTime), CAST(N'2017-02-19 14:29:01.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (749, 12, 108, 1, CAST(N'2017-02-19 16:29:00.000' AS DateTime), CAST(N'2017-02-19 14:29:04.763' AS DateTime), CAST(N'2017-02-19 14:29:04.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (750, 12, 111, 1, CAST(N'2017-02-19 16:29:00.000' AS DateTime), CAST(N'2017-02-19 14:29:08.263' AS DateTime), CAST(N'2017-02-19 14:29:08.263' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (751, 12, 179, 1, CAST(N'2017-02-19 16:30:00.000' AS DateTime), CAST(N'2017-02-19 14:30:11.547' AS DateTime), CAST(N'2017-02-19 14:30:11.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (752, 12, 515, 1, CAST(N'2017-02-19 16:34:00.000' AS DateTime), CAST(N'2017-02-19 14:34:06.333' AS DateTime), CAST(N'2017-02-19 14:34:06.333' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (753, 12, 462, 1, CAST(N'2017-02-19 16:34:00.000' AS DateTime), CAST(N'2017-02-19 14:34:24.817' AS DateTime), CAST(N'2017-02-19 14:34:24.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (754, 12, 116, 1, CAST(N'2017-02-19 16:35:00.000' AS DateTime), CAST(N'2017-02-19 14:35:09.803' AS DateTime), CAST(N'2017-02-19 14:35:09.803' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (755, 12, 162, 1, CAST(N'2017-02-19 16:44:00.000' AS DateTime), CAST(N'2017-02-19 14:44:49.837' AS DateTime), CAST(N'2017-02-19 14:44:49.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (756, 12, 352, 1, CAST(N'2017-02-19 16:46:00.000' AS DateTime), CAST(N'2017-02-19 14:46:06.103' AS DateTime), CAST(N'2017-02-19 14:46:06.103' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (757, 12, 35, 1, CAST(N'2017-02-19 16:49:00.000' AS DateTime), CAST(N'2017-02-19 14:49:51.030' AS DateTime), CAST(N'2017-02-19 14:49:51.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (758, 12, 184, 1, CAST(N'2017-02-19 16:52:00.000' AS DateTime), CAST(N'2017-02-19 14:53:00.130' AS DateTime), CAST(N'2017-02-19 14:53:00.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (759, 12, 455, 1, CAST(N'2017-02-19 16:57:00.000' AS DateTime), CAST(N'2017-02-19 14:57:10.560' AS DateTime), CAST(N'2017-02-19 14:57:10.560' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (760, 12, 374, 1, CAST(N'2017-02-19 16:58:00.000' AS DateTime), CAST(N'2017-02-19 14:58:23.607' AS DateTime), CAST(N'2017-02-19 14:58:23.607' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (761, 12, 70, 1, CAST(N'2017-02-19 17:02:00.000' AS DateTime), CAST(N'2017-02-19 15:02:06.740' AS DateTime), CAST(N'2017-02-19 15:02:06.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (762, 12, 212, 1, CAST(N'2017-02-19 17:03:00.000' AS DateTime), CAST(N'2017-02-19 15:03:18.803' AS DateTime), CAST(N'2017-02-19 15:03:18.803' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (763, 12, 319, 1, CAST(N'2017-02-19 17:04:00.000' AS DateTime), CAST(N'2017-02-19 15:04:43.867' AS DateTime), CAST(N'2017-02-19 15:04:43.867' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (764, 12, 221, 1, CAST(N'2017-02-19 17:05:00.000' AS DateTime), CAST(N'2017-02-19 15:05:41.260' AS DateTime), CAST(N'2017-02-19 15:05:41.260' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (765, 12, 361, 1, CAST(N'2017-02-19 17:12:00.000' AS DateTime), CAST(N'2017-02-19 15:12:35.240' AS DateTime), CAST(N'2017-02-19 15:12:35.240' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (766, 12, 512, 1, CAST(N'2017-02-19 17:12:00.000' AS DateTime), CAST(N'2017-02-19 15:12:45.007' AS DateTime), CAST(N'2017-02-19 15:12:45.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (767, 12, 205, 1, CAST(N'2017-02-19 17:13:00.000' AS DateTime), CAST(N'2017-02-19 15:13:16.053' AS DateTime), CAST(N'2017-02-19 15:13:16.053' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (768, 12, 539, 1, CAST(N'2017-02-19 17:21:00.000' AS DateTime), CAST(N'2017-02-19 15:21:32.003' AS DateTime), CAST(N'2017-02-19 15:21:32.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (769, 12, 353, 1, CAST(N'2017-02-19 17:24:00.000' AS DateTime), CAST(N'2017-02-19 15:24:10.350' AS DateTime), CAST(N'2017-02-19 15:24:10.350' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (770, 12, 197, 1, CAST(N'2017-02-19 17:25:00.000' AS DateTime), CAST(N'2017-02-19 15:25:41.680' AS DateTime), CAST(N'2017-02-19 15:25:41.680' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (771, 12, 135, 1, CAST(N'2017-02-19 17:26:00.000' AS DateTime), CAST(N'2017-02-19 15:26:30.650' AS DateTime), CAST(N'2017-02-19 15:26:30.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (772, 12, 122, 1, CAST(N'2017-02-19 17:26:00.000' AS DateTime), CAST(N'2017-02-19 15:26:50.433' AS DateTime), CAST(N'2017-02-19 15:26:50.433' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (773, 12, 496, 1, CAST(N'2017-02-19 17:41:00.000' AS DateTime), CAST(N'2017-02-19 15:41:31.630' AS DateTime), CAST(N'2017-02-19 15:41:31.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (774, 12, 354, 1, CAST(N'2017-02-19 17:41:00.000' AS DateTime), CAST(N'2017-02-19 15:41:56.570' AS DateTime), CAST(N'2017-02-19 15:41:56.570' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (775, 13, 390, 1, CAST(N'2017-02-26 15:42:00.000' AS DateTime), CAST(N'2017-02-26 13:42:29.917' AS DateTime), CAST(N'2017-02-26 13:42:29.917' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (776, 13, 197, 1, CAST(N'2017-02-26 15:42:00.000' AS DateTime), CAST(N'2017-02-26 13:42:41.143' AS DateTime), CAST(N'2017-02-26 13:42:41.143' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (777, 13, 36, 1, CAST(N'2017-02-26 15:43:00.000' AS DateTime), CAST(N'2017-02-26 13:43:01.617' AS DateTime), CAST(N'2017-02-26 13:43:01.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (778, 13, 156, 1, CAST(N'2017-02-26 15:43:00.000' AS DateTime), CAST(N'2017-02-26 13:43:18.993' AS DateTime), CAST(N'2017-02-26 13:43:18.993' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (779, 13, 273, 1, CAST(N'2017-02-26 15:44:00.000' AS DateTime), CAST(N'2017-02-26 13:44:01.537' AS DateTime), CAST(N'2017-02-26 13:44:01.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (780, 13, 345, 1, CAST(N'2017-02-26 15:44:00.000' AS DateTime), CAST(N'2017-02-26 13:44:14.147' AS DateTime), CAST(N'2017-02-26 13:44:14.147' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (781, 13, 279, 1, CAST(N'2017-02-26 15:44:00.000' AS DateTime), CAST(N'2017-02-26 13:44:27.470' AS DateTime), CAST(N'2017-02-26 13:44:27.470' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (782, 13, 85, 1, CAST(N'2017-02-26 15:44:00.000' AS DateTime), CAST(N'2017-02-26 13:44:45.493' AS DateTime), CAST(N'2017-02-26 13:44:45.493' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (783, 13, 310, 1, CAST(N'2017-02-26 15:44:00.000' AS DateTime), CAST(N'2017-02-26 13:44:55.473' AS DateTime), CAST(N'2017-02-26 13:44:55.473' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (784, 13, 309, 1, CAST(N'2017-02-26 15:46:00.000' AS DateTime), CAST(N'2017-02-26 13:46:45.210' AS DateTime), CAST(N'2017-02-26 13:46:45.210' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (785, 13, 392, 1, CAST(N'2017-02-26 15:47:00.000' AS DateTime), CAST(N'2017-02-26 13:47:43.120' AS DateTime), CAST(N'2017-02-26 13:47:43.120' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (786, 13, 121, 1, CAST(N'2017-02-26 15:48:00.000' AS DateTime), CAST(N'2017-02-26 13:48:06.253' AS DateTime), CAST(N'2017-02-26 13:48:06.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (787, 13, 445, 1, CAST(N'2017-02-26 15:48:00.000' AS DateTime), CAST(N'2017-02-26 13:48:21.320' AS DateTime), CAST(N'2017-02-26 13:48:21.320' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (788, 13, 179, 1, CAST(N'2017-02-26 15:49:00.000' AS DateTime), CAST(N'2017-02-26 13:49:30.467' AS DateTime), CAST(N'2017-02-26 13:49:30.467' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (789, 13, 504, 1, CAST(N'2017-02-26 15:50:00.000' AS DateTime), CAST(N'2017-02-26 13:50:35.157' AS DateTime), CAST(N'2017-02-26 13:50:35.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (790, 13, 183, 1, CAST(N'2017-02-26 15:50:00.000' AS DateTime), CAST(N'2017-02-26 13:50:56.853' AS DateTime), CAST(N'2017-02-26 13:50:56.853' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (791, 13, 477, 1, CAST(N'2017-02-26 15:51:00.000' AS DateTime), CAST(N'2017-02-26 13:51:20.680' AS DateTime), CAST(N'2017-02-26 13:51:20.680' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (792, 13, 55, 1, CAST(N'2017-02-26 15:51:00.000' AS DateTime), CAST(N'2017-02-26 13:51:43.963' AS DateTime), CAST(N'2017-02-26 13:51:43.963' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (793, 13, 23, 1, CAST(N'2017-02-26 15:52:00.000' AS DateTime), CAST(N'2017-02-26 13:52:37.860' AS DateTime), CAST(N'2017-02-26 13:52:37.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (794, 13, 520, 1, CAST(N'2017-02-26 15:52:00.000' AS DateTime), CAST(N'2017-02-26 13:52:49.740' AS DateTime), CAST(N'2017-02-26 13:52:49.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (795, 13, 359, 1, CAST(N'2017-02-26 15:53:00.000' AS DateTime), CAST(N'2017-02-26 13:53:05.830' AS DateTime), CAST(N'2017-02-26 13:53:05.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (796, 13, 237, 1, CAST(N'2017-02-26 15:54:00.000' AS DateTime), CAST(N'2017-02-26 13:53:25.303' AS DateTime), CAST(N'2017-02-26 13:53:25.303' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (797, 13, 224, 1, CAST(N'2017-02-26 15:53:00.000' AS DateTime), CAST(N'2017-02-26 13:53:55.690' AS DateTime), CAST(N'2017-02-26 13:53:55.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (798, 13, 385, 1, CAST(N'2017-02-26 15:54:00.000' AS DateTime), CAST(N'2017-02-26 13:54:19.907' AS DateTime), CAST(N'2017-02-26 13:54:19.907' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (799, 13, 29, 1, CAST(N'2017-02-26 15:56:00.000' AS DateTime), CAST(N'2017-02-26 13:54:37.727' AS DateTime), CAST(N'2017-02-26 13:54:37.727' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (800, 13, 433, 1, CAST(N'2017-02-26 15:54:00.000' AS DateTime), CAST(N'2017-02-26 13:54:55.940' AS DateTime), CAST(N'2017-02-26 13:54:55.940' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (801, 13, 186, 1, CAST(N'2017-02-26 15:55:00.000' AS DateTime), CAST(N'2017-02-26 13:55:40.970' AS DateTime), CAST(N'2017-02-26 13:55:40.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (802, 13, 27, 1, CAST(N'2017-02-26 15:56:00.000' AS DateTime), CAST(N'2017-02-26 13:56:09.570' AS DateTime), CAST(N'2017-02-26 13:56:09.570' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (803, 13, 98, 1, CAST(N'2017-02-26 15:56:00.000' AS DateTime), CAST(N'2017-02-26 13:56:26.430' AS DateTime), CAST(N'2017-02-26 13:56:26.430' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (804, 13, 99, 1, CAST(N'2017-02-26 15:56:00.000' AS DateTime), CAST(N'2017-02-26 13:56:50.017' AS DateTime), CAST(N'2017-02-26 13:56:50.017' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (805, 13, 238, 1, CAST(N'2017-02-26 15:56:00.000' AS DateTime), CAST(N'2017-02-26 13:56:52.750' AS DateTime), CAST(N'2017-02-26 13:56:52.750' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (806, 13, 136, 1, CAST(N'2017-02-26 15:57:00.000' AS DateTime), CAST(N'2017-02-26 13:57:02.030' AS DateTime), CAST(N'2017-02-26 13:57:02.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (807, 13, 206, 1, CAST(N'2017-02-26 15:57:00.000' AS DateTime), CAST(N'2017-02-26 13:57:10.977' AS DateTime), CAST(N'2017-02-26 13:57:10.977' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (808, 13, 486, 1, CAST(N'2017-02-26 15:57:00.000' AS DateTime), CAST(N'2017-02-26 13:57:20.257' AS DateTime), CAST(N'2017-02-26 13:57:20.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (809, 13, 66, 1, CAST(N'2017-02-26 15:57:00.000' AS DateTime), CAST(N'2017-02-26 13:57:34.830' AS DateTime), CAST(N'2017-02-26 13:57:34.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (810, 13, 123, 1, CAST(N'2017-02-26 15:57:00.000' AS DateTime), CAST(N'2017-02-26 13:57:41.370' AS DateTime), CAST(N'2017-02-26 13:57:41.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (811, 13, 196, 1, CAST(N'2017-02-26 15:57:00.000' AS DateTime), CAST(N'2017-02-26 13:57:51.487' AS DateTime), CAST(N'2017-02-26 13:57:51.487' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (812, 13, 432, 1, CAST(N'2017-02-26 15:58:00.000' AS DateTime), CAST(N'2017-02-26 13:58:06.643' AS DateTime), CAST(N'2017-02-26 13:58:06.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (813, 13, 102, 1, CAST(N'2017-02-26 15:59:00.000' AS DateTime), CAST(N'2017-02-26 13:59:02.507' AS DateTime), CAST(N'2017-02-26 13:59:02.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (814, 13, 319, 1, CAST(N'2017-02-26 15:59:00.000' AS DateTime), CAST(N'2017-02-26 13:59:44.253' AS DateTime), CAST(N'2017-02-26 13:59:44.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (815, 13, 117, 1, CAST(N'2017-02-26 16:00:00.000' AS DateTime), CAST(N'2017-02-26 14:00:03.483' AS DateTime), CAST(N'2017-02-26 14:00:03.483' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (816, 13, 162, 1, CAST(N'2017-02-26 16:00:00.000' AS DateTime), CAST(N'2017-02-26 14:00:24.347' AS DateTime), CAST(N'2017-02-26 14:00:24.347' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (817, 13, 440, 1, CAST(N'2017-02-26 16:00:00.000' AS DateTime), CAST(N'2017-02-26 14:00:48.953' AS DateTime), CAST(N'2017-02-26 14:00:48.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (818, 13, 125, 1, CAST(N'2017-02-26 16:01:00.000' AS DateTime), CAST(N'2017-02-26 14:01:14.953' AS DateTime), CAST(N'2017-02-26 14:01:14.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (819, 13, 83, 1, CAST(N'2017-02-26 16:01:00.000' AS DateTime), CAST(N'2017-02-26 14:01:41.063' AS DateTime), CAST(N'2017-02-26 14:01:41.063' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (820, 13, 335, 1, CAST(N'2017-02-26 16:03:00.000' AS DateTime), CAST(N'2017-02-26 14:03:40.837' AS DateTime), CAST(N'2017-02-26 14:03:40.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (821, 13, 308, 1, CAST(N'2017-02-26 16:03:00.000' AS DateTime), CAST(N'2017-02-26 14:03:55.570' AS DateTime), CAST(N'2017-02-26 14:03:55.570' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (822, 13, 363, 1, CAST(N'2017-02-26 16:04:00.000' AS DateTime), CAST(N'2017-02-26 14:04:38.693' AS DateTime), CAST(N'2017-02-26 14:04:38.693' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (823, 13, 361, 1, CAST(N'2017-02-26 16:07:00.000' AS DateTime), CAST(N'2017-02-26 14:04:43.423' AS DateTime), CAST(N'2017-02-26 14:04:43.423' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (824, 13, 135, 1, CAST(N'2017-02-26 16:05:00.000' AS DateTime), CAST(N'2017-02-26 14:05:00.613' AS DateTime), CAST(N'2017-02-26 14:05:00.613' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (825, 13, 150, 1, CAST(N'2017-02-26 16:06:00.000' AS DateTime), CAST(N'2017-02-26 14:06:53.247' AS DateTime), CAST(N'2017-02-26 14:06:53.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (826, 13, 424, 1, CAST(N'2017-02-26 16:07:00.000' AS DateTime), CAST(N'2017-02-26 14:07:54.550' AS DateTime), CAST(N'2017-02-26 14:07:54.550' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (827, 13, 82, 1, CAST(N'2017-02-26 16:08:00.000' AS DateTime), CAST(N'2017-02-26 14:08:08.027' AS DateTime), CAST(N'2017-02-26 14:08:08.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (828, 13, 62, 1, CAST(N'2017-02-26 16:09:00.000' AS DateTime), CAST(N'2017-02-26 14:09:38.213' AS DateTime), CAST(N'2017-02-26 14:09:38.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (829, 13, 80, 1, CAST(N'2017-02-26 16:20:00.000' AS DateTime), CAST(N'2017-02-26 14:09:59.833' AS DateTime), CAST(N'2017-02-26 14:09:59.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (830, 13, 84, 1, CAST(N'2017-02-26 16:10:00.000' AS DateTime), CAST(N'2017-02-26 14:10:23.713' AS DateTime), CAST(N'2017-02-26 14:10:23.713' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (831, 13, 344, 1, CAST(N'2017-02-26 16:18:00.000' AS DateTime), CAST(N'2017-02-26 14:12:06.897' AS DateTime), CAST(N'2017-02-26 14:12:06.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (832, 13, 205, 1, CAST(N'2017-02-26 16:15:00.000' AS DateTime), CAST(N'2017-02-26 14:12:40.703' AS DateTime), CAST(N'2017-02-26 14:12:40.703' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (833, 13, 502, 1, CAST(N'2017-02-26 16:12:00.000' AS DateTime), CAST(N'2017-02-26 14:12:50.853' AS DateTime), CAST(N'2017-02-26 14:12:50.853' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (834, 13, 212, 1, CAST(N'2017-02-26 16:13:00.000' AS DateTime), CAST(N'2017-02-26 14:13:03.203' AS DateTime), CAST(N'2017-02-26 14:13:03.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (835, 13, 94, 1, CAST(N'2017-02-26 16:13:00.000' AS DateTime), CAST(N'2017-02-26 14:13:24.610' AS DateTime), CAST(N'2017-02-26 14:13:24.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (836, 13, 56, 1, CAST(N'2017-02-26 16:13:00.000' AS DateTime), CAST(N'2017-02-26 14:13:34.083' AS DateTime), CAST(N'2017-02-26 14:13:34.083' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (837, 13, 115, 1, CAST(N'2017-02-26 16:23:00.000' AS DateTime), CAST(N'2017-02-26 14:14:25.237' AS DateTime), CAST(N'2017-02-26 14:14:25.237' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (838, 13, 70, 1, CAST(N'2017-02-26 16:28:00.000' AS DateTime), CAST(N'2017-02-26 14:14:50.860' AS DateTime), CAST(N'2017-02-26 14:14:50.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (839, 13, 45, 1, CAST(N'2017-02-26 16:27:00.000' AS DateTime), CAST(N'2017-02-26 14:15:11.480' AS DateTime), CAST(N'2017-02-26 14:15:11.480' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (840, 13, 184, 1, CAST(N'2017-02-26 16:15:00.000' AS DateTime), CAST(N'2017-02-26 14:15:19.820' AS DateTime), CAST(N'2017-02-26 14:15:19.820' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (841, 13, 215, 1, CAST(N'2017-02-26 16:16:00.000' AS DateTime), CAST(N'2017-02-26 14:16:37.547' AS DateTime), CAST(N'2017-02-26 14:16:37.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (842, 13, 271, 1, CAST(N'2017-02-26 16:17:00.000' AS DateTime), CAST(N'2017-02-26 14:18:00.013' AS DateTime), CAST(N'2017-02-26 14:18:00.013' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (843, 13, 355, 1, CAST(N'2017-02-26 16:18:00.000' AS DateTime), CAST(N'2017-02-26 14:18:03.913' AS DateTime), CAST(N'2017-02-26 14:18:03.913' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (844, 13, 192, 1, CAST(N'2017-02-26 16:19:00.000' AS DateTime), CAST(N'2017-02-26 14:19:18.827' AS DateTime), CAST(N'2017-02-26 14:19:18.827' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (845, 13, 168, 1, CAST(N'2017-02-26 16:19:00.000' AS DateTime), CAST(N'2017-02-26 14:19:39.533' AS DateTime), CAST(N'2017-02-26 14:19:39.533' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (846, 13, 122, 1, CAST(N'2017-02-26 16:20:00.000' AS DateTime), CAST(N'2017-02-26 14:20:17.553' AS DateTime), CAST(N'2017-02-26 14:20:17.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (847, 13, 299, 1, CAST(N'2017-02-26 16:21:00.000' AS DateTime), CAST(N'2017-02-26 14:21:05.293' AS DateTime), CAST(N'2017-02-26 14:21:05.293' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (848, 13, 314, 1, CAST(N'2017-02-26 16:24:00.000' AS DateTime), CAST(N'2017-02-26 14:24:13.340' AS DateTime), CAST(N'2017-02-26 14:24:13.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (849, 13, 389, 1, CAST(N'2017-02-26 16:24:00.000' AS DateTime), CAST(N'2017-02-26 14:24:58.960' AS DateTime), CAST(N'2017-02-26 14:24:58.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (850, 13, 354, 1, CAST(N'2017-02-26 16:27:00.000' AS DateTime), CAST(N'2017-02-26 14:25:35.617' AS DateTime), CAST(N'2017-02-26 14:25:35.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (851, 13, 301, 1, CAST(N'2017-02-26 16:26:00.000' AS DateTime), CAST(N'2017-02-26 14:26:50.183' AS DateTime), CAST(N'2017-02-26 14:26:50.183' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (852, 13, 327, 1, CAST(N'2017-02-26 16:29:00.000' AS DateTime), CAST(N'2017-02-26 14:29:12.427' AS DateTime), CAST(N'2017-02-26 14:29:12.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (853, 13, 536, 1, CAST(N'2017-02-26 16:30:00.000' AS DateTime), CAST(N'2017-02-26 14:30:26.290' AS DateTime), CAST(N'2017-02-26 14:30:26.290' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (854, 13, 539, 1, CAST(N'2017-02-26 16:30:00.000' AS DateTime), CAST(N'2017-02-26 14:30:31.547' AS DateTime), CAST(N'2017-02-26 14:30:31.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (855, 13, 495, 1, CAST(N'2017-02-26 16:31:00.000' AS DateTime), CAST(N'2017-02-26 14:31:13.930' AS DateTime), CAST(N'2017-02-26 14:31:13.930' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (856, 13, 116, 1, CAST(N'2017-02-26 16:31:00.000' AS DateTime), CAST(N'2017-02-26 14:31:45.810' AS DateTime), CAST(N'2017-02-26 14:31:45.810' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (857, 13, 535, 1, CAST(N'2017-02-26 16:32:00.000' AS DateTime), CAST(N'2017-02-26 14:32:21.700' AS DateTime), CAST(N'2017-02-26 14:32:21.700' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (858, 13, 353, 1, CAST(N'2017-02-26 16:33:00.000' AS DateTime), CAST(N'2017-02-26 14:33:49.000' AS DateTime), CAST(N'2017-02-26 14:33:49.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (859, 13, 365, 1, CAST(N'2017-02-26 16:35:00.000' AS DateTime), CAST(N'2017-02-26 14:35:46.237' AS DateTime), CAST(N'2017-02-26 14:35:46.237' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (860, 13, 22, 1, CAST(N'2017-02-26 16:37:00.000' AS DateTime), CAST(N'2017-02-26 14:37:06.693' AS DateTime), CAST(N'2017-02-26 14:37:06.693' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (861, 13, 352, 1, CAST(N'2017-02-26 16:37:00.000' AS DateTime), CAST(N'2017-02-26 14:37:27.957' AS DateTime), CAST(N'2017-02-26 14:37:27.957' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (862, 13, 172, 1, CAST(N'2017-02-26 16:39:00.000' AS DateTime), CAST(N'2017-02-26 14:39:08.203' AS DateTime), CAST(N'2017-02-26 14:39:08.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (863, 13, 216, 1, CAST(N'2017-02-26 16:39:00.000' AS DateTime), CAST(N'2017-02-26 14:39:37.627' AS DateTime), CAST(N'2017-02-26 14:39:37.627' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (864, 13, 222, 1, CAST(N'2017-02-26 16:40:00.000' AS DateTime), CAST(N'2017-02-26 14:40:54.777' AS DateTime), CAST(N'2017-02-26 14:40:54.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (865, 13, 77, 1, CAST(N'2017-02-26 16:45:00.000' AS DateTime), CAST(N'2017-02-26 14:45:38.593' AS DateTime), CAST(N'2017-02-26 14:45:38.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (866, 13, 38, 1, CAST(N'2017-02-26 16:49:00.000' AS DateTime), CAST(N'2017-02-26 14:49:25.407' AS DateTime), CAST(N'2017-02-26 14:49:25.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (867, 13, 268, 1, CAST(N'2017-02-26 16:56:00.000' AS DateTime), CAST(N'2017-02-26 14:56:52.470' AS DateTime), CAST(N'2017-02-26 14:56:52.470' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (868, 13, 144, 1, CAST(N'2017-02-26 16:57:00.000' AS DateTime), CAST(N'2017-02-26 14:57:54.780' AS DateTime), CAST(N'2017-02-26 14:57:54.780' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (869, 13, 342, 1, CAST(N'2017-02-26 16:59:00.000' AS DateTime), CAST(N'2017-02-26 14:59:39.513' AS DateTime), CAST(N'2017-02-26 14:59:39.513' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (870, 13, 4, 1, CAST(N'2017-02-26 17:01:00.000' AS DateTime), CAST(N'2017-02-26 15:01:47.580' AS DateTime), CAST(N'2017-02-26 15:01:47.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (871, 13, 277, 1, CAST(N'2017-02-26 17:02:00.000' AS DateTime), CAST(N'2017-02-26 15:03:00.053' AS DateTime), CAST(N'2017-02-26 15:03:00.053' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (872, 13, 374, 1, CAST(N'2017-02-26 17:06:00.000' AS DateTime), CAST(N'2017-02-26 15:06:18.640' AS DateTime), CAST(N'2017-02-26 15:06:18.640' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (873, 13, 305, 1, CAST(N'2017-02-26 17:12:00.000' AS DateTime), CAST(N'2017-02-26 15:12:50.117' AS DateTime), CAST(N'2017-02-26 15:12:50.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (874, 13, 221, 1, CAST(N'2017-02-26 17:15:00.000' AS DateTime), CAST(N'2017-02-26 15:15:54.590' AS DateTime), CAST(N'2017-02-26 15:15:54.590' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (875, 13, 462, 1, CAST(N'2017-02-26 17:28:00.000' AS DateTime), CAST(N'2017-02-26 15:28:04.523' AS DateTime), CAST(N'2017-02-26 15:28:04.523' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (876, 13, 51, 1, CAST(N'2017-02-26 17:29:00.000' AS DateTime), CAST(N'2017-02-26 15:29:16.173' AS DateTime), CAST(N'2017-02-26 15:29:16.173' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (877, 13, 182, 1, CAST(N'2017-02-26 18:10:00.000' AS DateTime), CAST(N'2017-02-26 16:10:51.460' AS DateTime), CAST(N'2017-02-26 16:10:51.460' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (878, 14, 51, 1, CAST(N'2017-03-05 16:58:00.000' AS DateTime), CAST(N'2017-03-05 14:58:07.847' AS DateTime), CAST(N'2017-03-05 14:58:07.847' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (879, 14, 433, 1, CAST(N'2017-03-05 16:58:00.000' AS DateTime), CAST(N'2017-03-05 14:58:20.487' AS DateTime), CAST(N'2017-03-05 14:58:20.487' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (880, 14, 36, 1, CAST(N'2017-03-05 17:00:00.000' AS DateTime), CAST(N'2017-03-05 15:00:31.323' AS DateTime), CAST(N'2017-03-05 15:00:31.323' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (881, 14, 77, 1, CAST(N'2017-03-05 17:01:00.000' AS DateTime), CAST(N'2017-03-05 15:01:42.340' AS DateTime), CAST(N'2017-03-05 15:01:42.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (882, 14, 83, 1, CAST(N'2017-03-05 17:02:00.000' AS DateTime), CAST(N'2017-03-05 15:02:13.670' AS DateTime), CAST(N'2017-03-05 15:02:13.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (883, 14, 84, 1, CAST(N'2017-03-05 17:02:00.000' AS DateTime), CAST(N'2017-03-05 15:02:26.690' AS DateTime), CAST(N'2017-03-05 15:02:26.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (884, 14, 85, 1, CAST(N'2017-03-05 17:02:00.000' AS DateTime), CAST(N'2017-03-05 15:02:39.720' AS DateTime), CAST(N'2017-03-05 15:02:39.720' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (885, 14, 94, 1, CAST(N'2017-03-05 17:02:00.000' AS DateTime), CAST(N'2017-03-05 15:02:59.610' AS DateTime), CAST(N'2017-03-05 15:02:59.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (886, 14, 111, 1, CAST(N'2017-03-05 17:04:00.000' AS DateTime), CAST(N'2017-03-05 15:04:32.970' AS DateTime), CAST(N'2017-03-05 15:04:32.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (887, 14, 56, 1, CAST(N'2017-03-05 17:04:00.000' AS DateTime), CAST(N'2017-03-05 15:04:44.853' AS DateTime), CAST(N'2017-03-05 15:04:44.853' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (888, 14, 55, 1, CAST(N'2017-03-05 17:05:00.000' AS DateTime), CAST(N'2017-03-05 15:05:07.623' AS DateTime), CAST(N'2017-03-05 15:05:07.623' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (889, 14, 62, 1, CAST(N'2017-03-05 17:05:00.000' AS DateTime), CAST(N'2017-03-05 15:05:18.207' AS DateTime), CAST(N'2017-03-05 15:05:18.207' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (890, 14, 117, 1, CAST(N'2017-03-05 17:05:00.000' AS DateTime), CAST(N'2017-03-05 15:06:00.767' AS DateTime), CAST(N'2017-03-05 15:06:00.767' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (891, 14, 121, 1, CAST(N'2017-03-05 17:06:00.000' AS DateTime), CAST(N'2017-03-05 15:06:36.883' AS DateTime), CAST(N'2017-03-05 15:06:36.883' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (892, 14, 432, 1, CAST(N'2017-03-05 17:07:00.000' AS DateTime), CAST(N'2017-03-05 15:07:01.890' AS DateTime), CAST(N'2017-03-05 15:07:01.890' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (893, 14, 133, 1, CAST(N'2017-03-05 17:22:00.000' AS DateTime), CAST(N'2017-03-05 15:07:10.213' AS DateTime), CAST(N'2017-03-05 15:07:10.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (894, 14, 29, 1, CAST(N'2017-03-05 17:07:00.000' AS DateTime), CAST(N'2017-03-05 15:07:12.597' AS DateTime), CAST(N'2017-03-05 15:07:12.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (895, 14, 385, 1, CAST(N'2017-03-05 17:18:00.000' AS DateTime), CAST(N'2017-03-05 15:07:18.810' AS DateTime), CAST(N'2017-03-05 15:07:18.810' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (896, 14, 135, 1, CAST(N'2017-03-05 17:07:00.000' AS DateTime), CAST(N'2017-03-05 15:07:33.717' AS DateTime), CAST(N'2017-03-05 15:07:33.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (897, 14, 43, 1, CAST(N'2017-03-05 17:08:00.000' AS DateTime), CAST(N'2017-03-05 15:07:38.840' AS DateTime), CAST(N'2017-03-05 15:07:38.840' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (898, 14, 143, 1, CAST(N'2017-03-05 17:07:00.000' AS DateTime), CAST(N'2017-03-05 15:07:51.070' AS DateTime), CAST(N'2017-03-05 15:07:51.070' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (899, 14, 271, 1, CAST(N'2017-03-05 17:15:00.000' AS DateTime), CAST(N'2017-03-05 15:07:52.907' AS DateTime), CAST(N'2017-03-05 15:07:52.907' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (900, 14, 162, 1, CAST(N'2017-03-05 17:08:00.000' AS DateTime), CAST(N'2017-03-05 15:08:07.033' AS DateTime), CAST(N'2017-03-05 15:08:07.033' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (901, 14, 158, 1, CAST(N'2017-03-05 17:09:00.000' AS DateTime), CAST(N'2017-03-05 15:08:18.720' AS DateTime), CAST(N'2017-03-05 15:08:18.720' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (902, 14, 45, 1, CAST(N'2017-03-05 17:09:00.000' AS DateTime), CAST(N'2017-03-05 15:08:27.837' AS DateTime), CAST(N'2017-03-05 15:08:27.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (903, 14, 359, 1, CAST(N'2017-03-05 17:08:00.000' AS DateTime), CAST(N'2017-03-05 15:08:51.680' AS DateTime), CAST(N'2017-03-05 15:08:51.680' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (904, 14, 237, 1, CAST(N'2017-03-05 17:22:00.000' AS DateTime), CAST(N'2017-03-05 15:09:30.087' AS DateTime), CAST(N'2017-03-05 15:09:30.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (905, 14, 520, 1, CAST(N'2017-03-05 17:09:00.000' AS DateTime), CAST(N'2017-03-05 15:09:35.167' AS DateTime), CAST(N'2017-03-05 15:09:35.167' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (906, 14, 179, 1, CAST(N'2017-03-05 17:09:00.000' AS DateTime), CAST(N'2017-03-05 15:09:36.420' AS DateTime), CAST(N'2017-03-05 15:09:36.420' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (907, 14, 168, 1, CAST(N'2017-03-05 17:10:00.000' AS DateTime), CAST(N'2017-03-05 15:10:32.767' AS DateTime), CAST(N'2017-03-05 15:10:32.767' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (908, 14, 197, 1, CAST(N'2017-03-05 17:11:00.000' AS DateTime), CAST(N'2017-03-05 15:11:24.393' AS DateTime), CAST(N'2017-03-05 15:11:24.393' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (909, 14, 299, 1, CAST(N'2017-03-05 17:21:00.000' AS DateTime), CAST(N'2017-03-05 15:11:35.437' AS DateTime), CAST(N'2017-03-05 15:11:35.437' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (910, 14, 515, 1, CAST(N'2017-03-05 17:21:00.000' AS DateTime), CAST(N'2017-03-05 15:11:41.757' AS DateTime), CAST(N'2017-03-05 15:11:41.757' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (911, 14, 98, 1, CAST(N'2017-03-05 17:11:00.000' AS DateTime), CAST(N'2017-03-05 15:11:42.420' AS DateTime), CAST(N'2017-03-05 15:11:42.420' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (912, 14, 215, 1, CAST(N'2017-03-05 17:11:00.000' AS DateTime), CAST(N'2017-03-05 15:11:59.707' AS DateTime), CAST(N'2017-03-05 15:11:59.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (913, 14, 156, 1, CAST(N'2017-03-05 17:12:00.000' AS DateTime), CAST(N'2017-03-05 15:12:19.877' AS DateTime), CAST(N'2017-03-05 15:12:19.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (914, 14, 205, 1, CAST(N'2017-03-05 17:12:00.000' AS DateTime), CAST(N'2017-03-05 15:12:49.507' AS DateTime), CAST(N'2017-03-05 15:12:49.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (915, 14, 221, 1, CAST(N'2017-03-05 17:13:00.000' AS DateTime), CAST(N'2017-03-05 15:13:48.430' AS DateTime), CAST(N'2017-03-05 15:13:48.430' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (916, 14, 35, 1, CAST(N'2017-03-05 17:14:00.000' AS DateTime), CAST(N'2017-03-05 15:14:07.490' AS DateTime), CAST(N'2017-03-05 15:14:07.490' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (917, 14, 206, 1, CAST(N'2017-03-05 17:14:00.000' AS DateTime), CAST(N'2017-03-05 15:14:30.037' AS DateTime), CAST(N'2017-03-05 15:14:30.037' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (918, 14, 138, 1, CAST(N'2017-03-05 17:14:00.000' AS DateTime), CAST(N'2017-03-05 15:14:57.980' AS DateTime), CAST(N'2017-03-05 15:14:57.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (919, 14, 424, 1, CAST(N'2017-03-05 17:14:00.000' AS DateTime), CAST(N'2017-03-05 15:15:00.163' AS DateTime), CAST(N'2017-03-05 15:15:00.163' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (920, 14, 504, 1, CAST(N'2017-03-05 17:15:00.000' AS DateTime), CAST(N'2017-03-05 15:15:14.010' AS DateTime), CAST(N'2017-03-05 15:15:14.010' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (921, 14, 269, 1, CAST(N'2017-03-05 17:15:00.000' AS DateTime), CAST(N'2017-03-05 15:16:00.130' AS DateTime), CAST(N'2017-03-05 15:16:00.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (922, 14, 277, 1, CAST(N'2017-03-05 17:16:00.000' AS DateTime), CAST(N'2017-03-05 15:16:40.937' AS DateTime), CAST(N'2017-03-05 15:16:40.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (923, 14, 365, 1, CAST(N'2017-03-05 17:17:00.000' AS DateTime), CAST(N'2017-03-05 15:17:16.037' AS DateTime), CAST(N'2017-03-05 15:17:16.037' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (924, 14, 192, 1, CAST(N'2017-03-05 17:17:00.000' AS DateTime), CAST(N'2017-03-05 15:17:54.117' AS DateTime), CAST(N'2017-03-05 15:17:54.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (925, 14, 238, 1, CAST(N'2017-03-05 17:18:00.000' AS DateTime), CAST(N'2017-03-05 15:18:09.630' AS DateTime), CAST(N'2017-03-05 15:18:09.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (926, 14, 222, 1, CAST(N'2017-03-05 17:19:00.000' AS DateTime), CAST(N'2017-03-05 15:19:28.020' AS DateTime), CAST(N'2017-03-05 15:19:28.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (927, 14, 310, 1, CAST(N'2017-03-05 17:21:00.000' AS DateTime), CAST(N'2017-03-05 15:19:36.987' AS DateTime), CAST(N'2017-03-05 15:19:36.987' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (928, 14, 308, 1, CAST(N'2017-03-05 17:20:00.000' AS DateTime), CAST(N'2017-03-05 15:20:52.687' AS DateTime), CAST(N'2017-03-05 15:20:52.687' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (929, 14, 477, 1, CAST(N'2017-03-05 17:21:00.000' AS DateTime), CAST(N'2017-03-05 15:22:00.977' AS DateTime), CAST(N'2017-03-05 15:22:00.977' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (930, 14, 102, 1, CAST(N'2017-03-05 17:22:00.000' AS DateTime), CAST(N'2017-03-05 15:22:44.140' AS DateTime), CAST(N'2017-03-05 15:22:44.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (931, 14, 155, 1, CAST(N'2017-03-05 17:22:00.000' AS DateTime), CAST(N'2017-03-05 15:22:49.627' AS DateTime), CAST(N'2017-03-05 15:22:49.627' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (932, 14, 10, 1, CAST(N'2017-03-05 17:40:00.000' AS DateTime), CAST(N'2017-03-05 15:40:19.790' AS DateTime), CAST(N'2017-03-05 15:40:19.790' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (933, 14, 99, 1, CAST(N'2017-03-05 17:41:00.000' AS DateTime), CAST(N'2017-03-05 15:41:16.620' AS DateTime), CAST(N'2017-03-05 15:41:16.620' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (934, 14, 67, 1, CAST(N'2017-03-05 17:41:00.000' AS DateTime), CAST(N'2017-03-05 15:41:26.200' AS DateTime), CAST(N'2017-03-05 15:41:26.200' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (935, 14, 116, 1, CAST(N'2017-03-05 17:41:00.000' AS DateTime), CAST(N'2017-03-05 15:41:34.053' AS DateTime), CAST(N'2017-03-05 15:41:34.053' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (936, 14, 108, 1, CAST(N'2017-03-05 17:41:00.000' AS DateTime), CAST(N'2017-03-05 15:42:00.260' AS DateTime), CAST(N'2017-03-05 15:42:00.260' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (937, 14, 115, 1, CAST(N'2017-03-05 17:42:00.000' AS DateTime), CAST(N'2017-03-05 15:42:20.283' AS DateTime), CAST(N'2017-03-05 15:42:20.283' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (938, 14, 273, 1, CAST(N'2017-03-05 17:43:00.000' AS DateTime), CAST(N'2017-03-05 15:43:33.953' AS DateTime), CAST(N'2017-03-05 15:43:33.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (939, 14, 282, 1, CAST(N'2017-03-05 17:44:00.000' AS DateTime), CAST(N'2017-03-05 15:44:00.937' AS DateTime), CAST(N'2017-03-05 15:44:00.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (940, 14, 317, 1, CAST(N'2017-03-05 17:44:00.000' AS DateTime), CAST(N'2017-03-05 15:44:26.740' AS DateTime), CAST(N'2017-03-05 15:44:26.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (941, 14, 342, 1, CAST(N'2017-03-05 17:45:00.000' AS DateTime), CAST(N'2017-03-05 15:45:06.227' AS DateTime), CAST(N'2017-03-05 15:45:06.227' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (942, 14, 524, 1, CAST(N'2017-03-05 17:45:00.000' AS DateTime), CAST(N'2017-03-05 15:45:36.400' AS DateTime), CAST(N'2017-03-05 15:45:36.400' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (943, 14, 535, 1, CAST(N'2017-03-05 17:45:00.000' AS DateTime), CAST(N'2017-03-05 15:45:59.330' AS DateTime), CAST(N'2017-03-05 15:45:59.330' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (944, 14, 486, 1, CAST(N'2017-03-05 17:47:00.000' AS DateTime), CAST(N'2017-03-05 15:47:20.883' AS DateTime), CAST(N'2017-03-05 15:47:20.883' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (945, 14, 361, 1, CAST(N'2017-03-05 17:47:00.000' AS DateTime), CAST(N'2017-03-05 15:47:35.897' AS DateTime), CAST(N'2017-03-05 15:47:35.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (946, 14, 38, 1, CAST(N'2017-03-05 17:47:00.000' AS DateTime), CAST(N'2017-03-05 15:47:56.743' AS DateTime), CAST(N'2017-03-05 15:47:56.743' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (947, 14, 123, 1, CAST(N'2017-03-05 17:48:00.000' AS DateTime), CAST(N'2017-03-05 15:48:21.357' AS DateTime), CAST(N'2017-03-05 15:48:21.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (948, 14, 136, 1, CAST(N'2017-03-05 17:48:00.000' AS DateTime), CAST(N'2017-03-05 15:48:46.657' AS DateTime), CAST(N'2017-03-05 15:48:46.657' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (949, 14, 344, 1, CAST(N'2017-03-05 17:50:00.000' AS DateTime), CAST(N'2017-03-05 15:50:14.757' AS DateTime), CAST(N'2017-03-05 15:50:14.757' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (950, 14, 354, 1, CAST(N'2017-03-05 17:50:00.000' AS DateTime), CAST(N'2017-03-05 15:50:37.000' AS DateTime), CAST(N'2017-03-05 15:50:37.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (951, 14, 345, 1, CAST(N'2017-03-05 17:51:00.000' AS DateTime), CAST(N'2017-03-05 15:51:28.643' AS DateTime), CAST(N'2017-03-05 15:51:28.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (952, 14, 363, 1, CAST(N'2017-03-05 17:51:00.000' AS DateTime), CAST(N'2017-03-05 15:51:53.943' AS DateTime), CAST(N'2017-03-05 15:51:53.943' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (953, 14, 360, 1, CAST(N'2017-03-05 17:52:00.000' AS DateTime), CAST(N'2017-03-05 15:52:15.797' AS DateTime), CAST(N'2017-03-05 15:52:15.797' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (954, 14, 371, 1, CAST(N'2017-03-05 17:53:00.000' AS DateTime), CAST(N'2017-03-05 15:53:02.433' AS DateTime), CAST(N'2017-03-05 15:53:02.433' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (955, 14, 487, 1, CAST(N'2017-03-05 17:53:00.000' AS DateTime), CAST(N'2017-03-05 15:53:13.860' AS DateTime), CAST(N'2017-03-05 15:53:13.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (956, 14, 530, 1, CAST(N'2017-03-05 17:53:00.000' AS DateTime), CAST(N'2017-03-05 15:53:32.650' AS DateTime), CAST(N'2017-03-05 15:53:32.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (957, 14, 334, 1, CAST(N'2017-03-05 17:53:00.000' AS DateTime), CAST(N'2017-03-05 15:53:50.130' AS DateTime), CAST(N'2017-03-05 15:53:50.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (958, 14, 390, 1, CAST(N'2017-03-05 17:54:00.000' AS DateTime), CAST(N'2017-03-05 15:54:14.020' AS DateTime), CAST(N'2017-03-05 15:54:14.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (959, 14, 428, 1, CAST(N'2017-03-05 17:55:00.000' AS DateTime), CAST(N'2017-03-05 15:55:13.427' AS DateTime), CAST(N'2017-03-05 15:55:13.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (960, 14, 439, 1, CAST(N'2017-03-05 17:55:00.000' AS DateTime), CAST(N'2017-03-05 15:55:42.177' AS DateTime), CAST(N'2017-03-05 15:55:42.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (961, 14, 502, 1, CAST(N'2017-03-05 17:56:00.000' AS DateTime), CAST(N'2017-03-05 15:56:09.193' AS DateTime), CAST(N'2017-03-05 15:56:09.193' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (962, 14, 4, 1, CAST(N'2017-03-05 17:56:00.000' AS DateTime), CAST(N'2017-03-05 15:56:20.280' AS DateTime), CAST(N'2017-03-05 15:56:20.280' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (963, 14, 440, 1, CAST(N'2017-03-05 17:59:00.000' AS DateTime), CAST(N'2017-03-05 15:59:59.513' AS DateTime), CAST(N'2017-03-05 15:59:59.513' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (964, 14, 445, 1, CAST(N'2017-03-05 18:00:00.000' AS DateTime), CAST(N'2017-03-05 16:00:22.160' AS DateTime), CAST(N'2017-03-05 16:00:22.160' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (965, 14, 512, 1, CAST(N'2017-03-05 18:01:00.000' AS DateTime), CAST(N'2017-03-05 16:01:16.283' AS DateTime), CAST(N'2017-03-05 16:01:16.283' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (966, 14, 496, 1, CAST(N'2017-03-05 18:02:00.000' AS DateTime), CAST(N'2017-03-05 16:02:11.620' AS DateTime), CAST(N'2017-03-05 16:02:11.620' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (967, 14, 539, 1, CAST(N'2017-03-05 18:02:00.000' AS DateTime), CAST(N'2017-03-05 16:02:57.893' AS DateTime), CAST(N'2017-03-05 16:02:57.893' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (968, 14, 540, 1, CAST(N'2017-03-05 18:03:00.000' AS DateTime), CAST(N'2017-03-05 16:03:35.960' AS DateTime), CAST(N'2017-03-05 16:03:35.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (969, 14, 528, 1, CAST(N'2017-03-05 18:04:00.000' AS DateTime), CAST(N'2017-03-05 16:04:54.347' AS DateTime), CAST(N'2017-03-05 16:04:54.347' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (970, 14, 392, 1, CAST(N'2017-03-05 18:06:00.000' AS DateTime), CAST(N'2017-03-05 16:06:37.590' AS DateTime), CAST(N'2017-03-05 16:06:37.590' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (971, 14, 495, 1, CAST(N'2017-03-05 18:08:00.000' AS DateTime), CAST(N'2017-03-05 16:08:24.133' AS DateTime), CAST(N'2017-03-05 16:08:24.133' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (972, 14, 319, 1, CAST(N'2017-03-05 18:09:00.000' AS DateTime), CAST(N'2017-03-05 16:09:30.530' AS DateTime), CAST(N'2017-03-05 16:09:30.530' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (973, 14, 34, 1, CAST(N'2017-03-05 18:14:00.000' AS DateTime), CAST(N'2017-03-05 16:14:06.830' AS DateTime), CAST(N'2017-03-05 16:14:06.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (974, 14, 309, 1, CAST(N'2017-03-05 18:15:00.000' AS DateTime), CAST(N'2017-03-05 16:15:32.440' AS DateTime), CAST(N'2017-03-05 16:15:32.440' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (975, 14, 335, 1, CAST(N'2017-03-05 18:16:00.000' AS DateTime), CAST(N'2017-03-05 16:16:25.980' AS DateTime), CAST(N'2017-03-05 16:16:25.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (976, 14, 122, 1, CAST(N'2017-03-05 18:26:00.000' AS DateTime), CAST(N'2017-03-05 16:26:05.470' AS DateTime), CAST(N'2017-03-05 16:26:05.470' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (977, 14, 268, 1, CAST(N'2017-03-05 18:41:00.000' AS DateTime), CAST(N'2017-03-05 16:41:48.660' AS DateTime), CAST(N'2017-03-05 16:41:48.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (978, 14, 174, 1, CAST(N'2017-03-05 19:10:00.000' AS DateTime), CAST(N'2017-03-05 17:10:09.650' AS DateTime), CAST(N'2017-03-05 17:10:09.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (979, 14, 291, 1, CAST(N'2017-03-05 19:13:00.000' AS DateTime), CAST(N'2017-03-05 17:13:08.767' AS DateTime), CAST(N'2017-03-05 17:13:08.767' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (980, 14, 372, 1, CAST(N'2017-03-05 19:13:00.000' AS DateTime), CAST(N'2017-03-05 17:13:44.093' AS DateTime), CAST(N'2017-03-05 17:13:44.093' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (981, 16, 483, 1, CAST(N'2017-03-12 15:33:00.000' AS DateTime), CAST(N'2017-03-12 12:33:16.060' AS DateTime), CAST(N'2017-03-12 12:33:16.060' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (982, 16, 435, 1, CAST(N'2017-03-12 15:44:00.000' AS DateTime), CAST(N'2017-03-12 12:44:32.407' AS DateTime), CAST(N'2017-03-12 12:44:32.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (983, 16, 436, 1, CAST(N'2017-03-12 15:44:00.000' AS DateTime), CAST(N'2017-03-12 12:44:37.980' AS DateTime), CAST(N'2017-03-12 12:44:37.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (984, 16, 16, 1, CAST(N'2017-03-12 15:45:00.000' AS DateTime), CAST(N'2017-03-12 12:45:48.750' AS DateTime), CAST(N'2017-03-12 12:45:48.750' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (985, 16, 15, 1, CAST(N'2017-03-12 15:45:00.000' AS DateTime), CAST(N'2017-03-12 12:45:57.207' AS DateTime), CAST(N'2017-03-12 12:45:57.207' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (986, 16, 29, 1, CAST(N'2017-03-12 15:50:00.000' AS DateTime), CAST(N'2017-03-12 12:50:15.720' AS DateTime), CAST(N'2017-03-12 12:50:15.720' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (987, 16, 238, 1, CAST(N'2017-03-12 15:51:00.000' AS DateTime), CAST(N'2017-03-12 12:51:31.503' AS DateTime), CAST(N'2017-03-12 12:51:31.503' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (988, 16, 345, 1, CAST(N'2017-03-12 15:52:00.000' AS DateTime), CAST(N'2017-03-12 12:52:24.023' AS DateTime), CAST(N'2017-03-12 12:52:24.023' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (989, 16, 424, 1, CAST(N'2017-03-12 15:52:00.000' AS DateTime), CAST(N'2017-03-12 12:53:00.350' AS DateTime), CAST(N'2017-03-12 12:53:00.350' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (990, 16, 115, 1, CAST(N'2017-03-12 15:53:00.000' AS DateTime), CAST(N'2017-03-12 12:53:15.760' AS DateTime), CAST(N'2017-03-12 12:53:15.760' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (991, 16, 56, 1, CAST(N'2017-03-12 15:54:00.000' AS DateTime), CAST(N'2017-03-12 12:54:05.753' AS DateTime), CAST(N'2017-03-12 12:54:05.753' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (992, 16, 520, 1, CAST(N'2017-03-12 15:56:00.000' AS DateTime), CAST(N'2017-03-12 12:56:19.027' AS DateTime), CAST(N'2017-03-12 12:56:19.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (993, 16, 237, 1, CAST(N'2017-03-12 15:56:00.000' AS DateTime), CAST(N'2017-03-12 12:56:30.860' AS DateTime), CAST(N'2017-03-12 12:56:30.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (994, 16, 125, 1, CAST(N'2017-03-12 15:56:00.000' AS DateTime), CAST(N'2017-03-12 12:56:40.630' AS DateTime), CAST(N'2017-03-12 12:56:40.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (995, 16, 310, 1, CAST(N'2017-03-12 15:56:00.000' AS DateTime), CAST(N'2017-03-12 12:56:49.910' AS DateTime), CAST(N'2017-03-12 12:56:49.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (996, 16, 385, 1, CAST(N'2017-03-12 15:56:00.000' AS DateTime), CAST(N'2017-03-12 12:56:56.987' AS DateTime), CAST(N'2017-03-12 12:56:56.987' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (997, 16, 80, 1, CAST(N'2017-03-12 15:57:00.000' AS DateTime), CAST(N'2017-03-12 12:57:10.430' AS DateTime), CAST(N'2017-03-12 12:57:10.430' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (998, 16, 23, 1, CAST(N'2017-03-12 15:57:00.000' AS DateTime), CAST(N'2017-03-12 12:57:21.130' AS DateTime), CAST(N'2017-03-12 12:57:21.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (999, 16, 27, 1, CAST(N'2017-03-12 15:57:00.000' AS DateTime), CAST(N'2017-03-12 12:57:30.710' AS DateTime), CAST(N'2017-03-12 12:57:30.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1000, 16, 319, 1, CAST(N'2017-03-12 15:57:00.000' AS DateTime), CAST(N'2017-03-12 12:57:43.610' AS DateTime), CAST(N'2017-03-12 12:57:43.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1001, 16, 22, 1, CAST(N'2017-03-12 15:58:00.000' AS DateTime), CAST(N'2017-03-12 12:58:03.090' AS DateTime), CAST(N'2017-03-12 12:58:03.090' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1002, 16, 158, 1, CAST(N'2017-03-12 15:58:00.000' AS DateTime), CAST(N'2017-03-12 12:58:10.490' AS DateTime), CAST(N'2017-03-12 12:58:10.490' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1003, 16, 66, 1, CAST(N'2017-03-12 15:59:00.000' AS DateTime), CAST(N'2017-03-12 12:58:12.707' AS DateTime), CAST(N'2017-03-12 12:58:12.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1004, 16, 390, 1, CAST(N'2017-03-12 15:58:00.000' AS DateTime), CAST(N'2017-03-12 12:58:24.120' AS DateTime), CAST(N'2017-03-12 12:58:24.120' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1005, 16, 179, 1, CAST(N'2017-03-12 15:58:00.000' AS DateTime), CAST(N'2017-03-12 12:58:46.830' AS DateTime), CAST(N'2017-03-12 12:58:46.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1006, 16, 335, 1, CAST(N'2017-03-12 15:59:00.000' AS DateTime), CAST(N'2017-03-12 12:59:04.353' AS DateTime), CAST(N'2017-03-12 12:59:04.353' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1007, 16, 432, 1, CAST(N'2017-03-12 15:59:00.000' AS DateTime), CAST(N'2017-03-12 12:59:37.260' AS DateTime), CAST(N'2017-03-12 12:59:37.260' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1008, 16, 155, 1, CAST(N'2017-03-12 16:00:00.000' AS DateTime), CAST(N'2017-03-12 13:00:18.237' AS DateTime), CAST(N'2017-03-12 13:00:18.237' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1009, 16, 151, 1, CAST(N'2017-03-12 16:01:00.000' AS DateTime), CAST(N'2017-03-12 13:01:04.120' AS DateTime), CAST(N'2017-03-12 13:01:04.120' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1010, 16, 84, 1, CAST(N'2017-03-12 16:01:00.000' AS DateTime), CAST(N'2017-03-12 13:01:57.850' AS DateTime), CAST(N'2017-03-12 13:01:57.850' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1011, 16, 83, 1, CAST(N'2017-03-12 16:02:00.000' AS DateTime), CAST(N'2017-03-12 13:02:17.080' AS DateTime), CAST(N'2017-03-12 13:02:17.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1012, 16, 67, 1, CAST(N'2017-03-12 16:02:00.000' AS DateTime), CAST(N'2017-03-12 13:02:36.950' AS DateTime), CAST(N'2017-03-12 13:02:36.950' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1013, 16, 212, 1, CAST(N'2017-03-12 16:02:00.000' AS DateTime), CAST(N'2017-03-12 13:02:53.323' AS DateTime), CAST(N'2017-03-12 13:02:53.323' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1014, 16, 6, 1, CAST(N'2017-03-12 16:03:00.000' AS DateTime), CAST(N'2017-03-12 13:03:01.943' AS DateTime), CAST(N'2017-03-12 13:03:01.943' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1015, 16, 55, 1, CAST(N'2017-03-12 16:03:00.000' AS DateTime), CAST(N'2017-03-12 13:03:32.460' AS DateTime), CAST(N'2017-03-12 13:03:32.460' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1016, 16, 89, 1, CAST(N'2017-03-12 16:04:00.000' AS DateTime), CAST(N'2017-03-12 13:04:20.290' AS DateTime), CAST(N'2017-03-12 13:04:20.290' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1017, 16, 99, 1, CAST(N'2017-03-12 16:04:00.000' AS DateTime), CAST(N'2017-03-12 13:04:38.230' AS DateTime), CAST(N'2017-03-12 13:04:38.230' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1018, 16, 156, 1, CAST(N'2017-03-12 16:08:00.000' AS DateTime), CAST(N'2017-03-12 13:04:52.553' AS DateTime), CAST(N'2017-03-12 13:04:52.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1019, 16, 108, 1, CAST(N'2017-03-12 16:05:00.000' AS DateTime), CAST(N'2017-03-12 13:05:10.790' AS DateTime), CAST(N'2017-03-12 13:05:10.790' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1020, 16, 85, 1, CAST(N'2017-03-12 16:05:00.000' AS DateTime), CAST(N'2017-03-12 13:05:23.187' AS DateTime), CAST(N'2017-03-12 13:05:23.187' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1021, 16, 102, 1, CAST(N'2017-03-12 16:05:00.000' AS DateTime), CAST(N'2017-03-12 13:05:52.517' AS DateTime), CAST(N'2017-03-12 13:05:52.517' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1022, 16, 153, 1, CAST(N'2017-03-12 16:09:00.000' AS DateTime), CAST(N'2017-03-12 13:05:55.910' AS DateTime), CAST(N'2017-03-12 13:05:55.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1023, 16, 309, 1, CAST(N'2017-03-12 16:06:00.000' AS DateTime), CAST(N'2017-03-12 13:06:06.590' AS DateTime), CAST(N'2017-03-12 13:06:06.590' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1024, 16, 121, 1, CAST(N'2017-03-12 16:06:00.000' AS DateTime), CAST(N'2017-03-12 13:06:26.113' AS DateTime), CAST(N'2017-03-12 13:06:26.113' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1025, 16, 138, 1, CAST(N'2017-03-12 16:07:00.000' AS DateTime), CAST(N'2017-03-12 13:07:09.550' AS DateTime), CAST(N'2017-03-12 13:07:09.550' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1026, 16, 60, 1, CAST(N'2017-03-12 16:07:00.000' AS DateTime), CAST(N'2017-03-12 13:07:12.983' AS DateTime), CAST(N'2017-03-12 13:07:12.983' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1027, 16, 143, 1, CAST(N'2017-03-12 16:07:00.000' AS DateTime), CAST(N'2017-03-12 13:07:35.380' AS DateTime), CAST(N'2017-03-12 13:07:35.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1028, 16, 323, 1, CAST(N'2017-03-12 16:16:00.000' AS DateTime), CAST(N'2017-03-12 13:07:46.493' AS DateTime), CAST(N'2017-03-12 13:07:46.493' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1029, 16, 164, 1, CAST(N'2017-03-12 16:10:00.000' AS DateTime), CAST(N'2017-03-12 13:08:05.583' AS DateTime), CAST(N'2017-03-12 13:08:05.583' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1030, 16, 485, 1, CAST(N'2017-03-12 16:07:00.000' AS DateTime), CAST(N'2017-03-12 13:08:11.233' AS DateTime), CAST(N'2017-03-12 13:08:11.233' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1031, 16, 118, 1, CAST(N'2017-03-12 16:13:00.000' AS DateTime), CAST(N'2017-03-12 13:08:11.237' AS DateTime), CAST(N'2017-03-12 13:08:11.237' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1032, 16, 510, 1, CAST(N'2017-03-12 16:13:00.000' AS DateTime), CAST(N'2017-03-12 13:08:18.900' AS DateTime), CAST(N'2017-03-12 13:08:18.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1033, 16, 160, 1, CAST(N'2017-03-12 16:08:00.000' AS DateTime), CAST(N'2017-03-12 13:08:29.173' AS DateTime), CAST(N'2017-03-12 13:08:29.173' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1034, 16, 200, 1, CAST(N'2017-03-12 16:08:00.000' AS DateTime), CAST(N'2017-03-12 13:08:34.380' AS DateTime), CAST(N'2017-03-12 13:08:34.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1035, 16, 209, 1, CAST(N'2017-03-12 16:08:00.000' AS DateTime), CAST(N'2017-03-12 13:08:49.513' AS DateTime), CAST(N'2017-03-12 13:08:49.513' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1036, 16, 178, 1, CAST(N'2017-03-12 16:08:00.000' AS DateTime), CAST(N'2017-03-12 13:08:49.610' AS DateTime), CAST(N'2017-03-12 13:08:49.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1037, 16, 182, 1, CAST(N'2017-03-12 16:09:00.000' AS DateTime), CAST(N'2017-03-12 13:09:21.487' AS DateTime), CAST(N'2017-03-12 13:09:21.487' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1038, 16, 197, 1, CAST(N'2017-03-12 16:09:00.000' AS DateTime), CAST(N'2017-03-12 13:09:35.293' AS DateTime), CAST(N'2017-03-12 13:09:35.293' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1039, 16, 296, 1, CAST(N'2017-03-12 16:09:00.000' AS DateTime), CAST(N'2017-03-12 13:09:48.953' AS DateTime), CAST(N'2017-03-12 13:09:48.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1040, 16, 260, 1, CAST(N'2017-03-12 16:09:00.000' AS DateTime), CAST(N'2017-03-12 13:09:52.170' AS DateTime), CAST(N'2017-03-12 13:09:52.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1041, 16, 184, 1, CAST(N'2017-03-12 16:10:00.000' AS DateTime), CAST(N'2017-03-12 13:10:07.930' AS DateTime), CAST(N'2017-03-12 13:10:07.930' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1042, 16, 185, 1, CAST(N'2017-03-12 16:10:00.000' AS DateTime), CAST(N'2017-03-12 13:10:28.653' AS DateTime), CAST(N'2017-03-12 13:10:28.653' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1043, 16, 205, 1, CAST(N'2017-03-12 16:10:00.000' AS DateTime), CAST(N'2017-03-12 13:10:48.953' AS DateTime), CAST(N'2017-03-12 13:10:48.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1044, 16, 111, 1, CAST(N'2017-03-12 16:11:00.000' AS DateTime), CAST(N'2017-03-12 13:11:22.157' AS DateTime), CAST(N'2017-03-12 13:11:22.157' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1045, 16, 268, 1, CAST(N'2017-03-12 16:11:00.000' AS DateTime), CAST(N'2017-03-12 13:11:39.980' AS DateTime), CAST(N'2017-03-12 13:11:39.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1046, 16, 269, 1, CAST(N'2017-03-12 16:12:00.000' AS DateTime), CAST(N'2017-03-12 13:12:01.573' AS DateTime), CAST(N'2017-03-12 13:12:01.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1047, 16, 222, 1, CAST(N'2017-03-12 16:12:00.000' AS DateTime), CAST(N'2017-03-12 13:12:21.703' AS DateTime), CAST(N'2017-03-12 13:12:21.703' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1048, 16, 277, 1, CAST(N'2017-03-12 16:12:00.000' AS DateTime), CAST(N'2017-03-12 13:12:42.677' AS DateTime), CAST(N'2017-03-12 13:12:42.677' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1049, 16, 459, 1, CAST(N'2017-03-12 16:12:00.000' AS DateTime), CAST(N'2017-03-12 13:12:53.850' AS DateTime), CAST(N'2017-03-12 13:12:53.850' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1050, 16, 279, 1, CAST(N'2017-03-12 16:13:00.000' AS DateTime), CAST(N'2017-03-12 13:13:13.043' AS DateTime), CAST(N'2017-03-12 13:13:13.043' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1051, 16, 299, 1, CAST(N'2017-03-12 16:13:00.000' AS DateTime), CAST(N'2017-03-12 13:13:33.687' AS DateTime), CAST(N'2017-03-12 13:13:33.687' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1052, 16, 342, 1, CAST(N'2017-03-12 16:13:00.000' AS DateTime), CAST(N'2017-03-12 13:13:42.670' AS DateTime), CAST(N'2017-03-12 13:13:42.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1053, 16, 482, 1, CAST(N'2017-03-12 16:13:00.000' AS DateTime), CAST(N'2017-03-12 13:13:43.867' AS DateTime), CAST(N'2017-03-12 13:13:43.867' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1054, 16, 273, 1, CAST(N'2017-03-12 16:14:00.000' AS DateTime), CAST(N'2017-03-12 13:14:09.467' AS DateTime), CAST(N'2017-03-12 13:14:09.467' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1055, 16, 474, 1, CAST(N'2017-03-12 16:14:00.000' AS DateTime), CAST(N'2017-03-12 13:14:18.397' AS DateTime), CAST(N'2017-03-12 13:14:18.397' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1056, 16, 301, 1, CAST(N'2017-03-12 16:14:00.000' AS DateTime), CAST(N'2017-03-12 13:14:37.707' AS DateTime), CAST(N'2017-03-12 13:14:37.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1057, 16, 322, 1, CAST(N'2017-03-12 16:14:00.000' AS DateTime), CAST(N'2017-03-12 13:14:46.910' AS DateTime), CAST(N'2017-03-12 13:14:46.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1058, 16, 305, 1, CAST(N'2017-03-12 16:15:00.000' AS DateTime), CAST(N'2017-03-12 13:15:08.737' AS DateTime), CAST(N'2017-03-12 13:15:08.737' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1059, 16, 493, 1, CAST(N'2017-03-12 16:15:00.000' AS DateTime), CAST(N'2017-03-12 13:15:22.113' AS DateTime), CAST(N'2017-03-12 13:15:22.113' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1060, 16, 478, 1, CAST(N'2017-03-12 16:15:00.000' AS DateTime), CAST(N'2017-03-12 13:15:31.547' AS DateTime), CAST(N'2017-03-12 13:15:31.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1061, 16, 321, 1, CAST(N'2017-03-12 16:15:00.000' AS DateTime), CAST(N'2017-03-12 13:15:37.020' AS DateTime), CAST(N'2017-03-12 13:15:37.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1062, 16, 359, 1, CAST(N'2017-03-12 16:15:00.000' AS DateTime), CAST(N'2017-03-12 13:15:55.123' AS DateTime), CAST(N'2017-03-12 13:15:55.123' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1063, 16, 324, 1, CAST(N'2017-03-12 16:16:00.000' AS DateTime), CAST(N'2017-03-12 13:16:19.700' AS DateTime), CAST(N'2017-03-12 13:16:19.700' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1064, 16, 354, 1, CAST(N'2017-03-12 16:16:00.000' AS DateTime), CAST(N'2017-03-12 13:16:38.850' AS DateTime), CAST(N'2017-03-12 13:16:38.850' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1065, 16, 476, 1, CAST(N'2017-03-12 16:16:00.000' AS DateTime), CAST(N'2017-03-12 13:16:46.050' AS DateTime), CAST(N'2017-03-12 13:16:46.050' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1066, 16, 535, 1, CAST(N'2017-03-12 16:17:00.000' AS DateTime), CAST(N'2017-03-12 13:17:07.710' AS DateTime), CAST(N'2017-03-12 13:17:07.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1067, 16, 278, 1, CAST(N'2017-03-12 16:17:00.000' AS DateTime), CAST(N'2017-03-12 13:17:21.970' AS DateTime), CAST(N'2017-03-12 13:17:21.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1068, 16, 307, 1, CAST(N'2017-03-12 16:17:00.000' AS DateTime), CAST(N'2017-03-12 13:17:28.273' AS DateTime), CAST(N'2017-03-12 13:17:28.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1069, 16, 380, 1, CAST(N'2017-03-12 16:17:00.000' AS DateTime), CAST(N'2017-03-12 13:17:53.663' AS DateTime), CAST(N'2017-03-12 13:17:53.663' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1070, 16, 308, 1, CAST(N'2017-03-12 16:17:00.000' AS DateTime), CAST(N'2017-03-12 13:17:55.937' AS DateTime), CAST(N'2017-03-12 13:17:55.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1071, 16, 174, 1, CAST(N'2017-03-12 16:18:00.000' AS DateTime), CAST(N'2017-03-12 13:18:32.313' AS DateTime), CAST(N'2017-03-12 13:18:32.313' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1072, 16, 539, 1, CAST(N'2017-03-12 16:19:00.000' AS DateTime), CAST(N'2017-03-12 13:19:13.997' AS DateTime), CAST(N'2017-03-12 13:19:13.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1073, 16, 24, 1, CAST(N'2017-03-12 16:19:00.000' AS DateTime), CAST(N'2017-03-12 13:19:32.653' AS DateTime), CAST(N'2017-03-12 13:19:32.653' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1074, 16, 434, 1, CAST(N'2017-03-12 16:19:00.000' AS DateTime), CAST(N'2017-03-12 13:19:59.710' AS DateTime), CAST(N'2017-03-12 13:19:59.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1075, 16, 341, 1, CAST(N'2017-03-12 16:20:00.000' AS DateTime), CAST(N'2017-03-12 13:20:12.673' AS DateTime), CAST(N'2017-03-12 13:20:12.673' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1076, 16, 107, 1, CAST(N'2017-03-12 16:20:00.000' AS DateTime), CAST(N'2017-03-12 13:20:23.833' AS DateTime), CAST(N'2017-03-12 13:20:23.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1077, 16, 332, 1, CAST(N'2017-03-12 16:20:00.000' AS DateTime), CAST(N'2017-03-12 13:20:30.743' AS DateTime), CAST(N'2017-03-12 13:20:30.743' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1078, 16, 243, 1, CAST(N'2017-03-12 16:20:00.000' AS DateTime), CAST(N'2017-03-12 13:20:38.063' AS DateTime), CAST(N'2017-03-12 13:20:38.063' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1079, 16, 211, 1, CAST(N'2017-03-12 16:20:00.000' AS DateTime), CAST(N'2017-03-12 13:20:39.983' AS DateTime), CAST(N'2017-03-12 13:20:39.983' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1080, 16, 17, 1, CAST(N'2017-03-12 16:20:00.000' AS DateTime), CAST(N'2017-03-12 13:20:40.710' AS DateTime), CAST(N'2017-03-12 13:20:40.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1081, 16, 334, 1, CAST(N'2017-03-12 16:20:00.000' AS DateTime), CAST(N'2017-03-12 13:20:55.593' AS DateTime), CAST(N'2017-03-12 13:20:55.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1082, 16, 64, 1, CAST(N'2017-03-12 16:21:00.000' AS DateTime), CAST(N'2017-03-12 13:21:06.650' AS DateTime), CAST(N'2017-03-12 13:21:06.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1083, 16, 403, 1, CAST(N'2017-03-12 16:21:00.000' AS DateTime), CAST(N'2017-03-12 13:21:36.507' AS DateTime), CAST(N'2017-03-12 13:21:36.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1084, 16, 286, 1, CAST(N'2017-03-12 16:21:00.000' AS DateTime), CAST(N'2017-03-12 13:21:39.690' AS DateTime), CAST(N'2017-03-12 13:21:39.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1085, 16, 349, 1, CAST(N'2017-03-12 16:21:00.000' AS DateTime), CAST(N'2017-03-12 13:21:41.817' AS DateTime), CAST(N'2017-03-12 13:21:41.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1086, 16, 104, 1, CAST(N'2017-03-12 16:22:00.000' AS DateTime), CAST(N'2017-03-12 13:22:03.950' AS DateTime), CAST(N'2017-03-12 13:22:03.950' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1087, 16, 519, 1, CAST(N'2017-03-12 16:22:00.000' AS DateTime), CAST(N'2017-03-12 13:22:11.070' AS DateTime), CAST(N'2017-03-12 13:22:11.070' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1088, 16, 244, 1, CAST(N'2017-03-12 16:22:00.000' AS DateTime), CAST(N'2017-03-12 13:22:34.753' AS DateTime), CAST(N'2017-03-12 13:22:34.753' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1089, 16, 481, 1, CAST(N'2017-03-12 16:22:00.000' AS DateTime), CAST(N'2017-03-12 13:22:59.557' AS DateTime), CAST(N'2017-03-12 13:22:59.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1090, 16, 77, 1, CAST(N'2017-03-12 16:23:00.000' AS DateTime), CAST(N'2017-03-12 13:23:03.923' AS DateTime), CAST(N'2017-03-12 13:23:03.923' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1091, 16, 329, 1, CAST(N'2017-03-12 16:23:00.000' AS DateTime), CAST(N'2017-03-12 13:23:10.797' AS DateTime), CAST(N'2017-03-12 13:23:10.797' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1092, 16, 445, 1, CAST(N'2017-03-12 16:23:00.000' AS DateTime), CAST(N'2017-03-12 13:23:46.997' AS DateTime), CAST(N'2017-03-12 13:23:46.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1093, 16, 405, 1, CAST(N'2017-03-12 16:23:00.000' AS DateTime), CAST(N'2017-03-12 13:23:48.630' AS DateTime), CAST(N'2017-03-12 13:23:48.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1094, 16, 251, 1, CAST(N'2017-03-12 16:23:00.000' AS DateTime), CAST(N'2017-03-12 13:23:53.553' AS DateTime), CAST(N'2017-03-12 13:23:53.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1095, 16, 477, 1, CAST(N'2017-03-12 16:24:00.000' AS DateTime), CAST(N'2017-03-12 13:24:18.963' AS DateTime), CAST(N'2017-03-12 13:24:18.963' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1096, 16, 524, 1, CAST(N'2017-03-12 16:24:00.000' AS DateTime), CAST(N'2017-03-12 13:24:54.427' AS DateTime), CAST(N'2017-03-12 13:24:54.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1097, 16, 127, 1, CAST(N'2017-03-12 16:25:00.000' AS DateTime), CAST(N'2017-03-12 13:25:00.787' AS DateTime), CAST(N'2017-03-12 13:25:00.787' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1098, 16, 487, 1, CAST(N'2017-03-12 16:25:00.000' AS DateTime), CAST(N'2017-03-12 13:25:13.213' AS DateTime), CAST(N'2017-03-12 13:25:13.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1099, 16, 300, 1, CAST(N'2017-03-12 16:25:00.000' AS DateTime), CAST(N'2017-03-12 13:25:21.117' AS DateTime), CAST(N'2017-03-12 13:25:21.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1100, 16, 302, 1, CAST(N'2017-03-12 16:25:00.000' AS DateTime), CAST(N'2017-03-12 13:25:27.410' AS DateTime), CAST(N'2017-03-12 13:25:27.410' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1101, 16, 460, 1, CAST(N'2017-03-12 16:25:00.000' AS DateTime), CAST(N'2017-03-12 13:25:27.820' AS DateTime), CAST(N'2017-03-12 13:25:27.820' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1102, 16, 486, 1, CAST(N'2017-03-12 16:25:00.000' AS DateTime), CAST(N'2017-03-12 13:25:47.003' AS DateTime), CAST(N'2017-03-12 13:25:47.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1103, 16, 36, 1, CAST(N'2017-03-12 16:26:00.000' AS DateTime), CAST(N'2017-03-12 13:26:34.090' AS DateTime), CAST(N'2017-03-12 13:26:34.090' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1104, 16, 62, 1, CAST(N'2017-03-12 16:27:00.000' AS DateTime), CAST(N'2017-03-12 13:27:02.187' AS DateTime), CAST(N'2017-03-12 13:27:02.187' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1105, 16, 79, 1, CAST(N'2017-03-12 16:27:00.000' AS DateTime), CAST(N'2017-03-12 13:27:25.380' AS DateTime), CAST(N'2017-03-12 13:27:25.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1106, 16, 135, 1, CAST(N'2017-03-12 16:27:00.000' AS DateTime), CAST(N'2017-03-12 13:27:59.020' AS DateTime), CAST(N'2017-03-12 13:27:59.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1107, 16, 81, 1, CAST(N'2017-03-12 16:28:00.000' AS DateTime), CAST(N'2017-03-12 13:28:02.723' AS DateTime), CAST(N'2017-03-12 13:28:02.723' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1108, 16, 228, 1, CAST(N'2017-03-12 16:28:00.000' AS DateTime), CAST(N'2017-03-12 13:28:14.490' AS DateTime), CAST(N'2017-03-12 13:28:14.490' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1109, 16, 14, 1, CAST(N'2017-03-12 16:28:00.000' AS DateTime), CAST(N'2017-03-12 13:28:17.007' AS DateTime), CAST(N'2017-03-12 13:28:17.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1110, 16, 162, 1, CAST(N'2017-03-12 16:28:00.000' AS DateTime), CAST(N'2017-03-12 13:28:33.140' AS DateTime), CAST(N'2017-03-12 13:28:33.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1111, 16, 207, 1, CAST(N'2017-03-12 16:29:00.000' AS DateTime), CAST(N'2017-03-12 13:29:08.873' AS DateTime), CAST(N'2017-03-12 13:29:08.873' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1112, 16, 353, 1, CAST(N'2017-03-12 16:29:00.000' AS DateTime), CAST(N'2017-03-12 13:29:27.153' AS DateTime), CAST(N'2017-03-12 13:29:27.153' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1113, 16, 422, 1, CAST(N'2017-03-12 16:29:00.000' AS DateTime), CAST(N'2017-03-12 13:29:32.970' AS DateTime), CAST(N'2017-03-12 13:29:32.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1114, 16, 105, 1, CAST(N'2017-03-12 16:29:00.000' AS DateTime), CAST(N'2017-03-12 13:29:35.990' AS DateTime), CAST(N'2017-03-12 13:29:35.990' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1115, 16, 106, 1, CAST(N'2017-03-12 16:29:00.000' AS DateTime), CAST(N'2017-03-12 13:29:48.150' AS DateTime), CAST(N'2017-03-12 13:29:48.150' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1116, 16, 103, 1, CAST(N'2017-03-12 16:30:00.000' AS DateTime), CAST(N'2017-03-12 13:30:07.170' AS DateTime), CAST(N'2017-03-12 13:30:07.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1117, 16, 449, 1, CAST(N'2017-03-12 16:30:00.000' AS DateTime), CAST(N'2017-03-12 13:30:49.663' AS DateTime), CAST(N'2017-03-12 13:30:49.663' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1118, 16, 51, 1, CAST(N'2017-03-12 16:56:00.000' AS DateTime), CAST(N'2017-03-12 13:32:31.070' AS DateTime), CAST(N'2017-03-12 13:32:31.070' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1119, 16, 247, 1, CAST(N'2017-03-12 16:32:00.000' AS DateTime), CAST(N'2017-03-12 13:32:38.547' AS DateTime), CAST(N'2017-03-12 13:32:38.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1120, 16, 34, 1, CAST(N'2017-03-12 16:32:00.000' AS DateTime), CAST(N'2017-03-12 13:32:44.637' AS DateTime), CAST(N'2017-03-12 13:32:44.637' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1121, 16, 21, 1, CAST(N'2017-03-12 16:32:00.000' AS DateTime), CAST(N'2017-03-12 13:32:46.423' AS DateTime), CAST(N'2017-03-12 13:32:46.423' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1122, 16, 94, 1, CAST(N'2017-03-12 16:33:00.000' AS DateTime), CAST(N'2017-03-12 13:33:01.730' AS DateTime), CAST(N'2017-03-12 13:33:01.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1123, 16, 114, 1, CAST(N'2017-03-12 16:33:00.000' AS DateTime), CAST(N'2017-03-12 13:33:05.883' AS DateTime), CAST(N'2017-03-12 13:33:05.883' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1124, 16, 514, 1, CAST(N'2017-03-12 16:33:00.000' AS DateTime), CAST(N'2017-03-12 13:33:11.003' AS DateTime), CAST(N'2017-03-12 13:33:11.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1125, 16, 148, 1, CAST(N'2017-03-12 16:33:00.000' AS DateTime), CAST(N'2017-03-12 13:33:16.327' AS DateTime), CAST(N'2017-03-12 13:33:16.327' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1126, 16, 150, 1, CAST(N'2017-03-12 16:33:00.000' AS DateTime), CAST(N'2017-03-12 13:33:40.870' AS DateTime), CAST(N'2017-03-12 13:33:40.870' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1127, 16, 254, 1, CAST(N'2017-03-12 16:35:00.000' AS DateTime), CAST(N'2017-03-12 13:35:14.027' AS DateTime), CAST(N'2017-03-12 13:35:14.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1128, 16, 213, 1, CAST(N'2017-03-12 16:35:00.000' AS DateTime), CAST(N'2017-03-12 13:35:40.910' AS DateTime), CAST(N'2017-03-12 13:35:40.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1129, 16, 236, 1, CAST(N'2017-03-12 16:36:00.000' AS DateTime), CAST(N'2017-03-12 13:36:02.333' AS DateTime), CAST(N'2017-03-12 13:36:02.333' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1130, 16, 361, 1, CAST(N'2017-03-12 16:39:00.000' AS DateTime), CAST(N'2017-03-12 13:36:11.160' AS DateTime), CAST(N'2017-03-12 13:36:11.160' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1131, 16, 250, 1, CAST(N'2017-03-12 16:36:00.000' AS DateTime), CAST(N'2017-03-12 13:36:18.947' AS DateTime), CAST(N'2017-03-12 13:36:18.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1132, 16, 241, 1, CAST(N'2017-03-12 16:37:00.000' AS DateTime), CAST(N'2017-03-12 13:37:35.267' AS DateTime), CAST(N'2017-03-12 13:37:35.267' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1133, 16, 504, 1, CAST(N'2017-03-12 16:37:00.000' AS DateTime), CAST(N'2017-03-12 13:37:53.247' AS DateTime), CAST(N'2017-03-12 13:37:53.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1134, 16, 297, 1, CAST(N'2017-03-12 16:37:00.000' AS DateTime), CAST(N'2017-03-12 13:38:00.003' AS DateTime), CAST(N'2017-03-12 13:38:00.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1135, 16, 271, 1, CAST(N'2017-03-12 16:38:00.000' AS DateTime), CAST(N'2017-03-12 13:38:13.333' AS DateTime), CAST(N'2017-03-12 13:38:13.333' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1136, 16, 413, 1, CAST(N'2017-03-12 16:38:00.000' AS DateTime), CAST(N'2017-03-12 13:38:16.273' AS DateTime), CAST(N'2017-03-12 13:38:16.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1137, 16, 352, 1, CAST(N'2017-03-12 16:38:00.000' AS DateTime), CAST(N'2017-03-12 13:38:44.563' AS DateTime), CAST(N'2017-03-12 13:38:44.563' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1138, 16, 540, 1, CAST(N'2017-03-12 16:38:00.000' AS DateTime), CAST(N'2017-03-12 13:38:56.287' AS DateTime), CAST(N'2017-03-12 13:38:56.287' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1139, 16, 363, 1, CAST(N'2017-03-12 16:39:00.000' AS DateTime), CAST(N'2017-03-12 13:39:13.137' AS DateTime), CAST(N'2017-03-12 13:39:13.137' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1140, 16, 513, 1, CAST(N'2017-03-12 16:39:00.000' AS DateTime), CAST(N'2017-03-12 13:39:17.820' AS DateTime), CAST(N'2017-03-12 13:39:17.820' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1141, 16, 457, 1, CAST(N'2017-03-12 16:40:00.000' AS DateTime), CAST(N'2017-03-12 13:40:03.310' AS DateTime), CAST(N'2017-03-12 13:40:03.310' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1142, 16, 293, 1, CAST(N'2017-03-12 16:40:00.000' AS DateTime), CAST(N'2017-03-12 13:40:21.970' AS DateTime), CAST(N'2017-03-12 13:40:21.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1143, 16, 484, 1, CAST(N'2017-03-12 16:40:00.000' AS DateTime), CAST(N'2017-03-12 13:40:43.440' AS DateTime), CAST(N'2017-03-12 13:40:43.440' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1144, 16, 360, 1, CAST(N'2017-03-12 16:40:00.000' AS DateTime), CAST(N'2017-03-12 13:40:46.610' AS DateTime), CAST(N'2017-03-12 13:40:46.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1145, 16, 32, 1, CAST(N'2017-03-12 16:41:00.000' AS DateTime), CAST(N'2017-03-12 13:41:02.723' AS DateTime), CAST(N'2017-03-12 13:41:02.723' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1146, 16, 532, 1, CAST(N'2017-03-12 16:41:00.000' AS DateTime), CAST(N'2017-03-12 13:41:07.620' AS DateTime), CAST(N'2017-03-12 13:41:07.620' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1147, 16, 496, 1, CAST(N'2017-03-12 16:41:00.000' AS DateTime), CAST(N'2017-03-12 13:41:17.460' AS DateTime), CAST(N'2017-03-12 13:41:17.460' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1148, 16, 512, 1, CAST(N'2017-03-12 16:41:00.000' AS DateTime), CAST(N'2017-03-12 13:41:50.540' AS DateTime), CAST(N'2017-03-12 13:41:50.540' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1149, 16, 43, 1, CAST(N'2017-03-12 16:42:00.000' AS DateTime), CAST(N'2017-03-12 13:42:09.630' AS DateTime), CAST(N'2017-03-12 13:42:09.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1150, 16, 122, 1, CAST(N'2017-03-12 16:42:00.000' AS DateTime), CAST(N'2017-03-12 13:42:59.760' AS DateTime), CAST(N'2017-03-12 13:42:59.760' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1151, 16, 220, 1, CAST(N'2017-03-12 16:44:00.000' AS DateTime), CAST(N'2017-03-12 13:44:19.827' AS DateTime), CAST(N'2017-03-12 13:44:19.827' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1152, 16, 328, 1, CAST(N'2017-03-12 16:45:00.000' AS DateTime), CAST(N'2017-03-12 13:45:02.020' AS DateTime), CAST(N'2017-03-12 13:45:02.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1153, 16, 395, 1, CAST(N'2017-03-12 16:45:00.000' AS DateTime), CAST(N'2017-03-12 13:45:20.540' AS DateTime), CAST(N'2017-03-12 13:45:20.540' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1154, 16, 70, 1, CAST(N'2017-03-12 16:45:00.000' AS DateTime), CAST(N'2017-03-12 13:45:31.080' AS DateTime), CAST(N'2017-03-12 13:45:31.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1155, 16, 101, 1, CAST(N'2017-03-12 16:46:00.000' AS DateTime), CAST(N'2017-03-12 13:46:16.213' AS DateTime), CAST(N'2017-03-12 13:46:16.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1156, 16, 433, 1, CAST(N'2017-03-12 16:46:00.000' AS DateTime), CAST(N'2017-03-12 13:46:29.347' AS DateTime), CAST(N'2017-03-12 13:46:29.347' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1157, 16, 210, 1, CAST(N'2017-03-12 16:47:00.000' AS DateTime), CAST(N'2017-03-12 13:47:22.573' AS DateTime), CAST(N'2017-03-12 13:47:22.573' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1158, 16, 494, 1, CAST(N'2017-03-12 16:47:00.000' AS DateTime), CAST(N'2017-03-12 13:47:53.617' AS DateTime), CAST(N'2017-03-12 13:47:53.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1159, 16, 515, 1, CAST(N'2017-03-12 16:48:00.000' AS DateTime), CAST(N'2017-03-12 13:48:42.070' AS DateTime), CAST(N'2017-03-12 13:48:42.070' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1160, 16, 454, 1, CAST(N'2017-03-12 16:48:00.000' AS DateTime), CAST(N'2017-03-12 13:48:59.357' AS DateTime), CAST(N'2017-03-12 13:48:59.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1161, 16, 253, 1, CAST(N'2017-03-12 16:49:00.000' AS DateTime), CAST(N'2017-03-12 13:49:09.253' AS DateTime), CAST(N'2017-03-12 13:49:09.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1162, 16, 13, 1, CAST(N'2017-03-12 16:50:00.000' AS DateTime), CAST(N'2017-03-12 13:50:47.500' AS DateTime), CAST(N'2017-03-12 13:50:47.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1163, 16, 59, 1, CAST(N'2017-03-12 16:51:00.000' AS DateTime), CAST(N'2017-03-12 13:51:03.297' AS DateTime), CAST(N'2017-03-12 13:51:03.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1164, 16, 30, 1, CAST(N'2017-03-12 16:51:00.000' AS DateTime), CAST(N'2017-03-12 13:51:16.160' AS DateTime), CAST(N'2017-03-12 13:51:16.160' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1165, 16, 68, 1, CAST(N'2017-03-12 16:51:00.000' AS DateTime), CAST(N'2017-03-12 13:51:19.270' AS DateTime), CAST(N'2017-03-12 13:51:19.270' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1166, 16, 442, 1, CAST(N'2017-03-12 16:51:00.000' AS DateTime), CAST(N'2017-03-12 13:51:54.720' AS DateTime), CAST(N'2017-03-12 13:51:54.720' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1167, 16, 120, 1, CAST(N'2017-03-12 16:52:00.000' AS DateTime), CAST(N'2017-03-12 13:52:04.637' AS DateTime), CAST(N'2017-03-12 13:52:04.637' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1168, 16, 128, 1, CAST(N'2017-03-12 16:52:00.000' AS DateTime), CAST(N'2017-03-12 13:52:17.210' AS DateTime), CAST(N'2017-03-12 13:52:17.210' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1169, 16, 98, 1, CAST(N'2017-03-12 16:53:00.000' AS DateTime), CAST(N'2017-03-12 13:54:07.013' AS DateTime), CAST(N'2017-03-12 13:54:07.013' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1170, 16, 423, 1, CAST(N'2017-03-12 16:54:00.000' AS DateTime), CAST(N'2017-03-12 13:54:16.427' AS DateTime), CAST(N'2017-03-12 13:54:16.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1171, 16, 221, 1, CAST(N'2017-03-12 16:54:00.000' AS DateTime), CAST(N'2017-03-12 13:54:42.380' AS DateTime), CAST(N'2017-03-12 13:54:42.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1172, 16, 462, 1, CAST(N'2017-03-12 16:54:00.000' AS DateTime), CAST(N'2017-03-12 13:54:43.770' AS DateTime), CAST(N'2017-03-12 13:54:43.770' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1173, 16, 157, 1, CAST(N'2017-03-12 16:55:00.000' AS DateTime), CAST(N'2017-03-12 13:55:17.247' AS DateTime), CAST(N'2017-03-12 13:55:17.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1174, 16, 252, 1, CAST(N'2017-03-12 16:56:00.000' AS DateTime), CAST(N'2017-03-12 13:56:12.870' AS DateTime), CAST(N'2017-03-12 13:56:12.870' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1175, 16, 285, 1, CAST(N'2017-03-12 16:56:00.000' AS DateTime), CAST(N'2017-03-12 13:56:40.390' AS DateTime), CAST(N'2017-03-12 13:56:40.390' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1176, 16, 288, 1, CAST(N'2017-03-12 16:57:00.000' AS DateTime), CAST(N'2017-03-12 13:57:01.860' AS DateTime), CAST(N'2017-03-12 13:57:01.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1177, 16, 316, 1, CAST(N'2017-03-12 17:01:00.000' AS DateTime), CAST(N'2017-03-12 13:57:25.593' AS DateTime), CAST(N'2017-03-12 13:57:25.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1178, 16, 378, 1, CAST(N'2017-03-12 16:57:00.000' AS DateTime), CAST(N'2017-03-12 13:57:58.417' AS DateTime), CAST(N'2017-03-12 13:57:58.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1179, 16, 144, 1, CAST(N'2017-03-12 16:58:00.000' AS DateTime), CAST(N'2017-03-12 13:58:29.733' AS DateTime), CAST(N'2017-03-12 13:58:29.733' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1180, 16, 407, 1, CAST(N'2017-03-12 16:58:00.000' AS DateTime), CAST(N'2017-03-12 13:58:41.837' AS DateTime), CAST(N'2017-03-12 13:58:41.837' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1181, 16, 509, 1, CAST(N'2017-03-12 17:00:00.000' AS DateTime), CAST(N'2017-03-12 14:00:34.910' AS DateTime), CAST(N'2017-03-12 14:00:34.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1182, 16, 362, 1, CAST(N'2017-03-12 17:01:00.000' AS DateTime), CAST(N'2017-03-12 14:01:42.723' AS DateTime), CAST(N'2017-03-12 14:01:42.723' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1183, 16, 53, 1, CAST(N'2017-03-12 17:02:00.000' AS DateTime), CAST(N'2017-03-12 14:02:43.277' AS DateTime), CAST(N'2017-03-12 14:02:43.277' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1184, 16, 72, 1, CAST(N'2017-03-12 17:03:00.000' AS DateTime), CAST(N'2017-03-12 14:03:40.427' AS DateTime), CAST(N'2017-03-12 14:03:40.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1185, 16, 287, 1, CAST(N'2017-03-12 17:07:00.000' AS DateTime), CAST(N'2017-03-12 14:07:44.197' AS DateTime), CAST(N'2017-03-12 14:07:44.197' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1186, 16, 294, 1, CAST(N'2017-03-12 17:08:00.000' AS DateTime), CAST(N'2017-03-12 14:08:09.670' AS DateTime), CAST(N'2017-03-12 14:08:09.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1187, 16, 320, 1, CAST(N'2017-03-12 17:09:00.000' AS DateTime), CAST(N'2017-03-12 14:09:24.860' AS DateTime), CAST(N'2017-03-12 14:09:24.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1188, 16, 123, 1, CAST(N'2017-03-12 17:10:00.000' AS DateTime), CAST(N'2017-03-12 14:10:27.993' AS DateTime), CAST(N'2017-03-12 14:10:27.993' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1189, 16, 141, 1, CAST(N'2017-03-12 17:11:00.000' AS DateTime), CAST(N'2017-03-12 14:11:01.523' AS DateTime), CAST(N'2017-03-12 14:11:01.523' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1190, 16, 338, 1, CAST(N'2017-03-12 17:11:00.000' AS DateTime), CAST(N'2017-03-12 14:11:54.673' AS DateTime), CAST(N'2017-03-12 14:11:54.673' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1191, 16, 502, 1, CAST(N'2017-03-12 17:12:00.000' AS DateTime), CAST(N'2017-03-12 14:12:08.807' AS DateTime), CAST(N'2017-03-12 14:12:08.807' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1192, 16, 399, 1, CAST(N'2017-03-12 17:12:00.000' AS DateTime), CAST(N'2017-03-12 14:12:10.677' AS DateTime), CAST(N'2017-03-12 14:12:10.677' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1193, 16, 315, 1, CAST(N'2017-03-12 17:14:00.000' AS DateTime), CAST(N'2017-03-12 14:14:54.610' AS DateTime), CAST(N'2017-03-12 14:14:54.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1194, 16, 364, 1, CAST(N'2017-03-12 17:15:00.000' AS DateTime), CAST(N'2017-03-12 14:15:42.880' AS DateTime), CAST(N'2017-03-12 14:15:42.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1195, 16, 4, 1, CAST(N'2017-03-12 17:16:00.000' AS DateTime), CAST(N'2017-03-12 14:16:35.980' AS DateTime), CAST(N'2017-03-12 14:16:35.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1196, 16, 337, 1, CAST(N'2017-03-12 17:19:00.000' AS DateTime), CAST(N'2017-03-12 14:19:07.350' AS DateTime), CAST(N'2017-03-12 14:19:07.350' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1197, 16, 38, 1, CAST(N'2017-03-12 17:19:00.000' AS DateTime), CAST(N'2017-03-12 14:19:11.437' AS DateTime), CAST(N'2017-03-12 14:19:11.437' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1198, 16, 365, 1, CAST(N'2017-03-12 17:20:00.000' AS DateTime), CAST(N'2017-03-12 14:20:45.503' AS DateTime), CAST(N'2017-03-12 14:20:45.503' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1199, 16, 134, 1, CAST(N'2017-03-12 17:21:00.000' AS DateTime), CAST(N'2017-03-12 14:21:09.410' AS DateTime), CAST(N'2017-03-12 14:21:09.410' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1200, 16, 177, 1, CAST(N'2017-03-12 17:21:00.000' AS DateTime), CAST(N'2017-03-12 14:21:57.940' AS DateTime), CAST(N'2017-03-12 14:21:57.940' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1201, 16, 204, 1, CAST(N'2017-03-12 17:22:00.000' AS DateTime), CAST(N'2017-03-12 14:22:30.607' AS DateTime), CAST(N'2017-03-12 14:22:30.607' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1202, 16, 438, 1, CAST(N'2017-03-12 17:22:00.000' AS DateTime), CAST(N'2017-03-12 14:22:36.267' AS DateTime), CAST(N'2017-03-12 14:22:36.267' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1203, 16, 446, 1, CAST(N'2017-03-12 17:23:00.000' AS DateTime), CAST(N'2017-03-12 14:23:39.340' AS DateTime), CAST(N'2017-03-12 14:23:39.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1204, 16, 261, 1, CAST(N'2017-03-12 17:23:00.000' AS DateTime), CAST(N'2017-03-12 14:23:45.257' AS DateTime), CAST(N'2017-03-12 14:23:45.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1205, 16, 404, 1, CAST(N'2017-03-12 17:25:00.000' AS DateTime), CAST(N'2017-03-12 14:25:42.580' AS DateTime), CAST(N'2017-03-12 14:25:42.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1206, 16, 406, 1, CAST(N'2017-03-12 17:26:00.000' AS DateTime), CAST(N'2017-03-12 14:26:04.280' AS DateTime), CAST(N'2017-03-12 14:26:04.280' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1207, 16, 411, 1, CAST(N'2017-03-12 17:26:00.000' AS DateTime), CAST(N'2017-03-12 14:26:19.877' AS DateTime), CAST(N'2017-03-12 14:26:19.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1208, 16, 3, 1, CAST(N'2017-03-12 17:29:00.000' AS DateTime), CAST(N'2017-03-12 14:29:04.530' AS DateTime), CAST(N'2017-03-12 14:29:04.530' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1209, 16, 91, 1, CAST(N'2017-03-12 17:29:00.000' AS DateTime), CAST(N'2017-03-12 14:29:13.933' AS DateTime), CAST(N'2017-03-12 14:29:13.933' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1210, 16, 172, 1, CAST(N'2017-03-12 17:31:00.000' AS DateTime), CAST(N'2017-03-12 14:31:25.690' AS DateTime), CAST(N'2017-03-12 14:31:25.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1211, 16, 180, 1, CAST(N'2017-03-12 17:39:00.000' AS DateTime), CAST(N'2017-03-12 14:39:31.547' AS DateTime), CAST(N'2017-03-12 14:39:31.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1212, 16, 409, 1, CAST(N'2017-03-12 17:53:00.000' AS DateTime), CAST(N'2017-03-12 14:54:04.433' AS DateTime), CAST(N'2017-03-12 14:54:04.433' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1213, 16, 350, 1, CAST(N'2017-03-12 18:06:00.000' AS DateTime), CAST(N'2017-03-12 15:06:10.893' AS DateTime), CAST(N'2017-03-12 15:06:10.893' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1214, 16, 216, 1, CAST(N'2017-03-12 18:16:00.000' AS DateTime), CAST(N'2017-03-12 15:16:31.710' AS DateTime), CAST(N'2017-03-12 15:16:31.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1215, 16, 536, 1, CAST(N'2017-03-14 00:05:00.000' AS DateTime), CAST(N'2017-03-13 21:05:27.797' AS DateTime), CAST(N'2017-03-13 21:05:27.797' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1216, 17, 345, 1, CAST(N'2017-03-19 15:20:00.000' AS DateTime), CAST(N'2017-03-19 12:20:12.443' AS DateTime), CAST(N'2017-03-19 12:20:12.443' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1217, 17, 158, 1, CAST(N'2017-03-19 15:23:00.000' AS DateTime), CAST(N'2017-03-19 12:23:13.257' AS DateTime), CAST(N'2017-03-19 12:23:13.257' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1218, 17, 36, 1, CAST(N'2017-03-19 15:23:00.000' AS DateTime), CAST(N'2017-03-19 12:23:28.960' AS DateTime), CAST(N'2017-03-19 12:23:28.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1219, 17, 385, 1, CAST(N'2017-03-19 15:30:00.000' AS DateTime), CAST(N'2017-03-19 12:30:44.820' AS DateTime), CAST(N'2017-03-19 12:30:44.820' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1220, 17, 504, 1, CAST(N'2017-03-19 15:30:00.000' AS DateTime), CAST(N'2017-03-19 12:30:44.820' AS DateTime), CAST(N'2017-03-19 12:30:44.820' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1221, 17, 310, 1, CAST(N'2017-03-19 15:32:00.000' AS DateTime), CAST(N'2017-03-19 12:32:41.740' AS DateTime), CAST(N'2017-03-19 12:32:41.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1222, 17, 29, 1, CAST(N'2017-03-19 15:34:00.000' AS DateTime), CAST(N'2017-03-19 12:34:48.823' AS DateTime), CAST(N'2017-03-19 12:34:48.823' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1223, 17, 222, 1, CAST(N'2017-03-19 15:35:00.000' AS DateTime), CAST(N'2017-03-19 12:35:13.060' AS DateTime), CAST(N'2017-03-19 12:35:13.060' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1224, 17, 121, 1, CAST(N'2017-03-19 15:35:00.000' AS DateTime), CAST(N'2017-03-19 12:35:25.777' AS DateTime), CAST(N'2017-03-19 12:35:25.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1225, 17, 123, 1, CAST(N'2017-03-19 15:35:00.000' AS DateTime), CAST(N'2017-03-19 12:35:32.227' AS DateTime), CAST(N'2017-03-19 12:35:32.227' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1226, 17, 279, 1, CAST(N'2017-03-19 15:35:00.000' AS DateTime), CAST(N'2017-03-19 12:35:37.383' AS DateTime), CAST(N'2017-03-19 12:35:37.383' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1227, 17, 487, 1, CAST(N'2017-03-19 15:35:00.000' AS DateTime), CAST(N'2017-03-19 12:35:47.750' AS DateTime), CAST(N'2017-03-19 12:35:47.750' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1228, 17, 22, 1, CAST(N'2017-03-19 15:36:00.000' AS DateTime), CAST(N'2017-03-19 12:36:03.197' AS DateTime), CAST(N'2017-03-19 12:36:03.197' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1229, 17, 547, 1, CAST(N'2017-03-19 15:49:00.000' AS DateTime), CAST(N'2017-03-19 12:49:10.563' AS DateTime), CAST(N'2017-03-19 12:49:10.563' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1230, 17, 432, 1, CAST(N'2017-03-19 15:50:00.000' AS DateTime), CAST(N'2017-03-19 12:50:16.900' AS DateTime), CAST(N'2017-03-19 12:50:16.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1231, 17, 85, 1, CAST(N'2017-03-19 15:50:00.000' AS DateTime), CAST(N'2017-03-19 12:50:27.150' AS DateTime), CAST(N'2017-03-19 12:50:27.150' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1232, 17, 237, 1, CAST(N'2017-03-19 15:51:00.000' AS DateTime), CAST(N'2017-03-19 12:51:01.507' AS DateTime), CAST(N'2017-03-19 12:51:01.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1233, 17, 309, 1, CAST(N'2017-03-19 15:53:00.000' AS DateTime), CAST(N'2017-03-19 12:53:26.143' AS DateTime), CAST(N'2017-03-19 12:53:26.143' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1234, 17, 335, 1, CAST(N'2017-03-19 15:53:00.000' AS DateTime), CAST(N'2017-03-19 12:53:34.550' AS DateTime), CAST(N'2017-03-19 12:53:34.550' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1235, 17, 162, 1, CAST(N'2017-03-19 15:53:00.000' AS DateTime), CAST(N'2017-03-19 12:53:47.693' AS DateTime), CAST(N'2017-03-19 12:53:47.693' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1236, 17, 424, 1, CAST(N'2017-03-19 15:54:00.000' AS DateTime), CAST(N'2017-03-19 12:54:01.007' AS DateTime), CAST(N'2017-03-19 12:54:01.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1237, 17, 66, 1, CAST(N'2017-03-19 15:54:00.000' AS DateTime), CAST(N'2017-03-19 12:54:11.280' AS DateTime), CAST(N'2017-03-19 12:54:11.280' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1238, 17, 83, 1, CAST(N'2017-03-19 15:54:00.000' AS DateTime), CAST(N'2017-03-19 12:54:40.260' AS DateTime), CAST(N'2017-03-19 12:54:40.260' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1239, 17, 477, 1, CAST(N'2017-03-19 15:54:00.000' AS DateTime), CAST(N'2017-03-19 12:55:00.740' AS DateTime), CAST(N'2017-03-19 12:55:00.740' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1240, 17, 180, 1, CAST(N'2017-03-19 15:55:00.000' AS DateTime), CAST(N'2017-03-19 12:55:16.047' AS DateTime), CAST(N'2017-03-19 12:55:16.047' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1241, 17, 174, 1, CAST(N'2017-03-19 15:55:00.000' AS DateTime), CAST(N'2017-03-19 12:55:34.980' AS DateTime), CAST(N'2017-03-19 12:55:34.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1242, 17, 209, 1, CAST(N'2017-03-19 15:55:00.000' AS DateTime), CAST(N'2017-03-19 12:55:42.713' AS DateTime), CAST(N'2017-03-19 12:55:42.713' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1243, 17, 269, 1, CAST(N'2017-03-19 15:55:00.000' AS DateTime), CAST(N'2017-03-19 12:55:51.763' AS DateTime), CAST(N'2017-03-19 12:55:51.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1244, 17, 250, 1, CAST(N'2017-03-19 15:56:00.000' AS DateTime), CAST(N'2017-03-19 12:56:02.197' AS DateTime), CAST(N'2017-03-19 12:56:02.197' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1245, 17, 251, 1, CAST(N'2017-03-19 15:56:00.000' AS DateTime), CAST(N'2017-03-19 12:56:06.660' AS DateTime), CAST(N'2017-03-19 12:56:06.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1246, 17, 486, 1, CAST(N'2017-03-19 15:56:00.000' AS DateTime), CAST(N'2017-03-19 12:56:24.730' AS DateTime), CAST(N'2017-03-19 12:56:24.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1247, 17, 482, 1, CAST(N'2017-03-19 15:56:00.000' AS DateTime), CAST(N'2017-03-19 12:56:28.910' AS DateTime), CAST(N'2017-03-19 12:56:28.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1248, 17, 459, 1, CAST(N'2017-03-19 15:56:00.000' AS DateTime), CAST(N'2017-03-19 12:56:36.003' AS DateTime), CAST(N'2017-03-19 12:56:36.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1249, 17, 238, 1, CAST(N'2017-03-19 15:57:00.000' AS DateTime), CAST(N'2017-03-19 12:57:01.927' AS DateTime), CAST(N'2017-03-19 12:57:01.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1250, 17, 434, 1, CAST(N'2017-03-19 15:57:00.000' AS DateTime), CAST(N'2017-03-19 12:57:14.560' AS DateTime), CAST(N'2017-03-19 12:57:14.560' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1251, 17, 433, 1, CAST(N'2017-03-19 15:57:00.000' AS DateTime), CAST(N'2017-03-19 12:57:21.830' AS DateTime), CAST(N'2017-03-19 12:57:21.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1252, 17, 151, 1, CAST(N'2017-03-19 15:57:00.000' AS DateTime), CAST(N'2017-03-19 12:57:22.283' AS DateTime), CAST(N'2017-03-19 12:57:22.283' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1253, 17, 16, 1, CAST(N'2017-03-19 15:57:00.000' AS DateTime), CAST(N'2017-03-19 12:57:29.527' AS DateTime), CAST(N'2017-03-19 12:57:29.527' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1254, 17, 260, 1, CAST(N'2017-03-19 15:57:00.000' AS DateTime), CAST(N'2017-03-19 12:57:53.620' AS DateTime), CAST(N'2017-03-19 12:57:53.620' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1255, 17, 323, 1, CAST(N'2017-03-19 15:58:00.000' AS DateTime), CAST(N'2017-03-19 12:58:02.297' AS DateTime), CAST(N'2017-03-19 12:58:02.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1256, 17, 329, 1, CAST(N'2017-03-19 15:58:00.000' AS DateTime), CAST(N'2017-03-19 12:58:05.130' AS DateTime), CAST(N'2017-03-19 12:58:05.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1257, 17, 485, 1, CAST(N'2017-03-19 15:58:00.000' AS DateTime), CAST(N'2017-03-19 12:58:13.090' AS DateTime), CAST(N'2017-03-19 12:58:13.090' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1258, 17, 133, 1, CAST(N'2017-03-19 16:06:00.000' AS DateTime), CAST(N'2017-03-19 12:58:14.263' AS DateTime), CAST(N'2017-03-19 12:58:14.263' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1259, 17, 510, 1, CAST(N'2017-03-19 15:58:00.000' AS DateTime), CAST(N'2017-03-19 12:58:21.353' AS DateTime), CAST(N'2017-03-19 12:58:21.353' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1260, 17, 494, 1, CAST(N'2017-03-19 15:58:00.000' AS DateTime), CAST(N'2017-03-19 12:58:58.860' AS DateTime), CAST(N'2017-03-19 12:58:58.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1261, 17, 236, 1, CAST(N'2017-03-19 15:59:00.000' AS DateTime), CAST(N'2017-03-19 12:59:24.717' AS DateTime), CAST(N'2017-03-19 12:59:24.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1262, 17, 115, 1, CAST(N'2017-03-19 15:59:00.000' AS DateTime), CAST(N'2017-03-19 12:59:34.610' AS DateTime), CAST(N'2017-03-19 12:59:34.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1263, 17, 56, 1, CAST(N'2017-03-19 15:59:00.000' AS DateTime), CAST(N'2017-03-19 12:59:53.553' AS DateTime), CAST(N'2017-03-19 12:59:53.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1264, 17, 206, 1, CAST(N'2017-03-19 16:00:00.000' AS DateTime), CAST(N'2017-03-19 13:00:09.570' AS DateTime), CAST(N'2017-03-19 13:00:09.570' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1265, 17, 305, 1, CAST(N'2017-03-19 16:00:00.000' AS DateTime), CAST(N'2017-03-19 13:00:12.480' AS DateTime), CAST(N'2017-03-19 13:00:12.480' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1266, 17, 205, 1, CAST(N'2017-03-19 16:08:00.000' AS DateTime), CAST(N'2017-03-19 13:00:15.017' AS DateTime), CAST(N'2017-03-19 13:00:15.017' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1267, 17, 99, 1, CAST(N'2017-03-19 16:00:00.000' AS DateTime), CAST(N'2017-03-19 13:00:26.707' AS DateTime), CAST(N'2017-03-19 13:00:26.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1268, 17, 136, 1, CAST(N'2017-03-19 16:00:00.000' AS DateTime), CAST(N'2017-03-19 13:00:34.537' AS DateTime), CAST(N'2017-03-19 13:00:34.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1269, 17, 35, 1, CAST(N'2017-03-19 16:00:00.000' AS DateTime), CAST(N'2017-03-19 13:00:40.843' AS DateTime), CAST(N'2017-03-19 13:00:40.843' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1270, 17, 455, 1, CAST(N'2017-03-19 16:01:00.000' AS DateTime), CAST(N'2017-03-19 13:01:00.970' AS DateTime), CAST(N'2017-03-19 13:01:00.970' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1271, 17, 524, 1, CAST(N'2017-03-19 16:01:00.000' AS DateTime), CAST(N'2017-03-19 13:01:12.590' AS DateTime), CAST(N'2017-03-19 13:01:12.590' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1272, 17, 515, 1, CAST(N'2017-03-19 16:43:00.000' AS DateTime), CAST(N'2017-03-19 13:01:35.183' AS DateTime), CAST(N'2017-03-19 13:01:35.183' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1273, 17, 334, 1, CAST(N'2017-03-19 16:01:00.000' AS DateTime), CAST(N'2017-03-19 13:01:48.880' AS DateTime), CAST(N'2017-03-19 13:01:48.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1274, 17, 98, 1, CAST(N'2017-03-19 16:01:00.000' AS DateTime), CAST(N'2017-03-19 13:01:55.530' AS DateTime), CAST(N'2017-03-19 13:01:55.530' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1275, 17, 308, 1, CAST(N'2017-03-19 16:02:00.000' AS DateTime), CAST(N'2017-03-19 13:02:11.190' AS DateTime), CAST(N'2017-03-19 13:02:11.190' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1276, 17, 82, 1, CAST(N'2017-03-19 16:02:00.000' AS DateTime), CAST(N'2017-03-19 13:03:01.050' AS DateTime), CAST(N'2017-03-19 13:03:01.050' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1277, 17, 307, 1, CAST(N'2017-03-19 16:03:00.000' AS DateTime), CAST(N'2017-03-19 13:03:08.593' AS DateTime), CAST(N'2017-03-19 13:03:08.593' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1278, 17, 436, 1, CAST(N'2017-03-19 16:03:00.000' AS DateTime), CAST(N'2017-03-19 13:03:42.663' AS DateTime), CAST(N'2017-03-19 13:03:42.663' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1279, 17, 380, 1, CAST(N'2017-03-19 16:04:00.000' AS DateTime), CAST(N'2017-03-19 13:04:08.007' AS DateTime), CAST(N'2017-03-19 13:04:08.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1280, 17, 437, 1, CAST(N'2017-03-19 16:04:00.000' AS DateTime), CAST(N'2017-03-19 13:04:22.933' AS DateTime), CAST(N'2017-03-19 13:04:22.933' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1281, 17, 161, 1, CAST(N'2017-03-19 16:04:00.000' AS DateTime), CAST(N'2017-03-19 13:04:34.430' AS DateTime), CAST(N'2017-03-19 13:04:34.430' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1282, 17, 445, 1, CAST(N'2017-03-19 16:04:00.000' AS DateTime), CAST(N'2017-03-19 13:04:59.177' AS DateTime), CAST(N'2017-03-19 13:04:59.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1283, 17, 77, 1, CAST(N'2017-03-19 16:05:00.000' AS DateTime), CAST(N'2017-03-19 13:05:52.110' AS DateTime), CAST(N'2017-03-19 13:05:52.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1284, 17, 519, 1, CAST(N'2017-03-19 16:06:00.000' AS DateTime), CAST(N'2017-03-19 13:06:22.370' AS DateTime), CAST(N'2017-03-19 13:06:22.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1285, 17, 271, 1, CAST(N'2017-03-19 16:06:00.000' AS DateTime), CAST(N'2017-03-19 13:06:29.233' AS DateTime), CAST(N'2017-03-19 13:06:29.233' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1286, 17, 207, 1, CAST(N'2017-03-19 16:06:00.000' AS DateTime), CAST(N'2017-03-19 13:06:45.350' AS DateTime), CAST(N'2017-03-19 13:06:45.350' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1287, 17, 156, 1, CAST(N'2017-03-19 16:07:00.000' AS DateTime), CAST(N'2017-03-19 13:07:26.110' AS DateTime), CAST(N'2017-03-19 13:07:26.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1288, 17, 474, 1, CAST(N'2017-03-19 16:07:00.000' AS DateTime), CAST(N'2017-03-19 13:07:30.293' AS DateTime), CAST(N'2017-03-19 13:07:30.293' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1289, 17, 84, 1, CAST(N'2017-03-19 16:07:00.000' AS DateTime), CAST(N'2017-03-19 13:07:43.990' AS DateTime), CAST(N'2017-03-19 13:07:43.990' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1290, 17, 164, 1, CAST(N'2017-03-19 16:08:00.000' AS DateTime), CAST(N'2017-03-19 13:08:03.353' AS DateTime), CAST(N'2017-03-19 13:08:03.353' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1291, 17, 241, 1, CAST(N'2017-03-19 16:09:00.000' AS DateTime), CAST(N'2017-03-19 13:09:04.997' AS DateTime), CAST(N'2017-03-19 13:09:04.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1292, 17, 196, 1, CAST(N'2017-03-19 16:09:00.000' AS DateTime), CAST(N'2017-03-19 13:09:18.670' AS DateTime), CAST(N'2017-03-19 13:09:18.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1293, 17, 27, 1, CAST(N'2017-03-19 16:10:00.000' AS DateTime), CAST(N'2017-03-19 13:10:06.317' AS DateTime), CAST(N'2017-03-19 13:10:06.317' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1294, 17, 46, 1, CAST(N'2017-03-19 16:10:00.000' AS DateTime), CAST(N'2017-03-19 13:10:44.180' AS DateTime), CAST(N'2017-03-19 13:10:44.180' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1295, 17, 179, 1, CAST(N'2017-03-19 16:10:00.000' AS DateTime), CAST(N'2017-03-19 13:10:57.073' AS DateTime), CAST(N'2017-03-19 13:10:57.073' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1296, 17, 60, 1, CAST(N'2017-03-19 16:11:00.000' AS DateTime), CAST(N'2017-03-19 13:11:01.923' AS DateTime), CAST(N'2017-03-19 13:11:01.923' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1297, 17, 97, 1, CAST(N'2017-03-19 16:11:00.000' AS DateTime), CAST(N'2017-03-19 13:11:41.850' AS DateTime), CAST(N'2017-03-19 13:11:41.850' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1298, 17, 528, 1, CAST(N'2017-03-19 16:11:00.000' AS DateTime), CAST(N'2017-03-19 13:11:42.417' AS DateTime), CAST(N'2017-03-19 13:11:42.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1299, 17, 215, 1, CAST(N'2017-03-19 16:11:00.000' AS DateTime), CAST(N'2017-03-19 13:11:53.883' AS DateTime), CAST(N'2017-03-19 13:11:53.883' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1300, 17, 105, 1, CAST(N'2017-03-19 16:11:00.000' AS DateTime), CAST(N'2017-03-19 13:11:55.650' AS DateTime), CAST(N'2017-03-19 13:11:55.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1301, 17, 106, 1, CAST(N'2017-03-19 16:12:00.000' AS DateTime), CAST(N'2017-03-19 13:12:06.500' AS DateTime), CAST(N'2017-03-19 13:12:06.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1302, 17, 146, 1, CAST(N'2017-03-19 16:12:00.000' AS DateTime), CAST(N'2017-03-19 13:12:58.193' AS DateTime), CAST(N'2017-03-19 13:12:58.193' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1303, 17, 152, 1, CAST(N'2017-03-19 16:13:00.000' AS DateTime), CAST(N'2017-03-19 13:13:18.910' AS DateTime), CAST(N'2017-03-19 13:13:18.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1304, 17, 125, 1, CAST(N'2017-03-19 16:13:00.000' AS DateTime), CAST(N'2017-03-19 13:13:19.890' AS DateTime), CAST(N'2017-03-19 13:13:19.890' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1305, 17, 57, 1, CAST(N'2017-03-19 16:13:00.000' AS DateTime), CAST(N'2017-03-19 13:13:59.893' AS DateTime), CAST(N'2017-03-19 13:13:59.893' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1306, 17, 197, 1, CAST(N'2017-03-19 16:14:00.000' AS DateTime), CAST(N'2017-03-19 13:14:35.447' AS DateTime), CAST(N'2017-03-19 13:14:35.447' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1307, 17, 211, 1, CAST(N'2017-03-19 16:14:00.000' AS DateTime), CAST(N'2017-03-19 13:14:39.370' AS DateTime), CAST(N'2017-03-19 13:14:39.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1308, 17, 228, 1, CAST(N'2017-03-19 16:15:00.000' AS DateTime), CAST(N'2017-03-19 13:15:11.180' AS DateTime), CAST(N'2017-03-19 13:15:11.180' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1309, 17, 70, 1, CAST(N'2017-03-19 16:16:00.000' AS DateTime), CAST(N'2017-03-19 13:16:44.667' AS DateTime), CAST(N'2017-03-19 13:16:44.667' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1310, 17, 153, 1, CAST(N'2017-03-19 16:17:00.000' AS DateTime), CAST(N'2017-03-19 13:17:46.020' AS DateTime), CAST(N'2017-03-19 13:17:46.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1311, 17, 243, 1, CAST(N'2017-03-19 16:19:00.000' AS DateTime), CAST(N'2017-03-19 13:19:02.110' AS DateTime), CAST(N'2017-03-19 13:19:02.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1312, 17, 254, 1, CAST(N'2017-03-19 16:19:00.000' AS DateTime), CAST(N'2017-03-19 13:19:14.843' AS DateTime), CAST(N'2017-03-19 13:19:14.843' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1313, 17, 278, 1, CAST(N'2017-03-19 16:20:00.000' AS DateTime), CAST(N'2017-03-19 13:20:09.087' AS DateTime), CAST(N'2017-03-19 13:20:09.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1314, 17, 286, 1, CAST(N'2017-03-19 16:20:00.000' AS DateTime), CAST(N'2017-03-19 13:20:44.833' AS DateTime), CAST(N'2017-03-19 13:20:44.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1315, 17, 319, 1, CAST(N'2017-03-19 16:21:00.000' AS DateTime), CAST(N'2017-03-19 13:21:38.527' AS DateTime), CAST(N'2017-03-19 13:21:38.527' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1316, 17, 360, 1, CAST(N'2017-03-19 16:22:00.000' AS DateTime), CAST(N'2017-03-19 13:22:14.450' AS DateTime), CAST(N'2017-03-19 13:22:14.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1317, 17, 398, 1, CAST(N'2017-03-19 16:22:00.000' AS DateTime), CAST(N'2017-03-19 13:22:23.960' AS DateTime), CAST(N'2017-03-19 13:22:23.960' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1318, 17, 143, 1, CAST(N'2017-03-19 16:22:00.000' AS DateTime), CAST(N'2017-03-19 13:22:31.877' AS DateTime), CAST(N'2017-03-19 13:22:31.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1319, 17, 45, 1, CAST(N'2017-03-19 16:23:00.000' AS DateTime), CAST(N'2017-03-19 13:23:21.843' AS DateTime), CAST(N'2017-03-19 13:23:21.843' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1320, 17, 412, 1, CAST(N'2017-03-19 16:23:00.000' AS DateTime), CAST(N'2017-03-19 13:23:24.267' AS DateTime), CAST(N'2017-03-19 13:23:24.267' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1321, 17, 101, 1, CAST(N'2017-03-19 16:23:00.000' AS DateTime), CAST(N'2017-03-19 13:23:42.713' AS DateTime), CAST(N'2017-03-19 13:23:42.713' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1322, 17, 332, 1, CAST(N'2017-03-19 16:24:00.000' AS DateTime), CAST(N'2017-03-19 13:24:24.177' AS DateTime), CAST(N'2017-03-19 13:24:24.177' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1323, 17, 513, 1, CAST(N'2017-03-19 16:25:00.000' AS DateTime), CAST(N'2017-03-19 13:25:00.507' AS DateTime), CAST(N'2017-03-19 13:25:00.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1324, 17, 435, 1, CAST(N'2017-03-19 16:25:00.000' AS DateTime), CAST(N'2017-03-19 13:25:33.030' AS DateTime), CAST(N'2017-03-19 13:25:33.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1325, 17, 359, 1, CAST(N'2017-03-19 16:25:00.000' AS DateTime), CAST(N'2017-03-19 13:25:38.080' AS DateTime), CAST(N'2017-03-19 13:25:38.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1326, 17, 182, 1, CAST(N'2017-03-19 16:25:00.000' AS DateTime), CAST(N'2017-03-19 13:25:46.080' AS DateTime), CAST(N'2017-03-19 13:25:46.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1327, 17, 548, 1, CAST(N'2017-03-19 16:26:00.000' AS DateTime), CAST(N'2017-03-19 13:26:07.500' AS DateTime), CAST(N'2017-03-19 13:26:07.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1328, 17, 549, 1, CAST(N'2017-03-19 16:26:00.000' AS DateTime), CAST(N'2017-03-19 13:26:15.687' AS DateTime), CAST(N'2017-03-19 13:26:15.687' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1329, 17, 218, 1, CAST(N'2017-03-19 16:28:00.000' AS DateTime), CAST(N'2017-03-19 13:28:32.343' AS DateTime), CAST(N'2017-03-19 13:28:32.343' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1330, 17, 277, 1, CAST(N'2017-03-19 16:29:00.000' AS DateTime), CAST(N'2017-03-19 13:29:53.813' AS DateTime), CAST(N'2017-03-19 13:29:53.813' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1331, 17, 457, 1, CAST(N'2017-03-19 16:30:00.000' AS DateTime), CAST(N'2017-03-19 13:30:27.057' AS DateTime), CAST(N'2017-03-19 13:30:27.057' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1332, 17, 365, 1, CAST(N'2017-03-19 16:31:00.000' AS DateTime), CAST(N'2017-03-19 13:31:14.880' AS DateTime), CAST(N'2017-03-19 13:31:14.880' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1333, 17, 316, 1, CAST(N'2017-03-19 16:31:00.000' AS DateTime), CAST(N'2017-03-19 13:31:42.227' AS DateTime), CAST(N'2017-03-19 13:31:42.227' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1334, 17, 483, 1, CAST(N'2017-03-19 16:32:00.000' AS DateTime), CAST(N'2017-03-19 13:32:45.023' AS DateTime), CAST(N'2017-03-19 13:32:45.023' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1335, 17, 294, 1, CAST(N'2017-03-19 16:35:00.000' AS DateTime), CAST(N'2017-03-19 13:35:15.373' AS DateTime), CAST(N'2017-03-19 13:35:15.373' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1336, 17, 353, 1, CAST(N'2017-03-19 16:37:00.000' AS DateTime), CAST(N'2017-03-19 13:37:14.900' AS DateTime), CAST(N'2017-03-19 13:37:14.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1337, 17, 299, 1, CAST(N'2017-03-19 16:37:00.000' AS DateTime), CAST(N'2017-03-19 13:37:43.280' AS DateTime), CAST(N'2017-03-19 13:37:43.280' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1338, 17, 150, 1, CAST(N'2017-03-19 16:38:00.000' AS DateTime), CAST(N'2017-03-19 13:38:47.273' AS DateTime), CAST(N'2017-03-19 13:38:47.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1339, 17, 422, 1, CAST(N'2017-03-19 16:39:00.000' AS DateTime), CAST(N'2017-03-19 13:39:33.827' AS DateTime), CAST(N'2017-03-19 13:39:33.827' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1340, 17, 481, 1, CAST(N'2017-03-19 16:40:00.000' AS DateTime), CAST(N'2017-03-19 13:40:07.813' AS DateTime), CAST(N'2017-03-19 13:40:07.813' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1341, 17, 48, 1, CAST(N'2017-03-19 16:43:00.000' AS DateTime), CAST(N'2017-03-19 13:43:26.827' AS DateTime), CAST(N'2017-03-19 13:43:26.827' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1342, 17, 321, 1, CAST(N'2017-03-19 16:43:00.000' AS DateTime), CAST(N'2017-03-19 13:43:57.320' AS DateTime), CAST(N'2017-03-19 13:43:57.320' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1343, 17, 330, 1, CAST(N'2017-03-19 16:45:00.000' AS DateTime), CAST(N'2017-03-19 13:45:27.567' AS DateTime), CAST(N'2017-03-19 13:45:27.567' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1344, 17, 51, 1, CAST(N'2017-03-19 16:46:00.000' AS DateTime), CAST(N'2017-03-19 13:46:47.370' AS DateTime), CAST(N'2017-03-19 13:46:47.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1345, 17, 103, 1, CAST(N'2017-03-19 16:55:00.000' AS DateTime), CAST(N'2017-03-19 13:47:21.930' AS DateTime), CAST(N'2017-03-19 13:47:21.930' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1346, 17, 220, 1, CAST(N'2017-03-19 16:49:00.000' AS DateTime), CAST(N'2017-03-19 13:49:13.763' AS DateTime), CAST(N'2017-03-19 13:49:13.763' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1347, 17, 116, 1, CAST(N'2017-03-19 16:49:00.000' AS DateTime), CAST(N'2017-03-19 13:49:22.873' AS DateTime), CAST(N'2017-03-19 13:49:22.873' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1348, 17, 221, 1, CAST(N'2017-03-19 16:49:00.000' AS DateTime), CAST(N'2017-03-19 13:49:46.830' AS DateTime), CAST(N'2017-03-19 13:49:46.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1349, 17, 184, 1, CAST(N'2017-03-19 16:50:00.000' AS DateTime), CAST(N'2017-03-19 13:50:24.823' AS DateTime), CAST(N'2017-03-19 13:50:24.823' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1350, 17, 320, 1, CAST(N'2017-03-19 16:55:00.000' AS DateTime), CAST(N'2017-03-19 13:55:46.293' AS DateTime), CAST(N'2017-03-19 13:55:46.293' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1351, 17, 338, 1, CAST(N'2017-03-19 16:56:00.000' AS DateTime), CAST(N'2017-03-19 13:56:00.937' AS DateTime), CAST(N'2017-03-19 13:56:00.937' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1352, 17, 287, 1, CAST(N'2017-03-19 16:56:00.000' AS DateTime), CAST(N'2017-03-19 13:56:21.660' AS DateTime), CAST(N'2017-03-19 13:56:21.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1353, 17, 395, 1, CAST(N'2017-03-19 16:57:00.000' AS DateTime), CAST(N'2017-03-19 13:57:16.250' AS DateTime), CAST(N'2017-03-19 13:57:16.250' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1354, 17, 403, 1, CAST(N'2017-03-19 16:57:00.000' AS DateTime), CAST(N'2017-03-19 13:57:37.073' AS DateTime), CAST(N'2017-03-19 13:57:37.073' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1355, 17, 405, 1, CAST(N'2017-03-19 16:57:00.000' AS DateTime), CAST(N'2017-03-19 13:57:43.180' AS DateTime), CAST(N'2017-03-19 13:57:43.180' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1356, 17, 418, 1, CAST(N'2017-03-19 16:58:00.000' AS DateTime), CAST(N'2017-03-19 13:58:35.580' AS DateTime), CAST(N'2017-03-19 13:58:35.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1357, 17, 144, 1, CAST(N'2017-03-19 17:00:00.000' AS DateTime), CAST(N'2017-03-19 14:00:27.570' AS DateTime), CAST(N'2017-03-19 14:00:27.570' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1358, 17, 118, 1, CAST(N'2017-03-19 17:00:00.000' AS DateTime), CAST(N'2017-03-19 14:00:56.840' AS DateTime), CAST(N'2017-03-19 14:00:56.840' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1359, 17, 139, 1, CAST(N'2017-03-19 17:02:00.000' AS DateTime), CAST(N'2017-03-19 14:02:31.387' AS DateTime), CAST(N'2017-03-19 14:02:31.387' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1360, 17, 140, 1, CAST(N'2017-03-19 17:02:00.000' AS DateTime), CAST(N'2017-03-19 14:02:56.543' AS DateTime), CAST(N'2017-03-19 14:02:56.543' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1361, 17, 270, 1, CAST(N'2017-03-19 17:03:00.000' AS DateTime), CAST(N'2017-03-19 14:03:26.503' AS DateTime), CAST(N'2017-03-19 14:03:26.503' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1362, 17, 163, 1, CAST(N'2017-03-19 17:03:00.000' AS DateTime), CAST(N'2017-03-19 14:03:28.940' AS DateTime), CAST(N'2017-03-19 14:03:28.940' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1363, 17, 157, 1, CAST(N'2017-03-19 17:03:00.000' AS DateTime), CAST(N'2017-03-19 14:03:32.927' AS DateTime), CAST(N'2017-03-19 14:03:32.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1364, 17, 535, 1, CAST(N'2017-03-19 17:04:00.000' AS DateTime), CAST(N'2017-03-19 14:04:35.887' AS DateTime), CAST(N'2017-03-19 14:04:35.887' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1365, 17, 326, 1, CAST(N'2017-03-19 17:05:00.000' AS DateTime), CAST(N'2017-03-19 14:04:52.860' AS DateTime), CAST(N'2017-03-19 14:04:52.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1366, 17, 539, 1, CAST(N'2017-03-19 17:06:00.000' AS DateTime), CAST(N'2017-03-19 14:06:32.417' AS DateTime), CAST(N'2017-03-19 14:06:32.417' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1367, 17, 141, 1, CAST(N'2017-03-19 17:09:00.000' AS DateTime), CAST(N'2017-03-19 14:08:37.427' AS DateTime), CAST(N'2017-03-19 14:08:37.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1368, 17, 476, 1, CAST(N'2017-03-19 17:10:00.000' AS DateTime), CAST(N'2017-03-19 14:10:08.017' AS DateTime), CAST(N'2017-03-19 14:10:08.017' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1369, 17, 458, 1, CAST(N'2017-03-19 17:11:00.000' AS DateTime), CAST(N'2017-03-19 14:11:09.247' AS DateTime), CAST(N'2017-03-19 14:11:09.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1370, 17, 127, 1, CAST(N'2017-03-19 17:14:00.000' AS DateTime), CAST(N'2017-03-19 14:14:27.020' AS DateTime), CAST(N'2017-03-19 14:14:27.020' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1371, 17, 3, 1, CAST(N'2017-03-19 17:16:00.000' AS DateTime), CAST(N'2017-03-19 14:16:40.850' AS DateTime), CAST(N'2017-03-19 14:16:40.850' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1372, 17, 25, 1, CAST(N'2017-03-19 17:16:00.000' AS DateTime), CAST(N'2017-03-19 14:16:50.093' AS DateTime), CAST(N'2017-03-19 14:16:50.093' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1373, 17, 53, 1, CAST(N'2017-03-19 17:17:00.000' AS DateTime), CAST(N'2017-03-19 14:17:17.817' AS DateTime), CAST(N'2017-03-19 14:17:17.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1374, 17, 68, 1, CAST(N'2017-03-19 17:18:00.000' AS DateTime), CAST(N'2017-03-19 14:18:03.900' AS DateTime), CAST(N'2017-03-19 14:18:03.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1375, 17, 72, 1, CAST(N'2017-03-19 17:18:00.000' AS DateTime), CAST(N'2017-03-19 14:18:06.120' AS DateTime), CAST(N'2017-03-19 14:18:06.120' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1376, 17, 87, 1, CAST(N'2017-03-19 17:18:00.000' AS DateTime), CAST(N'2017-03-19 14:18:26.927' AS DateTime), CAST(N'2017-03-19 14:18:26.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1377, 17, 107, 1, CAST(N'2017-03-19 17:18:00.000' AS DateTime), CAST(N'2017-03-19 14:18:35.320' AS DateTime), CAST(N'2017-03-19 14:18:35.320' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1378, 17, 119, 1, CAST(N'2017-03-19 17:18:00.000' AS DateTime), CAST(N'2017-03-19 14:18:45.073' AS DateTime), CAST(N'2017-03-19 14:18:45.073' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1379, 17, 120, 1, CAST(N'2017-03-19 17:18:00.000' AS DateTime), CAST(N'2017-03-19 14:18:45.730' AS DateTime), CAST(N'2017-03-19 14:18:45.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1380, 17, 177, 1, CAST(N'2017-03-19 17:19:00.000' AS DateTime), CAST(N'2017-03-19 14:19:21.877' AS DateTime), CAST(N'2017-03-19 14:19:21.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1381, 17, 244, 1, CAST(N'2017-03-19 17:20:00.000' AS DateTime), CAST(N'2017-03-19 14:20:53.097' AS DateTime), CAST(N'2017-03-19 14:20:53.097' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1382, 17, 203, 1, CAST(N'2017-03-19 17:21:00.000' AS DateTime), CAST(N'2017-03-19 14:21:31.600' AS DateTime), CAST(N'2017-03-19 14:21:31.600' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1383, 17, 285, 1, CAST(N'2017-03-19 17:21:00.000' AS DateTime), CAST(N'2017-03-19 14:21:50.710' AS DateTime), CAST(N'2017-03-19 14:21:50.710' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1384, 17, 296, 1, CAST(N'2017-03-19 17:22:00.000' AS DateTime), CAST(N'2017-03-19 14:22:09.130' AS DateTime), CAST(N'2017-03-19 14:22:09.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1385, 17, 302, 1, CAST(N'2017-03-19 17:22:00.000' AS DateTime), CAST(N'2017-03-19 14:22:20.560' AS DateTime), CAST(N'2017-03-19 14:22:20.560' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1386, 17, 311, 1, CAST(N'2017-03-19 17:22:00.000' AS DateTime), CAST(N'2017-03-19 14:22:24.617' AS DateTime), CAST(N'2017-03-19 14:22:24.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1387, 17, 337, 1, CAST(N'2017-03-19 17:22:00.000' AS DateTime), CAST(N'2017-03-19 14:22:33.370' AS DateTime), CAST(N'2017-03-19 14:22:33.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1388, 17, 341, 1, CAST(N'2017-03-19 17:22:00.000' AS DateTime), CAST(N'2017-03-19 14:22:36.300' AS DateTime), CAST(N'2017-03-19 14:22:36.300' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1389, 17, 358, 1, CAST(N'2017-03-19 17:22:00.000' AS DateTime), CAST(N'2017-03-19 14:22:46.877' AS DateTime), CAST(N'2017-03-19 14:22:46.877' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1390, 17, 407, 1, CAST(N'2017-03-19 17:23:00.000' AS DateTime), CAST(N'2017-03-19 14:23:46.170' AS DateTime), CAST(N'2017-03-19 14:23:46.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1391, 17, 408, 1, CAST(N'2017-03-19 17:23:00.000' AS DateTime), CAST(N'2017-03-19 14:23:47.200' AS DateTime), CAST(N'2017-03-19 14:23:47.200' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1392, 17, 443, 1, CAST(N'2017-03-19 17:24:00.000' AS DateTime), CAST(N'2017-03-19 14:24:11.847' AS DateTime), CAST(N'2017-03-19 14:24:11.847' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1393, 17, 449, 1, CAST(N'2017-03-19 17:24:00.000' AS DateTime), CAST(N'2017-03-19 14:24:14.993' AS DateTime), CAST(N'2017-03-19 14:24:14.993' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1394, 17, 480, 1, CAST(N'2017-03-19 17:24:00.000' AS DateTime), CAST(N'2017-03-19 14:24:42.230' AS DateTime), CAST(N'2017-03-19 14:24:42.230' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1395, 17, 349, 1, CAST(N'2017-03-19 17:25:00.000' AS DateTime), CAST(N'2017-03-19 14:25:35.450' AS DateTime), CAST(N'2017-03-19 14:25:35.450' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1396, 17, 452, 1, CAST(N'2017-03-19 17:25:00.000' AS DateTime), CAST(N'2017-03-19 14:25:52.130' AS DateTime), CAST(N'2017-03-19 14:25:52.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1397, 17, 451, 1, CAST(N'2017-03-19 17:25:00.000' AS DateTime), CAST(N'2017-03-19 14:25:56.340' AS DateTime), CAST(N'2017-03-19 14:25:56.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1398, 17, 454, 1, CAST(N'2017-03-19 17:25:00.000' AS DateTime), CAST(N'2017-03-19 14:26:00.533' AS DateTime), CAST(N'2017-03-19 14:26:00.533' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1399, 17, 493, 1, CAST(N'2017-03-19 17:26:00.000' AS DateTime), CAST(N'2017-03-19 14:26:22.347' AS DateTime), CAST(N'2017-03-19 14:26:22.347' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1400, 17, 404, 1, CAST(N'2017-03-19 17:26:00.000' AS DateTime), CAST(N'2017-03-19 14:26:45.090' AS DateTime), CAST(N'2017-03-19 14:26:45.090' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1401, 17, 509, 1, CAST(N'2017-03-19 17:26:00.000' AS DateTime), CAST(N'2017-03-19 14:26:57.437' AS DateTime), CAST(N'2017-03-19 14:26:57.437' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1402, 17, 514, 1, CAST(N'2017-03-19 17:27:00.000' AS DateTime), CAST(N'2017-03-19 14:27:04.357' AS DateTime), CAST(N'2017-03-19 14:27:04.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1403, 17, 521, 1, CAST(N'2017-03-19 17:27:00.000' AS DateTime), CAST(N'2017-03-19 14:27:09.270' AS DateTime), CAST(N'2017-03-19 14:27:09.270' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1404, 17, 399, 1, CAST(N'2017-03-19 17:27:00.000' AS DateTime), CAST(N'2017-03-19 14:27:44.160' AS DateTime), CAST(N'2017-03-19 14:27:44.160' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1405, 17, 507, 1, CAST(N'2017-03-19 17:29:00.000' AS DateTime), CAST(N'2017-03-19 14:29:01.943' AS DateTime), CAST(N'2017-03-19 14:29:01.943' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1406, 17, 94, 1, CAST(N'2017-03-19 17:29:00.000' AS DateTime), CAST(N'2017-03-19 14:29:04.707' AS DateTime), CAST(N'2017-03-19 14:29:04.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1407, 17, 402, 1, CAST(N'2017-03-19 17:29:00.000' AS DateTime), CAST(N'2017-03-19 14:30:00.430' AS DateTime), CAST(N'2017-03-19 14:30:00.430' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1408, 17, 346, 1, CAST(N'2017-03-19 17:30:00.000' AS DateTime), CAST(N'2017-03-19 14:30:26.310' AS DateTime), CAST(N'2017-03-19 14:30:26.310' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1409, 17, 325, 1, CAST(N'2017-03-19 17:30:00.000' AS DateTime), CAST(N'2017-03-19 14:30:35.407' AS DateTime), CAST(N'2017-03-19 14:30:35.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1410, 17, 266, 1, CAST(N'2017-03-19 17:31:00.000' AS DateTime), CAST(N'2017-03-19 14:31:25.030' AS DateTime), CAST(N'2017-03-19 14:31:25.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1411, 17, 261, 1, CAST(N'2017-03-19 17:31:00.000' AS DateTime), CAST(N'2017-03-19 14:31:32.007' AS DateTime), CAST(N'2017-03-19 14:31:32.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1412, 17, 502, 1, CAST(N'2017-03-19 17:34:00.000' AS DateTime), CAST(N'2017-03-19 14:34:25.727' AS DateTime), CAST(N'2017-03-19 14:34:25.727' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1413, 17, 559, 1, CAST(N'2017-03-19 17:35:00.000' AS DateTime), CAST(N'2017-03-19 14:35:05.497' AS DateTime), CAST(N'2017-03-19 14:35:05.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1414, 17, 558, 1, CAST(N'2017-03-19 17:35:00.000' AS DateTime), CAST(N'2017-03-19 14:35:08.053' AS DateTime), CAST(N'2017-03-19 14:35:08.053' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1415, 17, 560, 1, CAST(N'2017-03-19 17:35:00.000' AS DateTime), CAST(N'2017-03-19 14:35:12.087' AS DateTime), CAST(N'2017-03-19 14:35:12.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1416, 17, 561, 1, CAST(N'2017-03-19 17:35:00.000' AS DateTime), CAST(N'2017-03-19 14:35:29.810' AS DateTime), CAST(N'2017-03-19 14:35:29.810' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1417, 17, 557, 1, CAST(N'2017-03-19 17:35:00.000' AS DateTime), CAST(N'2017-03-19 14:35:34.053' AS DateTime), CAST(N'2017-03-19 14:35:34.053' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1418, 17, 556, 1, CAST(N'2017-03-19 17:35:00.000' AS DateTime), CAST(N'2017-03-19 14:35:48.537' AS DateTime), CAST(N'2017-03-19 14:35:48.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1419, 17, 555, 1, CAST(N'2017-03-19 17:35:00.000' AS DateTime), CAST(N'2017-03-19 14:35:55.813' AS DateTime), CAST(N'2017-03-19 14:35:55.813' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1420, 17, 554, 1, CAST(N'2017-03-19 17:36:00.000' AS DateTime), CAST(N'2017-03-19 14:36:07.780' AS DateTime), CAST(N'2017-03-19 14:36:07.780' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1421, 17, 181, 1, CAST(N'2017-03-19 17:36:00.000' AS DateTime), CAST(N'2017-03-19 14:36:11.047' AS DateTime), CAST(N'2017-03-19 14:36:11.047' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1422, 17, 553, 1, CAST(N'2017-03-19 17:36:00.000' AS DateTime), CAST(N'2017-03-19 14:36:32.273' AS DateTime), CAST(N'2017-03-19 14:36:32.273' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1423, 17, 168, 1, CAST(N'2017-03-19 17:36:00.000' AS DateTime), CAST(N'2017-03-19 14:36:37.947' AS DateTime), CAST(N'2017-03-19 14:36:37.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1424, 17, 552, 1, CAST(N'2017-03-19 17:36:00.000' AS DateTime), CAST(N'2017-03-19 14:36:43.090' AS DateTime), CAST(N'2017-03-19 14:36:43.090' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1425, 17, 551, 1, CAST(N'2017-03-19 17:36:00.000' AS DateTime), CAST(N'2017-03-19 14:36:51.623' AS DateTime), CAST(N'2017-03-19 14:36:51.623' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1426, 17, 550, 1, CAST(N'2017-03-19 17:37:00.000' AS DateTime), CAST(N'2017-03-19 14:37:02.520' AS DateTime), CAST(N'2017-03-19 14:37:02.520' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1427, 18, 273, 1, CAST(N'2017-03-26 15:39:00.000' AS DateTime), CAST(N'2017-03-26 12:39:43.407' AS DateTime), CAST(N'2017-03-26 12:39:43.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1428, 18, 16, 1, CAST(N'2017-03-26 15:47:00.000' AS DateTime), CAST(N'2017-03-26 12:47:21.160' AS DateTime), CAST(N'2017-03-26 12:47:21.160' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1429, 18, 504, 1, CAST(N'2017-03-26 15:47:00.000' AS DateTime), CAST(N'2017-03-26 12:47:40.003' AS DateTime), CAST(N'2017-03-26 12:47:40.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1430, 18, 59, 1, CAST(N'2017-03-26 15:47:00.000' AS DateTime), CAST(N'2017-03-26 12:47:42.780' AS DateTime), CAST(N'2017-03-26 12:47:42.780' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1431, 18, 60, 1, CAST(N'2017-03-26 15:47:00.000' AS DateTime), CAST(N'2017-03-26 12:47:44.707' AS DateTime), CAST(N'2017-03-26 12:47:44.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1432, 18, 64, 1, CAST(N'2017-03-26 15:47:00.000' AS DateTime), CAST(N'2017-03-26 12:47:51.943' AS DateTime), CAST(N'2017-03-26 12:47:51.943' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1433, 18, 105, 1, CAST(N'2017-03-26 15:48:00.000' AS DateTime), CAST(N'2017-03-26 12:48:32.083' AS DateTime), CAST(N'2017-03-26 12:48:32.083' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1434, 18, 106, 1, CAST(N'2017-03-26 15:48:00.000' AS DateTime), CAST(N'2017-03-26 12:48:33.470' AS DateTime), CAST(N'2017-03-26 12:48:33.470' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1435, 18, 120, 1, CAST(N'2017-03-26 15:48:00.000' AS DateTime), CAST(N'2017-03-26 12:48:50.170' AS DateTime), CAST(N'2017-03-26 12:48:50.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1436, 18, 128, 1, CAST(N'2017-03-26 15:49:00.000' AS DateTime), CAST(N'2017-03-26 12:49:01.630' AS DateTime), CAST(N'2017-03-26 12:49:01.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1437, 18, 139, 1, CAST(N'2017-03-26 15:49:00.000' AS DateTime), CAST(N'2017-03-26 12:49:15.447' AS DateTime), CAST(N'2017-03-26 12:49:15.447' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1438, 18, 164, 1, CAST(N'2017-03-26 15:49:00.000' AS DateTime), CAST(N'2017-03-26 12:49:46.290' AS DateTime), CAST(N'2017-03-26 12:49:46.290' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1439, 18, 332, 1, CAST(N'2017-03-26 15:51:00.000' AS DateTime), CAST(N'2017-03-26 12:51:43.867' AS DateTime), CAST(N'2017-03-26 12:51:43.867' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1440, 18, 385, 1, CAST(N'2017-03-26 15:52:00.000' AS DateTime), CAST(N'2017-03-26 12:52:09.800' AS DateTime), CAST(N'2017-03-26 12:52:09.800' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1441, 18, 345, 1, CAST(N'2017-03-26 15:53:00.000' AS DateTime), CAST(N'2017-03-26 12:53:13.613' AS DateTime), CAST(N'2017-03-26 12:53:13.613' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1442, 18, 133, 1, CAST(N'2017-03-26 15:53:00.000' AS DateTime), CAST(N'2017-03-26 12:53:29.340' AS DateTime), CAST(N'2017-03-26 12:53:29.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1443, 18, 359, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:04.203' AS DateTime), CAST(N'2017-03-26 12:54:04.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1444, 18, 341, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:09.557' AS DateTime), CAST(N'2017-03-26 12:54:09.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1445, 18, 309, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:10.910' AS DateTime), CAST(N'2017-03-26 12:54:10.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1446, 18, 432, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:20.953' AS DateTime), CAST(N'2017-03-26 12:54:20.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1447, 18, 434, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:21.187' AS DateTime), CAST(N'2017-03-26 12:54:21.187' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1448, 18, 278, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:33.690' AS DateTime), CAST(N'2017-03-26 12:54:33.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1449, 18, 222, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:34.743' AS DateTime), CAST(N'2017-03-26 12:54:34.743' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1450, 18, 200, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:40.897' AS DateTime), CAST(N'2017-03-26 12:54:40.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1451, 18, 83, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:43.950' AS DateTime), CAST(N'2017-03-26 12:54:43.950' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1452, 18, 85, 1, CAST(N'2017-03-26 15:54:00.000' AS DateTime), CAST(N'2017-03-26 12:54:57.443' AS DateTime), CAST(N'2017-03-26 12:54:57.443' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1453, 18, 196, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:14.900' AS DateTime), CAST(N'2017-03-26 12:55:14.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1454, 18, 80, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:22.783' AS DateTime), CAST(N'2017-03-26 12:55:22.783' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1455, 18, 547, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:26.633' AS DateTime), CAST(N'2017-03-26 12:55:26.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1456, 18, 406, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:34.080' AS DateTime), CAST(N'2017-03-26 12:55:34.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1457, 18, 407, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:47.420' AS DateTime), CAST(N'2017-03-26 12:55:47.420' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1458, 18, 486, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:53.967' AS DateTime), CAST(N'2017-03-26 12:55:53.967' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1459, 18, 305, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:56.750' AS DateTime), CAST(N'2017-03-26 12:55:56.750' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1460, 18, 481, 1, CAST(N'2017-03-26 15:55:00.000' AS DateTime), CAST(N'2017-03-26 12:55:57.983' AS DateTime), CAST(N'2017-03-26 12:55:57.983' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1461, 18, 25, 1, CAST(N'2017-03-26 15:56:00.000' AS DateTime), CAST(N'2017-03-26 12:56:06.343' AS DateTime), CAST(N'2017-03-26 12:56:06.343' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1462, 18, 34, 1, CAST(N'2017-03-26 15:56:00.000' AS DateTime), CAST(N'2017-03-26 12:56:14.070' AS DateTime), CAST(N'2017-03-26 12:56:14.070' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1463, 18, 99, 1, CAST(N'2017-03-26 15:56:00.000' AS DateTime), CAST(N'2017-03-26 12:56:17.277' AS DateTime), CAST(N'2017-03-26 12:56:17.277' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1464, 18, 136, 1, CAST(N'2017-03-26 15:56:00.000' AS DateTime), CAST(N'2017-03-26 12:56:37.007' AS DateTime), CAST(N'2017-03-26 12:56:37.007' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1465, 18, 507, 1, CAST(N'2017-03-26 15:56:00.000' AS DateTime), CAST(N'2017-03-26 12:56:53.013' AS DateTime), CAST(N'2017-03-26 12:56:53.013' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1466, 18, 380, 1, CAST(N'2017-03-26 15:56:00.000' AS DateTime), CAST(N'2017-03-26 12:56:54.133' AS DateTime), CAST(N'2017-03-26 12:56:54.133' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1467, 18, 121, 1, CAST(N'2017-03-26 15:57:00.000' AS DateTime), CAST(N'2017-03-26 12:57:14.773' AS DateTime), CAST(N'2017-03-26 12:57:14.773' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1468, 18, 286, 1, CAST(N'2017-03-26 15:57:00.000' AS DateTime), CAST(N'2017-03-26 12:57:15.567' AS DateTime), CAST(N'2017-03-26 12:57:15.567' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1469, 18, 181, 1, CAST(N'2017-03-26 15:57:00.000' AS DateTime), CAST(N'2017-03-26 12:57:32.247' AS DateTime), CAST(N'2017-03-26 12:57:32.247' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1470, 18, 66, 1, CAST(N'2017-03-26 15:57:00.000' AS DateTime), CAST(N'2017-03-26 12:57:54.920' AS DateTime), CAST(N'2017-03-26 12:57:54.920' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1471, 18, 335, 1, CAST(N'2017-03-26 15:58:00.000' AS DateTime), CAST(N'2017-03-26 12:58:19.630' AS DateTime), CAST(N'2017-03-26 12:58:19.630' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1472, 18, 146, 1, CAST(N'2017-03-26 15:58:00.000' AS DateTime), CAST(N'2017-03-26 12:58:24.337' AS DateTime), CAST(N'2017-03-26 12:58:24.337' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1473, 18, 320, 1, CAST(N'2017-03-26 15:58:00.000' AS DateTime), CAST(N'2017-03-26 12:58:34.933' AS DateTime), CAST(N'2017-03-26 12:58:34.933' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1474, 18, 458, 1, CAST(N'2017-03-26 15:58:00.000' AS DateTime), CAST(N'2017-03-26 12:58:41.240' AS DateTime), CAST(N'2017-03-26 12:58:41.240' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1475, 18, 161, 1, CAST(N'2017-03-26 15:58:00.000' AS DateTime), CAST(N'2017-03-26 12:58:44.130' AS DateTime), CAST(N'2017-03-26 12:58:44.130' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1476, 18, 375, 1, CAST(N'2017-03-26 15:59:00.000' AS DateTime), CAST(N'2017-03-26 12:59:02.027' AS DateTime), CAST(N'2017-03-26 12:59:02.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1477, 18, 82, 1, CAST(N'2017-03-26 15:59:00.000' AS DateTime), CAST(N'2017-03-26 12:59:04.773' AS DateTime), CAST(N'2017-03-26 12:59:04.773' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1478, 18, 390, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 12:59:13.270' AS DateTime), CAST(N'2017-03-26 12:59:13.270' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1479, 18, 303, 1, CAST(N'2017-03-26 16:04:00.000' AS DateTime), CAST(N'2017-03-26 12:59:38.897' AS DateTime), CAST(N'2017-03-26 12:59:38.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1480, 18, 477, 1, CAST(N'2017-03-26 15:59:00.000' AS DateTime), CAST(N'2017-03-26 12:59:52.453' AS DateTime), CAST(N'2017-03-26 12:59:52.453' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1481, 18, 392, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:01.900' AS DateTime), CAST(N'2017-03-26 13:00:01.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1482, 18, 402, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:02.603' AS DateTime), CAST(N'2017-03-26 13:00:02.603' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1483, 18, 55, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:05.187' AS DateTime), CAST(N'2017-03-26 13:00:05.187' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1484, 18, 524, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:08.870' AS DateTime), CAST(N'2017-03-26 13:00:08.870' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1485, 18, 474, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:10.093' AS DateTime), CAST(N'2017-03-26 13:00:10.093' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1486, 18, 323, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:12.363' AS DateTime), CAST(N'2017-03-26 13:00:12.363' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1487, 18, 180, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:18.737' AS DateTime), CAST(N'2017-03-26 13:00:18.737' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1488, 18, 494, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:20.790' AS DateTime), CAST(N'2017-03-26 13:00:20.790' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1489, 18, 277, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:00:35.263' AS DateTime), CAST(N'2017-03-26 13:00:35.263' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1490, 18, 365, 1, CAST(N'2017-03-26 16:00:00.000' AS DateTime), CAST(N'2017-03-26 13:01:00.120' AS DateTime), CAST(N'2017-03-26 13:01:00.120' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1491, 18, 558, 1, CAST(N'2017-03-26 16:01:00.000' AS DateTime), CAST(N'2017-03-26 13:01:13.950' AS DateTime), CAST(N'2017-03-26 13:01:13.950' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1492, 18, 403, 1, CAST(N'2017-03-26 16:01:00.000' AS DateTime), CAST(N'2017-03-26 13:01:44.230' AS DateTime), CAST(N'2017-03-26 13:01:44.230' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1493, 18, 334, 1, CAST(N'2017-03-26 16:01:00.000' AS DateTime), CAST(N'2017-03-26 13:01:48.690' AS DateTime), CAST(N'2017-03-26 13:01:48.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1494, 18, 127, 1, CAST(N'2017-03-26 16:02:00.000' AS DateTime), CAST(N'2017-03-26 13:02:20.057' AS DateTime), CAST(N'2017-03-26 13:02:20.057' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1495, 18, 15, 1, CAST(N'2017-03-26 16:02:00.000' AS DateTime), CAST(N'2017-03-26 13:02:55.613' AS DateTime), CAST(N'2017-03-26 13:02:55.613' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1496, 18, 455, 1, CAST(N'2017-03-26 16:03:00.000' AS DateTime), CAST(N'2017-03-26 13:03:59.897' AS DateTime), CAST(N'2017-03-26 13:03:59.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1497, 18, 243, 1, CAST(N'2017-03-26 16:04:00.000' AS DateTime), CAST(N'2017-03-26 13:04:10.087' AS DateTime), CAST(N'2017-03-26 13:04:10.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1498, 18, 107, 1, CAST(N'2017-03-26 16:04:00.000' AS DateTime), CAST(N'2017-03-26 13:04:56.343' AS DateTime), CAST(N'2017-03-26 13:04:56.343' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1499, 18, 22, 1, CAST(N'2017-03-26 16:06:00.000' AS DateTime), CAST(N'2017-03-26 13:06:11.390' AS DateTime), CAST(N'2017-03-26 13:06:11.390' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1500, 18, 268, 1, CAST(N'2017-03-26 16:08:00.000' AS DateTime), CAST(N'2017-03-26 13:06:28.423' AS DateTime), CAST(N'2017-03-26 13:06:28.423' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1501, 18, 319, 1, CAST(N'2017-03-26 16:06:00.000' AS DateTime), CAST(N'2017-03-26 13:06:49.190' AS DateTime), CAST(N'2017-03-26 13:06:49.190' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1502, 18, 405, 1, CAST(N'2017-03-26 16:07:00.000' AS DateTime), CAST(N'2017-03-26 13:07:31.557' AS DateTime), CAST(N'2017-03-26 13:07:31.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1503, 18, 103, 1, CAST(N'2017-03-26 16:08:00.000' AS DateTime), CAST(N'2017-03-26 13:07:43.670' AS DateTime), CAST(N'2017-03-26 13:07:43.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1504, 18, 296, 1, CAST(N'2017-03-26 16:08:00.000' AS DateTime), CAST(N'2017-03-26 13:08:15.927' AS DateTime), CAST(N'2017-03-26 13:08:15.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1505, 18, 459, 1, CAST(N'2017-03-26 16:08:00.000' AS DateTime), CAST(N'2017-03-26 13:08:26.567' AS DateTime), CAST(N'2017-03-26 13:08:26.567' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1506, 18, 535, 1, CAST(N'2017-03-26 16:08:00.000' AS DateTime), CAST(N'2017-03-26 13:08:46.917' AS DateTime), CAST(N'2017-03-26 13:08:46.917' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1507, 18, 36, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 13:09:02.650' AS DateTime), CAST(N'2017-03-26 13:09:02.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1508, 18, 279, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 13:09:13.297' AS DateTime), CAST(N'2017-03-26 13:09:13.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1509, 18, 436, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 13:09:17.910' AS DateTime), CAST(N'2017-03-26 13:09:17.910' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1510, 18, 197, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 13:09:18.173' AS DateTime), CAST(N'2017-03-26 13:09:18.173' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1511, 18, 260, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 13:09:23.203' AS DateTime), CAST(N'2017-03-26 13:09:23.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1512, 18, 118, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 13:09:33.373' AS DateTime), CAST(N'2017-03-26 13:09:33.373' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1513, 18, 487, 1, CAST(N'2017-03-26 16:09:00.000' AS DateTime), CAST(N'2017-03-26 13:09:57.077' AS DateTime), CAST(N'2017-03-26 13:09:57.077' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1514, 18, 510, 1, CAST(N'2017-03-26 16:10:00.000' AS DateTime), CAST(N'2017-03-26 13:10:03.253' AS DateTime), CAST(N'2017-03-26 13:10:03.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1515, 18, 123, 1, CAST(N'2017-03-26 16:10:00.000' AS DateTime), CAST(N'2017-03-26 13:10:18.290' AS DateTime), CAST(N'2017-03-26 13:10:18.290' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1516, 18, 29, 1, CAST(N'2017-03-26 16:10:00.000' AS DateTime), CAST(N'2017-03-26 13:10:31.777' AS DateTime), CAST(N'2017-03-26 13:10:31.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1517, 18, 424, 1, CAST(N'2017-03-26 16:12:00.000' AS DateTime), CAST(N'2017-03-26 13:10:48.607' AS DateTime), CAST(N'2017-03-26 13:10:48.607' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1518, 18, 179, 1, CAST(N'2017-03-26 16:10:00.000' AS DateTime), CAST(N'2017-03-26 13:10:55.947' AS DateTime), CAST(N'2017-03-26 13:10:55.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1519, 18, 344, 1, CAST(N'2017-03-26 16:11:00.000' AS DateTime), CAST(N'2017-03-26 13:11:04.113' AS DateTime), CAST(N'2017-03-26 13:11:04.113' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1520, 18, 241, 1, CAST(N'2017-03-26 16:11:00.000' AS DateTime), CAST(N'2017-03-26 13:11:12.037' AS DateTime), CAST(N'2017-03-26 13:11:12.037' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1521, 18, 156, 1, CAST(N'2017-03-26 16:11:00.000' AS DateTime), CAST(N'2017-03-26 13:11:12.497' AS DateTime), CAST(N'2017-03-26 13:11:12.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1522, 18, 205, 1, CAST(N'2017-03-26 16:11:00.000' AS DateTime), CAST(N'2017-03-26 13:11:19.557' AS DateTime), CAST(N'2017-03-26 13:11:19.557' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1523, 18, 84, 1, CAST(N'2017-03-26 16:11:00.000' AS DateTime), CAST(N'2017-03-26 13:11:29.000' AS DateTime), CAST(N'2017-03-26 13:11:29.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1524, 18, 349, 1, CAST(N'2017-03-26 16:11:00.000' AS DateTime), CAST(N'2017-03-26 13:11:34.307' AS DateTime), CAST(N'2017-03-26 13:11:34.307' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1525, 18, 480, 1, CAST(N'2017-03-26 16:11:00.000' AS DateTime), CAST(N'2017-03-26 13:11:45.243' AS DateTime), CAST(N'2017-03-26 13:11:45.243' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1526, 18, 299, 1, CAST(N'2017-03-26 16:12:00.000' AS DateTime), CAST(N'2017-03-26 13:12:21.027' AS DateTime), CAST(N'2017-03-26 13:12:21.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1527, 18, 53, 1, CAST(N'2017-03-26 16:12:00.000' AS DateTime), CAST(N'2017-03-26 13:12:35.340' AS DateTime), CAST(N'2017-03-26 13:12:35.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1528, 18, 520, 1, CAST(N'2017-03-26 16:12:00.000' AS DateTime), CAST(N'2017-03-26 13:12:37.307' AS DateTime), CAST(N'2017-03-26 13:12:37.307' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1529, 18, 237, 1, CAST(N'2017-03-26 16:12:00.000' AS DateTime), CAST(N'2017-03-26 13:12:55.313' AS DateTime), CAST(N'2017-03-26 13:12:55.313' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1530, 18, 65, 1, CAST(N'2017-03-26 16:12:00.000' AS DateTime), CAST(N'2017-03-26 13:12:58.483' AS DateTime), CAST(N'2017-03-26 13:12:58.483' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1531, 18, 125, 1, CAST(N'2017-03-26 16:13:00.000' AS DateTime), CAST(N'2017-03-26 13:13:02.093' AS DateTime), CAST(N'2017-03-26 13:13:02.093' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1532, 18, 155, 1, CAST(N'2017-03-26 16:13:00.000' AS DateTime), CAST(N'2017-03-26 13:13:25.830' AS DateTime), CAST(N'2017-03-26 13:13:25.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1533, 18, 141, 1, CAST(N'2017-03-26 16:13:00.000' AS DateTime), CAST(N'2017-03-26 13:13:49.000' AS DateTime), CAST(N'2017-03-26 13:13:49.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1534, 18, 548, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:05.993' AS DateTime), CAST(N'2017-03-26 13:14:05.993' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1535, 18, 101, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:10.373' AS DateTime), CAST(N'2017-03-26 13:14:10.373' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1536, 18, 238, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:12.633' AS DateTime), CAST(N'2017-03-26 13:14:12.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1537, 18, 285, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:15.140' AS DateTime), CAST(N'2017-03-26 13:14:15.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1538, 18, 204, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:23.693' AS DateTime), CAST(N'2017-03-26 13:14:23.693' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1539, 18, 461, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:38.117' AS DateTime), CAST(N'2017-03-26 13:14:38.117' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1540, 18, 70, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:41.287' AS DateTime), CAST(N'2017-03-26 13:14:41.287' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1541, 18, 326, 1, CAST(N'2017-03-26 16:14:00.000' AS DateTime), CAST(N'2017-03-26 13:14:55.633' AS DateTime), CAST(N'2017-03-26 13:14:55.633' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1542, 18, 496, 1, CAST(N'2017-03-26 16:15:00.000' AS DateTime), CAST(N'2017-03-26 13:15:10.943' AS DateTime), CAST(N'2017-03-26 13:15:10.943' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1543, 18, 150, 1, CAST(N'2017-03-26 16:16:00.000' AS DateTime), CAST(N'2017-03-26 13:15:22.377' AS DateTime), CAST(N'2017-03-26 13:15:22.377' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1544, 18, 442, 1, CAST(N'2017-03-26 16:15:00.000' AS DateTime), CAST(N'2017-03-26 13:15:29.073' AS DateTime), CAST(N'2017-03-26 13:15:29.073' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1545, 18, 104, 1, CAST(N'2017-03-26 16:15:00.000' AS DateTime), CAST(N'2017-03-26 13:15:42.833' AS DateTime), CAST(N'2017-03-26 13:15:42.833' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1546, 18, 338, 1, CAST(N'2017-03-26 16:15:00.000' AS DateTime), CAST(N'2017-03-26 13:15:43.323' AS DateTime), CAST(N'2017-03-26 13:15:43.323' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1547, 18, 437, 1, CAST(N'2017-03-26 16:16:00.000' AS DateTime), CAST(N'2017-03-26 13:16:07.303' AS DateTime), CAST(N'2017-03-26 13:16:07.303' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1548, 18, 422, 1, CAST(N'2017-03-26 16:16:00.000' AS DateTime), CAST(N'2017-03-26 13:16:17.623' AS DateTime), CAST(N'2017-03-26 13:16:17.623' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1549, 18, 69, 1, CAST(N'2017-03-26 16:16:00.000' AS DateTime), CAST(N'2017-03-26 13:16:45.830' AS DateTime), CAST(N'2017-03-26 13:16:45.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1550, 18, 158, 1, CAST(N'2017-03-26 16:17:00.000' AS DateTime), CAST(N'2017-03-26 13:17:14.677' AS DateTime), CAST(N'2017-03-26 13:17:14.677' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1551, 18, 51, 1, CAST(N'2017-03-26 16:17:00.000' AS DateTime), CAST(N'2017-03-26 13:17:40.207' AS DateTime), CAST(N'2017-03-26 13:17:40.207' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1552, 18, 445, 1, CAST(N'2017-03-26 16:19:00.000' AS DateTime), CAST(N'2017-03-26 13:19:33.080' AS DateTime), CAST(N'2017-03-26 13:19:33.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1553, 18, 221, 1, CAST(N'2017-03-26 16:20:00.000' AS DateTime), CAST(N'2017-03-26 13:20:21.230' AS DateTime), CAST(N'2017-03-26 13:20:21.230' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1554, 18, 433, 1, CAST(N'2017-03-26 16:20:00.000' AS DateTime), CAST(N'2017-03-26 13:20:49.180' AS DateTime), CAST(N'2017-03-26 13:20:49.180' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1555, 18, 457, 1, CAST(N'2017-03-26 16:20:00.000' AS DateTime), CAST(N'2017-03-26 13:20:56.263' AS DateTime), CAST(N'2017-03-26 13:20:56.263' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1556, 18, 162, 1, CAST(N'2017-03-26 16:20:00.000' AS DateTime), CAST(N'2017-03-26 13:20:57.413' AS DateTime), CAST(N'2017-03-26 13:20:57.413' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1557, 18, 360, 1, CAST(N'2017-03-26 16:20:00.000' AS DateTime), CAST(N'2017-03-26 13:20:58.863' AS DateTime), CAST(N'2017-03-26 13:20:58.863' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1558, 18, 321, 1, CAST(N'2017-03-26 16:27:00.000' AS DateTime), CAST(N'2017-03-26 13:21:28.607' AS DateTime), CAST(N'2017-03-26 13:21:28.607' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1559, 18, 4, 1, CAST(N'2017-03-26 16:21:00.000' AS DateTime), CAST(N'2017-03-26 13:21:50.730' AS DateTime), CAST(N'2017-03-26 13:21:50.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1560, 18, 500, 1, CAST(N'2017-03-26 16:22:00.000' AS DateTime), CAST(N'2017-03-26 13:22:05.297' AS DateTime), CAST(N'2017-03-26 13:22:05.297' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1561, 18, 215, 1, CAST(N'2017-03-26 16:23:00.000' AS DateTime), CAST(N'2017-03-26 13:23:25.323' AS DateTime), CAST(N'2017-03-26 13:23:25.323' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1562, 18, 67, 1, CAST(N'2017-03-26 16:23:00.000' AS DateTime), CAST(N'2017-03-26 13:23:30.947' AS DateTime), CAST(N'2017-03-26 13:23:30.947' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1563, 18, 111, 1, CAST(N'2017-03-26 16:24:00.000' AS DateTime), CAST(N'2017-03-26 13:24:03.123' AS DateTime), CAST(N'2017-03-26 13:24:03.123' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1564, 18, 119, 1, CAST(N'2017-03-26 16:25:00.000' AS DateTime), CAST(N'2017-03-26 13:25:21.597' AS DateTime), CAST(N'2017-03-26 13:25:21.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1565, 18, 363, 1, CAST(N'2017-03-26 16:25:00.000' AS DateTime), CAST(N'2017-03-26 13:26:00.213' AS DateTime), CAST(N'2017-03-26 13:26:00.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1566, 18, 72, 1, CAST(N'2017-03-26 16:26:00.000' AS DateTime), CAST(N'2017-03-26 13:26:18.253' AS DateTime), CAST(N'2017-03-26 13:26:18.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1567, 18, 353, 1, CAST(N'2017-03-26 16:28:00.000' AS DateTime), CAST(N'2017-03-26 13:28:44.560' AS DateTime), CAST(N'2017-03-26 13:28:44.560' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1568, 18, 478, 1, CAST(N'2017-03-26 16:28:00.000' AS DateTime), CAST(N'2017-03-26 13:28:44.600' AS DateTime), CAST(N'2017-03-26 13:28:44.600' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1569, 18, 553, 1, CAST(N'2017-03-26 16:28:00.000' AS DateTime), CAST(N'2017-03-26 13:28:48.897' AS DateTime), CAST(N'2017-03-26 13:28:48.897' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1570, 18, 212, 1, CAST(N'2017-03-26 16:33:00.000' AS DateTime), CAST(N'2017-03-26 13:30:15.123' AS DateTime), CAST(N'2017-03-26 13:30:15.123' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1571, 18, 493, 1, CAST(N'2017-03-26 16:30:00.000' AS DateTime), CAST(N'2017-03-26 13:30:20.560' AS DateTime), CAST(N'2017-03-26 13:30:20.560' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1572, 18, 483, 1, CAST(N'2017-03-26 16:30:00.000' AS DateTime), CAST(N'2017-03-26 13:30:52.407' AS DateTime), CAST(N'2017-03-26 13:30:52.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1573, 18, 337, 1, CAST(N'2017-03-26 16:32:00.000' AS DateTime), CAST(N'2017-03-26 13:32:34.507' AS DateTime), CAST(N'2017-03-26 13:32:34.507' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1574, 18, 310, 1, CAST(N'2017-03-26 16:33:00.000' AS DateTime), CAST(N'2017-03-26 13:33:49.337' AS DateTime), CAST(N'2017-03-26 13:33:49.337' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1575, 18, 555, 1, CAST(N'2017-03-26 16:34:00.000' AS DateTime), CAST(N'2017-03-26 13:34:42.030' AS DateTime), CAST(N'2017-03-26 13:34:42.030' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1576, 18, 556, 1, CAST(N'2017-03-26 16:34:00.000' AS DateTime), CAST(N'2017-03-26 13:34:55.830' AS DateTime), CAST(N'2017-03-26 13:34:55.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1577, 18, 168, 1, CAST(N'2017-03-26 16:35:00.000' AS DateTime), CAST(N'2017-03-26 13:35:08.917' AS DateTime), CAST(N'2017-03-26 13:35:08.917' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1578, 18, 316, 1, CAST(N'2017-03-26 16:35:00.000' AS DateTime), CAST(N'2017-03-26 13:35:15.957' AS DateTime), CAST(N'2017-03-26 13:35:15.957' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1579, 18, 270, 1, CAST(N'2017-03-26 16:36:00.000' AS DateTime), CAST(N'2017-03-26 13:36:01.707' AS DateTime), CAST(N'2017-03-26 13:36:01.707' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1580, 18, 143, 1, CAST(N'2017-03-26 16:36:00.000' AS DateTime), CAST(N'2017-03-26 13:36:17.373' AS DateTime), CAST(N'2017-03-26 13:36:17.373' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1581, 18, 562, 1, CAST(N'2017-03-26 16:36:00.000' AS DateTime), CAST(N'2017-03-26 13:36:20.900' AS DateTime), CAST(N'2017-03-26 13:36:20.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1582, 18, 182, 1, CAST(N'2017-03-26 16:42:00.000' AS DateTime), CAST(N'2017-03-26 13:37:28.400' AS DateTime), CAST(N'2017-03-26 13:37:28.400' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1583, 18, 23, 1, CAST(N'2017-03-26 16:37:00.000' AS DateTime), CAST(N'2017-03-26 13:37:44.940' AS DateTime), CAST(N'2017-03-26 13:37:44.940' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1584, 18, 228, 1, CAST(N'2017-03-26 16:39:00.000' AS DateTime), CAST(N'2017-03-26 13:39:46.803' AS DateTime), CAST(N'2017-03-26 13:39:46.803' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1585, 18, 435, 1, CAST(N'2017-03-26 16:40:00.000' AS DateTime), CAST(N'2017-03-26 13:40:05.667' AS DateTime), CAST(N'2017-03-26 13:40:05.667' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1586, 18, 98, 1, CAST(N'2017-03-26 16:43:00.000' AS DateTime), CAST(N'2017-03-26 13:41:00.143' AS DateTime), CAST(N'2017-03-26 13:41:00.143' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1587, 18, 6, 1, CAST(N'2017-03-26 16:41:00.000' AS DateTime), CAST(N'2017-03-26 13:41:29.517' AS DateTime), CAST(N'2017-03-26 13:41:29.517' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1588, 18, 545, 1, CAST(N'2017-03-26 16:46:00.000' AS DateTime), CAST(N'2017-03-26 13:46:43.997' AS DateTime), CAST(N'2017-03-26 13:46:43.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1589, 18, 209, 1, CAST(N'2017-03-26 16:49:00.000' AS DateTime), CAST(N'2017-03-26 13:49:43.220' AS DateTime), CAST(N'2017-03-26 13:49:43.220' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1590, 18, 58, 1, CAST(N'2017-03-26 16:49:00.000' AS DateTime), CAST(N'2017-03-26 13:49:52.643' AS DateTime), CAST(N'2017-03-26 13:49:52.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1591, 18, 354, 1, CAST(N'2017-03-26 16:50:00.000' AS DateTime), CAST(N'2017-03-26 13:50:53.500' AS DateTime), CAST(N'2017-03-26 13:50:53.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1592, 18, 396, 1, CAST(N'2017-03-26 16:53:00.000' AS DateTime), CAST(N'2017-03-26 13:53:16.000' AS DateTime), CAST(N'2017-03-26 13:53:16.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1593, 18, 250, 1, CAST(N'2017-03-26 16:53:00.000' AS DateTime), CAST(N'2017-03-26 13:53:29.423' AS DateTime), CAST(N'2017-03-26 13:53:29.423' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1594, 18, 519, 1, CAST(N'2017-03-26 16:58:00.000' AS DateTime), CAST(N'2017-03-26 13:55:31.620' AS DateTime), CAST(N'2017-03-26 13:55:31.620' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1595, 18, 412, 1, CAST(N'2017-03-26 16:56:00.000' AS DateTime), CAST(N'2017-03-26 13:56:22.543' AS DateTime), CAST(N'2017-03-26 13:56:22.543' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1596, 18, 559, 1, CAST(N'2017-03-26 16:56:00.000' AS DateTime), CAST(N'2017-03-26 13:56:56.830' AS DateTime), CAST(N'2017-03-26 13:56:56.830' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1597, 18, 361, 1, CAST(N'2017-03-26 16:57:00.000' AS DateTime), CAST(N'2017-03-26 13:57:37.370' AS DateTime), CAST(N'2017-03-26 13:57:37.370' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1598, 18, 195, 1, CAST(N'2017-03-26 16:59:00.000' AS DateTime), CAST(N'2017-03-26 13:59:10.997' AS DateTime), CAST(N'2017-03-26 13:59:10.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1599, 18, 404, 1, CAST(N'2017-03-26 16:59:00.000' AS DateTime), CAST(N'2017-03-26 13:59:38.133' AS DateTime), CAST(N'2017-03-26 13:59:38.133' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1600, 18, 515, 1, CAST(N'2017-03-26 16:59:00.000' AS DateTime), CAST(N'2017-03-26 13:59:45.260' AS DateTime), CAST(N'2017-03-26 13:59:45.260' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1601, 18, 408, 1, CAST(N'2017-03-26 16:59:00.000' AS DateTime), CAST(N'2017-03-26 13:59:46.540' AS DateTime), CAST(N'2017-03-26 13:59:46.540' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1602, 18, 294, 1, CAST(N'2017-03-26 17:00:00.000' AS DateTime), CAST(N'2017-03-26 14:00:01.337' AS DateTime), CAST(N'2017-03-26 14:00:01.337' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1603, 18, 358, 1, CAST(N'2017-03-26 17:00:00.000' AS DateTime), CAST(N'2017-03-26 14:00:27.017' AS DateTime), CAST(N'2017-03-26 14:00:27.017' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1604, 18, 540, 1, CAST(N'2017-03-26 17:00:00.000' AS DateTime), CAST(N'2017-03-26 14:01:00.400' AS DateTime), CAST(N'2017-03-26 14:01:00.400' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1605, 18, 532, 1, CAST(N'2017-03-26 17:03:00.000' AS DateTime), CAST(N'2017-03-26 14:03:13.383' AS DateTime), CAST(N'2017-03-26 14:03:13.383' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1606, 18, 293, 1, CAST(N'2017-03-26 17:04:00.000' AS DateTime), CAST(N'2017-03-26 14:04:37.087' AS DateTime), CAST(N'2017-03-26 14:04:37.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1607, 18, 512, 1, CAST(N'2017-03-26 17:05:00.000' AS DateTime), CAST(N'2017-03-26 14:05:13.100' AS DateTime), CAST(N'2017-03-26 14:05:13.100' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1608, 18, 514, 1, CAST(N'2017-03-26 17:05:00.000' AS DateTime), CAST(N'2017-03-26 14:05:17.147' AS DateTime), CAST(N'2017-03-26 14:05:17.147' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1609, 18, 513, 1, CAST(N'2017-03-26 17:05:00.000' AS DateTime), CAST(N'2017-03-26 14:05:19.700' AS DateTime), CAST(N'2017-03-26 14:05:19.700' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1610, 18, 94, 1, CAST(N'2017-03-26 17:05:00.000' AS DateTime), CAST(N'2017-03-26 14:05:54.870' AS DateTime), CAST(N'2017-03-26 14:05:54.870' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1611, 18, 342, 1, CAST(N'2017-03-26 17:06:00.000' AS DateTime), CAST(N'2017-03-26 14:06:01.553' AS DateTime), CAST(N'2017-03-26 14:06:01.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1612, 18, 87, 1, CAST(N'2017-03-26 17:06:00.000' AS DateTime), CAST(N'2017-03-26 14:06:35.473' AS DateTime), CAST(N'2017-03-26 14:06:35.473' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1613, 18, 450, 1, CAST(N'2017-03-26 17:06:00.000' AS DateTime), CAST(N'2017-03-26 14:06:57.803' AS DateTime), CAST(N'2017-03-26 14:06:57.803' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1614, 18, 27, 1, CAST(N'2017-03-26 17:07:00.000' AS DateTime), CAST(N'2017-03-26 14:07:53.770' AS DateTime), CAST(N'2017-03-26 14:07:53.770' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1615, 18, 551, 1, CAST(N'2017-03-26 17:08:00.000' AS DateTime), CAST(N'2017-03-26 14:08:45.660' AS DateTime), CAST(N'2017-03-26 14:08:45.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1616, 18, 443, 1, CAST(N'2017-03-26 17:09:00.000' AS DateTime), CAST(N'2017-03-26 14:09:44.340' AS DateTime), CAST(N'2017-03-26 14:09:44.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1617, 18, 511, 1, CAST(N'2017-03-26 17:12:00.000' AS DateTime), CAST(N'2017-03-26 14:12:08.500' AS DateTime), CAST(N'2017-03-26 14:12:08.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1618, 18, 144, 1, CAST(N'2017-03-26 17:12:00.000' AS DateTime), CAST(N'2017-03-26 14:12:16.113' AS DateTime), CAST(N'2017-03-26 14:12:16.113' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1619, 18, 217, 1, CAST(N'2017-03-26 17:12:00.000' AS DateTime), CAST(N'2017-03-26 14:12:20.933' AS DateTime), CAST(N'2017-03-26 14:12:20.933' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1620, 18, 220, 1, CAST(N'2017-03-26 17:13:00.000' AS DateTime), CAST(N'2017-03-26 14:13:23.433' AS DateTime), CAST(N'2017-03-26 14:13:23.433' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1621, 18, 394, 1, CAST(N'2017-03-26 17:15:00.000' AS DateTime), CAST(N'2017-03-26 14:15:11.110' AS DateTime), CAST(N'2017-03-26 14:15:11.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1622, 18, 38, 1, CAST(N'2017-03-26 17:20:00.000' AS DateTime), CAST(N'2017-03-26 14:20:12.923' AS DateTime), CAST(N'2017-03-26 14:20:12.923' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1623, 18, 561, 1, CAST(N'2017-03-26 17:22:00.000' AS DateTime), CAST(N'2017-03-26 14:22:10.580' AS DateTime), CAST(N'2017-03-26 14:22:10.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1624, 18, 557, 1, CAST(N'2017-03-26 17:25:00.000' AS DateTime), CAST(N'2017-03-26 14:25:46.080' AS DateTime), CAST(N'2017-03-26 14:25:46.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1625, 18, 539, 1, CAST(N'2017-03-26 17:25:00.000' AS DateTime), CAST(N'2017-03-26 14:25:55.690' AS DateTime), CAST(N'2017-03-26 14:25:55.690' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1626, 18, 71, 1, CAST(N'2017-03-26 17:26:00.000' AS DateTime), CAST(N'2017-03-26 14:26:50.547' AS DateTime), CAST(N'2017-03-26 14:26:50.547' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1627, 18, 14, 1, CAST(N'2017-03-26 17:29:00.000' AS DateTime), CAST(N'2017-03-26 14:29:12.717' AS DateTime), CAST(N'2017-03-26 14:29:12.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1628, 18, 472, 1, CAST(N'2017-03-26 17:32:00.000' AS DateTime), CAST(N'2017-03-26 14:32:58.927' AS DateTime), CAST(N'2017-03-26 14:32:58.927' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1629, 18, 157, 1, CAST(N'2017-03-26 17:34:00.000' AS DateTime), CAST(N'2017-03-26 14:34:23.113' AS DateTime), CAST(N'2017-03-26 14:34:23.113' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1630, 18, 140, 1, CAST(N'2017-03-26 17:37:00.000' AS DateTime), CAST(N'2017-03-26 14:35:13.403' AS DateTime), CAST(N'2017-03-26 14:35:13.403' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1631, 18, 489, 1, CAST(N'2017-03-26 17:35:00.000' AS DateTime), CAST(N'2017-03-26 14:35:21.110' AS DateTime), CAST(N'2017-03-26 14:35:21.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1632, 18, 188, 1, CAST(N'2017-03-26 17:38:00.000' AS DateTime), CAST(N'2017-03-26 14:38:49.650' AS DateTime), CAST(N'2017-03-26 14:38:49.650' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1633, 18, 206, 1, CAST(N'2017-03-26 17:42:00.000' AS DateTime), CAST(N'2017-03-26 14:42:42.100' AS DateTime), CAST(N'2017-03-26 14:42:42.100' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1634, 18, 216, 1, CAST(N'2017-03-26 17:48:00.000' AS DateTime), CAST(N'2017-03-26 14:48:05.810' AS DateTime), CAST(N'2017-03-26 14:48:05.810' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1635, 18, 3, 1, CAST(N'2017-03-26 17:52:00.000' AS DateTime), CAST(N'2017-03-26 14:52:07.077' AS DateTime), CAST(N'2017-03-26 14:52:07.077' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1636, 20, 136, 1, CAST(N'2017-04-09 15:34:00.000' AS DateTime), CAST(N'2017-04-09 12:34:49.380' AS DateTime), CAST(N'2017-04-09 12:34:49.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1637, 20, 27, 1, CAST(N'2017-04-09 15:34:00.000' AS DateTime), CAST(N'2017-04-09 12:34:49.843' AS DateTime), CAST(N'2017-04-09 12:34:49.843' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1638, 20, 29, 1, CAST(N'2017-04-09 15:34:00.000' AS DateTime), CAST(N'2017-04-09 12:34:57.140' AS DateTime), CAST(N'2017-04-09 12:34:57.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1639, 20, 56, 1, CAST(N'2017-04-09 15:35:00.000' AS DateTime), CAST(N'2017-04-09 12:35:17.697' AS DateTime), CAST(N'2017-04-09 12:35:17.697' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1640, 20, 66, 1, CAST(N'2017-04-09 15:35:00.000' AS DateTime), CAST(N'2017-04-09 12:35:41.550' AS DateTime), CAST(N'2017-04-09 12:35:41.550' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1641, 20, 80, 1, CAST(N'2017-04-09 15:36:00.000' AS DateTime), CAST(N'2017-04-09 12:36:00.747' AS DateTime), CAST(N'2017-04-09 12:36:00.747' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1642, 20, 83, 1, CAST(N'2017-04-09 15:36:00.000' AS DateTime), CAST(N'2017-04-09 12:36:17.027' AS DateTime), CAST(N'2017-04-09 12:36:17.027' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1643, 20, 111, 1, CAST(N'2017-04-09 15:36:00.000' AS DateTime), CAST(N'2017-04-09 12:36:32.973' AS DateTime), CAST(N'2017-04-09 12:36:32.973' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1644, 20, 123, 1, CAST(N'2017-04-09 15:37:00.000' AS DateTime), CAST(N'2017-04-09 12:37:12.203' AS DateTime), CAST(N'2017-04-09 12:37:12.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1645, 20, 99, 1, CAST(N'2017-04-09 15:37:00.000' AS DateTime), CAST(N'2017-04-09 12:37:28.793' AS DateTime), CAST(N'2017-04-09 12:37:28.793' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1646, 20, 102, 1, CAST(N'2017-04-09 15:37:00.000' AS DateTime), CAST(N'2017-04-09 12:37:59.270' AS DateTime), CAST(N'2017-04-09 12:37:59.270' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1647, 20, 156, 1, CAST(N'2017-04-09 15:38:00.000' AS DateTime), CAST(N'2017-04-09 12:38:17.617' AS DateTime), CAST(N'2017-04-09 12:38:17.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1648, 20, 197, 1, CAST(N'2017-04-09 15:38:00.000' AS DateTime), CAST(N'2017-04-09 12:39:00.173' AS DateTime), CAST(N'2017-04-09 12:39:00.173' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1649, 20, 237, 1, CAST(N'2017-04-09 15:39:00.000' AS DateTime), CAST(N'2017-04-09 12:39:17.900' AS DateTime), CAST(N'2017-04-09 12:39:17.900' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1650, 20, 390, 1, CAST(N'2017-04-09 15:39:00.000' AS DateTime), CAST(N'2017-04-09 12:39:40.537' AS DateTime), CAST(N'2017-04-09 12:39:40.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1651, 20, 487, 1, CAST(N'2017-04-09 15:40:00.000' AS DateTime), CAST(N'2017-04-09 12:40:28.747' AS DateTime), CAST(N'2017-04-09 12:40:28.747' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1652, 20, 392, 1, CAST(N'2017-04-09 15:45:00.000' AS DateTime), CAST(N'2017-04-09 12:45:19.150' AS DateTime), CAST(N'2017-04-09 12:45:19.150' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1653, 20, 524, 1, CAST(N'2017-04-09 15:45:00.000' AS DateTime), CAST(N'2017-04-09 12:45:36.803' AS DateTime), CAST(N'2017-04-09 12:45:36.803' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1654, 20, 85, 1, CAST(N'2017-04-09 15:45:00.000' AS DateTime), CAST(N'2017-04-09 12:45:56.777' AS DateTime), CAST(N'2017-04-09 12:45:56.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1655, 20, 121, 1, CAST(N'2017-04-09 15:47:00.000' AS DateTime), CAST(N'2017-04-09 12:47:13.853' AS DateTime), CAST(N'2017-04-09 12:47:13.853' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1656, 20, 34, 1, CAST(N'2017-04-09 15:47:00.000' AS DateTime), CAST(N'2017-04-09 12:47:33.687' AS DateTime), CAST(N'2017-04-09 12:47:33.687' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1657, 20, 181, 1, CAST(N'2017-04-09 15:47:00.000' AS DateTime), CAST(N'2017-04-09 12:47:59.380' AS DateTime), CAST(N'2017-04-09 12:47:59.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1658, 20, 271, 1, CAST(N'2017-04-09 15:48:00.000' AS DateTime), CAST(N'2017-04-09 12:48:31.213' AS DateTime), CAST(N'2017-04-09 12:48:31.213' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1659, 20, 161, 1, CAST(N'2017-04-09 15:49:00.000' AS DateTime), CAST(N'2017-04-09 12:49:31.317' AS DateTime), CAST(N'2017-04-09 12:49:31.317' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1660, 20, 309, 1, CAST(N'2017-04-09 15:50:00.000' AS DateTime), CAST(N'2017-04-09 12:50:55.843' AS DateTime), CAST(N'2017-04-09 12:50:55.843' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1661, 20, 335, 1, CAST(N'2017-04-09 15:51:00.000' AS DateTime), CAST(N'2017-04-09 12:51:27.683' AS DateTime), CAST(N'2017-04-09 12:51:27.683' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1662, 20, 133, 1, CAST(N'2017-04-09 15:51:00.000' AS DateTime), CAST(N'2017-04-09 12:52:00.133' AS DateTime), CAST(N'2017-04-09 12:52:00.133' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1663, 20, 269, 1, CAST(N'2017-04-09 15:52:00.000' AS DateTime), CAST(N'2017-04-09 12:52:10.080' AS DateTime), CAST(N'2017-04-09 12:52:10.080' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1664, 20, 445, 1, CAST(N'2017-04-09 15:52:00.000' AS DateTime), CAST(N'2017-04-09 12:52:29.183' AS DateTime), CAST(N'2017-04-09 12:52:29.183' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1665, 20, 504, 1, CAST(N'2017-04-09 15:54:00.000' AS DateTime), CAST(N'2017-04-09 12:54:38.140' AS DateTime), CAST(N'2017-04-09 12:54:38.140' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1666, 20, 345, 1, CAST(N'2017-04-09 15:55:00.000' AS DateTime), CAST(N'2017-04-09 12:55:48.000' AS DateTime), CAST(N'2017-04-09 12:55:48.000' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1667, 20, 433, 1, CAST(N'2017-04-09 15:56:00.000' AS DateTime), CAST(N'2017-04-09 12:56:27.320' AS DateTime), CAST(N'2017-04-09 12:56:27.320' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1668, 20, 277, 1, CAST(N'2017-04-09 15:56:00.000' AS DateTime), CAST(N'2017-04-09 12:56:56.400' AS DateTime), CAST(N'2017-04-09 12:56:56.400' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1669, 20, 477, 1, CAST(N'2017-04-09 15:57:00.000' AS DateTime), CAST(N'2017-04-09 12:57:37.437' AS DateTime), CAST(N'2017-04-09 12:57:37.437' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1670, 20, 307, 1, CAST(N'2017-04-09 15:58:00.000' AS DateTime), CAST(N'2017-04-09 12:58:31.003' AS DateTime), CAST(N'2017-04-09 12:58:31.003' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1671, 20, 308, 1, CAST(N'2017-04-09 15:58:00.000' AS DateTime), CAST(N'2017-04-09 12:58:44.473' AS DateTime), CAST(N'2017-04-09 12:58:44.473' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1672, 20, 359, 1, CAST(N'2017-04-09 15:59:00.000' AS DateTime), CAST(N'2017-04-09 12:59:02.787' AS DateTime), CAST(N'2017-04-09 12:59:02.787' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1673, 20, 98, 1, CAST(N'2017-04-09 15:59:00.000' AS DateTime), CAST(N'2017-04-09 12:59:11.670' AS DateTime), CAST(N'2017-04-09 12:59:11.670' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1674, 20, 553, 1, CAST(N'2017-04-09 15:59:00.000' AS DateTime), CAST(N'2017-04-09 12:59:33.673' AS DateTime), CAST(N'2017-04-09 12:59:33.673' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1675, 20, 82, 1, CAST(N'2017-04-09 15:59:00.000' AS DateTime), CAST(N'2017-04-09 12:59:52.477' AS DateTime), CAST(N'2017-04-09 12:59:52.477' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1676, 20, 305, 1, CAST(N'2017-04-09 16:00:00.000' AS DateTime), CAST(N'2017-04-09 13:00:11.800' AS DateTime), CAST(N'2017-04-09 13:00:11.800' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1677, 20, 273, 1, CAST(N'2017-04-09 16:00:00.000' AS DateTime), CAST(N'2017-04-09 13:00:25.553' AS DateTime), CAST(N'2017-04-09 13:00:25.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1678, 20, 432, 1, CAST(N'2017-04-09 16:00:00.000' AS DateTime), CAST(N'2017-04-09 13:00:36.360' AS DateTime), CAST(N'2017-04-09 13:00:36.360' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1679, 20, 268, 1, CAST(N'2017-04-09 16:00:00.000' AS DateTime), CAST(N'2017-04-09 13:00:48.170' AS DateTime), CAST(N'2017-04-09 13:00:48.170' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1680, 20, 122, 1, CAST(N'2017-04-09 16:01:00.000' AS DateTime), CAST(N'2017-04-09 13:01:11.580' AS DateTime), CAST(N'2017-04-09 13:01:11.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1681, 20, 165, 1, CAST(N'2017-04-09 16:02:00.000' AS DateTime), CAST(N'2017-04-09 13:02:28.663' AS DateTime), CAST(N'2017-04-09 13:02:28.663' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1682, 20, 55, 1, CAST(N'2017-04-09 16:02:00.000' AS DateTime), CAST(N'2017-04-09 13:02:55.037' AS DateTime), CAST(N'2017-04-09 13:02:55.037' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1683, 20, 222, 1, CAST(N'2017-04-09 16:03:00.000' AS DateTime), CAST(N'2017-04-09 13:03:16.703' AS DateTime), CAST(N'2017-04-09 13:03:16.703' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1684, 20, 196, 1, CAST(N'2017-04-09 16:08:00.000' AS DateTime), CAST(N'2017-04-09 13:03:57.500' AS DateTime), CAST(N'2017-04-09 13:03:57.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1685, 20, 205, 1, CAST(N'2017-04-09 16:04:00.000' AS DateTime), CAST(N'2017-04-09 13:04:11.200' AS DateTime), CAST(N'2017-04-09 13:04:11.200' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1686, 20, 70, 1, CAST(N'2017-04-09 16:04:00.000' AS DateTime), CAST(N'2017-04-09 13:04:15.643' AS DateTime), CAST(N'2017-04-09 13:04:15.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1687, 20, 125, 1, CAST(N'2017-04-09 16:04:00.000' AS DateTime), CAST(N'2017-04-09 13:04:20.310' AS DateTime), CAST(N'2017-04-09 13:04:20.310' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1688, 20, 385, 1, CAST(N'2017-04-09 16:05:00.000' AS DateTime), CAST(N'2017-04-09 13:04:24.203' AS DateTime), CAST(N'2017-04-09 13:04:24.203' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1689, 20, 179, 1, CAST(N'2017-04-09 16:05:00.000' AS DateTime), CAST(N'2017-04-09 13:05:15.530' AS DateTime), CAST(N'2017-04-09 13:05:15.530' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1690, 20, 236, 1, CAST(N'2017-04-09 16:05:00.000' AS DateTime), CAST(N'2017-04-09 13:05:41.427' AS DateTime), CAST(N'2017-04-09 13:05:41.427' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1691, 20, 176, 1, CAST(N'2017-04-09 16:06:00.000' AS DateTime), CAST(N'2017-04-09 13:06:02.860' AS DateTime), CAST(N'2017-04-09 13:06:02.860' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1692, 20, 186, 1, CAST(N'2017-04-09 16:06:00.000' AS DateTime), CAST(N'2017-04-09 13:06:24.953' AS DateTime), CAST(N'2017-04-09 13:06:24.953' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1693, 20, 310, 1, CAST(N'2017-04-09 16:06:00.000' AS DateTime), CAST(N'2017-04-09 13:06:38.440' AS DateTime), CAST(N'2017-04-09 13:06:38.440' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1694, 20, 486, 1, CAST(N'2017-04-09 16:07:00.000' AS DateTime), CAST(N'2017-04-09 13:07:07.137' AS DateTime), CAST(N'2017-04-09 13:07:07.137' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1695, 20, 424, 1, CAST(N'2017-04-09 16:07:00.000' AS DateTime), CAST(N'2017-04-09 13:07:10.150' AS DateTime), CAST(N'2017-04-09 13:07:10.150' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1696, 20, 172, 1, CAST(N'2017-04-09 16:07:00.000' AS DateTime), CAST(N'2017-04-09 13:07:26.817' AS DateTime), CAST(N'2017-04-09 13:07:26.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1697, 20, 363, 1, CAST(N'2017-04-09 16:07:00.000' AS DateTime), CAST(N'2017-04-09 13:07:53.340' AS DateTime), CAST(N'2017-04-09 13:07:53.340' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1698, 20, 446, 1, CAST(N'2017-04-09 16:08:00.000' AS DateTime), CAST(N'2017-04-09 13:08:32.497' AS DateTime), CAST(N'2017-04-09 13:08:32.497' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1699, 20, 520, 1, CAST(N'2017-04-09 16:10:00.000' AS DateTime), CAST(N'2017-04-09 13:08:34.663' AS DateTime), CAST(N'2017-04-09 13:08:34.663' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1700, 20, 206, 1, CAST(N'2017-04-09 16:09:00.000' AS DateTime), CAST(N'2017-04-09 13:09:18.077' AS DateTime), CAST(N'2017-04-09 13:09:18.077' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1701, 20, 238, 1, CAST(N'2017-04-09 16:09:00.000' AS DateTime), CAST(N'2017-04-09 13:09:43.303' AS DateTime), CAST(N'2017-04-09 13:09:43.303' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1702, 20, 215, 1, CAST(N'2017-04-09 16:10:00.000' AS DateTime), CAST(N'2017-04-09 13:10:53.207' AS DateTime), CAST(N'2017-04-09 13:10:53.207' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1703, 20, 365, 1, CAST(N'2017-04-09 16:13:00.000' AS DateTime), CAST(N'2017-04-09 13:13:20.160' AS DateTime), CAST(N'2017-04-09 13:13:20.160' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1704, 20, 162, 1, CAST(N'2017-04-09 16:14:00.000' AS DateTime), CAST(N'2017-04-09 13:14:05.300' AS DateTime), CAST(N'2017-04-09 13:14:05.300' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1705, 20, 360, 1, CAST(N'2017-04-09 16:14:00.000' AS DateTime), CAST(N'2017-04-09 13:14:17.260' AS DateTime), CAST(N'2017-04-09 13:14:17.260' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1706, 20, 319, 1, CAST(N'2017-04-09 16:14:00.000' AS DateTime), CAST(N'2017-04-09 13:14:27.287' AS DateTime), CAST(N'2017-04-09 13:14:27.287' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1707, 20, 7, 1, CAST(N'2017-04-09 16:14:00.000' AS DateTime), CAST(N'2017-04-09 13:14:55.087' AS DateTime), CAST(N'2017-04-09 13:14:55.087' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1708, 20, 547, 1, CAST(N'2017-04-09 16:16:00.000' AS DateTime), CAST(N'2017-04-09 13:16:02.783' AS DateTime), CAST(N'2017-04-09 13:16:02.783' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1709, 20, 30, 1, CAST(N'2017-04-09 16:16:00.000' AS DateTime), CAST(N'2017-04-09 13:16:19.407' AS DateTime), CAST(N'2017-04-09 13:16:19.407' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1710, 20, 77, 1, CAST(N'2017-04-09 16:16:00.000' AS DateTime), CAST(N'2017-04-09 13:16:53.643' AS DateTime), CAST(N'2017-04-09 13:16:53.643' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1711, 20, 39, 1, CAST(N'2017-04-09 16:17:00.000' AS DateTime), CAST(N'2017-04-09 13:17:40.980' AS DateTime), CAST(N'2017-04-09 13:17:40.980' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1712, 20, 440, 1, CAST(N'2017-04-09 16:18:00.000' AS DateTime), CAST(N'2017-04-09 13:18:17.107' AS DateTime), CAST(N'2017-04-09 13:18:17.107' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1713, 20, 299, 1, CAST(N'2017-04-09 16:18:00.000' AS DateTime), CAST(N'2017-04-09 13:18:42.610' AS DateTime), CAST(N'2017-04-09 13:18:42.610' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1714, 20, 150, 1, CAST(N'2017-04-09 16:18:00.000' AS DateTime), CAST(N'2017-04-09 13:18:59.597' AS DateTime), CAST(N'2017-04-09 13:18:59.597' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1715, 20, 566, 1, CAST(N'2017-04-09 16:24:00.000' AS DateTime), CAST(N'2017-04-09 13:24:19.700' AS DateTime), CAST(N'2017-04-09 13:24:19.700' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1716, 20, 62, 1, CAST(N'2017-04-09 16:25:00.000' AS DateTime), CAST(N'2017-04-09 13:25:51.357' AS DateTime), CAST(N'2017-04-09 13:25:51.357' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1717, 20, 67, 1, CAST(N'2017-04-09 16:26:00.000' AS DateTime), CAST(N'2017-04-09 13:26:32.217' AS DateTime), CAST(N'2017-04-09 13:26:32.217' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1718, 20, 17, 1, CAST(N'2017-04-09 16:27:00.000' AS DateTime), CAST(N'2017-04-09 13:27:02.290' AS DateTime), CAST(N'2017-04-09 13:27:02.290' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1719, 20, 540, 1, CAST(N'2017-04-09 16:29:00.000' AS DateTime), CAST(N'2017-04-09 13:29:17.693' AS DateTime), CAST(N'2017-04-09 13:29:17.693' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1720, 20, 393, 1, CAST(N'2017-04-09 16:31:00.000' AS DateTime), CAST(N'2017-04-09 13:31:31.253' AS DateTime), CAST(N'2017-04-09 13:31:31.253' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1721, 20, 84, 1, CAST(N'2017-04-09 16:33:00.000' AS DateTime), CAST(N'2017-04-09 13:33:25.537' AS DateTime), CAST(N'2017-04-09 13:33:25.537' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1722, 20, 221, 1, CAST(N'2017-04-09 16:36:00.000' AS DateTime), CAST(N'2017-04-09 13:36:02.317' AS DateTime), CAST(N'2017-04-09 13:36:02.317' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1723, 20, 554, 1, CAST(N'2017-04-09 16:36:00.000' AS DateTime), CAST(N'2017-04-09 13:36:59.733' AS DateTime), CAST(N'2017-04-09 13:36:59.733' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1724, 20, 565, 1, CAST(N'2017-04-09 16:37:00.000' AS DateTime), CAST(N'2017-04-09 13:37:33.343' AS DateTime), CAST(N'2017-04-09 13:37:33.343' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1725, 20, 4, 1, CAST(N'2017-04-09 16:39:00.000' AS DateTime), CAST(N'2017-04-09 13:39:36.920' AS DateTime), CAST(N'2017-04-09 13:39:36.920' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1726, 20, 144, 1, CAST(N'2017-04-09 16:39:00.000' AS DateTime), CAST(N'2017-04-09 13:39:51.993' AS DateTime), CAST(N'2017-04-09 13:39:51.993' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1727, 20, 283, 1, CAST(N'2017-04-09 16:40:00.000' AS DateTime), CAST(N'2017-04-09 13:40:05.660' AS DateTime), CAST(N'2017-04-09 13:40:05.660' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1728, 20, 212, 1, CAST(N'2017-04-09 16:40:00.000' AS DateTime), CAST(N'2017-04-09 13:40:22.730' AS DateTime), CAST(N'2017-04-09 13:40:22.730' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1729, 20, 354, 1, CAST(N'2017-04-09 16:40:00.000' AS DateTime), CAST(N'2017-04-09 13:40:44.333' AS DateTime), CAST(N'2017-04-09 13:40:44.333' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1730, 20, 141, 1, CAST(N'2017-04-09 16:41:00.000' AS DateTime), CAST(N'2017-04-09 13:41:09.940' AS DateTime), CAST(N'2017-04-09 13:41:09.940' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1731, 20, 327, 1, CAST(N'2017-04-09 16:41:00.000' AS DateTime), CAST(N'2017-04-09 13:41:49.330' AS DateTime), CAST(N'2017-04-09 13:41:49.330' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1732, 20, 314, 1, CAST(N'2017-04-09 16:42:00.000' AS DateTime), CAST(N'2017-04-09 13:42:23.753' AS DateTime), CAST(N'2017-04-09 13:42:23.753' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1733, 20, 6, 1, CAST(N'2017-04-09 16:43:00.000' AS DateTime), CAST(N'2017-04-09 13:43:07.803' AS DateTime), CAST(N'2017-04-09 13:43:07.803' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1734, 20, 94, 1, CAST(N'2017-04-09 16:43:00.000' AS DateTime), CAST(N'2017-04-09 13:43:14.777' AS DateTime), CAST(N'2017-04-09 13:43:14.777' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1735, 20, 502, 1, CAST(N'2017-04-09 16:43:00.000' AS DateTime), CAST(N'2017-04-09 13:43:19.717' AS DateTime), CAST(N'2017-04-09 13:43:19.717' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1736, 20, 116, 1, CAST(N'2017-04-09 16:43:00.000' AS DateTime), CAST(N'2017-04-09 13:43:28.380' AS DateTime), CAST(N'2017-04-09 13:43:28.380' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1737, 20, 220, 1, CAST(N'2017-04-09 16:43:00.000' AS DateTime), CAST(N'2017-04-09 13:43:57.817' AS DateTime), CAST(N'2017-04-09 13:43:57.817' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1738, 20, 108, 1, CAST(N'2017-04-09 16:44:00.000' AS DateTime), CAST(N'2017-04-09 13:44:25.110' AS DateTime), CAST(N'2017-04-09 13:44:25.110' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1739, 20, 135, 1, CAST(N'2017-04-09 16:46:00.000' AS DateTime), CAST(N'2017-04-09 13:46:09.553' AS DateTime), CAST(N'2017-04-09 13:46:09.553' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1740, 20, 42, 1, CAST(N'2017-04-09 16:47:00.000' AS DateTime), CAST(N'2017-04-09 13:47:17.617' AS DateTime), CAST(N'2017-04-09 13:47:17.617' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1741, 20, 536, 1, CAST(N'2017-04-09 16:49:00.000' AS DateTime), CAST(N'2017-04-09 13:49:11.997' AS DateTime), CAST(N'2017-04-09 13:49:11.997' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1742, 20, 455, 1, CAST(N'2017-04-09 16:50:00.000' AS DateTime), CAST(N'2017-04-09 13:50:19.300' AS DateTime), CAST(N'2017-04-09 13:50:19.300' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1743, 20, 38, 1, CAST(N'2017-04-09 16:50:00.000' AS DateTime), CAST(N'2017-04-09 13:50:53.300' AS DateTime), CAST(N'2017-04-09 13:50:53.300' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1744, 20, 495, 1, CAST(N'2017-04-09 16:52:00.000' AS DateTime), CAST(N'2017-04-09 13:52:48.703' AS DateTime), CAST(N'2017-04-09 13:52:48.703' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1745, 20, 51, 1, CAST(N'2017-04-09 16:56:00.000' AS DateTime), CAST(N'2017-04-09 13:56:01.503' AS DateTime), CAST(N'2017-04-09 13:56:01.503' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1746, 20, 326, 1, CAST(N'2017-04-09 16:57:00.000' AS DateTime), CAST(N'2017-04-09 13:57:22.503' AS DateTime), CAST(N'2017-04-09 13:57:22.503' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1747, 20, 330, 1, CAST(N'2017-04-09 16:57:00.000' AS DateTime), CAST(N'2017-04-09 13:57:34.907' AS DateTime), CAST(N'2017-04-09 13:57:34.907' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1748, 20, 438, 1, CAST(N'2017-04-09 17:04:00.000' AS DateTime), CAST(N'2017-04-09 14:04:15.397' AS DateTime), CAST(N'2017-04-09 14:04:15.397' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1749, 20, 353, 1, CAST(N'2017-04-09 17:09:00.000' AS DateTime), CAST(N'2017-04-09 14:09:21.580' AS DateTime), CAST(N'2017-04-09 14:09:21.580' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1750, 20, 334, 1, CAST(N'2017-04-09 17:23:00.000' AS DateTime), CAST(N'2017-04-09 14:23:19.290' AS DateTime), CAST(N'2017-04-09 14:23:19.290' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1751, 20, 182, 1, CAST(N'2017-04-09 17:29:00.000' AS DateTime), CAST(N'2017-04-09 14:29:35.500' AS DateTime), CAST(N'2017-04-09 14:29:35.500' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1752, 20, 168, 1, CAST(N'2017-04-09 17:43:00.000' AS DateTime), CAST(N'2017-04-09 14:43:45.523' AS DateTime), CAST(N'2017-04-09 14:43:45.523' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1753, 20, 58, 1, CAST(N'2017-04-09 18:02:00.000' AS DateTime), CAST(N'2017-04-09 15:02:44.290' AS DateTime), CAST(N'2017-04-09 15:02:44.290' AS DateTime))
GO
INSERT [dbo].[Att_Attendance] ([Id], [EventScheduleId], [AttendeeId], [IsAttended], [AttendanceTime], [CreatedOn], [ModifiedOn]) VALUES (1754, 20, 512, 1, CAST(N'2017-04-09 18:02:00.000' AS DateTime), CAST(N'2017-04-09 15:02:44.290' AS DateTime), CAST(N'2017-04-09 15:02:44.290' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Att_Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[Att_Attendee] ON 

GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (1, 8883, N'Aarjav', N' ', N'Patel', N'M', N'6827 Creft Cir', N'No', 0, 10, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (2, 7485, N'Abhi', N' ', N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (3, 7569, N'Abhilasha', NULL, N'Mansinghka', N'F', N'5610 Edenfield Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (4, 8548, N'Ajay', NULL, N'Patel', N'M', N'280 Indian Trl', N'Yes', 1, 19, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (5, 8842, N'Ajay', NULL, N'Patel', N'M', N'302 Salem Rd', N'No', 0, 20, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (6, 8322, N'Ajay', N'Mahendrabhai', N'Patel', N'M', N'8767 Savannah Rd', N'Yes', 1, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (7, 7203, N'Akash', NULL, N'Patel', N'M', N'2011 Apogee Dr', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (8, 95434, N'Aksh', N'Vasant', N'Patel', N'M', N'2766 Lake Wylie Dr', N'No', 0, 26, 9, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (9, 7886, N'Akshar', N' ', N'Gajjar', N'M', N'11812 Avaly Ln', N'No', 0, 2, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (10, 6271, N'Akshar', N' ', N'Patel', N'M', N'1719 Funny Cide Dr', N'No', 0, 30, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (11, 380904, N'Akshar', NULL, N'Patel', N'M', N'2508 Highland Park Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (12, 8053, N'Akshar', N'Ashish', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', 0, 17, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (13, 313983, N'Alka', NULL, N'Patel', N'F', N'12552 Druids Glen Dr', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (14, 8630, N'Alka', NULL, N'Patel', N'F', N'17416 Campbell Hall Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (15, 6270, N'Alpa', NULL, N'Patel', N'F', N'1719 Funny Cide Dr', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (16, 8984, N'Alpaben', NULL, N'Patel', N'F', N'1862 Gingercake Cir', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (17, 8540, N'Alpesh', N' ', N'Patel', N'M', N'7318 Timberneck Ct', N'No', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (18, 7633, N'Aman', N'S', N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', 0, 2, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (19, 177796, N'Ambalal', NULL, N'Patel', N'M', N'4112 Shasta Cir', N'No', 0, 3, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (20, 8734, N'Amit', NULL, N'Patel', N'M', N'110 Stone Ridge Dr', N'Yes', 1, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (21, 8986, N'Anchal', NULL, N'Patel', N'F', N'1862 Gingercake Cir', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (22, 7212, N'Anil', NULL, N'Patel', N'M', N'132 W Main St', N'No', 0, 32, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (23, 5992, N'Anil', NULL, N'Patel', N'M', N'325 US Highway 70 SW', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (24, 7766, N'Anil', N'Praveenbhai', N'Patel', N'M', N'5892 Bakers Pt', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (25, 6185, N'Anjana', NULL, N'Patel', N'F', N'8767 Savannah Rd', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (26, 8713, N'Anju', NULL, N'Patel', N'F', N'6406 Derby Way', N'Yes', 1, 29, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (27, 311133, N'Ankit', NULL, N'Babariya', N'M', N'8525 Dahlia Dr Apt 207', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (28, 6079, N'Ankit', NULL, N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'Yes', 1, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (29, 310432, N'Ankit', NULL, N'Kumbhani', N'M', N'8209 University Ridge Dr, apt # 107', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (30, 6691, N'Ankur', NULL, N'Patel', N'M', N'17123 Westmill Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (31, 92041, N'APUR', NULL, N'KAMDAR', N'M', N'6405 STONE RIDGE CT', N'No', 0, 12, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (32, 6044, N'Arti', NULL, N'patel', N'F', N'2616 Brackley Pl NW', N'No', 0, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (33, 7138, N'Arvind', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (34, 7439, N'Arvind', NULL, N'Patel', N'M', N'2718 Gastonia Dallas Hwy', N'Yes', 1, 6, 4, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (35, 8140, N'Ashish', NULL, N'Patel', N'M', N'1236 Kent Dr', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (36, 332769, N'Ashish', NULL, N'Patel', N'M', N'2508 Highland Park Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (37, 6920, N'Ashok', NULL, N'Patel', N'M', N'2413 Arden Gate Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (38, 9028, N'Ashok', NULL, N'Patel', N'M', N'6085 Creekview Ct', N'Yes', 1, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (39, 242396, N'Ashok', NULL, N'Patel', N'M', N'9607 Springholm Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (41, 7849, N'Ashwi', NULL, N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (42, 6486, N'Asit', NULL, N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (43, 7438, N'Atul', NULL, N'Patel', N'M', N'1040 Conestoga Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (44, 6461, N'Atul', NULL, N'Patel', N'M', N'121 Peoria Ln', N'No', 0, 14, 4, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (45, 6976, N'Atul', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (46, 8735, N'Avanee', NULL, N'Patel', N'F', N'110 Stone Ridge Dr', N'Yes', 1, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (47, 7956, N'Ayushi', NULL, N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (48, 8642, N'Babu', NULL, N'Patel', N'M', N'11925 Southcrest Ln', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (49, 311130, N'Badal', N'M', N'Patel', N'M', N'413 College Dr', N'Yes', 1, 24, 6, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (50, 332338, N'Bakula', N'Jayantibhai', N'Patel', N'F', N'7701 Wallace Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (51, 8629, N'Baldev', NULL, N'Patel', N'M', N'17416 Campbell Hall Ct', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (52, 7847, N'Bela', NULL, N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (53, 136489, N'Bhagvati', NULL, N'Gajjar', N'F', N'11812 Avaly Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (54, 8142, N'Bhakti', NULL, N'patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (55, 7874, N'Bhalchandra', NULL, N'Patel', N'M', N'1983 8th St SE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (56, 7548, N'Bharat', NULL, N'Parmar', N'M', N'4007 Clover Rd NW', N'Yes', 1, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (57, 7334, N'Bharat', NULL, N'Patel', N'M', N'1201 Highway 9 Byp W', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (58, 7267, N'Bharat', NULL, N'Patel', N'M', N'1213 Kent Dr', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (59, 8396, N'Bharti', NULL, N'Shah', N'F', N'9946 Nicole Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (60, 8425, N'Bhavana', NULL, N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (61, 311128, N'Bhavanaben', N'P', N'Patel', N'F', N'7527 Carrington Forest Ln', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (62, 310438, N'Bhavesh', N'Kanubhai', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (63, 8074, N'Bhavin', N'M', N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (64, 8654, N'Bhavini', NULL, N'Darji', N'F', N'6732 Allness Glen Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (65, 8576, N'Bhavna', NULL, N'Gajjar', N'F', N'3821 Trappers Run Dr', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (66, 7961, N'Bholabhai', NULL, N'Patel', N'M', N'2800 Foxwood Rd', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (67, 8426, N'Bhowmik', NULL, N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (68, NULL, N'Bhumi', NULL, N'Patel', N'F', N'10125 University Park Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (69, 7215, N'Bhumi', NULL, N'Patel', N'F', N'132 W Main St', N'No', 0, 32, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (70, 9054, N'Bhupendra', NULL, N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (71, 8292, N'Bhupesh', NULL, N'Patel', N'M', N'13102 Pumpkin Way Dr', N'No', 0, 5, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (72, 8643, N'Bindu', NULL, N'Patel', N'F', N'11925 Southcrest Ln', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (73, 6742, N'Bipin', NULL, N'Patel', N'M', N'2525 Lawyers Rd W', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (74, 8408, N'Bipin', NULL, N'Patel', N'M', N'5891 Bakers Pt', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (75, 7041, N'Chanchal', NULL, N'Patel', N'F', N'6235 Hermsley Rd', N'Yes', 1, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (76, 311129, N'Chandni', NULL, N'Patel', N'F', N'413 College Dr', N'No', 0, 24, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (77, 8575, N'Chandrakant', NULL, N'Gajjar', N'M', N'3821 Trappers Run Dr', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (78, 7894, N'Chandrakant', NULL, N'Suthar', N'M', N'15739 Greythorne Dr Apt 103', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (79, 380896, N'Chandrakant', N'S', N'Suthar', N'M', N'15739 Greythorne Dr Apt 103', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (80, 6269, N'Chandresh', NULL, N'Patel', N'M', N'1719 Funny Cide Dr', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (81, 95809, N'Chandrika', NULL, N'Patel', N'F', N'1040 Conestoga Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (82, 8483, N'Chandu', NULL, N'Patel', N'M', N'360 Ivy Park Ln', N'No', 0, 31, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (83, 6924, N'Chandu', NULL, N'Patel', N'M', N'7413 Chital Rd', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (84, 6294, N'Chetan', NULL, N'Desai', N'M', N'2911 Bridle Brook Way', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (85, 8348, N'Chiman', NULL, N'Patel', N'M', N'8801 Darcy Hopkins Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (86, 6296, N'Daksh', N' ', N'Desai', N'M', N'2911 Bridle Brook Way', N'No', 0, 2, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (87, 6743, N'Daksha', NULL, N'Patel', N'F', N'2525 Lawyers Rd W', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (88, 6786, N'Damukaka', NULL, N'Patel', N'M', N'200 Henson St', N'No', 0, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (89, 8234, N'Darshan', N' ', N'Patel', N'M', N'8347 Marigold Pl', N'No', 0, 8, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (90, 7607, N'Dasharath', NULL, N'Patel', N'M', N'5444 Allison Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (91, 6800, N'Daxa', NULL, N'Patel', N'F', N'17127 Westmill Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (92, 7171, N'Dev', NULL, N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (93, 95819, N'Devan', NULL, N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (94, 7416, N'Dharmendra', NULL, N'Patel', N'M', N'4864 Annelise Dr', N'Yes', 1, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (95, 310448, N'Dhayana', NULL, N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (96, 6207, N'Dhriti', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (97, 95807, N'Dhwani', N'Alpesh', N'Patel', N'F', N'7318 Timberneck Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (98, 7637, N'Dilip', NULL, N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (99, 8989, N'Dilip', NULL, N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (100, 8712, N'Dilip', N'Harmanbhai', N'Patel', N'M', N'6406 Derby Way', N'Yes', 1, 29, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (101, 136479, N'Dimpal', N'Rahul', N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (102, 7034, N'Dinesh', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'Yes', 1, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (103, 240988, N'DIP', NULL, N'PATEL', N'M', N'234 S Main St', N'Yes', 1, 11, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (104, 7065, N'Dipika', NULL, N'Patel', N'F', N'9217 Unbridle Ln', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (105, 6295, N'Dipti', NULL, N'Desai', N'F', N'2911 Bridle Brook Way', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (106, 8882, N'Dipti', NULL, N'Patel', N'F', N'6827 Creft Cir', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (107, 7055, N'Divya', NULL, N'Patel', N'F', N'4101 Regency Dr', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (108, 7833, N'Divyesh', NULL, N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (109, 8325, N'Diya', NULL, N'Patel', N'F', N'8767 Savannah Rd', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (110, 313986, N'Drashti', NULL, N'Patel', N'F', N'12552 Druids Glen Dr', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (111, 8757, N'Drupad', NULL, N'Patel', N'M', N'9424 Autumn Applause Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (112, 8306, N'Dushyant', NULL, N'Gajjar', N'M', N'4029 Raccoon Run Ct', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (113, 7003, N'Eshani', NULL, N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (114, 332335, N'Eshna', NULL, N'Hira', N'F', N'138 Norman Station Blvd', N'No', 0, 19, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (115, 8591, N'Fatehsinh', NULL, N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (116, 7568, N'Gautam', NULL, N'Mansinghka', N'M', N'5610 Edenfield Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (117, 7183, N'Gautam', NULL, N'Patel', N'M', N'3600 Mooreland Farms Rd', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (118, 7218, N'Gautami', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (119, 6570, N'Geeta', NULL, N'Patel', N'F', N'5815 Langwell Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (120, 6995, N'Geeta', NULL, N'Patel', N'F', N'7301 Conifer Ct', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (121, 6248, N'Ghanshyam', NULL, N'Patel', N'M', N'117 Lily Green Ct NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (122, 6085, N'Ghanshyam', NULL, N'Patel', N'M', N'12303 Summer Breeze Ct', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (123, 7539, N'Ghanshyam', NULL, N'Patel', N'M', N'1516 Concord Pkwy N', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (124, 8566, N'Gia', NULL, N'Patel', N'F', N'9016 Tamarron Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (125, 8424, N'Girish', NULL, N'Dave', N'M', N'11428 Foggy Bank Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (126, 6618, N'Girish', NULL, N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (127, 95814, N'Hansa', NULL, N'Patel', N'F', N'2013 Gloucester St', N'No', 0, 17, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (128, 5993, N'Hansa', NULL, N'Patel', N'F', N'325 US Highway 70 SW', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (129, 7822, N'Hari', N'P', N'Parmar', N'M', N'9500 Marsena Ct', N'No', 0, 2, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (130, 7269, N'Harikrishna', NULL, N'Patel', N'M', N'1213 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (131, 6978, N'Harikrishna', N' ', N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (132, 6206, N'Harini', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (133, 6210, N'Harish', NULL, N'Patel', N'M', N'625 Beauhaven Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (134, 7074, N'Harsha', NULL, N'Parmar', N'F', N'9406 Vera Jones Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (135, 6951, N'Harshad', NULL, N'Patel', N'M', N'9620 Puddle Duck Rd Apt 305', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (136, 316911, N'Harshadbhai', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (137, 316915, N'Harshita', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (138, 7217, N'Hasmukh', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (139, 95812, N'Hasumati', NULL, N'Patel', N'F', N'625 Beauhaven Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (140, 7000, N'Hema', NULL, N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (141, 310222, N'Hemal', N'V', N'Patadia', N'M', N'8209 Univrsty Rdge Dr Apt 107', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (142, 7957, N'Hemani', NULL, N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (143, 7884, N'Hemant', NULL, N'Gajjar', N'M', N'11812 Avaly Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (144, 7669, N'Hemant', NULL, N'Patel', N'M', N'10742 Derryrush Dr', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (145, 7530, N'Hemlata', NULL, N'Darji', N'F', N'7307 Brigmore Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (146, 7172, N'Heta', NULL, N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (147, 310427, N'Hetal', N'Ankit', N'Thakkar', N'F', N'15510 Aspen Hills Ln Apt 1222', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (148, 380903, N'Himani', N'Ashish', N'Patel', N'F', N'2508 Highland Park Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (149, 6879, N'Himanshu', N' ', N'Patel', N'M', N'1204 Somerset Dr', N'No', 0, 15, 6, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (150, 7985, N'Himanshu', NULL, N'Patel', N'M', N'2912 Parkway Blvd', N'Yes', 1, 25, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (151, 8141, N'Hina', NULL, N'patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (152, 310216, N'Hipal', NULL, N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (153, 7417, N'Hiral', NULL, N'Patel', N'F', N'4864 Annelise Dr', N'Yes', 1, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (154, 8992, N'Hiren', N'Mehul', N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (155, NULL, N'Hiren', NULL, N'Patel', N'M', N'4011 Ainsdale Dr', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (156, 7591, N'Hiren', N' ', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (157, 7986, N'Indira', NULL, N'Patel', N'F', N'2912 Parkway Blvd', N'No', 0, 25, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (158, 8588, N'Indrasinh', NULL, N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (159, 313982, N'Jagat', NULL, N'Patel', N'M', N'12552 Druids Glen Dr', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (160, 6423, N'Jagdish', NULL, N'Patel', N'M', N'1816 Damascus St', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (161, 95813, N'Jagdish', NULL, N'Patel', N'M', N'2013 Gloucester St', N'No', 0, 17, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (162, 7064, N'Jagdish', NULL, N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (163, 7448, N'Jagruti', NULL, N'Patel', N'F', N'638 Ridge St', N'Yes', 1, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (164, 7592, N'Jagruti', N'H', N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (165, 8541, N'Jai', NULL, N'Patel', N'M', N'7318 Timberneck Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (166, 7066, N'Jainith', NULL, N'Patel', N'M', N'9217 Unbridle Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (167, 7419, N'Jalpa', NULL, N'Patel', N'F', N'4864 Annelise Dr', N'Yes', 1, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (168, 7710, N'Janak', NULL, N'Amin', N'M', N'1395 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (169, 6880, N'Janki', NULL, N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (170, 6309, N'Janki', NULL, N'Patel', N'F', N'2005 Belleforest Ct', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (171, 7603, N'Janki', NULL, N'Patel', N'F', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (172, 6440, N'Janu', NULL, N'Patel', N'M', N'1236 Kent Dr', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (173, 7420, N'Janvi', N'Dharmendra', N'Patel', N'F', N'4864 Annelise Dr', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (174, 6768, N'Jash', NULL, N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (175, 7315, N'Jay', NULL, N'Parmar', N'M', N'14952 Havasu St', N'No', 0, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (176, 7736, N'Jay', NULL, N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (177, 8481, N'Jaya', NULL, N'Patel', N'F', N'9725 Capella Ave NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (178, 95818, N'Jayan', NULL, N'Patel', N'M', N'221 Cattle Ridge Rd', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (179, 6782, N'Jayant', NULL, N'Patel', N'M', N'200 Henson St', N'Yes', 1, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (180, 8480, N'Jayant', NULL, N'Patel', N'M', N'9725 Capella Ave NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (181, 332337, N'Jayantibhai', N'Ranchhodbhai', N'Patel', N'M', N'7701 Wallace Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (182, 8955, N'Jayantilal', NULL, N'Panara', N'M', N'9123 Royal Highlands Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (183, 8464, N'Jayantilal', NULL, N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (184, 7529, N'Jayendra', NULL, N'Darji', N'M', N'7307 Brigmore Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (185, 7846, N'Jayendra', NULL, N'Patel', N'M', N'13410 Mallard Lake Rd', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (186, 234794, N'Jayesh', N' ', N'Patel', N'M', N'439 Anvil Draw Pl', N'No', 1, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (187, 95803, N'Jayna', N'Sanjeet', N'Patel', N'F', N'2413 Arden Gate Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (188, 6702, N'Jayshree', NULL, N'Patel', N'F', N'5800 Shadow Creek Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (189, 7670, N'Jayshri', NULL, N'Patel', N'F', N'10742 Derryrush Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (190, 9057, N'Jeet', NULL, N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (191, 8462, N'Jeet', NULL, N'Patel', N'M', N'818 20th Avenue Pl SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (192, 7770, N'Jeram', NULL, N'Patel', N'M', N'1003 Garden Rose Ct', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (193, 8259, N'Jigar', NULL, N'Patel', N'M', N'14044 Lissadell Cir', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (194, 9058, N'Jigna', NULL, N'Patel', N'F', N'3730 US Highway 601', N'No', 0, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (195, 7958, N'Jigna', NULL, N'Patel', N'F', N'4613 9th St NE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (196, 6874, N'Jimmy', NULL, N'Patel', N'M', N'5001 Oxfordshire Rd', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (197, 7049, N'Jitendra', NULL, N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', 1, 27, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (198, 6439, N'Jual', NULL, N'Patel', N'F', N'1041 Ainsdale Dr', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (199, 310221, N'Juhi', N'Kalpesh', N'Ram', N'F', N'925 Bendix Dr', N'No', 0, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (200, 6249, N'Jyoti', NULL, N'Patel', N'F', N'117 Lily Green Ct NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (201, 310447, N'Jyoti', NULL, N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (202, NULL, N'Jyoti', NULL, N'Patel', N'F', N'9052 Magnolia Lily Ave', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (203, 6915, N'Jyotiben', NULL, N'Modi', N'F', N'350 Venus St', N'No', 0, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (204, 8577, N'Jyotika', NULL, N'Gajjar', N'F', N'3821 Trappers Run Dr', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (205, 6830, N'Jyotindra', NULL, N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', 1, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (206, 8983, N'Jyotish', NULL, N'Patel', N'M', N'1862 Gingercake Cir', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (207, 7549, N'Jyotsna', NULL, N'Parmar', N'F', N'4007 Clover Rd NW', N'Yes', 1, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (208, 5970, N'Jyotsna', NULL, N'Patel', N'F', N'2710 US Highway 70 SW', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (209, 8589, N'Kalpana', NULL, N'Parmar', N'F', N'15324 Yellowstone Springs Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (210, 8021, N'Kalpana', NULL, N'Patel', N'F', N'109 Country Club Dr', N'No', 0, 27, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (211, 95802, N'Kalpana', NULL, N'Patel', N'F', N'12902 Cleopatra Dr', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (212, 310218, N'Kalpesh', N'Shantilal', N'Ram', N'M', N'925 Bendix Dr', N'No', 0, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (213, 7137, N'Kalpu', NULL, N'Patel', N'F', N'1209 Kent Dr', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (214, 6875, N'Kamala', NULL, N'Patel', N'F', N'5001 Oxfordshire Rd', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (215, 6770, N'Kamlesh', NULL, N'Patel', N'M', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (216, 237739, N'Kamlesh', NULL, N'Patel', N'M', N'1946 9th Street Pl SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (217, 7771, N'Kamu', NULL, N'Patel', N'F', N'1003 Garden Rose Ct', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (218, 310220, N'Kanji', N'Kalpesh', N'Ram', N'M', N'925 Bendix Dr', N'No', 0, 28, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (219, 7174, N'Kanta', NULL, N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (220, 7169, N'Kanu', NULL, N'Patel', N'M', N'11214 Sedgemoor Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (221, 6689, N'Kaushik', NULL, N'Patel', N'M', N'17123 Westmill Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (222, 6457, N'Kaushik', NULL, N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (223, 6489, N'Kena', NULL, N'Patel', N'F', N'3024 Clover Rd NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (224, 7892, N'Ketan', N'C', N'Suthar', N'M', N'15739 Greythorne Dr Apt 103', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (225, 6979, N'Ketki', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (226, 7039, N'Ketu', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (227, 8409, N'Ketul', NULL, N'Patel', N'M', N'5891 Bakers Pt', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (228, 310440, N'Keyuri', N'B', N'Patel', N'F', N'4100 Margaret Wallace Rd', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (229, 8719, N'Keyuri', N'B', N'Patel', N'F', N'552 Fair Oaks Dr', N'No', 0, 7, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (230, 6415, N'Khusbu', NULL, N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (231, 310430, N'Khushbu', NULL, N'Patel', N'F', N'421 Elizabeth Ave', N'No', 0, 27, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (232, 7887, N'Khushi', NULL, N'Gajjar', N'F', N'11812 Avaly Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (233, 7483, N'Kinal', NULL, N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (234, 313979, N'Kinjal', NULL, N'Patel', N'F', N'5892 Bakers Pt', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (235, 8894, N'Kiran', NULL, N'Patel', N'M', N'8623 Sedgeburn Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (236, 7073, N'Kirit', N'D', N'Parmar', N'M', N'9406 Vera Jones Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (237, 8818, N'Kirit', NULL, N'Patel', N'M', N'7903 Hereford St', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (238, 8167, N'Kiron', NULL, N'Patel', N'M', N'4330 Old Interstate Rd', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (239, 7877, N'Kirtan', NULL, N'Patel', N'M', N'1983 8th St SE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (240, 7067, N'Kirtan', NULL, N'Patel', N'M', N'9217 Unbridle Ln', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (241, 7313, N'Kirti', NULL, N'Parmar', N'M', N'14952 Havasu St', N'Yes', 1, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (242, 7484, N'Kirti', NULL, N'Patel', N'F', N'1918 8th St SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (243, 6117, N'Koki', NULL, N'Rathod', N'F', N'644 W Prospect Rd', N'No', 0, 24, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (244, 8168, N'Kokila', NULL, N'Patel', N'F', N'4330 Old Interstate Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (245, 316914, N'Krina', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (246, 310457, N'Krisha', NULL, N'Patel', N'F', N'439 Anvil Draw Pl', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (247, 6785, N'Krishna', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (248, 333321, N'Krishna', NULL, N'Rathod', N'F', N'644 W Prospect Rd', N'No', 0, 24, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (249, 310445, N'Krupa', N'B', N'Patel', N'F', N'4100 Margaret Wallace Rd', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (250, 8052, N'Kruti', NULL, N'Patel', N'F', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (251, 6637, N'Kumud', NULL, N'Brahmbhatt', N'F', N'5908 Hoover St', N'No', 0, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (252, 6028, N'Kumud', NULL, N'Patel', N'F', N'9607 Springholm Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (253, 8398, N'Kunali', NULL, N'Shah', N'F', N'9946 Nicole Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (254, 8494, N'Kunjal', NULL, N'Patel', N'F', N'7000 Joyful Noise Ln', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (255, 95806, N'Kush', N'Girish', N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (256, 7001, N'Laksh', N' ', N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'No', 0, 30, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (257, 332760, N'Lalita', NULL, N'Patel', N'F', N'13410 Mallard Lake Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (258, 7428, N'Lata', NULL, N'Patel', N'F', N'3019 Ernest Russell Ct', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (259, 8592, N'Laxmi', NULL, N'Parmar', N'F', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (260, 7314, N'Leena', NULL, N'Parmar', N'F', N'14952 Havasu St', N'Yes', 1, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (261, 7440, N'Lila', NULL, N'Patel', N'F', N'2718 Gastonia Dallas Hwy', N'No', 0, 6, 4, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (262, 7765, N'Lila', NULL, N'Patel', N'F', N'5892 Bakers Pt', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (263, 316916, N'Lilaben', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (264, 7335, N'Madhu', NULL, N'Patel', N'F', N'1201 Highway 9 Byp W', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (265, NULL, N'Madhu', NULL, N'Patel', N'M', N'4110 Shasta Cir', N'No', 0, 3, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (266, 95825, N'Madhu', NULL, N'Patel', N'F', N'4330 Old Interstate Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (267, 7848, N'Mahek', NULL, N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (268, 6636, N'Mahendra', NULL, N'Brahmbhatt', N'M', N'5908 Hoover St', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (269, 8072, N'Mahendra', NULL, N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (270, 6184, N'Mahendra', NULL, N'Patel', N'M', N'8767 Savannah Rd', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (271, 7917, N'Mahendra', NULL, N'Suthar', N'M', N'7015 Brighton Brook Dr', N'Yes', 1, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (272, 6799, N'Mahesh', NULL, N'Patel', N'M', N'17127 Westmill Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (273, 6421, N'Mahesh', NULL, N'Patel', N'M', N'303 N Maple St', N'Yes', 1, 22, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (274, 311157, N'Mahip', N'Prashant', N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (275, 7213, N'Mamta', NULL, N'Patel', N'F', N'132 W Main St', N'Yes', 1, 32, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (276, 6413, N'Manav', N' ', N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', 1, 18, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (277, 7173, N'Mangaldas', NULL, N'Patel', N'M', N'11214 Sedgemoor Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (278, 310428, N'Manisha', NULL, N'Patel', N'F', N'421 Elizabeth Ave', N'Yes', 1, 27, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (279, 8067, N'Manoj', NULL, N'Patel', N'M', N'413 College Dr', N'No', 0, 24, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (280, 136492, N'Mayur', NULL, N'Patel', N'M', N'10838 Stone Bunker Dr', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (281, 8495, N'Mayur', NULL, N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', 0, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (282, 8820, N'Mayur', N'K', N'Patel', N'M', N'7903 Hereford St', N'No', 0, 2, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (283, 8460, N'Mayur', NULL, N'Patel', N'M', N'818 20th Avenue Pl SE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (284, 7601, N'Mayuri', N'Prabodhbhai', N'Patel', N'F', N'2630 Gosling Terrace Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (285, 7638, N'Meena', NULL, N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (286, 7540, N'Meena', NULL, N'Patel', N'F', N'1516 Concord Pkwy N', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (287, 7735, N'Meena', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'Yes', 1, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (288, 310219, N'Megha', N'Kalpesh', N'Ram', N'F', N'925 Bendix Dr', N'No', 0, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (289, 8991, N'Mehul', NULL, N'Patel', N'M', N'1125 Boxelder Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (290, 8496, N'Mehul', NULL, N'Patel', N'M', N'7000 Joyful Noise Ln', N'No', 0, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (291, 7140, N'Mihir', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (292, 7542, N'Milan', NULL, N'Patel', N'M', N'1516 Concord Pkwy N', N'No', 0, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (293, 6769, N'Mina', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (294, 7170, N'Minal', NULL, N'Patel', N'F', N'11214 Sedgemoor Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (295, 6487, N'Minal', NULL, N'Patel', N'F', N'3024 Clover Rd NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (296, 8232, N'Minaxi', NULL, N'Patel', N'F', N'8347 Marigold Pl', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (297, 6831, N'Mita', NULL, N'Patel', N'F', N'2526 King Arthur Dr', N'Yes', 1, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (298, 310212, N'Mital', N'B', N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (299, 6999, N'Mumukshu', NULL, N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (300, 6882, N'Naiya', NULL, N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (301, NULL, N'Nalin', NULL, N'Patel', N'M', N'6625 Rollingridge Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (302, 6086, N'Nalini', NULL, N'Patel', N'F', N'12303 Summer Breeze Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (303, 8910, N'Nalini', NULL, N'Patel', N'F', N'207 N Jackson Rd # A', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (304, 7640, N'Nandita', NULL, N'Gajjar', N'F', N'6904 Whitebeam Way', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (305, 7111, N'Narendra', NULL, N'Patel', N'M', N'6217 Chavel Ln', N'Yes', 1, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (306, 7634, N'Natasha', NULL, N'Shah', N'F', N'15020 Redwood Valley Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (307, 242063, N'Natubhai', N'R', N'Patel', N'M', N'13410 Mallard Lake Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (308, 332758, N'Natvar', NULL, N'Patel', N'M', N'1134 Jade Glen Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (309, 7595, N'Natvarlal', NULL, N'Patel', N'M', N'8824 Kentucky Derby Dr', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (310, 7427, N'Navin', NULL, N'Patel', N'M', N'3019 Ernest Russell Ct', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (311, 9029, N'Nayanjyoth', NULL, N'Patel', N'F', N'6085 Creekview Ct', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (312, 6773, N'Neeya', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (313, 8631, N'Neeyal', NULL, N'Patel', N'M', N'17416 Campbell Hall Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (314, NULL, N'Nehal', NULL, N'Patel', N'M', N'10125 University Park Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (315, 7800, N'Nehal', NULL, N'Patel', N'M', N'1810 Therrell Farms Rd', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (316, 95433, N'Nehal', N'Vasant', N'Patel', N'F', N'2766 Lake Wylie Dr', N'Yes', 1, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (317, 310429, N'Neil', N' ', N'Patel', N'M', N'421 Elizabeth Ave', N'Yes', 1, 27, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (318, 7418, N'Neti', N'Dharmenrda', N'Patel', N'F', N'4864 Annelise Dr', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (319, 8563, N'Nikhil', NULL, N'Patel', N'M', N'9016 Tamarron Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (320, 7076, N'Nikita', NULL, N'Parmar', N'F', N'9406 Vera Jones Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (321, 8323, N'Nikita', NULL, N'Patel', N'F', N'8767 Savannah Rd', N'Yes', 1, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (322, 7037, N'Nikul', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (323, 332336, N'Nila', NULL, N'Patel', N'F', N'138 Norman Station Blvd', N'No', 0, 19, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (324, 7875, N'Nilam', NULL, N'Patel', N'F', N'1983 8th St SE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (325, 6422, N'Nilanjana', NULL, N'Patel', N'F', N'303 N Maple St', N'No', 0, 22, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (326, 7145, N'Nilesh', NULL, N'Patel', N'M', N'10610 Bere Island Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (327, 6204, N'Nilesh', NULL, N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (328, 8395, N'Nilesh', NULL, N'Shah', N'M', N'9946 Nicole Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (329, 8539, N'Nilu', NULL, N'Patel', N'F', N'7318 Timberneck Ct', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (330, 8718, N'Nimesh', NULL, N'Patel', N'M', N'552 Fair Oaks Dr', N'Yes', 1, 7, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (331, 8489, N'Nimesh', NULL, N'Patel', N'M', N'8623 Sedgeburn Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (332, 311127, N'Nimisha', NULL, N'Patel', N'F', N'413 College Dr', N'No', 0, 24, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (333, 6205, N'Nimita', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'No', 0, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (334, 7447, N'Niranjan', NULL, N'Patel', N'M', N'638 Ridge St', N'Yes', 1, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (335, 6994, N'Niranjan', NULL, N'Patel', N'M', N'7301 Conifer Ct', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (336, 313977, N'Nishal', NULL, N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (337, 7059, N'Nita', NULL, N'Patel', N'F', N'221 Cattle Ridge Rd', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (338, 7632, N'Nita', NULL, N'Shah', N'F', N'15020 Redwood Valley Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (339, 313978, N'Niyam', NULL, N'Jambusaria', N'M', N'10306 Paxton Run Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (340, 8632, N'Niyati', NULL, N'Patel', N'F', N'17416 Campbell Hall Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (341, 6925, N'Padma', NULL, N'Patel', N'F', N'7413 Chital Rd', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (342, 6411, N'Pankaj', N'M', N'Patel', N'M', N'2816 Iveywood Dr', N'Yes', 1, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (343, 8590, N'Param', N'I', N'Parmar', N'M', N'15324 Yellowstone Springs Ln', N'No', 0, 2, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (344, 6877, N'Paresh', NULL, N'Patel', N'M', N'1204 Somerset Dr', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (345, 233888, N'Paresh', N'K', N'Sutariya', N'M', N'10119 Oxford Landing Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (346, 8551, N'Parina', NULL, N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (347, 310226, N'Parth', N'Pritesh', N'Patel', N'M', N'3275 Edgeland Hwy', N'No', 0, 25, 9, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (348, 311132, N'Parth', N'P', N'Patel', N'M', N'7527 Carrington Forest Ln', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (349, 7885, N'Payal', NULL, N'Gajjar', N'F', N'11812 Avaly Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (350, 6437, N'Pinky', NULL, N'Patel', N'F', N'1041 Ainsdale Dr', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (351, 390528, N'Pooja', N'A', N'Kamdar', N'F', N'6405 STONE RIDGE CT', N'No', 0, 12, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (352, 7533, N'Prabhudas', NULL, N'Darji', N'M', N'7307 Brigmore Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (353, 6569, N'Prabhudas', NULL, N'Patel', N'M', N'5815 Langwell Ln', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (354, 7600, N'Prabodh', NULL, N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (355, 242275, N'PRADIP', NULL, N'PATEL', N'M', N'2721 Winnsboro Rd', N'No', 0, 21, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (356, 8893, N'Praful', NULL, N'Patel', N'M', N'8623 Sedgeburn Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (357, 7036, N'Pramit', NULL, N'Patel', N'M', N'6235 Hermsley Rd', N'No', 0, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (358, 7146, N'Pranjali', NULL, N'Patel', N'F', N'10610 Bere Island Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (359, 7820, N'Prashant', N'D', N'Parmar', N'M', N'9500 Marsena Ct', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (360, 8881, N'Prashant', NULL, N'Patel', N'M', N'6827 Creft Cir', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (361, 8121, N'Prashant', NULL, N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (362, 7893, N'Pravika', N'Ketan', N'Suthar', N'F', N'15739 Greythorne Dr Apt 103', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (363, 6194, N'Pravin', NULL, N'Patel', N'M', N'1608 E Roosevelt Blvd', N'Yes', 1, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (364, 8841, N'Pravin', N' ', N'Patel', N'M', N'302 Salem Rd', N'No', 0, 20, 8, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (365, 7764, N'Pravin', NULL, N'Patel', N'M', N'5892 Bakers Pt', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (366, 6903, N'Pravinchandra', N' ', N'Patel', N'M', N'305 Londonderry Dr', N'Yes', 1, 16, 8, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (367, 310442, N'Prayag', N'B', N'Patel', N'M', N'4100 Margaret Wallace Rd', N'No', 0, 17, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (368, 7486, N'Preet', NULL, N'Patel', N'M', N'1918 8th St SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (369, 7955, N'Preet', NULL, N'Patel', N'M', N'4613 9th St NE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (370, 7214, N'Prem', N' ', N'Patel', N'M', N'132 W Main St', N'No', 0, 32, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (371, 5994, N'Prem', N' ', N'Patel', N'M', N'325 US Highway 70 SW', N'No', 0, 9, 5, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (372, 7139, N'Prit', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (373, 7779, N'Pritash', NULL, N'Patel', N'M', N'3234 Devon Croft Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (374, 310224, N'Pritesh', NULL, N'Patel', N'M', N'3275 Edgeland Hwy', N'Yes', 1, 25, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (375, 136483, N'Priya', NULL, N'Patel', N'F', N'1040 Conestoga Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (376, 6802, N'Puja', NULL, N'Patel', N'F', N'17127 Westmill Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (377, 8307, N'Punita', NULL, N'Gajjar', N'F', N'4029 Raccoon Run Ct', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (378, 8073, N'Purnima', NULL, N'Patel', N'F', N'599 Cranborne Chase', N'Yes', 1, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (379, 316913, N'Purva', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (380, 8484, N'Pushpa', NULL, N'Patel', N'F', N'360 Ivy Park Ln', N'Yes', 1, 31, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (381, 7608, N'Pushpa', NULL, N'Patel', N'F', N'5444 Allison Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (382, 7033, N'Pushpa', NULL, N'Patel', N'F', N'8526 Kershaw Camden Hwy', N'No', 0, 13, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (383, 6784, N'Radhikaben', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (384, 8550, N'Rahi', NULL, N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (385, 7639, N'Rahul', NULL, N'Gajjar', N'M', N'6904 Whitebeam Way', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (386, 8814, N'Rahul', N' ', N'Shah', N'M', N'802 Pine Valley Ct', N'No', 0, 17, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (387, 136484, N'Raj', NULL, N'Patel', N'M', N'1040 Conestoga Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (388, 6744, N'Rajan', N' ', N'Patel', N'M', N'5016 Tremont Dr', N'No', 0, 10, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (389, 6306, N'Rajendra', NULL, N'Patel', N'M', N'2005 Belleforest Ct', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (390, 95801, N'Rajesh', NULL, N'Patel', N'M', N'12902 Cleopatra Dr', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (391, 8397, N'Rajiv', N' ', N'Shah', N'M', N'9946 Nicole Ln', N'No', 0, 2, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (392, 310433, N'Ramendra', NULL, N'Bhatt', N'M', N'806 Lee St', N'No', 0, 14, 4, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (393, 7032, N'Ramesh', NULL, N'Patel', N'M', N'8526 Kershaw Camden Hwy', N'No', 0, 13, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (394, 6787, N'Ramilaben', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (395, 7035, N'Ranjan', NULL, N'Patel', N'F', N'6235 Hermsley Rd', N'Yes', 1, 2, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (396, 6952, N'Ranjan', NULL, N'Patel', N'F', N'9620 Puddle Duck Rd Apt 305', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (397, 7780, N'Rashmi', NULL, N'Patel', N'F', N'3234 Devon Croft Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (398, 6672, N'Rashmita', N'V', N'Patel', N'F', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (399, 95815, N'Rasila', NULL, N'Panara', N'F', N'9123 Royal Highlands Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (400, 7202, N'Ravi', NULL, N'Patel', N'M', N'2011 Apogee Dr', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (401, 6438, N'Rayan', NULL, N'Patel', N'M', N'1041 Ainsdale Dr', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (402, 6693, N'Reena', NULL, N'Patel', N'F', N'17123 Westmill Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (403, 7821, N'Rekha', NULL, N'Parmar', N'F', N'9500 Marsena Ct', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (404, 6690, N'Rekha', NULL, N'Patel', N'F', N'17123 Westmill Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (405, 9055, N'Rekha', NULL, N'Patel', N'F', N'3730 US Highway 601', N'Yes', 1, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (406, 7574, N'Renu', NULL, N'Patel', N'F', N'11142 Tradition View Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (407, 7004, N'Renuka', NULL, N'Brahmbhatt', N'F', N'709 Beauhaven Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (408, 6307, N'Renuka', NULL, N'Patel', N'F', N'2005 Belleforest Ct', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (409, 7895, N'Renuka', NULL, N'Suthar', N'F', N'15739 Greythorne Dr Apt 103', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (410, 380897, N'Renuka', N'C', N'Suthar', N'F', N'15739 Greythorne Dr Apt 103', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (411, 6460, N'Rinali', NULL, N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (412, 310423, N'Rinku', N'V', N'Patel', N'F', N'117 Lily Green Ct NW', N'No', 0, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (413, 310215, N'Ripal', N'Hiren', N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (414, 6488, N'Rishabh', N'Asit', N'Patel', N'M', N'3024 Clover Rd NW', N'Yes', 1, 4, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (415, 7272, N'Riya', NULL, N'Patel', N'F', N'1213 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (416, 8463, N'Riya', NULL, N'Patel', N'F', N'818 20th Avenue Pl SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (417, 8815, N'Riya', NULL, N'Shah', N'F', N'802 Pine Valley Ct', N'No', 0, 17, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (418, 7673, N'Roma', NULL, N'Patel', N'F', N'10742 Derryrush Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (419, 7219, N'Ronak', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (420, 316964, N'Ruhi', N'R', N'Gajjar', N'F', N'6904 Whitebeam Way', N'No', 0, 17, 2, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (421, 95435, N'Ruhi', N'Vasant', N'Patel', N'F', N'2766 Lake Wylie Dr', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (422, 8813, N'Rupal', N'S', N'Shah', N'F', N'802 Pine Valley Ct', N'Yes', 1, 17, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (423, 7136, N'Rupesh', NULL, N'Patel', N'M', N'1209 Kent Dr', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (424, 375002, N'Rushi', NULL, N'Parekh', N'M', N'2521 Clare Olivia Dr Apt 203', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (425, 138401, N'Sachin', NULL, N'Devani', N'M', N'2544 Weddington Ave Apt 2348', N'No', 0, 3, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (426, 6078, N'Sadhana', NULL, N'Desai', N'F', N'611 W Roosevelt Blvd Apt 127', N'Yes', 1, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (427, 6692, N'Sagar', NULL, N'Patel', N'M', N'17123 Westmill Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (428, 6832, N'Sagar', N'J', N'Patel', N'M', N'2526 King Arthur Dr', N'Yes', 1, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (429, 310217, N'Sahaj', N' ', N'Patel', N'M', N'599 Cranborne Chase', N'No', 0, 7, 3, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (430, 332334, N'Sahil', NULL, N'Hira', N'M', N'138 Norman Station Blvd', N'No', 0, 19, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (431, 8054, N'Sajani', NULL, N'Patel', N'F', N'7527 Carrington Forest Ln', N'No', 0, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (432, 8812, N'Sameer', NULL, N'Shah', N'M', N'802 Pine Valley Ct', N'Yes', 1, 17, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (433, 340102, N'Sandeep', N'Dilip', N'Patil', N'M', N'7305 Hagen Ct Apt 1512', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (434, 6458, N'Sangeeta', NULL, N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (435, 7268, N'Sangita', NULL, N'Patel', N'F', N'1213 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (436, 6783, N'Sangita', NULL, N'Patel', N'F', N'200 Henson St', N'No', 0, 1, 1, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (437, 233954, N'Sangitaben', N'Paresh', N'Sutariya', N'F', N'10119 Oxford Landing Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (438, 6077, N'Sanjay', NULL, N'Desai', N'M', N'611 W Roosevelt Blvd Apt 127', N'No', 0, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (439, 7953, N'Sanjay', NULL, N'Patel', N'M', N'4613 9th St NE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (440, 6922, N'Sanjeet', NULL, N'Patel', N'M', N'2413 Arden Gate Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (441, 7876, N'Sarju', NULL, N'Patel', N'F', N'1983 8th St SE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (442, 8990, N'Saroj', NULL, N'Patel', N'F', N'1125 Boxelder Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (443, 8600, N'Saroj', NULL, N'Patel', N'F', N'703 N Pearl St', N'No', 0, 22, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (444, 9056, N'Satish', NULL, N'Patel', N'M', N'3730 US Highway 601', N'Yes', 1, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (445, 7054, N'Satish', NULL, N'Patel', N'M', N'4101 Regency Dr', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (446, 7631, N'Saurin', NULL, N'Shah', N'M', N'15020 Redwood Valley Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (447, 313976, N'Sejal', NULL, N'Jambusaria', N'F', N'10306 Paxton Run Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (448, 70685, N'Shail', NULL, N'Agarwal', N'F', N'Unknown Address', N'No', 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (449, 6195, N'Shakuntala', NULL, N'Patel', N'F', N'1608 E Roosevelt Blvd', N'No', 0, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (450, 8428, N'Shalini', NULL, N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (451, 136490, N'Shanta', NULL, N'Patel', N'F', N'2413 Arden Gate Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (452, 95810, N'Shantaben', NULL, N'Patel', N'F', N'2800 Foxwood Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (453, 8565, N'Sharad', NULL, N'Patel', N'M', N'9016 Tamarron Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (454, 332759, N'Sharda', N'N', N'Patel', N'F', N'1134 Jade Glen Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (455, 6616, N'Shashikant', NULL, N'Patel', N'M', N'7149 Cobden Ln', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (456, 60682, N'Sheena', NULL, N'Patel', N'F', N'434 Frazier Ave', N'No', 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (457, 6771, N'Sheetal', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'Yes', 1, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (458, 8427, N'Shilpa', NULL, N'Dave', N'F', N'11428 Foggy Bank Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (459, 6977, N'Shilpa', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'Yes', 1, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (460, 8549, N'Shilpa', NULL, N'Patel', N'F', N'280 Indian Trl', N'No', 0, 19, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (461, 7954, N'Shilpa', NULL, N'Patel', N'F', N'4613 9th St NE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (462, 8020, N'Shilpesh', NULL, N'Patel', N'M', N'109 Country Club Dr', N'Yes', 1, 27, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (463, 6801, N'Shiv', N' ', N'Patel', N'M', N'17127 Westmill Ln', N'No', 0, 2, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (464, 6772, N'Shivanee', NULL, N'Patel', N'F', N'10838 Stone Bunker Dr', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (465, 7602, N'Shivang', NULL, N'Patel', N'M', N'2630 Gosling Terrace Rd', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (466, 7270, N'Shivangi', NULL, N'Patel', N'M', N'1213 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (467, 6414, N'Shivangini', NULL, N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (468, 6308, N'Shyam', NULL, N'Patel', N'M', N'2005 Belleforest Ct', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (469, 7711, N'Smita', NULL, N'Amin', N'F', N'1395 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (470, 6921, N'Sneha', NULL, N'Patel', N'F', N'2413 Arden Gate Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (471, 5996, N'Sneha', NULL, N'Patel', N'F', N'325 US Highway 70 SW', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (472, 136494, N'Sohini', NULL, N'Patel', N'F', N'11925 Southcrest Ln', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (473, 7148, N'Sohum', NULL, N'Patel', N'M', N'10610 Bere Island Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (474, 7801, N'Sonal', NULL, N'Patel', N'F', N'1810 Therrell Farms Rd', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (475, 95820, N'Sonia', NULL, N'Patel', N'F', N'221 Cattle Ridge Rd', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (476, 311156, N'Soniya', N'P', N'Sompura', N'F', N'8838 Chalkstone Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (477, 7002, N'Subhash', NULL, N'Brahmbhatt', N'M', N'709 Beauhaven Ln', N'Yes', 1, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (478, 380902, N'Suchi', N'Ashish', N'Patel', N'F', N'2508 Highland Park Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (479, 6424, N'Sudha', NULL, N'Patel', N'F', N'1816 Damascus St', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (480, 7918, N'Sulochana', NULL, N'Suthar', N'F', N'7015 Brighton Brook Dr', N'Yes', 1, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (481, 7596, N'Sumitra', NULL, N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (482, 6878, N'Sunita', NULL, N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (483, 8564, N'Sunita', NULL, N'Patel', N'F', N'9016 Tamarron Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (484, 8413, N'Suresh', NULL, N'Patel', N'M', N'2120 Savoy Pl', N'No', 0, 7, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (485, 6441, N'Surya', NULL, N'Patel', N'F', N'1236 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (486, 7144, N'Suryakant', NULL, N'Patel', N'M', N'1209 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (487, 7734, N'Suryakant', N'I', N'Patel', N'M', N'599 Cranborne Chase', N'Yes', 1, 7, 3, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (488, 7594, N'Swamini', N'Hiren', N'Patel', N'F', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (489, 8260, N'Swati', NULL, N'Patel', N'F', N'14044 Lissadell Cir', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (490, 7147, N'Swayam', NULL, N'Patel', N'M', N'10610 Bere Island Dr', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (491, 9059, N'Tanvi', NULL, N'Patel', N'F', N'3730 US Highway 601', N'Yes', 1, 28, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (492, 6045, N'Tej', NULL, N'patel', N'M', N'2616 Brackley Pl NW', N'No', 0, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (493, 6412, N'Tejal', NULL, N'Patel', N'F', N'2816 Iveywood Dr', N'No', 0, 18, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (494, 8461, N'Tejal', NULL, N'Patel', N'F', N'818 20th Avenue Pl SE', N'Yes', 1, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (495, 8821, N'Tejas', NULL, N'Patel', N'M', N'7903 Hereford St', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (496, 310223, N'Tejas', NULL, N'Patel', N'M', N'9692 Laurie Ave NW', N'Yes', 1, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (497, 313984, N'Tilak', NULL, N'Patel', N'M', N'12552 Druids Glen Dr', N'No', 0, 23, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (498, 8233, N'Tilak', N' ', N'Patel', N'M', N'8347 Marigold Pl', N'No', 0, 8, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (499, 7593, N'Tilak', N'Hiren', N'Patel', N'M', N'8824 Kentucky Derby Dr', N'No', 0, 30, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (500, 310225, N'Toral', NULL, N'Patel', N'F', N'3275 Edgeland Hwy', N'Yes', 1, 25, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (501, 311159, N'Tulsi', N'Nehal', N'Patel', N'F', N'5664 Tipperlinn Way', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (502, 7777, N'Tushar', NULL, N'Patel', N'M', N'3234 Devon Croft Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (503, 8324, N'Tushar', NULL, N'Patel', N'M', N'8767 Savannah Rd', N'No', 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (504, 8051, N'Upen', NULL, N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (505, 7142, N'Urmila', NULL, N'Patel', N'F', N'1209 Kent Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (506, 7184, N'Urmila', NULL, N'Patel', N'F', N'3600 Mooreland Farms Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (507, 6617, N'Urmila', NULL, N'Patel', N'F', N'7149 Cobden Ln', N'No', 0, 2, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (508, 8985, N'Vandan', NULL, N'Patel', N'M', N'1862 Gingercake Cir', N'No', 0, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (509, 8349, N'Vanita', NULL, N'Patel', N'F', N'8801 Darcy Hopkins Dr', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (510, 316912, N'Vanitaben', NULL, N'Patel', N'F', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (511, 310434, N'Vanlila', N'R', N'Bhatt', N'F', N'806 Lee St', N'No', 0, 14, 4, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (512, 7999, N'Varad', NULL, N'Soneji', N'M', N'1110 Yorkmont Ridge Ln Apt 1134', N'Yes', 1, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (513, 7201, N'Varsha', NULL, N'Patel', N'F', N'2011 Apogee Dr', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (514, 7778, N'Varsha', NULL, N'Patel', N'F', N'3234 Devon Croft Ln', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (515, 7761, N'Vasant', NULL, N'Patel', N'M', N'2766 Lake Wylie Dr', N'Yes', 1, 26, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (516, 310227, N'Vedi', NULL, N'Patel', N'F', N'3275 Edgeland Hwy', N'No', 0, 25, 9, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (517, 311158, N'Vihaan', NULL, N'Sompura', N'M', N'8838 Chalkstone Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (518, 6614, N'Vikas', N'Prashant', N'Patel', N'M', N'10071 Highland Creek Cir', N'No', 0, 7, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (519, 8819, N'Vilash', NULL, N'Patel', N'F', N'7903 Hereford St', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (520, 6671, N'Vimal', NULL, N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (521, 8465, N'Vimala', NULL, N'Patel', N'F', N'818 20th Avenue Pl SE', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (522, 311131, N'Vimarsh', NULL, N'Patel', N'M', N'7527 Carrington Forest Ln', N'Yes', 1, 17, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (523, 6883, N'Vimla', N'P', N'Patel', N'F', N'1204 Somerset Dr', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (524, 7573, N'Vinod', NULL, N'Patel', N'M', N'11142 Tradition View Dr', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (525, 6250, N'Vipul', NULL, N'Patel', N'M', N'117 Lily Green Ct NW', N'No', 0, 4, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (526, 6673, N'Vir', NULL, N'Patel', N'M', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (527, 6674, N'Vira', NULL, N'Patel', N'F', N'9932 Rocky Ford Club Rd', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (528, 7075, N'Vishal', N' ', N'Parmar', N'M', N'9406 Vera Jones Ln', N'No', 0, 2, 7, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (529, 7220, N'Vishal', NULL, N'Patel', N'M', N'1391 Charlotte Hwy', N'No', 0, 15, 6, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (530, 6272, N'Vivek', N' ', N'Patel', N'M', N'1719 Funny Cide Dr', N'No', 0, 30, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (531, 7672, N'Vrajesh', NULL, N'Patel', N'M', N'10742 Derryrush Dr', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (532, 340103, N'Vrushali', N'Sandeep', N'Patil', N'F', N'7305 Hagen Ct Apt 1512', N'No', 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (533, 233955, N'Xitiz', N'P', N'Sutariya', N'F', N'10119 Oxford Landing Ln', N'No', 0, 2, 11, 1)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (534, 6087, N'Yagnesh', NULL, N'Patel', N'M', N'12303 Summer Breeze Ct', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (535, 8231, N'Yagnesh', NULL, N'Patel', N'M', N'8347 Marigold Pl', N'Yes', 1, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (536, 8714, N'Yagnesh', NULL, N'Patel', N'M', N'9523 Longstone Ln', N'Yes', 1, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (537, 95811, N'Yash', NULL, N'Mansinghka', N'M', N'5610 Edenfield Ln', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (538, 6701, N'Yogesh', NULL, N'Patel', N'M', N'5800 Shadow Creek Rd', N'No', 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (539, 8493, N'Yogesh', NULL, N'Patel', N'M', N'7000 Joyful Noise Ln', N'Yes', 1, 10, 2, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (540, 8599, N'Yogesh', NULL, N'Patel', N'M', N'703 N Pearl St', N'No', 0, 22, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (541, 5995, N'Yogi', NULL, N'Patel', N'M', N'325 US Highway 70 SW', N'No', 0, 9, 5, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (545, NULL, N'Pravin', N' ', N'Patel', N'M', N'8378 Burgundy Ridge Dr', NULL, 0, 8, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (546, NULL, N'Pratik', N' ', N'Patel', N'M', N'8412 River Walk Ct', NULL, 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (547, NULL, N'Shaileshbhai ', N' ', N'Gajjar', N'M', N'Aa', NULL, 0, 2, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (548, NULL, N'Kaushik', N' ', N'Korat', N'M', N'2078 feldspar dr', NULL, 1, 6, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (549, NULL, N'Rajubhai ', N'Bholabhai ', N'Patel ', N'M', N'2005 belle forest court ', NULL, 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (550, NULL, N'Mukesh', N'M', N'Patel ', N'M', N'3112 commerce dr', NULL, 0, 25, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (551, NULL, N'Pratik', N' ', N'Patel', N'M', N'5921 trial water rd', NULL, 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (552, NULL, N'Kalpesh', N' ', N'Patel ', N'M', N'10135 elizabeth creft lane', NULL, 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (553, NULL, N'Nitin', N' ', N'Patel ', N'M', N'4200 High Shoals Dr', NULL, 0, 18, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (554, NULL, N'Chirag', N' ', N'Patel ', N'M', N'765 us hwy 74 business', NULL, 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (555, NULL, N'Suresh', N'K', N'Patel ', N'M', N'903 bethlehem rd', NULL, 0, 14, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (556, NULL, N'Bharat', N' ', N'Patel ', N'M', N'903 Bethlehem rd', NULL, 0, 14, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (557, NULL, N'Jaydeep', N' ', N'Patel ', N'M', N'103 caversham dr', NULL, 0, 19, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (558, NULL, N'Amit', N' ', N'Patel ', N'M', N'4200 old roxbury dr', NULL, 0, 17, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (559, NULL, N'Amit', N' ', N'Langde', N'M', N'1841 alexander highlands Dr', NULL, 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (560, NULL, N'Vijay ', N' ', N'Patel ', N'M', N'8211 pampli court', NULL, 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (561, NULL, N'Tarak', N' ', N'Desai', N'M', N'2722 sawgrass rich place', NULL, 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (562, NULL, N'Daxesh', N'J', N'Patel', N'M', N'TBD', NULL, 0, 2, 7, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (563, NULL, N'Jitendra', N' ', N'Patel', N'M', N'220 cattle ridge rd', NULL, 0, 30, 11, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (564, NULL, N'Bharat ', N' ', N'Patel ', N'M', N'4330 old interstate rd #213 ', NULL, 0, 2, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (565, NULL, N'Nishant', N' ', N'Gajjar ', N'M', N'3821 trappers run dr', NULL, 0, 17, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (566, 0, N'Sandeepbhai', N'x', N'Patel', N'M', N'8767 Savannah Rd', NULL, 0, 8, 8, 0)
GO
INSERT [dbo].[Att_Attendee] ([Id], [ImsId], [FirstName], [MiddleName], [LastName], [Gender], [Address], [Karyakar], [IsKaryakar], [CityId], [ZoneId], [IsDeleted]) VALUES (567, 0, N'Hasmukh', N' ', N'Patel ', N'M', N'10436 plantain ct', NULL, 0, 2, 8, 0)
GO
SET IDENTITY_INSERT [dbo].[Att_Attendee] OFF
GO
SET IDENTITY_INSERT [dbo].[Att_AttendeeSeva] ON 

GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (1, 345, 33, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (2, 156, 1, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (3, 205, 2, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (4, 205, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (5, 241, 3, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (6, 515, 38, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (7, 515, 39, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (8, 319, 8, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (9, 504, 9, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (10, 385, 10, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (11, 29, 12, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (13, 102, 13, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (14, 102, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (15, 102, 45, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (16, 179, 14, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (17, 520, 15, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (18, 520, 32, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (19, 424, 16, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (20, 512, 16, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (21, 487, 17, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (22, 143, 19, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (23, 419, 21, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (24, 428, 23, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (25, 440, 24, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (26, 440, 56, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (27, 536, 24, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (28, 536, 43, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (30, 315, 24, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (31, 315, 47, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (32, 432, 25, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (33, 432, 28, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (34, 432, 33, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (35, 45, 26, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (36, 55, 26, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (37, 237, 26, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (38, 133, 26, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (39, 334, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (40, 390, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (41, 344, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (42, 184, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (43, 439, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (44, 186, 27, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (45, 222, 30, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (46, 43, 36, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (47, 299, 39, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (48, 299, 41, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (49, 269, 39, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (50, 67, 48, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (51, 215, 50, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (52, 215, 52, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (53, 17, 54, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (54, 539, 58, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (55, 465, 60, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (56, 502, 62, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (57, 94, 63, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (58, 42, 63, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (59, 7, 65, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (60, 70, 67, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (61, 85, 69, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (62, 158, 71, 0)
GO
INSERT [dbo].[Att_AttendeeSeva] ([Id], [AttendeeId], [Sevaid], [IsDeleted]) VALUES (63, 125, 71, 0)
GO
SET IDENTITY_INSERT [dbo].[Att_AttendeeSeva] OFF
GO
SET IDENTITY_INSERT [dbo].[Att_City] ON 

GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (1, N'Albemarle')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (2, N'Charlotte')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (3, N'Clover')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (4, N'Concord')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (5, N'Cornelius')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (6, N'Dallas')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (7, N'Fort Mill')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (8, N'Harrisburg')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (9, N'Hickory')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (10, N'Indian Trail')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (11, N'Jefferson')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (12, N'KANNAPOLIS')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (13, N'Kershaw')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (14, N'Kings Mountain')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (15, N'Lancaster')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (16, N'Lumberton')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (17, N'Matthews')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (18, N'Monroe')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (19, N'Mooresville')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (20, N'Morganton')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (21, N'Newberry')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (22, N'Pageland')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (23, N'Pineville')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (24, N'Raeford')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (25, N'Richburg')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (26, N'Rock Hill')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (27, N'Rockingham')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (28, N'Salisbury')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (29, N'Trinity')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (30, N'Waxhaw')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (31, N'Winston Salem')
GO
INSERT [dbo].[Att_City] ([Id], [Name]) VALUES (32, N'Yadkinville')
GO
SET IDENTITY_INSERT [dbo].[Att_City] OFF
GO
SET IDENTITY_INSERT [dbo].[Att_Event] ON 

GO
INSERT [dbo].[Att_Event] ([Id], [Name]) VALUES (1, N'Ravi Sabha')
GO
SET IDENTITY_INSERT [dbo].[Att_Event] OFF
GO
SET IDENTITY_INSERT [dbo].[Att_EventSchedule] ON 

GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (1, 1, CAST(N'2017-01-01' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (2, 1, CAST(N'2017-01-08' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (3, 1, CAST(N'2017-01-15' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (4, 1, CAST(N'2017-01-22' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (5, 1, CAST(N'2017-01-29' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (6, 1, CAST(N'2017-02-05' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (7, 1, CAST(N'2017-02-12' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (8, 1, CAST(N'2016-11-27' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (9, 1, CAST(N'2016-11-20' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (10, 1, CAST(N'2016-10-09' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (11, 1, CAST(N'2016-10-02' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (12, 1, CAST(N'2017-02-19' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (13, 1, CAST(N'2017-02-26' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (14, 1, CAST(N'2017-03-05' AS Date), 1, N'Today''s Sabha started at 5:15pm')
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (16, 1, CAST(N'2017-03-12' AS Date), 1, N'From today we have also started taking Mahila side attendance as well.')
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (17, 1, CAST(N'2017-03-19' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (18, 1, CAST(N'2017-03-26' AS Date), 1, NULL)
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (19, 1, CAST(N'2017-04-02' AS Date), 1, N'No attendance today due to Hari Jayanti Samaiyo.')
GO
INSERT [dbo].[Att_EventSchedule] ([Id], [EventId], [EventDate], [IsFreezed], [Notes]) VALUES (20, 1, CAST(N'2017-04-09' AS Date), 1, N'No mahila attendance today due to Mahila Sammayo')
GO
SET IDENTITY_INSERT [dbo].[Att_EventSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Att_Seva] ON 

GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (1, N'Mandir', N'Coordinator', N'Mandir-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (2, N'Accounts', N'Coordinator', N'Acc-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (3, N'Accounts', N'Team Member', N'Acc-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (4, N'HR & Legal', N'Coordinator', N'HR&L-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (5, N'HR & Legal', N'Team Member', N'HR&L-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (6, N'Satsang Outreach', N'Coordinator', N'SO-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (7, N'Satsang Outreach', N'Team Member', N'SO-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (8, N'Mandir', N'Admin Secretary', N'Mand-AdmSec', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (9, N'Satsang', N'Admin Coordinator', N'Sat-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (10, N'Sabha Sanchalan', N'Coordinator', N'Sabha Sanch.-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (11, N'Sabha Sanchalan', N'Announcement Lead', N'Sabha Sanch.-Annc. Lead', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (12, N'Sabha Sanchalan', N'Back Stage Lead', N'Sabha Sanch.-Back Stage Lead', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (13, N'Sabha Sanchalan', N'Cultural Program Lead', N'Sabha Sanch.-Cul Prg Lead', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (14, N'Sabha Sanchalan', N'Katha Sevak Lead', N'Sabha Sanch.-Kath Sevak Lead', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (15, N'Sabha Sanchalan', N'Kirtan Team Lead', N'Sabha Sanch.-Kirtan Tm Lead', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (16, N'Sabha Sanchalan', N'Team Member', N'Sabha Vyav.-Tm Lead', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (17, N'Sabha Vyavastha', N'Coordinator', N'Sabha Vyav.-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (18, N'Sabha Vyavastha', N'Team Member', N'Sabha Vyav.-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (19, N'Bal', N'Coordinator', N'Bal-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (20, N'Bal', N'Team Member', N'Bal-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (21, N'Kishore', N'Coordinator', N'Kishor-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (22, N'Kishor', N'Team Member', N'Kishor-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (23, N'Yuvak', N'Coordinator', N'Yuvak-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (24, N'Yuvak', N'Team Member', N'Yuvak-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (25, N'Satsang Network', N'Admin Coordinator', N'SN-AdCo', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (26, N'Satsang Network', N'Coordinator (SNC)', N'SN-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (27, N'Satsang Network', N'Zone Leader', N'SN-ZL', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (28, N'Satsang Network', N'Goshthi Moderator Lead', N'SN-Goshthi Lead', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (29, N'Satsang Network', N'Sampark Karyakar', N'SN-Sampartk', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (30, N'Volunteer', N'Coordinator', N'VOL-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (31, N'Volunteer', N'Team Member', N'VOL-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (32, N'Database', N'Coordinator', N'DB-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (33, N'Database', N'Team Member', N'DB-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (34, N'Remote Network', N'Coordinator', N'Remote Net-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (35, N'Remote Network', N'Team Member', N'Remote Net-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (36, N'Satsang Exam', N'Coordinator', N'Satsang Exam-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (37, N'Satsang Exam', N'Team Member', N'Satsang Exam-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (38, N'Outreach', N'Admin Coordinator', N'Outreach-Adm Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (39, N'Outreach', N'Coordinator', N'Outreach-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (40, N'Outreach', N'Team Member', N'Outreach-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (41, N'PR', N'Coordinator', N'PR-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (42, N'PR', N'Team Member', N'PR-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (43, N'Media', N'Coordinator', N'Media-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (44, N'Media', N'Team Member', N'Media-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (45, N'Medical Services', N'Coordinator', N'Medical Ser-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (46, N'Medical Services', N'Team Member', N'Medical Ser-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (47, N'Facilities', N'Admin Coordinator', N'Fac-Adm Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (48, N'Facilities', N'Audio-Video Coordinator', N'Fac-AV Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (49, N'Facilities', N'Audio-Video Team Member', N'Fac-AV Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (50, N'IT Services', N'Coordinator', N'IT Ser-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (51, N'IT Services', N'Team Member', N'IT Ser-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (52, N'Telecom/Security', N'Coordinator', N'TEL-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (53, N'Telecom/Security', N'Team Member', N'TEL-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (54, N'Maintenance/Landscaping', N'Coordinator', N'Mainte.-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (55, N'Maintenance/Landscaping', N'Team Member', N'Mainte.-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (56, N'Housekeeping', N'Corodinator', N'HOU-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (57, N'Housekeeping', N'Team Member', N'HOU-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (58, N'Decoration', N'Corodinator', N'Decoration-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (59, N'Decoration', N'Team Member', N'Decoration-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (60, N'Parking/Transportation', N'Coordinator', N'Parking-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (61, N'Parking/Transportation', N'Team Member', N'Parking-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (62, N'Services', N'Admin Coordinator', N'Service-Adm Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (63, N'Services', N'Kitchen Coordinator', N'Service-Kitchen Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (64, N'Services', N'Kitchen Team Member', N'Service-Kitchen Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (65, N'Shayona', N'Coordinator', N'Shayona-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (66, N'Shayona', N'Team Member', N'Shayona-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (67, N'Bookstall', N'Corodinator', N'Book-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (68, N'Bookstall', N'Team Member', N'Book-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (69, N'Subscription', N'Coordinator', N'Subscription-Co', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (70, N'Subscription', N'Team Member', N'Subscription-Tm', 0)
GO
INSERT [dbo].[Att_Seva] ([Id], [DepartmentName], [SevaName], [Code], [IsDeleted]) VALUES (71, N'Mahila', N'Admin Coordinator', N'Mahila-Adm Co', 0)
GO
SET IDENTITY_INSERT [dbo].[Att_Seva] OFF
GO
SET IDENTITY_INSERT [dbo].[Att_Zone] ON 

GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (1, N'Albermarle')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (2, N'East Charlotte')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (3, N'Fort Mill')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (4, N'Gastonia')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (5, N'Hickory')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (6, N'Lancaster')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (7, N'North Charlotte')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (8, N'Other')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (9, N'Rockhill')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (10, N'Salisbury')
GO
INSERT [dbo].[Att_Zone] ([Id], [Name]) VALUES (11, N'South Charlotte')
GO
SET IDENTITY_INSERT [dbo].[Att_Zone] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Attendee] FOREIGN KEY([AttendeeId])
REFERENCES [dbo].[Att_Attendee] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Attendee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] CHECK CONSTRAINT [FK_Attendance_Attendee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_EventSchedule] FOREIGN KEY([EventScheduleId])
REFERENCES [dbo].[Att_EventSchedule] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_EventSchedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendance]'))
ALTER TABLE [dbo].[Att_Attendance] CHECK CONSTRAINT [FK_Attendance_EventSchedule]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Att_Attendee_Att_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[Att_City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Att_Attendee_Att_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] CHECK CONSTRAINT [FK_Att_Attendee_Att_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee]  WITH CHECK ADD  CONSTRAINT [FK_Attendee_Zone] FOREIGN KEY([ZoneId])
REFERENCES [dbo].[Att_Zone] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendee_Zone]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_Attendee]'))
ALTER TABLE [dbo].[Att_Attendee] CHECK CONSTRAINT [FK_Attendee_Zone]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EventSchedule_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Att_Event] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventSchedule_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Att_EventSchedule]'))
ALTER TABLE [dbo].[Att_EventSchedule] CHECK CONSTRAINT [FK_EventSchedule_Event]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendancesByEventSchedule]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendancesByEventSchedule]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetAttendancesByEventSchedule] AS' 
END
GO

-- EXEC dbo.[Att_GetAttendancesByEventSchedule] 7, 'M', 'PARESH'
ALTER PROCEDURE [dbo].[Att_GetAttendancesByEventSchedule] 
	@EventScheduleId INT,
	@Gender VARCHAR(100) = 'M',
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
		IsNull(Att.MiddleName,'') AS MiddleName,
		Att.LastName,
		Att.Gender,
		Att.Address,
		Att.IsKaryakar,
		Att.CityId,
		Att.ZoneId,
		(Att.FirstName +' '+ IsNull(Att.MiddleName,'') +' '+ Att.LastName) AS AttendeeFullName, 
		
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName,
		SevaCodes = (SELECT dbo.Att_GetSevaCodesForAttendee(Att.Id)),
		
		@EventScheduleId as EventScheduleId,
		
		ISNULL(Attendance.Id,0) AS ID,
		ISNULL(Attendance.IsAttended,0) as IsAttended,
		ISNULL(Attendance.AttendanceTime,'') as AttendanceTime,
		RIGHT(CONVERT(CHAR(20),AttendanceTime, 0),7) AS AttendanceTimeOnly,
		CASE WHEN AttendanceTime <= @Slot1 THEN 'Slot-1'
			 WHEN AttendanceTime <= @Slot2 THEN 'Slot-2'
			 WHEN AttendanceTime <= @Slot3 THEN 'Slot-3'
			 WHEN AttendanceTime  > @Slot3 THEN 'Slot-4'
		END AS 'Slot',
		
		CONVERT(VARCHAR(8),@EventDate,101) AS EventShortDate
		
	FROM dbo.Att_Attendee AS Att 
		LEFT JOIN dbo.Att_Attendance AS Attendance ON Attendance.AttendeeId = Att.Id AND Attendance.EventScheduleId = @EventScheduleId 
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE 
		Att.IsDeleted = 0 AND
		(ISNULL(@Gender, '') = '' OR Att.Gender = @Gender)
		AND (ISNULL(@filter, '') = '' OR (Att.FirstName LIKE @filter+'%' OR Att.LastName LIKE @filter+'%'))
	ORDER BY Attendance.IsAttended, Att.FirstName, Att.LastName
END


GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeeById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetAttendeeById] AS' 
END
GO

-- EXEC dbo.Att_GetAttendeeById 1
ALTER PROCEDURE [dbo].[Att_GetAttendeeById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @SevaFullNames VARCHAR(8000) 
	SELECT @SevaFullNames = COALESCE(@SevaFullNames + ',', '') + 
		ISNULL(DepartmentName+' --> '+ SevaName, 'N/A')
	FROM dbo.Att_AttendeeSeva as ATS
		INNER JOIN dbo.Att_Seva as S on S.Id = ATS.Sevaid
	WHERE ATS.AttendeeId = @Id
	
    -- Insert statements for procedure here
	SELECT Att.*, 
		(Att.FirstName +' '+ IsNull(Att.MiddleName,'') +' '+ Att.LastName) AS FullName, 
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName,
		SevaFullNames = (SELECT dbo.Att_GetSevaFullNamesForAttendee(@Id))
	FROM dbo.Att_Attendee AS Att
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
		--LEFT JOIN dbo.Att_AttendeeSeva AS S ON S.AttendeeId = Att.AttendeeId
		
	WHERE Att.Id = @Id  
END


GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendees]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetAttendees] AS' 
END
GO

-- EXEC dbo.Att_GetAttendees null
ALTER PROCEDURE [dbo].[Att_GetAttendees] 
	@filter VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Att.*, 
		(Att.FirstName +' '+ IsNull(Att.MiddleName,'') +' '+ Att.LastName) AS FullName, 
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName,
		--SevaFullNames = (SELECT dbo.Att_GetSevaFullNamesForAttendee(Att.Id))
		SevaCodes = (SELECT dbo.Att_GetSevaCodesForAttendee(Att.Id))
	FROM dbo.Att_Attendee AS Att
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE --IsDeleted = 0 AND
		(ISNULL(@filter, '') = '' OR (Att.FirstName LIKE @filter+'%' OR Att.LastName LIKE @filter+'%'))
	ORDER BY Att.IsDeleted, Att.Gender DESC, Att.FirstName, Att.LastName
END
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeesForActive]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeesForActive]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetAttendeesForActive] AS' 
END
GO

-- EXEC dbo.Att_GetAttendeesForActive null
ALTER PROCEDURE [dbo].[Att_GetAttendeesForActive] 
	@filter VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Att.*, 
		(Att.FirstName +' '+ IsNull(Att.MiddleName,'') +' '+ Att.LastName) AS FullName, 
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName
	FROM dbo.Att_Attendee AS Att
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE IsDeleted = 0 AND
		(ISNULL(@filter, '') = '' OR (Att.FirstName LIKE @filter+'%' OR Att.LastName LIKE @filter+'%'))
	ORDER BY Att.IsDeleted, Att.Gender DESC, Att.FirstName, Att.LastName
END


GO
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetCities]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetCities] AS' 
END
GO

-- EXEC dbo.Att_GetZones
ALTER PROCEDURE [dbo].[Att_GetCities]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.Att_City 
END


GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByAttendee]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByAttendee]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetReportByAttendee] AS' 
END
GO


-- EXEC dbo.[Att_GetReportByAttendee] 345
ALTER PROCEDURE [dbo].[Att_GetReportByAttendee] 
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
		CASE WHEN AttendanceTime <= SLT.Slot1 THEN 'Slot-1'
			 WHEN AttendanceTime <= SLT.Slot2 THEN 'Slot-2'
			 WHEN AttendanceTime <= SLT.Slot3 THEN 'Slot-3'
			 WHEN AttendanceTime  > SLT.Slot3 THEN 'Slot-4'
		END AS 'Slot',
		
		CONVERT(VARCHAR(10),ES.EventDate,101) AS EventShortDate,
		
		Att.FirstName,
		IsNull(Att.MiddleName,'') AS MiddleName,
		Att.LastName,
		Att.Gender,
		Att.Address,
		Att.IsKaryakar,
		Att.CityId,
		Att.ZoneId,
		(Att.FirstName +' '+ IsNull(Att.MiddleName,'') +' '+ Att.LastName) AS AttendeeFullName, 
		
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName,
		SevaCodes = (SELECT dbo.Att_GetSevaCodesForAttendee(Att.Id))
		
	FROM dbo.Att_Attendance AS Attendance
		INNER JOIN dbo.Att_EventSchedule AS ES ON ES.Id = Attendance.EventScheduleId
		INNER JOIN dbo.Att_Attendee AS Att ON Att.Id = Attendance.AttendeeId
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
		Cross apply dbo.GetSlotsForDate(ES.EventDate) AS SLT
	WHERE Attendance.AttendeeId = @AttendeeId
	ORDER BY Attendance.CreatedOn DESC
END



GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByEventSchedule]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByEventSchedule]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetReportByEventSchedule] AS' 
END
GO

-- EXEC dbo.[Att_GetReportByEventSchedule] 8, 'Pare'
ALTER PROCEDURE [dbo].[Att_GetReportByEventSchedule] 
	@EventScheduleId INT,
	@Filter VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @EventDate DATETIME = (SELECT TOP 1 EventDate FROM dbo.Att_EventSchedule WHERE Id = @EventScheduleId)
	DECLARE @Slot1 DATETIME = @EventDate, 
			@Slot2 DATETIME = @EventDate, 
			@Slot3 DATETIME = @EventDate,
			@Slot4 DATETIME = @EventDate,
			@Slot5 DATETIME = @EventDate 
	
	SET @Slot1 = DATEADD(HOUR,	 16, @Slot1)										   -- 4:00PM
	SET @Slot2 = DATEADD(HOUR,	 16, @Slot2); SET @Slot2 = DATEADD(MINUTE, 15, @Slot2) -- 4:15PM
	SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 30, @Slot3) -- 4:30PM
	SET @Slot4 = DATEADD(HOUR,	 17, @Slot4);										   -- 5:00PM
	SET @Slot5 = DATEADD(HOUR,	 17, @Slot5); SET @Slot5 = DATEADD(MINUTE, 30, @Slot5) -- 5:30PM

	SELECT Attendance.*, 
		RIGHT(CONVERT(CHAR(20),AttendanceTime, 0),7) AS AttendanceTimeOnly,
		--@Slot1,@Slot2,@Slot3,
		CASE WHEN AttendanceTime <= @Slot1 THEN 'Slot-1'
			 WHEN AttendanceTime <= @Slot2 THEN 'Slot-2'
			 WHEN AttendanceTime <= @Slot3 THEN 'Slot-3'
			 WHEN AttendanceTime <= @Slot4 THEN 'Slot-4'
			 WHEN AttendanceTime <= @Slot5 THEN 'Slot-5'
			 WHEN AttendanceTime >  @Slot5 THEN 'Slot-6'
		END AS 'Slot',
		
		CONVERT(VARCHAR(8),@EventDate,101) AS EventShortDate,
		
		Att.FirstName,
		IsNull(Att.MiddleName,'') AS MiddleName,
		Att.LastName,
		Att.Gender,
		Att.Address,
		Att.IsKaryakar,
		Att.CityId,
		Att.ZoneId,
		(Att.FirstName +' '+ IsNull(Att.MiddleName,'') +' '+ Att.LastName) AS AttendeeFullName, 
		
		C.Id AS CityId, C.Name AS CityName, 
		Z.Id AS ZoneId, Z.Name AS ZoneName,
		SevaCodes = (SELECT dbo.Att_GetSevaCodesForAttendee(Att.Id))
	
	FROM dbo.Att_Attendance AS Attendance
		--INNER JOIN dbo.Att_EventSchedule AS ES ON ES.Id = Attendance.EventScheduleId
		INNER JOIN dbo.Att_Attendee AS Att ON Att.Id = Attendance.AttendeeId
		INNER JOIN dbo.Att_Zone AS Z ON Z.Id = Att.ZoneId
		INNER JOIN dbo.Att_City AS C ON C.Id = Att.CityId
	WHERE Attendance.EventScheduleId = @EventScheduleId AND (ISNULL(@filter, '') = '' OR (Att.FirstName LIKE @filter+'%' OR Att.LastName LIKE @filter+'%'))
END


GO
/****** Object:  StoredProcedure [dbo].[Att_GetSevas]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetSevas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetSevas] AS' 
END
GO


-- EXEC dbo.Att_GetSevas
ALTER PROCEDURE [dbo].[Att_GetSevas]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *,
			FullName= DepartmentName + ' --> ' + SevaName
	FROM dbo.Att_Seva 
	WHERE IsDeleted = 0 
	ORDER BY DepartmentName, SevaName
END



GO
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetZones]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_GetZones] AS' 
END
GO

-- EXEC dbo.Att_GetZones
ALTER PROCEDURE [dbo].[Att_GetZones]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.Att_Zone 
END


GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendance]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendance]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_SaveAttendance] AS' 
END
GO

-- EXEC dbo.Att_GetAttendeeById 11
ALTER PROCEDURE [dbo].[Att_SaveAttendance]
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


GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 4/9/2017 11:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendee]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Att_SaveAttendee] AS' 
END
GO

-- EXEC dbo.Att_GetAttendeeById 11
ALTER PROCEDURE [dbo].[Att_SaveAttendee]
    @Id INT = 0,
    @FirstName VARCHAR(100),
    @MiddleName VARCHAR(100) = NULL,
    @LastName VARCHAR(100) = NULL,
    @Gender VARCHAR(100) = NULL,
    @Address VARCHAR(500) = NULL,
    @ZoneId INT = NULL,
    @CityId INT = NULL,
    @ImsId INT = NULL,
    @IsKaryakar BIT = 0,
    @SevaFullNames VARCHAR(500) = NULL,
    @IsDeleted BIT = 0
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @tblSeva TABLE 
	(
		RowId INT IDENTITY(1,1),
		SevaId INT  NULL,
		SevaFullName VARCHAR(MAX)
	)
	
	INSERT INTO @tblSeva(SevaFullName) SELECT Value FROM dbo.SplitStringAsTable(@SevaFullNames, ',')
	
	UPDATE t
		SET t.SevaId = S.Id
	FROM @tblSeva AS t
		INNER JOIN (SELECT Id, DepartmentName + ' --> ' + SevaName AS SevaFullName FROM dbo.Att_Seva) AS S ON S.SevaFullName = t.SevaFullName
	
    -- Insert statements for procedure here
	IF @Id = 0
	BEGIN
		INSERT INTO dbo.Att_Attendee (FirstName, MiddleName, LastName, Gender, [Address], ZoneId, CityId, ImsId, IsKaryakar, IsDeleted)
		VALUES (@FirstName, @MiddleName, @LastName, @Gender, @Address, @ZoneId, @CityId, @ImsId, @IsKaryakar, @IsDeleted)
		
		SET @Id = @@IDENTITY
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
			ImsId = @ImsId,
			IsKaryakar = @IsKaryakar,
			IsDeleted = @IsDeleted
		WHERE Id = @Id
	END
	
	DELETE FROM dbo.Att_AttendeeSeva WHERE AttendeeId = @Id
	
	-- Insert/Remove Seva
	DECLARE @RowId INT = 1,
			@RowIdMax INT = (SELECT MAX(RowId) FROM @tblSeva),
			@SevaId INT,
			@SevaFullName VARCHAR(500)
	WHILE (@RowId <=@RowIdMax)
	BEGIN
		SELECT @SevaId = SevaId, @SevaFullName = SevaFullName FROM @tblSeva WHERE RowId = @RowId
		
		IF @SevaId > 0 AND @Id > 0
			INSERT INTO dbo.Att_AttendeeSeva (AttendeeId, SevaId) VALUES (@Id, @SevaId)
		
		SET @RowId = @RowId + 1
	END
END
GO
