USE [WMS]
GO
/****** Object:  Table [dbo].[GeneralSetting]    Script Date: 3/27/2017 2:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralSetting](
	[GeneralSettingId] [bigint] IDENTITY(1,1) NOT NULL,
	[GSCode] [varchar](30) NOT NULL,
	[GSKey] [varchar](100) NOT NULL,
	[GSValue] [varchar](100) NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_GeneralSetting] PRIMARY KEY CLUSTERED 
(
	[GeneralSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemLotMasterSequence]    Script Date: 3/27/2017 2:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemLotMasterSequence](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](50) NOT NULL,
	[LotNo] [varchar](50) NOT NULL,
	[ExecutionDate] [date] NOT NULL,
	[Length] [int] NOT NULL,
	[Seq] [int] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_ItemLotMasterSequence] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/27/2017 2:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuId] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentMenu] [varchar](50) NOT NULL,
	[SubMenu] [varchar](50) NOT NULL,
	[Path] [varchar](1000) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MOQueue]    Script Date: 3/27/2017 2:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOQueue](
	[MOQueueId] [bigint] IDENTITY(1,1) NOT NULL,
	[MoNumber] [varchar](100) NOT NULL,
	[ExecuteDate] [datetime] NOT NULL,
	[IsPriority] [bit] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_MOQueue] PRIMARY KEY CLUSTERED 
(
	[MOQueueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OracleDetail]    Script Date: 3/27/2017 2:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OracleDetail](
	[OracleDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[OracleHeaderId] [bigint] NOT NULL,
	[MOHeaderId] [bigint] NOT NULL,
	[MOLineId] [bigint] NOT NULL,
	[MONumber] [varchar](100) NOT NULL,
	[ItemCode] [varchar](50) NOT NULL,
	[LotNo] [varchar](50) NOT NULL,
	[LotQty] [decimal](10, 3) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[IsProcessed] [bit] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_OracleDetail] PRIMARY KEY CLUSTERED 
(
	[OracleDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OracleHeader]    Script Date: 3/27/2017 2:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OracleHeader](
	[OracleHeaderId] [bigint] IDENTITY(1,1) NOT NULL,
	[MOHeaderId] [bigint] NOT NULL,
	[MOLineId] [bigint] NOT NULL,
	[MoNumber] [varchar](100) NOT NULL,
	[LineNumber] [bigint] NOT NULL,
	[FromSubInventoryCode] [varchar](50) NULL,
	[ToSubInventoryCode] [varchar](50) NULL,
	[DateRequired] [date] NOT NULL,
	[SourceType] [varchar](10) NULL,
	[DocNumber] [varchar](100) NULL,
	[Customer] [varchar](100) NULL,
	[ShipTo] [varchar](100) NULL,
	[Requestor] [varchar](100) NULL,
	[ItemCode] [varchar](50) NULL,
	[ItemDesc] [varchar](100) NULL,
	[ItemDescAlias] [varchar](100) NULL,
	[UOM] [varchar](5) NULL,
	[Qty] [decimal](10, 3) NOT NULL,
	[UrutanTuang] [int] NULL,
	[QtyPerCharge] [decimal](10, 3) NULL,
	[Activity] [varchar](100) NULL,
	[CombineL1] [varchar](50) NULL,
	[CombineL2] [varchar](50) NULL,
	[PackingSize] [decimal](10, 3) NULL,
	[SelfLife] [int] NOT NULL,
	[IsTimbang] [bit] NOT NULL,
	[IsClosedCode] [bit] NOT NULL,
	[IsAllergen] [bit] NOT NULL,
	[IsProcessed] [bit] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_OracleHeader] PRIMARY KEY CLUSTERED 
(
	[OracleHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/27/2017 2:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleMenuMapping]    Script Date: 3/27/2017 2:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenuMapping](
	[RoleMenuMappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[MenuId] [bigint] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_RoleMenuMapping] PRIMARY KEY CLUSTERED 
(
	[RoleMenuMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskTimbang]    Script Date: 3/27/2017 2:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTimbang](
	[TaskTimbangId] [bigint] IDENTITY(1,1) NOT NULL,
	[Barcode] [varchar](20) NOT NULL,
	[OracleHeaderId] [bigint] NOT NULL,
	[Seq] [int] NOT NULL,
	[BagNo] [varchar](10) NOT NULL,
	[ItemCode] [varchar](50) NOT NULL,
	[Weight] [decimal](10, 3) NOT NULL,
	[LotNo] [varchar](50) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[NewLotNo] [varchar](50) NOT NULL,
	[NewExpirationDate] [date] NOT NULL,
	[Type] [char](1) NOT NULL,
	[IsAllergen] [bit] NOT NULL,
	[IsTimbang] [bit] NOT NULL,
	[TerminalId] [varchar](10) NULL,
	[UserId] [int] NULL,
	[ExecuteDate] [datetime] NULL,
	[Status] [varchar](10) NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_TaskTimbang] PRIMARY KEY CLUSTERED 
(
	[TaskTimbangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TerminalActive]    Script Date: 3/27/2017 2:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerminalActive](
	[TerminalActiveId] [bigint] IDENTITY(1,1) NOT NULL,
	[TerminalId] [varchar](10) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Shift] [char](1) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_TerminalAssign] PRIMARY KEY CLUSTERED 
(
	[TerminalActiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TerminalConfiguration]    Script Date: 3/27/2017 2:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerminalConfiguration](
	[TerminalConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[TerminalId] [varchar](10) NOT NULL,
	[TerminalCategory] [char](1) NOT NULL,
	[TerminalGroup] [int] NULL,
	[TerminalDescription] [varchar](50) NOT NULL,
	[TerminalLocation] [varchar](50) NOT NULL,
	[IsAllergen] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_TerminalConfiguration] PRIMARY KEY CLUSTERED 
(
	[TerminalConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/27/2017 2:56:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserLoginCode] [varchar](10) NOT NULL,
	[UserLoginPin] [varchar](10) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[PhoneNo] [varchar](20) NULL,
	[IsActive] [bit] NOT NULL,
	[IsLogin] [bit] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoleMapping]    Script Date: 3/27/2017 2:56:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMapping](
	[UserRoleMappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[UsrCrt] [varchar](50) NOT NULL,
	[DtmCrt] [datetime] NOT NULL,
	[UsrUpd] [varchar](50) NOT NULL,
	[DtmUpd] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRoleMapping] PRIMARY KEY CLUSTERED 
(
	[UserRoleMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[GeneralSetting] ON 

INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (1, N'SHIFT', N'1', N'SHIFT 1 (00:00 - 07:59)', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2, N'SHIFT', N'2', N'SHIFT 2 (08:00 - 15:59)', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (3, N'SHIFT', N'3', N'SHIFT 3 (16:00 - 23:59)', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (4, N'TERMINAL_CATEGORY', N'B', N'Timbangan Besar', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (5, N'TERMINAL_CATEGORY', N'K', N'Timbangan Kecil', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (6, N'TASK_TIMBANG_COUNT', N'1', N'5', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (7, N'TASK_LEFT_PERCENTAGE', N'1', N'50', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (8, N'BARCODE_LENGTH', N'1', N'12', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (10, N'TERMINAL_ID', N'T01', N'Terminal 1', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (11, N'TERMINAL_ID', N'T02', N'Terminal 2', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (12, N'TERMINAL_ID', N'T03', N'Terminal 3', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (13, N'TERMINAL_GROUP', N'1', N'Line 1', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (14, N'TERMINAL_GROUP', N'2', N'Line 2', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[GeneralSetting] ([GeneralSettingId], [GSCode], [GSKey], [GSValue], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (15, N'TERMINAL_GROUP', N'3', N'Line 3', N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[GeneralSetting] OFF
SET IDENTITY_INSERT [dbo].[ItemLotMasterSequence] ON 

INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2189, N'RASMP001', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:57:00.383' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:57:00.383' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2190, N'IACER006.KN2', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:57:30.693' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:57:30.693' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2191, N'RFCAC001', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:57:59.767' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:57:59.767' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2192, N'IBMIX003', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.083' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.083' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2193, N'IBMIX003', N'13', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.337' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.337' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2194, N'RGITA001', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.467' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.467' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2195, N'RFIRO001', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.837' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:58:00.837' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2196, N'RJVEX001.KN2', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:58:01.183' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:58:01.183' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2197, N'RBMAL002', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:58:01.500' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:58:01.500' AS DateTime))
INSERT [dbo].[ItemLotMasterSequence] ([ID], [ItemCode], [LotNo], [ExecutionDate], [Length], [Seq], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2198, N'RFSOD002.KN3', N'W1', CAST(N'2017-03-01' AS Date), 3, 1, N'[OanTech.System]', CAST(N'2017-02-13T23:58:01.800' AS DateTime), N'[OanTech.System]', CAST(N'2017-02-13T23:58:01.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[ItemLotMasterSequence] OFF
SET IDENTITY_INSERT [dbo].[MOQueue] ON 

INSERT [dbo].[MOQueue] ([MOQueueId], [MoNumber], [ExecuteDate], [IsPriority], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (1, N'MO_SHP_1', CAST(N'2017-03-08T00:00:00.000' AS DateTime), 1, N'EXE', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:30:26.867' AS DateTime))
SET IDENTITY_INSERT [dbo].[MOQueue] OFF
SET IDENTITY_INSERT [dbo].[OracleDetail] ON 

INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (36, 31, 3567, 6050, N'MO_SHP_1', N'RASMP001', N'W1', CAST(375.000 AS Decimal(10, 3)), CAST(N'2017-01-20' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (37, 32, 3567, 6051, N'MO_SHP_1', N'RASMP001', N'W1', CAST(18.500 AS Decimal(10, 3)), CAST(N'2017-01-20' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (38, 33, 3567, 6228, N'MO_SHP_1', N'IACER006.KN2', N'W1', CAST(18.500 AS Decimal(10, 3)), CAST(N'2017-01-27' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (39, 34, 3567, 6229, N'MO_SHP_1', N'RFCAC001', N'W1', CAST(12.650 AS Decimal(10, 3)), CAST(N'2017-01-31' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (40, 35, 3567, 6230, N'MO_SHP_1', N'IBMIX003', N'13', CAST(0.234 AS Decimal(10, 3)), CAST(N'2017-02-01' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (41, 35, 3567, 6230, N'MO_SHP_1', N'IBMIX003', N'W1', CAST(3.216 AS Decimal(10, 3)), CAST(N'2017-02-02' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (42, 36, 3567, 6231, N'MO_SHP_1', N'RGITA001', N'W1', CAST(4.100 AS Decimal(10, 3)), CAST(N'2017-01-31' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (43, 37, 3567, 6232, N'MO_SHP_1', N'RFIRO001', N'W1', CAST(1.950 AS Decimal(10, 3)), CAST(N'2017-01-31' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (44, 38, 3567, 6233, N'MO_SHP_1', N'RJVEX001.KN2', N'W1', CAST(0.125 AS Decimal(10, 3)), CAST(N'2017-01-31' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (45, 39, 3567, 6234, N'MO_SHP_1', N'RBMAL002', N'W1', CAST(10.000 AS Decimal(10, 3)), CAST(N'2017-01-20' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleDetail] ([OracleDetailId], [OracleHeaderId], [MOHeaderId], [MOLineId], [MONumber], [ItemCode], [LotNo], [LotQty], [ExpirationDate], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (46, 40, 3567, 6235, N'MO_SHP_1', N'RFSOD002.KN3', N'W1', CAST(9.800 AS Decimal(10, 3)), CAST(N'2017-01-31' AS Date), 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[OracleDetail] OFF
SET IDENTITY_INSERT [dbo].[OracleHeader] ON 

INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (31, 3567, 6050, N'MO_SHP_1', 1, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RASMP001', N'SKIM MILK POWDER - 34 REGULER INFANT', NULL, N'KG', CAST(375.000 AS Decimal(10, 3)), 1, NULL, N'Tuang', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 0, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (32, 3567, 6051, N'MO_SHP_1', 2, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RASMP001', N'SKIM MILK POWDER - 34 REGULER INFANT', NULL, N'KG', CAST(18.500 AS Decimal(10, 3)), 1, CAST(3.700 AS Decimal(10, 3)), N'Tuang', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (33, 3567, 6228, N'MO_SHP_1', 3, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'IACER006.KN2', N'BASE - BERAS MERAH ORGANIK (KN2)', NULL, N'KG', CAST(18.500 AS Decimal(10, 3)), 2, CAST(3.700 AS Decimal(10, 3)), N'Tuang', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (34, 3567, 6229, N'MO_SHP_1', 4, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RFCAC001', N'CITRIC ACID - ANHYDROUS', NULL, N'KG', CAST(12.650 AS Decimal(10, 3)), 3, CAST(2.530 AS Decimal(10, 3)), N'Tuang', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (35, 3567, 6230, N'MO_SHP_1', 5, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'IBMIX003', N'PREMIX BLENDED - PRENAGEN POWDER 001', NULL, N'KG', CAST(3.450 AS Decimal(10, 3)), 4, CAST(0.690 AS Decimal(10, 3)), N'Tuang', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (36, 3567, 6231, N'MO_SHP_1', 6, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RGITA001', N'Vitamin C', NULL, N'KG', CAST(4.100 AS Decimal(10, 3)), 4, CAST(0.820 AS Decimal(10, 3)), N'Kocok 1', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (37, 3567, 6232, N'MO_SHP_1', 7, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RFIRO001', N'IRON - FERROUS FUMARATE', NULL, N'KG', CAST(1.950 AS Decimal(10, 3)), 4, CAST(0.390 AS Decimal(10, 3)), N'Kocok 1', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (38, 3567, 6233, N'MO_SHP_1', 8, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RJVEX001.KN2', N'VANILLA EXTRACT - POWDER (KN2)', NULL, N'KG', CAST(0.125 AS Decimal(10, 3)), 4, CAST(0.025 AS Decimal(10, 3)), N'Kocok 1', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (39, 3567, 6234, N'MO_SHP_1', 9, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RBMAL002', N'MALTODEXTRIN - DE 12', NULL, N'KG', CAST(10.000 AS Decimal(10, 3)), 4, CAST(2.000 AS Decimal(10, 3)), N'Kocok 1', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[OracleHeader] ([OracleHeaderId], [MOHeaderId], [MOLineId], [MoNumber], [LineNumber], [FromSubInventoryCode], [ToSubInventoryCode], [DateRequired], [SourceType], [DocNumber], [Customer], [ShipTo], [Requestor], [ItemCode], [ItemDesc], [ItemDescAlias], [UOM], [Qty], [UrutanTuang], [QtyPerCharge], [Activity], [CombineL1], [CombineL2], [PackingSize], [SelfLife], [IsTimbang], [IsClosedCode], [IsAllergen], [IsProcessed], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (40, 3567, 6235, N'MO_SHP_1', 10, N'FROM_SUB', N'FROM_SUB', CAST(N'2017-03-01' AS Date), N'BO', N'7241', NULL, NULL, NULL, N'RFSOD002.KN3', N'SODIUM - CHLORIDE (SHP) (KN3)', NULL, N'KG', CAST(9.800 AS Decimal(10, 3)), 4, CAST(1.960 AS Decimal(10, 3)), N'Kocok 1', NULL, NULL, CAST(25.000 AS Decimal(10, 3)), 7, 1, 0, 0, 1, N'[OanTech.System]', CAST(N'2017-02-28T10:01:06.243' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[OracleHeader] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (1, N'Administrator', 1, N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2, N'Koordinator', 1, N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (3, N'Operator', 1, N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[TaskTimbang] ON 

INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (1, N'432364475684', 31, 1, N'1 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T01', 123, CAST(N'2017-03-10T16:22:05.240' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T16:22:06.530' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2, N'441178624771', 31, 2, N'2 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T01', 123, CAST(N'2017-03-10T16:22:05.240' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T16:22:06.530' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (3, N'333491489902', 31, 3, N'3 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T01', 123, CAST(N'2017-03-10T16:22:05.240' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T16:22:06.530' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (4, N'607033454018', 31, 4, N'4 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T01', 123, CAST(N'2017-03-10T16:22:05.240' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T16:22:06.530' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (5, N'929903822135', 31, 5, N'5 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T01', 123, CAST(N'2017-03-10T16:22:05.240' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T16:22:06.530' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (6, N'821226797366', 31, 6, N'6 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T05', 123, CAST(N'2017-03-10T17:11:34.227' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:11:35.263' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (7, N'616848603115', 31, 7, N'7 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T05', 123, CAST(N'2017-03-10T17:11:34.227' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:11:35.263' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (8, N'763989729739', 31, 8, N'8 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T05', 123, CAST(N'2017-03-10T17:11:34.227' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:11:35.263' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (9, N'186181536603', 31, 9, N'9 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T05', 123, CAST(N'2017-03-10T17:11:34.227' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:11:35.263' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (10, N'243232642336', 31, 10, N'10 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, N'T05', 123, CAST(N'2017-03-10T17:11:34.227' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:11:35.263' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (11, N'194673900578', 31, 11, N'11 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, NULL, NULL, NULL, N'PREP', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:36:32.630' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (12, N'889395827227', 31, 12, N'12 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, NULL, NULL, NULL, N'PREP', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:36:32.630' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (13, N'674916833066', 31, 13, N'13 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, NULL, NULL, NULL, N'PREP', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:36:32.630' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (14, N'369648740815', 31, 14, N'14 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, NULL, NULL, NULL, N'PREP', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:36:32.630' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (15, N'783830556689', 31, 15, N'15 of 15', N'RASMP001', CAST(25.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'B', 0, 0, NULL, NULL, NULL, N'PREP', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:36:32.630' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (16, N'830981673303', 32, 16, N'1 of 5', N'RASMP001', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T03', 123, CAST(N'2017-03-10T17:16:27.667' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:16:28.487' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (17, N'104623647419', 32, 17, N'2 of 5', N'RASMP001', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T03', 123, CAST(N'2017-03-10T17:16:27.667' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:16:28.487' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (18, N'361675754143', 32, 18, N'3 of 5', N'RASMP001', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T03', 123, CAST(N'2017-03-10T17:16:27.667' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:16:28.487' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (19, N'906737938024', 32, 19, N'4 of 5', N'RASMP001', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T03', 123, CAST(N'2017-03-10T17:16:27.667' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:16:28.487' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (20, N'998050703255', 32, 20, N'5 of 5', N'RASMP001', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T03', 123, CAST(N'2017-03-10T17:16:27.667' AS DateTime), N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-10T17:16:28.487' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (21, N'534122977245', 33, 21, N'1 of 5', N'IACER006.KN2', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-27' AS Date), N'W1001', CAST(N'2017-01-27' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:30:26.867' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (22, N'329744984094', 33, 22, N'2 of 5', N'IACER006.KN2', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-27' AS Date), N'W1001', CAST(N'2017-01-27' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:30:26.867' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (23, N'437667617607', 33, 23, N'3 of 5', N'IACER006.KN2', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-27' AS Date), N'W1001', CAST(N'2017-01-27' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:30:26.867' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (24, N'223289524456', 33, 24, N'4 of 5', N'IACER006.KN2', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-27' AS Date), N'W1001', CAST(N'2017-01-27' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:30:26.867' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (25, N'380330740070', 33, 25, N'5 of 5', N'IACER006.KN2', CAST(3.700 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-27' AS Date), N'W1001', CAST(N'2017-01-27' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:30:26.867' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (26, N'122093773553', 34, 26, N'1 of 5', N'RFCAC001', CAST(2.530 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (27, N'496746747659', 34, 27, N'2 of 5', N'RFCAC001', CAST(2.530 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (28, N'346286005801', 34, 28, N'3 of 5', N'RFCAC001', CAST(2.530 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (29, N'348409870032', 34, 29, N'4 of 5', N'RFCAC001', CAST(2.530 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (30, N'761700687996', 34, 30, N'5 of 5', N'RFCAC001', CAST(2.530 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (31, N'025343652902', 35, 31, N'1 of 5', N'IBMIX003', CAST(0.690 AS Decimal(10, 3)), N'W1', CAST(N'2017-02-02' AS Date), N'W1001', CAST(N'2017-02-02' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:56:16.293' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (32, N'182494768636', 35, 32, N'2 of 5', N'IBMIX003', CAST(0.690 AS Decimal(10, 3)), N'W1', CAST(N'2017-02-02' AS Date), N'W1001', CAST(N'2017-02-02' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:56:16.293' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (33, N'249536884350', 35, 33, N'3 of 5', N'IBMIX003', CAST(0.690 AS Decimal(10, 3)), N'W1', CAST(N'2017-02-02' AS Date), N'W1001', CAST(N'2017-02-02' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:56:16.293' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (34, N'985608059340', 35, 34, N'4 of 5', N'IBMIX003', CAST(0.690 AS Decimal(10, 3)), N'W1', CAST(N'2017-02-02' AS Date), N'W1001', CAST(N'2017-02-02' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:56:16.293' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (35, N'887821823571', 35, 35, N'4 of 5', N'IBMIX003', CAST(0.690 AS Decimal(10, 3)), N'13', CAST(N'2017-02-01' AS Date), N'13001', CAST(N'2017-02-01' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T15:56:16.293' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (36, N'779143798702', 36, 36, N'1 of 5', N'RGITA001', CAST(0.820 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (37, N'936195805336', 36, 37, N'2 of 5', N'RGITA001', CAST(0.820 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (38, N'093236921050', 36, 38, N'3 of 5', N'RGITA001', CAST(0.820 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (39, N'788958937709', 36, 39, N'4 of 5', N'RGITA001', CAST(0.820 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (40, N'101159644673', 36, 40, N'5 of 5', N'RGITA001', CAST(0.820 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (41, N'268291860397', 37, 41, N'1 of 5', N'RFIRO001', CAST(0.390 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (42, N'109641028539', 37, 42, N'2 of 5', N'RFIRO001', CAST(0.390 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (43, N'317565741152', 37, 43, N'3 of 5', N'RFIRO001', CAST(0.390 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (44, N'474606868876', 37, 44, N'4 of 5', N'RFIRO001', CAST(0.390 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (45, N'169228874625', 37, 45, N'5 of 5', N'RFIRO001', CAST(0.390 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (46, N'228592765489', 38, 46, N'1 of 5', N'RJVEX001.KN2', CAST(0.025 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (47, N'904214772228', 38, 47, N'2 of 5', N'RJVEX001.KN2', CAST(0.025 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (48, N'854664930460', 38, 48, N'3 of 5', N'RJVEX001.KN2', CAST(0.025 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (49, N'277956747334', 38, 49, N'4 of 5', N'RJVEX001.KN2', CAST(0.025 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (50, N'590726104451', 38, 50, N'5 of 5', N'RJVEX001.KN2', CAST(0.025 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (51, N'285448021200', 39, 51, N'1 of 5', N'RBMAL002', CAST(2.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (52, N'608640838074', 39, 52, N'2 of 5', N'RBMAL002', CAST(2.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (53, N'493262844813', 39, 53, N'3 of 5', N'RBMAL002', CAST(2.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (54, N'334712002055', 39, 54, N'4 of 5', N'RBMAL002', CAST(2.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (55, N'757914819929', 39, 55, N'5 of 5', N'RBMAL002', CAST(2.000 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-20' AS Date), N'W1001', CAST(N'2017-01-20' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (56, N'442636735678', 40, 56, N'1 of 5', N'RFSOD002.KN3', CAST(1.960 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (57, N'393076993910', 40, 57, N'2 of 5', N'RFSOD002.KN3', CAST(1.960 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (58, N'188708900669', 40, 58, N'3 of 5', N'RFSOD002.KN3', CAST(1.960 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (59, N'038148168901', 40, 59, N'4 of 5', N'RFSOD002.KN3', CAST(1.960 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
INSERT [dbo].[TaskTimbang] ([TaskTimbangId], [Barcode], [OracleHeaderId], [Seq], [BagNo], [ItemCode], [Weight], [LotNo], [ExpirationDate], [NewLotNo], [NewExpirationDate], [Type], [IsAllergen], [IsTimbang], [TerminalId], [UserId], [ExecuteDate], [Status], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (60, N'823860174649', 40, 60, N'5 of 5', N'RFSOD002.KN3', CAST(1.960 AS Decimal(10, 3)), N'W1', CAST(N'2017-01-31' AS Date), N'W1001', CAST(N'2017-01-31' AS Date), N'K', 0, 1, N'T02', NULL, NULL, N'TMB', N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime), N'[OanTech.System]', CAST(N'2017-03-08T00:44:18.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaskTimbang] OFF
SET IDENTITY_INSERT [dbo].[TerminalActive] ON 

INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (1, N'T01', 2, N'1', CAST(N'2017-02-13T14:43:50.767' AS DateTime), NULL, N'Admin', CAST(N'2017-02-13T14:43:50.767' AS DateTime), N'Admin', CAST(N'2017-02-13T14:43:50.767' AS DateTime))
INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2, N'T02', 2, N'1', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (3, N'T03', 2, N'1', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (5, N'T04', 2, N'1', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (6, N'T05', 2, N'1', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (7, N'T06', 2, N'1', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (8, N'T07', 2, N'1', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalActive] ([TerminalActiveId], [TerminalId], [UserId], [Shift], [StartTime], [EndTime], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (9, N'T08', 2, N'1', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TerminalActive] OFF
SET IDENTITY_INSERT [dbo].[TerminalConfiguration] ON 

INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (1, N'T01', N'B', 1, N'Terminal Besar Cikampek', N'Ruang Timbang', 0, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2, N'T02', N'K', 1, N'Terminal Kecil', N'Ruang Timbang', 0, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (3, N'T03', N'K', 1, N'Terminal Kecil', N'Ruang Timbang', 0, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (6, N'T04', N'K', 2, N'Terminal Kecil', N'Ruang Timbang', 0, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (8, N'T05', N'B', 2, N'Terminal Besar', N'Ruang Timbang', 0, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (9, N'T06', N'B', 2, N'Terminal Besar', N'Ruang Timbang', 0, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (10, N'T07', N'B', 3, N'Terminal Besar', N'Ruang Allergen', 1, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TerminalConfiguration] ([TerminalConfigurationId], [TerminalId], [TerminalCategory], [TerminalGroup], [TerminalDescription], [TerminalLocation], [IsAllergen], [IsActive], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (11, N'T08', N'K', 3, N'Terminal Kecil', N'Ruang Allergen', 1, 1, N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Admin', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TerminalConfiguration] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserLoginCode], [UserLoginPin], [DisplayName], [Email], [PhoneNo], [IsActive], [IsLogin], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (2, N'0777', N'12345', N'Oscar Andrew', N'oscar.andrew@kalbenutritionals.com', N'08979877788', 1, 0, N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserRoleMapping] ON 

INSERT [dbo].[UserRoleMapping] ([UserRoleMappingId], [UserId], [RoleId], [UsrCrt], [DtmCrt], [UsrUpd], [DtmUpd]) VALUES (1, 2, 1, N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'Oscar', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserRoleMapping] OFF
ALTER TABLE [dbo].[ItemLotMasterSequence] ADD  CONSTRAINT [DF_ItemLotMasterSequence_Seq]  DEFAULT ((0)) FOR [Seq]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TaskTimbang] ADD  CONSTRAINT [DF_TaskTimbang_IsAllergen]  DEFAULT ((0)) FOR [IsAllergen]
GO
ALTER TABLE [dbo].[TerminalConfiguration] ADD  CONSTRAINT [DF_TerminalConfiguration_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OracleDetail]  WITH CHECK ADD  CONSTRAINT [FK_OracleDetail_OracleHeader] FOREIGN KEY([OracleHeaderId])
REFERENCES [dbo].[OracleHeader] ([OracleHeaderId])
GO
ALTER TABLE [dbo].[OracleDetail] CHECK CONSTRAINT [FK_OracleDetail_OracleHeader]
GO
ALTER TABLE [dbo].[RoleMenuMapping]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenuMapping_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([MenuId])
GO
ALTER TABLE [dbo].[RoleMenuMapping] CHECK CONSTRAINT [FK_RoleMenuMapping_Menu]
GO
ALTER TABLE [dbo].[RoleMenuMapping]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenuMapping_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[RoleMenuMapping] CHECK CONSTRAINT [FK_RoleMenuMapping_Role]
GO
ALTER TABLE [dbo].[TaskTimbang]  WITH CHECK ADD  CONSTRAINT [FK_TaskTimbang_OracleHeader] FOREIGN KEY([OracleHeaderId])
REFERENCES [dbo].[OracleHeader] ([OracleHeaderId])
GO
ALTER TABLE [dbo].[TaskTimbang] CHECK CONSTRAINT [FK_TaskTimbang_OracleHeader]
GO
ALTER TABLE [dbo].[UserRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleMapping_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoleMapping] CHECK CONSTRAINT [FK_UserRoleMapping_Role]
GO
ALTER TABLE [dbo].[UserRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleMapping_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRoleMapping] CHECK CONSTRAINT [FK_UserRoleMapping_User]
GO
