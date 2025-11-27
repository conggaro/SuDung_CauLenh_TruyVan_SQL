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

# Câu lệnh tự động viết số thứ tự (STT)
<pre>SELECT ROW_NUMBER() OVER (ORDER BY ID ASC) AS STT
       FROM HU_CONTRACT_TYPE;</pre>

# Tạo hàm lấy tất cả phòng ban con từ ID của phòng ban cha
<pre>CREATE FUNCTION [dbo].[GET_DEPARTMENT_HIERARCHY](
    @P_ORGID BIGINT
)
RETURNS @T TABLE(ORG_ID INT)
AS
BEGIN
    DECLARE @V_CUR AS DATE = CAST(GETDATE() AS DATE);

    -- Khai báo CTE để lấy danh sách phòng ban con
    WITH CTE_CONNECT_BY AS (
        SELECT 1 AS LEVEL, S.* 
        FROM HU_ORGANIZATION S 
        WHERE ISNULL(S.ID, 1) = ISNULL(@P_ORGID, 1)
        
        UNION ALL
        
        SELECT LEVEL + 1 AS LEVEL, S.* 
        FROM CTE_CONNECT_BY R 
        INNER JOIN HU_ORGANIZATION S ON R.ID = S.PARENT_ID
    )
    
    -- Chèn ID của các phòng ban vào bảng kết quả
    INSERT INTO @T
    SELECT C.ID  
    FROM CTE_CONNECT_BY C
    WHERE 
        C.IS_ACTIVE = 1 AND
        (C.DISSOLVE_DATE IS NULL OR CAST(C.DISSOLVE_DATE AS DATE) <= @V_CUR)

    RETURN
END</pre>

cách chạy hàm<br>
SELECT *
FROM GET_DEPARTMENT_HIERARCHY(1);

# Tạo thủ tục stored procedure duyệt qua các bản ghi rồi insert vào 1 bảng khác
<pre>CREATE PROCEDURE dbo.INSERT_ORG_IDS_INTO_TEST
    @P_ORG_ID BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ORG_ID BIGINT;

    -- Khai báo con trỏ
    DECLARE org_cursor CURSOR FOR
    SELECT ID
    FROM HU_ORGANIZATION
    WHERE ID IN (
		SELECT *
		FROM GET_DEPARTMENT_HIERARCHY(@P_ORG_ID)
	);
	
    -- Mở con trỏ
    OPEN org_cursor;

    -- Lặp qua các bản ghi
    FETCH NEXT FROM org_cursor INTO @org_id;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Chèn ID vào bảng HU_TEST
        INSERT INTO HU_TEST (ID) VALUES (@org_id);

        -- Lấy bản ghi tiếp theo
        FETCH NEXT FROM org_cursor INTO @org_id;
    END

    -- Đóng và giải phóng con trỏ
    CLOSE org_cursor;
    DEALLOCATE org_cursor;
END</pre>

<br>

<pre>-- câu lệnh chạy thủ tục
execute INSERT_ORG_IDS_INTO_TEST 1;</pre>

# Vòng lặp trong sql server
<pre>DECLARE @counter INT = 1;
DECLARE @max INT = 10;

WHILE @counter <= @max
BEGIN
    PRINT @counter; -- Hoặc thực hiện các thao tác khác
    SET @counter = @counter + 1; -- Tăng biến đếm
END</pre>

# Nếu bạn muốn lưu trực tiếp file vào DB
<pre>CREATE TABLE Files (
    Id INT PRIMARY KEY IDENTITY,
    FileName NVARCHAR(255),
    FileData VARBINARY(MAX)
);</pre>

# Con trỏ trong Sql Server
<pre>DECLARE @EmployeeID INT; -- Biến để lưu trữ giá trị của cột ID
DECLARE @EmployeeCode NVARCHAR(100); -- Biến để lưu trữ giá trị của cột CODE (giả sử có cột này)

-- Khai báo con trỏ
DECLARE EmployeeCursor CURSOR FOR
SELECT ID, CODE
FROM HU_EMPLOYEE;

-- Mở con trỏ
OPEN EmployeeCursor;

-- Lấy bản ghi đầu tiên
FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @EmployeeCode;

-- Duyệt qua các bản ghi
WHILE @@FETCH_STATUS = 0
BEGIN
    -- In dữ liệu ra màn hình
    PRINT CAST(@EmployeeID AS NVARCHAR) + ', ' + @EmployeeCode;

    -- Lấy bản ghi tiếp theo
    FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @EmployeeCode;
END;

-- Đóng và giải phóng con trỏ
CLOSE EmployeeCursor;
DEALLOCATE EmployeeCursor;</pre>

# Câu lệnh để xem SEQUENCES
<pre>SELECT 
    NAME AS SEQUENCENAME,
    OBJECT_ID AS SEQUENCEID,
    START_VALUE,
    
    CACHE_SIZE,
    IS_CYCLING
