CREATE VIEW ViewHouseSummary AS 
SELECT House.Id, 
	   House.HouseName,
	   COUNT(Room.HouseId) as TotalRooms,
	   COUNT(Person.Id) as TotalPeople,
	   COUNT(Work.Id) as TotalWork
FROM House
INNER JOIN Person
ON Person.HouseId = House.Id
INNER JOIN Room
ON Room.HouseId = House.Id
INNER JOIN Task
ON Task.RoomId = Room.Id
INNER JOIN Work
ON Work.TaskId = Task.Id

GO 