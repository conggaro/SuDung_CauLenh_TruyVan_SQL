-- Hàm DATEADD() trong SQL Server
-- được sử dụng để cộng hoặc trừ một khoảng thời gian
-- (như ngày, tháng, năm, giờ, phút, giây, v.v.)
-- vào một giá trị ngày (datetime).


-- Cú pháp:
-- DATEADD(datepart, number, date)


-- Tham số:
-- 1. datepart: Phần thời gian cần thêm hoặc trừ, ví dụ:
-- year hoặc yy hoặc yyyy: Năm
-- month hoặc mm hoặc m: Tháng
-- day hoặc dd hoặc d: Ngày
-- hour hoặc hh: Giờ
-- minute hoặc mi hoặc n: Phút
-- second hoặc ss hoặc s: Giây
-- millisecond hoặc ms: Mili giây

-- 2. number: Số lượng thời gian cần thêm (số dương) hoặc trừ (số âm).

-- 3. date: Giá trị ngày (datetime) mà bạn muốn thay đổi.



-- Ví dụ:
-- 1. Cộng thêm 10 ngày vào ngày hiện tại:
 SELECT DATEADD(day, 10, GETDATE()) AS NewDate;

-- 2. Trừ 2 tháng từ ngày hiện tại:
 SELECT DATEADD(month, -2, GETDATE()) AS NewDate;

-- 3. Cộng thêm 5 năm vào một ngày cụ thể:
 SELECT DATEADD(year, 5, '2025-01-01') AS NewDate;