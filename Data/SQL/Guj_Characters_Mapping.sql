DECLARE @que_Ori NVARCHAR(MAX) = 
N'
2. ¿flÌ ¿ÎÃÎ CÎ™fiÌ ’˘‚Ì, ‹ı·Ì C≤÷ ÁÎ¿fl‹Î_ ⁄˘‚Ì,
¿Îoeu˘ flÁ ¿ıflÌfi˘ CÎ˘‚Ì ... …‹Îı ◊Î‚0
√Y›Î ÁÎÀÎ CÎı⁄fl e·‰ÕÌ, ÿÒ‘’Î¿ ‹Î·’Ò±Î ¿oeÌ,
’ÒflÌ ’˘«Ì ◊¥ »ı CÎÌ‹Î_ «oeÌ ... (12/22)

3. Â˘¤˘ ÁÎ‘√HÎı ÁÿÎ Áfl‚ fiı …@÷ı ±fiÎÁ@÷ »˘,
ÂÎVhÎÌ∞ √v ›˘√Ì∞ μ¤›fiÌ ¿Ú’Î÷b_ ’ÎhÎ »˘;
‘ÎflÌ ‘‹˝‘flÎ Á‹ƒ Áfl¬Î_ √¤Ìfl iÎÎfiı … »˘,
fiÎflÎ›HÎV‰w’ÿÎÁ √HÎÌfiı VfiıËı … ‰ÿ ±Ë˘ !
' 
    
  કરી કાઠા ઘઉંની પોળી, મેલી દ્યુત સાકરમાં બોળી,  કાઢયો રસ કેરીનો ઘોળી ... જમો થાળ0  <br/>ગળ્યા સાટા ઘેબર ફૂલવડી, દૂધપાક માલપૂઆ કઢી,  પૂરી પોચી થઈ છે ઘીમાં ચઢી .
  શોભો સાધુગુણે સદા સરળ ને જક્તે અનાસક્ત છો,  શાસ્ત્રીજી ગુરુ યોગીજી ઉભયની કૃપાતણું પાત્ર છો;  <br/>ધારી ધર્મધુરા સમૃદ્ર સરખાં ગભીર જ્ઞાને જ છો,  નારાયણસ્વરૂપદાસ ગુણીને સ્નેહે જ વંદુ અહો !  
  

-- ા િ ી ે ો ુ ૂ ં  ો દ્દ ધ્ ખ્ પ્ ર્ ગ ષ્ટા ષ ઈ ઊ શ્ર વ્ર ઓ નીલકંઠ કલ્યાણ પૂર્વ આશીર્વાદ નિર્ભયતા ગૃહ બ્રહ્મ વિદ્યા વિદ્યારંભ શિષ્ય મૂર્તિ જૂદા વિશ્વાસ સદગુરૂ ભટ્ટ વ્રત વચનામૃત ધર્મ   દ્રશ્ય  કૃત્યા આપ્યા   વર્તણૂક રહ્યા વિશિષ્ટાદ્વૈત ચિહ્નો ગૃહ અભ્યાસ લીંબડો
-- અષ્ટાંગ સૌરાષ્ટ્ર ઇંધણા પૃથ્વી વિશ્વાસ કૃત્યા પથ્થર  લાવણ્ય ઐશ્વર્ય ફૂલ દ્યો  કરિષ્યામિ હૃદય વિઘ્ન સદ્ય દ્યુત કૃપા સમૃદ્ર
-- <br/>*

DECLARE @que_New NVARCHAR(MAX) = @que_Ori
DECLARE @CharMappingTable table (Id INT NOT NULL  IDENTITY(1,1), Char_Original NVARCHAR(100),  Char_New NVARCHAR(100));  
INSERT INTO @CharMappingTable (Char_Original, Char_New) VALUES 
(N'≥E»', N'ઈચ્છ'),
(N'‘‹˝', N'ધર્મ'),
(N'T≤ZÎ', N'વૃક્ષ'),
(N'’˛Ï÷qÎ', N'પ્રતિષ્ઠા'),

