create procedure GetAll_Record2
@checkPrice int
as
begin
	declare @str nvarchar(100) =
	N'
	select *
	from SanPham
	where GiaSanPham >= ' + cast(@checkPrice as nvarchar(100));

	execute sp_executesql @str;
end


-- thực thi thủ tục (procedure)
execute GetAll_Record2 600;