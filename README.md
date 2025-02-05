# Tính toàn vẹn dữ liệu
<pre>Tính toàn vẹn dữ liệu (Data Integrity) là khái niệm trong quản lý dữ liệu nhằm đảm bảo rằng dữ liệu là chính xác, đáng tin cậy, và nhất quán trong toàn bộ vòng đời của nó.
Nó bao gồm các quy trình, quy tắc và cơ chế đảm bảo dữ liệu không bị hỏng hóc, mất mát, hoặc bị thay đổi không mong muốn.</pre>

# Sử dụng câu lệnh truy vấn SQL
Link học: https://www.youtube.com/watch?v=kQRpe1HkALE&list=PLyxSzL3F7484deka_j1czssCiHygV6oF-
# Sử dụng hàm
1. CONVERT(nvarchar(10), tên_cột, 103) dùng để chuyển datetime sang nvarchar(10).
2. CAST(tên_cột as kiểu_dữ_liệu), ví dụ CAST(id as nvarchar(50)).
# Kiểu dữ liệu
1. DATE định dạng YYYY-MM-DD (năm-tháng-ngày).
2. DATETIME định dạng: YYYY-MM-DD HH: MI: SS (năm-tháng-ngày giờ: phút: giây).
# Câu lệnh điều kiện If
if tên_biến > 0<br>
begin<br>
  print N'Kết quả: lớn hơn 0';<br>
end;<br>

else if tên_biến < 0<br>
begin<br>
  print N'Kết quả: nhỏ hơn 0';<br>
end;<br>

else if tên_biến = 0<br>
begin<br>
  print N'Kết quả: bằng 0';<br>
end;<br>

else<br>
begin<br>
  print N'Kết quả: chắc là bị NULL rồi!';<br>
end;
# Thêm khóa chính
alter table tên_bảng<br>
add constraint tên_ràng_buộc<br>
primary key (tên_cột);
# Thêm khóa ngoại
alter table tên_bảng_con<br>
add constraint tên_ràng_buộc<br>
foreign key (tên_cột_con)<br>
references tên_bảng_cha (tên_cột_cha);

# Sử dụng SQL Server bằng Command Prompt
Chế độ thường (Windows Authentication)<br>
<code>sqlcmd -S <tên server> -d <tên database> -E</code>
<br>

Chế độ xác thực (SQL Server Authentication)<br>
<code>sqlcmd -S <tên server> -d <tên database> -U <tên đăng nhập> -P <mật khẩu></code><br>
Ví dụ: sqlcmd -S 192.168.60.22,1433 -d HISTAFF_SQL_DEV -U sa -P MatKhau@123

<br>
Khi truy cập thành công thì trên màn hình có ký tự "1>"
<br>
Bạn chỉ cần gõ:<br>
<code>select * from Tên_bảng</code><br>
<code>go</code>

# Định dạng số
Nếu bạn muốn 123456789 thành 123,456,789<br>
<code>DECLARE @number BIGINT = 123456789;
SELECT FORMAT(@number, '#,##0');</code>

# Thực thi lệnh SQL từ 1 biến có kiểu dữ liệu nvarchar(max)
Cách 1:<br>
<code>declare @sqlString nvarchar(max);
set @sqlString = 'select * from HU_EMPLOYEE';
execute sp_executesql @sqlString;</code>
<br><br>
Cách 2: <br>
<code>declare @sqlString nvarchar(max);
set @sqlString = 'select * from HU_EMPLOYEE';
execute(@sqlString);</code>

# Trong SQL Server không thể truyền tham chiếu
Trong SQL Server, không có khái niệm về truyền tham chiếu giống như trong một số ngôn ngữ lập trình như C++ hoặc Java. Trong SQL Server, tham số của các hàm và thủ tục được truyền theo kiểu "truyền tham trị" (pass by value).<br>

