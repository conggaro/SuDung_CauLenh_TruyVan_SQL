use NORTHWND;

-- nhóm các bản ghi với nhau
-- sử dụng group by

-- dùng để nhóm các bản ghi có cùng giá trị

-- thường được dùng với các hàm:
-- count()
-- max()
-- min()
-- sum()
-- avg()

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where điều_kiện
-- group by tên_cột
-- order by tên_cột asc (hoặc desc)


-- |YÊU CẦU|

-- 1. viết câu lệch SQL
-- hãy cho biết
-- mỗi khách hàng
-- đã đặt bao nhiêu đơn hàng
-- từ bảng đơn hàng

-- tức là:
-- một khách hàng có thể đặt nhiều đơn hàng
select	CustomerID as N'Mã khách hàng',
		count(OrderID) as N'Đếm số lượng đơn hàng đã đặt của 1 người'
from Orders
group by CustomerID


-- 2. viết câu lệch SQL
-- hãy tính 
-- trung bình giá của các sản phẩm
-- theo mỗi nhà cung cấp sản phẩm
-- từ bảng sản phẩm

-- tức là:
-- một nhà cung cấp
-- có thể cung cấp nhiều sản phẩm (nhiều id sản phẩm khác nhau)
select	SupplierID as N'Mã nhà cung cấp',
		avg(UnitPrice) as N'Giá trung bình của các sản phẩm (theo nhóm nhà cung cấp)'
from Products
group by SupplierID


-- 3. viết câu lệch SQL
-- hãy tính 
-- tổng số lượng của các sản phẩm
-- theo mã thể loại
-- từ bảng sản phẩm

-- tức là:
-- một mã thể loại
-- có nhiều kiểu số lượng
select	CategoryID as N'Mã thể loại',
		sum(UnitsInStock) as N'Tổng số lượng sản phẩm trong kho (theo nhóm mã thể loại)'
from Products
group by CategoryID


-- 4. viết câu lệch SQL
-- hãy tìm giá vận chuyển thấp nhất
-- hãy tìm giá vận chuyển lớn nhất
-- của các đơn hàng
-- theo nhóm thành phố
-- theo nhóm quốc gia
-- từ bảng đơn hàng

-- tức là:
-- một mã thể loại
-- có nhiều kiểu số lượng
select	ShipCountry as N'Giao đến quốc gia',
		ShipCity as N'Giao đến thành phố',
		min(Freight) as N'Giá vận chuyển nhỏ nhất',
		max(Freight) as N'Giá vận chuyển lớn nhất'
from Orders
group by ShipCountry, ShipCity
order by ShipCountry asc, ShipCity asc


-- 5. viết câu lệch SQL
-- lấy ra các bản ghi
-- đếm số lượng thành phố
-- theo nhóm tên quốc gia
-- từ bảng đơn hàng

-- tức là:
-- một quốc gia thì nó nhiều thành phố
select	ShipCountry as N'Tên quốc gia',
		count(ShipCity) as N'Đếm số lượng thành phố (theo nhóm tên quốc gia)'
from Orders
group by ShipCountry


-- 6. viết câu lệch SQL
-- lấy ra các bản ghi
-- đếm số lượng nhân viên
-- theo nhóm tên quốc gia
-- từ bảng nhân viên
select	Country as N'Tên quốc gia',
		count(EmployeeID) as N'Đếm số lượng nhân viên (theo nhóm tên quốc gia)'
from Employees
group by Country