-- cách 1: sử dụng case...when...
select	Id,
		TenSanPham,
		GiaSanPham,
		NgayMuaHang,
		TrangThai,
		LoaiSanPham,
		case
			when GiaSanPham > 1000 then N'Đắt'
			when GiaSanPham = 1000 then N'Bình thường'
			when GiaSanPham < 1000 then N'Rẻ'
			else N'Không xác định'
		end as NhanXetGiaTienSanPham

from SanPham


-- cách 2: sử dụng hàm iif()
select	Id,
		TenSanPham,
		GiaSanPham,
		NgayMuaHang,
		TrangThai,
		LoaiSanPham,
		iif(GiaSanPham > 1000, N'Đắt',
			iif(GiaSanPham = 1000, N'Bình thường',
				iif(GiaSanPham < 1000, N'Rẻ', N'Không xác định'))) as NhanXetGiaTienSanPham

from SanPham