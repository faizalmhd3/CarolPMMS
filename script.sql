USE [BCPTrackerDB]
GO
/****** Object:  Table [dbo].[AssociateActual]    Script Date: 12/3/2019 4:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssociateActual](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ProdID] [nvarchar](50) NULL,
	[ActualCategory] [int] NULL,
	[WO] [nvarchar](max) NULL,
	[EventActualId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssociatePlanning]    Script Date: 12/3/2019 4:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssociatePlanning](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ProdID] [nvarchar](50) NULL,
	[PlannedCategory] [int] NULL,
	[WO] [nvarchar](max) NULL,
	[EventPlanningId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 12/3/2019 4:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Facilities] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventActual]    Script Date: 12/3/2019 4:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventActual](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Planned] [int] NULL,
	[UnPlanned] [int] NULL,
	[WFH] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[EventDetailID] [int] NULL,
	[WFO] [int] NULL,
	[AdditionalComments] [nvarchar](max) NULL,
	[CompensationPlan] [nvarchar](max) NULL,
	[IsSubmitted] [bit] NULL,
 CONSTRAINT [PK_EventActual] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventCategory]    Script Date: 12/3/2019 4:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCategory](
	[ID] [int] NULL,
	[Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventDetail]    Script Date: 12/3/2019 4:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NULL,
	[LOB] [nvarchar](max) NULL,
	[WO] [nvarchar](max) NULL,
	[WODesc] [nvarchar](max) NULL,
	[FacilityWiseCount] [nvarchar](max) NULL,
	[IsLaptopUserAllowed] [bit] NULL,
	[LaptopUserCount] [int] NULL,
	[UserID] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[TotalResource] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventPlanning]    Script Date: 12/3/2019 4:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPlanning](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Planned] [int] NULL,
	[UnPlanned] [int] NULL,
	[WFH] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[EventDetailID] [int] NULL,
	[WFO] [int] NULL,
	[AdditionalComments] [nvarchar](max) NULL,
	[CompensationPlan] [nvarchar](max) NULL,
	[IsSubmitted] [bit] NULL,
 CONSTRAINT [PK_EventPlanning] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Event] ADD  CONSTRAINT [DF_Event_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EventActual] ADD  CONSTRAINT [DF_EventActualg_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[EventPlanning] ADD  CONSTRAINT [DF_EventPlanning_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
