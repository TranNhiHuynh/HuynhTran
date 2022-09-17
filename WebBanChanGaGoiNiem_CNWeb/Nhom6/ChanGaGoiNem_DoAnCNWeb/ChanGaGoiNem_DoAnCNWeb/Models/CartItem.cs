using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ChanGaGoiNem_DoAnCNWeb.Models;
namespace ChanGaGoiNem_DoAnCNWeb.Models
{
    public class CartItem
    {
        public int iMaSP { get; set; }
        public string sTenSP { get; set; }
        public string sAnhBia { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double ThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }
        ChanGaGoiNemDataContext dt = new ChanGaGoiNemDataContext();

        public CartItem(int MaSP)
        {
            SanPham sp = dt.SanPhams.Single(n => n.MaSanPham == MaSP);
            if (sp != null)
            {
                iMaSP = MaSP;
                sTenSP = sp.TenSP;
                sAnhBia = sp.HinhAnh;
                dDonGia = double.Parse(sp.DonGia.ToString());
                iSoLuong = 1;
            }
        }
    }
}