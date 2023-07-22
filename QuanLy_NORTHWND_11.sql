use NORTHWND;

-- toán tử between
-- chọn dữ liệu trong một khoảng nhất định

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where tên_cột between giá_trị_đầu and giá_trị_cuối

-- ví dụ:
select	ProductID as N'Mã sản phẩm',
		UnitsInStock as N'Số lượng sản phẩm trong kho'
from Products
where UnitsInStock between 70 and 100


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- có giá bán trong khoảng [10, 20] đô la
-- từ bảng sản phẩm
select	ProductID as N'Mã sản phẩm',
		UnitPrice as N'Giá sản phẩm'
from Products
where UnitPrice between 10 and 20

-- cách 2
select	ProductID as N'Mã sản phẩm',
		UnitPrice as N'Giá sản phẩm'
from Products
where 10 <= UnitPrice and UnitPrice <= 20


-- 2. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- được đặt hàng trong khoảng
-- 1996-07-01
-- đến 1996-07-31
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		convert(varchar, OrderDate, 103) as N'Ngày đặt hàng'
from Orders
where OrderDate between '1996-07-01' and '1996-07-31'


-- 3. viết câu lệnh SQL
-- tính tổng số tiền vận chuyển
-- của các đơn hàng
-- từ 1996-07-01
-- đến 1996-07-31
-- từ bảng đơn hàng
select sum(Freight) as N'Tổng số tiền vận chuyển'
from Orders
where OrderDate between '1996-07-01' and '1996-07-31'


-- 4. viết câu lệnh SQL
-- lấy ra các bản ghi
-- được đặt hàng
-- từ 1997-01-01
-- đến 1997-12-31
-- và được vận chuyển bằng đường tàu thủy (ShipVia = 3)
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		convert(varchar, OrderDate, 103) as N'Ngày đặt hàng',
		ShipVia as N'Mã vận chuyển'
from Orders
where (OrderDate between '1997-01-01' and '1997-12-31') and (ShipVia = 3)