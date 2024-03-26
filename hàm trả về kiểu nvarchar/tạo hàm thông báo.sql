-- tạo hàm trả về kiểu nvarchar(255)
create function ThongBao (
	@code nvarchar(255),
	@name nvarchar(255)
)
returns nvarchar(255)
as
begin
	declare @result nvarchar(255);

	set @result = @code + ' - ' + @name;

	return @result;
end;



--gọi hàm ThongBao
declare @thongBao nvarchar(255) = dbo.ThongBao(N'A001', N'Nguyễn Văn A');

-- in ra màn hình
select @thongBao as Thong_bao;

-- in ra cửa sổ Messages
print @thongBao;



-- xóa hàm
drop function if exists dbo.ThongBao;