-- Khai báo biến @query để chứa truy vấn động
declare @query as nvarchar(max);

-- Khai báo biến @cols để chứa danh sách cột
declare @cols as nvarchar(max);

-- Lấy danh sách các giá trị mã học kỳ động
select @cols = STRING_AGG(QUOTENAME(CODE), ',')
from CODE_HK;

-- Tạo câu truy vấn động cho pivot
set @query = '
select *
from (
	select		b1.MaSV_FK as MaSinhVien,
				b2.TenSV,
				b3.MaHK as MaHocKy,
				b1.DiemTB
	from		KetQua b1
	inner join	SinhVien b2
	on			b1.MaSV_FK = b2.MaSV
	inner join	HocKy b3
	on			b1.MaHK_FK = b3.MaHK
) as BangTam
pivot (
	min(BangTam.DiemTB)
	for BangTam.MaHocKy in (' + @cols + ')
) as BangXoayTruc';

-- In ra biến @cols
print @cols;

-- In ra câu truy vấn động
print @query;

-- Thực thi câu truy vấn động
exec sp_executesql @query;