Khi bạn truyền một tham số cho một hàm hoặc thủ tục trong SQL Server, giá trị của tham số đó được sao chép và chuyển đến hàm hoặc thủ tục đó. Điều này có nghĩa là bất kỳ thay đổi nào bạn thực hiện trên tham số trong hàm hoặc thủ tục đó không ảnh hưởng đến giá trị của tham số gốc bên ngoài.<br>

Tóm lại, trong SQL Server, không có khả năng truyền tham chiếu giống như trong một số ngôn ngữ lập trình khác.<br>

# Sử dụng câu lệnh "set nocount on"
Câu lệnh <code>set nocount on</code><br>
trong SQL Server được sử dụng để tắt việc<br>
trả về số hàng bị ảnh hưởng bởi các câu lệnh DML (Data Manipulation Language)<br>
như INSERT, UPDATE hoặc DELETE.<br>
Khi bạn thực hiện một trong những câu lệnh này,<br>
SQL Server mặc định sẽ trả về một thông báo với số lượng hàng bị ảnh hưởng,<br>
nhưng khi bạn sử dụng <code>set nocount on</code>,<br>
thông báo này sẽ không được trả về.<br>

Việc tắt thông báo số hàng bị ảnh hưởng<br>
có thể hữu ích trong một số trường hợp,<br>
như khi bạn muốn giảm kích thước dữ liệu trả về từ cơ sở dữ liệu<br>
hoặc tăng hiệu suất của ứng dụng.<br>
Tuy nhiên, cũng cần lưu ý rằng việc tắt thông báo này<br>
có thể làm mất đi thông tin quan trọng<br>
mà bạn có thể cần biết để theo dõi và gỡ lỗi các truy vấn.<br>

# Lấy ra giờ phút giây
<pre>select	DATEPART(HOUR, HOURS_START) as [hour],
		DATEPART(MINUTE, HOURS_START) as [minute],
		DATEPART(SECOND, HOURS_START) as [second]
from	AT_SHIFT;</pre>

<br>

<pre>SELECT FORMAT(HOURS_START, 'HH:mm:ss') AS time_part
FROM AT_SHIFT;</pre>

# Thêm cột cho bảng có sẵn
<pre>alter table HU_FAMILY_EDIT
add TAX_PLACE bigint;</pre>

# Sửa kiểu dữ liệu cho cột
<pre>alter table HU_FAMILY
alter column IS_HOUSEHOLD bigint null;</pre>

# Chèn bản ghi có kiểu dữ liệu DateTime
<pre>CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName NVARCHAR(100),
    EventDate DATETIME
);
</pre>
<pre>INSERT INTO Events (EventID, EventName, EventDate)
VALUES (1, 'Conference', '2024-07-29 15:30:00');
</pre>

# Truy vấn tên cột và kiểu dữ liệu của cột đó
<pre>SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tên_bảng'</pre>

# Tạo đối tượng Date ở thời điểm hiện tại
<pre>let currentDate = new Date();</pre>

# Lấy ngày, tháng, năm
<pre>    let current = new Date();
    let y = current.getFullYear();
    let m = current.getMonth() + 1;
    let d = current.getDate();</pre>

# Đệ quy SQL tìm phòng ban con
<pre>WITH OrganizationCTE AS
(
    -- Điều kiện bắt đầu, tương đương với START WITH trong Oracle
    SELECT ID, PARENT_ID, [NAME]
    FROM HU_ORGANIZATION
    WHERE ID = 1
    
    UNION ALL
    
    -- Điều kiện đệ quy, tương đương với CONNECT BY trong Oracle
    SELECT org.ID, org.PARENT_ID, org.[NAME]
    FROM HU_ORGANIZATION org
    INNER JOIN OrganizationCTE ec ON org.PARENT_ID = ec.ID
)
-- Truy vấn từ CTE đệ quy
SELECT *
FROM OrganizationCTE;</pre>

# Sử dụng "group by"
<pre>select		b2.[name] as WORK_STATUS_NAME,
			count(*) as TOTAL

