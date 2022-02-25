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
	DECLARE @PersonId int
	DECLARE @TaskCount int
	DECLARE @PersonCount int
	DECLARE @TaskPerPersonCount int
	
	DECLARE personLoop CURSOR FOR
	SELECT Id FROM Person WHERE Available = 1 AND HouseId = @HouseId ORDER BY newid();


	-- Insert work items without assignee into Work table
	INSERT INTO Work (TaskId, DueDate)
	(SELECT TaskId, DueDate FROM (
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, 1) AS DueDate FROM Task WHERE (DaysBF & 1) = 1
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, 2) AS DueDate FROM Task WHERE (DaysBF & 2) = 2
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, 4) AS DueDate FROM Task WHERE (DaysBF & 4) = 4
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, 8) AS DueDate FROM Task WHERE (DaysBF & 8) = 8
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, 16) AS DueDate FROM Task WHERE (DaysBF & 16) = 16
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, 32) AS DueDate FROM Task WHERE (DaysBF & 32) = 32
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, 64) AS DueDate FROM Task WHERE (DaysBF & 64) = 64
	) AS X
	WHERE RoomId IN (SELECT Id FROM Room WHERE HouseId = @HouseId));

	-- Get count of unassigned work items
	SELECT @TaskCount = Count(*) FROM Work WHERE AssigneeId is null;

	-- Get count of available persons
	SELECT @PersonCount = Count(*) FROM Person WHERE Available = 1 AND HouseId = @HouseId;

	-- Get the count of tasks per person
	SELECT @TaskPerPersonCount = @TaskCount / @PersonCount;


	-- Loop through available people and assign them random work items
	OPEN personLoop
	FETCH NEXT FROM personLoop INTO @PersonId

	WHILE @@FETCH_STATUS=0 BEGIN
		
		UPDATE Work
		SET AssigneeId = @PersonId
		WHERE Id IN (SELECT TOP (@TaskPerPersonCount) Id FROM Work WHERE AssigneeId is null order by newid());

		FETCH NEXT FROM personLoop INTO @PersonId
	END

	CLOSE personLoop
	OPEN personLoop
	FETCH NEXT FROM personLoop INTO @PersonId

	-- Assign remaining work items (missed due to fractional component of @TaskPerPersonCount)
	WHILE @@FETCH_STATUS=0 BEGIN
		
		UPDATE Work
		SET AssigneeId = @PersonId
		WHERE Id IN (SELECT TOP 1 Id FROM Work WHERE AssigneeId is null order by newid());

		FETCH NEXT FROM personLoop INTO @PersonId
	END

	CLOSE personLoop
	DEALLOCATE personLoop

END
GO

EXECUTE AutoAssignTasks @HouseId = 2, @StartOfWeekDate = '2022-02-28'
GO