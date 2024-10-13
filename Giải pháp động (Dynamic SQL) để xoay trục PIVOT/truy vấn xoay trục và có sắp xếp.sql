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