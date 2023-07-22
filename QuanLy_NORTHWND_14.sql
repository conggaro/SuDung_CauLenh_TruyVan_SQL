use NORTHWND;

-- lọc dữ liệu trong danh sách
-- sử dụng toán tử
-- in
-- hoặc not in

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where tên_cột in (giá_trị_1, giá_trị_2, ...)

-- toán tử in thì tương tự với toán tử or
-- kiểm tra lần lượt tất cả giá trị của bản ghi
-- nếu giá trị của bản ghi
-- bằng giá_trị_1, hoặc bằng giá_trị_2, hoặc bằng ...
-- thì in ra màn hình

-- giúp câu lệnh viết ngắn gọn
-- (thay vì phải dùng toán tử or)

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where tên_cột not in (giá_trị_1, giá_trị_2, ...)

-- toán tử not in thì ngược lại với toán tử in


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- đơn hàng được giao đến
-- Germany, hoặc UK, hoặc Brazil
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao đến quốc gia'
from Orders
where ShipCountry in ('Germany', 'UK', 'Brazil')

-- cách 2: dùng toán tử or
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao đến quốc gia'
from Orders
where (ShipCountry = 'Germany') or (ShipCountry = 'UK') or (ShipCountry = 'Brazil')


-- 2. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- đơn hàng được giao đến
-- các quốc gia khác Germany, hoặc khác UK, hoặc khác Brazil
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao đến quốc gia'
from Orders
where ShipCountry not in ('Germany', 'UK', 'Brazil')

-- cách 2: dùng toán tử or
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao đến quốc gia'
from Orders
where not((ShipCountry = 'Germany') or (ShipCountry = 'UK') or (ShipCountry = 'Brazil'))


-- 3. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- có mã thể loại
-- khác với 2, khác với 3, khác với 4
-- từ bảng sản phẩm
select	ProductID as N'Mã sản phẩm',
		CategoryID as N'Mã thể loại'
from Products
where CategoryID not in (2, 3, 4)


-- 4. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- có mã thể loại
-- là 2, hoặc 3, hoặc 4
-- từ bảng sản phẩm
select	ProductID as N'Mã sản phẩm',
		CategoryID as N'Mã thể loại'
from Products
where CategoryID in (2, 3, 4)


-- 5. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- không phải là nữ
-- từ bảng nhân viên
select	EmployeeID as N'Mã nhân viên',
		TitleOfCourtesy as N'Danh vị'
from Employees
where TitleOfCourtesy not in ('Ms.', 'Mrs.')


-- 6. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- phải là nữ
-- từ bảng nhân viên
select	EmployeeID as N'Mã nhân viên',
		TitleOfCourtesy as N'Danh vị'
from Employees
where TitleOfCourtesy in ('Ms.', 'Mrs.')


-- 7. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện khách hàng
-- phải đến từ các thành phố
-- Berlin, hoặc London, hoặc Warszawa
-- từ bảng khách hàng
select	CustomerID as N'Mã khách hàng',
		City as N'Thành phố'
from Customers
where City in ('Berlin', 'London', 'Warszawa')