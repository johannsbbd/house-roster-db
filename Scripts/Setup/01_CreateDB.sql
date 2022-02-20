USE master;
GO

-- Clean start
IF EXISTS(select * from sys.databases where name='HouseRoster') BEGIN
	DROP DATABASE HouseRoster;
END;


-- Create DB
CREATE DATABASE HouseRoster;
GO

USE HouseRoster;
GO

-- House
CREATE TABLE House (
	Id int IDENTITY(1,1) PRIMARY KEY,
	HouseName VARCHAR(100) NOT NULL,
	HouseDesc VARCHAR(255) NULL
);
GO

-- Person
CREATE TABLE Person (
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NULL,
	PersonType int NOT NULL,
	HouseId int FOREIGN KEY REFERENCES House(Id) NOT NULL
);
GO

-- Room
CREATE TABLE Room (
	Id int IDENTITY(1,1) PRIMARY KEY,
	RoomName VARCHAR(100) NOT NULL,
	RoomDesc VARCHAR(255) NULL,
	HouseId int FOREIGN KEY REFERENCES House(Id) NOT NULL
);
GO

-- Task
CREATE TABLE Task (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TaskDesc VARCHAR(255) NOT NULL,
	RoomId int FOREIGN KEY REFERENCES Room(Id) NOT NULL
);
GO

-- Work
CREATE TABLE Work (
	Id int IDENTITY(1,1) PRIMARY KEY,
	WorkStatus int NOT NULL,
	DueDate Date NOT NULL,
	DoneDate Date NULL,
	AssigneeId int FOREIGN KEY REFERENCES Person(Id),
	WorkDoneById int FOREIGN KEY REFERENCES Person(Id),
	TaskId int FOREIGN KEY REFERENCES Task(Id)
);

-- Work Template
CREATE TABLE WorkTemplate (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TemplateName VARCHAR(100) NOT NULL,
	TemplateDesc VARCHAR(255) NULL
);

-- Work Template Tasks
CREATE TABLE WorkTemplateTask (
	Id int IDENTITY(1,1) PRIMARY KEY,
	DayOfWeekOffset int NOT NULL,
	TimeOfDay Time NOT NULL,
	AssigneeId int FOREIGN KEY REFERENCES Person(Id),
	TaskId int FOREIGN KEY REFERENCES Task(Id),
	WorkTemplateId int FOREIGN KEY REFERENCES WorkTemplate(Id)
);
GO

ALTER TABLE WorkTemplateTask
ADD CONSTRAINT UniqueTemplateTask UNIQUE (TaskId, WorkTemplateId);