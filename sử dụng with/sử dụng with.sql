-- nếu dùng order by
-- ở trong as của with thì sẽ bị báo lỗi
-- nếu dùng order by với bảng tạm CommonTableExpressions
-- thì không bị báo lỗi

with CommonTableExpressions as (
    select		b1.ID as ID,
				b1.CODE as CODE,
				b2.[NAME] as POSITION_NAME,
				b4.[NAME] as ORG_NAME,
				isnull(b3.ORDERNUM, 999) as ORDER_NUM

	from		HU_EMPLOYEE as b1
	left join	HU_POSITION as b2
	on			b2.ID = b1.POSITION_ID
	left join	HU_JOB as b3
	on			b3.ID = b2.JOB_ID
	left join	HU_ORGANIZATION as b4
	on			b4.ID = b1.ORG_ID
	where		b1.ORG_ID in (
					12162, 12163, 12164, 12165, 12166, 12167, 12168, 12169, 12170, 12171, 12172, 12173, 12174, 12175, 12176, 12177, 12178, 12179, 12180, 12181, 12182, 12183, 12184, 12185, 12186, 12187, 12188, 12189, 12190, 12191, 12192, 12193, 12194, 12195, 12196, 12197, 12198, 12199, 12200, 12201, 12202, 12203, 12204, 12205, 12206, 12207, 12208, 12209, 12210, 12228, 12229, 12230, 12231, 12232, 12233, 12234, 12235, 12237, 12238, 12244, 12247
				)
)

select *
from CommonTableExpressions
order by ORDER_NUM asc;



-- Từ khóa WITH trong SQL
-- được sử dụng để tạo một Common Table Expression (CTE),
-- cũng được gọi là "inline view" hoặc "subquery factoring".
-- CTE là một tập hợp tạm thời dữ liệu có thể được sử dụng
-- trong một truy vấn SQL,
-- giúp tăng cường tính modular và đọc dễ hiểu của mã SQL.



declare @dataStr nvarchar(max);

set @dataStr = N'
	select *
	from HU_EMPLOYEE
	where ORG_ID in (
		12162, 12163, 12164, 12165, 12166, 12167, 12168, 12169, 12170, 12171, 12172, 12173, 12174, 12175, 12176, 12177, 12178, 12179, 12180, 12181, 12182, 12183, 12184, 12185, 12186, 12187, 12188, 12189, 12190, 12191, 12192, 12193, 12194, 12195, 12196, 12197, 12198, 12199, 12200, 12201, 12202, 12203, 12204, 12205, 12206, 12207, 12208, 12209, 12210, 12228, 12229, 12230, 12231, 12232, 12233, 12234, 12235, 12237, 12238, 12244, 12247
	)
';

execute sp_executesql @dataStr;