create procedure GetAll_Record4
@checkName nvarchar(100)
as
begin
	declare @str nvarchar(2000) =
	N'
	declare @id int;
	declare @name nvarchar(50);
	declare @price int;
	declare @buyDate date;

	declare varCursor cursor for
	select Id, TenSanPham, GiaSanPham, NgayMuaHang
	from SanPham
	where TenSanPham = N''' + @checkName + ''';' +
	'
	open varCursor;

	fetch	next from varCursor
			into @id, @name, @price, @buyDate;

	while @@fetch_status = 0
	begin
		print	cast(@id as nvarchar(50)) + '', '' +
				@name + '', '' +
				cast(@price as nvarchar(50)) + '', '' +
				cast(convert(nvarchar(10), @buyDate, 103) as nvarchar(50));

		fetch	next from varCursor
				into @id, @name, @price, @buyDate;
	end;

	close varCursor;

	deallocate varCursor;
	';


	declare @query nvarchar(2000) = 'select * from SanPham where TenSanPham = N''' + @checkName + ''';';


	execute sp_executesql @str;

	execute sp_executesql @query;
end;


-- thực thi thủ tục (procedure)
execute GetAll_Record4 N'Điều hòa';


-- xóa thủ tục (procedure)
drop procedure GetAll_Record4;


-- trong ngôn ngữ lập trình C#
-- thì để có được dấu nháy, bạn phải viết \'

-- còn trong SQL Server, để có được dấu nháy
-- thì bạn phải viết ''