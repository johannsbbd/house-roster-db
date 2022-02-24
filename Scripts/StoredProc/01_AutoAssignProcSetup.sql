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
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 1) AS DueDate FROM Task WHERE (DaysBF & 1) = 1
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 2) AS DueDate FROM Task WHERE (DaysBF & 2) = 2
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 4) AS DueDate FROM Task WHERE (DaysBF & 4) = 4
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 8) AS DueDate FROM Task WHERE (DaysBF & 8) = 8
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 16) AS DueDate FROM Task WHERE (DaysBF & 16) = 16
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 32) AS DueDate FROM Task WHERE (DaysBF & 32) = 32
		UNION ALL
		SELECT Id AS TaskId, RoomId, dbo.udfGetDateFromBF(@StartOfWeekDate, DaysBF, 64) AS DueDate FROM Task WHERE (DaysBF & 64) = 64
	) AS X
	WHERE RoomId IN (SELECT Id FROM Room WHERE HouseId = @HouseId));

	-- Get count of unassigned work items
	SELECT @TaskCount = Count(*) FROM Work WHERE AssigneeId is null;

	-- Get count of available persons
	SELECT @PersonCount = Count(*) FROM Person WHERE Available = 1 AND HouseId = @HouseId;

	-- Get the count of tasks per person (ceil to ensure that we always assign all tasks)
	SELECT @TaskPerPersonCount = CEILING(Cast(@TaskCount As Float) / @PersonCount);


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
	DEALLOCATE personLoop

END
GO

EXECUTE AutoAssignTasks @HouseId = 1, @StartOfWeekDate = '2022-02-28'
EXECUTE AutoAssignTasks @HouseId = 1, @StartOfWeekDate = '2022-03-07'
EXECUTE AutoAssignTasks @HouseId = 1, @StartOfWeekDate = '2022-03-14'
GO