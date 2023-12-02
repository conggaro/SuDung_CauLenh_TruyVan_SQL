--Khai báo biến @id, @title để lưu nội dung đọc
DECLARE @id int
DECLARE @name nvarchar(200)


DECLARE cursorProduct CURSOR FOR			-- khai báo con trỏ cursorProduct
SELECT Id, TenSanPham FROM SanPham			-- dữ liệu trỏ tới


OPEN cursorProduct							-- Mở con trỏ


FETCH NEXT FROM cursorProduct				-- Đọc dòng đầu tiên
      INTO @id, @name


WHILE @@FETCH_STATUS = 0					--vòng lặp WHILE khi đọc Cursor thành công
BEGIN
											--In kết quả hoặc thực hiện bất kỳ truy vấn
											--nào dựa trên kết quả đọc được
    PRINT 'Id: ' + CAST(@id as nvarchar)
				 + ', TenSanPham: '
				 + @name

    FETCH NEXT FROM cursorProduct			-- Đọc dòng tiếp
          INTO @id, @name
END


CLOSE cursorProduct							-- Đóng Cursor
DEALLOCATE cursorProduct					-- Giải phóng tài nguyên