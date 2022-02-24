CREATE FUNCTION udfWorkStatus (@DueDate date, @DoneDate date) RETURNS varchar(10) 
AS BEGIN 
DECLARE @Status varchar(10) 
DECLARE @Now date
set
  @Now = GETDATE()
SELECT
  @Status = CASE
    WHEN @Now > @DueDate
    AND @DoneDate is null THEN 'FAILED'
    WHEN @Now <= @DueDate
    AND @DoneDate is null THEN 'TODO'
    WHEN @DoneDate is not null
    and @DoneDate <= @DueDate THEN 'COMPLETE'
    ELSE 'LATE'
  END RETURN @Status
END

GO
