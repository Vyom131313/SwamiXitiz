UPDATE dbo.Att_Attendee SET IsKaryakar = CASE WHEN Karyakar='Yes' THEN 1 ELSE 0 END

UPDATE att SET Att.ZoneId = Z.Id FROM dbo.Att_Attendee as Att INNER JOIN dbo.Att_Zone as Z On Z.Name = Att.ZoneName
 
UPDATE att SET Att.CityId = C.Id FROM dbo.Att_Attendee as Att INNER JOIN dbo.Att_City as C On C.Name = Att.CityName
 