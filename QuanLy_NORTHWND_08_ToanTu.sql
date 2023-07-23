use NORTHWND;

-- các phép toán trong SQL
-- + => cộng
-- - => trừ
-- * => nhân
-- / => chia
-- % => chia lấy dư

-- |YÊU CẦU|

-- 1. viết câu lệnh SQL
-- tính số lượng sản phẩm còn lại trong kho
-- sau khi bán hết các sản phẩm đã được đặt hàng
-- StockRemaining là số lượng sản phẩm còn lại trong kho
-- UnitsInStock là tổng sản phẩm trong kho

-- UnitsOnOrder là sản phẩm trong đơn hàng
-- nó kiểu người ta đặt mà chưa giao đi
-- thì nó vẫn ở trong kho
select	ProductID as N'Mã sản phẩm',
		ProductName as N'Tên sản phẩm',
		UnitsInStock - UnitsOnOrder as N'Sản phẩm còn lại trong kho'
from Products


-- 2. viết câu lệnh SQL
-- tính giá trị đơn hàng
-- cho tất cả sản phẩm
-- từ bảng chi tiết đơn hàng
select	ProductID as N'Mã sản phẩm',
		UnitPrice * Quantity as N'Giá trị đơn hàng'
from [Order Details]


-- 3. viết câu lệnh SQL
-- tính tỷ lệ
-- giá vận chuyển
-- đơn đặt hàng trung bình của các đơn hàng
-- so với giá trị vận chuyển của đơn hàng lớn nhất
-- từ bảng đơn hàng
select avg(Freight) / max(Freight) as N'Tỷ lệ'
from Orders


-- 4. viết câu lệnh SQL
-- lấy ra tất cả bản ghi
-- in ra giá của sản phẩm
-- sau khi được giảm giá 10%
-- từ bảng sản phẩm
select	UnitPrice as N'Giá ban đầu',
		UnitPrice - (UnitPrice * 10 / 100) as N'Sau khi giảm giá 10%'
from Products