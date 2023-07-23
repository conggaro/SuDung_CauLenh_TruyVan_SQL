-- câu lệnh đặt tên
-- select cột_1 as [tên_tự_chế_1], cột_2 as [tên_tự_chế_2],...
-- from tên_bảng

-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy CompanyName và đặt tên thay thế là "Tên công ty"
-- lấy PostalCode và đặt tên thay thế là "Mã bưu điện"
-- từ bảng khách hàng (Customers)
select CompanyName as [Tên công ty], PostalCode as [Mã bưu điện]
from Customers


-- 2. viết câu lệnh SQL
-- lấy ra LastName và đặt tên cột là "Họ"
-- lấy ra FirstName và đặt tên cột là "Tên"
-- từ bảng nhân viên (Employees)
select LastName as [Họ], FirstName as [Tên]
from Employees


-- 3. viết câu lệnh SQL
-- lấy ra 15 bản ghi đầu tiên
-- đặt tên cho bảng Orders thành "Đơn hàng"
-- từ bảng đơn hàng (Orders)
select top 15 *
from Orders as [Đơn hàng]

-- hoặc có thể viết
select top 15 [Đơn hàng].*
from Orders as [Đơn hàng]


-- 4. viết câu lệnh SQL
-- lấy ra ProductName và đổi tên thành "Tên sản phẩm"
-- lấy ra SupplierID và đổi tên thành "Mã nhà cung cấp"
-- lấy ra CategoryID và đổi tên thành "Mã loại sản phẩm"
-- đổi tên bảng Products thành "Sản phẩm"
select	[Sản phẩm].ProductName as [Tên sản phẩm],
		[Sản phẩm].SupplierID as [Mã nhà cung cấp],
		[Sản phẩm].CategoryID as [Mã loại sản phẩm]
from Products as [Sản phẩm]