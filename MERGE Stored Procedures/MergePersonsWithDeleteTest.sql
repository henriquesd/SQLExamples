BEGIN TRANSACTION

	SELECT * FROM Persons;

	INSERT INTO Persons (Id, Name, LastName)
	VALUES (1, 'Frodo', 'Baggins'),
		   (2, 'Gandalf', 'The Grey'),
		   (3, 'Samwise', 'Gamgee');

	SELECT * FROM Persons;

	WAITFOR DELAY '00:00:05';

	DECLARE @Persons PersonType;

	INSERT INTO @Persons
	SELECT 4, 'Eddard ', 'Stark'
	UNION ALL
	SELECT 2, 'Gandalf', 'The White'
	UNION ALL
	SELECT 5, 'Daenerys', 'Targaryen';
	
	EXEC MergePersonsWithDelete @Persons;

	SELECT * FROM Persons;

ROLLBACK