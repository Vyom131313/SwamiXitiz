UPDATE dbo.Att_Attendee SET IsKaryakar = CASE WHEN Karyakar='Yes' THEN 1 ELSE 0 END
UPDATE att SET Att.ZoneId = Z.Id FROM dbo.Att_Attendee as Att INNER JOIN dbo.Att_Zone as Z On Z.Name = Att.ZoneName
UPDATE att SET Att.CityId = C.Id FROM dbo.Att_Attendee as Att INNER JOIN dbo.Att_City as C On C.Name = Att.CityName
 
SELECT ES.EventDate, 
		(Attendee.FirstName + ' '+ Attendee.LastName) as Name,
		CONVERT(CHAR(5), [AttendanceTime], 108) [time]
FROM [dbo].Att_Attendance AS Attendance
	INNER JOIN [dbo].[Att_EventSchedule] AS ES on ES.Id  = Attendance.EventScheduleId
	INNER JOIN [dbo].[Att_Attendee] AS Attendee on Attendee.Id  = Attendance.AttendeeId

SELECT 
	(SELECT FirstName + ' ' + LastName AS Expr1 FROM Att_Attendee AS Attendee WHERE Id = Attendance.AttendeeId) AS Name, 
	AttendanceTime, 
	CONVERT(CHAR(5), AttendanceTime, 108) AS [time], 
	CreatedOn
FROM Att_Attendance AS Attendance
WHERE EventScheduleId = 7
ORDER BY CreatedOn