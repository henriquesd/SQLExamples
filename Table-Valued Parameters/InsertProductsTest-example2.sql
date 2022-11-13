BEGIN TRANSACTION

	SELECT * FROM Products;

	DECLARE @Products ProductType;

	INSERT INTO @Products
	SELECT 4, 'iPhone 13 Pro', 'Smartphone Apple iPhone 13 Pro'
	UNION ALL
	SELECT 5, 'iPhone 14 Pro', 'Smartphone Apple iPhone 14 Pro';
	
	EXEC InsertProducts @Products, 'Henrique';

	SELECT * FROM Products;
	
ROLLBACK