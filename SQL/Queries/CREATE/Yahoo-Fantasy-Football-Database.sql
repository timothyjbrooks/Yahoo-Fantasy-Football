USE [master]
GO
/****** Object:  Database [FantasyFootball]    Script Date: 9/23/2021 3:07:10 PM ******/
CREATE DATABASE [FantasyFootball]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FantasyFootball', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FantasyFootball.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FantasyFootball_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FantasyFootball_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FantasyFootball] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FantasyFootball].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FantasyFootball] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FantasyFootball] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FantasyFootball] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FantasyFootball] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FantasyFootball] SET ARITHABORT OFF 
GO
ALTER DATABASE [FantasyFootball] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FantasyFootball] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FantasyFootball] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FantasyFootball] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FantasyFootball] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FantasyFootball] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FantasyFootball] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FantasyFootball] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FantasyFootball] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FantasyFootball] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FantasyFootball] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FantasyFootball] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FantasyFootball] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FantasyFootball] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FantasyFootball] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FantasyFootball] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FantasyFootball] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FantasyFootball] SET RECOVERY FULL 
GO
ALTER DATABASE [FantasyFootball] SET  MULTI_USER 
GO
ALTER DATABASE [FantasyFootball] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FantasyFootball] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FantasyFootball] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FantasyFootball] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FantasyFootball] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FantasyFootball] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FantasyFootball', N'ON'
GO
ALTER DATABASE [FantasyFootball] SET QUERY_STORE = OFF
GO
USE [FantasyFootball]
GO
/****** Object:  Table [dbo].[FantasyManager]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FantasyManager](
	[FantasyManagerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[YearStarted] [smallint] NULL,
	[Rating] [int] NULL,
	[Trophies] [int] NULL,
 CONSTRAINT [PK_FantasyManager_FantasyManagerID] PRIMARY KEY CLUSTERED 
(
	[FantasyManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FantasyTeam]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FantasyTeam](
	[FantasyTeamID] [int] IDENTITY(1,1) NOT NULL,
	[FantasyManagerID] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_FantasyTeam_FantasyTeamID] PRIMARY KEY CLUSTERED 
(
	[FantasyTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ManagerTeam]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_ManagerTeam] AS
SELECT [FantasyManager].[Name] AS Manager, [dbo].[FantasyTeam].[Name] AS 'TeamName' 
FROM [dbo].[FantasyTeam] JOIN [dbo].[FantasyManager] ON [dbo].[FantasyTeam].[FantasyManagerID] = [dbo].[FantasyManager].[FantasyManagerID]
GO
/****** Object:  Table [dbo].[DefensiveStatistic]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefensiveStatistic](
	[DefensiveStatisticID] [int] IDENTITY(1,1) NOT NULL,
	[FootballPlayerID] [int] NULL,
	[Week] [int] NOT NULL,
	[Season] [varchar](12) NOT NULL,
	[ReturnTouchdowns] [int] NULL,
	[SoloTackles] [int] NULL,
	[AssistTackles] [int] NULL,
	[TacklesForLoss] [int] NULL,
	[Sacks] [int] NULL,
	[Safties] [int] NULL,
	[PassesDefended] [int] NULL,
	[BlockedKicks] [int] NULL,
	[Interceptions] [int] NULL,
	[ForcedFumbles] [int] NULL,
	[FumbleRecoveries] [int] NULL,
	[ReturnYards] [int] NULL,
	[DefensiveTouchdowns] [int] NULL,
 CONSTRAINT [PK_DefensiveStatistic_DefensiveStatisticID] PRIMARY KEY CLUSTERED 
(
	[DefensiveStatisticID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FantasyStatistic]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FantasyStatistic](
	[FantasyStatisticID] [int] IDENTITY(1,1) NOT NULL,
	[FootballPlayerID] [int] NULL,
	[Week] [int] NOT NULL,
	[Season] [varchar](12) NOT NULL,
	[FantasyPoints] [float] NULL,
	[ProjectedPoints] [float] NULL,
	[StartPercentage] [float] NULL,
 CONSTRAINT [PK_FantasyStatistic_FantasyStatisticID] PRIMARY KEY CLUSTERED 
(
	[FantasyStatisticID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FantasyTeam_x_FootballPlayer]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FantasyTeam_x_FootballPlayer](
	[FantasyTeam_X_FootballPlayerID] [int] IDENTITY(1,1) NOT NULL,
	[FootballPlayerID] [int] NOT NULL,
	[FantasyTeamID] [int] NOT NULL,
 CONSTRAINT [PK_FantasyTeam_x_FootballPlayer_FantasyTeam_x_FootballPlayerID] PRIMARY KEY CLUSTERED 
(
	[FantasyTeam_X_FootballPlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FantasyTeam_X_FootballPlayer] UNIQUE NONCLUSTERED 
(
	[FootballPlayerID] ASC,
	[FantasyTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldGoal]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldGoal](
	[FieldGoalID] [int] IDENTITY(1,1) NOT NULL,
	[KickerStatisticID] [int] NULL,
	[Attempt] [int] NULL,
	[Distance] [int] NULL,
 CONSTRAINT [PK__FieldGoal_FieldGoalID] PRIMARY KEY CLUSTERED 
(
	[FieldGoalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FootballPlayer]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FootballPlayer](
	[FootballPlayerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](35) NULL,
	[LastName] [varchar](35) NULL,
	[Position] [varchar](5) NULL,
	[NFLTeam] [varchar](50) NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_FootballPlayer_FootballPlayerID] PRIMARY KEY CLUSTERED 
(
	[FootballPlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KickerStatistic]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KickerStatistic](
	[KickerStatisticID] [int] IDENTITY(1,1) NOT NULL,
	[FootballPlayerID] [int] NULL,
	[Week] [int] NOT NULL,
	[Season] [varchar](12) NOT NULL,
	[PointsAfterTouchdown] [int] NULL,
 CONSTRAINT [PK_KickerStatistic_KickerStatisticID] PRIMARY KEY CLUSTERED 
(
	[KickerStatisticID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OffensiveStatistic]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OffensiveStatistic](
	[OffensiveStatisticID] [int] IDENTITY(1,1) NOT NULL,
	[FootballPlayerID] [int] NULL,
	[Week] [int] NOT NULL,
	[Season] [varchar](12) NOT NULL,
	[PassingYards] [int] NULL,
	[PassingTouchdowns] [int] NULL,
	[Interceptions] [int] NULL,
	[RushingAttempts] [int] NULL,
	[RushingYards] [int] NULL,
	[RushingTouchdowns] [int] NULL,
	[Receptions] [int] NULL,
	[ReceivingYards] [int] NULL,
	[ReceivingTouchdowns] [int] NULL,
	[ReturnTouchdowns] [int] NULL,
	[TwoPointConverversions] [int] NULL,
	[FumblesLost] [int] NULL,
 CONSTRAINT [PK__OffensiveStatistic_OffensiveStatisticID] PRIMARY KEY CLUSTERED 
(
	[OffensiveStatisticID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [ReturnTouchdowns]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [SoloTackles]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [AssistTackles]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [TacklesForLoss]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [Sacks]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [Safties]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [PassesDefended]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [BlockedKicks]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [Interceptions]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [ForcedFumbles]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [FumbleRecoveries]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [ReturnYards]
GO
ALTER TABLE [dbo].[DefensiveStatistic] ADD  DEFAULT ((0)) FOR [DefensiveTouchdowns]
GO
ALTER TABLE [dbo].[FantasyManager] ADD  DEFAULT ((600)) FOR [Rating]
GO
ALTER TABLE [dbo].[FantasyManager] ADD  DEFAULT ((0)) FOR [Trophies]
GO
ALTER TABLE [dbo].[FantasyStatistic] ADD  DEFAULT ((0.0)) FOR [FantasyPoints]
GO
ALTER TABLE [dbo].[FantasyStatistic] ADD  DEFAULT ((0.0)) FOR [ProjectedPoints]
GO
ALTER TABLE [dbo].[FantasyStatistic] ADD  DEFAULT ((0.0)) FOR [StartPercentage]
GO
ALTER TABLE [dbo].[FieldGoal] ADD  DEFAULT ((0)) FOR [Attempt]
GO
ALTER TABLE [dbo].[FieldGoal] ADD  DEFAULT ((0)) FOR [Distance]
GO
ALTER TABLE [dbo].[KickerStatistic] ADD  DEFAULT ((0)) FOR [PointsAfterTouchdown]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [PassingYards]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [PassingTouchdowns]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [Interceptions]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [RushingAttempts]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [RushingYards]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [RushingTouchdowns]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [Receptions]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [ReceivingYards]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [ReceivingTouchdowns]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [ReturnTouchdowns]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [TwoPointConverversions]
GO
ALTER TABLE [dbo].[OffensiveStatistic] ADD  DEFAULT ((0)) FOR [FumblesLost]
GO
ALTER TABLE [dbo].[DefensiveStatistic]  WITH CHECK ADD  CONSTRAINT [FK_DefensiveStatistic_FootballPlayerID] FOREIGN KEY([FootballPlayerID])
REFERENCES [dbo].[FootballPlayer] ([FootballPlayerID])
GO
ALTER TABLE [dbo].[DefensiveStatistic] CHECK CONSTRAINT [FK_DefensiveStatistic_FootballPlayerID]
GO
ALTER TABLE [dbo].[FantasyStatistic]  WITH CHECK ADD  CONSTRAINT [FK_FantasyStatistic_FootballPlayerID] FOREIGN KEY([FootballPlayerID])
REFERENCES [dbo].[FootballPlayer] ([FootballPlayerID])
GO
ALTER TABLE [dbo].[FantasyStatistic] CHECK CONSTRAINT [FK_FantasyStatistic_FootballPlayerID]
GO
ALTER TABLE [dbo].[FantasyTeam]  WITH CHECK ADD  CONSTRAINT [FK_FantasyTeam_FantasyManagerID] FOREIGN KEY([FantasyManagerID])
REFERENCES [dbo].[FantasyManager] ([FantasyManagerID])
GO
ALTER TABLE [dbo].[FantasyTeam] CHECK CONSTRAINT [FK_FantasyTeam_FantasyManagerID]
GO
ALTER TABLE [dbo].[FantasyTeam_x_FootballPlayer]  WITH CHECK ADD  CONSTRAINT [FK_FantasyTeam_x_FootballPlayer_FantasyTeamID] FOREIGN KEY([FantasyTeamID])
REFERENCES [dbo].[FantasyTeam] ([FantasyTeamID])
GO
ALTER TABLE [dbo].[FantasyTeam_x_FootballPlayer] CHECK CONSTRAINT [FK_FantasyTeam_x_FootballPlayer_FantasyTeamID]
GO
ALTER TABLE [dbo].[FantasyTeam_x_FootballPlayer]  WITH CHECK ADD  CONSTRAINT [FK_FantasyTeam_x_FootballPlayer_FootBallPlayerID] FOREIGN KEY([FootballPlayerID])
REFERENCES [dbo].[FootballPlayer] ([FootballPlayerID])
GO
ALTER TABLE [dbo].[FantasyTeam_x_FootballPlayer] CHECK CONSTRAINT [FK_FantasyTeam_x_FootballPlayer_FootBallPlayerID]
GO
ALTER TABLE [dbo].[FieldGoal]  WITH CHECK ADD  CONSTRAINT [FK_FieldGoal_KickerStatisticID] FOREIGN KEY([KickerStatisticID])
REFERENCES [dbo].[KickerStatistic] ([KickerStatisticID])
GO
ALTER TABLE [dbo].[FieldGoal] CHECK CONSTRAINT [FK_FieldGoal_KickerStatisticID]
GO
ALTER TABLE [dbo].[KickerStatistic]  WITH CHECK ADD  CONSTRAINT [FK_KickerStatistic_FootballPlayerID] FOREIGN KEY([FootballPlayerID])
REFERENCES [dbo].[FootballPlayer] ([FootballPlayerID])
GO
ALTER TABLE [dbo].[KickerStatistic] CHECK CONSTRAINT [FK_KickerStatistic_FootballPlayerID]
GO
ALTER TABLE [dbo].[OffensiveStatistic]  WITH CHECK ADD  CONSTRAINT [FK_OffensiveStatistic_FootballPlayerID] FOREIGN KEY([FootballPlayerID])
REFERENCES [dbo].[FootballPlayer] ([FootballPlayerID])
GO
ALTER TABLE [dbo].[OffensiveStatistic] CHECK CONSTRAINT [FK_OffensiveStatistic_FootballPlayerID]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddPlayer]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddPlayer]
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@FantasyTeamName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @FootballPlayerID INT
	DECLARE @FantasyTeamID INT
	SET @FootballPlayerID = (SELECT TOP (1) [FootballPlayerID] FROM [dbo].[FootballPlayer] where [FirstName] = @FirstName AND [LastName] = @LastName)
	SET @FantasyTeamID = (SELECT TOP (1) [FantasyTeamID] FROM [dbo].[FantasyTeam] where [Name] = @FantasyTeamName)
	INSERT INTO [dbo].[FantasyTeam_x_FootballPlayer] ([FootballPlayerID],[FantasyTeamID]) VALUES (@FootballPlayerID, @FantasyTeamID)
    -- Insert statements for procedure here

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DropPlayer]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DropPlayer]
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50),
	@LastName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @FootballPlayerID INT
	SET @FootballPlayerID = (SELECT TOP (1) FootballPlayerID FROM FootballPlayer where FirstName = @FirstName AND LastName = @LastName)
	DELETE FantasyTeam_x_FootballPlayer WHERE [FootballPlayerID] = @FootballPlayerID
    -- Insert statements for procedure here

END
GO
/****** Object:  StoredProcedure [dbo].[usp_FantasyRoster]    Script Date: 9/23/2021 3:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_FantasyRoster]
    @FantasyTeam nvarchar(50)
AS   
    SET NOCOUNT ON;  
SELECT [FootballPlayer].[FirstName], [FootballPlayer].[LastName],[FootballPlayer].[Position],[FootballPlayer].[NFLTeam], [FootballPlayer].[Status], [FantasyTeam].[Name] AS 'FantasyTeam'
  FROM [FantasyTeam_X_FootballPlayer]
  JOIN [FootballPlayer] ON [FantasyTeam_X_FootballPlayer].[FootballPlayerID] = [FootballPlayer].[FootballPlayerID]
  JOIN [FantasyTeam] ON [FantasyTeam_X_FootballPlayer].[FantasyTeamID] = [FantasyTeam].[FantasyTeamID]
  WHERE [FantasyTeam].[Name] = @FantasyTeam
GO
USE [master]
GO
ALTER DATABASE [FantasyFootball] SET  READ_WRITE 
GO
