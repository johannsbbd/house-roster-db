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
	HouseName VARCHAR(100) NOT NULL
);
GO

-- Person
CREATE TABLE Person (
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NULL,
	PersonType VARCHAR(20) NOT NULL CHECK (PersonType IN('GUARDIAN', 'NORMAL')),
	HouseId int FOREIGN KEY REFERENCES House(Id) NOT NULL
);
GO

-- Room
CREATE TABLE Room (
	Id int IDENTITY(1,1) PRIMARY KEY,
	RoomName VARCHAR(100) NOT NULL,
	HouseId int FOREIGN KEY REFERENCES House(Id) NOT NULL
);
GO

-- Task
CREATE TABLE Task (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TaskDesc VARCHAR(500) NOT NULL,
	RoomId int FOREIGN KEY REFERENCES Room(Id) NOT NULL,
	TaskDaysBF int NOT NULL
);
GO

-- Work
CREATE TABLE Work (
	Id int IDENTITY(1,1) PRIMARY KEY,
	DueDate Date NOT NULL,
	DoneDate Date NULL,
	AssigneeId int FOREIGN KEY REFERENCES Person(Id),
	WorkDoneById int FOREIGN KEY REFERENCES Person(Id),
	TaskId int FOREIGN KEY REFERENCES Task(Id)
);