USE HouseRoster;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'AutoAssignTasks') BEGIN
	DROP PROCEDURE AutoAssignTasks
END
GO

CREATE PROCEDURE AutoAssignTasks
@HouseId int,
@StartOfWeekDate Date
AS
BEGIN
	
	INSERT INTO Work (TaskId, DueDate)
	SELECT Id AS TaskId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 1) AS DueDate FROM Task WHERE (DaysBF & 1) = 1
	UNION ALL
	SELECT Id AS TaskId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 2) AS DueDate FROM Task WHERE (DaysBF & 2) = 2
	UNION ALL
	SELECT Id AS TaskId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 4) AS DueDate FROM Task WHERE (DaysBF & 4) = 4
	UNION ALL
	SELECT Id AS TaskId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 8) AS DueDate FROM Task WHERE (DaysBF & 8) = 8
	UNION ALL
	SELECT Id AS TaskId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 16) AS DueDate FROM Task WHERE (DaysBF & 16) = 16
	UNION ALL
	SELECT Id AS TaskId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 32) AS DueDate FROM Task WHERE (DaysBF & 32) = 32
	UNION ALL
	SELECT Id AS TaskId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 64) AS DueDate FROM Task WHERE (DaysBF & 64) = 64

	UPDATE Work
	SET AssigneeId = (SELECT TOP 1 Id FROM Person WHERE Available = 1 AND HouseId = @HouseId ORDER BY newid())
	WHERE AssigneeId is null;

END
GO

EXECUTE AutoAssignTasks @HouseId = 1, @StartOfWeekDate = '2022-02-28'