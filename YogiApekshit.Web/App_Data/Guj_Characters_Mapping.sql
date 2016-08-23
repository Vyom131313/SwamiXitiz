DECLARE @CharMappingTable table (Id INT NOT NULL  IDENTITY(1,1), Char_Original NVARCHAR(100),  Char_New NVARCHAR(100));  
INSERT INTO @CharMappingTable (Char_Original, Char_New) 
SELECT N'¿', N'ક' UNION
SELECT N'¬', N'ખ' UNION
SELECT N'√', N'ગ' UNION
SELECT N'CÎ', N'ઘ' UNION
SELECT N'«', N'ચ' UNION
SELECT N'»', N'છ' UNION
SELECT N'…', N'જ' UNION
SELECT N'{', N'ઝ' UNION
SELECT N'÷', N'ટ' UNION--TATTU
SELECT N'Ã', N'ઠ' UNION
SELECT N'_Õ', N'ડ' UNION-- DAGALO
SELECT N'œ', N'ઢ' UNION
SELECT N'HÎ', N'ણ' UNION-- FANG
SELECT N'À', N'ત' UNION -- SWORD
SELECT N'◊', N'થ' UNION
SELECT N'ÿ', N'દ' UNION-- BALL
SELECT N'Õ', N'ધ' UNION

SELECT N'ﬁ', N'ન' UNION-- DRUM
SELECT N'’', N'પ' UNION
SELECT N'Œ', N'ફ' UNION
SELECT N'⁄', N'બ' UNION
SELECT N'¤', N'ભ' UNION
SELECT N'‹', N'મ' UNION
SELECT N'›', N'ય' UNION
SELECT N'ﬂ', N'ર' UNION
SELECT N'·', N'લ' UNION
SELECT N'‰', N'વ' UNION
SELECT N'Â', N'શ' UNION
SELECT N'Ê', N'ષ' UNION
SELECT N'Á', N'સ' UNION
SELECT N'Ë', N'હ' UNION
SELECT N'·', N'ળ' UNION
SELECT N'ZÎ', N'ક્ષ' UNION 
SELECT N'›', N'ય' UNION
SELECT N'iÎ', N'જ્ઞ' UNION
	
SELECT N'±ı', N'એ' UNION
SELECT N'±Î', N'આ' UNION	
SELECT N'', N'ઓ' UNION
SELECT N'', N'ઔ' UNION
SELECT N'', N'અં' UNION
SELECT N'', N'ઈ' UNION
SELECT N'', N'ઇ' UNION
	--(N'', N'ઉ' UNION
SELECT N'μ', N'ઉ' UNION

SELECT N'', N'ઊ' UNION
SELECT N'±', N'અ' UNION

SELECT N'hÎ', N'ત્ર' UNION
SELECT N'v', N'રુ' UNION
SELECT N'lÌ', N'શ્રી' UNION
SELECT N'kÎ', N'ત્ત' UNION
SELECT N'V', N'સ્' UNION
SELECT N'I', N'ત્' UNION
SELECT N'˝', N'ર્ર' UNION
SELECT N'', N'ુ' UNION
SELECT N'', N'' UNION
SELECT N'', N'' UNION
SELECT N'', N'' UNION
---------------------------	
SELECT N'Î', N'ા' UNION
	--SELECT (N'Ï', N'િ' UNION
SELECT N'Ï', N'ઇ' UNION
	
SELECT N'Ì', N'ી' UNION
SELECT N'<', N'ુ' UNION
SELECT N'Ò', N'ૂ' UNION
SELECT N'ı', N'ે' UNION
SELECT N'', N'ૈ' UNION
SELECT N'˘', N'ો' UNION
SELECT N'˙', N'ૌ' UNION
SELECT N'_', N'ં' UNION
SELECT N'—', N'ઃ' UNION
SELECT N'˛', N'ર્' UNION
	
	-------------
SELECT N'∞', N'જી'
	

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

DECLARE @que_Ori NVARCHAR(MAX) 
SET @que_Ori = N'⁄˘«ÎÁHÎ‰ÎÁÌ lÌ ±ZÎﬂ’vÊ˘kÎ‹ V‰ÎÏ‹ﬁÎﬂÎ›HÎ Á_V◊Î, ÁIÁ_√ ÏÂZÎHÎ ’ﬂÌZÎÎ  μ¿ı·’hÎ — ÁIÁ_√ ’˛Îﬂ_¤'
DECLARE @que_New NVARCHAR(MAX) 
SET @que_New = @que_Ori

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
