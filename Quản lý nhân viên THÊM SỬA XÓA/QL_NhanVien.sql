-- Yêu cầu:
-- 1. tạo cơ sở dữ liệu QLNV
-- 2. tạo bảng TaiKhoan
-- 3. thêm dữ liệu vào bảng TaiKhoan

create database QLNV;

drop database QLNV;

use QLNV;

create table TaiKhoan(
	stt int identity(1, 1) primary key,
	ten_dang_nhap nvarchar(50),
	mat_khau nvarchar(50)
);


-- Sử dụng câu lệnh insert into
-- để thêm mới bản ghi
insert into TaiKhoan(ten_dang_nhap, mat_khau) values (N'admin', N'123456');
insert into TaiKhoan(ten_dang_nhap, mat_khau) values (N'nva', N'123456');
insert into TaiKhoan(ten_dang_nhap, mat_khau) values (N'nvb', N'654321');
insert into TaiKhoan(ten_dang_nhap, mat_khau) values (N'nvc', N'654321');


-- Sử dụng câu lệnh update
-- để cập nhật bản ghi
update TaiKhoan
set mat_khau = N'66668888'
where ten_dang_nhap = N'nvc';


-- Sử dụng câu lệnh delete
-- để xóa bản ghi
delete from TaiKhoan
where ten_dang_nhap = N'nvb'


-- Sử dụng câu lệnh select
select *
from TaiKhoan;


-- Sử dụng câu lệnh drop table
drop table TaiKhoan;


-- Tạo procedure trong SQL
create procedure Lay_TatCa_BanGhi
as begin
select * from TaiKhoan
end

-- gọi procedure
execute Lay_TatCa_BanGhi


-- Tạo procedure có tham số trong SQL
create procedure Lay_BanGhi_Theo_stt
@thamSo int
as begin
(
	select *
	from TaiKhoan
	where stt = (@thamSo)
)
end

-- gọi procedure
execute Lay_BanGhi_Theo_stt 1


-- Tạo procedure có 2 tham số trong SQL
create procedure Lay_BanGhi_Theo_DieuKien
@thamSo1 int, @thamSo2 nvarchar(50)
as begin
(
	select *
	from TaiKhoan
	where stt = (@thamSo1) and mat_khau = (@thamSo2)
)
end

-- gọi procedure
execute Lay_BanGhi_Theo_DieuKien 2, N'123456'