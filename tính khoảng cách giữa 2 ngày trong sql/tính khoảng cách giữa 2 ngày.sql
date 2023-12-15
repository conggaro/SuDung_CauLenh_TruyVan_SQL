select	Id,
		TenSanPham,
		GiaSanPham,
		NgayMuaHang,
		TrangThai,
		LoaiSanPham,
		NgayHetHang,

		-- có thể dùng hàm abs để lấy giá trị tuyệt đối
		 cast(abs(datediff(day, NgayMuaHang, NgayHetHang)) as nvarchar(100)) + N' ngày' as DemNgay

		-- cách 2:
		-- sử dụng hàm convert()
		--convert(nvarchar(100), abs(datediff(day, NgayMuaHang, NgayHetHang))) + N' ngày' as DemNgay

from SanPham