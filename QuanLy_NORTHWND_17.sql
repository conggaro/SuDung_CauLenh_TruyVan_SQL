use NORTHWND;

-- các hàm về ngày - tháng - năm trong SQL
-- hàm day(date)
-- hoặc day(datetime)

-- hàm month(date)
-- hoặc month(datetime)

-- hàm year(date)
-- hoặc year(datetime)


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- đếm số lượng đơn đặt hàng
-- trong năm 1997
-- theo nhóm khách hàng
-- theo năm 1997
-- từ bảng đơn hàng
select	CustomerID as N'Mã khách hàng',
		year(OrderDate) as N'Năm đặt hàng',
		count(OrderID) as N'Số lượng đơn đặt hàng trong năm 1997'
from Orders
where year(OrderDate) = 1997
group by CustomerID, year(OrderDate)


-- 2. viết câu lệnh SQL
-- đếm số lượng đơn đặt hàng
-- trong tháng 5 năm 1997
-- theo nhóm khách hàng
-- theo tháng 5
-- theo năm 1997
-- từ bảng đơn hàng
select	CustomerID as N'Mã khách hàng',
		month(OrderDate) as N'Tháng',
		year(OrderDate) as N'Năm',
		count(OrderID) as N'Số lượng đơn đặt hàng trong tháng 5 năm 1997'
from Orders
where month(OrderDate) = 5 and year(OrderDate) = 1997
group by CustomerID, month(OrderDate), year(OrderDate)


-- 3. viết câu lệnh SQL
-- đếm số lượng đơn đặt hàng
-- trong ngày 4 tháng 9 năm 1996
-- theo nhóm khách hàng
-- theo ngày 4
-- theo tháng 9
-- theo năm 1996
-- từ bảng đơn hàng
select	CustomerID as N'Mã khách hàng',
		day(OrderDate) as N'Ngày',
		month(OrderDate) as N'Tháng',
		year(OrderDate) as N'Năm',
		count(OrderID) as N'Số lượng đơn đặt hàng trong ngày 4 tháng 9 năm 1996'
from Orders
where day(OrderDate) = 4 and month(OrderDate) = 9 and year(OrderDate) = 1996
group by CustomerID, day(OrderDate), month(OrderDate), year(OrderDate)


-- 4. viết câu lệnh SQL
-- đếm số lượng
-- đơn đặt hàng mỗi tháng
-- trong năm 1998
-- theo nhóm khách hàng
-- theo mỗi tháng
-- theo năm 1998
-- sắp xếp khách hàng tăng dần
-- sắp xếp tháng tăng dần
-- từ bảng đơn hàng
select	CustomerID as N'Mã khách hàng',
		month(OrderDate) as N'Tháng',
		year(OrderDate) as N'Năm',
		count(OrderID) as N'Số lượng đơn hàng theo từng tháng trong năm 1998'
from Orders
where year(OrderDate) = 1998
group by CustomerID, month(OrderDate), year(OrderDate)
order by CustomerID asc, month(OrderDate) asc


-- 5. viết câu lệnh SQL
-- lọc ra các bản ghi đơn hàng
-- đã được giao vào tháng 5
-- sắp xếp tăng dần theo năm
-- từ bảng đơn hàng
select	CustomerID as N'Mã khách hàng',
		month(ShippedDate) as N'Tháng',
		year(ShippedDate) as N'Năm',
		count(OrderID) as N'Đếm số lượng đơn hàng đã được giao'
from Orders
where month(ShippedDate) = 5
group by CustomerID, month(ShippedDate), year(ShippedDate)
order by year(ShippedDate) asc