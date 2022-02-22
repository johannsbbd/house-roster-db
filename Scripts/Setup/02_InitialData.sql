-- Insert into house table
INSERT INTO House
           (HouseName
           )
VALUES    ('The Mays'), --1
    ('Mkhize House'), --2
    ('Chocho Crib'), --3
    ('Schepers Home'), --4
    ('Smiths'), --5
    ('Terblanches Temple') --6
GO

-- Insert into person table
INSERT INTO Person
           (FirstName
           ,LastName
           ,PersonType -- varchar Gurdian / Normal
           ,HouseId
           ) 
VALUES    ('Thandile','May','Gurdian',1), --1
    ('Thobelani','May', 'Gurdian',1), --2
    ('Sindi','May', 'Normal',1), --3
    ('Lwazi','May', 'Normal',1), --4
    ('Thabo','May', 'Normal',1), --5
    ('Sarah','Mkhize', 'Gurdian',2), --6
    ('John','Mkhize', 'Normal',2), --7
    ('Tim','Mkhize', 'Normal',2), --8
    ('Tina','MKhize', 'Normal',2), --9
    ('Nancy','Chocho', 'Normal',3),
    ('Jim','Chocho', 'Normal',3),
    ('Jeffery','Chocho', 'Gurdian',3),
    ('Sihle','Chocho', 'Normal',3),
    ('Toby','Chocho', 'Normal',3),
    ('Tobey','Chocho', 'Normal',3),
    ('Jennifer','Schepers', 'Gurdian',4),
    ('Tom','Schepers', 'Gurdian',4),
    ('Seth','Schepers', 'Normal',4),
    ('Tony','Schepers', 'Normal',4),
    ('Josh','Schepers', 'Normal',4),
    ('Anne','Schepers', 'Normal',4),
    ('Andrew','Smiths', 'Gurdian',5),
    ('Martha','Smiths', 'Gurdian',5),
    ('Kenneth','Smiths', 'Normal',5),
    ('Kobey','Smiths', 'Normal',5),
    ('Mary','Smiths', 'Normal',5),
    ('Zama','Terblanche', 'Gurdian',6),
    ('Tshepo','Terblanche', 'Normal',6),
    ('Zoe','Terblanche', 'Normal',6)
GO

-- Insert into room table
INSERT INTO Room
           (RoomName
           ,HouseId
           )
VALUES    ('Kitchen', 1), --1
    ('Living Room', 1), --2
    ('Bathroom', 1), --3
    ('Main bedroom', 1), --4
    ('Boys room', 1), --5
    ('Sindis room', 1), --6
    ('Main bedroom', 2), --7
    ('Kids room', 2), --8
    ('Kitchen', 2), --9
    ('Lounge', 2), --10
    ('Bathroom', 2), --11
GO

-- Insert into task table
INSERT INTO Task
           (RoomId
           ,TaskDescription
           )
VALUES    (1,'mop the floors'), --1
    (2,'Vaccum the couches'), --2
    (3,'Wipe the mirror'), --3
    (5, 'Put away toys'), --4
    (6, 'fold clothes') --5
    (7,'just collect the laundry'), --6
    (8,'fold blankets please'), --7
    (9,'use one pod for the dishwasher!'), --8
    (10, 'dust the shelves'), --9
    (11, 'Main bathroom downstairs') --10
GO

-- Insert into work  table
INSERT INTO Work
           (TaskId
           ,AssigneeId
           ,WorkDoneById
           ,WorkStatus --TODO / DONE / FAILED
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
    (11, 8, NULL, 'FAILED', '2022-02-03', NULL),
    (10, 9, NULL, 'TODO', '2022-03-20', NULL),
GO
