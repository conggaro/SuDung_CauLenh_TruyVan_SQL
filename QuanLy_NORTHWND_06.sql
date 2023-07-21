use NORTHWND;
-- hàm đếm số lượng count()
-- select count(tên_cột)
-- from tên_bảng


-- hàm tính tổng sum()
-- select sum(tên_cột)
-- from tên_bảng


-- hàm tính trung bình cộng avg()
-- select avg(tên_cột)
-- from tên_bảng


-- ví dụ hàm count():
select count(OrderID) as [Đếm số lượng mã đơn hàng]
from Orders

select count(*) as [Đếm số lượng bản ghi]
from Orders

-- ví dụ hàm sum():
select sum(UnitsInStock) as [Tính tổng hàng bị tồn trong kho]
from Products

-- ví dụ hàm avg():
select avg(UnitsInStock) as [Tính trung bình cộng hàng bị tồn trong kho]
from Products


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- đếm số lượng khách hàng
-- từ bảng khách hàng (Customers)
select count(*) as [Đếm số lượng khách hàng]
from Customers


-- 2. viết câu lệnh SQL
-- tính tổng số tiền vận chuyển (Freight)
-- của tất cả đơn đặt hàng
-- từ bảng đơn hàng (Orders)
select sum(Freight) as [Tổng số tiền vận chuyển]
from Orders


-- 3. viết câu lệnh SQL
-- tính trung bình cộng
-- số lượng sản phẩm của tất cả bản ghi
-- từ bảng chi tiết đơn hàng (Order Details)
select avg(Quantity) as [Trung bình cộng số lượng sản phẩm]
from [Order Details]


-- 4. viết câu lệnh SQL
-- đếm số lượng bản ghi
-- tính tổng số lượng hàng tồn trong kho
-- tính trung bình cộng giá của tất cả sản phẩm
-- từ bảng sản phẩm
select	count(*) as [Đếm số lượng bản ghi],
		sum(UnitsInStock) as [Tính tổng số lượng hàng tồn trong kho],
		avg(UnitPrice) as [Tính trung bình cộng giá của tất cả sản phẩm]
from Products


-- 5. viết câu lệnh SQL
-- đếm số lượng bản ghi
-- bằng 2 cách
-- từ bảng đơn hàng
select count(*) as [Đếm số lượng bản ghi (cách 1)]
from Orders

select count(OrderID) as [Đếm số lượng bản ghi (cách 2)]
from Orders


-- 6. viết câu lệnh SQL
-- tính trung bình cộng cho cột UnitPrice
-- tính tổng cho cột Quantity
-- từ bảng chi tiết đơn hàng
select	avg(UnitPrice) as [Tính trung bình cộng giá sản phẩm của tất cả bản ghi],
		sum(Quantity) as [Tính tổng số lượng sản phẩm của tất cả bản ghi]
from [Order Details]