-- khai báo biến
declare @id int;
declare @name nvarchar(50);
declare @price int;
declare @buyDate date;


-- khai báo con trỏ
declare varCursor cursor for
select Id, TenSanPham, GiaSanPham, NgayMuaHang
from SanPham;


-- mở con trỏ
open varCursor;


-- đọc bản ghi đầu tiên
fetch	next from varCursor
		into @id, @name, @price, @buyDate;


-- kiểm tra trạng thái đọc
while @@fetch_status = 0
begin
	-- in kết quả ra màn hình
	print	cast(@id as nvarchar(50)) + ', ' +
			@name + ', ' +
			cast(@price as nvarchar(50)) + ', ' +
			cast(convert(nvarchar(50), @buyDate, 103) as nvarchar(50));

			-- cách 2:
			-- cast(@buyDate as nvarchar(50))
			-- thì kết quả là 2023-01-31

	-- đọc bản ghi tiếp theo
	fetch	next from varCursor
			into @id, @name, @price, @buyDate;
end


-- đóng con trỏ
close varCursor;


-- giải phóng tài nguyên
deallocate varCursor;