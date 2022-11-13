CREATE PROCEDURE InsertProducts (  
		@Products ProductType READONLY,
		@User NVARCHAR(150)
	)  
AS   
BEGIN
	INSERT INTO Products (
		Id,
		Name,
		Description,
		CreatedBy
	) 
	SELECT	
		prd.Id,
		prd.Name,
		prd.Description,
		@User
	FROM @Products prd
END