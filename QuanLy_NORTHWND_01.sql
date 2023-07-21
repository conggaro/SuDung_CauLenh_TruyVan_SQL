use NORTHWND;

-- |YÊU CẦU|:

-- 1. viết câu lệnh SQL
-- lấy ra tên
-- của tất cả sản phẩm
select ProductName as N'Tên sản phẩm'
from Products;


-- 2. viết câu lệnh SQL
-- lấy ra tên sản phẩm
-- lấy ra giá bán
-- lấy ra số lượng sản phẩm trên mỗi đơn vị
select ProductName as N'Tên sản phẩm', UnitPrice as N'Giá', QuantityPerUnit as N'Số lượng'
from Products;


-- 3. viết câu lệnh SQL
-- lấy ra tên công ty của khách hàng
-- lấy ra quốc gia của khách hàng đó
select CompanyName as N'Tên công ty của khách hàng', Country as N'Quốc gia'
from Customers;


-- 4. viết câu lệnh SQL
-- lấy ra tên của nhà cung cấp
-- lấy ra lấy ra số điện thoại của nhà cung cấp
select CompanyName as N'Tên nhà cung cấp', Phone as N'Số điện thoại'
from Suppliers;