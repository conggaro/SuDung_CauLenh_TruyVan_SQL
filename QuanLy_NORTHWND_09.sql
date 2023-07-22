-- lọc dữ liệu bằng mệnh đề where

-- select cột_1, cột_2,...
-- from tên_bảng
-- where điều_kiện

-- toán tử so sánh trong SQL
-- =		so sánh bằng
-- >		lớn hơn
-- <		bé hơn
-- >=		lớn hơn hoặc bằng
-- <=		bé hơn hoặc bằng
-- <>		khác (giống toán tử !=)


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- nhân viên đến từ London
-- từ bảng nhân viên
select *
from Employees
where City = 'London'

select count(Country) as N'Đếm số lượng nhân viên đến từ thành phố London'
from Employees
where City = 'London'


-- 2. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- nhân viên đến từ London
-- từ bảng nhân viên
-- sắp xếp A -> Z theo họ
select	EmployeeID as N'Mã nhân viên',
		LastName as N'Họ (Sắp xếp A => Z theo họ)',
		FirstName as N'Tên',
		City as N'Thành phố'
from Employees
where City = 'London'
order by LastName asc


-- 3. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- lọc ra tất cả đơn hàng bị giao muộn
-- biết rằng ngày phải giao là RequiredDate
-- ngày giao hàng thực tế là ShippedDate
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		convert(varchar, RequiredDate, 103) as N'Ngày phải giao hàng',
		convert(varchar, ShippedDate, 103) as N'Ngày giao thực tế (bị giao muộn)'
from Orders
where RequiredDate < ShippedDate


-- 4. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- đếm số lượng đơn hàng bị giao muộn
-- từ bảng đơn hàng
select	count(*) as N'Số lượng đơn hàng bị giao muộn'
from Orders
where RequiredDate < ShippedDate


-- 5. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- được giảm giá nhiều hơn 10%
-- từ bảng chi tiết đơn hàng
select OrderID as N'Mã đơn hàng',
		Discount * 100 as N'Giảm giá (%)'
from [Order Details]
where Discount > 0.1


-- 6. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- được gửi đến quốc gia "France"
-- từ bảng đơn hàng
select	OrderID as N'Mã đơn hàng',
		ShipCountry as N'Giao hàng đến quốc gia'
from Orders
where ShipCountry = 'France'