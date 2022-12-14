CREATE DATABASE QLChanGaGoiNem
GO
USE [QLChanGaGoiNem]
GO
/****** Object:  Table [dbo].[ChiTiet]    Script Date: 11/25/2021 1:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 11/25/2021 1:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] NOT NULL,
	[TenDanhMuc] [nvarchar](100) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/25/2021 1:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] NOT NULL,
	[NgayHoaDon] [date] NULL,
	[MaKH] [int] NULL,
	[NgayGiao] [date] NULL,
	[NgayThanhToan] [date] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/25/2021 1:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](100) NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loai]    Script Date: 11/25/2021 1:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[MaDanhMuc] [int] NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/25/2021 1:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[DonGia] [int] NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[SoLuongTon] [int] NULL,
	[MaLoaiSP] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTiet] ([MaHD], [MaSP], [SoLuong]) VALUES (1, 37, 1)
INSERT [dbo].[ChiTiet] ([MaHD], [MaSP], [SoLuong]) VALUES (2, 2, 1)
INSERT [dbo].[ChiTiet] ([MaHD], [MaSP], [SoLuong]) VALUES (2, 4, 1)
INSERT [dbo].[ChiTiet] ([MaHD], [MaSP], [SoLuong]) VALUES (3, 40, 1)
INSERT [dbo].[ChiTiet] ([MaHD], [MaSP], [SoLuong]) VALUES (4, 45, 2)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'Chăn ra gia đình')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'Chăn ra khách sạn')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (3, N'Gối & Ruột gối')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (4, N'Nệm')
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayHoaDon], [MaKH], [NgayGiao], [NgayThanhToan]) VALUES (1, CAST(N'2021-11-25' AS Date), 3, CAST(N'2021-11-04' AS Date), CAST(N'2021-11-25' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayHoaDon], [MaKH], [NgayGiao], [NgayThanhToan]) VALUES (2, CAST(N'2021-11-25' AS Date), 1, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-25' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayHoaDon], [MaKH], [NgayGiao], [NgayThanhToan]) VALUES (3, CAST(N'2021-11-25' AS Date), 1, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-25' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayHoaDon], [MaKH], [NgayGiao], [NgayThanhToan]) VALUES (4, CAST(N'2021-11-25' AS Date), 1, CAST(N'2021-11-25' AS Date), CAST(N'2021-11-25' AS Date))
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau]) VALUES (1, N'Trần Nhị Huynh', N'Tiền Giang', N'091734434', N'huynh', N'123456')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau]) VALUES (2, N'Đoàn Công Danh', N'Quảng Ngãi', N'096588249', N'danh', N'123456')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau]) VALUES (3, N'Minh Khang', N'Tiền Giang', N'0125478963', N'khang1', N'123')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (1, N'Tơ tằm', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (2, N'Tencel', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (3, N'Cotton Satin', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (4, N'Cotton Vanila', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (5, N'Cotton Thêu', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (6, N'Chăn ga gối cho bé', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (7, N'Bộ Chăn Ga Gối Khách Sạn', 2)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (8, N'Ga Khách Sạn', 2)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (9, N'Gối Khách Sạn', 2)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (10, N'Khăn Khách Sạn', 2)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (11, N'Nệm Khách Sạn', 2)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (12, N'Áo Gối', 3)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (13, N'Ruột gối nằm', 3)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (14, N'Ruột gối ôm', 3)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (15, N'Gối trang trí', 3)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (16, N'Nệm Cao Su', 4)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (17, N'Nệm Lò Xo', 4)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (18, N'Nệm Bella Gòn', 4)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaDanhMuc]) VALUES (19, N'Nệm Em Bé', 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (1, N'THANH THỦY TƠ TẰM 83', 4500000, N'totam1.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (2, N'THANH THỦY TƠ TẰm 85', 5000000, N'totam2.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (3, N'THANH THỦY TƠ TẰM 87', 5500000, N'totam3.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (4, N'THANH THỦY TƠ TẰM 89', 4000000, N'totam4.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (5, N'THANH THỦY TENCEL 40', 4250000, N'tencel1.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (6, N'THANH THỦY TENCEL 37', 5750000, N'tencel2.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (7, N'THANH THỦY TENCEL 35', 5250000, N'tencel3.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (8, N'THANH THỦY TENCEL 42', 4500000, N'tencel4.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (9, N'THANH THỦY SATIN 67', 4350000, N'cottonsatin1.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (10, N'THANH THỦY SATIN 42', 5850000, N'cottonsatin2.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (11, N'THANH THỦY SATIN 78', 5500000, N'cottonsatin3.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (12, N'THANH THỦY SATIN 91', 3500000, N'cottonsatin4.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (13, N'THANH THỦY VALINA 65', 670000, N'cottonvalina1.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (14, N'THANH THỦY VALINA 46', 580000, N'cottonvalina2.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (15, N'THANH THỦY VALINA 98', 590000, N'cottonvalina3.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (16, N'THANH THỦY VALINA 25', 900000, N'cottonvalina4.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (17, N'THANH THỦY THÊU 65', 800000, N'cottontheu1.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (18, N'THANH THỦY THÊU 47', 450000, N'cottontheu2.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (19, N'THANH THỦY THÊU 75', 750000, N'cottontheu3.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (20, N'THANH THỦY THÊU 97', 850000, N'cottontheu4.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (21, N'GÓI ÔM EM BÉ', 95000, N'changaembe1.jpg', 50, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (22, N'BỘ NỆM BÈO EM BÉ', 450000, N'changaembe2.jpg', 50, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (23, N'MỀN EM BÉ', 275000, N'changaembe3.jpg', 50, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (24, N'GỐI EM BÉ THANH THỦY', 350000, N'changaembe4.jpg', 50, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (25, N'BỘ CHĂN GA KHÁCH SẠN 1', 8600000, N'boks1.jpg', 50, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (26, N'BỘ CHĂN GA KHÁCH SẠN 2', 7500000, N'boks2.jpg', 50, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (27, N'BỘ CHĂN GA KHÁCH SẠN 3', 5400000, N'boks3.jpg', 50, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (28, N'BỘ CHĂN GA KHÁCH SẠN 4', 7500000, N'boks4.jpg', 50, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (29, N'GA TRẮNG SATIN T400', 2500000, N'gaks1.jpg', 50, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (30, N'GA TRẮNG SỌC 3F T300', 3500000, N'gaks2.jpg', 50, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (31, N'GA BỌC SỌC 3F T300', 4500000, N'gaks3.jpg', 50, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (32, N'GA BỌC CVC T260', 2700000, N'gaks4.jpg', 50, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (33, N'RUỘT GÓI GÒN ÉP', 7500000, N'goiks1.jpg', 50, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (34, N'RUỘT GÓI CVR', 7500000, N'goiks2.jpg', 50, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (35, N'ÁO GÓI MAY CHỒM', 7500000, N'goiks3.jpg', 50, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (36, N'KHĂN TRẮNG DỆT LOGO', 120000, N'khanks1.jpg', 50, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (37, N'KHĂN MẶT KHÁCH SẠN', 400000, N'khanks2.jpg', 50, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (38, N'KHĂN TAY KHÁCH SẠN', 360000, N'khanks3.jpg', 50, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (39, N'KHĂN TẮM KHÁCH SẠN', 750000, N'khanks4.jpg', 50, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (40, N'NỆM LÒ XO 1M2', 560000, N'nemks1.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (41, N'ÁO GÓI TƠ TẰM 50X70', 360000, N'aogoi1.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (42, N'RUỘT GỐI NẰM SUMMER', 460000, N'ruotgoinam1.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (43, N'RUỘT GỐI ÔM SUMER', 465000, N'ruotgoiom1.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (44, N'GỐI TRANG TRÍ 13 THANH THỦY', 475000, N'goitrangtri1.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (45, N'GỐI TRANG TRÍ 17 THANH THỦY', 500000, N'goitrangtri2.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (46, N'GỐI TRANG TRÍ 23 THANH THỦY', 450000, N'goitrangtri3.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (47, N'GỐI TRANG TRÍ 67 THANH THỦY', 525000, N'goitrangtri4.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (48, N'NỆM CAO SU THIÊN NHIÊN', 11000000, N'caosu1.png', 50, 16)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (49, N'NỆM LÒ XO TÚI BELLA', 6720000, N'loxo1.png', 50, 17)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (50, N'NỆM LÒ XO LIÊN KẾT BELLA', 4550000, N'loxo2.png', 50, 17)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (51, N'NỆM BELLA GÒN THẲNG CAO', 4050000, N'bella.png', 50, 18)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (52, N'NỆM EM BÉ 9F', 3050000, N'nemembe1.jpg', 50, 19)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (53, N'NỆM EM BÉ GALAXY', 5050000, N'nemembe2.jpg', 50, 19)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (54, N'NỆM EM BÉ GẤP', 4050000, N'nemembe3.png', 50, 19)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSP], [DonGia], [HinhAnh], [SoLuongTon], [MaLoaiSP]) VALUES (55, N'Thanh Thủy 12', 15555555, N'rose.jpg', 15, 4)
ALTER TABLE [dbo].[ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTiet] CHECK CONSTRAINT [FK_ChiTiet_HoaDon]
GO
ALTER TABLE [dbo].[ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTiet] CHECK CONSTRAINT [FK_ChiTiet_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_Loai_DanhMuc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
