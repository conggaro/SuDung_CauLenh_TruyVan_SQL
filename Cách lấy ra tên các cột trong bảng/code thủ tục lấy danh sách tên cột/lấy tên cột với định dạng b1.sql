-- tạo procedure
create procedure LAY_TEN_COT
as
begin
	declare @Result varchar(2000);

	SELECT @Result = COALESCE(@Result + ', ', '') + 'b1.' + COLUMN_NAME
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'PA_SAL_IMPORT_BACKDATE';

	print @Result;

	SELECT @Result;
end


-- thực thi procedure
execute LAY_TEN_COT