DECLARE @CharMappingTable table (Id INT NOT NULL  IDENTITY(1,1), Char_Original NVARCHAR(100),  Char_New NVARCHAR(100));  
INSERT INTO @CharMappingTable (Char_Original, Char_New) VALUES 
(N'¿', N'ક' ),

/*
	(N'', N'કા'),
	(N'', N'કિ'),
	(N'', N'કી'),
	(N'', N'કુ'),
	(N'', N'કૂ'),
	(N'', N'કે'),
	(N'', N'કૈ'),
	(N'', N'કો'),
	(N'', N'કૌ'),
	(N'', N'કં'),
	(N'', N'કઃ'),
	(N'', N'કાં'),

	(N'', N'ખ'),
	(N'', N'ખા'),
	(N'', N'ખિ'),
	(N'', N'ખી'),
	(N'', N'ખુ'),
	(N'', N'ખૂ'),
	(N'', N'ખે'),
	(N'', N'ખૈ'),
	(N'', N'ખો'),
	(N'', N'ખૌ'),
	(N'', N'ખં'),
	(N'', N'ખઃ'),
	(N'', N'ખાં'),

	(N'', N'ગ'),
	(N'', N'ગા'),
	(N'', N'ગિ'),
	(N'', N'ગી'),
	(N'', N'ગુ'),
	(N'', N'ગૂ'),
	(N'', N'ગે'),
	(N'', N'ગૈ'),
	(N'', N'ગો'),
	(N'', N'ગૌ'),
	(N'', N'ગં'),
	(N'', N'ગઃ'),
	(N'', N'ગાં'),
*/
	
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
	(N'±', N'અ'),
	
	(N'Î', N'ા'),
	(N'Ï', N'િ'),
	(N'Ì', N'ી'),
	(N'<', N'ુ'),
	(N'Ò', N'ૂ'),
	(N'ı', N'ે'),
	(N'', N'ૈ'),
	(N'˘', N'ો'),
	(N'˙', N'ૌ'),
	(N'_', N'ં'),
	(N'—', N'ઃ'),
	
	-------------
	(N'∞', N'જી')
	
	


--SELECT * FROM @CharMappingTable 


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

DECLARE @que_Ori NVARCHAR(MAX) = N'›˘√Ì∞ ‹ËÎﬂÎ…ı ±ı¿ ÁÎ◊ı ¿ıÀ·Î ›‰Îﬁ˘ﬁı ÿÌZÎÎ ±Î’Ì ?'
DECLARE @que_New NVARCHAR(MAX) = @que_Ori

SET @index = 1
SET @len= (SELECT MAX(ID) FROM @CharMappingTable )
WHILE @index<= @len
BEGIN
	SELECT @char_New = Char_New, 
		   @char_Orig = Char_Original
		FROM @CharMappingTable WHERE Id = @index
	
	SET @que_New = REPLACE(@que_New, @char_Orig, @char_New) 
	 
	-- IF ISNULL(@char_New,'') != ''
	--  SET @char_Orig = @char_NEW
	SET @index = @index+ 1
	--PRINT @char_Orig + '    --->     ' + @char_New 
END

SELECT @que_Ori , @que_New 