-- cách 1:
-- sử dụng pivot để xoay trục
select *
from (
	select		b1.MaSV_FK as MaSinhVien,
				
				-- nhóm các bản ghi theo mã sinh viên
				-- và tên sinh viên
				-- (nếu bạn select Id của bảng KetQua thì kết quả xoay trục sẽ bị hỏng)
				b2.TenSV,

				-- dùng để xoay trục
				-- nó còn nhóm luôn cả mã học kỳ
				-- nhưng mã học kỳ lại rải thành các cột
				b3.MaHK as MaHocKy,
				
				-- giá trị ăn theo, điểm trung bình sẽ ăn theo học kỳ
				b1.DiemTB

	from		KetQua b1
	inner join	SinhVien b2
	on			b1.MaSV_FK = b2.MaSV
	inner join	HocKy b3
	on			b1.MaHK_FK = b3.MaHK
) as BangTam
pivot (min(DiemTB) for MaHocKy in ([HK1], [HK2], [HK3], [HK4])) as BangXoayTruc

-- sắp xếp theo cột TenSV
order by TenSV desc;



-- thêm từ khóa "go"
-- để biên dịch tiếp câu lệnh bên dưới
go



-- cách 2:
-- sử dụng with để lưu cả câu truy vấn select
-- vào vùng nhớ có tên TempData
with TempData as (
	select		b1.MaSV_FK as MaSinhVien,
				b2.TenSV,
				b3.MaHK as MaHocKy,
				b1.DiemTB

	from		KetQua b1
	inner join	SinhVien b2
	on			b1.MaSV_FK = b2.MaSV
	inner join	HocKy b3
	on			b1.MaHK_FK = b3.MaHK
)

-- sử dụng pivot
select *
from TempData
pivot (
	min(DiemTB) for MaHocKy
	in ([HK1], [HK2], [HK3], [HK4])
) as TablePivot



-- ghi chú:
-- Trong SQL Server, từ khóa WITH
-- thường được sử dụng để định nghĩa một Common Table Expression (CTE)
-- chúng ta có thể tạm dịch là "Biểu thức Bảng Chung"
-- CTE là một cấu trúc truy vấn tạm thời
-- và khi sử dụng WITH, bạn có thể lưu kết quả của một truy vấn tạm thời
-- vào một tên cụ thể.
