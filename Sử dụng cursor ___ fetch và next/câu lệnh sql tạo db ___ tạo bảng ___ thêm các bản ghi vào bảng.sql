CREATE DATABASE [QL_SanPham];


USE [QL_SanPham];
GO


CREATE TABLE [SanPham](
	[Id] [int] IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[GiaSanPham] [int] NULL
);
GO


INSERT INTO SanPham(TenSanPham, GiaSanPham)
VALUES (N'Máy tính', 500);

INSERT INTO SanPham(TenSanPham, GiaSanPham)
VALUES (N'Điện thoại', 200);

INSERT INTO SanPham(TenSanPham, GiaSanPham)
VALUES (N'Ti-vi', 300);

INSERT INTO SanPham(TenSanPham, GiaSanPham)
VALUES (N'Tủ lạnh', 1000);

INSERT INTO SanPham(TenSanPham, GiaSanPham)
VALUES (N'Điều hòa', 1500);

INSERT INTO SanPham(TenSanPham, GiaSanPham)
VALUES (N'Máy giặt', 1200);

INSERT INTO SanPham(TenSanPham, GiaSanPham)
VALUES (N'Bình nóng lạnh', 900);