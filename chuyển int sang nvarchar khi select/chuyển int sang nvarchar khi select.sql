-- cách 1: sử dụng case...when...
select	Id,
		TenSanPham,
		GiaSanPham,
		NgayMuaHang,
		TrangThai,
		case LoaiSanPham
			when 1 then N'Loại 1'
			when 2 then N'Loại 2'
			when 3 then N'Loại 3'
			else N'Không xác định'
		end as TenLoaiSanPham

from SanPham


-- cách 2: sử dụng hàm iif()
select	Id,
		TenSanPham,
		GiaSanPham,
		NgayMuaHang,
		TrangThai,
		iif(LoaiSanPham = 1, N'Loại 1',
			iif(LoaiSanPham = 2, N'Loại 2',
				iif(LoaiSanPham = 3, N'Loại 3', N'Không xác định'))) as TenLoaiSanPham

from SanPham


-- Trong cả hai ví dụ trên,
-- chúng ta sử dụng câu lệnh CASE hoặc hàm IIF
-- để kiểm tra giá trị của cột "LoaiSanPham".

-- Tùy thuộc vào giá trị của "LoaiSanPham",
-- chúng ta trả về các chuỗi tương ứng.

-- Nếu giá trị "LoaiSanPham" không phù hợp
-- với bất kỳ giá trị nào trong CASE hoặc IIF,
-- chúng ta trả về chuỗi "Không xác định".

-- Lưu ý rằng khi sử dụng hàm IIF,
-- câu lệnh sẽ trở nên khá dài và phức tạp hơn
-- nếu có nhiều giá trị để kiểm tra.

-- Trong trường hợp này,
-- sử dụng câu lệnh CASE sẽ dễ đọc và quản lý hơn.