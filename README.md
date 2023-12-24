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
