-- tìm giá trị lớn nhất
-- select max(tên_cột)
-- from tên_bảng

-- tìm giá trị nhỏ nhất
-- select min(tên_cột)
-- from tên_bảng


-- ví dụ:
select max(OrderID) as [Giá trị lớn nhất]
from Orders

select min(OrderID) as [Giá trị nhỏ nhất]
from Orders


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- tìm giá thấp nhất (UnitPrice)
-- của các sản phẩm
-- từ bảng sản phẩm (Products)
select min([Sản phẩm].UnitPrice) as [Giá sản phẩm thấp nhất]
from Products as [Sản phẩm]


-- 2. viết câu lệnh SQL
-- lấy ra ngày đặt hàng gần đây nhất (OrderDate)
-- từ bảng đơn hàng (Orders)
select max([Đơn hàng].OrderDate) as [Ngày đặt hàng gần đây nhất]
from Orders as [Đơn hàng]


-- 3. viết câu lệnh SQL
-- lấy ra ngày đặt hàng cách đây xa nhất (OrderDate)
-- từ bảng đơn hàng (Orders)
select min(OrderDate) as [Ngày đặt hàng cách đây xa nhất]
from Orders


-- 4. viết câu lệnh SQL
-- lấy ra số lượng hàng bị tồn kho nhiều nhất (UnitsInStock)
-- từ bảng sản phẩm (Products)
select max(UnitsInStock) as [Số lượng hàng bị tồn kho nhiều nhất]
from Products


-- 5. viết câu lệnh SQL
-- lấy ra ngày sinh nhỏ nhất của nhân viên (BirthDate)
-- từ bảng nhân viên (Employees)
select min(BirthDate) as [Ngày sinh nhỏ nhất]
from Employees


-- 6. viết câu lệnh SQL
-- lấy ra ngày sinh lớn nhất của nhân viên (BirthDate)
-- từ bảng nhân viên (Employees)
select max(BirthDate) as [Ngày sinh lớn nhất]
from Employees