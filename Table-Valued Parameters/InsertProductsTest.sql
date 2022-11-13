BEGIN TRANSACTION

	SELECT * FROM Products;

	DECLARE @Products ProductType;

	INSERT INTO @Products
	SELECT 1, 'Galaxy S22+', 'Smartphone Samsung Galaxy S22+'
	UNION ALL
	SELECT 2, 'iPhone 14 Pro', 'Smartphone Apple iPhone 14 Pro'
	UNION ALL
	SELECT 3, 'iPhone 13 Pro', 'Smartphone Apple iPhone 13 Pro';

	EXEC InsertProducts @Products, 'Henrique';
	
	SELECT * FROM Products;
	
ROLLBACK