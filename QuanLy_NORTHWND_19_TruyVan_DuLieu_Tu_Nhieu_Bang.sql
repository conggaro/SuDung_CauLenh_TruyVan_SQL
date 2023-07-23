use NORTHWND;

-- truy vấn dữ liệu từ nhiều bảng

-- nếu điều kiện là cái loại min(), max(), sum(), avg(), count()
-- thì dùng having

-- nếu điều kiện là cái loại = 'UK', hoặc = 'USA', ...
-- thì dùng where

--|YÊU CẦU|

-- 1. viết câu lệnh SQL
-- từ bảng sản phẩm
-- và từ bảng thể loại
-- hãy in ra các thông tin sau đây
-- mã sản phẩm
-- tên sản phẩm
-- mã thể loại
-- tên thể loại
/*
   1 mã thể loại => được in ở trên nhiều sản phẩm
*/
select	san_pham.ProductID as N'Mã sản phẩm',
		san_pham.ProductName as N'Tên sản phẩm',
		the_loai.CategoryID as N'Mã thể loại',
		the_loai.CategoryName as N'Tên thể loại'

from	Products as san_pham, 
		Categories as the_loai

where	san_pham.CategoryID = the_loai.CategoryID


-- 2. viết câu lệnh SQL
-- từ bảng nhân viên
-- và từ bảng đơn hàng
-- hãy in ra các thông tin sau đây
-- mã nhân viên
-- tên nhân viên
-- số lượng đơn hàng mà nhân viên đã bán được
/*
   1 mã nhân viên => được in ở trên nhiều đơn hàng
*/
select		[Bảng nhân viên].EmployeeID as N'Mã nhân viên',
			[Bảng nhân viên].LastName as N'Họ',
			[Bảng nhân viên].FirstName as N'Tên',
			count([Bảng đơn hàng].OrderID) as N'Đếm đơn hàng mà nhân viên bán được'

from		Employees as [Bảng nhân viên],
			Orders as [Bảng đơn hàng]

where		[Bảng nhân viên].EmployeeID = [Bảng đơn hàng].EmployeeID

group by	[Bảng nhân viên].EmployeeID,
			[Bảng nhân viên].LastName,
			[Bảng nhân viên].FirstName


-- 3. viết câu lệnh SQL
-- từ bảng khách hàng
-- và từ bảng đơn hàng
-- hãy in ra các thông tin sau đây
-- mã khách hàng
-- tên công ty
-- tên liên hệ
-- số lượng đơn hàng đã đặt
-- với điều kiện: quốc gia của khách hàng là UK
/*
   1 mã khách hàng => được in ở trên nhiều đơn hàng
*/
select		[Bảng khách hàng].CustomerID as N'Mã khách hàng',
			[Bảng khách hàng].CompanyName as N'Tên công ty',
			[Bảng khách hàng].ContactName as N'Tên liên hệ',
			[Bảng khách hàng].Country as N'Quốc gia',
			count([Bảng đơn hàng].OrderID) as N'Đếm số lượng đơn hàng đã đặt'

from		Customers as [Bảng khách hàng],
			Orders as [Bảng đơn hàng]

where		[Bảng khách hàng].CustomerID = [Bảng đơn hàng].CustomerID and
			[Bảng khách hàng].Country = 'UK'

group by	[Bảng khách hàng].CustomerID,
			[Bảng khách hàng].CompanyName,
			[Bảng khách hàng].ContactName,
			[Bảng khách hàng].Country


-- 4. viết câu lệnh SQL
-- từ bảng đơn hàng
-- và từ bảng người giao hàng
-- hãy in ra các thông tin sau đây
-- mã công ty vận chuyển
-- tên công ty vận chuyển
-- tổng số tiền vận chuyển
-- sắp xếp giảm dần (theo tổng số tiền vận chuyển)
/*
   1 mã công ty vận chuyển => được in ở trên nhiều đơn hàng
*/
select		[Bảng công ty vận chuyển].ShipperID as N'Mã công ty vận chuyển',
			[Bảng công ty vận chuyển].CompanyName as N'Tên công ty vận chuyển',
			sum([Bảng đơn hàng].Freight) as N'Tổng số tiền vận chuyển'

from		Shippers as [Bảng công ty vận chuyển],
			Orders as [Bảng đơn hàng]

where		[Bảng công ty vận chuyển].ShipperID = [Bảng đơn hàng].ShipVia

group by	[Bảng công ty vận chuyển].ShipperID,
			[Bảng công ty vận chuyển].CompanyName

order by	sum([Bảng đơn hàng].Freight) desc


-- 5. viết câu lệnh SQL
-- từ bảng sản phẩm
-- và từ bảng nhà cung cấp
-- hãy in ra các thông tin sau đây
-- mã nhà cung cấp
-- tên công ty
-- đếm số sản phẩm khác nhau đã cung cấp
-- sắp xếp giảm dần (theo số sản phẩm khác nhau đã cung cấp)

-- lấy ra bản ghi có "số sản phẩm khác nhau đã cung cấp" lớn nhất
-- (chính là lấy ra bản ghi đầu tiên luôn)

/*
   1 mã nhà cung cấp => được in ở trên nhiều sản phẩm
*/
select top 1	[Bảng nhà cung cấp].SupplierID as N'Mã nhà cung cấp',
				[Bảng nhà cung cấp].CompanyName as N'Tên công ty',
				count([Bảng sản phẩm].ProductID) as N'Đếm số sản phẩm khác nhau đã cung cấp'

