﻿CREATE DATABASE [QL_SanPham];
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


ALTER TABLE [SanPham]
ADD [TrangThai] [bit]
GO


ALTER TABLE [SanPham]
ADD [LoaiSanPham] [int]
GO


INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang, TrangThai, LoaiSanPham)
VALUES (N'Máy tính', 500, '2023/01/31', 1, 1);

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang, TrangThai, LoaiSanPham)
VALUES (N'Điện thoại', 200, '2022/02/11', 0, 2);

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang, TrangThai, LoaiSanPham)
VALUES (N'Ti-vi', 300, '2023/03/04', 0, 3);

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang, TrangThai, LoaiSanPham)
VALUES (N'Tủ lạnh', 1000, '2020/04/19', 1, 3);

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang, TrangThai, LoaiSanPham)
VALUES (N'Điều hòa', 1500, '2023/08/27', 0, 2);

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang, TrangThai, LoaiSanPham)
VALUES (N'Máy giặt', 1200, '2019/11/25', 1, 2);

INSERT INTO SanPham(TenSanPham, GiaSanPham, NgayMuaHang, TrangThai, LoaiSanPham)
VALUES (N'Bình nóng lạnh', 900, '2023/12/01', 0, 3);