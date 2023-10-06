-- sử dụng UNION
-- để không lấy các bản ghi bị trùng nhau

-- sử dụng UNION ALL
-- để lấy luôn các bản ghi bị trùng nhau


-- sử dụng cơ sở dữ liệu
use Database_Demo;


-- tạo bảng DanhSach1
create table DanhSach1(
	Id int identity(1, 1) primary key not null,
	Value int
);


-- tạo bảng DanhSach2
create table DanhSach2(
	Id int identity(1, 1) primary key not null,
	Value int
);


-- thêm các bản ghi cho bảng DanhSach1
insert into DanhSach1(DanhSach1.[Value]) values(9);
insert into DanhSach1(DanhSach1.[Value]) values(10);
insert into DanhSach1(DanhSach1.[Value]) values(11);
insert into DanhSach1(DanhSach1.[Value]) values(12);
insert into DanhSach1(DanhSach1.[Value]) values(13);
insert into DanhSach1(DanhSach1.[Value]) values(14);
insert into DanhSach1(DanhSach1.[Value]) values(15);
insert into DanhSach1(DanhSach1.[Value]) values(16);


-- thêm các bản ghi cho bảng DanhSach2
insert into DanhSach2(DanhSach2.[Value]) values(12);
insert into DanhSach2(DanhSach2.[Value]) values(13);
insert into DanhSach2(DanhSach2.[Value]) values(14);
insert into DanhSach2(DanhSach2.[Value]) values(15);
insert into DanhSach2(DanhSach2.[Value]) values(22);
insert into DanhSach2(DanhSach2.[Value]) values(23);
insert into DanhSach2(DanhSach2.[Value]) values(24);
insert into DanhSach2(DanhSach2.[Value]) values(25);
insert into DanhSach2(DanhSach2.[Value]) values(26);
insert into DanhSach2(DanhSach2.[Value]) values(27);


-- lấy ra tất cả bản ghi
-- của danh sách 1
select *
from DanhSach1;


-- lấy ra tất cả bản ghi
-- của danh sách 2
select *
from DanhSach2;


-- yêu cầu 1:
-- kết hợp dữ liệu ở 2 bảng
-- và không lấy các bản ghi
-- có trường "Value" không bị trùng nhau
-- kết quả: 14 dòng
select [Value] as N'Value không bị trùng nhau' from DanhSach1
union
select [Value] as N'Value không bị trùng nhau' from DanhSach2


-- yêu cầu 2:
-- kết hợp dữ liệu ở 2 bảng
-- và không lấy các bản ghi
-- có trường "Value" bị trùng nhau
-- kết quả: 18 dòng
select [Value] as N'Value bị trùng nhau' from DanhSach1
union all
select [Value] as N'Value bị trùng nhau' from DanhSach2