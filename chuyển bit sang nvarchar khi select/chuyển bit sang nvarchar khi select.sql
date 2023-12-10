-- cách 1:
-- sử dụng câu lệnh CASE trong câu truy vấn SELECT
select	Id,
		TenSanPham,
		GiaSanPham,
		NgayMuaHang,
		case
			when TrangThai = 1
			then N'Đang giảm giá'
			else N'Ngừng giảm giá'
		end as TrangThaiSanPham

from	SanPham;


-- cách 2:
-- sử dụng hàm IIF (Immediate IF) trong SQL Server
-- hàm IIF cho phép bạn kiểm tra một điều kiện và trả về kết quả tương ứng
select	Id,
		TenSanPham,
		GiaSanPham,
		NgayMuaHang,
		iif(TrangThai = 1, N'Áp dụng', N'Ngừng áp dụng') as TrangThaiSanPham

from	SanPham;