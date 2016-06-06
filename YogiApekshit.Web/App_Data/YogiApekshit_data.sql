USE [YogiApekshit]
GO
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/05/2016 21:25:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueSwaminiVat_Book]    Script Date: 06/05/2016 21:25:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] DROP CONSTRAINT [FK_QueSwaminiVat_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/05/2016 21:25:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
/****** Object:  ForeignKey [FK_QueShortNote_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote] DROP CONSTRAINT [FK_QueShortNote_Book]
GO
/****** Object:  ForeignKey [FK_QueShlok_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] DROP CONSTRAINT [FK_QueShlok_Book]
GO
/****** Object:  ForeignKey [FK_QueReason_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason] DROP CONSTRAINT [FK_QueReason_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueKirtan_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] DROP CONSTRAINT [FK_QueKirtan_Book]
GO
/****** Object:  ForeignKey [FK_QueFillInBlank_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank] DROP CONSTRAINT [FK_QueFillInBlank_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSequence_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence] DROP CONSTRAINT [FK_QueCorrectSequence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectOption_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption] DROP CONSTRAINT [FK_QueCorrectOption_Book]
GO
/****** Object:  Table [dbo].[QueCorrectOption]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption] DROP CONSTRAINT [FK_QueCorrectOption_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectOption]
GO
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] DROP CONSTRAINT [FK_QueCorrectSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectSentence]
GO
/****** Object:  Table [dbo].[QueCorrectSequence]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence] DROP CONSTRAINT [FK_QueCorrectSequence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]') AND type in (N'U'))
DROP TABLE [dbo].[QueCorrectSequence]
GO
/****** Object:  Table [dbo].[QueFillInBlank]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank] DROP CONSTRAINT [FK_QueFillInBlank_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]') AND type in (N'U'))
DROP TABLE [dbo].[QueFillInBlank]
GO
/****** Object:  Table [dbo].[QueKirtan]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] DROP CONSTRAINT [FK_QueKirtan_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueKirtan]') AND type in (N'U'))
DROP TABLE [dbo].[QueKirtan]
GO
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] DROP CONSTRAINT [FK_QueOneSentence_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueOneSentence]') AND type in (N'U'))
DROP TABLE [dbo].[QueOneSentence]
GO
/****** Object:  Table [dbo].[QueReason]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason] DROP CONSTRAINT [FK_QueReason_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueReason]') AND type in (N'U'))
DROP TABLE [dbo].[QueReason]
GO
/****** Object:  Table [dbo].[QueShlok]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] DROP CONSTRAINT [FK_QueShlok_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShlok]') AND type in (N'U'))
DROP TABLE [dbo].[QueShlok]
GO
/****** Object:  Table [dbo].[QueShortNote]    Script Date: 06/05/2016 21:25:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote] DROP CONSTRAINT [FK_QueShortNote_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueShortNote]') AND type in (N'U'))
DROP TABLE [dbo].[QueShortNote]
GO
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/05/2016 21:25:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] DROP CONSTRAINT [FK_BookChapter_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookChapter]') AND type in (N'U'))
DROP TABLE [dbo].[BookChapter]
GO
/****** Object:  Table [dbo].[QueSwaminiVat]    Script Date: 06/05/2016 21:25:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] DROP CONSTRAINT [FK_QueSwaminiVat_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]') AND type in (N'U'))
DROP TABLE [dbo].[QueSwaminiVat]
GO
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/05/2016 21:25:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] DROP CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]') AND type in (N'U'))
DROP TABLE [dbo].[QueWhoWhomWhen]
GO
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/05/2016 21:25:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExamLevel]') AND type in (N'U'))
DROP TABLE [dbo].[ExamLevel]
GO
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/05/2016 21:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionCategory]') AND type in (N'U'))
DROP TABLE [dbo].[QuestionCategory]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/05/2016 21:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
DROP TABLE [dbo].[Book]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/05/2016 21:25:02 ******/
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
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 06/05/2016 21:25:02 ******/
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
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 06/05/2016 21:25:07 ******/
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
/****** Object:  Table [dbo].[QueWhoWhomWhen]    Script Date: 06/05/2016 21:25:07 ******/
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
SET IDENTITY_INSERT [dbo].[QueWhoWhomWhen] OFF
/****** Object:  Table [dbo].[QueSwaminiVat]    Script Date: 06/05/2016 21:25:07 ******/
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
INSERT [dbo].[QueSwaminiVat] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (2, 3, 16, N'Bhagwan to potana bhaktani...', N'Swaminarayan Hare Swamie vat kari je: Bhagwan to potana bhaktani raksha karvamaj betha chhe. Keni pethe? To jem papan ankhni raksha kare chhe ne<br/>hath kanthni raksha kare chhe ne mavtar chhokrani raksha kare chhe ne raja prajani rakshama chhe, temaj Bhagwan Aapni rakshama chhe. (1.22)<br/>“God always protects his devotees. Just as the eyelids protect the eyes, the hands protect the neck, a mother protects her child and a king protects his<br/>subjects, God protects us.”<br/>Prahlad, Narsinh Mehta, Mirabai, for example, were so deeply devoted to God that he protected them from all evil forces. Similarly, Shriji Maharaj protects his devotees as the following story shows.<br/>A devotee called Naja Bhakta was living in the small town of Bhadli. This small town was much oppressed by the shepherds. So Naja Bhakta went to live in another town called Bhoyra. He told Vasur Khachar, the king, about the glory of Shriji Maharaj. The king heard him and then said, “If your God is really God, then he should present himself here tomorrow. Otherwise I will break your kneecaps.”<br/>At that time Shriji Maharaj was in Visnagar. “How can Maharaj reach Bhoyra in one night?” worried Naja Bhakta.<br/>The king was a very cruel man and would not hesitate to carry out his threat.<br/>Desperately Naja Bhakta began to think of Shriji Maharaj and made a silent appeal.<br/>Meanwhile, Shriji Maharaj started out from Visnagar. On the way, near Vadhvan, there was a river in flood. Walking over the waters, Maharaj reached Bhoyra early in the morning and sent a messenger to the king, “Naja Bhakta’s God has arrived.” Early in the morning, when Naja Bhakta opened the door of his house, he saw Shriji Maharaj standing at his door. He was stunned. He knelt at the feet of Maharaj in gratitude. Then after some time the two went together to the court of the cruel king. On the way, Maharaj heard about the people’s woes and their cries of anguish.<br/>Naja Bhakta told Maharaj, “The king is very cruel man. He punishes people without mercy and breaks their kneecaps.”<br/>When the king came to meet Shriji Maharaj, Shriji Maharaj at once sent him into samadhi and showed him the horrors of hell. Here Yamraj beat him mercilessly.<br/>After some time, by the grace of Maharaj, he came out of the samadhi. Immediately he fell at the feet of Maharaj, confessed his evil deeds and asked for forgiveness. He realized that Swaminarayan was God incarnate.<br/>Shriji Maharaj instructed him to be good and never subject people to terrible punishments.<br/>Then, Shriji Maharaj initiated him into the Fellowship and made him a satsangi. This was how Maharaj protected his devotee Naja Bhakta, when he was in danger.', NULL, NULL, N'March, 2015')
SET IDENTITY_INSERT [dbo].[QueSwaminiVat] OFF
/****** Object:  Table [dbo].[BookChapter]    Script Date: 06/05/2016 21:25:07 ******/
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
/****** Object:  Table [dbo].[QueShortNote]    Script Date: 06/05/2016 21:25:08 ******/
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
SET IDENTITY_INSERT [dbo].[QueShortNote] OFF
/****** Object:  Table [dbo].[QueShlok]    Script Date: 06/05/2016 21:25:08 ******/
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
/****** Object:  Table [dbo].[QueReason]    Script Date: 06/05/2016 21:25:08 ******/
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
SET IDENTITY_INSERT [dbo].[QueReason] OFF
/****** Object:  Table [dbo].[QueOneSentence]    Script Date: 06/05/2016 21:25:08 ******/
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
SET IDENTITY_INSERT [dbo].[QueOneSentence] OFF
/****** Object:  Table [dbo].[QueKirtan]    Script Date: 06/05/2016 21:25:08 ******/
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
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (5, 3, 9, N'Avya Akshardhamthi.......................sarvavatari Hari', N'Avya Akshardhamthi avanima, aishvarya mukto lai,<br/>Shobhe Aksharsath sundar chhabi, lavanya tejomayi.<br/>Karta divya sada rahe pragat je, sakar sarvopari,<br/>Sahajanand krupalune nit namu, sarvavatari Hari.', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (6, 3, 12, N'Galya sata.............................sakar chhe jhajhi', N'Galya sata ghebar fulvadi, dudhpak malpua kadhi,<br/>puri pochi thai chhe ghi ma chadhi.....<br/>Athana shak sundar bhaji, lavi chhu tarat kari taji,<br/>dahi bhat sakar chhe jhajhi.........', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (7, 3, NULL, N'Ame sau Shrijitana...................malya Gunatit Swami', N'Ame sau Shrijitana putro, Akshare vas amaro chhe;<br/>Svadharmibhasma choli to, amare kshobh shano chhe....<br/>Juo sau motina Swami, na rakhi kai te khami;<br/>Pragat Purushottam pami, malya Gunatit Swami......', NULL, NULL, N'March, 2015')
INSERT [dbo].[QueKirtan] ([Id], [BookId], [ChapterNumber], [Que_Eng], [Ans_Eng], [Que_Guj], [Ans_Guj], [Exams]) VALUES (8, 3, NULL, N'Shastriji Maharajna gun nitya......................Ashish vachan dyo anandkari', N'Shastriji Maharajna gun nitya gaou, Yogiji Maharajna gun nitya gaou,<br/>Pramukh Swamina gun nitya gaou, Tav charnoma shish namaou,<br/>Ashish vachan dyo anandkari.....', NULL, NULL, N'March, 2015')
SET IDENTITY_INSERT [dbo].[QueKirtan] OFF
/****** Object:  Table [dbo].[QueFillInBlank]    Script Date: 06/05/2016 21:25:08 ******/
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
SET IDENTITY_INSERT [dbo].[QueFillInBlank] OFF
/****** Object:  Table [dbo].[QueCorrectSequence]    Script Date: 06/05/2016 21:25:08 ******/
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
SET IDENTITY_INSERT [dbo].[QueCorrectSequence] OFF
/****** Object:  Table [dbo].[QueCorrectSentence]    Script Date: 06/05/2016 21:25:08 ******/
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
SET IDENTITY_INSERT [dbo].[QueCorrectSentence] OFF
/****** Object:  Table [dbo].[QueCorrectOption]    Script Date: 06/05/2016 21:25:08 ******/
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
SET IDENTITY_INSERT [dbo].[QueCorrectOption] OFF
/****** Object:  ForeignKey [FK_QueWhoWhomWhen_Book]    Script Date: 06/05/2016 21:25:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen]  WITH CHECK ADD  CONSTRAINT [FK_QueWhoWhomWhen_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueWhoWhomWhen_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueWhoWhomWhen]'))
ALTER TABLE [dbo].[QueWhoWhomWhen] CHECK CONSTRAINT [FK_QueWhoWhomWhen_Book]
GO
/****** Object:  ForeignKey [FK_QueSwaminiVat_Book]    Script Date: 06/05/2016 21:25:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat]  WITH CHECK ADD  CONSTRAINT [FK_QueSwaminiVat_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueSwaminiVat_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueSwaminiVat]'))
ALTER TABLE [dbo].[QueSwaminiVat] CHECK CONSTRAINT [FK_QueSwaminiVat_Book]
GO
/****** Object:  ForeignKey [FK_BookChapter_Book]    Script Date: 06/05/2016 21:25:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_BookChapter_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookChapter_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookChapter]'))
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_BookChapter_Book]
GO
/****** Object:  ForeignKey [FK_QueShortNote_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote]  WITH CHECK ADD  CONSTRAINT [FK_QueShortNote_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShortNote_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShortNote]'))
ALTER TABLE [dbo].[QueShortNote] CHECK CONSTRAINT [FK_QueShortNote_Book]
GO
/****** Object:  ForeignKey [FK_QueShlok_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok]  WITH CHECK ADD  CONSTRAINT [FK_QueShlok_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueShlok_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueShlok]'))
ALTER TABLE [dbo].[QueShlok] CHECK CONSTRAINT [FK_QueShlok_Book]
GO
/****** Object:  ForeignKey [FK_QueReason_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason]  WITH CHECK ADD  CONSTRAINT [FK_QueReason_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueReason_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueReason]'))
ALTER TABLE [dbo].[QueReason] CHECK CONSTRAINT [FK_QueReason_Book]
GO
/****** Object:  ForeignKey [FK_QueOneSentence_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueOneSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueOneSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueOneSentence]'))
ALTER TABLE [dbo].[QueOneSentence] CHECK CONSTRAINT [FK_QueOneSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueKirtan_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan]  WITH CHECK ADD  CONSTRAINT [FK_QueKirtan_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueKirtan_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueKirtan]'))
ALTER TABLE [dbo].[QueKirtan] CHECK CONSTRAINT [FK_QueKirtan_Book]
GO
/****** Object:  ForeignKey [FK_QueFillInBlank_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank]  WITH CHECK ADD  CONSTRAINT [FK_QueFillInBlank_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueFillInBlank_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueFillInBlank]'))
ALTER TABLE [dbo].[QueFillInBlank] CHECK CONSTRAINT [FK_QueFillInBlank_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSequence_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectSequence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSequence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSequence]'))
ALTER TABLE [dbo].[QueCorrectSequence] CHECK CONSTRAINT [FK_QueCorrectSequence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectSentence_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectSentence_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectSentence_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectSentence]'))
ALTER TABLE [dbo].[QueCorrectSentence] CHECK CONSTRAINT [FK_QueCorrectSentence_Book]
GO
/****** Object:  ForeignKey [FK_QueCorrectOption_Book]    Script Date: 06/05/2016 21:25:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption]  WITH CHECK ADD  CONSTRAINT [FK_QueCorrectOption_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QueCorrectOption_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[QueCorrectOption]'))
ALTER TABLE [dbo].[QueCorrectOption] CHECK CONSTRAINT [FK_QueCorrectOption_Book]
GO
