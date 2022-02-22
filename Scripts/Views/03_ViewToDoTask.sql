CREATE VIEW ToDoTask AS 
SELECT Person.FirstName, 
	   Person.LastName, 
	   Room.RoomName,
	   Task.TaskDesc,
	   DueDate,
	   WorkStatus
FROM Person
JOIN Work
ON Person.Id = Work.AssigneeId
JOIN Task
ON Task.Id = Work.TaskId
JOIN Room
ON Room.Id = Task.RoomId
WHERE WorkStatus = 'TODO';

GO 

Select * from ToDoTask;
