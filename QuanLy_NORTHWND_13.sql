use NORTHWND;

-- ký tự đại diện trong SQL

-- nó còn được gọi là Wildcard

-- dấu %
-- đại diện cho 0 ký tự
-- đại diện cho 1 ký tự
-- đại diện cho nhiều ký tự
-- ví dụ:
-- bl%
-- tìm được: bl, black, blue, blob, ...

-- dấu _
-- đại diện cho 1 ký tự
-- ví dụ:
-- h_t
-- tìm được: hot, hat, hit, het, hut, ...

-- dấu []
-- đại diện cho 1 ký tự
-- xuất hiện bên trong dấu ngoặc vuông
-- ví dụ:
-- h[oa]t
-- tìm được: hot, hat
-- nhưng không tìm được: hit, het, hut, hst, ...

-- dấu ^
-- nó cũng đại diện cho 1 ký tự
-- nó giống phủ định của cặp dấu ngoặc vuông
-- ví dụ:
-- h[^oa]t
-- tìm được: hit, het, hut, hft, hdt, ...
-- nhưng không tìm được: hot, hat

-- dấu -
-- đại diện cho 1 ký tự
-- trong một khoảng nào đấy
-- ví dụ:
-- c[a-e]t
-- tìm được: cat, cbt, cct, cdt, cet


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tất cả khách hàng
-- có tên liên hệ
-- bắt đầu bằng chữ 'A'
-- từ bảng khách hàng
select	CustomerID as N'Mã khách hàng',
		ContactName as N'Tên liên hệ'
from Customers
where ContactName like 'A%'


-- 2. viết câu lệnh SQL
-- lấy ra tất cả khách hàng
-- có tên liên hệ
-- bắt đầu bằng chữ 'H'
-- và có chữ thứ 2 là bất kỳ ký tự nào
-- từ bảng khách hàng
select	CustomerID as N'Mã khách hàng',
		ContactName as N'Tên liên hệ'
from Customers
where ContactName like 'H_%' -- Nếu không có dấu "_" thì có trường hợp chỉ tìm mỗi chữ H


-- 3. viết câu lệnh SQL
-- lấy ra tất cả các bản ghi
-- được gửi đến thành phố
-- bắt đầu bằng chữ 'L'
-- chữ thứ 2 là 'u' hoặc 'o'
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCity as N'Tên thành phố'
from Orders
where ShipCity like 'L[uo]%'


-- 4. viết câu lệnh SQL
-- lấy ra tất cả các bản ghi
-- được gửi đến thành phố
-- bắt đầu bằng chữ 'L'
-- chữ thứ 2 không phải 'u' hoặc 'o'
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCity as N'Tên thành phố'
from Orders
where ShipCity like 'L[^uo]%'


-- 5. viết câu lệnh SQL
-- lấy ra tất cả các bản ghi
-- được gửi đến thành phố
-- bắt đầu bằng chữ 'L'
-- chữ thứ 2 trong khoảng từ 'a' đến 'e'
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCity as N'Tên thành phố'
from Orders
where ShipCity like 'L[a-e]%'


-- 6. viết câu lệnh SQL
-- lấy ra tất cả các bản ghi
-- có tên công ty
-- bắt đầu bằng chữ 'A'
-- và không chứa ký tự 'b'
-- từ bảng nhà cung cấp
select CompanyName as N'Tên công ty'
from  Suppliers
where CompanyName like 'A%' and not(CompanyName like '%b%')

-- cách 2
select CompanyName as N'Tên công ty'
from  Suppliers
where CompanyName like 'A%[^b]%'