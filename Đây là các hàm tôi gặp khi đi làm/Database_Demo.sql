-- tạo CSDL
create database Database_Demo;

-- sử dụng Database_Demo
use Database_Demo;

-- tạo bảng
create table Table_Demo(
	Table_ID int identity(1, 1) primary key not null,
	Username varchar(50),
	[Password] varchar(50)
);

-- lấy ra tất cả bản ghi
select	Table_ID as N'Id của bảng',
		Username as N'Tên tài khoản',
		[Password] as N'Mật khẩu'
from Table_Demo;

-- thêm dữ liệu vào bảng
insert into Table_Demo (
	Username,

	-- thêm dấu ngoặc vuông
	-- để nó không tô màu ấy mà
	[Password]
)
values (
	'nva',
	'123456'
);


-- tạo bảng nhân viên
create table EMPLOYEE(
	-- trường 1:
	-- ID, tự động tăng, khóa chính
	ID int identity(1, 1) primary key,

	-- trường 2:
	-- mã nhân viên
	CODE nvarchar(50),

	-- trường 3:
	-- họ và tên
	FULL_NAME nvarchar(50),

	-- trường 4:
	-- mã của phòng ban
	ORGANIZATION_CODE nvarchar(50)
);


-- xóa bảng
drop table EMPLOYEE;


-- thêm bản ghi vào bảng nhân viên
insert into EMPLOYEE(CODE, FULL_NAME, ORGANIZATION_CODE)
values (N'E001', N'Nguyễn Văn A', N'ORG_1');

insert into EMPLOYEE(CODE, FULL_NAME, ORGANIZATION_CODE)
values (N'E002', N'Nguyễn Văn B', N'ORG_1');

insert into EMPLOYEE(CODE, FULL_NAME, ORGANIZATION_CODE)
values (N'E003', N'Nguyễn Văn C', N'ORG_2');


-- tạo bảng phòng ban, tổ chức
create table ORGANIZATION(
	-- trường 1:
	-- ID, tự động tăng, khóa chính
	ID int identity(1, 1) primary key,

	-- trường 2:
	-- mã phòng ban
	CODE nvarchar(50),

	-- trường 3:
	-- tên phòng ban
	ORGANIZATION_NAME nvarchar(50)
);


-- thêm bản ghi vào bảng phòng ban
insert into ORGANIZATION(CODE, ORGANIZATION_NAME)
values (N'ORG_1', N'Phòng 01');

insert into ORGANIZATION(CODE, ORGANIZATION_NAME)
values (N'ORG_3', N'Phòng 03');


-- mô tả
-- 1 phòng ban
-- thì có nhiều nhân viên


-- sử dụng câu lệnh left join
select		[Bảng 1].CODE as N'Mã nhân viên',
			[Bảng 1].FULL_NAME as N'Họ và tên',
			[Bảng 2].CODE as N'Mã phòng ban',
			[Bảng 2].ORGANIZATION_NAME as N'Tên phòng ban'

from		EMPLOYEE as [Bảng 1]
left join	ORGANIZATION as [Bảng 2]
on			[Bảng 1].ORGANIZATION_CODE = [Bảng 2].CODE;


-- sử dụng câu lệnh right join
select		[Bảng 1].CODE as N'Mã nhân viên',
			[Bảng 1].FULL_NAME as N'Họ và tên',
			[Bảng 2].CODE as N'Mã phòng ban',
			[Bảng 2].ORGANIZATION_NAME as N'Tên phòng ban'

from		EMPLOYEE as [Bảng 1]
right join	ORGANIZATION as [Bảng 2]
on			[Bảng 1].ORGANIZATION_CODE = [Bảng 2].CODE;


-- sử dụng câu lệnh full join
select		[Bảng 1].CODE as N'Mã nhân viên',
			[Bảng 1].FULL_NAME as N'Họ và tên',
			[Bảng 2].CODE as N'Mã phòng ban',
			[Bảng 2].ORGANIZATION_NAME as N'Tên phòng ban'

from		EMPLOYEE as [Bảng 1]
full join	ORGANIZATION as [Bảng 2]
on			[Bảng 1].ORGANIZATION_CODE = [Bảng 2].CODE;



-- tạo procedure Get_All_Records
create procedure Get_All_Records

-- khai báo tham số cho procedure
@hoTen nvarchar(100)

as
begin
	select *
	from EMPLOYEE
	where FULL_NAME = @hoTen;
end;


-- xóa procedure
drop procedure Get_All_Records;


-- gọi procedure
execute Get_All_Records N'Nguyễn Văn A';


-- thêm cột "ngày sinh" cho bảng EMPLOYEE
alter table EMPLOYEE
add DATE_OF_BIRTH date;


-- thêm dữ liệu ngày sinh
-- cho 3 bản ghi
update EMPLOYEE
set DATE_OF_BIRTH = '2023/01/24'
where id = 1;

update EMPLOYEE
set DATE_OF_BIRTH = '2023/05/18'
where id = 2;

update EMPLOYEE
set DATE_OF_BIRTH = '2023/12/31'
where id = 3;


-- lấy tất cả bản ghi của bảng EMPLOYEE
select *
from EMPLOYEE;


-- lấy ra ngày, tháng, năm
-- từ bảng EMPLOYEE
-- sau đó chuyển ngày, tháng, năm
-- sang kiểu dữ liệu nvarchar(10)
-- sử dụng hàm day(), month(), year()
-- sử dụng hàm cast() để ép kiểu dữ liệu trong SQL Server
select	ID,
		
		-- cách 1:
		-- sử dụng hàm day() và hàm cast()
		-- trong đó, hàm cast() để chuyển
		-- kiểu dữ liệu "date" sang kiểu dữ liệu "nvarchar"
		cast(day(DATE_OF_BIRTH) as nvarchar(10)) as N'Ngày',
		
		-- cách 2:
		-- sử dụng hàm month() và hàm convert()
		-- để chuyển kiểu dữ liệu "date" sang "nvarchar"
		-- số 103 là format dd/MM/yyyy của SQL Server
		convert(nvarchar(10), month(DATE_OF_BIRTH), 103) as N'Tháng',
		
		-- chỉ sử dụng hàm year()
		year(DATE_OF_BIRTH) as N'Năm'

from	EMPLOYEE


-- sử dụng hàm substring()
-- tham số 1: chuỗi string
-- tham số 2: chỉ số bắt đầu
-- tham số 3: độ dài chuỗi muốn cắt
-- trong SQL Server thì chỉ số bắt đầu từ 1
-- bình thường trong ngôn ngữ lập trình
-- thì chỉ số được bắt đầu từ 0
select	ID,
		substring(FULL_NAME, 1, len(FULL_NAME)) as N'Họ tên'
from	EMPLOYEE