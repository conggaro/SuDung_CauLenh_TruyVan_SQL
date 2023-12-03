-- tạo thủ tục (procedure)
create procedure GetAll_Record
as
begin
	-- khai báo biến
	declare @str nvarchar(100) = N'select * from SanPham';


	-- cách 1:
	-- sử dụng sp_executesql (sp là viết tắt của stored procedure)
	execute sp_executesql @str;
	

	-- cách 2:
	--execute(@str);
end


-- thực thi thủ tục (procedure)
execute GetAll_Record;


-- Lưu ý rằng việc sử dụng EXEC() có thể đưa đến các vấn đề về bảo mật.

-- Bạn nên đảm bảo rằng các giá trị được chèn vào chuỗi @str
-- được kiểm tra và không có nguy cơ bị tấn công SQL Injection.

-- Sử dụng sp_executesql được khuyến nghị hơn để tránh các vấn đề bảo mật này.