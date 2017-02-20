USE [EventAttendance]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 02/20/2017 12:42:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendeeById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendeeById]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 02/20/2017 12:42:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetAttendees]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetAttendees]
GO
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 02/20/2017 12:42:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_SaveAttendee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_SaveAttendee]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 02/20/2017 12:42:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetCities]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetCities]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 02/20/2017 12:42:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Att_GetZones]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Att_GetZones]
GO
/****** Object:  StoredProcedure [dbo].[Att_GetZones]    Script Date: 02/20/2017 12:42:27 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetCities]    Script Date: 02/20/2017 12:42:27 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_SaveAttendee]    Script Date: 02/20/2017 12:42:27 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetAttendees]    Script Date: 02/20/2017 12:42:27 ******/
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
/****** Object:  StoredProcedure [dbo].[Att_GetAttendeeById]    Script Date: 02/20/2017 12:42:27 ******/
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
