USE HouseRoster;
GO

DROP FUNCTION IF EXISTS udfFetchUserTasks;
GO

CREATE FUNCTION udfFetchUserTasks(@PersonID int)
RETURNS TABLE AS
  RETURN SELECT 
    p.FirstName,
	p.LastName,
	p.PersonType,
	p.Available,
	Task.TaskDesc AS [Description],
	Room.RoomName,
	w.DueDate,
	w.DoneDate,
	CompletedBy.FirstName + ' ' + CompletedBy.LastName AS Completed
  FROM Person AS p
  INNER JOIN Work AS w ON w.AssigneeId = p.Id
  RIGHT JOIN Task ON w.TaskId = Task.Id
  RIGHT JOIN Room ON Task.RoomId = Room.Id
  RIGHT JOIN Person AS CompletedBy ON w.WorkDoneById = CompletedBy.Id
  WHERE p.Id = @PersonID
GO

SELECT * FROM udfFetchUserTasks(5)