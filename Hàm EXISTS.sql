-- Hàm EXISTS() trong SQL Server
-- là một hàm logic được sử dụng để kiểm tra sự tồn tại
-- của các hàng trong một truy vấn con (subquery).
-- Nó trả về giá trị TRUE nếu truy vấn con trả về ít nhất một hàng,
-- và FALSE nếu không có hàng nào được trả về.


-- Cú pháp:
-- EXISTS (subquery)


-- Tác dụng:
-- 1. Kiểm tra sự tồn tại:
-- Dùng để kiểm tra xem một điều kiện
-- cụ thể có được thỏa mãn hay không.

-- 2. Tối ưu hóa hiệu suất:
-- EXISTS thường được sử dụng thay cho COUNT(*)
-- khi chỉ cần kiểm tra sự tồn tại,
-- vì nó dừng lại ngay khi tìm thấy hàng đầu tiên,
-- giúp cải thiện hiệu suất.

-- 3. Kết hợp với các câu lệnh khác:
-- Thường được sử dụng trong các câu lệnh SELECT, UPDATE, DELETE, hoặc INSERT.



-- Ví dụ:
-- Kiểm tra sự tồn tại của dữ liệu:

IF EXISTS (SELECT 1 FROM HU_EMPLOYEE WHERE ID = 1)
BEGIN
    PRINT 'Employee exists' -- tồn tại nhân viên
END
ELSE
BEGIN
    PRINT 'Employee does not exist' -- không tồn tại
END



-- Sử dụng trong câu lệnh SELECT:
SELECT
	ID,
	CODE
FROM
	HU_EMPLOYEE e
WHERE
	EXISTS (
		SELECT 1
		FROM HU_EMPLOYEE_CV o
		WHERE o.ID = e.PROFILE_ID
	);

-- Ý nghĩa:
-- Truy vấn trên trả về danh sách nhân viên
-- có ít nhất một bản ghi trong bảng HU_EMPLOYEE_CV



-- Sử dụng trong câu lệnh DELETE:
DELETE FROM HU_EMPLOYEE
WHERE EXISTS (
    SELECT 1
    FROM HU_TERMINATE
    WHERE HU_TERMINATE.EMPLOYEE_ID = HU_EMPLOYEE.ID
);

-- Ý nghĩa: Xóa các nhân viên có trong danh sách nhân viên đã nghỉ việc.


-- Lưu ý:
-- EXISTS chỉ kiểm tra sự tồn tại, không quan tâm đến dữ liệu cụ thể trong truy vấn con.
-- Truy vấn con thường sử dụng SELECT 1 hoặc SELECT NULL để tối ưu hóa, vì giá trị trả về không quan trọng.