using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.admin
{
    public partial class TrangChiTietSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP");

            if (!Page.IsPostBack)
            {
                //mo ket noi du lieu (goi class DataAccess, xem file dataAccess de hieu, cai nay giong java)
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoServerCaching();
                HttpContext.Current.Response.Cache.SetNoStore();

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                //viet cau lenh sql de lay thong tin san pham
                string sql = "SELECT * FROM SANPHAM S, LOAI L, NHASANXUAT N WHERE ID_SP =" + idSP + " AND S.ID_LOAI = L.ID_LOAI AND S.ID_NSX = N.ID_NSX";

                //luu du lieu da goi vao data table
                DataTable dt = dataAccess.LayBangDuLieu(sql);

                //dat du lieu cho cac lable da tao o trang aspx
                lbTenSP.Text = dt.Rows[0]["TENSP"].ToString();
                lbTen1.Text = dt.Rows[0]["TENSP"].ToString();
                lbNSX.Text = dt.Rows[0]["TENNSX"].ToString();
                lbLoai.Text = dt.Rows[0]["TENLOAI"].ToString();
                lbSL.Text = dt.Rows[0]["SOLUONG"].ToString();
                lbGia.Text = String.Format("{0:N0}", dt.Rows[0]["DONGIA"]) + " VND";
                lbManHinh.Text = dt.Rows[0]["MANHINH"].ToString();
                lbCamSau.Text = dt.Rows[0]["CAMERASAU"].ToString();
                lbCamTruoc.Text = dt.Rows[0]["CAMERATRUOC"].ToString();
                lbCPU.Text = dt.Rows[0]["CPU"].ToString();
                lbBoNho.Text = dt.Rows[0]["BONHO"].ToString();
                lbKetNoi.Text = dt.Rows[0]["KETNOI"].ToString();
                lbPin.Text = dt.Rows[0]["PIN"].ToString();

                imgSP.ImageUrl = "~/Uploads/" + dt.Rows[0]["HINH"].ToString();

                

                DataTable cart = new DataTable();
                if (Session["cart"] == null)
                {
                    //Nếu chưa có giỏ hàng, tạo giỏ hàng thông qua DataTable với 4 cột chính
                    cart.Columns.Add("ID");
                    cart.Columns.Add("Hinh");
                    cart.Columns.Add("Ten");
                    cart.Columns.Add("Gia");
                    cart.Columns.Add("SoLuong");

                    //Sau khi tạo xong thì lưu lại vào session
                    Session["cart"] = cart;
                }
                else
                {
                    //Lấy thông tin giỏ hàng từ Session["cart"]
                    cart = Session["cart"] as DataTable;
                }

                    dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            //Khi click vao thi san pham se duoc them vao trang gio hang
            string idSP = Request.QueryString.Get("idSP");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT * FROM SANPHAM WHERE ID_SP = " + idSP;

            DataTable dt = dataAccess.LayBangDuLieu(sql);
            int soLuongConLai = int.Parse(dt.Rows[0]["SOLUONG"].ToString());

            if (int.Parse(txtSL.Text) > soLuongConLai)
            {
                Response.Write($"<script>alert(\"Bạn chỉ được phép đặt {soLuongConLai} sản phẩm\")</script>");
            }
            else
            {
                Response.Redirect("ThemGioHangThanhCong.aspx?action=add&idSP="+idSP+"&sl="+txtSL.Text);
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            //Khi click vao thi san pham se duoc luu vao bang LUU
        }
    }
}