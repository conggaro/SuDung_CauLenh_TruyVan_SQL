-- khai báo biến
declare @id int;
declare @name nvarchar(100);
declare @price int;

-- khai báo con trỏ
declare varCursor cursor for
select Id, TenSanPham, GiaSanPham
from SanPham;

-- mở con trỏ
open varCursor;

-- đọc bản ghi đầu tiên
fetch	next from varCursor
		into @id, @name, @price;

-- kiểm tra trạng thái
while @@fetch_status = 0
begin
	-- in kết quả ra màn hình
	print	cast(@id as nvarchar(50)) + ', '
			+ @name + ', '
			+ cast(@price as nvarchar(50));

	-- đọc bản ghi tiếp theo
	fetch	next from varCursor
			into @id, @name, @price;
end

-- đóng con trỏ
close varCursor;

-- giải phóng tài nguyên
deallocate varCursor;