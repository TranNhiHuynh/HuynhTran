drop database QLChanGaGoiNem
Create Database QLChanGaGoiNem
use QLChanGaGoiNem

Create Table SanPham
(
	MaSanPham int,
	TenSP nvarchar(100),
	DonGia int,
	HinhAnh nvarchar(100),
	SoLuongTon int,
	MaLoaiSP int,
	Constraint PK_SanPham Primary Key(MaSanPham),
)

create Table KhachHang
(
	MaKhachHang int,
	TenKH nvarchar(100),
	DiaChi nvarchar(100),
	SoDienThoai nvarchar(100),
	TaiKhoan nvarchar(100),
	MatKhau nvarchar(100),
	Constraint PK_KhachHang Primary Key(MaKhachHang),
)
Create Table HoaDon
(
	MaHoaDon int,
	NgayHoaDon date,
	MaKH int,
	NgayGiao date,
	NgayThanhToan date,
	Constraint PK_HoaDon Primary Key(MaHoaDon),
)
create table ChiTiet
(
	MaHD int,
	MaSP int,
	SoLuong int,
	Constraint PK_ChiTiet Primary Key(MaHD,MaSP),
)

create table DanhMuc
(
	MaDanhMuc int,
	TenDanhMuc nvarchar(100),
	Constraint PK_DanhMuc Primary Key(MaDanhMuc),
)

create table Loai
(
	MaLoai int,
	TenLoai nvarchar(100),
	MaDanhMuc int,
	Constraint PK_Loai Primary Key(MaLoai),
)
-- KHÓA NGOẠI
Alter Table SanPham 
Add Constraint FK_SanPham_Loai Foreign Key(MaLoaiSP) References Loai(MaLoai)
--
Alter Table HoaDon 
Add Constraint FK_HoaDon_KhachHang Foreign Key(MaKH) References KhachHang(MaKhachHang)
--
Alter Table ChiTiet 
Add Constraint FK_ChiTiet_SanPham Foreign Key(MaSP) References SanPham(MaSanPham)
Alter Table ChiTiet 
Add Constraint FK_ChiTiet_HoaDon Foreign Key(MaHD) References HoaDon(MaHoaDon)
--
Alter Table Loai 
Add Constraint FK_Loai_DanhMuc Foreign Key(MaDanhMuc) References DanhMuc(MaDanhMuc)

Set dateformat dmy

Insert into DanhMuc values (1,N'Chăn ra gia đình')
Insert into DanhMuc values (2,N'Chăn ra khách sạn')
Insert into DanhMuc values (3,N'Gối & Ruột gối')
Insert into DanhMuc values (4,N'Nệm')

Insert into Loai values (1,N'Tơ tằm',1)
Insert into Loai values (2,N'Tencel',1)
Insert into Loai values (3,N'Cotton Satin',1)
Insert into Loai values (4,N'Cotton Vanila',1)
Insert into Loai values (5,N'Cotton Thêu',1)
Insert into Loai values (6,N'Chăn ga gối cho bé',1)

Insert into Loai values (7,N'Bộ Chăn Ga Gối Khách Sạn',2)
Insert into Loai values (8,N'Ga Khách Sạn',2)
Insert into Loai values (9,N'Gối Khách Sạn',2)
Insert into Loai values (10,N'Khăn Khách Sạn',2)
Insert into Loai values (11,N'Nệm Khách Sạn',2)

Insert into Loai values (12,N'Áo Gối',3)
Insert into Loai values (13,N'Ruột gối nằm',3)
Insert into Loai values (14,N'Ruột gối ôm',3)
Insert into Loai values (15,N'Gối trang trí',3)

Insert into Loai values (16,N'Nệm Cao Su',4)
Insert into Loai values (17,N'Nệm Lò Xo',4)
Insert into Loai values (18,N'Nệm Bella Gòn',4)
Insert into Loai values (19,N'Nệm Em Bé',4)

Insert into SanPham values(1,N'THANH THỦY TƠ TẰM 83',4500000,N'totam1.jpg',50,1)
Insert into SanPham values(2,N'THANH THỦY TƠ TẰm 85',5000000,N'totam2.jpg',50,1)
Insert into SanPham values(3,N'THANH THỦY TƠ TẰM 87',5500000,N'totam3.jpg',50,1)
Insert into SanPham values(4,N'THANH THỦY TƠ TẰM 89',4000000,N'totam4.jpg',50,1)

Insert into SanPham values(5,N'THANH THỦY TENCEL 40',4250000,N'tencel1.jpg',50,2)
Insert into SanPham values(6,N'THANH THỦY TENCEL 37',5750000,N'tencel2.jpg',50,2)
Insert into SanPham values(7,N'THANH THỦY TENCEL 35',5250000,N'tencel3.jpg',50,2)
Insert into SanPham values(8,N'THANH THỦY TENCEL 42',4500000,N'tencel4.jpg',50,2)

Insert into SanPham values(9,N'THANH THỦY SATIN 67',4350000,N'cottonsatin1.jpg',50,3)
Insert into SanPham values(10,N'THANH THỦY SATIN 42',5850000,N'cottonsatin2.jpg',50,3)
Insert into SanPham values(11,N'THANH THỦY SATIN 78',5500000,N'cottonsatin3.jpg',50,3)
Insert into SanPham values(12,N'THANH THỦY SATIN 91',3500000,N'cottonsatin4.jpg',50,3)

