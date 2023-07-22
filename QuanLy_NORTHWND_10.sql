use NORTHWND;

-- toán tử
-- and
-- or
-- not

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where điều_kiện_1 and điều_kiện_2 and ...

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where điều_kiện_1 or điều_kiện_2 or ...

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where not điều_kiện


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy sản phẩm có số lượng nhỏ hơn 50 trong kho
-- hoặc lấy sản phẩm có số lượng lớn hơn 100 trong kho
-- từ bảng sản phẩm
select	ProductName as N'Tên sản phẩm',
		UnitsInStock as N'Số lượng trong kho'
from Products
where UnitsInStock < 50 or UnitsInStock > 100


-- 2. viết câu lệnh SQL
-- lấy ra các bản ghi
-- được giao đến Brazil
-- đã bị giao muộn
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao hàng đến quốc gia',
		convert(varchar, RequiredDate, 103) as N'Ngày giao hàng',
		convert(varchar, ShippedDate, 103) as N'Ngày giao hàng (bị muộn)'
from Orders
where ShipCountry = 'Brazil' and (RequiredDate < ShippedDate)


-- 3. viết câu lệnh SQL
-- lấy ra các bản ghi
-- có giá dưới 100$
-- và mã thể loại khác 1
-- từ bảng sản phẩm
select	ProductName as N'Tên sản phẩm',
		UnitPrice as N'Giá sản phẩm',
		CategoryID as N'Mã thể loại'
from Products
where UnitPrice < 100 and not(CategoryID = 1)


-- 4. viết câu lệnh SQL
-- lấy ra các bản ghi
-- có giá vận chuyển trong khoảng [50, 100]
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		Freight as N'Giá vận chuyển'
from Orders
where 50 <= Freight and Freight <= 100