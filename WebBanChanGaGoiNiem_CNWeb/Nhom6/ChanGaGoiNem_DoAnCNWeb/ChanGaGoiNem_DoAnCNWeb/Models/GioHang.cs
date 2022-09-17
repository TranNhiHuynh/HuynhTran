using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ChanGaGoiNem_DoAnCNWeb.Models;
namespace ChanGaGoiNem_DoAnCNWeb.Models
{
    public class GioHang
    {
        public List<CartItem> lst;
        public GioHang()
        {
            lst = new List<CartItem>();
        }
        public GioHang(List<CartItem> lstGH)
        {
            lst = lstGH;
        }
        public int SoMatHang()
        {
            if (lst == null)
                return 0;
            return lst.Count;
        }
        public int TongSLHang()
        {
            if (lst != null)
                return lst.Sum(t => t.iSoLuong);
            return 0;
        }
        public double TongThanhTIen()
        {
            if (lst != null)
                return lst.Sum(t => t.ThanhTien);
            return 0;
        }
        public int Them(int iMaSP)
        {
            CartItem sanpham = lst.FirstOrDefault(t => t.iMaSP == iMaSP);
            if (sanpham == null)
            {
                CartItem sach = new CartItem(iMaSP);
                if (sach == null)
                    return -1;
                lst.Add(sach);
            }
            else
            {
                sanpham.iSoLuong++;
            }
            return 1;
        }
        public int Xoa(int ma)
        {
            CartItem sanpham = lst.Find(n => n.iMaSP == ma);
            if (sanpham != null)// có sản phẩm
            {
                lst.Remove(sanpham);
                return 1;
            }
            return -1;//Không có sản phẩm
        }
    }
}