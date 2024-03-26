# Sử dụng câu lệnh truy vấn SQL
Link học: https://www.youtube.com/watch?v=kQRpe1HkALE&list=PLyxSzL3F7484deka_j1czssCiHygV6oF-
# Sử dụng hàm
1. CONVERT(nvarchar(10), tên_cột, 103) dùng để chuyển datetime sang nvarchar(10).
2. CAST(tên_cột as kiểu_dữ_liệu), ví dụ CAST(id as nvarchar(50)).
# Kiểu dữ liệu
1. DATE định dạng YYYY-MM-DD (năm-tháng-ngày).
2. DATETIME định dạng: YYYY-MM-DD HH: MI: SS (năm-tháng-ngày giờ: phút: giây).
# Câu lệnh điều kiện If
if tên_biến > 0<br>
begin<br>
  print N'Kết quả: lớn hơn 0';<br>
end;<br>

else if tên_biến < 0<br>
begin<br>
  print N'Kết quả: nhỏ hơn 0';<br>
end;<br>

else if tên_biến = 0<br>
begin<br>
  print N'Kết quả: bằng 0';<br>
end;<br>

else<br>
begin<br>
  print N'Kết quả: chắc là bị NULL rồi!';<br>
end;
# Thêm khóa chính
alter table tên_bảng<br>
add constraint tên_ràng_buộc<br>
primary key (tên_cột);
# Thêm khóa ngoại
alter table tên_bảng_con<br>
add constraint tên_ràng_buộc<br>
foreign key (tên_cột_con)<br>
references tên_bảng_cha (tên_cột_cha);

# Sử dụng SQL Server bằng Command Prompt
Chế độ thường (Windows Authentication)<br>
<code>sqlcmd -S <tên server> -d <tên database> -E</code>
<br>

Chế độ xác thực (SQL Server Authentication)<br>
<code>sqlcmd -S <tên server> -d <tên database> -U <tên đăng nhập> -P <mật khẩu></code><br>
Ví dụ: sqlcmd -S 192.168.60.22,1433 -d HISTAFF_SQL_DEV -U sa -P MatKhau@123

<br>
Khi truy cập thành công thì trên màn hình có ký tự "1>"
<br>
Bạn chỉ cần gõ:<br>
<code>select * from Tên_bảng</code><br>
<code>go</code>

# Định dạng số
Nếu bạn muốn 123456789 thành 123,456,789<br>
<code>DECLARE @number BIGINT = 123456789;
SELECT FORMAT(@number, '#,##0');</code>

# Thực thi lệnh SQL từ 1 biến có kiểu dữ liệu nvarchar(max)
Cách 1:<br>
<code>declare @sqlString nvarchar(max);
set @sqlString = 'select * from HU_EMPLOYEE';
execute sp_executesql @sqlString;</code>
<br><br>
Cách 2: <br>
<code>declare @sqlString nvarchar(max);
set @sqlString = 'select * from HU_EMPLOYEE';
execute(@sqlString);</code>

# Tạo hàm tính tổng - Kiểu trả về là Int
-- tạo hàm tính tổng<br>
create function TinhTong (<br>
    &emsp;@so1 int,<br>
    &emsp;@so2 int<br>
)<br>
returns int<br>
as<br>
begin<br>
    &emsp;declare @tong int;<br>

    set @tong = @so1 + @so2;<br>

    return @tong;<br>
end;<br>


-- gọi hàm tính tổng<br>
select dbo.TinhTong(5, 7) AS Tong;<br>


-- câu lệnh xóa hàm<br>
drop function if exists dbo.TinhTong;
