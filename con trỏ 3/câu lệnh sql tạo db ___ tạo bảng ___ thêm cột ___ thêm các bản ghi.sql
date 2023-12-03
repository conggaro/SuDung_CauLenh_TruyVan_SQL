CREATE DATABASE [QL_SanPham];
GO


USE [QL_SanPham];
GO


CREATE TABLE [SanPham](
	[Id] [int] IDENTITY(1, 1) NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[GiaSanPham] [int] NULL
);
GO


ALTER TABLE [SanPham]
ADD [NgayMuaHang] [date]
GO


INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang)
VALUES (N'Máy tính', 500, '2023/01/31');

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang)
VALUES (N'Điện thoại', 200, '2022/02/11');

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang)
VALUES (N'Ti-vi', 300, '2023/03/04');

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang)
VALUES (N'Tủ lạnh', 1000, '2020/04/19');

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang)
VALUES (N'Điều hòa', 1500, '2023/08/27');

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang)
VALUES (N'Máy giặt', 1200, '2019/11/25');

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang)
VALUES (N'Bình nóng lạnh', 900, '2023/12/01');