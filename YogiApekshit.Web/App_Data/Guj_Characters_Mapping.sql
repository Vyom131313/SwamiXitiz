DECLARE @que_Ori NVARCHAR(MAX) = N'F›_÷Ì¤Î¥ ±ﬁı ’˛¤ÿÎÁ ÂıÃı ›˘√Ì∞ ‹ËÎﬂÎ…ﬁı ’˛Î◊˝ﬁÎ ¿ﬂÌ ¿ı “±Î…ı lÌ∞‹ËÎﬂÎ… ±ﬁı √HÎÎ÷Ì÷Îﬁ_ÿ V‰Î‹Ì ◊Î‚ …‹ı ÷ı‰Ì ’˛Î◊˝ﬁÎ ¿ﬂ˘.”'
DECLARE @que_New NVARCHAR(MAX) = @que_Ori

DECLARE @CharMappingTable table (Id INT NOT NULL  IDENTITY(1,1), Char_Original NVARCHAR(100),  Char_New NVARCHAR(100));  
INSERT INTO @CharMappingTable (Char_Original, Char_New) VALUES 
(N'¿', N'ક'), 
(N'¬', N'ખ'), 
(N'√', N'ગ'), 
(N'CÎ', N'ઘ'), 
(N'«', N'ચ'), 
(N'»', N'છ'), 
(N'Ωı', N'જો'), 
(N'…', N'જ'), 
(N'F', N'જ'), 
(N'{', N'ઝ'), 
(N'À', N'ટ'), 
(N'Ã', N'ઠ'), 
--(N'_Õ', N'ડ'),
(N'Õ', N'ડ'), 
(N'œ', N'ઢ'), 
(N'HÎ', N'ણ'),
(N'÷', N'ત'),  
(N'◊', N'થ'), 
(N'ÿ', N'દ'), 
(N'‘', N'ધ'), 
(N'ﬁ', N'ન'),  
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
(N'‚', N'ળ'), 
(N'ZÎ', N'ક્ષ'), 
(N'›', N'ય'),
(N'u', N'ય'),
(N'iÎ', N'જ્ઞ'),
--------------------------------------------------------------------------------------------------
(N'પ˛', N'પ્ર'),

(N'Îı','O'),
(N'±ı', N'એ'),
(N'±Î', N'આ'), 
(N'±˘', N'ઓ'), 
(N'', N'ઔ'), 
(N'', N'અં'), 
(N'¥', N'ઈ'),
/*(N'Ï', N'ઇ'),*/ /*(N'', N'ઉ'),*/ 
(N'Ï', N'િ'),
(N'μ', N'ઉ'),
(N'છ\_', N'છું'),
(N'∂', N'ઊ'),
(N'±', N'અ'),
--------------------------------------------------------------------------------------------------
(N'hÎ', N'ત્ર'), 
(N'v', N'રુ'), 
(N'w', N'રૂ'), 
(N'lÌ', N'શ્રી'),
(N'U', N'શ્'), 
(N'Z', N'ક્ષ્'), 
(N'èÎ_', N'હ્યું'), 
(N'èÎÎ_', N'હ્યાં'), 
(N'©', N'દ્ધિ'), 
(N'kÎ', N'ત્ત'), 

(N'@', N'ક્'),
(N'V', N'સ્'), 
--(N'˛', N'ર્'),
(N'I', N'ત્'), 
(N'L', N'ન્'), 
(N'T', N'વ્'),
(N'Q', N'મ્'), 
--(N'˛', N'ર્ર'), 
(N'∞', N'જી'),
---------------------------	
(N'', N'ુ'), 
(N'Î', N'ા'), /*(N'Ï', N'િ'),*/ 
(N'Ì', N'ી'), 
(N'<', N'ુ'), 
(N'Ò', N'ૂ'), 
(N'^', N'ૂ'), 
(N'ı', N'ે'),
(N'', N'ૈ'), 
(N'O', N'ો'), 
(N'˘', N'ો'), 
(N'˙', N'ૌ'), 
(N'_', N'ં'), 
(N'—', N'ઃ'), 
-------------
(N'', N'')

-- SELECT * FROM @CharMappingTable 
DECLARE @index INT
DECLARE @len INT
DECLARE @char_Orig NVARCHAR(100), @char_New NVARCHAR(100)

SET @index = 1
SET @len= (SELECT MAX(ID) FROM @CharMappingTable )
WHILE @index<= @len
BEGIN
	SELECT @char_New = Char_New, @char_Orig = Char_Original FROM @CharMappingTable WHERE Id = @index
	SET @que_New = REPLACE(@que_New collate Latin1_General_CS_AS, @char_Orig collate Latin1_General_CS_AS, @char_New collate Latin1_General_CS_AS) 
	SET @index = @index+ 1
END

SELECT @que_Ori , @que_New 
