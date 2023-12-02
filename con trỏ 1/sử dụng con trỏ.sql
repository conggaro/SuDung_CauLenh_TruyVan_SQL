declare @id int;
declare @name nvarchar(50);
declare @price int;

-- khai báo con trỏ
declare varCursor cursor for
select Id, TenSanPham, GiaSanPham
from SanPham;

-- mở con trỏ
open varCursor;

-- đọc dòng đầu tiên
fetch next from varCursor into @id, @name, @price;

-- in ra màn hình
print	cast(@id as nvarchar(50)) + ', '
		+ @name + ', '
		+ cast(@price as nvarchar(50));

-- đóng con trỏ
close varCursor

-- giải phóng tài nguyên
deallocate varCursor