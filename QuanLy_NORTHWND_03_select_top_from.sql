-- câu lệnh truy vấn
-- select ... top ... from ...

use NORTHWND;

-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra 5 dòng đầu tiên
-- trong bảng khách hàng (Customers)
select top 5 *
from Customers


-- 2. viết câu lệnh SQL
-- lấy ra 5 dòng đầu tiên
-- lấy ra số điện thoại
-- lấy ra tên quốc gia
-- trong bảng khách hàng (Customers)
select top 5 Phone as N'Số điện thoại', Country as N'Quốc gia'
from Customers


-- 3. viết câu lệnh SQL
-- lấy ra 30 % nhân viên
-- của công ty
-- từ bảng nhân viên (Employees)
select top 30 percent *
from Employees


-- 4. viết câu lệnh SQL
-- lấy ra 50 % bản ghi trong 1 bảng
-- lấy ra họ nhân viên
-- lấy ra tên nhân viên
-- từ bảng nhân viên (Employees)
select top 50 percent LastName as N'Họ', FirstName as N'Tên'
from Employees


-- 5. viết câu lệnh SQL
-- lấy ra bản ghi đơn hàng
-- lấy ra mã khách hàng không bị trùng lặp
-- chỉ lấy 5 dòng đầu tiên
-- từ bảng đơn hàng
select distinct top 5 CustomerID as N'Mã khách hàng'
from Orders


-- 6. viết câu lệnh SQL
-- lấy ra mã loại sản phẩm không bị trùng lặp (CategoryID)
-- chỉ lấy 3 dòng đầu tiên
-- từ bảng sản phẩm (Products)
select distinct top 3 CategoryID as N'Mã loại sản phẩm'
from Products