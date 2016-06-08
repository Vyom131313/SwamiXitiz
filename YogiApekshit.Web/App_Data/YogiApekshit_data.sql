USE [YogiApekshit]
GO
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueSwaminiVat_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] DROP CONSTRAINT [FK_QueSwaminiVat_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
/****** Object:  ForeignKey [FK_QueShortNote_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote] DROP CONSTRAINT [FK_QueShortNote_Book]
GO
/****** Object:  ForeignKey [FK_QueShlok_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] DROP CONSTRAINT [FK_QueShlok_Book]
GO
/****** Object:  ForeignKey [FK_QueReason_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason] DROP CONSTRAINT [FK_QueReason_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueKirtan_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] DROP CONSTRAINT [FK_QueKirtan_Book]
GO
/****** Object:  ForeignKey [FK_QueFillInBlank_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank] DROP CONSTRAINT [FK_QueFillInBlank_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSequence_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence] DROP CONSTRAINT [FK_QueCorrectSequence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectOption_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption] DROP CONSTRAINT [FK_QueCorrectOption_Book]
GO
/****** Object:  Table [dbo].[QueCorrectOption]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption] DROP CONSTRAINT [FK_QueCorrectOption_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectOption]
GO
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectSentence]
GO
/****** Object:  Table [dbo].[QueCorrectSequence]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence] DROP CONSTRAINT [FK_QueCorrectSequence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectSequence]
GO
/****** Object:  Table [dbo].[QueFillInBlank]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank] DROP CONSTRAINT [FK_QueFillInBlank_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]') AND type in (N'U'))
DROP TABLE [dbo].[QueFillInBlank]
GO
/****** Object:  Table [dbo].[QueKirtan]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] DROP CONSTRAINT [FK_QueKirtan_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueKirtan]') AND type in (N'U'))
DROP TABLE [dbo].[QueKirtan]
GO
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueOneSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueOneSentence]
GO
/****** Object:  Table [dbo].[QueReason]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason] DROP CONSTRAINT [FK_QueReason_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueReason]') AND type in (N'U'))
DROP TABLE [dbo].[QueReason]
GO
/****** Object:  Table [dbo].[QueShlok]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] DROP CONSTRAINT [FK_QueShlok_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShlok]') AND type in (N'U'))
DROP TABLE [dbo].[QueShlok]
GO
/****** Object:  Table [dbo].[QueShortNote]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote] DROP CONSTRAINT [FK_QueShortNote_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShortNote]') AND type in (N'U'))
DROP TABLE [dbo].[QueShortNote]
GO
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookChapter]') AND type in (N'U'))
DROP TABLE [dbo].[BookChapter]
GO
/****** Object:  Table [dbo].[QueSwaminiVat]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] DROP CONSTRAINT [FK_QueSwaminiVat_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]') AND type in (N'U'))
DROP TABLE [dbo].[QueSwaminiVat]
GO
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]') AND type in (N'U'))
DROP TABLE [dbo].[QueWhoWhomWhen]
GO
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExamLevel]') AND type in (N'U'))
DROP TABLE [dbo].[ExamLevel]
GO
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionCategory]') AND type in (N'U'))
DROP TABLE [dbo].[QuestionCategory]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/07/2016 21:41:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
DROP TABLE [dbo].[Book]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/07/2016 21:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_Eng] [nvarchar](500) NOT NULL,
	[Name_Guj] [nvarchar](500) NOT NULL,
	[Code_Eng] [nvarchar](50) NOT NULL,
	[Code_Guj] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Book] ON
INSERT [dbo].[Book] ([Id], [Name_Eng], [Name_Guj], [Code_Eng], [Code_Guj]) VALUES (1, N'Ghanshyam Charitra', N'ઘનશ્યામ ચરિત્ર', N'GhC', N'ઘ. ચ.')
INSERT [dbo].[Book] ([Id], [Name_Eng], [Name_Guj], [Code_Eng], [Code_Guj]) VALUES (2, N'Yogiji Maharaj', N'યોગિજી મહારાજ', N'YoM', N'યો. મ.')
INSERT [dbo].[Book] ([Id], [Name_Eng], [Name_Guj], [Code_Eng], [Code_Guj]) VALUES (3, N'Kishore Satsang Prarambha', N'કીશોર સત્સંગ પ્રારંભ', N'KSP', N'કી. સ. પ્રા')
SET IDENTITY_INSERT [dbo].[Book] OFF
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/07/2016 21:41:57 ******/
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
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/07/2016 21:41:57 ******/
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
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (7, 1, 10, N'What are you waiting for? Come on, finish the shaving.', N'Bhaktimata', N'Amai Barber', N'When Amai Barber was shaving Ghanshyam’s head and the shaving was halffinished, Ghanshyam became invisible to him. While everyone else could seeGhanshyam sitting in Bhaktimata’s lap, Amai alone could not see him. So he stoppedshaving.Then....', N'March, 2015', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (9, 1, 24, N'It is all due to Ghanshyam’s divine power.', N'Bhaktimata', N'Vasantabai', N'Ghanshyam did not want to walk, he has made Ichchharam very heavy weight. SoVasantabai put Ichchharam down and asked Bhaktimata, “Why has Ichchharamsuddenly become so heavy?” Then.....', N'March, 2015', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (10, 1, 39, N'So we cannot get down from the tree.', N'The thieves', N'Dharmadev', N'When the thieves came to farm to steal the jack fruits, both their hands got stuckto the fruit. When Dharmadev and Ghanshyam reached the farm, the thieves beggedfor forgiveness and say to Dharmadev.', N'March, 2015', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (11, 2, 2, N'I will teach you how to meditate.', N'Jinabhai', N'To his friends', N'When Jinabhai comes out of rapt meditation, his friends asked him “What were you doing?” then......', N'March, 2015', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (12, 2, 11, N'You will be a great sadhu one day.', N'Rajput devotee', N'Jina bhagat', N'A Rajput devotee, who was an expert in astrology and palmistry, was struck with wonder when he saw the soles of Jina Bhagat’s feet. He had never seen such extraordinary lines on the feet of any sadhu before. So he says this to Jina Bhagat.', N'March, 2015', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (13, 2, 20, N'Today, I have failed to give you water on time.', N'Yogiji Maharaj', N'Harikrishna Maharaj', N'Once Yogiji Maharaj with Nirgundas Swami was going to Gadhada from Sarangpur. He did not find water anywhere on the route on that hot summer’s day. So he asked for forgiveness to Thakorji and says.......', N'March, 2015', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (14, 1, 35, N'We are not asking you to get up. We are waking up the Lord.', N'Both aunts', N'Ghanshyam', N'Both aunts were singing bhajans while grinding to wake up Lord. so Ghanshyam replied why you are asking me to get up when I am fully awake.', N'March, 2014', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (15, 1, 21, N'From now on we will never boast about our strength.', N'Three wrestlers', N'Ghanshyam', N'When the King asked the three wrestlers to apologize to Ghanshyam for bragging about their strength.', N'March, 2014', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (16, 1, 19, N'Go and call Ghanshyam.', N'Bhaktimata', N'Rampratapbhai', N'One day when Ghanshyam did not come back home for lunch.', N'March, 2014', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (17, 2, 27, N'“The Akshar Purushottam philosophy will spread throughoout the world.”', N'Yogiji Maharaj', N'Youth', N'It was written in letter by Yogiji Maharaj to a youth who wanted to become a sadhu. Yogiji Maharaj gave message that what he wanted to do through him.', N'March, 2014', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (18, 2, 9, N'Today you have fulfilled my wish by giving me your darshan.', N'Jina Bhagat', N'Jaga Bhakta', N'Once Jina Bhagat fell asleep with the thought of “How great Jaga Bhakta must be!” During his sleep, Jaga Bhakta appears in a dream. so he prostrated before Jaga Bhakta and said above sentence.', N'March, 2014', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (19, 2, 19, N'Swami, please come to Bhavnagar so that we may all benefit by your association.', N'Kuberbhai', N'Shastriji Maharaj', N'On the celebration of Jaljhilani Ekadashi at Sarangpur, Kuberbhai of Bhavnagar requested Shastriji Maharaj said the above sentence.', N'March, 2014', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (20, 1, 13, N'My bones are all aching... I have made a mistake, please forgive me.', N'The Fisherman', N'Ghanshyam', N'Ghanshyam showed him a vision of hell and the punishments that await the wicked and the sinful in yampuri hell. The Fisherman’s bones ached. So he said the above words.', N'March, 2013', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (21, 1, 31, N'You have misguided other people.', N'Yam’s servants', N'The Bawa (Mohandas)', N'The bawa was annoyed at Ghanshyam and said, “You, little one, you have the audacity to teach me my duty? Are not ashamed of yourself?” When Ghanshyam simply fixed eyes on Bawa, he went into samadhi immediately. He was beaten in yampuri by the servants of Yam. They scolded him saying the above words.', N'March, 2013', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (22, 1, 2, N'We shall never again go to Chhapaiya to bring the child-God.', N'The Evil accomplices (The demonesses)', N'Kalidatt', N'After having been totally thrashed down by Hanumanji, the evil accomplices returned to Kalidatt and gave a report of what happened that time said the above words.', N'March, 2013', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (23, 2, 30, N'To honour Yogiji Maharaj is to honour the liberator of the whole of mankind.', N'Shri Hitendrabhai', N'(to city’s Tagore hall) in the assembly at Ahmedabad', N'When Yogiji Maharaj was taken in a grand procession through the main roads of the city and was honoured at the city’s Tagore Hall said the above words.', N'March, 2013', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (24, 2, 26, N'Observe niyams sincerely. Attend the weekly youth assemblies regularly.', N'Yogiji Maharaj', N'To the Youths', N'During vacation every year, the youths accompained Yogiji Maharaj for a month or two when they left at the end, he adviced them. said the above words.', N'March, 2013', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (25, 2, 19, N'Take Yogiji Maharaj in my place. I am included in Yogiji Maharaj.', N'Shastriji Maharaj', N'To Kuberbhai', N'Kuberbhai a leading devotee of Bhavnagar requested Shastri Maharaj to come to Bhavnagar to have the benefit of his association by celebrating the festival of Jaljhilani Ekadashi. That time Shastriji Maharaj was not well, so he said the above words.', N'March, 2013', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (26, 1, 3, N'How old is your son?', N'Ramdayal', N'Dharmadev', N'The Lord saw his sucker lying some distance away on the floor. He climbed down from the cradle, crawled on his knees, picked it up and returned to the cradle. Ramdayal saw all this and he asked to Dharmadev.', N'March, 2012', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (27, 1, 12, N'Ghanshyam has smallpox, so put him to bed in one of the more secluded rooms.', N'Chandamasi', N'Bhaktimata', N'When Ghanshyam was down with fever, Chandamasi who came to enquire about his health told this.', N'March, 2012', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (28, 1, 31, N'Why then should we inflict suffering on this precious body by fasting on Ekadashi?', N'Mohandas (Mahantji of the mandir, the bawa)', N'Ghanshyam', N'While narrating the story of Ramcharit Manas Ghanshyam asked Mohandas “Why is it that so many people do not observe Ekadashi?', N'March, 2012', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (29, 2, 7, N'I would be happy if you would make me a sadhu.', N'Jinabhai', N'Sadguru Krishnachanrandas', N'Krishnacharandas Swami was pleased to see the devotion of Jinabhai and appreciated his zeal with which he served and asked him, ‘Jina, would you like to become a sadhu?’ That time he said the above sentence.', N'March, 2012', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (30, 2, 14, N'‘‘When the guru scolds it is for our good.’’', N'Yogiji Maharaj', N'Hargovindbhai Mehta', N'When Vijnandas Swami became very angry he ordered Yogiji Maharaj to leave his unfinished meal as punishment. Hargovindji witnessed this scene and asked why do you tolerate to so much? Don’t you feel like leaving here and going home? That time he said the above sentence.', N'March, 2012', NULL, NULL, NULL, NULL)
INSERT [dbo].[QueWhoWhomWhen] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Who_Eng], [Whom_Eng], [WhenSpeaking_Eng], [Exams], [Que_Guj], [Who_Guj], [Whom_Guj], [WhenSpeaking_Guj]) VALUES (31, 2, 24, N'Shastriji Maharaj is forever present in Satsang.', N'Yogiji Maharaj', N'Devotees/Everybody', N'Shastriji Maharaj has gone. Now what will happen to us? No one knew what to do. That time Yogiji Maharaj reassured everyone and said the above sentence.', N'March, 2012', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QueWhoWhomWhen] OFF
/****** Object:  Table [dbo].[QueSwaminiVat]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueSwaminiVat] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 3, 16, N'“Karod kam bagadine....” (16/43-45)', N'Swaminarayan Hare Swamie vat kari je: “Karod kam bagadine pan ek moksha sudharvo ne kadapi karod kam sudharya ne ek moksha bagadyo to tema shu karyu?”<br/>“Spoil ten million tasks but improve your moksha. But if ten million tasks are improved and moksha is spoilt, what has been achieved?”<br/>There was a Patel who lived in a small village. Once he planned to go shopping to the nearby town. His wife gave him a long list of articles to be bought from the town. <br/>The Patel was very forgetul, so he noted down everything on a piece of paper. When some of the villagers came to know about the Patel’s going to town for shopping, they also came and asked, “Patel, will you bring this also?” He said, “O.K.” The Patel noted everything down.<br/>The Patel drove to the town in his bullock cart. He thought that first he would buy things for his neighbours, and later on for his own family. There was much hustle and bustle in the market. The Patel, one by one, bought what the villagers wanted and put them in the cart.<br/>The cart was filled up within a short time. So he returned home. The people of the village called at his house to collect the things they had asked for and Patel gave them the articles he had bought for them. Within a short time the cart became empty. His wife who was watching with growing anxiety asked the Patel, “Where are our purchases?” Patel scratched his head and said, “I absolutely forgot to buy our things.” Shall we call Patel a wise man or a foolish one? He went to the market and forgot about his own purchases. In the same way we do many other tasks. If we only think of others, but forget to think of our own moksha or neglect to worship God then we would be as foolish as this Patel.<br/>This is why Gunatitanand Swami stresses that we should think of our own liberation even if it means less attention to worldly work. We must think of God constantly if we are to attain moksha. If we offer wholehearted devotion to him and do bhajan regularly, then we can be sure that God will alwayes protect us.', NULL, NULL, N'March, 2016 | March, 2013')
INSERT [dbo].[QueSwaminiVat] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (2, 3, 16, N'Bhagwan to potana bhaktani...', N'Swaminarayan Hare Swamie vat kari je: Bhagwan to potana bhaktani raksha karvamaj betha chhe. Keni pethe? To jem papan ankhni raksha kare chhe ne<br/>hath kanthni raksha kare chhe ne mavtar chhokrani raksha kare chhe ne raja prajani rakshama chhe, temaj Bhagwan Aapni rakshama chhe. (1.22)<br/>“God always protects his devotees. Just as the eyelids protect the eyes, the hands protect the neck, a mother protects her child and a king protects his<br/>subjects, God protects us.”<br/>Prahlad, Narsinh Mehta, Mirabai, for example, were so deeply devoted to God that he protected them from all evil forces. Similarly, Shriji Maharaj protects his devotees as the following story shows.<br/>A devotee called Naja Bhakta was living in the small town of Bhadli. This small town was much oppressed by the shepherds. So Naja Bhakta went to live in another town called Bhoyra. He told Vasur Khachar, the king, about the glory of Shriji Maharaj. The king heard him and then said, “If your God is really God, then he should present himself here tomorrow. Otherwise I will break your kneecaps.”<br/>At that time Shriji Maharaj was in Visnagar. “How can Maharaj reach Bhoyra in one night?” worried Naja Bhakta.<br/>The king was a very cruel man and would not hesitate to carry out his threat.<br/>Desperately Naja Bhakta began to think of Shriji Maharaj and made a silent appeal.<br/>Meanwhile, Shriji Maharaj started out from Visnagar. On the way, near Vadhvan, there was a river in flood. Walking over the waters, Maharaj reached Bhoyra early in the morning and sent a messenger to the king, “Naja Bhakta’s God has arrived.” Early in the morning, when Naja Bhakta opened the door of his house, he saw Shriji Maharaj standing at his door. He was stunned. He knelt at the feet of Maharaj in gratitude. Then after some time the two went together to the court of the cruel king. On the way, Maharaj heard about the people’s woes and their cries of anguish.<br/>Naja Bhakta told Maharaj, “The king is very cruel man. He punishes people without mercy and breaks their kneecaps.”<br/>When the king came to meet Shriji Maharaj, Shriji Maharaj at once sent him into samadhi and showed him the horrors of hell. Here Yamraj beat him mercilessly.<br/>After some time, by the grace of Maharaj, he came out of the samadhi. Immediately he fell at the feet of Maharaj, confessed his evil deeds and asked for forgiveness. He realized that Swaminarayan was God incarnate.<br/>Shriji Maharaj instructed him to be good and never subject people to terrible punishments.<br/>Then, Shriji Maharaj initiated him into the Fellowship and made him a satsangi. This was how Maharaj protected his devotee Naja Bhakta, when he was in danger.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueSwaminiVat] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 3, 16, N'Ketlakne man ....', N'Swaminarayan Hare Swamie vat kari je: “Ketlakne man ramade chhe ne ketlak manne ramade chhe. A vat nitya vicharva jevi chhe.”<br/>“Some are controlled by the mind and some control the mind. This talk is worth contemplating daily.”<br/><br/>Our mind is full of wordly desires, and is therefore our greatest enemy. It prevents us from thinking of God and offering worship or service. But there are people who can control their minds. There was a boy of the Koli caste in Gadhada. His father was growing sweet pumpkins in his orchard. The boy decided to offer the first pumpkin to Shriji Maharaj.<br/>When the pumpkins ripened, he selected one of them for Maharaj. On his way to meet Shriji Maharaj he was tempted by the sweet smell of his ripe pumpkin. The boy thought that he might as well as eat it. But almost immediately he scolded his mind, controlled his desire and went on his way. Again after some time, the thought came into his mind that people offer very nice and costly gifts to Shriji Maharaj. Who would appreciate an insignificant thing like a pumpkin ? So why not eat it ! But again he resisted the temptation, “No, no! I have decided to give it to Maharaj, so I must give it to Him.” Thus, keeping his mind under control, he soon reached the court of Dada khachar. Maharaj Himself called the boy, and asked for his pumpkin. He ate some of it Himself and the rest He distributed as prasad. Maharaj was very happy with this young boy because he had succeeded in controlling his mind. Maharaj asked the kothari (storekeeper) to give the boy a reward of 5 kg of sugar crystals to take home. In that assembly there was a Bania. He thought that if this boy could get 5 kg of sugar crystals for a single pumpkin, how much sugar crystals would he get if he gave a cartful of pumpkins to Maharaj. The very next day, the Bania came to Maharaj with a cartful of sweet pumpkins. Maharaj told him, “Throw all the pumpkins into the river and let the fish eat them.” The Bania was disappointed. He asked, “Why Maharaj? Yesterday you gave 5 kg of sugar for just one pumpkin, while I have brought You a whole cart-load.” Maharaj replied, “Yes, I did give the boy 5 kg of sugar crystals.<br/>But it was not for the pumpkin; it was for the self-control that the boy had shown over his mind. You came here with greed in your heart. So you will get nothing.” Thus, if we conquer our minds, and resist evil temptations, then Maharaj will be extremely pleased.', NULL, NULL, N'March, 2014 | March, 2012')
SET IDENTITY_INSERT [dbo].[QueSwaminiVat] OFF
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/07/2016 21:41:57 ******/
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
/****** Object:  Table [dbo].[QueShortNote]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 2, 4, N'An ideal student', N'Jinabhai was very clever in his studies. He always stood first in every class and won many prizes. Whenever the teacher set any problem, Jinabhai would solve it immediately and then turn his slate upside down. When the other students asked in whisper, he would remain silent. If someone threatened him, he fearlessly replied, “You work it out! If my answer is wrong, then your answer will also be wrong.” Whenever other students succeeded in copying his work, Jinabhai did not like it. He would tell them off, “It is wrong to copy. By copying you are cheating God.” Thus, Jinabhai always insisted that everyone should learn by working hard and should not cheat.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 2, 8, N'Jina Bhagat in Junagadh', N'On 1 November 1908 (Kartik sud 7, V.S. 1965) Jinabhai set out for Junagadh with his elder brother Kamalshibhai and met Krishnacharandas Swami. On 8 November 1908 (the full moon day (Punam) of Kartik, V.S. 1965) Krishnacharandas Swami gave Jinabhai parshad diksha and named him Jina Bhagat. Jina Bhagat immediately took on various duties at the mandir. Jina Bhagat would go along with the other parshads to the foot of Mount Girnar to graze the cattle. While the cattle grazed, Jina Bhagat sang bhajans and memorized Swamini Vato. In the evening, on the way back he would cut and gather babul sticks, used for brushing teeth in the morning, for all three hundred sadhus in the mandir.<br/>Besides this, every morning he cleaned the cowsheds, collected cow-dung and made little flat cakes out of the dung and placed them in the sun to dry. In spite of fatigue from the day’s work Jina Bhagat always attended the satsang assemblies every evening. He would sing bhajans and chant Swaminarayan mantra. The he would listen to the discourses till late night. Every morning he would get up at four to serve his guru once again. Such was his his daily routine. He earned the blessings of Krishnacharandas Swami by serving him devoutly for six months.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (5, 3, 5, N'Daily Puja', N'1. Doing puja early in the morning makes us feel holy, happy and our mind pure and peaceful. Thinking of God early in the morning makes us feel happy.<br/>2. To perform puja one should sit either facing north or east, place the murtis on the another asan, apply tilak chandlo on the forehead and request the God and guru to grace their presence by reciting the ahvan mantra.<br/>3. One should do at least 5 malas whilst doing darshan of the murti, one tapni mala,<br/>11 times circumabulation still doing mala and then 5 shastang dandvats.<br/>4. One should pray God, “Please protect me from maya, enemies in the form of the indriyas and antahkaran and all forms of kusang. May I forever maintain a feeling of divinity, faultlessness and intense attachment to you and your devotees. Please grant me the strength to observe all your commands.”<br/>5. At last, thank God and gurus for being present in your puja and for accepting puja, ask for forgiveness for any mistakes made and recite the visarjan shlok and then read five verses from the Shikshapatri during puja and pack away the puja neatly.', NULL, NULL, N'March, 2016 ')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (6, 1, 5, N'A Test for the son', N'1. Once, Dharmadev decided to test his son, Ghanshyam.<br/>2. He asked for a small stool from Bhaktimata and then covered it with a silk cloth and <br/> a gold coin, a book and a small sword on it.3. Then, with Bhaktimata he waited with great interest to see which of the three things Ghanshyam would pick up.<br/>4. Within a short time, Ghanshyam got down from his cradle, went to the stool and picked up the book.<br/>5. Seeing this, Dharmadev and Bhaktimata were convinced that their son would study and become a scholar.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (7, 1, 12, N'Curing smallpox', N'1. Once in very hot summer, when Ghanshyam was down with fever, Chandamasi advised Bhaktimata, ”Ghanshyam has smallpox, so put him to bed.”<br/>2. Lakshmibai, Bhaktimata’s sister-in-law advised, “Do not allow him to go out, or to wash, or even to touch water for twenty days.”<br/>3. When Ghanshyam heard this, he said, “We are Brahmins. So we must take a bath everyday. When I will take a cold water bath the smallpox and the fever will both disappear. <br/>4. Believing to his words, Bhaktimata poured a few buckets of cold water on him and she found that the smallpox had subsided and the fever too had gone down.<br/>5. Seeing the miraculous recovery, both Chandamasi and Lakshmibai thought that Ghanshyam must surely be God himself. They bowed to him, and went back home.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (8, 1, 38, N'Walking on water', N'1. One afternoon in Chhapaiya, Ghanshyam, accompanied by Ichchharam and some friends had a bath in the Meen Lake on the outskirts of the village and played amli-pipli under a banyan tree till the evening.<br/>2. Suddenly, as it began to rain heavily with thunder and lightening rent the sky, the whole of the surrounding area was inundated with water, his friends Veni, Madhav and Prag were worried about how they would reach home.<br/>3. Ichchharam asked Ghanshyam, “How can we go home in this flood water? I will drown if I try to walk through the water.”<br/>4. Ghanshyam got down from the tree. He kept Ichchharam behind him holding his dhoti. The others follow similarly holding on to one another’s dhotis, they all walked behind Ghanshyam.<br/>5. When they came to the water’s edge, they were lifted above the ground and even rain did not touch them. Seeing this, Dharmadev, Bhaktimata and the parents of all the children bowed to Ghanshyam believing him to be God himself.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (9, 2, 31, N'The likings of Yogiji Maharaj', N'Yogiji Maharaj used to wear only coarse clothes throughout his life. He was very simple and liked to spend his time in service. He always ate simple food which he mixed in a wooden bowl and ate only after adding water to it. Whenever there was any special dish or if there were any sweet delicacies, he would fast on that day. He always had a smile on his face. He was at home with young and old alike, inquired about their welfare and blessed them all. He prayed to Shriji Maharaj that everyone be relieved of their miseries. He chanted the Swaminarayan Mahamantra constantly with a mala in his hand. Yogiji Maharaj had a special bond with children. He affectionately called them to him and taught them to sing, “Swami ane Narayan, Akshar ane Purushottam, Atma ane Paramatma, Brahman ane Parabrahman.” <br/>He often gathered the children around him and taught them to sing bhajans, and to recite Swamini Vatus. He narrated stories from the life of Shriji Maharaj and Gunatitanand Swami to point out a moral or teach truths to the children. He also narrated incidents from the lives of Shastriji Maharaj and Bhagatji Maharaj as illustrations of correct thought and conduct. He taught everyone how to perform puja and arti and gave them prasad.<br/>Yogiji Maharaj instructed youths to rise early in the morning. After getting up he told them to first remember Bhagwan Swaminarayan. Then, after bathing, one should perform puja, offer prostrations, and read five verses from the Shikshapatri. After puja, one should do one’s school work. School children should regularly study for four hours a day and college students for eight hours. Elders must always be shown due respect. Children should daily bow to their parents.<br/>Before going to school or college, one must apply tilak-chandlo to one’s forehead. Everybody should visit the mandir daily. They should attend the weekly assemblies without fail. They should commit to memory Swamini Vatu, Vachanamruts and kirtans. Milk and water should be filtered before drinking. One should fast on ekadashi. One should not steal, nor use another’s materials without permission. One should not touch another’s lost property. One should not smoke or tell lies. One should neither see films nor attend plays. One should not eat in hotels or in the bazaar.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (10, 3, 14, N'The Muslim Woman from Bhal region', N'1. As God is merciful, even a little time spent in devoted service to God, whether he is a Hindu, Muslim, Christian or Parsi, whether he is a man or woman, whether young or old, he is merciful to one and all. He showers his blessings on all alike.<br/>2. A Muslim woman in a town called Sodhi in Bhal district, had reared a babul tree in her garden only for God.<br/>3. Once, when Shriji Maharaj came to the outskirts of that village, stayed to have a bath in the pond, he asked Sura Khachar to bring a babul stick for him.<br/>4. Sura Khachar saw the babul tree in compound of Muslim woman. He requested to give him a stick. The Bibi said, ”This stick is for God only and if he is God<br/>then I will come personally to offer him the stick.”<br/>5. Bibi gave the babul stick to Maharaj and prayed, “O Swaminarayan! Please come to take me to heaven when my days are over!” and with the same babul stick in his hand Maharaj came when the end of her life was near and transported her to Akshardham.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (11, 1, 36, N'Ghanshyam eats all the food', N'1. On the day after the Ramnavmi Bhaktimata and Suvasinibhabhi cooked food for whole family for breaking their fast.<br/>2. Bhaktimata placed all the delicacies before Thakorji to sanctify the food. As Ghanshyam saw this, he asked for food as he was very hungry.<br/>3. Bhaktimata took a little of each delicacy and prepared a dish for Ghanshyam. Within minutes, Ghanshyam emptied his plate and began to eat from the plate offered to Thakorji and ate all the food in the other vessels.<br/>4. Bhaktimata asked Dharmadev, “Please hurry to the market again and bring pulses, rice, flour, vegetables, ghee and gur because Ghanshyam has eaten up all the food prepared for everyone.<br/>5. When Ghanshyam heard this, he pulled Bhaktimata by the hand and led her to the kitchen. Bhaktimata was surprised when she saw that all the utensils were as full as ever. She embraced her son with great affection. Dharmadev was also very happy.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (12, 1, 41, N'The Priest sight is restored', N'1. When Ghanshyam went for darshan at the Vidyakund mandir, a blind brahmin pujari named Vrajvihari was narrating the stories from Ramayan. He had learnt whole of Ramayan and Mahabharat by heart.<br/>2. During the narration, Ghanshyam heard the talk that Ramchandra left home to stay in the exile in a forest for a period of fourteen years. Ghanshyam thought of leaving home and going to a forest to do austerities. He wanted to ask a question about vairagya. But Vrajvihari refused to answer during discourse. <br/>3. Ghanshyam was disappointed with the reply. He quietly went outside and sat on the verandah.<br/>4. Ghanshyam felt pity for Vrajvihari. He placed his hand on the Brahmin’s head and gazed into his eyes and his sight was restored. He began to see.<br/>5. The Brahmin and all the devotees present there, had the vision of Lord Ramchandra in Ghanshyam. Vrajvihari fell at Ghanshyam’s feet, and after receiving his blessings he went home with joy and gratitude in his heart.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (13, 1, 30, N'Lakshmibai sees a miracle', N'1. One day Ghanshyam accompanied his friend Veniram to his house. There they took makhan from a pot, mixed it with sugar and start eating it.<br/>2. When Laxmibai saw this, she went to Bhaktimata and complained her about Ghanshyam.<br/>3. Bhaktimata said that “My Ghanshyam would never steal anything. If you see Ghanshyam stealing, catch him, tie his hands and feet, and call me. Only thereafter shall I believe you.<br/>4. One afternoon, Ghanshyam and Veniram were eating curd, She caught hold of Ghanshyam and tied Ghanshyam’s hands and feet tightly with a cord. She then took Bhaktimata and all the neighbours to her house.<br/>5. Bhaktimata and others saw Veniram who had been bound with ropes and not Ghanshyam! Lakshmibai felt that Ghanshyam must be God.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (14, 2, 21, N'Snake Bite', N'A small memorial shrine had been constructed in Gondal at the place where the last rites of Gunatitanand Swami had been performed. It was called Akshar Deri. To add to its sanctity, Shastriji Maharaj started building a beautiful mandir over it. Yogiji Maharaj was stationed there at the time. Every day he perform puja of the charnarvind of Shriji Maharaj which had been constructed there. He also performed the mahapuja and offered thal in the Akshar Deri. Yogiji Maharaj and other sadhus used to live in huts built of mud and bricks. Once at midnight, while Yogiji Maharaj was sound asleep, a venomous black cobra bit the index finger of his left hand. The sudden rush of pain woke him up. As a result of poison, the pain quickly spread through his whole body. Yogiji Maharaj did not complain. While chanting the Swaminarayan mantra his eyes closed. Some anxious devotees suggested a physician be called. Others proposed various remedies. When Shastriji Maharaj heard about the snake bite he said, “Take Yogiji Maharaj to the Akshar Deri and chant the Swaminarayan mantra. The effect of the poison will vanish by the divine power of the Swaminarayan Mahamantra.” After exact twelve hours, the effect of the poison subsided. Yogiji Maharaj opened his eyes and bowed to Shastriji Maharaj. A government doctor was amazed to see that the effect of the poison had been nullified by chanting the Swaminarayan mantra. He fell at the feet of Shastriji Maharaj. The King of Gondal and his officers were also surprised at the divine power of the Akshar Deri.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (15, 3, 6, N'Brave Child Devotee', N'1. Once, in the district of Jamnagar, a farmer’s young son accepted the vow of satsang. He prayed to God every day, offered puja and daily visited the mandir.<br/>2. His father, however, was unconvinced. He tried persuasion, then threats, then finally gave him a sound thrashing; but the would not yield. He eagerly pursued his devotion to God.<br/>3. One day irate father tied his son to the yoke of his cart and told him to remove his kanthi. but the son did not remove his kanthi.<br/>4. When the son disagreed with this, his father raised the cart. Chanting Swaminarayan mantra the son died.<br/>5. We should never give up our faith or devotion towards God, whether he protects us or not. That is the hallmark of a true devotee.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (16, 1, 17, N'Ramdatt is taught a lesson.', N'1. Ghanshyam and his friends played too much in the lake, in the end they felt very hungry. so He took them to the mango grove. Ghnashyam climbed up the tree, while his friends waited below. He began to pluck the ripe mangoes from the tree, and throw them down to Veni, Madhav and Prag who caught them in a cloth stretched out under the tree.<br/>2. Ramdatt a brahmin told his companions to pick up the mangoes. Hearing this Veni stopped them.<br/>3. Ghanshyam came down quickly to the lowest branch. As Ramdatt was busy snatching the mangoes, Ghanshyam lifted the drinking pot which was hanging on a string from his shoulder and rushed back to the top of the tree. Ramdatt climbed up the tree but he failed to catch Ghanshyam so he asked the other Brahmins who were standing below to climb the trees.<br/>4. Ghanshyam was standing below, and teasing Ramdatt by holding aloft, the drinking pot with the string. Ghanshyam told his friends ‘Don’t allow a single brahmin to come down and keep throwing stones at them.<br/>5. All Brahmins realised their mistake and Ramdatt asked Ghanshyam to forgive them. Ghanshyam soon forgave them and returned the drinking pot and string.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (17, 1, 10, N'The barber sees a miracle.', N'1. Dharmadev called the baber Amai to shave Ghanshyam’s head.<br/>2. Amai took out his razor and began to shave Ghanshyam’s head.<br/>3. Ghanshyam became invisible to the other when the shaving was half finished.<br/>4. Ghanshyam looked at Amai and became visible.<br/>5. He was convinced that the child was God himself.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (18, 1, 23, N'A sharp broken branch pierced Ghanshyam.', N'1. Ghanshyam along with his friends used to go every evening to play at a short distance away from the house in a small forest in a Targaam village.<br/>2. While climbing down from tamarind tree Ghanshyam’s foot slipped and a sharp broken branch on the tree pierced his right thigh.<br/>3. Indra at once summoned Ashwini Kumar, the physician of the devas, came hurriedly and applied the medicine and bandaged the wound.<br/>4. Rampratapbhai was overjoyed when he saw the wound was dressed. When Suvasinibhabhi asked him to open the bandage, she did not see any injury but there was a faint mark at the spot where the branch had pierced. <br/>5. Ever since this incident occured the pond has been known as ‘Khampa Talavdi.’', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (19, 2, 23, N'Devotion to Guru', N'Yogiji Maharaj used to eat only once a day. He observed a fast every third day. Even in the scorching heat of summer, he would spend the whole day in the service of others. Due to heavy work he developed a hernia. In the year 1937 CE (V.S.1993) Dr.Aspinol said “Swamiji, you will have to undergo an operation. On the instructions of Shastriji Maharaj, Hirjibhai reserved a special room in the Rajkot hospital. At that time, Shastriji Maharaj was also under medical treatment in Gondal. Though it was winter and very cold, Shastriji Maharaj went to the hospital without delay. On seeing Shastriji Maharaj Yogiji Maharaj folded his hands in reverence. Shastriji Maharaj blessed him. The doctor perfromed the operation very skilfully. Yogiji Maharaj had brought the murti of Harikrishna Maharaj to the hospital and had placed it on a table in front of his bed. The devotees were all sitting on the floor around the bed and Shastriji Maharaj as sitting on a chair and was chanting with a mala in hand. After about two hours the effect of the anaesthetic subsided. Yogiji Maharaj stirred in his bed and opened his eyes. Yogiji Maharaj immediately folded his hands in reverence and asked the devotees sitting nearby “Has milk been served to Shastriji Maharaj?” Dr. Aspinol was surprised and he felt “This sadhu was not unconscious. This Yogi must have been in a divine trance. Only then it is possible to remember the guru on waking. Yogiji Maharaj was at that time the personal attendant of Shastriji Maharaj at Gondal, there he served him milk and medicine daily. When he awoke the first thing he remembered was his duty to his guru. How unique was his devotion to his guru!', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (20, 3, 10, N'Brave Bhaguji', N'1. Bhaguji a personal attendant was engaged by Shriji Maharaj for protecting the fields of Dada Khachar. No robber was prepared to face Bhaguji in a fight.<br/>2. The darbar of Bhadli state Bhan Khachar, proclaimed that he would give a piece of land and a handsome reward to any person who would kill Bhaguji and bring his severed head to him. Two brothers from Sindh Khabad and Mataro took up the challenge. They came to attack Bhaguji When he was guarding the field. Bhaguji retaliated and killled Khabad with a single blow. Then Mataro took up the fight. <br/>3. There were 18 wounds on Bhaguji’s body. so Maharaj stopped the practice of arti, beating drums, bells etc. in the village. The barber (who was dressing Bhaguji’s wounds) was bribed by Bhaguji’s enemies to kill him. so the barber, out greed dressed up the wounds with pigeon faces that burned on his wounds. At the same time somebody started ringing the bell loudly in order to upset Bhaguji and worsen his condition.<br/>4. Maharaj immediately came to see Bhaguji, as he understood at once that somebody had plotted to kill Bhaguji. He asked Sachchidanand Swami to take care of Bhaguji and if necessary defy the god of death, yama.<br/>5. King of Bhavnagar, Bapu Vajesinh, on hearing Bhaguji’s bravery, he thought of recruting him for his army. He honoured him and offered. I will pay you a salary of Rs,300 per month and give you charge of 500 mounted soldiers in the army. He declined the handsome offer and said “I only want Bhagwan Swaminarayan. I want to spend the rest of my life in the service of Bhagwan Swaminarayan.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (21, 1, 39, N'Thieves in a Fix', N'1. The thieves while plucking the jackfruit got stuck with the tree which jackfruits growing by Ghanshyam and Rampratapbhai.<br/>2. Early in the morning on seeing Dharmadev Rampratap and Ghanshyam the thieves started praying God in their wrongdoing.<br/>3. The thieves begged pardon to Dharmadev and promised ‘Never to steal again.’<br/>4. Ghanshyam gave a divine look. At once, their hands were freed and they came down.<br/>5. Ghanshyam picked two ripe jackfruits and gave one to each of them, and told so ‘Do not steal any more. Stealing is a grave sin.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (22, 1, 13, N'Fish Brought Back to Life', N'1. One day in Chhapaiya Ghanshyam called out his friends Veni, Madhav and Prag to Meen lake for a bath.<br/>2. A Fisherman was catching fish and putting them in a basket. As soon as Ghanshyam wished all the fish came to life.<br/>3. When the Fisherman got angry and rushed towards Ghanshyam to beat him up, he took the form of Yam Raja, the God of death.<br/>4. On realizing his mistake the fisherman asked for forgiveness.<br/>5. Knowing Ghanshyam as God incarnate, the fisherman requested to set him free from his past sins.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (23, 1, 27, N'A New Set of Teeth', N'1. Suvasinibhabhi made shiro as Ghanshyam had toothache but ate only one or two morsels.<br/>2. Ghanshyam told his Bhabhi to pull out the loose molar tooth.<br/>3. When Suvasini bhabhi and Bhaktimata saw the toothless mouth of Ghanshyam, they became worried.<br/>4. When Bhaktimata asked Ghanshyam to open his mouth she was stuned on seeing a new set of teeth in his mouth.<br/>5. On seeing pearls in Ghnshyam’s fist instead of teeth, a flock of swans from Mansarovar swooped down from the sky and picked up the pearls from his hand and flew away. Seeing this Bhaktimata and Suvasinibhabhi realized that Ghanshyam was indeed God incarnate and humbly bowed to him.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (24, 2, 3, N'Jinabhai’s courage', N'Jinabhai was studying in the fifth standard. Tribhovandas was the headmaster of his school. He was a very hot-tempered man. One day, Tribhovandas severely thrashed a boy named Chandu. Jinabhai could not bear to see the boy suffer. He felt pity for Chandu, who was innocent of any wrongdoing. Jinabhai started chanting ‘Swaminarayan, Swaminarayan.’ Chandu screamed with pain. Tribhovandas continued thrashing him until he fell down unconscious. The children ran helter-skelter out of fear of the teacher. Later, Chandu died as a result of the severe beating. Chandu’s father reported the case to the inspector and an inquiry was opened. The inspector came to the school to investigate. But who would dare to bear witness against the headmaster? The inspector asked all the students in the class. But who would be bold enough to report the truth? Jinabhai always spoke the truth. Why be afraid of speaking the truth? Jinabhai was not at all afraid of the headmaster. So, he boldly addressed the inspector, ‘Our headmaster mercilessly beat the innocent Chandu. He grabbed him by the arm and bashed him to the ground. ‘When Jinabhai spoke up, all the other students gained courage and shouted with one voice, “Yes sir, it was the headmaster who beat Chandu.” Looking closely at the forehead of Jinabhai, the inspector saw the holy tilak-chandlo mark. Innocence and honesty were written on Jina’s face. He believed Jinabhai and immediately dismissed the headmaster. He also rewarded Jinabhai with a prize for fearlessly speaking the truth. The truthful always truimph. Therefore we should not be afraid of telling the truth. We should form a habit of speaking the truth from early childhood.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueShortNote] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (25, 3, 8, N'Akhandanand Swami', N'1. One day as Akhandanand Swami was passing through a dark forest, he saw a ferocious tiger.<br/>2. My body will provide food for the tiger, if I go to God’s abode today.<br/>3. God protects His devotees, how can he bear to see them suffer?<br/>4. I am atma, I am immortal. Why should I fear death? My name is Akhandanand. Who can snatch away my happiness?<br/>5. Suddenly the tiger fell at the feet of Akhandanand Swami as if he was acknowledging his master and disappeared into the forest..', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueShortNote] OFF
/****** Object:  Table [dbo].[QueShlok]    Script Date: 06/07/2016 21:41:57 ******/
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
SET IDENTITY_INSERT [dbo].[QueShlok] ON
INSERT [dbo].[QueShlok] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 3, 5, N'Agachha Bhagwan......................sanmukho bhava.', N'Agachha Bhagwan Deva svasthanat Parameshwara,<br/>Aham pujam karishyami sada tvam sanmukho bhava.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueShlok] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (2, 3, 5, N'Uttishthotishtha.....................sanmukho bhava.', N'Uttishthotishtha he Natha Swaminarayan Prabho;<br/>Dharmasuno Dayasindho svesham shreyah param kuru.<br/>Agachha Bhagwan Deva svasthanat Parameshwara;<br/>Aham pujam karishyami sada tvam sanmukho bhava.', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueShlok] OFF
/****** Object:  Table [dbo].[QueReason]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (7, 1, 41, N'Ghanshyam restored Vrajvihari''s eyesight.', N'When Ghanshyam asked a question about vairagya, Vrajvihari did not answer his question during discourse. He told him, “Come to my house. I shall answer all of your questions.”. Ghanshyam was disappointd with the reply. He felt pity for Vrajvihari. He placed his hand on Vrajvihari’s head & gazed into his eyes. So his eyesight restored.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (8, 1, 34, N'The boatman asked for more money from Ghanshyam.', N'Ghanshyam told the boatman, “We want a separate boat. Can you provide one?” So the boatman asked for more money from Ghanshyam, to reserve the whole boat.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (9, 1, 44, N'Dharmadev told Rampratapbhai to take care of his younger brothers.', N'As Ghanshyam was not attached in any way to this mundane existance, when Dharmadev fell ill and could not even get up from his bed, he told Rampratap to take care of Ghanshyam and treat him with love and respect and not to speak to him harshly, and also to take good care of Ichchharam.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (10, 2, 19, N'Thakorji accepted thal in Bhavnagar.', N'In Bhavnagar at Prabhudas Sheth’s house the thal was placed before murtis.Yogiji Maharaj started singing thal with profound devotion. After half an hour they saw that five ladoos, dal and some rice had been accepted. The water cup was also half empty. They were convinced that Yogiji Maharaj enjoyed the favour of Swami and Shriji.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (11, 2, 25, N'Many satsang youth centres sprang up in Gujarat.', N'Yogiji Maharaj established youth centres in every village or city he visited. He kept a record and encouraged them by writing to the members regularly. If any centre had stopped, he would restart it. Thus many youth centres sprang up in Gujarat.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (12, 2, 21, N'The government doctor fell at the feet of Shastriji Maharaj.', N'When a venomous black cobra bit Yogiji Maharaj and Shastriji Maharaj heard of it, he told to take Yogiji Maharaj to the Akshar Deri and chant the Swaminarayan mahamantra. He also said that the effect of the poison would vanish by the divine power of the Swaminarayan mahamantra. After exactly twelve hours, the effect of the poison subsided. The government doctor was amazed to see that the effect of the poison had been nullified by chanting the Swaminarayan mantra. So, the government doctor fell at the feet of Shastriji Maharaj.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (13, 1, 2, N'The evil women started looking for Dharmadev’s house.', N'When an evil man named Kalidatt learnt that God has take birth as a baby boy in Dharmadev’s house, he ordered all his evil women to go to Dharmadev’s house and kill the child God. so the evil women started looking for Dharmadev’s house.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (14, 1, 27, N'When Suvasinibhabhi saw Ghanshyam’s toothless mouth, she became worried.', N'Ghanshyam told Suvasinibhabhi, “My molar teeth are paining severely. If you pull out all the loose teeth then it will lessen my pain. Ghanshyam loosened all his teeth with his divine powers and pulled out one by one, Ghanshyam had all his teeth removed. When Suvasinibhabhi saw Ghanshyam’s toothless mouth, she became worried.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (15, 1, 26, N'The Mahout bowed to Ghanshyam with deep devotion.', N'Ghanshyam calmed the elephant and freed the mahout from the elephant’s trunk. so the mahout bowed to Ghanshyam and said, “Had you not calmed the elephant and saved me from its wrath today, I would surely have died. You are God. I shall not henceforth steal its food.”', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (16, 2, 16, N'Yogiji Maharaj was an ideal of seva.', N'Every day Yogiji Maharaj would get up early in the morning, cook 300 rotlas. He drew water from the well that would be required for cooking, drinking and for bathing for the sadhus and devotees. He himself served the food to all the sadhus and devotees. He was always the last to have his meal. He would be found cleaning the huge pots till late at night.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (17, 2, 33, N'Narayanswarupdasji has been known as ‘Pramukh Swami.’', N'In V.S. 2006, Shastriji Maharaj appointed Shastri Narayanswarupdasji as the administrative head of the Bochasanwasi Shri Akshar Purushottam Swaminarayan Sanstha. (BAPS) All the devotees were asked to work under his orders and guidance. Since then, Shastri Narayanswarupdasji has been known by the name of Pramukh Swami.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (18, 2, 23, N'Dr. Aspinol and the other devotees became surprised.', N'After operation of a hernia the effect of the anaesthetic subsided, Yogiji Maharaj opened his eyes and asked the devotees sitting nearby in a low voice, “Has milk been served to Shastriji Maharaj?” so the devotees and Dr. Aspinol surprised and felf that this sadhu was not unconscious. This yogi must have been in a divine trance. Only then is it possible to remember the guru on waking.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (19, 1, 6, N'The man who was piercing Ghanshyam’s earlobes was so frightened that he simply screamed.', N'The man approached Ghanshyam with a needle and tried gently to hold his ear. But as soon as he gripped the ear a dazzling light radiated from Ghanshyam which blinded the man’s eyes. He saw only the divine light wherever he turned his eyes. so the man was so frightened that he simply screamed.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (20, 1, 25, N'The king fell to his knees before Ghanshyam and pleaded, “O Ghanshyam! I shall never kill again.”', N'The king in his tent ordered some of his man to kill some goats, cows and other animals. Ghanshyam made a wish to put an end to the killing. The moment he so wished all the horses and elephants in the king’s army broke loose from their chains and madly rushed towards the tent. The king hid himself beneath the pipal tree. Ghanshyam shook the pipal tree vigorously with his divine powers. The king pleaded the God repeatedly. so Ghanshyam entered the tree and asked him to take a pledge. The king fell to his knees before Ghanshyam and pleaded, “O Ghanshyam! I shall never kill again.”', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (21, 1, 41, N'Ghanshyam became upset when he went for darshan to the Mahadev Mandir in Ayodhya.', N'Ghanshyam heard a man by the name Devibaksh, praying to Lord Shankar and asking for something which he shouldn’t ask. Hearing this Ghanshyam was upset.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (22, 2, 14, N'Hargovind Mehta of Vadhwan fell at Yogiji Maharaj’s feet.', N'In Rajkot, Yogiji Maharaj unintentionally made a small mistake. Vijnandas Swami became very angry and ordered him to leave his unfinished meal as punishment. Hargovind Mehta witnessed this scene and asked privately “Yogi, Why do you tolerate so much?” Yogiji Maharaj replied happily “When the guru scolds it is for our good. Without punishment we would not remain alert. so Hargovind Mehta fell at the feet of Yogiji Maharaj.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (23, 2, 6, N'Jinabhai was overjoyed by Mohankaka’s thought.', N'By performing the daily worship and service of the murtis in the mandir at Dhari, Mohankaka’s old age and ill-health and he could no longer look after the mandir properly. He thought “It would be nice if some good devotee could be found to perform this service. His eyes fell on Jinabhai. He asked Jinabhai to take up the duties of mandir, so he was overjoyed.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (24, 2, 3, N'The inspector rewarded Jinabhai with a prize.', N'Jinabhai boldly addressed the inspector saying our headmaster mercilessly beat Chandu. When Jinabhai spoke up, all the other students gained courage and shouted with one voice “Yes sir, it was the headmaster who beat Chandu.” The inspector saw the holy tilak chadlo mark. Innocence and honesty were written on his face. He dismissed the headmaster and rewarded Jinabhai with a prize.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (25, 1, 44, N'Dharmadev told Rampratapbhai to take care of his younger brothers.', N'As Ghanshyam was not attached in any way to this mundane existence, so Dharmadev requested Rampratapbhai to treat Ichchharam and Ghanshyam with love and respect and not to speak to him harshly.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (26, 1, 40, N'The Confectioner was surprised', N'The greedy confectioner filled all the sweets in baskets and gave it to Ghanshyam in exchange for the ring. But when Ghanshyam accompained Dharmadev he said I have not taken his sweets. Everyone went to the shop and they saw that the baskets of sweets were untouched. On seeing this the confectioner was surprised.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (27, 1, 33, N'Manchha, the washerman, dived deep into the water.', N'While playing along with the friends at lake Meen Ghanshyam dived to the bottom and sat on the bed of the lake. He did not come up for some time so his friends ran to the Manchha, the washerman for help. We cannot find our friend Ghanshyam. He has drawned so please dived into the water and find him out.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (28, 2, 25, N'Many satsang youth centres began in Gujarat.', N'Yogiji Maharaj established youth centres in every village or city He visited. If any centre had stopped, he would restart it. He kept a record and encouraged them by writing to the members regularly. In this way within no time many satsang youth centres sprang up in Gujarat.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (29, 2, 20, N'Yogiji Maharaj prayed to the Murti of Harikrishna Maharaj and asked for forgiveness.', N'While going to Gadhada from Sarangpur by bullock-cart, there were neither any wells nor rivers on the route. As there was no water anywhere Yogiji Maharaj became worried and upset. So when he found water he prayed for forgiveness to the murti of Harikrishna Maharaj.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueReason] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (30, 2, 1, N'The farm owner never became angry with Jina''s Mother.', N'Children of other women of the village who came to pluck cotton failing to see their mothers would cry loudly. But Jina never cried, so The Owner never became angry with Jina’s Mother.', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueReason] OFF
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (14, 1, 4, N'Who named the Lord?', N'Sage Markandey named the Lord.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (15, 1, 45, N'What did Ghanshyam wear when he left home?', N'Ghanshyam wore only one piece of a loin-cloth, when he left home.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (16, 1, 16, N'What did Dharmadev fetch to protect Ghanshyam from monkeys?', N'Dharmadev fetched a stick to protect Ghanshyam from monkeys.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (17, 1, 27, N'What happened to Ghanshyam''s teeth that were lying on the ground?', N'Ghanshyam''s teeth that were lying on the ground turned into pearls.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (18, 2, 18, N'Why did the sadhus and the devotees help in the construction of the mandir?', N'Due to lack of funds, the sadhus and the devotees helped in the construction of the mandir.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (19, 2, 33, N'What did Yogiji Maharaj say during his final illness?', N'During his final illness Yogiji Maharaj had said, “Pramukh Swami is everything to me. All of you will now enjoy the bliss of God through him.”', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (20, 2, 17, N'From whose foot did Yogiji Maharaj remove the thorn ?', N'Yogiji Maharaj removed the thorn from Sadhu Narayanprasad’s foot.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (21, 2, 28, N'Where was Yogiji Maharaj’s Amrut Mahotsav celebrated?', N'Yogiji Maharaj’s Amrut Mahotsav was celebrated in Gondal.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (22, 3, 5, N'Which direction should one face while performing puja?', N'One should face towards east or north direction while performing puja.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (23, 3, 15, N'Why did Mulji request his mother to sing the songs of the sacred thread ceremony?', N'Mulji requested his mother to sing the songs of the sacred thread ceremony', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (24, 3, 17, N'Who gave Dungar Bhakta bhagwati diksha and what name was he given?', N'Acharya Viharilalji Maharaj gave bhagvati diksha to Dungar Bhakta and he was named Swami Yagnapurushdas.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (25, 3, 20, N'Which devotee from Vadodara used to present skilfully woven clothes to Shriji Maharaj?', N'Nath Bhakta from Vadodara used to present skilfully woven clothes to Shriji Maharaj.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (26, 1, 46, N'When did Ghanshyam leave home? (Samvat, Month, Tithi)', N'Ghanshyam left home on the day of Ashadh sud 10, Samvat year 1849.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (27, 1, 13, N'Which tree lay on the banks of “Meen” lake?', N'There was banyan tree on the bank of the meen lake.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (28, 1, 23, N'Who applied the bandage to Ghanshyam’s thigh at Khampa Talavdi?', N'Ashvinikumar, the physician of the devas came to bandage the wound of Ghanshyam at Khampa Talvadi.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (29, 1, 39, N'What did the thieves come to steal from Dharmadev’s farm?', N'Thieves came to farm to steal jackfruit.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (30, 2, 2, N'Where did Jinabhai take his daily morning bath and perform meditation?', N'Jinabhai used to have his daily morning bath and perfom meditation at Patalio Jharo.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (31, 2, 12, N'During which festival did austere Jina Bhagat observe a fast?', N'Austere Jina Bhagat observed fast on the day of Annakut festival.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (32, 2, 10, N'When did Jina Bhagat first meet Shastriji Maharaj?', N'On the day of Shravan sud 7 V.S. 1965 Jina Bhagat met Shastriji Maharaj for the first time.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (33, 2, 24, N'What conviction ran strong amongst the devotees who witnessed the murtipratishtha ceremony in Gadhada?', N'At time of Murti-Pratishtha in Gadhada devotees was convinced that, “Shastriji Maharaj is always manifest in the satsang.”', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (34, 3, 14, N'Where did Shriji Maharaj take the Bibi?', N'Shriji Maharaj took the Bibi to Akshardham - the divine abode.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (35, 3, 17, N'When was Shastriji Maharaj born? (Samvat, Month, Tithi)', N'Shastriji Maharaj was born on Maha sud 5, V.S. 1921.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (36, 3, 5, N'Which King spent many hours in performing puja in spite of his busy schedule?', N'In spite of his busy schedule, The King Ambrish spent many hours in performing puja.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (37, 3, 8, N'Who saw a ferocious tiger in the dark forest?', N'Akhandanand Swami saw a ferocious tiger in the dark forest.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (38, 1, 18, N'Which tree did Ghanshyam climb, and in which direction did he look to see spiritual aspirants?', N'To see spiritual aspirants, Ghanshyam climbed on the pipal tree and saw in the west direction.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (39, 1, 29, N'Who was the chief of Chhapaiya village?', N'Motibhai Tarvadi was the chief of Chhapaiya village.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (40, 1, 4, N'Which names did Sage Markandey predict for Ghanshyam to Dharmadev?', N'Sage Markandey predicted different names like “Hari”, “Krishna”, “Harikrishna” and “Nilkanth”.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (41, 1, 26, N'What pledge did the mahout take before Ghanshyam when he was saved?', N'When Ghanshyam saved him the Mahout said, “I shall not henceforth steal elephants food.”', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (42, 2, 9, N'What two guidelines did Jaga Bhakta give Jina Bhagat in his dream?', N'The first is to form a habit of reading the shastras and the second is to keep the association of holy sadhus.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (43, 2, 16, N'How many rotlas did Yogiji Maharaj cook everyday?', N'Yogiji Maharaj cooked 300 rotlas everyday.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (44, 2, 27, N'Which occasion will be written in letters of gold in the annals of the Sanstha’s history?', N'It was the first that time 51 educated youths were being initiated into sadhu-fold. This occasion will be written in letters of gold in the annals of the Sanstha’s history.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (45, 2, 31, N'Which dhun did Yogiji Maharaj teach children to sing?', N'Swami ane Narayan, Akshar ane Purushottam, Atma ane Paramatma, Brahman and Parabrahman.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (46, 3, 4, N'Why did Shriji Maharaj give the Shikshapatri to his followers?', N'He gave Shikshapatri to his followers, so that they could attain ultimate moksha form its observance.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (47, 3, 7, N'By what name would Gangama call Shriji Maharaj?', N'Gangama used to welcome him with such affectionate words, “Oh, my nephew, son!”', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (48, 3, 15, N'What did Shriji Maharaj say to Mulji when he was watering the sugarcane crop?', N'What have you come to do and what are you doing? The Brahmic consciousness in this world has dried up, so leave your home now.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (49, 3, 20, N'What did Nath Bhakta do when his son died?', N'Nath Bhakta distributed sweets among the people of the town when his son died.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (50, 1, 29, N'To whose house did the bawas go to get provisions?', N'The bawas went to Dharmadev’s house to get provisions.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (51, 1, 41, N'Which blind Brahmin pujari''s eyesight did Ghanshyam restore?', N'Ghanshyam restored the sight of blind Brahmin pujari’s named Vrajvihari.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (52, 1, 20, N'In which village did Ghanshyam redeem the ghosts from bondage?', N'Ghanshyam redeemed the ghosts from bondage in Tinwa village.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (53, 1, 8, N'What did Ghanshyam promise to Lakshmiji?', N'Ghanshyam promised to Lakshmiji, “Come to Kathiawad when I go there and I shall fulfill your desire.”', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (54, 2, 22, N'Shastriji Maharaj appointed Yogiji Maharaj as the Mahant of which mandir?', N'Shastriji Maharaj appointed Yogiji Maharaj as the Mahant of the Akshar Mandir Gondal.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (55, 2, 33, N'Where was Pramukh Swami Maharaj''s 48th birthday celebrated?', N'Pramukh Swami Maharaj’s 48th birthday celebrated in Mumbai.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (56, 2, 17, N'Who removed the thorn from Narayanprasad''s foot and where?', N'In Sarangpur, Yogiji Maharaj removed the thorn from sadhu Narayanprasad’s foot.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (57, 2, 23, N'What did Yogiji Maharaj say after the effects of anaesthetic subsided?', N'When the effects of anaesthetic subsided Yogiji Maharaj said “Has milk been served to Shastriji Maharaj?”', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (58, 3, 2, N'Who wrote the Ramayan?', N'Sage Valmiki wrote the Ramayan.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (59, 3, 13, N'What darshan did Shriji Maharaj grant to Jodho in samadhi?', N'Shriji Maharaj put Jodho in samadhi and granted him his divine form in Akshardham.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (60, 3, 15, N'When (Samvat, Tithi) did Shriji Maharaj initiate to Mulji Bhakta?', N'Shriji Maharaj intiated Mulji Bhakta on Samvat 1866, Posh sud Punam.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueOneSentence] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (61, 3, 4, N'Which mantra did Shriji Maharaj introduce for chanting?', N'Shriji Maharaj introduced ‘Swaminarayan’ mantra for chanting.', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueOneSentence] OFF
/****** Object:  Table [dbo].[QueKirtan]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 3, 12, N'Chalu karo......................................raji thaine.', N'Chalu karo lavu hu jaljhari, elaychi laving sopari,<br/>panbidi banavi sari......<br/>Mukhvas mangamta laine, prasadino thal mune daine,<br/>Bhumanand kahe raji thaine......', NULL, NULL, N'March, 2016 | March, 2012')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (5, 3, 9, N'Avya Akshardhamthi.......................sarvavatari Hari', N'Avya Akshardhamthi avanima, aishvarya mukto lai,<br/>Shobhe Aksharsath sundar chhabi, lavanya tejomayi.<br/>Karta divya sada rahe pragat je, sakar sarvopari,<br/>Sahajanand krupalune nit namu, sarvavatari Hari.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (6, 3, 12, N'Galya sata.............................sakar chhe jhajhi', N'Galya sata ghebar fulvadi, dudhpak malpua kadhi,<br/>puri pochi thai chhe ghi ma chadhi.....<br/>Athana shak sundar bhaji, lavi chhu tarat kari taji,<br/>dahi bhat sakar chhe jhajhi.........', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (7, 3, NULL, N'Ame sau Shrijitana...................malya Gunatit Swami', N'Ame sau Shrijitana putro, Akshare vas amaro chhe;<br/>Svadharmibhasma choli to, amare kshobh shano chhe....<br/>Juo sau motina Swami, na rakhi kai te khami;<br/>Pragat Purushottam pami, malya Gunatit Swami......', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (8, 3, NULL, N'Shastriji Maharajna gun nitya......................Ashish vachan dyo anandkari', N'Shastriji Maharajna gun nitya gaou, Yogiji Maharajna gun nitya gaou,<br/>Pramukh Swamina gun nitya gaou, Tav charnoma shish namaou,<br/>Ashish vachan dyo anandkari.....', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (9, 3, 12, N'Galya sata ghebar ................. sakar chhe jhajhi.', N'Galya sata ghebar fulvadi, dudhpak malpua kadhi,<br/>puri pochi thai chhe ghi ma chadhi.<br/>Athana shak sundar bhaji, lavi chhu tarat kari taji,<br/>dahi bhat sakar chhe jhajhi.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (10, 3, 3, N'Shri Hari jai jai........................ bhavbhayhari.', N'Shri Hari jai jai jai jai ... Akshardhamna Dhami tame chho,<br/>Purushottam Parabrahman Hari chho, Bhaktajanona bhavbhayhari.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (11, 3, 9, N'Shrimannirgun-murti sundar tanu......................preme namu sarvada.', N'Shrimannirgun-murti sundar tanu, je gnanvarta kathe,<br/>Je sarvagna, samast sadhugun chhe, maya thaki mukta chhe;<br/>Sarvaishvaryathi purna, ashritjanona dosh tale sada,<br/>Eva Pragji Bhaktraj gurune, preme namu sarvada.', NULL, NULL, N'March, 2014 | March, 2012')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (12, 3, 3, N'Pragat Hari guru......................Vighna sakalne sadya vidari', N'Pragat Hari guru darshan apo, Prabhu tav namna japiye japo,<br/>Tav murti nitya hradaye dhari.... Shri Hari. Sadbuddhi sadgun Prabhu apo,<br/>Abhay kar muj shir par sthapo, Vighna sakalne sadya vidari......', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (13, 3, 9, N'Avya Akshardhamthi avnima..........................sarvavtari Hari', N'Avya Akshardhamthi avnima, aishvarya mukto lai,<br/>Shobhe Aksharsath sundar chhabi, lavanya tejomayi<br/>Karta divya sada rahe pragat je, sakar sarvopari<br/>Sahajanand krupalune nit namu, sarvavtari Hari.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (14, 3, 23, N'Mul Akshar je Brahman Anadi..........................Shri Hari Sahajanand', N'Mul Akshar je Brahman Anadi, Gunatitanand jai jai Gunatitanand jai jai<br/>Purushottam Parabrahman paratpar, Shri Hari Sahajanand jai jai<br/>Shri Hari Sahajanand', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (15, 3, 6, N'Svasthanam gachha Devesha................', N'Svasthanam gachha Devesha pujam-adaya mamakim;<br/>Ishtakama-prasiddhyartham punaragamanaya cha.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (16, 3, NULL, N'Ame sau Swamina............................ame janmya chhie marva', N'Ame sau Swamina balak, marishu Swamine mate;<br/>Ame sau Shrijitana yuvak, ladishu Shrijine mate...<br/>Nathi darta nathi karta, amara janni parva;<br/>Amare dar nathi koino, ame janmya chhie marva.... (Bravery song)', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueKirtan] OFF
/****** Object:  Table [dbo].[QueFillInBlank]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (1, 3, 15, N'Ramanand Swami named _________ the son of _________', N'Mulji, Bholanath', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (3, 3, 13, N'Maharaj had appointed _________ to look after the cattle of _________', N'Jodho shepherd, Dada Khachar', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (4, 3, 7, N'Gangama, who lived in the village of _________ was a disciple of _________ Swami.', N'Jetalpur, Atmanand', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (5, 3, 17, N'Shastriji Maharaj was born in _________ village on the day of _________', N'Mahelav, Vasant Panchmi (Maha sud, 5)', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (6, 3, 6, N'In Gadhada _________ heard the story of the _________ child devotee.', N'Shriji Maharaj, brave', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (7, 3, 22, N'Vajiba went to _________ for darshan of_________', N'Gadhada, Shriji Maharaj', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (8, 3, 4, N'Shriji Maharaj gave the _________ to his followers so that they could attain ultimate moksha from its _________', N'Shikshapatri, observance', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (9, 3, 12, N'Sadguru _________ Swami did not get anything to eat for _________ days.', N'Bhumanand, four', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (10, 3, 13, N'Jodho''s ____________ can be compared only to that of the ____________', N'devotion, gopis of Vraj', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (12, 3, 19, N'On the way to his field, Punjabhai met ____________ and ____________ .', N'Krupanand Swami, Gunatitanand Swami', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (13, 3, 20, N'____________ would bring dry dates, and ____________ in the form of prasad from Shriji Maharaj in samadhi.', N'Prabhudas, sugar crystal', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (14, 3, 4, N'Shriji Maharaj installed his own murti in the mandir at____________.', N'Vartal', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (15, 3, 13, N'Shriji Maharaj had appointed ________________ to look after Dada Khachar’s cattle.', N'Jodho, The Shepherd', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (17, 3, 11, N'Samat Patel collected Rs. ________________, came to Shriji Maharaj and offered him the entire amount.', N'Rs. 4,500/-', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (18, 3, 9, N'Muktanand Swami composed the arti in the village of ________________', N'Kalvani', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (19, 3, 8, N'________________ Swami was not afraid of the tiger.', N'Akhandanand', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (20, 3, 4, N'Ramanand Swami and Nilkanth Varni first met in the village of_____________________', N'Piplana', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (21, 3, 15, N'Mulji Sharma was born on ________________ in Samvat 1841.', N'Aso sud Punam (Sarad Purnima)', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (22, 3, 17, N'Acharya __________________ initiated Yagnapurushdas into the sadhu-fold.', N'Viharilalji Maharaj', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueFillInBlank] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (23, 3, 15, N'_______________Swami offered Punja Bhakta food.', N'Gopalanand', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueFillInBlank] OFF
/****** Object:  Table [dbo].[QueCorrectSequence]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueCorrectSequence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (1, 2, 5, N'Use of Leisure Time', N'1. At two o’clock in the afternoon there was a 30 minute recess for the class.<br/>2. The boys often wondered, “What is Jina doing?”<br/>3. The teachers, too, would ask his friends, “What does Jina do while others play?”<br/>4. Jinabhai did not like to waste his free time. We, too, should not waste time.<br/>5. We should offer devotion to God.', NULL, NULL, N'March, 2016')
INSERT [dbo].[QueCorrectSequence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (2, 2, 3, N'Jinabhai’s courage', N'1. The children ran helter-skelter out of fear of the teacher.<br/>2. Who would dare to bear witness against the headmaster?<br/>3. Why be afraid of speaking the truth?<br/>4. He saw the holy tilak-chandlo on Jinabhai’s forehead, and the innocence and honesty on his face.<br/>5. The truth always triumph.<br/>6. We should not be afraid of telling the truth.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectSequence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (3, 2, 4, N'Snake Bite', N'1. Shastriji Maharaj started building a mandir over the Akshar Deri. <br/>2. Yogiji Maharaj used to live in huts built of mud and bricks with other sadhus. <br/>3. Others prosposed various remedies. <br/>4. Shastriji Maharaj said, “Take Yogiji Maharaj to the Akshar Deri and chant the Swaminarayan mantra. <br/>5. Immediately, the sadhus lifted Yogiji Maharaj, carried him to the Akshar Deri and started chanting the holy name of Bhagwan Swaminarayan.<br/>6. Yogiji Maharaj opened his eyes and bowed to Shastriji Maharaj. <br/>', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectSequence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (4, 2, 1, N'Birth of Jinabhai', N'1. Was born on Vaishakh vad 12, V.S. 1948. 12. Jina is an intelligent child.<br/>2. His childhood name was Jinabhai. <br/>3. Sometimes the children, failing to see their mothers, would cry loudly. <br/>4. Why do you bring your wailing children to my farm? <br/>5. He always sucks his toe, just as Shri Krishna did. <br/>6. Jinabhai had a strong liking for simplicity and cleanliness.<br/>', NULL, NULL, N'March, 2013')
SET IDENTITY_INSERT [dbo].[QueCorrectSequence] OFF
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (5, 1, 8, N'Siddhis at his service:', N'Ghanshyam had a maternal aunt, named Lakshmibai. Onemorning she asked Bhaktimata, ‘What shall I cook today?’', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (6, 1, 1, N'Birth of Ghanshyam:', N'It is the night of Monday, 2 April 1781. Chaitra sud 9, Samvatyear 1837. The time is 10 o’clock at night.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (7, 1, 30, N'Lakshmibai sees a miracle:', N'The boys would enter the house secretly, take the earthenpot from a basket suspended from the ceiling, and enjoy the feast of milk, curd, makhanor whatever else was in the pot.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (8, 1, 19, N'Seen in many mandirs at the same time:', N'There were many mandirs on the way. SoRampratapbhai thought he might as well have darshan. He entered one of the mandirs,and found Ghanshyam, sitting and listening to the Ramayan.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (9, 1, 4, N'Naming the Lord:', N'Your son will restore dharma on earth. He will relieve the miseries of countless people.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (10, 1, 25, N'Ghanshyam stops the killing:', N'Hearing the king’s prayer, Ghanshyam felt compassion for him. immediately he stopped shaking the pipal tree.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (11, 1, 5, N'A test for the son:', N'He asked for a small stool from Bhaktimata and then covered it with a silk cloth.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (12, 1, 33, N'Ghanshyam is seen as Ramchandra:', N'Deep down in the water, Ghanshyam thought, “My parents are worrying, so I should come out of the water.”', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (13, 1, 1, N'Birth of Ghanshyam :', N'Samvat year 1837 chaitra sud 9 at 10-00 o’clock night.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (14, 1, 42, N'Ghanshyam’s Daily Routine:', N'At nine, he would visit all the mandirs in Ayodhya and have darshan of the deities. Wherever the Ramayan was being narrated he would sit and listen to it with rapt attention.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (15, 1, 23, N'The Greedy Confectioner:', N'Ghanshyam’s nature of not saying anything even when he was hungry.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (16, 1, 12, N'Curing small-pox:', N'Bhaktimata believed his words. She took him to the well.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (17, 1, 42, N'Ghanshyam’s daily routine:', N'At three in the afternoon, he would again go for a bath in the river. Then, accompanied by his friends, he would without fail, go to the mandir at Hanuman Gadhi for darshan during the evening arti.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (18, 1, 8, N'Siddhis At His Service:', N'No sooner had she finished, then Lakshmibai came from the kitchen with hot shiro. She was greatly surprised to see eight Siddhis there, with plates full of many varieties of food.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (19, 1, 35, N'Miracle shown to Aunts:', N'Meanwhile, Bhaktimata entered the room with a lighted lamp in her hand. Both the aunts began to complain, ‘Sister, please ask Ghanshyam to take his hand off the grinder. We are not able to remove his hand.’', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectSentence] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (20, 1, 24, N'Sixteen signs of God:', N'The king thought to himself, “If Ghanshyam is God incarnate, then two tests will settle the issue. First, it is mentioned in the shastras that God does not cast a shadow. Secondly, they also say that there are sixteen sacred marks on God’s feet.”', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueCorrectSentence] OFF
/****** Object:  Table [dbo].[QueCorrectOption]    Script Date: 06/07/2016 21:41:57 ******/
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
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (9, 1, 26, N'Saved the Mahout', N'* Daily stole the sweets.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (10, 1, 3, N'Darshan to Ramdayal', N'* Rays of brilliant light started coming out.<br/>* Climbed down from the cradle.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (11, 1, 6, N'Ghanshyam has his ears pierced', N'* Sat on his mother’s lap.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (12, 1, 45, N'Ghanshyam leaves home', N'* Big strong body like wrestlers.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (13, 3, 5, N'Daily Puja', N'* To pray', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (14, 3, 18, N'Behaviour in school and at home.', N'* They do not steal.<br/>Does not quarrel over food or clothes.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (15, 3, 13, N'Jodho - the shepherd', N'* Would eat the butter for fun.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (16, 3, 8, N'Akhandanand Swami', N'* Had to undergo many hardships.<br/>Walked ahead without any fear.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (17, 1, 21, N'The wrestlers are defeated', N'* Tamarind well', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (18, 1, 47, N'Search for Ghanshyam', N'* In the orchard of rose-apple trees<br/>* In all the mandirs', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (19, 1, 27, N'Ramdatt is taught a lesson', N'* Ramdatt, the leader of the Brahmin group<br/>Ghanshyam lifted the drinking pot and string which was hanging on the Brahmins', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (20, 1, 20, N'The ghost well', N'* Sent to Badrikashram<br/>* People with a bad nature.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (21, 3, 20, N'Nath Bhakta', N'* His son died at the age of sixteen.<br/>* Selling vegetables.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (22, 3, 17, N'Shastriji Maharaj', N'* Vaishakh sud 4', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (23, 3, 15, N'Aksharbrahman Gunatitanand Swami', N'* Performed great austerities and serviced others.<br/>* Initiated into sadhu-fold in Samvat 1866', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (24, 3, 11, N'Samat Patel', N'* Sold his land, bullock cart<br/>* We will not go hungry.', NULL, NULL, N'March, 2014')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (25, 3, 18, N'In which direction are the aspirants?', N'* Chhapaiya<br/>* Veni', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (26, 3, 30, N'Lakshmibai sees a miracle', N'* What a fool this woman is!<br/>* Lakshmibai told Bhaktimata to forgive her.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (27, 3, 14, N'Sparrows sent into Samadhi', N'* Next to Madhavram Shukla’s field. <br/>* Sent him out to guard the field.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (28, 3, 26, N'The Mahout is saved', N'* Lifted the Mahout with its trunk.<br/> Had tamed a strong elephant.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (29, 2, 1, N'Birth of Jinabhai', N'1. Was born on Vaishakh vad 12, V.S. 1948. 12. Jina is an intelligent child.<br/>2. His childhood name was Jinabhai. <br/>3. Sometimes the children, failing to see their mothers, would cry loudly. <br/>4. Why do you bring your wailing children to my farm? <br/>5. He always sucks his toe, just as Shri Krishna did. <br/>6. Jinabhai had a strong liking for simplicity and cleanliness.<br/>', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (30, 3, 4, N'Bhagwan Swaminarayan', N'* Returned to his divine abode on Jeth sud 10.<br/>* Wrote Shikshapatri.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (31, 3, 19, N'Punja Dodia', N'* Ran after him in the direction of Sarangpur.<br/>* He will take me to his abode on the 13th day.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (32, 3, 3, N'Prayer', N'* Akshardham na Dhami tame chho….<br/>* Abhay kar muj shir par sthapo….', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (33, 3, 22, N'Vajiba', N'* She never found fault in the bad habits of sadhus.<br/>* Stopped giving shelter to sadhus who indulged in intoxicants like heroine.', NULL, NULL, N'March, 2013')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (34, 1, 14, N'Sparrows sent into samadhi', N'* Ghanshyam was not there.<br/>* What were you told?', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (35, 1, 34, N'Sailing on stone slabs', N'* We want a separate boat.<br/>* Sat on a smaller slab.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (36, 1, 32, N'Ghanshyam is given the sacred thread', N'* To liberate innumerable souls in this world.<br/>* Ate ghee, gur and rice.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (37, 1, 16, N'Monkeys get a sound thrashing', N'* They all hooted and jumped.<br/>* They surrounded him from all sides.<br/>* A mischievous monkey came up.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (38, 3, 11, N'Samat Patel', N'* Rs. 4,500 <br/> We will not go hungry.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (39, 3, 16, N'Gunatitanand Swami’s talks', N'* The cart was filled up.<br/>*  Forgot about his own purchases.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (40, 3, 9, N'Arti', N'* Composed the arti ‘Jai Sadguru Swami....’<br/>* Muktanand Swami performed the arti.', NULL, NULL, N'March, 2012')
INSERT [dbo].[QueCorrectOption] ([Id], [BookId], [ChapterNumber], [Title_Eng], [Correct_Eng], [Title_Guj], [Correct_Guj], [Exams]) VALUES (41, 3, 1, N'Gifts from God', N'* Serve the sadhus. <br/>* Going to the mandir.', NULL, NULL, N'March, 2012')
SET IDENTITY_INSERT [dbo].[QueCorrectOption] OFF
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen]  WITH CHECK ADD  CONSTRAINT [FK_QueWhoWhomWhen_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] CHECK CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueSwaminiVat_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat]  WITH CHECK ADD  CONSTRAINT [FK_QueSwaminiVat_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] CHECK CONSTRAINT [FK_QueSwaminiVat_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_BookChapter_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_BookChapter_Book]
GO
/****** Object:  ForeignKey [FK_QueShortNote_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote]  WITH CHECK ADD  CONSTRAINT [FK_QueShortNote_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote] CHECK CONSTRAINT [FK_QueShortNote_Book]
GO
/****** Object:  ForeignKey [FK_QueShlok_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok]  WITH CHECK ADD  CONSTRAINT [FK_QueShlok_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] CHECK CONSTRAINT [FK_QueShlok_Book]
GO
/****** Object:  ForeignKey [FK_QueReason_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason]  WITH CHECK ADD  CONSTRAINT [FK_QueReason_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason] CHECK CONSTRAINT [FK_QueReason_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueOneSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] CHECK CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueKirtan_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan]  WITH CHECK ADD  CONSTRAINT [FK_QueKirtan_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] CHECK CONSTRAINT [FK_QueKirtan_Book]
GO
/****** Object:  ForeignKey [FK_QueFillInBlank_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank]  WITH CHECK ADD  CONSTRAINT [FK_QueFillInBlank_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank] CHECK CONSTRAINT [FK_QueFillInBlank_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSequence_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectSequence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence] CHECK CONSTRAINT [FK_QueCorrectSequence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] CHECK CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectOption_Book]    Script Date: 06/07/2016 21:41:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectOption_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption] CHECK CONSTRAINT [FK_QueCorrectOption_Book]
GO
