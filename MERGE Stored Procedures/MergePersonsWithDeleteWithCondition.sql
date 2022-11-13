CREATE PROCEDURE dbo.MergePersonsWithDeleteWithCondition (  
		@Persons PersonType READONLY
	)  
AS   
BEGIN
	 
	 IF OBJECT_ID('#PersonsTemp') IS NOT NULL  
		DROP TABLE #PersonsTemp
  
	 CREATE TABLE #PersonsTemp
	 (  
		Id INT NOT NULL,
		Name NVARCHAR(100) NULL,
		LastName NVARCHAR(255) NULL,
		PRIMARY KEY (Id)
	 );
  
	INSERT INTO #PersonsTemp
	SELECT *  
	FROM @Persons  

	MERGE Persons as target
		USING (
			SELECT
				Id,
				Name,
				LastName
			FROM #PersonsTemp
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
  
	WHEN NOT MATCHED BY SOURCE AND target.Id <> 1
	THEN   
		DELETE  
	;  

END