USE [SUMITOMO]
GO
/****** Object:  StoredProcedure [dbo].[InsertAndSelectTempData]    Script Date: 01/10/2025 1:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertAndSelectTempData]
AS
BEGIN
	DECLARE @ListOrgTable TABLE (
				ORG_CODE NVARCHAR(255),			   -- Mã phòng ban
				ORG_NAME NVARCHAR(MAX),			   -- Tên phòng ban
				ORG_ID BIGINT,
				FullPath NVARCHAR(MAX));

	WITH OrganizationCTE AS (
		SELECT
			ID,
			NAME_INTL_CODE,
			PARENT_ID,
			CAST(NAME_INTL_CODE AS NVARCHAR(MAX)) AS FullPath,
			0 AS Level,
			ORDER_NUM,
			CODE
		FROM HU_ORGANIZATION
		WHERE PARENT_ID IS NULL AND IS_ACTIVE = 1

		UNION ALL

		SELECT
			o.ID,
			o.NAME_INTL_CODE,
			o.PARENT_ID,
			CAST(CONCAT(c.FullPath, ' -> ', o.NAME_INTL_CODE) AS NVARCHAR(MAX)) AS FullPath,
			c.Level + 1,
			o.ORDER_NUM,
			o.CODE
		FROM HU_ORGANIZATION o
		INNER JOIN OrganizationCTE c ON o.PARENT_ID = c.ID
		WHERE IS_ACTIVE = 1
	)
	INSERT INTO @ListOrgTable (ORG_CODE, ORG_NAME, ORG_ID, FullPath)
	SELECT
		b1.CODE,
		REPLICATE('    ', Level) + b2.VI AS ORG_NAME,
		b1.ID AS ORG_ID,
		b1.FullPath
	FROM OrganizationCTE b1
	INNER JOIN SYS_LANGUAGE b2 ON b1.NAME_INTL_CODE = b2.[KEY];
	


	-- select thử biến @ListOrgTable
	-- phải insert xong rồi mới order by được
	--select *
	--from @ListOrgTable
	--ORDER BY FullPath;
	


	-- Khai báo biến bảng tạm để lưu ID phòng ban
	DECLARE @DepartmentIDs TABLE (ID BIGINT);
	
	INSERT INTO @DepartmentIDs (ID)
	SELECT b1.ID
	FROM
		HU_ORGANIZATION b1
	INNER JOIN
		SYS_LANGUAGE b2
		ON b1.NAME_INTL_CODE = b2.[KEY]
	WHERE b1.IS_ACTIVE = 1; -- Điều kiện lọc phòng ban

	-- select ra thử
	--select *
	--from @DepartmentIDs;



	-- tạo bảng để lưu tổng tất cả bản ghi
		DECLARE @SumVietnameseTable TABLE (
			ORG_ID BIGINT,
			RATIO DECIMAL(18, 4),              -- Tỷ lệ
			CLCHINH18 DECIMAL(18, 4),          -- Cột CLCHINH18
			CLCHINH19 DECIMAL(18, 4),          -- Cột CLCHINH19
			INSU11 DECIMAL(18, 4),             -- Cột INSU11
			INSU2 DECIMAL(18, 4),              -- Cột INSU2
			INSU3 DECIMAL(18, 4),              -- Cột INSU3
			INSU4 DECIMAL(18, 4),              -- Cột INSU4
			INSU5 DECIMAL(18, 4),              -- Cột INSU5
			INSU6 DECIMAL(18, 4),              -- Cột INSU6
			TAX1 DECIMAL(18, 4),               -- Cột TAX1
			SUM1 DECIMAL(18, 4),               -- Cột SUM1
			CLCHINH20 DECIMAL(18, 4),          -- Cột CLCHINH20
			CLCHINH21 DECIMAL(18, 4),          -- Cột CLCHINH21
			CLCHINH13 DECIMAL(18, 4)           -- Cột CLCHINH13
		);



	-- tạo bảng kết quả cuối cùng
	-- để xử lý xong dữ liệu thì sẽ insert vào
	DECLARE @ResultTable TABLE (
		ORG_CODE NVARCHAR(255),			   -- Mã phòng ban
		ORG_NAME NVARCHAR(MAX),			   -- Tên phòng ban
		ORG_ID BIGINT,
		FullPath NVARCHAR(MAX),
		RATIO DECIMAL(18, 4),              -- Tỷ lệ
		CLCHINH18 DECIMAL(18, 4),          -- Cột CLCHINH18
		CLCHINH19 DECIMAL(18, 4),          -- Cột CLCHINH19
		INSU11 DECIMAL(18, 4),             -- Cột INSU11
		INSU2 DECIMAL(18, 4),              -- Cột INSU2
		INSU3 DECIMAL(18, 4),              -- Cột INSU3
		INSU4 DECIMAL(18, 4),              -- Cột INSU4
		INSU5 DECIMAL(18, 4),              -- Cột INSU5
		INSU6 DECIMAL(18, 4),              -- Cột INSU6
		TAX1 DECIMAL(18, 4),               -- Cột TAX1
		SUM1 DECIMAL(18, 4),               -- Cột SUM1
		CLCHINH20 DECIMAL(18, 4),          -- Cột CLCHINH20
		CLCHINH21 DECIMAL(18, 4),          -- Cột CLCHINH21
		CLCHINH13 DECIMAL(18, 4)           -- Cột CLCHINH13
	);

	

	SET NOCOUNT ON;
	DECLARE @org_id BIGINT;

    -- Khai báo con trỏ
    DECLARE org_cursor CURSOR FOR
    SELECT ID
    FROM @DepartmentIDs;
	
    -- Mở con trỏ
    OPEN org_cursor;

    -- Lặp qua các bản ghi
    FETCH NEXT FROM org_cursor INTO @org_id;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        print @org_id;

        -- Lấy bản ghi tiếp theo
        FETCH NEXT FROM org_cursor INTO @org_id;


		-- Khai báo biến bảng tạm thứ 2 để lưu ID phòng ban
		DECLARE @DepartmentIDs_Two TABLE (ID BIGINT);
		INSERT INTO @DepartmentIDs_Two (ID)
		SELECT *
		FROM TABLE_ORG_RIGHT('ADMIN', @org_id, 0, 1); -- hàm lấy ra phòng ban con


		-- select thử ra các phòng ban con tương ứng
		--select *
		--from @DepartmentIDs_Two;



		DECLARE @PrepareDataTable TABLE (
			STT INT,
			EMPLOYEE_CODE NVARCHAR(50),       -- Mã nhân viên
			EMPLOYEE_NAME NVARCHAR(100),       -- Tên nhân viên
			ORG_NAME NVARCHAR(100),            -- Tên tổ chức
			POSITION_NAME NVARCHAR(100),       -- Tên vị trí
			ORG_PARENT_NAME NVARCHAR(100),     -- Tên tổ chức cha
			ORG_ID BIGINT,
			RATIO DECIMAL(18, 4),              -- Tỷ lệ
			CLCHINH18 DECIMAL(18, 4),          -- Cột CLCHINH18
			CLCHINH19 DECIMAL(18, 4),          -- Cột CLCHINH19
			INSU11 DECIMAL(18, 4),             -- Cột INSU11
			INSU2 DECIMAL(18, 4),              -- Cột INSU2
			INSU3 DECIMAL(18, 4),              -- Cột INSU3
			INSU4 DECIMAL(18, 4),              -- Cột INSU4
			INSU5 DECIMAL(18, 4),              -- Cột INSU5
			INSU6 DECIMAL(18, 4),              -- Cột INSU6
			TAX1 DECIMAL(18, 4),               -- Cột TAX1
			SUM1 DECIMAL(18, 4),               -- Cột SUM1
			CLCHINH20 DECIMAL(18, 4),          -- Cột CLCHINH20
			CLCHINH21 DECIMAL(18, 4),          -- Cột CLCHINH21
			CLCHINH13 DECIMAL(18, 4)           -- Cột CLCHINH13
		);

		INSERT INTO @PrepareDataTable (STT, EMPLOYEE_CODE, EMPLOYEE_NAME, ORG_NAME, POSITION_NAME, ORG_PARENT_NAME,
			ORG_ID,
			RATIO, CLCHINH18, CLCHINH19, INSU11, INSU2, INSU3, INSU4, INSU5, INSU6, TAX1, SUM1, CLCHINH20, CLCHINH21, CLCHINH13)
		SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS STT, SUB.*
		FROM (
			SELECT
				E.CODE AS EMPLOYEE_CODE,
				CV.FULL_NAME AS EMPLOYEE_NAME,
				O.NAME AS ORG_NAME,
				P.NAME AS POSITION_NAME,
				OP.NAME AS ORG_PARENT_NAME,
				@org_id AS ORG_ID,
				ISNULL(MP.RATIO, 1) AS RATIO,
				S.CLCHINH18 * ISNULL(MP.RATIO, 1) AS CLCHINH18,
				S.CLCHINH19 * ISNULL(MP.RATIO, 1) AS CLCHINH19,
				S.INSU11 * ISNULL(MP.RATIO, 1) AS INSU11,
				S.INSU2 * ISNULL(MP.RATIO, 1) AS INSU2,
				S.INSU3 * ISNULL(MP.RATIO, 1) AS INSU3,
				S.INSU4 * ISNULL(MP.RATIO, 1) AS INSU4,
				S.INSU5 * ISNULL(MP.RATIO, 1) AS INSU5,
				S.INSU6 * ISNULL(MP.RATIO, 1) AS INSU6,
				S.TAX1 * ISNULL(MP.RATIO, 1) AS TAX1,
				S.SUM1 * ISNULL(MP.RATIO, 1) AS SUM1,
				S.CLCHINH20 * ISNULL(MP.RATIO, 1) AS CLCHINH20,
				S.CLCHINH21 * ISNULL(MP.RATIO, 1) AS CLCHINH21,
				S.CLCHINH13 * ISNULL(MP.RATIO, 1) AS CLCHINH13
			FROM 
				PA_PAYROLLSHEET_SUM S
			INNER JOIN 
				HU_EMPLOYEE E ON S.EMPLOYEE_ID = E.ID
			INNER JOIN 
				HU_EMPLOYEE_CV CV ON E.PROFILE_ID = CV.ID
			LEFT JOIN 
				PA_MAN_POWER MP ON MP.EMPLOYEE_ID = S.EMPLOYEE_ID
			LEFT JOIN 
				HU_ORGANIZATION O ON O.ID = S.ORG_ID
			LEFT JOIN 
				HU_POSITION P ON P.ID = S.TITLE_ID
			LEFT JOIN 
				HU_ORGANIZATION OP ON OP.ID = O.PARENT_ID
			WHERE
				-- check kỳ công lương
				S.PERIOD_ID = (SELECT ID FROM AT_SALARY_PERIOD WHERE [MONTH] = 8 AND [year] = 2025)
				
				-- check đối tượng lương
				AND S.OBJ_SALARY_ID IN (SELECT ID FROM HU_SALARY_TYPE WHERE CODE = N'ĐTL013')
				
				-- check phòng ban
				AND S.ORG_ID IN (SELECT * FROM @DepartmentIDs_Two)
		) SUB;




		

		-- bắt đầu tính tổng
		INSERT INTO @SumVietnameseTable (
			ORG_ID,
			RATIO, CLCHINH18, CLCHINH19, INSU11, INSU2, INSU3,
			INSU4, INSU5, INSU6, TAX1, SUM1, CLCHINH20, CLCHINH21, CLCHINH13)
		SELECT
			MAX(ORG_ID) AS ORG_ID,
			SUM(RATIO) AS RATIO,
			SUM(CLCHINH18) AS CLCHINH18,
			SUM(CLCHINH19) AS CLCHINH19,
			SUM(INSU11) AS INSU11,
			SUM(INSU2) AS INSU2,
			SUM(INSU3) AS INSU3,
			SUM(INSU4) AS INSU4,
			SUM(INSU5) AS INSU5,
			SUM(INSU6) AS INSU6,
			SUM(TAX1) AS TAX1,
			SUM(SUM1) AS SUM1,
			SUM(CLCHINH20) AS CLCHINH20,
			SUM(CLCHINH21) AS CLCHINH21,
			SUM(CLCHINH13) AS CLCHINH13
		FROM
			@PrepareDataTable;
			
		-- select thử cái bảng tổng này ra
		--select *
		--from @SumVietnameseTable;

			


		-- lấy ra xong thì phải xóa đi
		delete from @DepartmentIDs_Two;

		-- lấy ra xong thì phải xóa bảng chuẩn bị đi đi
		delete from @PrepareDataTable;
    END

    -- Đóng và giải phóng con trỏ
    CLOSE org_cursor;
    DEALLOCATE org_cursor;



	-- insert các bản ghi sau khi được tính tổng
	-- vào bảng kết quả cuối cùng
	insert into @ResultTable (
		ORG_CODE, ORG_NAME, ORG_ID, FullPath,
		RATIO, CLCHINH18, CLCHINH19, INSU11, INSU2, INSU3,
		INSU4, INSU5, INSU6, TAX1, SUM1, CLCHINH20, CLCHINH21, CLCHINH13)
	select
		b1.ORG_CODE, b1.ORG_NAME, b1.ORG_ID, b1.FullPath,
		RATIO, CLCHINH18, CLCHINH19, INSU11, INSU2, INSU3,
		INSU4, INSU5, INSU6, TAX1, SUM1, CLCHINH20, CLCHINH21, CLCHINH13
	from
		@ListOrgTable as b1
	inner join
		@SumVietnameseTable as b2
		on b1.ORG_ID = b2.ORG_ID;


	--select ra thử
	--select * from @ListOrgTable;
	--select * from @SumVietnameseTable;


	-- xong xuôi hết thì select ra
	SELECT
		ORG_CODE, ORG_NAME,
		RATIO, CLCHINH18, CLCHINH19, INSU11, INSU2, INSU3,
		INSU4, INSU5, INSU6, TAX1, SUM1, CLCHINH20, CLCHINH21, CLCHINH13
	FROM @ResultTable
	ORDER BY FullPath;
END;