(N'V‰Mfi', N'સ્વપ્ન'),
(N'ÿÂ˝fi', N'દર્શન'),
(N'Á‹ˆ›', N'સમૈય'),
(N'Õ>', N'ડૂ'),
(N'ºÏp', N'દૃષ્ટિ'),
(N'Á‹√˛', N'સમગ્ર'),
(N'‰ÊıÛ', N'વર્ષે'),
(N'™', N'ઉં'),
(N'¿p', N'કષ્ટ'),
(N'ÿ·˝¤', N'દુર્લભ'),
(N'ë', N'શ્ન'),
(N'¿ÚWH', N'કૃષ્ણ'),
(N'±Î’b_', N'આપણું'),
(N'ÏËo‹÷', N'હિમ્મત'),
(N'¤„@÷', N'ભક્તિ'),
(N'‘‹˝Ï’÷Î', N'ધર્મપિતા'),
(N'ËÏfl', N'હરિ'),
(N'ç›˝', N'શ્ચર્ય'),
(N'¿èÎ', N'કહ્યુ'),
(N'›*', N'ર્યુ'),
(N'»\', N'છુ'),
(N'‹S·', N'મલ્લ'),
(N'ગ્≤હ', N'ગૃહ'),
(N'≠‰÷Î˝‰‰Ì', N'પ્રવર્તવવી'),
(N'|Ì', N'ટ્ટી'),

-----------------------------------------
(N'ø', N'ક્ર'), 
(N'¿', N'ક'), 
(N'¬', N'ખ'), 
(N'√', N'ગ'), 
(N'CÎ', N'ઘ'), 
(N'«', N'ચ'), 
(N'»', N'છ'), 
(N'Ωı', N'જો'), 
(N'Ω', N'જા'),
(N'…', N'જ'), 
(N'F', N'જ'), 
(N'{', N'ઝ'), 
(N'À', N'ટ'), 
(N'Ã', N'ઠ'), 
(N'Ó', N'ડ'),
(N'Õ', N'ડ'), 
(N'œ', N'ઢ'), 
(N'HÎ', N'ણ'),
(N'÷', N'ત'),  
(N'◊˝', N'ર્થ'),
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

(N'A', N'ખ્'),

(N'પ˛', N'પ્ર'),
(N'≠', N'પ્ર'),
(N'¶', N'દ્વ'),
(N'ƒ', N'દ્વ'),

--(N'Îı','O'),
(N'±˘', N'ઓ'), 
(N'±Îı', N'ઓ'), 
(N'±ı', N'એ'),
(N'±Î', N'આ'), 

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
(N'èÎ˘', N'હ્યો'), 
(N'èÎ_', N'હ્યું'), 
(N'èÎÎ_', N'હ્યાં'),  
(N'©', N'દ્ધિ'), 

(N'@', N'ક્'),
(N'E', N'ચ્'), 
(N'B', N'ગ્'), 

(N'kÎ', N'ત્ત'), 
(N'I', N'ત્'), 
(N'V', N'સ્'), 
(N'˝', N'ર્'),
(N'L', N'ન્'), 
(N'T', N'વ્'),
(N'Q', N'મ્'),
(N'ÿ', N'દ્દ'), 
(N'K', N'ધ્'),
(N'Y', N'ળ્'),
(N'S', N'લ્'),

(N'∞', N'જી'),
---------------------------	
(N'', N'ુ'), 
(N'Î', N'ા'), /*(N'Ï', N'િ'),*/ 
(N'Ì', N'ી'), 
(N'<', N'ુ'), 
(N'Ò', N'ૂ'), 
(N'^', N'ૂ'), 
(N'ı', N'ે'),
(N'ˆ', N'ૈ'), 
(N'O', N'ો'), 
(N'˘', N'ો'), 
(N'˙', N'ૌ'), 
(N'_', N'ં'), 
(N'o', N'ં'), 
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
