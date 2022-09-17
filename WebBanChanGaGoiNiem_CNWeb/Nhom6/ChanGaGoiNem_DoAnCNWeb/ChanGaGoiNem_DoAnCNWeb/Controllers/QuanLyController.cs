using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChanGaGoiNem_DoAnCNWeb.Models;
namespace ChanGaGoiNem_DoAnCNWeb.Controllers
{
    public class QuanLyController : Controller
    {
        //
        // GET: /QuanLy/
        ChanGaGoiNemDataContext dt = new ChanGaGoiNemDataContext();
        public ActionResult TrangChu()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ThemSanPham()
        {
            List<Loai> dsLoai = dt.Loais.ToList();
            return View(dsLoai);
        }

        [HttpPost]
        public ActionResult XuLiThemSP(FormCollection col, HttpPostedFileBase fileUpload)
        {
            if (col["txtTenSP"].ToString() == null || col["txtDG"].ToString() == null || col["txtSL"].ToString() == null ||
                col["txtLoaiSP"].ToString() == null || fileUpload == null)
            {
                ViewBag.TB = "THÊM THẤT BẠI. VUI LÒNG NHẬP ĐẦY ĐỦ THÔNG TIN SẢN PHẨM !";
                return View();
            }
            List<SanPham> dsSP = dt.SanPhams.ToList();
            SanPham sp = new SanPham();
            string tensp = col["txtTenSP"].ToString();
            int dg = int.Parse(col["txtDG"].ToString());
            int slt = int.Parse(col["txtSL"].ToString());
            int mlsp = int.Parse(col["txtLoaiSP"].ToString());
            //
            
            sp.MaSanPham = dsSP.Count + 1;
            sp.TenSP = tensp;
            sp.DonGia = dg;
            sp.SoLuongTon = slt;
            sp.MaLoaiSP = mlsp;
            sp.HinhAnh = fileUpload.FileName;
            fileUpload.SaveAs(Server.MapPath("/Content/HinhAnh/" + fileUpload.FileName));
            dt.SanPhams.InsertOnSubmit(sp);
            dt.SubmitChanges();
            return View(sp);
        }

        public ActionResult QuanLyDonHang()
        {
            List<HoaDon> dsHD = dt.HoaDons.ToList();
            return View(dsHD);
        }
      
        [HttpPost]
        public ActionResult CapNhatGiaoHang(FormCollection col)
        {
            int tong = int.Parse(col["tong"]);
            for (int i = 1; i <= tong; i++)
            {
                string tenCHK = i.ToString();
                if (col[tenCHK] != null) // hóa đơn tại vị trí này đc chọn
                {
                    // cập nhật tình trạng giao hàng tại hóa đơn có mhd là giá trị nút checkbox
                    int mhd = int.Parse(col[tenCHK]);
                    HoaDon hd = dt.HoaDons.SingleOrDefault(t => t.MaHoaDon == mhd);
                    hd.NgayThanhToan = DateTime.Now;// do trong SQL NgayThanhToan kieu date
                    UpdateModel(hd);
                    dt.SubmitChanges();
                }
            }
            return RedirectToAction("QuanLyDonHang", "QuanLy");
        }
        public ActionResult ThongKe(int mhd)
        {
            List<ChiTiet> dsCT = dt.ChiTiets.Where(c => c.MaHD == mhd).ToList();
            // Thống kê thành tiền
            // ct.tbl_SanPham.DonGia : lấy msp trong ct để truy xuất DonGia co msp trong ct
            var thanhtien = dsCT.Sum(ct => ct.SoLuong * ct.SanPham.DonGia);
            ViewBag.tt = thanhtien;
            return PartialView(dsCT);
        }
        public ActionResult ChiTietHoaDon(int mhd)
        {
            List<ChiTiet> dsCT = dt.ChiTiets.Where(c => c.MaHD == mhd).ToList();
            return PartialView(dsCT);
        }

        public ActionResult ThongKeDoanhThu()
        {
            return View();
        }

        [HttpPost]
        public ActionResult XuLiThongKeDoanhThu(FormCollection col)
        {
            DateTime ngayBD = DateTime.Parse(col["txtNgayBD"]);
            DateTime ngayKT = DateTime.Parse(col["txtNgayKT"]);
            int kt = DateTime.Compare(ngayBD, ngayKT);
            if(kt >0)
            {
                ViewBag.TB ="VUI LÒNG CHỌN NGÀY HỢP LÍ !";
                return View();
            }
            List<HoaDon> dsHD = dt.HoaDons.Where(t => t.NgayHoaDon >= ngayBD && t.NgayHoaDon <= ngayKT).ToList();
            var tongtien = 0;
            List<ChiTiet> dsCT = dt.ChiTiets.Where(t => t.HoaDon.NgayHoaDon >= ngayBD && t.HoaDon.NgayHoaDon <= ngayKT).ToList();
            foreach (ChiTiet i in dsCT)
            {
                        tongtien += (int.Parse(i.SoLuong.ToString()) *  int.Parse(i.SanPham.DonGia.ToString()));
            }
            ViewBag.TT = tongtien;
            return View(dsHD);
        }


    }
}
