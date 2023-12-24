-- tạo bảng cha
create table Bang_Cha (
	Id int identity(1, 1),
	Code nvarchar(100) primary key,
	Name_Cha nvarchar(100)
);
go


-- tạo bảng con
create table Bang_Con (
	Id int identity(1, 1),
	Code nvarchar(100),
	Name_Con nvarchar(100),
	Bang_Cha_Code nvarchar(100)
);
go


-- thêm ràng buộc "khóa chính"
-- Primary key (FK)
alter table Bang_Con
add constraint pk_01
primary key (Id);


-- thêm ràng buộc "khóa ngoại"
-- Foreign key (FK)
alter table Bang_Con
add constraint fk_01
foreign key (Bang_Cha_Code)
references Bang_Cha(Code)
on delete set null
on update set null;
go


-- thêm bản ghi vào bảng cha
insert into Bang_Cha (Code, Name_Cha)
values
(N'P1', N'Cha 01'),
(N'P2', N'Cha 02'),
(N'P3', N'Cha 03');


-- thêm bản ghi vào bảng con
insert into Bang_Con (Code, Name_Con, Bang_Cha_Code)
values
(N'S1', N'Con 01', N'P1'),
(N'S2', N'Con 02', N'P3'),
(N'S3', N'Con 03', N'P2'),
(N'S4', N'Con 04', N'P2'),
(N'S5', N'Con 05', N'P1'),
(N'S6', N'Con 06', N'P1');



-- nếu thêm bản ghi có khóa ngoại = 'P4'
-- vào bảng con
-- thì sẽ bị báo lỗi
-- cách để hết lỗi là bạn phải thêm bản ghi có khóa ngoại
-- tương ứng với 1 khóa chính trong bảng cha
-- tức là bảng cha chỉ có Code = 'P1', 'P2', 'P3'
-- thì bạn chỉ có thể thêm bản ghi với Bang_Cha_Code là 'P1' (hoặc là 'P2', hoặc là 'P3')

-- tôi comment câu lệnh báo lỗi này lại nhé!
--insert into Bang_Con (Code, Name_Con, Bang_Cha_Code)
--values (N'S7', N'Con 07', N'P4');



-- ghi chú:
-- CASCADE: Nếu dòng cha bị xóa,
-- tất cả các dòng con liên quan sẽ được xóa

-- SET NULL: Nếu dòng cha bị xóa, các giá trị trong cột foreign key
-- của các dòng con liên quan sẽ được đặt là NULL

-- SET DEFAULT: Nếu dòng cha bị xóa, các giá trị trong cột foreign key
-- của các dòng con liên quan sẽ được đặt là giá trị mặc định của cột đó

-- NO ACTION: Ngăn chặn việc xóa dòng cha
-- nếu có ít nhất một dòng con liên quan