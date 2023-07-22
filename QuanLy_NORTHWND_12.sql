use NORTHWND;

-- toán tử like
-- có tác dụng lọc dữ liệu trong chuỗi

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where tên_cột like tham_số

-- có 2 ký tự thường được sử dụng với like:
-- dấu phần trăm (%)
-- đại diện cho không, 1 hoặc nhiều ký tự

-- dấu gạch dưới (_) đại diện cho 1 ký tự đơn

-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tên công ty
-- đến từ quốc gia bắt đầu bằng chữ 'A'
-- từ bảng khách hàng
select	CompanyName as N'Tên công ty',
		Country as N'Quốc gia'
from Customers
where Country like 'A%'


-- 2. viết câu lệnh SQL
-- lấy tất cả các bản ghi
-- được gửi đến các thành phố có chứa chữ 'a'
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCity as N'Giao đến thành phố'
from Orders
where ShipCity like '%a%'


-- 3. viết câu lệnh SQL
-- lấy tất cả các bản ghi
-- với điều kiện ShipCountry like 'U_'
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao đến quốc gia'
from Orders
where ShipCountry like 'U_'


-- 4. viết câu lệnh SQL
-- lấy tất cả các bản ghi
-- với điều kiện ShipCountry like 'U%'
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao đến quốc gia'
from Orders
where ShipCountry like 'U%'


-- 5. viết câu lệnh SQL
-- lấy tất cả các bản ghi
-- với điều kiện ShipCountry like 'U__'
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao đến quốc gia'
from Orders
where ShipCountry like 'U__'


-- 6. viết câu lệnh SQL
-- lấy tất cả các bản ghi
-- với điều kiện có chữ 'b'
-- trong tên của công ty
-- từ bảng nhà cung cấp
select	SupplierID as N'Mã nhà cung cấp',
		CompanyName as N'Tên công ty'
from Suppliers
where CompanyName like '%b%'