FROM 
    SYS.SEQUENCES;</pre>

# Format ngày tháng năm
<pre>DECLARE @d AS DATE = GETDATE();

SELECT FORMAT(@d, 'dd/MM/yyyy', 'en-US') AS 'Date',
       FORMAT(123456789, '###-##-####') AS 'Custom Number';</pre>

<pre>SELECT CONVERT(VARCHAR, GETDATE(), 103) AS FormattedDate;</pre>

# Đánh số thứ tự cho bản ghi, phân loại bản ghi, xếp hạng bản ghi
<pre>SELECT
	E.*,
	ROW_NUMBER() OVER(
		PARTITION BY E.EMPLOYEE_ID -- phân loại theo cột nào
		ORDER BY E.EFFECT_DATE DESC -- sắp xếp theo cột nào
	) AS [RANK_NUMBER]
FROM
	HU_WORKING E
WHERE
	EMPLOYEE_ID = 3851
ORDER BY
	[RANK_NUMBER] DESC</pre>

Cho bảng hồ sơ lương<br>
muốn phân loại bản ghi<br>
muốn đánh số thứ tự cho hồ sơ lương từ mới đến cũ dựa vào cột EFFECT_DATE<br>
sau đó nhìn vào cột RANK_NUMBER ở kết quả trả về<br>
nếu bản ghi nào có RANK_NUMBER = 1 thì đấy là hồ sơ lương mới nhất

# Lấy ra kiểu dữ liệu của 1 giá trị bất kỳ (Data type)
<pre>SELECT SQL_VARIANT_PROPERTY(GETDATE(), 'BaseType') AS DataType;
SELECT SQL_VARIANT_PROPERTY(1, 'BaseType') AS DataType;
SELECT SQL_VARIANT_PROPERTY(N'Xin chào', 'BaseType') AS DataType;</pre>

# Câu lệnh để xem cấu trúc bảng
<pre>EXEC VANESA_DODULIEU..sp_help 'HUV_ORGANIZATION';
-- EXEC tên_data_base..sp_help 'tên_bảng';</pre>

# Sao chép dữ liệu từ bảng A sang bảng B, nếu chưa có bảng B, câu lệnh này sẽ tự tạo bảng
<pre>SELECT ID
INTO TEST_DATA
FROM HU_ORGANIZATION</pre>

# Tìm hiểu về dbo trong SQL Server
<pre>dbo là viết tắt của Database Owner.
Đây là một trong những schema (lược đồ) mặc định trong SQL Server
thường được sử dụng để quản lý các đối tượng trong cơ sở dữ liệu.

Quản Lý Những Gì?
Bảng (Tables): dbo thường chứa các bảng trong cơ sở dữ liệu.
View: Các view cũng có thể nằm trong schema dbo.
Stored Procedures: Các thủ tục lưu trữ (stored procedures) thường được định nghĩa trong schema này.
Hàm (Functions): Các hàm do người dùng tự định nghĩa cũng có thể thuộc dbo.
Các Đối Tượng Khác: Chẳng hạn như triggers, indexes, và sequences.

Khi Nào Cần Dùng dbo?
Tạo Đối Tượng: Khi bạn tạo bảng, view, hoặc hàm trong schema dbo.

CREATE TABLE dbo.Users (
    UserID INT PRIMARY KEY,
    UserName NVARCHAR(50)
);

Truy Vấn Đối Tượng: Khi bạn truy vấn hoặc gọi các đối tượng trong schema dbo.
SELECT * FROM dbo.Users;

Tóm Tắt
dbo: Là schema mặc định trong SQL Server, đại diện cho Database Owner.
Quản Lý: Quản lý các đối tượng như bảng, view, stored procedures, và hàm.
Cần Sử Dụng: Khi tạo hoặc truy vấn đối tượng thuộc schema này.</pre>

# Cần hàm thì xem cái này
<pre>-- tạo hàm trả về giá trị
CREATE FUNCTION GetFullName(@firstName NVARCHAR(50), @lastName NVARCHAR(50))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN @firstName + ' ' + @lastName;
END

-- gọi hàm
SELECT dbo.GetFullName('John', 'Doe') AS FullName;

-- xóa hàm
DROP FUNCTION dbo.GetFullName;



-- tạo thủ tục (hay gọi là hàm không có giá trị trả về)
CREATE PROCEDURE dbo.InsertNewUser
    @firstName NVARCHAR(50),
    @lastName NVARCHAR(50)
AS
BEGIN
    print N'Bạn đã thêm 1 bản ghi';
END

-- gọi thủ tục
execute dbo.InsertNewUser 'tes', '';

-- xóa thủ tục
DROP PROCEDURE dbo.InsertNewUser;</pre>

