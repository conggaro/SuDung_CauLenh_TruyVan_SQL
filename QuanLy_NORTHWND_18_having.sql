use NORTHWND;

-- lọc dữ liệu sau group by
-- sử dụng having

-- select cột_1, cột_2, ...
-- from tên_bảng
-- where điều_kiện
-- group by tên_cột
-- having điều_kiện
-- order by tên_cột asc (hoặc desc)

-- không thể bỏ hàm min(), max(), sum(), avg(), count()
-- vào trong where được

-- nên người ta đẻ ra having
-- để bỏ hàm min(), max(), sum(), avg(), count()
-- vào trong having


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- đếm số lượng đơn hàng
-- theo nhóm mã khách hàng
-- lấy ra nhóm đã đặt nhiều hơn 20 đơn hàng (dùng having, dùng where thì code báo lỗi)
-- sắp xếp giảm dần theo tổng số đơn hàng
-- từ bảng đơn hàng
select	CustomerID as N'Mã khách hàng',
		count(OrderID) as N'Đếm số lượng đơn hàng (theo nhóm mã khách hàng)'
from Orders
group by CustomerID
having count(OrderID) > 20
order by count(OrderID) desc


-- 2. viết câu lệnh SQL
-- lấy tất cả bản ghi
-- đếm số lượng hàng trong kho
-- theo nhóm mã nhà cung cấp
-- với điều kiện tổng số lượng hàng trong kho (lớn hơn 30)
-- với điều kiện trung bình cộng đơn giá (nhỏ hơn 50)
-- từ bảng sản phẩm
select	SupplierID as N'Mã nhà cung cấp',
		sum(UnitsInStock) as N'Tổng số lượng hàng trong kho (theo nhóm mã nhà cung cấp)',
		avg(UnitPrice) as N'Trung bình cộng đơn giá'
from Products
group by SupplierID
having sum(UnitsInStock) > 30 and avg(UnitPrice) < 50


-- 3. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- trong năm 1996
-- tính tổng tiền vận chuyển
-- theo nhóm thời gian giao hàng
-- với điều kiện tháng lớn hơn 6
-- từ bảng đơn hàng
select	month(ShippedDate) as N'Tháng (theo nhóm thời gian giao hàng)',
		year(ShippedDate) as N'Năm',
		sum(Freight) as N'Tổng tiền vận chuyển'
from Orders
where year(ShippedDate) = 1996
group by month(ShippedDate), year(ShippedDate)
having month(ShippedDate) > 6
order by month(ShippedDate) asc

-- cách 2:
select	month(ShippedDate) as N'Tháng (theo nhóm thời gian giao hàng)',
		year(ShippedDate) as N'Năm',
		sum(Freight) as N'Tổng tiền vận chuyển'
from Orders
where ShippedDate between '1996-07-01' and '1996-12-31'
group by month(ShippedDate), year(ShippedDate)
order by month(ShippedDate) asc


-- 4. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- trong năm 1996
-- tính tổng tiền vận chuyển
-- theo nhóm thời gian giao hàng
-- với điều kiện tháng (lớn hơn 6)
-- với điều kiện tổng tiền vận chuyển (lớn hơn 1000 đô la)
-- từ bảng đơn hàng
select	month(ShippedDate) as N'Tháng (theo nhóm thời gian giao hàng)',
		year(ShippedDate) as N'Năm',
		sum(Freight) as N'Tổng tiền vận chuyển'
from Orders
where year(ShippedDate) = 1996
group by month(ShippedDate), year(ShippedDate)
having month(ShippedDate) > 6 and sum(Freight) > 1000
order by month(ShippedDate) asc


-- 5. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- đếm số lượng đơn hàng
-- theo nhóm thành phố
-- với điều kiện số lượng đơn hàng (lớn hơn 16)
-- sắp xếp giảm dần (theo số lượng đơn hàng)
-- từ bảng đơn hàng
select	ShipCity as N'Thành phố',
		count(OrderID) as N'Đếm số lượng đơn hàng (theo nhóm thành phố)'
from Orders
group by ShipCity
having count(OrderID) > 16
order by count(OrderID) desc