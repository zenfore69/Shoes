Create DataBase Shoes
GO
USE [Shoes]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 04.03.2026 20:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Код] [int] NOT NULL,
	[ДатаЗаказа] [date] NULL,
	[ДатаДоставки] [date] NULL,
	[КодПункта] [int] NULL,
	[КодПользователя] [int] NULL,
	[КодДляПолучения] [int] NULL,
	[СтатусЗаказа] [nvarchar](50) NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 04.03.2026 20:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Код] [int] NOT NULL,
	[РольСотрудника] [nvarchar](50) NULL,
	[ФИО] [nvarchar](50) NULL,
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПунктВыдачи]    Script Date: 04.03.2026 20:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПунктВыдачи](
	[Код] [int] NOT NULL,
	[Адрес] [nvarchar](max) NULL,
 CONSTRAINT [PK_ПунктВыдачи] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СоставЗаказа]    Script Date: 04.03.2026 20:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СоставЗаказа](
	[Код] [int] NOT NULL,
	[КодТовара] [int] NULL,
	[Количество] [int] NULL,
	[КодЗаказа] [int] NULL,
 CONSTRAINT [PK_СоставЗаказа] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 04.03.2026 20:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[Код] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
	[ЕдиницаИзмерения] [nvarchar](10) NULL,
	[Цена] [decimal](10, 2) NULL,
	[Поставщик] [nvarchar](50) NULL,
	[Производитель] [nvarchar](50) NULL,
	[Категория] [nvarchar](50) NULL,
	[Скидка] [int] NULL,
	[КоличествоНаСкладе] [int] NULL,
	[Описание] [nvarchar](max) NULL,
	[Фото] [image] NULL,
 CONSTRAINT [PK_Товары] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Пользователь] ([Код], [РольСотрудника], [ФИО], [Логин], [Пароль]) VALUES (1, N'Администратор', N'admin', N'admin', N'123')
GO
INSERT [dbo].[Пользователь] ([Код], [РольСотрудника], [ФИО], [Логин], [Пароль]) VALUES (2, N'Менеджер', N'manager', N'manager', N'123')
GO
INSERT [dbo].[Пользователь] ([Код], [РольСотрудника], [ФИО], [Логин], [Пароль]) VALUES (3, N'Администратор', N'Lena', N'Lena', N'123')
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Пользователь] FOREIGN KEY([КодПользователя])
REFERENCES [dbo].[Пользователь] ([Код])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Пользователь]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_ПунктВыдачи] FOREIGN KEY([КодПункта])
REFERENCES [dbo].[ПунктВыдачи] ([Код])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_ПунктВыдачи]
GO
ALTER TABLE [dbo].[СоставЗаказа]  WITH CHECK ADD  CONSTRAINT [FK_СоставЗаказа_Заказы] FOREIGN KEY([КодЗаказа])
REFERENCES [dbo].[Заказы] ([Код])
GO
ALTER TABLE [dbo].[СоставЗаказа] CHECK CONSTRAINT [FK_СоставЗаказа_Заказы]
GO
ALTER TABLE [dbo].[СоставЗаказа]  WITH CHECK ADD  CONSTRAINT [FK_СоставЗаказа_Товары] FOREIGN KEY([КодТовара])
REFERENCES [dbo].[Товары] ([Код])
GO
ALTER TABLE [dbo].[СоставЗаказа] CHECK CONSTRAINT [FK_СоставЗаказа_Товары]
GO
