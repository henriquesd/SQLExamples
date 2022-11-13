CREATE PROCEDURE dbo.MergePerson (  
		@Id INT,
		@Name NVARCHAR(100),
		@LastName NVARCHAR(255)
	)  
AS   
BEGIN

	MERGE Persons as target
		USING (
				SELECT
					@Id as Id,
					@Name as Name,
					@LastName as LastName
			) AS source
			ON target.Id = source.Id

	WHEN NOT MATCHED BY target
		THEN
			INSERT (
				Id,
				Name,
				LastName
			) 
			VALUES
			(
				@Id,
				@Name,
				@LastName
			)
	
	WHEN MATCHED
		THEN  
			UPDATE SET  
				Name = @Name,
				LastName = @LastName,
				ModifiedDate = GETUTCDATE()
	;

END