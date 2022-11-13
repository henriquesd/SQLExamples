CREATE PROCEDURE dbo.MergePersonsUpsert (
		@Persons PersonType READONLY
	)
AS   
BEGIN

	MERGE Persons as target
		USING (
			SELECT
				Id,
				Name,
				LastName
			FROM @Persons
			) AS source
		ON target.Id = source.Id

	WHEN NOT MATCHED THEN
	INSERT (
		Id,
		Name,
		LastName
	) 
	VALUES
	(
		source.Id,
		source.Name,
		source.LastName
	)
	
	WHEN MATCHED THEN  
		UPDATE SET  
			Name = source.Name,
			LastName = source.LastName,
			ModifiedDate = GETUTCDATE()
	;  

END