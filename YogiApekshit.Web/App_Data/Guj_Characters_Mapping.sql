
DECLARE @CharMappingTable table (Id INT NOT NULL  IDENTITY(1,1), Char_Original NVARCHAR(100),  Char_New NVARCHAR(100));  
INSERT INTO @CharMappingTable (Char_Original, Char_New) VALUES 
	(N'¿', N'ક'),
	(N'¬', N'ખ'),
	(N'√', N'ગ'), 
	(N'CÎ', N'ઘ'), 
	(N'«', N'ચ'), 
	(N'»', N'છ'), 
	(N'…', N'જ'), 
	(N'{', N'ઝ'), 
	(N'÷', N'ટ'), --TATTU
	(N'Ã', N'ઠ'), 
	(N'_Õ', N'ડ'), -- DAGALO
	(N'œ', N'ઢ'), 
	(N'HÎ', N'ણ'), -- FANG
	(N'À', N'ત'),  -- SWORD
	(N'◊', N'થ'), 
	(N'ÿ', N'દ'), -- BALL
	(N'Õ', N'ધ'), 

	(N'ﬁ', N'ન'), -- DRUM
	(N'’', N'પ'), 
	(N'Œ', N'ફ'), 
	(N'⁄', N'બ'), 
	(N'¤', N'ભ'), 
	(N'‹', N'મ'), 
	(N'›', N'ય'), 
	(N'ﬂ', N'ર'), 
	(N'·', N'લ'), 
	(N'‰', N'વ'), 
	(N'Â', N'શ'), 
	(N'Ê', N'ષ'), 
	(N'Á', N'સ'), 
	(N'Ë', N'હ'), 
	(N'·', N'ળ'), 
	(N'ZÎ', N'ક્ષ'), 
	(N'›', N'ય'),
	(N'iÎ', N'જ્ઞ'),
	
	(N'±ı', N'એ'),
	(N'±Î', N'આ'),	
	(N'', N'ઓ'),
	(N'', N'ઔ'),
	(N'', N'અં'),
	(N'', N'ઈ'),
	(N'', N'ઇ'),
	--(N'', N'ઉ'),
	(N'μ', N'ઉ'),

	(N'', N'ઊ'),
	(N'±', N'અ'),

	(N'hÎ', N'ત્ર'),
	(N'v', N'રુ'),
	(N'lÌ', N'શ્રી'),
	(N'kÎ', N'ત્ત'),
	(N'V', N'સ્'),
	(N'I', N'ત્'),
	(N'˝', N'ર્ર'),
	(N'', N'ુ'),
	(N'', N''),
	(N'', N''),
	(N'', N''),
---------------------------	
	(N'Î', N'ા'),
	--(N'Ï', N'િ'),
	(N'Ï', N'ઇ'),
	
	(N'Ì', N'ી'),
	(N'<', N'ુ'),
	(N'Ò', N'ૂ'),
	(N'ı', N'ે'),
	(N'', N'ૈ'),
	(N'˘', N'ો'),
	(N'˙', N'ૌ'),
	(N'_', N'ં'),
	(N'—', N'ઃ'),
	(N'˛', N'ર્'),
	
	-------------
	(N'∞', N'જી')
	

-- SELECT * FROM @CharMappingTable 
DECLARE @index INT
DECLARE @len INT
DECLARE @char_Orig NVARCHAR(100), @char_New NVARCHAR(100)

/*
SET @index = 1
SET @len= LEN(@que_Ori)
WHILE @index<= @len
BEGIN
	SET @char_New = NULL
	SET @char_Orig = SUBSTRING(@que_Ori, @index, 1)
	SET @char_New = (SELECT TOP 1 Char_New FROM @CharMappingTable WHERE Char_Original=@char_Orig)
	 
	 --IF ISNULL(@char_New,'') != ''
	 -- SET @char_Orig = @char_NEW
	 
	SET @index= @index+ 1

	PRINT @char_Orig + '    --->     ' + @char_New 
END
*/

DECLARE @que_Ori NVARCHAR(MAX) = N'⁄˘«ÎÁHÎ‰ÎÁÌ lÌ ±ZÎﬂ’vÊ˘kÎ‹ V‰ÎÏ‹ﬁÎﬂÎ›HÎ Á_V◊Î, ÁIÁ_√ ÏÂZÎHÎ ’ﬂÌZÎÎ  μ¿ı·’hÎ — ÁIÁ_√ ’˛Îﬂ_¤'
DECLARE @que_New NVARCHAR(MAX) = @que_Ori

SET @index = 1
SET @len= (SELECT MAX(ID) FROM @CharMappingTable )
WHILE @index<= @len
BEGIN
	SELECT @char_New = Char_New, 
		   @char_Orig = Char_Original
		FROM @CharMappingTable WHERE Id = @index
	
	SET @que_New = REPLACE(@que_New collate Latin1_General_CS_AS, @char_Orig collate Latin1_General_CS_AS, @char_New collate Latin1_General_CS_AS) 
	 
	SET @index = @index+ 1
END

SELECT @que_Ori , @que_New 
