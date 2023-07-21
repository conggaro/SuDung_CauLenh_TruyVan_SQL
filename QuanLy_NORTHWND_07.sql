use NORTHWND;

-- câu lệnh sắp xếp "order by ..."

-- |SẮP XẾP TĂNG DẦN|
-- select cột_1, cột_2,...
-- from tên_bảng
-- order by cột_1, cột_2,... asc

-- |SẮP XẾP GIẢM DẦN|
-- select cột_1, cột_2,...
-- from tên_bảng
-- order by cột_1, cột_2,... desc


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy tất cả bản ghi
-- và sắp xếp từ A -> Z theo tên nhà cung cấp
-- từ bảng nhà cung cấp
select *
from Suppliers
order by CompanyName asc


-- 2. viết câu lệnh SQL
-- lấy tất cả bản ghi
-- và sắp xếp giảm dần theo giá
-- từ bảng nhà cung cấp
select *
from Products
order by UnitPrice desc


-- 3. viết câu lệnh SQL
-- lấy tất cả bản ghi
-- và sắp xếp từ A -> Z theo họ, theo tên
-- từ bảng nhân viên
select LastName as N'Họ', FirstName as N'Tên'
from Employees
order by LastName asc, FirstName asc


-- 4. viết câu lệnh SQL
-- lấy ra sản phẩm có số lượng bán cao nhất
-- từ bảng chi tiết đơn hàng
-- không được dùng max()
select top 1 OrderID as N'Mã đơn hàng', Quantity as N'Số lượng'
from [Order Details]
order by Quantity desc


-- 5. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- từ bảng đơn hàng
-- sắp xếp giảm dần theo ngày đặt hàng
select OrderID as N'Mã đơn hàng', OrderDate as N'Ngày đặt hàng'
from Orders
order by OrderDate desc


-- 6. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- từ bảng sản phẩm
-- sắp xếp giảm dần theo số lượng hàng tồn kho
select	ProductName as N'Tên sản phẩm', 
		UnitPrice as N'Giá sản phẩm',
		UnitsInStock as N'Số lượng hàng tồn kho'
from Products
order by UnitsInStock desc