from		HU_EMPLOYEE b1
left join	SYS_OTHER_LIST b2
on			b1.WORK_STATUS_ID = b2.ID
group by	b2.[name]</pre>

<br>

<pre>select		b2.[NAME] as WORK_STATUS_NAME,
			b3.[NAME] as EMPLOYEE_OBJECT_NAME,
			count(*) as TOTAL

from		HU_EMPLOYEE b1
left join	SYS_OTHER_LIST b2
on			b1.WORK_STATUS_ID = b2.ID
left join	SYS_OTHER_LIST b3
on			b1.EMPLOYEE_OBJECT_ID = b3.ID
group by	b2.[NAME], b3.[NAME];</pre>

# HAVING có thể được sử dụng để lọc các nhóm
<pre>select		b2.[NAME] as WORK_STATUS_NAME,
			b3.[NAME] as EMPLOYEE_OBJECT_NAME,
			count(*) as TOTAL

from		HU_EMPLOYEE b1
left join	SYS_OTHER_LIST b2
on			b1.WORK_STATUS_ID = b2.ID
left join	SYS_OTHER_LIST b3
on			b1.EMPLOYEE_OBJECT_ID = b3.ID
group by	b2.[NAME], b3.[NAME]
having		b2.[NAME] = N'Đang làm việc';</pre>

# Phân trang với OFFSET và FETCH NEXT
<pre>DECLARE @PageNumber INT = 1;
DECLARE @PageSize INT = 5;

SELECT *
FROM DanhSach1
ORDER BY id asc
OFFSET ((@PageNumber - 1) * @PageSize) ROWS
FETCH NEXT @PageSize ROWS ONLY;</pre>

# Lấy và bỏ qua (giống Take() và Skip() trong C#)
<pre>SELECT		TOP 10	-- giống take()
			ROW_NUMBER() OVER (ORDER BY b1.ID) AS ROW_NUM,
			*
FROM		(
			SELECT		*
			FROM		HU_EMPLOYEE
			ORDER BY	ID asc
			OFFSET		10 ROWS	-- giống skip()
			) as b1;</pre>

# Thay đổi tên cột
<pre>create table test01 (
    id bigint,
    name varchar(20)
)

insert into test01
values (1, 'test 01'), (2, 'test 02')

select *
from test01

-- sửa tên cột
EXEC sp_rename 'test01.name', 'name_vn', 'COLUMN';</pre>

# Tạo indexes/Key
<pre>CREATE TABLE HU_DEBUG (
    ID BIGINT IDENTITY(1, 1) PRIMARY KEY,

    -- tên đầy đủ là NAME_INTERNATIONALIZATION_CODE
    NAME_INTL_CODE NVARCHAR(255)
);

SELECT *
FROM HU_DEBUG;

-- câu lệnh thêm index
-- CREATE UNIQUE INDEX [IndexName] ON [TableName] ([Column1], [Column2], ...);

-- hoặc dùng câu lệnh này
-- CREATE INDEX [IndexName] ON [TableName] ([Column1], [Column2], ...);

-- hoặc cách này
-- CREATE INDEX IX_HU_DEBUG_NAME_INTL_CODE
-- ON HU_DEBUG (NAME_INTL_CODE ASC, NAME_DEBUG DESC);


CREATE UNIQUE INDEX IX_HU_DEBUG_NAME_INTL_CODE ON HU_DEBUG (NAME_INTL_CODE);

-- xóa index
-- DROP INDEX [IndexName] ON [TableName];
DROP INDEX IX_HU_DEBUG_NAME_INTL_CODE ON HU_DEBUG;

DROP TABLE HU_DEBUG;</pre>

# Câu lệnh select ra danh sách ràng buộc tham chiếu
<pre>SELECT 
    fk.name AS ForeignKeyName,
    tp.name AS ParentTable,
    cp.name AS ParentColumn,
    tr.name AS ReferencedTable,
    cr.name AS ReferencedColumn
