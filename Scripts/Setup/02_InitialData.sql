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
           ,Available
           ,HouseId
           ) 
VALUES    ('Thandile','May','GUARDIAN', 0, 1), 
    ('Thobelani','May', 'GUARDIAN', 0, 1), 
    ('Sindi','May', 'NORMAL', 1, 1), 
    ('Lwazi','May', 'NORMAL', 1, 1), 
    ('Thabo','May', 'NORMAL', 1, 1), 
    ('Sarah','Mkhize', 'GUARDIAN', 0, 2), 
    ('John','Mkhize', 'NORMAL', 1, 2), 
    ('Tim','Mkhize', 'NORMAL', 1, 2), 
    ('Tina','MKhize', 'NORMAL', 0, 2), 
    ('Nancy','Chocho', 'NORMAL', 1, 3),
    ('Jim','Chocho', 'NORMAL', 1, 3),
    ('Jeffery','Chocho', 'GUARDIAN', 0, 3),
    ('Sihle','Chocho', 'NORMAL', 1, 3),
    ('Toby','Chocho', 'NORMAL', 1, 3),
    ('Tobey','Chocho', 'NORMAL', 1, 3),
    ('Jennifer','Schepers', 'GUARDIAN', 0, 4),
    ('Tom','Schepers', 'GUARDIAN', 0, 4),
    ('Seth','Schepers', 'NORMAL', 1, 4),
    ('Tony','Schepers', 'NORMAL', 0, 4),
    ('Josh','Schepers', 'NORMAL', 1, 4),
    ('Anne','Schepers', 'NORMAL', 1, 4),
    ('Andrew','Smiths', 'GUARDIAN', 0, 5),
    ('Martha','Smiths', 'GUARDIAN', 0, 5),
    ('Kenneth','Smiths', 'NORMAL', 1, 5),
    ('Kobey','Smiths', 'NORMAL', 0, 5),
    ('Mary','Smiths', 'NORMAL', 1, 5),
    ('Zama','Terblanche', 'GUARDIAN', 0, 6),
    ('Tshepo','Terblanche', 'NORMAL', 1, 6),
    ('Zoe','Terblanche', 'NORMAL', 1, 6)
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
           ,DaysBF
           )
VALUES    (1,'mop the floors', 9), 
    (2,'Vaccum the couches', 46), 
    (3,'Wipe the mirror', 68), 
    (5, 'Put away toys', 5), 
    (6, 'fold clothes', 72), 
    (7,'just collect the laundry', 38), 
    (8,'fold blankets please', 50), 
    (9,'use one pod for the dishwasher!', 37), 
    (10, 'dust the shelves', 18), 
    (11, 'Main bathroom downstairs', 18) 
GO

-- Insert into work  table
INSERT INTO Work
           (TaskId
           ,AssigneeId
           ,WorkDoneById
           ,DueDate
           ,DoneDate
           )
VALUES    (1, 3, 3, '2022-02-12', '2022-02-12'),
    (2, 4, 4, '2022-02-13', '2022-02-13'),
    (3, 5, 5, '2022-02-15', '2022-02-16'),
    (2, 3, 5, '2022-02-15', '2022-02-17'),
    (5, 4, 3, '2022-02-20', '2022-02-20'),
    (4, 5, NULL, '2022-03-22', NULL),
    (6, 7, 7, '2022-02-13', '2022-02-13'),
    (9, 7, 8, '2022-02-15', '2022-02-16'),
    (8, 8, NULL, '2022-02-03', NULL),
    (10, 9, NULL, '2022-03-20', NULL)
GO