from			Products as [Bảng sản phẩm],
				Suppliers as [Bảng nhà cung cấp]

where			[Bảng nhà cung cấp].SupplierID = [Bảng sản phẩm].SupplierID

group by		[Bảng nhà cung cấp].SupplierID,
				[Bảng nhà cung cấp].CompanyName

order by		count([Bảng sản phẩm].ProductID) desc


-- 6. viết câu lệnh SQL
-- từ bảng đơn hàng
-- và từ bảng chi tiết đơn hàng
-- hãy in ra các thông tin sau đây
-- mã đơn hàng
-- tổng số tiền sản phẩm của đơn hàng đó
/*
   một đơn hàng => có nhiều mã sản phẩm
*/
select		[Bảng đơn hàng].OrderID as N'Mã đơn hàng',
			sum([Bảng chi tiết đơn hàng].UnitPrice * [Bảng chi tiết đơn hàng].Quantity) as N'Tổng số tiền của đơn hàng'

from		Orders as [Bảng đơn hàng],
			[Order Details] as [Bảng chi tiết đơn hàng]

where		[Bảng đơn hàng].OrderID = [Bảng chi tiết đơn hàng].OrderID

group by	[Bảng đơn hàng].OrderID


-- 7. viết câu lệnh SQL
-- từ bảng đơn hàng
-- từ bảng chi tiết đơn hàng
-- và từ bảng nhân viên
-- hãy in ra các thông tin sau đây
-- mã đơn hàng
-- tên nhân viên
-- tổng số tiền sản phẩm của đơn hàng đó
/*
   một đơn hàng => có nhiều mã sản phẩm
   một đơn hàng => chỉ ứng với 1 nhân viên
*/
select		[Bảng đơn hàng].OrderID as N'Mã đơn hàng',
			[Bảng nhân viên].LastName as N'Họ',
			[Bảng nhân viên].FirstName as N'Tên',
			sum([Bảng chi tiết đơn hàng].UnitPrice * [Bảng chi tiết đơn hàng].Quantity) as N'Tổng số tiền của đơn hàng'

			-- yêu cầu này sử dụng 3 bảng luôn
from		Orders as [Bảng đơn hàng],
			[Order Details] as [Bảng chi tiết đơn hàng],
			Employees as [Bảng nhân viên]

where		[Bảng đơn hàng].OrderID = [Bảng chi tiết đơn hàng].OrderID and
			[Bảng đơn hàng].EmployeeID = [Bảng nhân viên].EmployeeID

group by	[Bảng đơn hàng].OrderID,
			[Bảng nhân viên].LastName,
			[Bảng nhân viên].FirstName


-- 8. viết câu lệnh SQL
-- từ bảng đơn hàng
-- từ bảng khách hàng
-- và từ bảng công ty vận chuyển
-- hãy in ra các thông tin sau đây
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- với điều kiện
-- các đơn hàng được giao đến 'UK' trong năm 1997
/*
   một đơn hàng => chỉ ứng với 1 khách hàng
   một đơn hàng => chỉ ứng với 1 công ty vận chuyển
*/
select		[Bảng đơn hàng].OrderID as N'Mã đơn hàng',
			[Bảng khách hàng].ContactName as N'Tên khách hàng',
			[Bảng công ty vận chuyển].CompanyName as N'Tên công ty vận chuyển',
			[Bảng đơn hàng].ShipCountry as N'Giao hàng đến quốc gia',
			year([Bảng đơn hàng].ShippedDate) as N'Năm'

from		Orders as [Bảng đơn hàng],
			Customers as [Bảng khách hàng],
			Shippers as [Bảng công ty vận chuyển]

where		[Bảng đơn hàng].CustomerID = [Bảng khách hàng].CustomerID and
			[Bảng đơn hàng].ShipVia = [Bảng công ty vận chuyển].ShipperID and
			[Bảng đơn hàng].ShipCountry = 'UK' and
			year([Bảng đơn hàng].ShippedDate) = 1997

group by	[Bảng đơn hàng].OrderID,
			[Bảng khách hàng].ContactName,
			[Bảng công ty vận chuyển].CompanyName,
			[Bảng đơn hàng].ShipCountry,
			year([Bảng đơn hàng].ShippedDate)

-- cách 2: sử dụng like
select		[Bảng đơn hàng].OrderID as N'Mã đơn hàng',
			[Bảng khách hàng].ContactName as N'Tên khách hàng',
			[Bảng công ty vận chuyển].CompanyName as N'Tên công ty vận chuyển',
			[Bảng đơn hàng].ShipCountry as N'Giao hàng đến quốc gia',
			year([Bảng đơn hàng].ShippedDate) as N'Năm'

from		Orders as [Bảng đơn hàng],
			Customers as [Bảng khách hàng],
			Shippers as [Bảng công ty vận chuyển]

where		[Bảng đơn hàng].CustomerID = [Bảng khách hàng].CustomerID and
			[Bảng đơn hàng].ShipVia = [Bảng công ty vận chuyển].ShipperID and
			[Bảng đơn hàng].ShipCountry like 'UK' and
			year([Bảng đơn hàng].ShippedDate) = 1997

group by	[Bảng đơn hàng].OrderID,
			[Bảng khách hàng].ContactName,
			[Bảng công ty vận chuyển].CompanyName,
			[Bảng đơn hàng].ShipCountry,
			year([Bảng đơn hàng].ShippedDate)