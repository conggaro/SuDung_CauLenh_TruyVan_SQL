-- xóa nhiều bản ghi
-- delete multiple record in sql server


-- tạo cơ sở dữ liệu
create database Test_Code_SQL;

-- sử dụng CSDL
use Test_Code_SQL;

-- tạo bảng
create table ConNguoi(
	-- cài đặt cho id tự động tăng
	stt int identity(1, 1) primary key,
	ho_ten nvarchar(50),
	tuoi int,
	gioi_tinh nvarchar(10)
);

-- xóa bảng
drop table ConNguoi;


-- lấy dữ liệu
select		[Bảng con người].stt as N'Số thứ tự',
			[Bảng con người].ho_ten as N'Họ tên',
			[Bảng con người].tuoi as N'Tuổi',
			[Bảng con người].gioi_tinh as N'Giới tính'

from		ConNguoi as [Bảng con người];


-- thêm bản ghi vào bảng
insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Văn A', 25, N'Nam');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Thị B', 28, N'Nữ');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Văn C', 30, N'Nam');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Thị D', 15, N'Nữ');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Văn E', 18, N'Nam');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Thị F', 40, N'Nữ');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Văn G', 33, N'Nam');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Thị H', 35, N'Nữ');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Văn I', 11, N'Nam');

insert into ConNguoi(ho_ten, tuoi, gioi_tinh)
values (N'Nguyễn Thị K', 12, N'Nữ');


-- xóa tất cả bản ghi
delete from ConNguoi;

-- xóa 1 bản ghi
delete from ConNguoi
where stt = 11;

-- xóa nhiều bản ghi
-- ví dụ: xóa bản ghi có id là 1, 3, 5, 7, 9
-- cách 1:
delete from ConNguoi
where stt in (1, 3, 5, 7, 9);

-- cách 2:
delete from ConNguoi
where	stt = 1
		or stt = 3
		or stt = 5
		or stt = 7
		or stt = 9;


-- xóa cách bản ghi
-- trong đoạn từ 3 đến 8
-- ký hiệu [3, 8]
-- cách 1:
delete from ConNguoi
where stt between 3 and 8;

-- cách 2:
delete from ConNguoi
where 3 <= stt and stt <= 8