Insert into SanPham values(13,N'THANH THỦY VALINA 65',670000,N'cottonvalina1.jpg',50,4)
Insert into SanPham values(14,N'THANH THỦY VALINA 46',580000,N'cottonvalina2.jpg',50,4)
Insert into SanPham values(15,N'THANH THỦY VALINA 98',590000,N'cottonvalina3.jpg',50,4)
Insert into SanPham values(16,N'THANH THỦY VALINA 25',900000,N'cottonvalina4.jpg',50,4)

Insert into SanPham values(17,N'THANH THỦY THÊU 65',800000,N'cottontheu1.jpg',50,5)
Insert into SanPham values(18,N'THANH THỦY THÊU 47',450000,N'cottontheu2.jpg',50,5)
Insert into SanPham values(19,N'THANH THỦY THÊU 75',750000,N'cottontheu3.jpg',50,5)
Insert into SanPham values(20,N'THANH THỦY THÊU 97',850000,N'cottontheu4.jpg',50,5)


Insert into SanPham values(21,N'GÓI ÔM EM BÉ',95000,N'changaembe1.jpg',50,6)
Insert into SanPham values(22,N'BỘ NỆM BÈO EM BÉ',450000,N'changaembe2.jpg',50,6)
Insert into SanPham values(23,N'MỀN EM BÉ',275000,N'changaembe3.jpg',50,6)
Insert into SanPham values(24,N'GỐI EM BÉ THANH THỦY',350000,N'changaembe4.jpg',50,6)

Insert into SanPham values(25,N'BỘ CHĂN GA KHÁCH SẠN 1',8600000,N'boks1.jpg',50,7)
Insert into SanPham values(26,N'BỘ CHĂN GA KHÁCH SẠN 2',7500000,N'boks2.jpg',50,7)
Insert into SanPham values(27,N'BỘ CHĂN GA KHÁCH SẠN 3',5400000,N'boks3.jpg',50,7)
Insert into SanPham values(28,N'BỘ CHĂN GA KHÁCH SẠN 4',7500000,N'boks4.jpg',50,7)

Insert into SanPham values(29,N'GA TRẮNG SATIN T400',2500000,N'gaks1.jpg',50,8)
Insert into SanPham values(30,N'GA TRẮNG SỌC 3F T300',3500000,N'gaks2.jpg',50,8)
Insert into SanPham values(31,N'GA BỌC SỌC 3F T300',4500000,N'gaks3.jpg',50,8)
Insert into SanPham values(32,N'GA BỌC CVC T260',2700000,N'gaks4.jpg',50,8)

Insert into SanPham values(33,N'RUỘT GÓI GÒN ÉP',7500000,N'goiks1.jpg',50,9)
Insert into SanPham values(34,N'RUỘT GÓI CVR',7500000,N'goiks2.jpg',50,9)
Insert into SanPham values(35,N'ÁO GÓI MAY CHỒM',7500000,N'goiks3.jpg',50,9)

Insert into SanPham values(36,N'KHĂN TRẮNG DỆT LOGO',120000,N'khanks1.jpg',50,10)
Insert into SanPham values(37,N'KHĂN MẶT KHÁCH SẠN',400000,N'khanks2.jpg',50,10)
Insert into SanPham values(38,N'KHĂN TAY KHÁCH SẠN',360000,N'khanks3.jpg',50,10)
Insert into SanPham values(39,N'KHĂN TẮM KHÁCH SẠN',750000,N'khanks4.jpg',50,10)

Insert into SanPham values(40,N'NỆM LÒ XO 1M2',560000,N'nemks1.jpg',50,11)

Insert into SanPham values(41,N'ÁO GÓI TƠ TẰM 50X70',360000,N'aogoi1.jpg',50,12)

Insert into SanPham values(42,N'RUỘT GỐI NẰM SUMMER',460000,N'ruotgoinam1.jpg',50,13)

Insert into SanPham values(43,N'RUỘT GỐI ÔM SUMER',465000,N'ruotgoiom1.jpg',50,14)

Insert into SanPham values(44,N'GỐI TRANG TRÍ 13 THANH THỦY',475000,N'goitrangtri1.jpg',50,15)
Insert into SanPham values(45,N'GỐI TRANG TRÍ 17 THANH THỦY',500000,N'goitrangtri2.jpg',50,15)
Insert into SanPham values(46,N'GỐI TRANG TRÍ 23 THANH THỦY',450000,N'goitrangtri3.jpg',50,15)
Insert into SanPham values(47,N'GỐI TRANG TRÍ 67 THANH THỦY',525000,N'goitrangtri4.jpg',50,15)

Insert into SanPham values(48,N'NỆM CAO SU THIÊN NHIÊN',11000000,N'caosu1.png',50,16)

Insert into SanPham values(49,N'NỆM LÒ XO TÚI BELLA',6720000,N'loxo1.png',50,17)
Insert into SanPham values(50,N'NỆM LÒ XO LIÊN KẾT BELLA',4550000,N'loxo2.png',50,17)

Insert into SanPham values(51,N'NỆM BELLA GÒN THẲNG CAO',4050000,N'bella.png',50,18)

Insert into SanPham values(52,N'NỆM EM BÉ 9F',3050000,N'nemembe1.jpg',50,19)
Insert into SanPham values(53,N'NỆM EM BÉ GALAXY',5050000,N'nemembe2.jpg',50,19)
Insert into SanPham values(54,N'NỆM EM BÉ GẤP',4050000,N'nemembe3.png',50,19)

Insert into KhachHang values(1,N'Trần Nhị Huynh',N'Tiền Giang',N'091734434',N'huynh',N'123456')
Insert into KhachHang values(2,N'Đoàn Công Danh',N'Quảng Ngãi',N'096588249',N'danh',N'123456')