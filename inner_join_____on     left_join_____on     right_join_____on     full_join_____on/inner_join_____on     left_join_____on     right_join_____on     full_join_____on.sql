use NORTHWND;

--các câu lệnh
-- inner join ...
-- on ...

-- left join ...
-- on ...

-- right join ...
-- on ...

-- full join ...
-- on ...


-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- sử dụng inner join
-- hãy in ra các thông tin sau đây
-- mã đơn hàng
-- mã khách hàng
-- tên công ty khách hàng
select			[Bảng đơn hàng].OrderID as N'Mã đơn hàng',
				[Bảng đơn hàng].CustomerID as N'Mã khách hàng',
				[Bảng khách hàng].CompanyName as N'Tên công ty khách hàng'

from			Orders as [Bảng đơn hàng]
inner join		Customers as [Bảng khách hàng]
on				[Bảng đơn hàng].CustomerID = [Bảng khách hàng].CustomerID


-- 2. viết câu lệnh SQL
-- sử dụng inner join
-- hãy in ra các thông tin sau đây
-- mã sản phẩm
-- tên sản phẩm
-- mã thể lọai
-- tên thể loại
select			[Bảng sản phẩm].ProductID as N'Mã sản phẩm',
				[Bảng sản phẩm].ProductName as N'Tên sản phẩm',
				[Bảng sản phẩm].CategoryID as N'Mã thể loại',
				[Bảng mã thể loại].CategoryName as N'Tên thể loại'

from			Products as [Bảng sản phẩm]
inner join		Categories as [Bảng mã thể loại]
on				[Bảng sản phẩm].CategoryID = [Bảng mã thể loại].CategoryID


-- 3. viết câu lệnh SQL
-- sử dụng left join
-- hãy in ra các thông tin sau đây
-- mã thể lọai
-- tên thể loại
-- mã sản phẩm
-- tên sản phẩm
select			[Bảng mã thể loại].CategoryID as N'Mã thể loại',
				[Bảng mã thể loại].CategoryName as N'Tên thể loại',
				[Bảng sản phẩm].ProductID as N'Mã sản phẩm',
				[Bảng sản phẩm].ProductName as N'Tên sản phẩm'

from			Categories as [Bảng mã thể loại]
left join		Products as [Bảng sản phẩm]
on				[Bảng mã thể loại].CategoryID = [Bảng sản phẩm].CategoryID

				-- để hiểu rõ hơn left join
				-- thì thêm where ... is null
where			[Bảng sản phẩm].ProductID is null


-- 4. viết câu lệnh SQL
-- sử dụng right join
-- hãy in ra các thông tin sau đây
-- mã đơn hàng
-- tên công ty khách hàng
select			[Bảng đơn hàng].CustomerID as N'Mã đơn hàng',
				[Bảng khách hàng].CompanyName as N'Tên công ty khách hàng'

from			Orders as [Bảng đơn hàng]
right join		Customers as [Bảng khách hàng]
on				[Bảng đơn hàng].CustomerID = [Bảng khách hàng].CustomerID

				-- để hiểu rõ hơn right join
				-- thì thêm where ... is null
where			[Bảng đơn hàng].OrderID is null


-- 5. viết câu lệnh SQL
-- sử dụng full join
-- hãy in ra các thông tin sau đây
-- mã sản phẩm
-- tên sản phẩm
-- mã thể loại
-- tên thể loại
select			[Bảng sản phẩm].ProductID as N'Mã sản phẩm',
				[Bảng sản phẩm].ProductName as N'Tên sản phẩm',
				[Bảng thể loại].CategoryID as N'Mã thể loại',
				[Bảng thể loại].CategoryName as N'Tên thể loại'

from			Products as [Bảng sản phẩm]
full join		Categories as [Bảng thể loại]
on				[Bảng sản phẩm].CategoryID = [Bảng thể loại].CategoryID

				-- để hiểu rõ hơn full join
				-- thì thêm where ... is null
where			(ProductID is null) or ([Bảng sản phẩm].CategoryID is null)