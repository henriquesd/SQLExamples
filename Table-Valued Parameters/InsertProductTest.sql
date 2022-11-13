BEGIN TRANSACTION

	SELECT * FROM Products;

	EXEC InsertProduct 1, 'Galaxy S22', 'Smartphone Samsung Galaxy S22', 'Henrique';
	EXEC InsertProduct 2, 'iPhone 14 Pro', 'Smartphone Apple iPhone 14 Pro', 'Henrique';
	EXEC InsertProduct 3, 'iPhone 13 Pro', 'Smartphone Apple iPhone 13 Pro', 'Henrique';
	
	SELECT * FROM Products;
	
ROLLBACK