BEGIN TRANSACTION

	SELECT * FROM Persons;

	EXEC MergePerson @Id = 1, @Name = 'Frodo', @LastName = 'Baggins';
	EXEC MergePerson @Id = 2, @Name = 'Gandalf', @LastName = 'The Grey';
	EXEC MergePerson @Id = 3, @Name = 'Samwise', @LastName = 'Gamgee';

	SELECT * FROM Persons;

	WAITFOR DELAY '00:00:05';

	EXEC MergePerson @Id = 2 , @Name = 'Gandalf', @LastName = 'The White';

	SELECT * FROM Persons;

ROLLBACK