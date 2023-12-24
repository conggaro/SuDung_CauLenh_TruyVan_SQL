-- tạo cơ sở dữ liệu
create database QL_SinhVien;
go


-- sử dụng db
use QL_SinhVien;
go


-- tạo bảng sinh viên
create table SinhVien (
	Id int identity(1, 1) primary key,
	MaSV nvarchar(100),
	TenSV nvarchar(100)
);


-- tạo bảng học kỳ
create table HocKy (
	Id int identity(1, 1) primary key,
	MaHK nvarchar(100),
	TenHK nvarchar(100)
);


-- tạo bảng kết quả
create table KetQua (
	Id int identity(1, 1) primary key,
	MaSV_FK nvarchar(100),
	MaHK_FK nvarchar(100),
	DiemTB float
);


-- thêm bản ghi vào bảng SinhVien
insert into SinhVien (MaSV, TenSV)
values (N'SV001', N'Nguyễn Văn A');

insert into SinhVien (MaSV, TenSV)
values (N'SV002', N'Nguyễn Văn B');

insert into SinhVien (MaSV, TenSV)
values (N'SV003', N'Nguyễn Văn C');


-- thêm bản ghi vào bảng HocKy
insert into HocKy (MaHK, TenHK)
values
(N'HK1', N'Học kỳ 1'),
(N'HK2', N'Học kỳ 2'),
(N'HK3', N'Học kỳ 3'),
(N'HK4', N'Học kỳ 4'),
(N'HK5', N'Học kỳ 5'),
(N'HK6', N'Học kỳ 6'),
(N'HK7', N'Học kỳ 7'),
(N'HK8', N'Học kỳ 8');


-- thêm bản ghi vào bảng KetQua
insert into KetQua (MaSV_FK, MaHK_FK, DiemTB)
values
(N'SV001', N'HK1', 9.9),
(N'SV002', N'HK1', 8.2),
(N'SV003', N'HK1', 10),
(N'SV001', N'HK2', 8.5),
(N'SV002', N'HK2', 9.6),
(N'SV003', N'HK2', 8.4),
(N'SV001', N'HK3', 9.7),
(N'SV002', N'HK3', 10),
(N'SV003', N'HK3', 8.7),
(N'SV001', N'HK4', 10),
(N'SV002', N'HK4', 7.1),
(N'SV003', N'HK4', 9.8);