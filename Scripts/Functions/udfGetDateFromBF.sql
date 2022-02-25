CREATE FUNCTION udfGetDateFromBF (
@StartOfWeekDate varchar(20),
@DayFlag int
)

RETURNS date

AS
BEGIN

	DECLARE @Output date

	SELECT @Output = DATEADD(day, LOG(@DayFlag, 2), @StartOfWeekDate);
  
	RETURN @Output
END
GO
