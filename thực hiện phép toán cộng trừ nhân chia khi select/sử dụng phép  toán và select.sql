-- thực hiện phép cộng
select	Id,
		TenSanPham,
		GiaSanPham + 10 as GiaSanPham_PhepToanCong,
		NgayMuaHang,
		TrangThai,
		LoaiSanPham

from SanPham



-- thực hiện phép trừ
select	Id,
		TenSanPham,
		GiaSanPham - 10 as GiaSanPham_PhepToanTru,
		NgayMuaHang,
		TrangThai,
		LoaiSanPham

from SanPham



-- thực hiện phép nhân
select	Id,
		TenSanPham,
		GiaSanPham * 1000 as GiaSanPham_PhepToanNhan,
		NgayMuaHang,
		TrangThai,
		LoaiSanPham

from SanPham



-- thực hiện phép chia
select	Id,
		TenSanPham,
		GiaSanPham / 100 as GiaSanPham_PhepToanChia,
		NgayMuaHang,
		TrangThai,
		LoaiSanPham

from SanPham