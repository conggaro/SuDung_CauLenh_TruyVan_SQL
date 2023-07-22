use NORTHWND;

-- kiểm tra dữ liệu null trong SQL
-- sử dụng
-- is null
-- hoặc is not null

-- select cột_1, cột_2
-- from tên_bảng
-- where tên_cột is null

-- cái cột bị (where tên_cột is null) thì
-- tất cả giá trị trong cột đó là NULL
-- is null là đi tìm các giá trị NULL

-- select cột_1, cột_2
-- from tên_bảng
-- where tên_cột is not null

-- is not null là đi tìm các giá trị khác NULL


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- chưa được giao (ShippedDate => NULL)
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShippedDate as N'Ngày giao hàng thực tế (Chưa được giao nên NULL)'
from Orders
where ShippedDate is null


-- 2. viết câu lệnh SQL
-- đếm xem
-- có bao nhiêu
-- đơn hàng
-- chưa được giao (ShippedDate => NULL)
-- từ bảng đơn hàng
select count(*) as N'Số đơn hàng chưa được giao'
from Orders
where ShippedDate is null


-- 3. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- khách hàng
-- có khu vực không bị NULL
-- từ bảng khách hàng
select	CustomerID as N'Mã khách hàng',
		Region as N'Khu vực'
from Customers
where Region is not null


-- 4. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- khách hàng
-- có khu vực bị NULL
-- từ bảng khách hàng
select	CustomerID as N'Mã khách hàng',
		Region as N'Khu vực'
from Customers
where Region is null


-- 5. viết câu lệnh SQL
-- đếm xem
-- có bao nhiêu
-- khách hàng
-- có khu vực bị NULL
-- từ bảng khách hàng
select count(*) as N'Số lượng khách hàng có khu vực bị NULL'
from Customers
where Region is null


-- 6. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- khách hàng
-- không có tên công ty
-- từ bảng khách hàng
select	CustomerID as N'Mã khách hàng',
		CompanyName as N'Tên công ty'
from Customers
where (CompanyName = '') or (CompanyName is null)


-- 7. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- khách hàng
-- có tên công ty
-- từ bảng khách hàng
select	CustomerID as N'Mã khách hàng',
		CompanyName as N'Tên công ty'
from Customers
where (CompanyName != '') or (CompanyName is not null)

-- cách 2:
select	CustomerID as N'Mã khách hàng',
		CompanyName as N'Tên công ty'
from Customers
where (CompanyName <> '') or (CompanyName is not null)


-- 8. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- với điều kiện
-- chưa được giao hàng
-- và có khu vực giao hàng không bị NULL
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShippedDate as N'Ngày giao hàng thực tế (chưa giao nên bị null)',
		ShipRegion as N'Khu vực giao hàng'
from Orders
where (ShippedDate is null) and (ShipRegion is not null)