CREATE TABLE dbo.sinhvien(tensinhvien NVARCHAR(20), monhoc nVARCHAR(1000))
 
INSERT INTO dbo.sinhvien(tensinhvien, monhoc)
VALUES(N'Nguyễn Thảo', 'C#,VB.NET,PHP,SQLSERVER,ANDROID'),
(N'Hoàng Thị Thảo', 'Word,Excel,C++'),
(N'Lập trình VB.NET', 'VB.NET,Laravel,NodeJS,HTML,Pascal')

SELECT * FROM dbo.sinhvien



-- tạo hàm

create  FUNCTION fn_Split(@text varchar(8000), @delimiter varchar(20) = ' ')
RETURNS @Strings TABLE
(   
  position int IDENTITY PRIMARY KEY,
  value varchar(8000)  
)
AS
BEGIN

DECLARE @index int
SET @index = -1

WHILE (LEN(@text) > 0)
  BEGIN 
    SET @index = CHARINDEX(@delimiter , @text) 
    IF (@index = 0) AND (LEN(@text) > 0) 
      BEGIN  
        INSERT INTO @Strings VALUES (@text)
          BREAK 
      END 
    IF (@index > 1) 
      BEGIN  
        INSERT INTO @Strings VALUES (LEFT(@text, @index - 1))  
        SET @text = RIGHT(@text, (LEN(@text) - @index)) 
      END 
    ELSE
      SET @text = RIGHT(@text, (LEN(@text) - @index))
    END
  RETURN
END
GO



-- bắt đầu dùng CROSS APPLY
select *
from dbo.fn_Split('C#,VB.NET,PHP,SQLSERVER,ANDROID', ',');

SELECT sinhvien.tensinhvien, monhoc.value AS monhoc
FROM dbo.sinhvien sinhvien
CROSS APPLY dbo.fn_Split(sinhvien.monhoc, ',') monhoc;
