create procedure Z_TEST
as
begin
	-- khai báo biến
	-- để chứa kết quả truy vấn
	declare @Result varchar(2000)
	
	-- khai báo biến bảng
	declare @MyTable table (gia_tri varchar(2000))

	insert into		@MyTable
	select			[bảng 2].NAME_VN as 'gia_tri'
	from			PA_LISTSALARIES as [bảng 1]
	left join		PA_LISTSAL as [bảng 2]
	on				[bảng 1].CODE_SAL = [bảng 2].ID
	where			[bảng 1].OBJ_SAL_ID = 1382
					and [bảng 1].IS_VISIBLE = 1


	-- gán giá trị của câu truy vấn
	-- vào biến @Result
	select @Result = COALESCE(@Result + ', ', '') + gia_tri
	from @MyTable


	-- in thử ra màn hình
	print (@Result)
end


-- thực thi procedure
execute Z_TEST