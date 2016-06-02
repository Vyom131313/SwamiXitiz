USE [YogiApekshit]
GO
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookChapter]') AND type in (N'U'))
DROP TABLE [dbo].[BookChapter]
GO
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectSentence]
GO
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueOneSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueOneSentence]
GO
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]') AND type in (N'U'))
DROP TABLE [dbo].[QueWhoWhomWhen]
GO
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionCategory]') AND type in (N'U'))
DROP TABLE [dbo].[QuestionCategory]
GO
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExamLevel]') AND type in (N'U'))
DROP TABLE [dbo].[ExamLevel]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/01/2016 23:11:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
DROP TABLE [dbo].[Book]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/01/2016 23:11:04 ******/
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
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/01/2016 23:11:04 ******/
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
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/01/2016 23:11:04 ******/
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
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/01/2016 23:11:04 ******/
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
SET IDENTITY_INSERT [dbo].[QueWhoWhomWhen] OFF
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/01/2016 23:11:04 ******/
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
SET IDENTITY_INSERT [dbo].[QueOneSentence] OFF
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/01/2016 23:11:04 ******/
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
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (1, 1, 47, N'Oceans of Tears', N'Rampratapbhai sent men with horses in all directions in a last desperate search for Ghanshyam. Rampratapbhai stopped going to his farm to work. ', NULL, NULL, NULL)
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (2, 1, 42, N'Ghanshyam’s Daily Routine', N'At three in the afternoon, he would again go for a bath in the river. Then, accompanied by his friends, he would without fail, go to the mandir at Hanuman Gadhi for darshan during the evening arti.', NULL, NULL, NULL)
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (3, 1, 31, N'The Importance of Ekadashi', N'The bawa immediately went into samadhi. He found himself transported to Yampuri. There he was severely beaten by the servants of Yam.', NULL, NULL, NULL)
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (4, 1, 39, N'Thieves in a fix', N'Dharmadev, carrying a water pot in hand, came to the farm to brush his teeth. The two thieves saw him, and quickly repented for their wrongdoings.', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QueCorrectSentence] OFF
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/01/2016 23:11:04 ******/
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
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen]  WITH CHECK ADD  CONSTRAINT [FK_QueWhoWhomWhen_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] CHECK CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueOneSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] CHECK CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] CHECK CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/01/2016 23:11:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_BookChapter_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_BookChapter_Book]
GO
