select *
from sys.indexes
where object_id = OBJECT_ID('HU_BANK') and is_unique = 1



-- bên trong OBJECT_ID()
-- là tên bảng
-- ví dụ: tên bảng là "HU_BANK"



-- xóa ràng buộc
-- DROP INDEX tên_ràng_buộc ON tên_bảng;
DROP INDEX IX_HU_BANK__NAME ON HU_BANK;