# Hàm trả về 1 list nvarchar(255)
<pre>CREATE FUNCTION dbo.GetNames()
RETURNS @NamesTable TABLE (Name NVARCHAR(255))
AS
BEGIN
    INSERT INTO @NamesTable (Name)
    VALUES ('Alice'), ('Bob'), ('Charlie');

    RETURN;
END;


SELECT * FROM dbo.GetNames();


DROP FUNCTION dbo.GetNames;</pre>

# Hàm trả về chuỗi kết hợp
<pre>CREATE FUNCTION dbo.GetNameList()
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @NameList NVARCHAR(MAX);
    
    SELECT @NameList = STRING_AGG(Name, ', ')
    FROM (VALUES ('Alice'), ('Bob'), ('Charlie')) AS Names(Name);

    RETURN @NameList;
END;

SELECT dbo.GetNameList();


DROP FUNCTION dbo.GetNameList;</pre>

# Tạo biến để hứng giá trị có kiểu dữ liệu là bảng
<pre>DECLARE @Result TABLE (Name NVARCHAR(255));

-- Gán giá trị trả về từ hàm vào biến bảng
INSERT INTO @Result
SELECT * FROM dbo.GetNames();

-- Truy vấn kết quả
SELECT * FROM @Result;</pre>

# Câu lệnh xem ràng buộc trong 1 bảng (CONSTRAINTS)
<pre>SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='TABLE_NAME';</pre>

# Tính khoảng thời gian giữa 2 mốc thời gian
<pre>DECLARE @startDate DATETIME2(7) = '2025-06-20 09:00:00.0000000';
DECLARE @endDate DATETIME2(7) = '2025-06-20 18:00:00.0000000';

SELECT DATEDIFF(MINUTE, @startDate, @endDate) AS MinutesDifference;</pre>
<br>
<pre>DECLARE @date1 DATE = '2023-10-01';
DECLARE @date2 DATE = '2023-09-25';

DECLARE @daysDiff INT;

SET @daysDiff = DATEDIFF(DAY, @date2, @date1);

SELECT @daysDiff AS DaysDifference; -- Kết quả sẽ là 6</pre>

# Chuyển string thành list trong SQL Server
<pre>-- SQL Server 2016+
SELECT value AS Id
FROM STRING_SPLIT('1,2,3', ',')</pre>

# Cách sử dụng CASE WHEN
<pre>-- VIẾT CASE WHEN THEO KIỂU 1
SELECT
    CASE 1
        WHEN 1 THEN 'EQUAL'
        WHEN 2 THEN 'DIFFERENT'
        ELSE 'OTHER'
    END;

DECLARE @parameter1 INT = 999;
SELECT
    CASE @parameter1
        WHEN 1 THEN 'ONE'
        WHEN 2 THEN 'TWO'
        ELSE 'OTHER'
    END;


-- VIẾT CASE WHEN THEO KIỂU 2
SELECT
    CASE
        WHEN 1 = 1 THEN 'EQUAL'
        ELSE 'DIFFERENT'
    END;

DECLARE @parameter2 INT = 1;
SELECT
    CASE
        WHEN @parameter2 = 1 THEN 'EQUAL'
        ELSE 'DIFFERENT'
    END;


-- VIẾT CASE WHEN Ở BÊN TRONG WHERE
DECLARE @parameter_quater INT = 2;
SELECT
    FORMAT(EFFECT_DATE, 'dd/MM/yyyy') AS FORMATTED_DATE,
    CASE
        WHEN MONTH(EFFECT_DATE) = 1 THEN 1
        WHEN MONTH(EFFECT_DATE) = 2 THEN 1
        WHEN MONTH(EFFECT_DATE) = 3 THEN 1

        WHEN MONTH(EFFECT_DATE) = 4 THEN 2
        WHEN MONTH(EFFECT_DATE) = 5 THEN 2
        WHEN MONTH(EFFECT_DATE) = 6 THEN 2

        WHEN MONTH(EFFECT_DATE) = 7 THEN 3
        WHEN MONTH(EFFECT_DATE) = 8 THEN 3
        WHEN MONTH(EFFECT_DATE) = 9 THEN 3

        WHEN MONTH(EFFECT_DATE) = 10 THEN 4
        WHEN MONTH(EFFECT_DATE) = 11 THEN 4
        WHEN MONTH(EFFECT_DATE) = 12 THEN 4
        
        ELSE 0
    END AS QUATER -- QUÝ 1 2 3 4
FROM
    HU_WORKING
