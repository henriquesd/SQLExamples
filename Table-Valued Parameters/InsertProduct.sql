CREATE PROCEDURE InsertProduct (  
		@Id INT,  
		@Name NVARCHAR(100),  
		@Description NVARCHAR(200),  
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
	VALUES (	
		  @Id,  
		  @Name,  
		  @Description,  
		  @User
	);
END