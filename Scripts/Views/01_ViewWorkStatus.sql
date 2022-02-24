CREATE VIEW ViewWorkStatus AS 
SELECT Person.FirstName, 
	   Person.LastName,
	   Room.HouseId,
	   Room.RoomName,
	   Task.TaskDesc,
	   DueDate,
	   dbo.udfWorkStatus(Work.DueDate, Work.DoneDate) as WorkStatus
FROM Person
JOIN Work
ON Person.Id = Work.AssigneeId
JOIN Task
ON Task.Id = Work.TaskId
JOIN Room
ON Room.Id = Task.RoomId

GO 