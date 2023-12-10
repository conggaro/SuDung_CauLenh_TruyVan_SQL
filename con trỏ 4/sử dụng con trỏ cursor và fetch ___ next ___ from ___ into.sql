declare @id int;
declare @name nvarchar(100);
declare @price int;
declare @buyDate date;
declare @statusProduct bit;
declare @statusProductStr nvarchar(100);


declare contextCursor cursor for
select Id, TenSanPham, GiaSanPham, NgayMuaHang, TrangThai
from SanPham;


open contextCursor;


fetch	next from contextCursor
		into @id, @name, @price, @buyDate, @statusProduct;


while @@fetch_status = 0
begin
	-- sử dụng câu lệnh điều kiện "if"
	if @statusProduct = 1
		begin
			-- sử dụng toán tử gán và từ khóa "select"
			select @statusProductStr = N'Đang giảm giá';
		end;
	
	-- sử dụng câu lệnh điều kiện "else if"
	else if @statusProduct = 0
		begin
			-- sử dụng toán tử gán và từ khóa "select"
			select @statusProductStr = N'Ngừng giảm giá';
		end;
	
	-- sử dụng câu lệnh điều kiện "else"
	else
		begin
			-- sử dụng toán tử gán và từ khóa "select"
			select @statusProductStr = NULL;
		end;


	print	cast(@id as nvarchar(100)) + ', ' +
			@name + ', ' +
			cast(@price as nvarchar(100)) + ', ' +
			convert(nvarchar(100), @buyDate, 103) + ', ' +
			@statusProductStr;

	fetch	next from contextCursor
			into @id, @name, @price, @buyDate, @statusProduct;
end;


close contextCursor;


deallocate contextCursor;