WHERE
    IS_WAGE = -1

    -- LẤY RA CÁC BẢN GHI CÓ QUÝ LỚN HƠN QUÝ 2
    AND
        @parameter_quater <
        CASE
            WHEN MONTH(EFFECT_DATE) = 1 THEN 1
            WHEN MONTH(EFFECT_DATE) = 2 THEN 1
            WHEN MONTH(EFFECT_DATE) = 3 THEN 1

            WHEN MONTH(EFFECT_DATE) = 4 THEN 2
            WHEN MONTH(EFFECT_DATE) = 5 THEN 2
            WHEN MONTH(EFFECT_DATE) = 6 THEN 2

            WHEN MONTH(EFFECT_DATE) = 7 THEN 3
            WHEN MONTH(EFFECT_DATE) = 8 THEN 3
            WHEN MONTH(EFFECT_DATE) = 9 THEN 3

            WHEN MONTH(EFFECT_DATE) = 10 THEN 4
            WHEN MONTH(EFFECT_DATE) = 11 THEN 4
            WHEN MONTH(EFFECT_DATE) = 12 THEN 4

            ELSE 0
        END;</pre>
<br>
Bài học rút ra: Những gì viết được trong Select thì có thể bê vào trong Where

# Lấy ra tên cột
<pre>DECLARE @columns NVARCHAR(MAX) = ''

SELECT @columns = STRING_AGG(COLUMN_NAME, ', ')
FROM
(
	SELECT
		C.COLUMN_NAME
	FROM
		INFORMATION_SCHEMA.COLUMNS C
	WHERE
		C.TABLE_NAME = 'AT_TIME_TIMESHEET_DAILY'
		
		AND C.COLUMN_NAME IN (
			SELECT C2.COLUMN_NAME
			FROM INFORMATION_SCHEMA.COLUMNS C2
			WHERE C2.TABLE_NAME = 'AT_TIME_TIMESHEET_DAILY_TEMP'
		)
) AS MatchingColumns;

SELECT @columns;</pre>

# Kiểu dữ liệu Date
<pre>-- Tạo bảng có 1 cột kiểu DATE
CREATE TABLE TestDateTable (
    MyDate DATE
);


-- Cách 1: dạng yyyy-mm-dd (khuyến nghị – chuẩn ISO 8601)
INSERT INTO TestDateTable (MyDate)
VALUES ('2025-10-01');


-- Cách 2: dạng dd/mm/yyyy (chỉ khi DATEFORMAT phù hợp)
SET DATEFORMAT dmy;
INSERT INTO TestDateTable (MyDate)
VALUES ('01/10/2025');


-- Cách 3: dùng CONVERT
INSERT INTO TestDateTable (MyDate)
VALUES (CONVERT(DATE, '01/10/2025', 103));  -- 103 = dd/mm/yyyy


-- Kiểm tra dữ liệu
SELECT * FROM TestDateTable;


-- xóa bảng
DROP TABLE TestDateTable;</pre>

# Kiểu dữ liệu Time
<pre>-- Tạo bảng có 1 cột kiểu TIME
CREATE TABLE TestTimeTable (
    MyTime TIME
);


-- Cách 1: HH:MM:SS (phổ biến nhất)
INSERT INTO TestTimeTable (MyTime)
VALUES ('14:30:00');   -- 2:30 chiều


-- Cách 2: HH:MM (tự hiểu giây = 00)
INSERT INTO TestTimeTable (MyTime)
VALUES ('09:15');


-- Cách 3: HH:MM:SS.mmm (có mili-second)
INSERT INTO TestTimeTable (MyTime)
VALUES ('18:45:30.123');


-- Cách 4: CONVERT TIME
INSERT INTO TestTimeTable (MyTime)
VALUES (CONVERT(TIME, '14:30:00'));


-- Kiểm tra
SELECT * FROM TestTimeTable;


-- xóa bảng
DROP TABLE TestTimeTable;</pre>

# Clone bảng phát 1
<pre>-- tạo bảng chính
CREATE TABLE TEST_TABLE(
    TEST_VALUE INT
);


-- thêm dữ liệu
INSERT INTO TEST_TABLE(TEST_VALUE)
VALUES (1), (2), (3), (4), (5);


-- lấy ra xem thử TEST_TABLE
select *
from TEST_TABLE;


-- kiểm tra xem bảng 
IF OBJECT_ID('tempdb..#TEST_TABLE') IS NOT NULL
BEGIN
    DROP TABLE #TEST_TABLE;
END;


-- clone bảng phát 1
SELECT T.*
INTO #TEST_TABLE
FROM TEST_TABLE T


-- lấy ra xem thử #TEST_TABLE
select *
from #TEST_TABLE;


-- thử câu lệnh update mới lạ
UPDATE T
SET TEST_VALUE =  999
FROM TEST_TABLE T
WHERE TEST_VALUE = 1;


-- xóa bảng
DROP TABLE TEST_TABLE;</pre>

# Linked Server thì tìm trong git này với từ khóa remote từ xa
