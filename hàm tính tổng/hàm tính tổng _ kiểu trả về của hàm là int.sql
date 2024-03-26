-- tạo hàm tính tổng
create function TinhTong (
    @so1 int,
    @so2 int
)
returns int
as
begin
    declare @tong int;

    set @tong = @so1 + @so2;

    return @tong;
end;


-- gọi hàm tính tổng
select dbo.TinhTong(5, 7) AS Tong;


-- câu lệnh xóa hàm
drop function if exists dbo.TinhTong;