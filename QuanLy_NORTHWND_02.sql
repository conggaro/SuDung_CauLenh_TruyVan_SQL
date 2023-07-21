use NORTHWND;

-- Học câu lệnh truy vấn
-- select distinct ... from ...

-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tên các quốc gia khác nhau (Country)
-- từ bảng khách hàng (Customers)
select distinct Country as N'Tên quốc gia'
from Customers


-- 2. viết câu lệnh SQL
-- lấy ra tên các mã bưu điện khác nhau (PostalCode)
-- từ bảng nhà cung cấp (Suppliers)
select distinct PostalCode as N'Mã bưu điện'
from Suppliers


-- 3. viết câu lệnh SQL
-- lấy ra họ nhân viên khác nhau (LastName)
-- và cách gọi danh hiệu lịch sự (TitleOfCourtesy)
-- của nhân viên
-- từ bảng nhân viên (Employees)
-- => "mục đích là lấy ra họ khác nhau"
select distinct LastName as N'Họ', TitleOfCourtesy as N'Danh hiệu'
from Employees


-- 4.viết câu lệnh SQL
-- lấy ra danh hiệu khác nhau (TitleOfCourtesy)
-- của nhân viên
-- từ bảng nhân viên (Employees)
select distinct TitleOfCourtesy as N'Danh hiệu'
from Employees


-- 5. viết câu lệnh SQL
-- lấy ra mã đơn vị vận chuyển khác nhau (ShipVia)
-- từ bảng đơn hàng (Orders)
select distinct ShipVia as N'Mã đơn vị vận chuyển'
from Orders