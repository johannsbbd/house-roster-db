USE [HouseRoster]
GO
  /****** Object: UserDefinedFunction [dbo].[udfWorkStatus] Script Date: 2022/02/24 12:42:53 ******/
SET
  ANSI_NULLS ON
GO
SET
  QUOTED_IDENTIFIER ON
GO
  ALTER FUNCTION [dbo].[udfWorkStatus] (@DueDate date, @DoneDate date) RETURNS varchar(10) AS BEGIN DECLARE @Status varchar(10) DECLARE @Now date
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

    WHEN @DoneDate is not null
    and @DoneDate > @DueDate THEN 'LATE'
    
    ELSE 'N/A'
  END RETURN @Status
END