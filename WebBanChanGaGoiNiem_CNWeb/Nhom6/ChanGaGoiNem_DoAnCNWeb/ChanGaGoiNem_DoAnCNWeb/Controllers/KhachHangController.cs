using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChanGaGoiNem_DoAnCNWeb.Models;

namespace ChanGaGoiNem_DoAnCNWeb.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        ChanGaGoiNemDataContext dt = new ChanGaGoiNemDataContext();
        public ActionResult TrangChu()
        {
            List<SanPham> dsNB = dt.SanPhams.Where(t => t.MaLoaiSP == 1).ToList();
            ViewBag.NB = dsNB;
            List<SanPham> dsKM = dt.SanPhams.Where(t => t.MaLoaiSP == 7).ToList();
            ViewBag.KM = dsKM;
            return View();
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult XuLiDangNhap(FormCollection col)
        {
            string tk = col["txtTK"];
            string mk = col["txtMK"];
            KhachHang kh = dt.KhachHangs.FirstOrDefault(k => k.TaiKhoan == tk && k.MatKhau == mk);
            if (kh == null)
                return View();
            Session["KhachHang"] = kh;
            return RedirectToAction("TrangChu", "KhachHang");
        }
        public ActionResult DangXuat()
        {
            Session["KhachHang"] = null;
            return RedirectToAction("TrangChu", "KhachHang");
        }

        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult XuLiDangKy(FormCollection col)
        {
            List<KhachHang> dsKh = dt.KhachHangs.ToList();
            string tk = col["txtTK"].ToString();
            KhachHang t1 = dt.KhachHangs.FirstOrDefault(x =>x.TaiKhoan == tk);
            if (col["txtTenKH"].ToString() == string.Empty || col["txtSDT"].ToString() == string.Empty ||
              col["txtTK"].ToString() == string.Empty || col["txtMK"].ToString() == string.Empty
            || col["txtMK2"].ToString() == string.Empty || col["txtDC"].ToString() == string.Empty)
            {
                ViewBag.TB = "2";           
            }
            else if(t1 != null)
            {
                ViewBag.TB = "0";
            }
            else if (col["txtMK"].ToString() == col["txtMK2"].ToString())
            {
                KhachHang kh = new KhachHang();
                kh.MaKhachHang = dsKh.Count + 1;
                kh.TenKH = col["txtTenKH"].ToString();
                kh.SoDienThoai = col["txtSDT"].ToString();
                kh.TaiKhoan = col["txtTK"].ToString();
                kh.MatKhau = col["txtMK"].ToString();
                kh.DiaChi = col["txtDC"].ToString();
                dt.KhachHangs.InsertOnSubmit(kh);
                dt.SubmitChanges();
                ViewBag.TB = "1";
            }
            else
            {
                ViewBag.TB = "-1";
            }
            return View();
        }

        public ActionResult HienThiMenuC1()
        {
            List<DanhMuc> dsDM = dt.DanhMucs.ToList();
            return PartialView(dsDM);
        }
        public ActionResult HienThiMenuC2(int mdm)
        {
            List<Loai> dsDM = dt.Loais.Where(t => t.MaDanhMuc == mdm).ToList();
            return PartialView(dsDM);
        }

        public ActionResult HienThiDSSP(int id)
        {
            List<SanPham> dsSP = dt.SanPhams.Where(t => t.MaLoaiSP == id).ToList();
            return View(dsSP);
        }

        public ActionResult HienThiSPTheoLoai(int id)
        {
            List<SanPham> dsSP = dt.SanPhams.Where(x => x.MaLoaiSP == id).ToList();
            return View("HienThiDSSP", dsSP);
        }

        public ActionResult ChiTietSanPham(int id)
        {
            SanPham sp = dt.SanPhams.FirstOrDefault(t => t.MaSanPham == id);
            return View(sp);
        }
        public ActionResult ThemVaoGioHang(int msp)
        {
            if(Session["KhachHang"] == null)
            {
                string tb ="BẠN CẦN ĐĂNG NHẬP ĐỂ SỬ DỤNG CHỨC NĂNG GIỎ HÀNG !";
                ViewBag.TB = tb;
                return View();
            }
            GioHang gh = (GioHang)Session["GioHang"];
            if (gh == null)
                gh = new GioHang();

            int kq = gh.Them(msp);

            Session["GioHang"] = gh;
            return RedirectToAction("TrangChu", "KhachHang");
        }
        public ActionResult XemGioHang()
        {
            GioHang gh = Session["GioHang"] as GioHang;

            return View(gh);
        }

        public ActionResult DatHang()
        {
            KhachHang khach = Session["KhachHang"] as KhachHang;
            if (khach == null) // chưa đăng nhập
            {
                return RedirectToAction("DangNhap", "KhachHang");
            }
            // đã đăng nhập thành công
            return View(khach);
        }
        public ActionResult XuLiDatHang(FormCollection col)
        {
            GioHang gh = (GioHang)Session["GioHang"];
            KhachHang kh = (KhachHang)Session["KhachHang"];
            if (Session["KhachHang"] == null)// chưa đăng nhập
                return RedirectToAction("DangNhap", "KhachHang");
            if (Session["GioHang"] == null || gh.lst.Count == 0) // giỏ hàng rỗng
                return RedirectToAction("XemGioHang", "KhachHang");

            // lấy thông tin ngày giao
            DateTime ngaygiao = DateTime.Parse(col["txtNgay"]);

            // lưu vào bảng đặt hàng
            List<HoaDon> dsHD = dt.HoaDons.ToList();
            HoaDon hd = new HoaDon();
            hd.MaHoaDon = dsHD.Count + 1;
            hd.MaKH = kh.MaKhachHang;
            hd.NgayHoaDon = DateTime.Now;
            hd.NgayGiao = ngaygiao;
            dt.HoaDons.InsertOnSubmit(hd);
            dt.SubmitChanges();
            foreach (CartItem sp in gh.lst)
            {
                ChiTiet ct = new ChiTiet();
                ct.MaHD = hd.MaHoaDon;
                ct.MaSP = sp.iMaSP;
                ct.SoLuong = sp.iSoLuong;
                dt.ChiTiets.InsertOnSubmit(ct);
            }
            dt.SubmitChanges();
            return View();
        }
        public ActionResult XoaDonHang(int id)
        {
            GioHang gh = (GioHang)Session["GioHang"];
            int kq = gh.Xoa(id);

            Session["GioHang"] = gh;
            return RedirectToAction("XemGioHang", "KhachHang");
        }
        public ActionResult LichSuDatHang()
        {
            if (Session["KhachHang"] == null)
            {
                string tb = "BẠN CẦN ĐĂNG NHẬP ĐỂ SỬ DỤNG CHỨC NĂNG NÀY !";
                ViewBag.TB = tb;
                return View();
            }
            KhachHang kh = (KhachHang)Session["KhachHang"];
            List<HoaDon> dsHD = dt.HoaDons.Where(t => t.MaKH == kh.MaKhachHang).ToList();
            ViewBag.KH = kh;
            return View(dsHD);
        }

        [HttpGet]
        public ActionResult TimKiem()
        {
            List<Loai> dsLoai= dt.Loais.ToList();
            return View(dsLoai);
        }
        [HttpPost]
        public ActionResult XuLiTimKiem(FormCollection col)
        {
            int ml = int.Parse(col["txtTenLoai"].ToString());
            string ten = col["txtTenSP"].ToString();
            if (ml != -1)
            {
                List<SanPham> dsSP = dt.SanPhams.Where(t => t.TenSP.Contains(ten) == true
                    && t.MaLoaiSP == ml).ToList();
                return View(dsSP);
            }
            else
            {
                List<SanPham> dsSP = dt.SanPhams.Where(t => t.TenSP.Contains(ten) == true).ToList();
                ViewBag.SP = dsSP;
                return View(dsSP);
            }
        }
    }
}
