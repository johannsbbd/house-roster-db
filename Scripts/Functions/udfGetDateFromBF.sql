USE HouseRoster
GO

CREATE FUNCTION udfGetDateFromBF (
@StartOfWeekDate varchar(20),
@DaysBF int,
@DayFlag int
)

RETURNS date

AS
BEGIN

	DECLARE @Output date

	SELECT @Output = DATEADD(day, LOG(@DaysBF & @DayFlag, 2), @StartOfWeekDate);
  
	RETURN @Output
END