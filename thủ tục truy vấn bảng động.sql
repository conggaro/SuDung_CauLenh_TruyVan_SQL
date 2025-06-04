-- câu lệnh để thực thi thủ tục
EXEC XLS_READ_BY_TABLE_NAME_AND_COLUMNS_FORMULA 'HU_CONTRACT_TYPE', 'NAME', '(IS_ACTIVE = 1 AND TYPE_ID != 33)';



-- khi chạy thủ tục thì nó sẽ
-- ra như này
SELECT
    Text, Value
FROM (
    SELECT
        Text=NAME,
        Value=ID
    FROM
        HU_CONTRACT_TYPE
    WHERE
        (IS_ACTIVE = 1 AND TYPE_ID != 33)
) a
ORDER BY a.Text








-- thủ tục thì nó định nghĩa như này
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
--Thủ tục này trả lại một dataset với đầu vào là 2 tham số
--1) @P_TABLE: Tên bảng, ví dụ "HU_BANK"
--2) @P_TEXT_FORMULA: Công thức cho chuỗi cột được ghép lại để lấy giá trị unique từ bảng, ví dụ: '[' + NAME + '], [' + CODE + ']'
--						Nếu kích thước của chuỗi cột = 1, thì công thức sẽ chỉ đơn giản là tên của cột duy nhất đó, ví dụ NAME
--Kết quả sẽ được tiếp tục xử lý bằng LINQ TO OBJECT tại Backend
-- ================================================
ALTER PROCEDURE [dbo].[XLS_READ_BY_TABLE_NAME_AND_COLUMNS_FORMULA]
	-- Add the parameters for the stored procedure here
	@P_TABLE VARCHAR(50),
	@P_TEXT_FORMULA VARCHAR(255),
	@P_CONDITION VARCHAR(255)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL VARCHAR(MAX) = 'SELECT Text, Value FROM (SELECT Text=' + @P_TEXT_FORMULA + ', Value=ID FROM ' + @P_TABLE + ' WHERE ' + @P_CONDITION + ') a ORDER BY a.Text';

	PRINT @SQL;

    -- Insert statements for procedure here
	EXEC(@SQL);

END
GO