FROM 
    sys.foreign_keys AS fk
INNER JOIN 
    sys.foreign_key_columns AS fkc 
    ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.tables AS tp 
    ON fk.parent_object_id = tp.object_id
INNER JOIN 
    sys.columns AS cp 
    ON fkc.parent_object_id = cp.object_id 
       AND fkc.parent_column_id = cp.column_id
INNER JOIN 
    sys.tables AS tr 
    ON fkc.referenced_object_id = tr.object_id
INNER JOIN 
    sys.columns AS cr 
    ON fkc.referenced_object_id = cr.object_id 
       AND fkc.referenced_column_id = cr.column_id
WHERE 
    tp.name = 'HU_CONTRACT'; -- Thay 'YourTableName' bằng tên bảng bạn muốn kiểm tra</pre>

# Câu lệnh xóa tất cả ràng buộc tham chiếu trong 1 bảng
<pre>DECLARE @TableName NVARCHAR(MAX) = 'HU_CONTRACT'; -- Tên bảng cần xóa FOREIGN KEYS
DECLARE @SQL NVARCHAR(MAX);

-- Tìm và tạo lệnh xóa FOREIGN KEYS liên quan đến bảng
SELECT @SQL = STRING_AGG('ALTER TABLE ' + QUOTENAME(t.name) + 
                         ' DROP CONSTRAINT ' + QUOTENAME(fk.name), '; ')
FROM sys.foreign_keys fk
JOIN sys.tables t ON fk.parent_object_id = t.object_id
WHERE t.name = @TableName;

-- Thực thi lệnh nếu tìm thấy FOREIGN KEYS
IF @SQL IS NOT NULL 
BEGIN
    PRINT @SQL; -- In ra câu lệnh SQL (nếu cần kiểm tra)
    EXEC sp_executesql @SQL;
END
ELSE
    PRINT 'No FOREIGN KEYS found for the table ' + @TableName;</pre>

# CTE (Common Table Expression) _ đệ quy cây phòng ban
<pre>WITH DepartmentTree AS (
    -- Bước 1: Chọn phòng ban gốc (phòng ban cha có Parent_ID = NULL hoặc ID cụ thể)
    SELECT
        ID,
        NAME,
        PARENT_ID,
        1 AS LEVEL -- Gốc bắt đầu từ Level 1
    FROM HU_ORGANIZATION
    WHERE PARENT_ID IS NULL  
    -- Hoặc `WHERE ID = @ParentID` nếu có đầu vào cụ thể

    UNION ALL

    -- Bước 2: Đệ quy lấy các phòng ban con
    SELECT 
        d.ID, 
        d.NAME, 
        d.PARENT_ID, 
        dt.LEVEL + 1 AS LEVEL -- Level tăng dần
    FROM HU_ORGANIZATION d
    INNER JOIN DepartmentTree dt ON d.PARENT_ID = dt.ID
)

SELECT
    ID,
    CASE
        WHEN LEVEL = 1 THEN NAME
        ELSE REPLICATE('   ', LEVEL) + NAME
    end AS name,
    PARENT_ID,
    LEVEL
FROM
    DepartmentTree
ORDER BY
    LEVEL,
    PARENT_ID;</pre>

# Hàm EXISTS trong SQL Server là gì?
<pre>Hàm EXISTS trong SQL Server được dùng để kiểm tra sự tồn tại của bản ghi trong một tập kết quả con (subquery).

Nếu có ít nhất một bản ghi trong subquery, EXISTS trả về TRUE.
Nếu không có bản ghi nào, EXISTS trả về FALSE.
Nó thường được sử dụng trong câu lệnh WHERE để lọc dữ liệu theo điều kiện.</pre>
<br>
<pre>SELECT *
FROM SinhVien SV
WHERE EXISTS (
    SELECT 1
    FROM KetQua KQ
    WHERE KQ.MaSV = SV.MaSV
);
</pre>
