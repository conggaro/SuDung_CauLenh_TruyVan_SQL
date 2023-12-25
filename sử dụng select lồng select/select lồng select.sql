-- sử dụng select lồng select
select		b3.Id as N'Id (Kết quả)',
			b1.MaSV as N'Mã SV',
			b1.TenSV as N'Tên SV',
			b2.MaHK as N'Mã HK',
			b2.TenHK as N'Tên HK',
			b3.DiemTB as N'Điểm trung bình'

from
(
	select *
	from SinhVien
) as b1,
(
	select *
	from HocKy
) as b2,
(
	select *
	from KetQua
) as b3

where		b1.MaSV = b3.MaSV_FK
			and b2.MaHK = b3.MaHK_FK;