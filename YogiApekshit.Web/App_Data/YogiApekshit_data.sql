USE [YogiApekshit]
GO
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueSwaminiVat_Book]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] DROP CONSTRAINT [FK_QueSwaminiVat_Book]
GO
/****** Object:  ForeignKey [FK_QueShlok_Book]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] DROP CONSTRAINT [FK_QueShlok_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueKirtan_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] DROP CONSTRAINT [FK_QueKirtan_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookChapter]') AND type in (N'U'))
DROP TABLE [dbo].[BookChapter]
GO
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectSentence]
GO
/****** Object:  Table [dbo].[QueKirtan]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] DROP CONSTRAINT [FK_QueKirtan_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueKirtan]') AND type in (N'U'))
DROP TABLE [dbo].[QueKirtan]
GO
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/05/2016 14:53:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueOneSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueOneSentence]
GO
/****** Object:  Table [dbo].[QueShlok]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] DROP CONSTRAINT [FK_QueShlok_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShlok]') AND type in (N'U'))
DROP TABLE [dbo].[QueShlok]
GO
/****** Object:  Table [dbo].[QueSwaminiVat]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] DROP CONSTRAINT [FK_QueSwaminiVat_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]') AND type in (N'U'))
DROP TABLE [dbo].[QueSwaminiVat]
GO
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]') AND type in (N'U'))
DROP TABLE [dbo].[QueWhoWhomWhen]
GO
/****** Object:  Table [dbo].[QueShortNote]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShortNote]') AND type in (N'U'))
DROP TABLE [dbo].[QueShortNote]
GO
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionCategory]') AND type in (N'U'))
DROP TABLE [dbo].[QuestionCategory]
GO
/****** Object:  Table [dbo].[QueReason]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueReason]') AND type in (N'U'))
DROP TABLE [dbo].[QueReason]
GO
/****** Object:  Table [dbo].[QueCorrectSequence]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectSequence]
GO
/****** Object:  Table [dbo].[QueFillInBlank]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]') AND type in (N'U'))
DROP TABLE [dbo].[QueFillInBlank]
GO
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExamLevel]') AND type in (N'U'))
DROP TABLE [dbo].[ExamLevel]
GO
/****** Object:  Table [dbo].[QueCorrectOption]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectOption]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/05/2016 14:53:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
DROP TABLE [dbo].[Book]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_Eng] [nvarchar](500) NULL,
	[Name_Guj] [nvarchar](500) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Book] ON
INSERT [dbo].[Book] ([Id], [Name_Eng], [Name_Guj]) VALUES (1, N'Ghanshyam Charitra', N'ઘનશ્યામ ચરિત્ર')
INSERT [dbo].[Book] ([Id], [Name_Eng], [Name_Guj]) VALUES (2, N'Yogiji Maharaj', N'યોગિજી મહારાજ')
INSERT [dbo].[Book] ([Id], [Name_Eng], [Name_Guj]) VALUES (3, N'Kishore Satsang Prarambha', N'કીશોર સત્સંગ પ્રારંભ')
SET IDENTITY_INSERT [dbo].[Book] OFF
/****** Object:  Table [dbo].[QueCorrectOption]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueCorrectOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Title_Eng] [nvarchar](max) NULL,
	[Correct_Eng] [nvarchar](max) NULL,
	[Title_Guj] [nvarchar](max) NULL,
	[Correct_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueCorrectOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueCorrectOption] ON
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (1, 1, 16, N'Monkeys get a sound thrashing:', N'* Ghanshyam assumed as many separate forms as there were monkeys.<br/>* Dharmadev came out with a big stick.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (2, 1, 4, N'Naming the Lord:', N'* Three months.<br/>* Sage Markandey.<br/>* Sign of Cancer.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (3, 1, 9, N'Dudhpakh instead of khichdi:', N'* I bring some milk.<br/>* Mother, don’t worry.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (4, 1, 30, N'Lakshmibai sees a miracle:', N'* Lakshmibai came into the kitchen.<br/>* I saw it all with my own eyes today.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (5, 3, 10, N'Brave Bhaguji:', N'* He was short, but very brave.<br/>* Mataro ran for his life.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (6, 3, 21, N'Behaviour in Bal Mandal', N'* Take our seat as directed by the sadhus.<br/>* We go to learn something good in Bal Mandal.<br/>* We should not be too proud.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (7, 3, 14, N'The Muslim woman from Bhal region:', N'* Sura Khachar.<br/>* Babul stick.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (8, 3, 11, N'Samat Patel:', N'* Faithful disciple from the Valak region.<br/>* Offered Rs. 4,500.', NULL, NULL, N'March, 2016')
SET IDENTITY_INSERT [dbo].[QueCorrectOption] OFF
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExamLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExamLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_Eng] [nvarchar](500) NULL,
	[Name_Guj] [nvarchar](500) NULL,
 CONSTRAINT [PK_ExamLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ExamLevel] ON
INSERT [dbo].[ExamLevel] ([Id], [Name_Eng], [Name_Guj]) VALUES (1, N'Prarambh', N'પ્રારંભ')
INSERT [dbo].[ExamLevel] ([Id], [Name_Eng], [Name_Guj]) VALUES (2, N'Pravesh', N'પ્રવેશ')
INSERT [dbo].[ExamLevel] ([Id], [Name_Eng], [Name_Guj]) VALUES (3, N'Parichay', N'પરિચય')
INSERT [dbo].[ExamLevel] ([Id], [Name_Eng], [Name_Guj]) VALUES (4, N'Pravin', N'પ્રવીણ')
INSERT [dbo].[ExamLevel] ([Id], [Name_Eng], [Name_Guj]) VALUES (5, N'Pragna-1', N'પ્રજ્ઞા-1')
INSERT [dbo].[ExamLevel] ([Id], [Name_Eng], [Name_Guj]) VALUES (6, N'Pragna-2', N'પ્રજ્ઞા-2')
INSERT [dbo].[ExamLevel] ([Id], [Name_Eng], [Name_Guj]) VALUES (7, N'Pragna-3', N'પ્રજ્ઞા-3')
SET IDENTITY_INSERT [dbo].[ExamLevel] OFF
/****** Object:  Table [dbo].[QueFillInBlank]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueFillInBlank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Ans_Eng] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Ans_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueFillInBlank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueFillInBlank] ON
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 3, 15, N'Ramanand Swami named _________ the son of _________', N'Mulji, Bholanath', NULL, NULL, NULL)
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 3, 13, N'Maharaj had appointed _________ to look after the cattle of _________', N'Jodho shepherd, Dada Khachar', NULL, NULL, NULL)
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 3, 7, N'Gangama, who lived in the village of _________ was a disciple of _________ Swami.', N'Jetalpur, Atmanand', NULL, NULL, NULL)
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (5, 3, 17, N'Shastriji Maharaj was born in _________ village on the day of _________', N'Mahelav, Vasant Panchmi (Maha sud, 5)', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QueFillInBlank] OFF
/****** Object:  Table [dbo].[QueCorrectSequence]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueCorrectSequence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Title_Eng] [nvarchar](max) NULL,
	[Correct_Eng] [nvarchar](max) NULL,
	[Title_Guj] [nvarchar](max) NULL,
	[Correct_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueCorrectSequence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueCorrectSequence] ON
INSERT [dbo].[QueCorrectSequence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (1, 2, NULL, N'Use of Leisure Time', N'1. At two o’clock in the afternoon there was a 30 minute recess for the class.<br/>2. The boys often wondered, “What is Jina doing?”<br/>3. The teachers, too, would ask his friends, “What does Jina do while others play?”<br/>4. Jinabhai did not like to waste his free time. We, too, should not waste time.<br/>5. We should offer devotion to God.', NULL, NULL, N'March, 2016')
SET IDENTITY_INSERT [dbo].[QueCorrectSequence] OFF
/****** Object:  Table [dbo].[QueReason]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueReason]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueReason](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Ans_Eng] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Ans_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueReason] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueReason] ON
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 1, 18, N'Very often Ghanshyam would sit on the pipal tree for a long time, looking west.', N'Ghanshyam told his friends, “There are the lands of Gujarat and Kathiawad in the west.Shri Krishna’s Dwarika lies there. Many aspirants who yearn to meet God live in that region.One day I want to go there from here. The devotees there are calling me.” So...', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (2, 1, 6, N'Bhaktimata gave Ghanshyam some gur to eat.', N'Ghanshyam told Bhaktimata, “I shall have my ears pierced if you give me some gur toeat.” Mother replied, “You will certainly get some gur provided you behave properly andsit still to have your ears pierced.Thus, she sent for some gur from inside the house andgave it to Ghanshyam.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 1, 43, N'The scholars of Kashi were spellbound.', N'There would be no end of discussion between the Advait scholars and the Dvait scholars.On scholars’ request and with Dharmadev’s permission, Ghanshyam entered thediscussion. He beautifully and very clearly explained the deep and difficult meanings ofverses from the Vedas. So everyone was spellbound by his knowledge and oratory.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 2, 9, N'How great Jaga Bhakta must be!” With this thought Jina Bhagat fell asleep.', N'Krishnaji Ada (disciple of Jaga Bhakta) frequently visited Junagadh. Jina Bhagat listened to their discourses. Krishnaji Ada narrated many incidents about the greatness of Jaga Bhakta. Once, at night a thought came to him. “How great Jaga Bhakta must be!” With this thought he fell asleep.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (5, 2, 2, N'The inhabitants of Dhari call river under the bridge ‘Patalio Jharo’.', N'The palce of confluence of three rivers on the outskirts of Dhari is known as Triveni Sangam and the resulting river is called the river Shetrunji. It narrows on reaching a bridge and shrinks to the size of a small rivulet under the bridge. So, the inhabitants of Dhari call Patalio Jharo.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (6, 2, 12, N'Swami Krishnacharandas visited Lodhika.', N'The king of Lodhika was a staunch devotee. One year, the King of Lodhika invited Swami Krishnacharandasji to celebrate Annakut festival there. So.....', NULL, NULL, N'March, 2016 ')
SET IDENTITY_INSERT [dbo].[QueReason] OFF
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_Eng] [nvarchar](500) NULL,
	[Name_Guj] [nvarchar](500) NULL,
 CONSTRAINT [PK_QuestionCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QueShortNote]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShortNote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueShortNote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Ans_Eng] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Ans_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueShortNote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueShortNote] ON
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 1, 15, N'Monkey in a trance', N'1. Due to harassment by evil people, Dharmadev shifted from Chapaiya to Barhatta Street in Ayodhya.<br/>2. One evening when Ghanshyam sat with Dharmadev for dinner, a monkey came up and with a sudden dash, carried away a whole lot of chapattis.<br/>3. As the monkey sat munching the chapattis, Ghanshyam gave the monkey a steady look and the monkey went into samadhi.<br/>4. After three days he woke up, hopped to Ghanshyam’s house and sat at his feet with folded hands.<br/>5. Ghanshyam blessed him and gave him something to eat then the monkey went back quietly and contentedly to the tree.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (2, 1, 2, N'Kotra was destroyed.', N'1. Kalidatt sent his most senior demoness, Kotra, with instructions to kill the child-God.<br/>2. Kotra came and stood before Dharmadev’s house waiting for the child-God to be left alone.<br/>3. But the all-knower God looked at her from the corner of his eyes and she started burning instantly.<br/>4. Shrieking and struggling to douse the flames and screaming, ‘I am burning, I am dying’, Kotra was destroyed by the Lord, within a short time.<br/>5. As everyone was speechless with fright, Dharmadev and Bhaktimata took the child-God inside to rest.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 2, 4, N'An ideal student', N'Jinabhai was very clever in his studies. He always stood first in every class and won<br/>many prizes. Whenever the teacher set any problem, Jinabhai would solve it immediately<br/>and then turn his slate upside down. When the other students asked in whisper, he would<br/>remain silent. If someone threatened him, he fearlessly replied, “You work it out! If my<br/>answer is wrong, then your answer will also be wrong.” Whenever other students<br/>succeeded in copying his work, Jinabhai did not like it. He would tell them off, “It is wrong<br/>to copy. By copying you are cheating God.” Thus, Jinabhai always insisted that everyone<br/>should learn by working hard and should not cheat.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 2, 8, N'Jina Bhagat in Junagadh', N'On 1 November 1908 (Kartik sud 7, V.S. 1965) Jinabhai set out for Junagadh with his<br/>elder brother Kamalshibhai and met Krishnacharandas Swami. On 8 November 1908 (the<br/>full moon day (Punam) of Kartik, V.S. 1965) Krishnacharandas Swami gave Jinabhai<br/>parshad diksha and named him Jina Bhagat. Jina Bhagat immediately took on various<br/>duties at the mandir. Jina Bhagat would go along with the other parshads to the foot of<br/>Mount Girnar to graze the cattle. While the cattle grazed, Jina Bhagat sang bhajans and<br/>memorized Swamini Vato. In the evening, on the way back he would cut and gather babul<br/>sticks, used for brushing teeth in the morning, for all three hundred sadhus in the mandir.<br/>Besides this, every morning he cleaned the cowsheds, collected cow-dung and made<br/>little flat cakes out of the dung and placed them in the sun to dry. In spite of fatigue from<br/>the day’s work Jina Bhagat always attended the satsang assemblies every evening. He<br/>would sing bhajans and chant Swaminarayan mantra. The he would listen to the<br/>discourses till late night. Every morning he would get up at four to serve his guru once<br/>again. Such was his his daily routine. He earned the blessings of Krishnacharandas<br/>Swami by serving him devoutly for six months.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (5, 3, 5, N'Daily Puja', N'1. Doing puja early in the morning makes us feel holy, happy and our mind pure and peaceful. Thinking of God early in the morning makes us feel happy.<br/>2. To perform puja one should sit either facing north or east, place the murtis on the another asan, apply tilak chandlo on the forehead and request the God and guru to grace their presence by reciting the ahvan mantra.<br/>3. One should do at least 5 malas whilst doing darshan of the murti, one tapni mala,<br/>11 times circumabulation still doing mala and then 5 shastang dandvats.<br/>4. One should pray God, “Please protect me from maya, enemies in the form of the indriyas and antahkaran and all forms of kusang. May I forever maintain a feeling of divinity, faultlessness and intense attachment to you and your devotees. Please grant me the strength to observe all your commands.”<br/>5. At last, thank God and gurus for being present in your puja and for accepting puja, ask for forgiveness for any mistakes made and recite the visarjan shlok and then read five verses from the Shikshapatri during puja and pack away the puja neatly.', NULL, NULL, N'March, 2016 ')
SET IDENTITY_INSERT [dbo].[QueShortNote] OFF
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueWhoWhomWhen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NOT NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Who_Eng] [nvarchar](100) NULL,
	[Whom_Eng] [nvarchar](100) NULL,
	[WhenSpeaking_Eng] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Who_Guj] [nvarchar](max) NULL,
	[Whom_Guj] [nvarchar](100) NULL,
	[WhenSpeaking_Guj] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueWhoWhomWhen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueWhoWhomWhen] ON
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (1, 1, 22, N'But if you are very hungry, shall I give you some grams or sukhdi?', N'Suvasinibhabhi', N'Ghanshyam', N'One morning, when Suvasinibhabhi was cooking food, Ghanshyam came there as he', N'March, 2016 ', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (2, 1, 8, N'We shall bring delicacies for you everyday.', N'Siddhis', N'Bhaktimata', N'Once Bhaktimata was very hungry and Lakshmibai leisurely prepared food. Then...', N'March, 2016 ', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (3, 1, 13, N'I am frightened and shiver all over when I think of Yampuri and the terrors of hell.', N'Fisherman', N'Ghanshyam', N'Yam Raja showed him a vision of hell and got him soundly thrashed by his', N'March, 2016 ', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (4, 2, 26, N'If there isn’t a youth centre in your village, then start one.', N'Yogiji Maharaj', N'Youths', N'Every year during vacation, the youths accompanied Yogiji Maharaj for a month or two. When they left at the end, He advised them.', N'March, 2016 ', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (5, 2, 33, N'How fast and how admirably he has developed the Sanstha!', N'Yogiji Maharaj', N'Sadhus and devotees', N'On the occasion when the forty-eighth birthday of Pramukh Swami Maharaj was being celebrated in Mumbai.', N'March, 2016 ', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (6, 2, 19, N'Shriji Maharaj and Swami will surely come to accept the thal.', N'Yogiji Maharaj', N'Jayantibhai and Prabhudas Sheth', N'When both of them requested Yogiji Maharaj to pray Maharaj and Swami to accept the thal, he said...', N'March, 2016 ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QueWhoWhomWhen] OFF
/****** Object:  Table [dbo].[QueSwaminiVat]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueSwaminiVat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Ans_Eng] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Ans_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueSwaminiVat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueSwaminiVat] ON
INSERT [dbo].[QueSwaminiVat] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 3, 16, N'“Karod kam bagadine....” (16/43-45)', N'Swaminarayan Hare Swamie vat kari je: “Karod kam bagadine pan ek moksha sudharvo ne kadapi karod kam sudharya ne ek moksha bagadyo to tema shu karyu?”<br/>“Spoil ten million tasks but improve your moksha. But if ten million tasks are improved and moksha is spoilt, what has been achieved?”<br/>There was a Patel who lived in a small village. Once he planned to go shopping to the nearby town. His wife gave him a long list of articles to be bought from the town. <br/>The Patel was very forgetul, so he noted down everything on a piece of paper. When some of the villagers came to know about the Patel’s going to town for shopping, they also came and asked, “Patel, will you bring this also?” He said, “O.K.” The Patel noted everything down.<br/>The Patel drove to the town in his bullock cart. He thought that first he would buy things for his neighbours, and later on for his own family. There was much hustle and bustle in the market. The Patel, one by one, bought what the villagers wanted and put them in the cart.<br/>The cart was filled up within a short time. So he returned home. The people of the village called at his house to collect the things they had asked for and Patel gave them the articles he had bought for them. Within a short time the cart became empty. His wife who was watching with growing anxiety asked the Patel, “Where are our purchases?” Patel scratched his head and said, “I absolutely forgot to buy our things.” Shall we call Patel a wise man or a foolish one? He went to the market and forgot about his own purchases. In the same way we do many other tasks. If we only think of others, but forget to think of our own moksha or neglect to worship God then we would be as foolish as this Patel.<br/>This is why Gunatitanand Swami stresses that we should think of our own liberation even if it means less attention to worldly work. We must think of God constantly if we are to attain moksha. If we offer wholehearted devotion to him and do bhajan regularly, then we can be sure that God will alwayes protect us.', NULL, NULL, N'March, 2016')
SET IDENTITY_INSERT [dbo].[QueSwaminiVat] OFF
/****** Object:  Table [dbo].[QueShlok]    Script Date: 06/05/2016 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShlok]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueShlok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Ans_Eng] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Ans_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueShlok] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/05/2016 14:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueOneSentence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueOneSentence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Ans_Eng] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Ans_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueOneSentence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueOneSentence] ON
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 1, 24, N'To whom did the murti of Thakorji come and what did he do in the village of Gunda?', N'The murti of Thakorji came to Ghanshyam, took off the garland from his own neck, put it around Ghanshyam’s neck and then he returned to his throne.', NULL, NULL, N'March, 2016 | March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (2, 1, 12, N'What did Lakshmibai realize when she came to see Ghanshyam?', N'When Lakshmibai came to see Ghanshyam, she realized that Ghanshyam had a high fever and smallpox.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 1, 44, N'In which form did Ghanshyam appear to Bhaktimata’s in her last time?', N'Ghanshyam appeared to Bhaktimata’s in the divine form of Narayan with four arms in her last time.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 1, 32, N'When was Ghanshyam given the sacred thread? (Samvat, Month, Tithi)', N'Ghanshyam was given sacred thread on Fagun sud 10, Samvat 1844.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (6, 2, 27, N'How many youths did Yogiji Maharaj initiate into the sadhu-fold?', N'Yogiji Maharaj initiated 51 youths into the sadhu-fold.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (7, 2, 30, N'In which hall in Ahmedabad was Yogiji Maharaj honoured?', N'Yogiji Maharaj was honoured in Tagore Hall in Ahmedabad.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (8, 2, 32, N'Which is the highest degree?', N'The highest degree is to become the servant of a servant of God.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (9, 2, 21, N'In which mandir did the venomous black cobra bite Yogiji Maharaj?', N'The venomous black cobra bit Yogii Mahraj in Akshar mandir Gondal.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (10, 3, 22, N'Which caste and village did Vajiba belong to?', N'Vajiba was of the Sathwara caste and belonged to Vijapur.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (11, 3, 6, N'What did the brave child devotee do everyday?', N'The child devotee prayed to God every day, offered puja, applied tilak chandlo to his forehead, and daily visited the mandir.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (12, 3, 20, N'From where did Nath Bhakta turn back on hearing the summons from Shriji Maharaj?', N'Nath Bhakta turned back from Vadodara, near the river Vishawamitri on hearing the summons from Shriji Maharaj.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (13, 3, 18, N'To whom do we bring disgrace by our bad behaviour?', N'We bring disgrace to our parents, to our guru and to our Sanstha by our bad behaviour.', NULL, NULL, N'March, 2016 ')
SET IDENTITY_INSERT [dbo].[QueOneSentence] OFF
/****** Object:  Table [dbo].[QueKirtan]    Script Date: 06/05/2016 14:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueKirtan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueKirtan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Que_Eng] [nvarchar](max) NULL,
	[Ans_Eng] [nvarchar](max) NULL,
	[Que_Guj] [nvarchar](max) NULL,
	[Ans_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueKirtan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueKirtan] ON
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 3, 1, N'Nathi darta..............jnanne gaishu.', N'Nathi darta nathi karta, amara janni parva;<br/>Amare dar nathi koino, ame janmya chhie marva<br/>Ame a yagna arambhyo balidano ame daishu;<br/>Amara Akshar Purushottam, Gunatit jnanne gaishu.... (Bravery song)', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (2, 3, 3, N'Sadbuddhi........................sadya vidari.', N'Sadbuddhi sadgun Prabhu apo,<br/>Abhay kar muj shir par sthapo,<br/>Vighna sakalne sadya vidari.....', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 3, 9, N'Narayan sukh data...........................gaya Kashi.', N'Narayan sukh data, dvij-kul tanu dhari,<br/>Pamar patit uddharya, aganit narnari....Jai<br/>Nitya nitya nautam lila karta Avinashi,<br/>Adsath tirath charne, koti gaya kashi....', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 3, 12, N'Chalu karo......................................raji thaine.', N'Chalu karo lavu hu jaljhari, elaychi laving sopari,<br/>panbidi banavi sari......<br/>Mukhvas mangamta laine, prasadino thal mune daine,<br/>Bhumanand kahe raji thaine......', NULL, NULL, N'March, 2016')
SET IDENTITY_INSERT [dbo].[QueKirtan] OFF
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/05/2016 14:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QueCorrectSentence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Title_Eng] [nvarchar](max) NULL,
	[Correct_Eng] [nvarchar](max) NULL,
	[Title_Guj] [nvarchar](max) NULL,
	[Correct_Guj] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
 CONSTRAINT [PK_QueCorrectSentence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QueCorrectSentence] ON
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (1, 1, 47, N'Oceans of Tears', N'Rampratapbhai sent men with horses in all directions in a last desperate search for Ghanshyam. Rampratapbhai stopped going to his farm to work. ', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (2, 1, 42, N'Ghanshyam’s Daily Routine', N'At three in the afternoon, he would again go for a bath in the river. Then, accompanied by his friends, he would without fail, go to the mandir at Hanuman Gadhi for darshan during the evening arti.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (3, 1, 31, N'The Importance of Ekadashi', N'The bawa immediately went into samadhi. He found himself transported to Yampuri. There he was severely beaten by the servants of Yam.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (4, 1, 39, N'Thieves in a fix', N'Dharmadev, carrying a water pot in hand, came to the farm to brush his teeth. The two thieves saw him, and quickly repented for their wrongdoings.', NULL, NULL, N'March, 2016 ')
SET IDENTITY_INSERT [dbo].[QueCorrectSentence] OFF
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/05/2016 14:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookChapter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookChapter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ChapterNumber] [int] NULL,
	[Name_Eng] [nvarchar](500) NULL,
	[Name_Guj] [nvarchar](500) NULL,
 CONSTRAINT [PK_BookChapter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[BookChapter] ON
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (1, 1, 1, N'Birth of Ghanshyam', N'ઘનશ્યામ નો જન્મ')
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (2, 1, 2, N'Childhood Exploits', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (3, 1, 3, N'Darshan to Ramdayal', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (4, 1, 4, N'Naming the Lord', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (5, 1, 5, N'A Test for the Son', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (6, 1, 6, N'Ghanshyam Has His Ears Pierced', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (7, 1, 7, N'A Boon for Lakshmiji', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (8, 1, 8, N'Siddhis at His Service', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (9, 1, 9, N'Dudhpakh Instead of Khichdi', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (10, 1, 10, N'The Barber Sees a Miracle', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (11, 1, 11, N'Kalidatt Meets His End', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (12, 1, 12, N'Curing SmallPox', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (13, 1, 13, N'Fish Brought Back to Life', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (14, 1, 14, N'Sparrows Sent into Samadhi', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (15, 1, 15, N'Monkey in a Trance', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (16, 1, 16, N'Monkeys Get a Sound Thrashing', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (17, 1, 17, N'Ramdatt Is Taught a Lesson', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (18, 1, 18, N'In Which Direction Are the Aspirants?', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (19, 1, 19, N'Seen in Many Mandirs at the Same Time', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (20, 1, 20, N'The Ghost Well', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (21, 1, 21, N'The Wrestlers Are Defeated', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (22, 1, 22, N'The Greedy Confectioner', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (23, 1, 23, N'Khampa Talavdi', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (24, 1, 24, N'Sixteen Signs of God', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (25, 1, 25, N'Ghanshyam Stops the Killing', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (26, 1, 26, N'The Mahout Is Saved', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (27, 1, 27, N'A New Set of Teeth', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (28, 1, 28, N'A Feast for His Friends', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (29, 1, 29, N'Thousands Are Fed and Humbled', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (30, 1, 30, N'Lakshmibai Sees a Miracle', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (31, 1, 31, N'The Importance of Ekadashi', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (32, 1, 32, N'Ghanshyam Is Given the Sacred Thread', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (33, 1, 33, N'Ghanshyam Is Seen as Ramchandra', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (34, 1, 34, N'Sailing on Stone Slabs', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (35, 1, 35, N'Miracle Shown to Aunts', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (36, 1, 36, N'Ghanshyam Eats All the Food', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (37, 1, 37, N'In Search of Gauri, the Cow', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (38, 1, 38, N'Walking on Water', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (39, 1, 39, N'Thieves in a Fix', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (40, 1, 40, N'Darshan in Two Forms', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (41, 1, 41, N'The Priest’s Sight Is Restored', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (42, 1, 42, N'Ghanshyam’s Daily Routine', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (43, 1, 43, N'Propagating the Vishishtadvait Teachings in Kashi', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (44, 1, 44, N'Bhaktimata and Dharmadev Pass Away', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (45, 1, 45, N'Ghanshyam Leaves Home', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (46, 1, 46, N'On the Banks of River Saryu', NULL)
INSERT [dbo].[BookChapter] ([Id], [BookId], [ChapterNumber], [Name_Eng], [Name_Guj]) VALUES (47, 1, 47, N'Oceans of Tears', NULL)
SET IDENTITY_INSERT [dbo].[BookChapter] OFF
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/05/2016 14:53:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen]  WITH CHECK ADD  CONSTRAINT [FK_QueWhoWhomWhen_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] CHECK CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueSwaminiVat_Book]    Script Date: 06/05/2016 14:53:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat]  WITH CHECK ADD  CONSTRAINT [FK_QueSwaminiVat_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] CHECK CONSTRAINT [FK_QueSwaminiVat_Book]
GO
/****** Object:  ForeignKey [FK_QueShlok_Book]    Script Date: 06/05/2016 14:53:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok]  WITH CHECK ADD  CONSTRAINT [FK_QueShlok_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] CHECK CONSTRAINT [FK_QueShlok_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueOneSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] CHECK CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueKirtan_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan]  WITH CHECK ADD  CONSTRAINT [FK_QueKirtan_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] CHECK CONSTRAINT [FK_QueKirtan_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] CHECK CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/05/2016 14:53:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_BookChapter_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_BookChapter_Book]
GO
