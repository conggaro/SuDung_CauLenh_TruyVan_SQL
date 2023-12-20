-- tạo biến có kiểu dữ liệu bảng
declare @myTable table (
    Id int,
	NameSP nvarchar(50),
	PriceSP int
);


-- tạo biến
declare @id int;
declare @name nvarchar(100);
declare @price int;


-- tạo con trỏ
-- rồi để con trỏ tham chiếu đến vùng nhớ bị select
declare contextCursor cursor for
select Id, TenSanPham, GiaSanPham
from SanPham;


-- mở con trỏ
open contextCursor;


-- đọc dòng đầu tiên
-- rồi ghi dữ liệu đọc được vào 2 biến @id và @name
fetch	next from contextCursor
		into @id, @name, @price;


-- sử dụng vòng lặp while
while @@fetch_status = 0
begin
	-- in ra giá trị đọc được
	print cast(@id as nvarchar(100)) + ', ' + @name + ', ' + cast(@price as nvarchar(100));

	-- thêm bản ghi vào biến bảng
	insert into @myTable(Id, NameSP, PriceSP)
	values (@id, @name, @price);

	-- đọc bản ghi tiếp theo
	fetch	next from contextCursor
			into @id, @name, @price;
end;


-- đóng con trỏ
close contextCursor;


-- giải phóng tài nguyên
deallocate contextCursor;


-- thêm 2 bản ghi vào biến bảng
insert into @myTable (Id, NameSP, PriceSP)
values
    (8, N'Máy sấy', 320),
    (9, N'Bếp từ', 450);


-- lấy dữ liệu từ biến bảng
-- Select data from the table variable
select * from @myTable;