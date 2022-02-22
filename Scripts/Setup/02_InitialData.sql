-- Insert into house table
INSERT INTO House
           (HouseName
           )
VALUES    ('The Mays'), 
    ('Mkhize House'), 
    ('Chocho Crib'), 
    ('Schepers Home'), 
    ('Smiths'), 
    ('Terblanches Temple') 
GO

-- Insert into person table
INSERT INTO Person
           (FirstName
           ,LastName
           ,PersonType
           ,HouseId
           ) 
VALUES    ('Thandile','May','GUARDIAN',1), 
    ('Thobelani','May', 'GUARDIAN',1), 
    ('Sindi','May', 'NORMAL',1), 
    ('Lwazi','May', 'NORMAL',1), 
    ('Thabo','May', 'NORMAL',1), 
    ('Sarah','Mkhize', 'GUARDIAN',2), 
    ('John','Mkhize', 'NORMAL',2), 
    ('Tim','Mkhize', 'NORMAL',2), 
    ('Tina','MKhize', 'NORMAL',2), 
    ('Nancy','Chocho', 'NORMAL',3),
    ('Jim','Chocho', 'NORMAL',3),
    ('Jeffery','Chocho', 'GUARDIAN',3),
    ('Sihle','Chocho', 'NORMAL',3),
    ('Toby','Chocho', 'NORMAL',3),
    ('Tobey','Chocho', 'NORMAL',3),
    ('Jennifer','Schepers', 'GUARDIAN',4),
    ('Tom','Schepers', 'GUARDIAN',4),
    ('Seth','Schepers', 'NORMAL',4),
    ('Tony','Schepers', 'NORMAL',4),
    ('Josh','Schepers', 'NORMAL',4),
    ('Anne','Schepers', 'NORMAL',4),
    ('Andrew','Smiths', 'GUARDIAN',5),
    ('Martha','Smiths', 'GUARDIAN',5),
    ('Kenneth','Smiths', 'NORMAL',5),
    ('Kobey','Smiths', 'NORMAL',5),
    ('Mary','Smiths', 'NORMAL',5),
    ('Zama','Terblanche', 'GUARDIAN',6),
    ('Tshepo','Terblanche', 'NORMAL',6),
    ('Zoe','Terblanche', 'NORMAL',6)
GO

-- Insert into room table
INSERT INTO Room
           (RoomName
           ,HouseId
           )
VALUES    ('Kitchen', 1), 
    ('Living Room', 1), 
    ('Bathroom', 1), 
    ('Main bedroom', 1), 
    ('Boys room', 1), 
    ('Sindis room', 1), 
    ('Main bedroom', 2), 
    ('Kids room', 2), 
    ('Kitchen', 2), 
    ('Lounge', 2), 
    ('Bathroom', 2) 
GO

-- Insert into task table
INSERT INTO Task
           (RoomId
           ,TaskDesc
           )
VALUES    (1,'mop the floors'), 
    (2,'Vaccum the couches'), 
    (3,'Wipe the mirror'), 
    (5, 'Put away toys'), 
    (6, 'fold clothes'), 
    (7,'just collect the laundry'), 
    (8,'fold blankets please'), 
    (9,'use one pod for the dishwasher!'), 
    (10, 'dust the shelves'), 
    (11, 'Main bathroom downstairs') 
GO

-- Insert into work  table
INSERT INTO Work
           (TaskId
           ,AssigneeId
           ,WorkDoneById
           ,WorkStatus 
           ,DueDate
           ,DoneDate
           )
VALUES    (1, 3, 3, 'DONE', '2022-02-12', '2022-02-12'),
    (2, 4, 4, 'DONE', '2022-02-13', '2022-02-13'),
    (3, 5, 5, 'DONE', '2022-02-15', '2022-02-16'),
    (2, 3, 5, 'DONE', '2022-02-15', '2022-02-17'),
    (5, 4, 3, 'DONE', '2022-02-20', '2022-02-20'),
    (4, 5, NULL, 'TODO', '2022-03-22', NULL),
    (6, 7, 7, 'DONE', '2022-02-13', '2022-02-13'),
    (9, 7, 8, 'DONE', '2022-02-15', '2022-02-16'),
    (8, 8, NULL, 'FAILED', '2022-02-03', NULL),
    (10, 9, NULL, 'TODO', '2022-03-20', NULL)
GO

-- Insert into task day table
INSERT INTO TaskDay
           (TaskId
           ,TaskDay
           )
VALUES    (1,'Monday'), 
    (2,'Tuesday'), 
    (2,'Wednesday'), 
    (5, 'Wednesday'), 
    (6, 'Thursday'), 
    (7,'Sunday'), 
    (8,'Saturday'), 
    (9,'Friday'), 
    (10, 'Monday'), 
    (5, 'Sunday'), 
    (3,'Saturday'), 
    (8,'Friday'), 
    (6, 'Monday'), 
    (4, 'Sunday') 
GO
