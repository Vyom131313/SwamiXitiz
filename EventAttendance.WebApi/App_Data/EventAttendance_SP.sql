USE [EventAttendance]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendancesByEventSchedule]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendancesByEventSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendancesByEventSchedule]
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendance]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_SaveAttendance]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByAttendee]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByAttendee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetReportByAttendee]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetReportByEventSchedule]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetReportByEventSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetReportByEventSchedule]
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_SaveAttendee]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeeById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendeeById]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendees]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendees]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetCities]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetCities]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 02/20/2017 18:48:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetZones]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetZones]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSlotsForDate]    Script Date: 02/20/2017 18:48:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSlotsForDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetSlotsForDate]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSlotsForDate]    Script Date: 02/20/2017 18:48:15 ******/
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
	SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 15, @Slot3)

    INSERT @tblSlots
        SELECT @Slot1, @Slot2, @Slot3;
    RETURN;
END;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 02/20/2017 18:48:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 02/20/2017 18:48:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetCities]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- EXEC dbo.Att_GetZones
Create PROCEDURE [dbo].[Att_GetCities]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.Att_City 
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 02/20/2017 18:48:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 02/20/2017 18:48:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 02/20/2017 18:48:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetReportByEventSchedule]    Script Date: 02/20/2017 18:48:13 ******/
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
	SET @Slot3 = DATEADD(HOUR,	 16, @Slot3); SET @Slot3 = DATEADD(MINUTE, 15, @Slot3)

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
/****** Object:  StoredProcedure [dbo].[Att_GetReportByAttendee]    Script Date: 02/20/2017 18:48:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendance]    Script Date: 02/20/2017 18:48:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetAttendancesByEventSchedule]    Script Date: 02/20/2017 18:48:13 ******/
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
