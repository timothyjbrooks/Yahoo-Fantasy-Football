USE [FantasyFootball]
GO

/****** Object:  Trigger [dbo].[TR_Schedule_BI]    Script Date: 9/25/2021 6:36:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER TRIGGER [dbo].[TR_Schedule_BI]
ON [dbo].[Schedule]
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Team NVARCHAR(50),@Week INT, @Season NVARCHAR(15), @Opponent NVARCHAR(50)
	SELECT @Team = [Team], @Week = [Week], @Season = [Season], @Opponent = [Opponent]
	FROM [Inserted]
	WHERE EXISTS (SELECT *
                  FROM [Schedule],[Inserted]
                  WHERE [Schedule].[Opponent] = [Inserted].[Team] AND [Schedule].[Team] = [Inserted].[Opponent] AND [Schedule].[Week] = [Inserted].[Week] AND [Schedule].[Season] = [Inserted].[Season]);
	IF (@Team IS NOT NULL)
    BEGIN
		SET NOCOUNT ON
		RAISERROR('There can be only one combination.',11,1)
	END
    ELSE
		BEGIN
			SET NOCOUNT OFF
			SELECT @Team = [Team], @Week = [Week], @Season = [Season], @Opponent = [Opponent]
			FROM [Inserted]
			INSERT INTO [Schedule] VALUES (@Team, @Week, @Season, @Opponent)
		END
END;
GO
