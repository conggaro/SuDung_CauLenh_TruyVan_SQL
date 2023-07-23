use NORTHWND;

-- bài tập truy vấn dữ liệu
-- từ nhiều bảng khác nhau


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- từ bảng sản phẩm
-- và từ bảng mã thể loại
-- in ra các thông tin sau đây
-- mã sản phẩm
-- tên sản phẩm
-- mã thể loại
-- tên thể loại
-- với điều kiện
-- tên thể loại là 'Seafood'
select		[Bảng sản phẩm].ProductID as N'Mã sản phẩm',
			[Bảng sản phẩm].ProductName as N'Tên sản phẩm',
			[Bảng sản phẩm].CategoryID as N'Mã thể loại',
			[Bảng thể loại].CategoryName as N'Tên thể loại'

from		Products as [Bảng sản phẩm],
			Categories as [Bảng thể loại]

where		[Bảng sản phẩm].CategoryID = [Bảng thể loại].CategoryID and
			[Bảng thể loại].CategoryName like 'Seafood'


-- 2. viết câu lệnh SQL
-- từ bảng sản phẩm
-- và từ bảng nhà cung cấp
-- in ra các thông tin sau đây
-- mã sản phẩm
-- tên sản phẩm
-- mã nhà cung cấp
-- quốc gia
-- với điều kiện
-- cung cấp từ nước Đức 'Germany'
select		[Bảng sản phẩm].ProductID as N'Mã sản phẩm',
			[Bảng sản phẩm].ProductName as N'Tên sản phẩm',
			[Bảng sản phẩm].SupplierID as N'Mã nhà cung cấp',
			[Bảng nhà cung cấp].Country as N'Quốc gia'

from		Products as [Bảng sản phẩm],
			Suppliers as [Bảng nhà cung cấp]
			
where		[Bảng sản phẩm].SupplierID = [Bảng nhà cung cấp].SupplierID and
			[Bảng nhà cung cấp].Country like 'Germany'


-- 3. viết câu lệnh SQL
-- từ bảng đơn hàng
-- từ bảng khách hàng
-- và từ bảng công ty vận chuyển
-- in ra các thông tin sau đây
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- với điều kiện
-- khách hàng đến từ thành phố 'London'
select		[Bảng đơn hàng].OrderID as N'Mã đơn hàng',
			[Bảng khách hàng].ContactName as N'Tên khách hàng',
			[Bảng công ty vận chuyển].CompanyName as N'Tên công ty vận chuyển',
			[Bảng khách hàng].City as N'Khách hàng đến từ thành phố'

from		Orders as [Bảng đơn hàng],
			Customers as [Bảng khách hàng],
			Suppliers as [Bảng công ty vận chuyển]

where		[Bảng đơn hàng].CustomerID = [Bảng khách hàng].CustomerID and
			[Bảng đơn hàng].ShipVia = [Bảng công ty vận chuyển].SupplierID and
			[Bảng khách hàng].City like 'London'


-- 4. viết câu lệnh SQL
-- từ bảng đơn hàng
-- từ bảng khách hàng
-- từ bảng công ty vận chuyển
-- in ra các thông tin sau đây
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- ngày yêu cầu giao hàng
-- ngày giao hàng
-- với điều kiện
-- chỉ in ra các đơn hàng bị giao muộn hơn quy định
select		[Bảng đơn hàng].OrderID as N'Mã đơn hàng',
			[Bảng khách hàng].ContactName as N'Tên khách hàng',
			[Bảng công ty vận chuyển].CompanyName as N'Tên công ty vận chuyển',
			convert(varchar, RequiredDate, 103) as N'Ngày yêu cầu giao hàng',
			convert(varchar, ShippedDate, 103) as N'Ngày giao hàng thực tế'

from		Orders as [Bảng đơn hàng],
			Customers as [Bảng khách hàng],
			Shippers as [Bảng công ty vận chuyển]

where		[Bảng đơn hàng].CustomerID = [Bảng khách hàng].CustomerID and
			[Bảng đơn hàng].ShipVia = [Bảng công ty vận chuyển].ShipperID and
			RequiredDate < ShippedDate