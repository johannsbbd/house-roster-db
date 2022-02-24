CREATE FUNCTION udfWorkStatus
(
  @DueDate date, 
  @DoneDate date,
)
RETURNS varchar(10)
AS
BEGIN
  DECLARE @Status varchar
  DECLARE @Now datetime set @Now = GETDATE()

  SELECT @Status = CASE
              WHEN @Now > @DueDate AND @DoneDate is null
                  THEN 'FAILED'
              WHEN @Now < @DueDate AND @DoneDate is null
                    THEN 'TODO'
              WHEN @DoneDate is not null and @DoneDate < @DueDate
                    THEN 'COMPLETE'              
              ELSE
                     'LATE'
  RETURN @Status
END
GO