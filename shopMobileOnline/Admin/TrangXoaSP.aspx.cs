using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class TrangXoaSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            //hien thi ten nguoi dung o goc tren phai
            else
            {
                this.Master.ADName = Session["id"].ToString();
                this.Master.ADName1 = Session["id"].ToString();

            }

            string idSP = Request.QueryString.Get("idSP").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT TENSP, TENNSX, TENLOAI,HINH, SOLUONG, DONGIA, SOLUONG_DABAN FROM SANPHAM S, LOAI L, NHASANXUAT N WHERE ID_SP =" + idSP + " AND S.ID_LOAI = L.ID_LOAI AND S.ID_NSX = N.ID_NSX" ;

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            lbTenSP.Text = dt.Rows[0]["TENSP"].ToString();
            lbNSX.Text = dt.Rows[0]["TENNSX"].ToString();
            lbLoai.Text = dt.Rows[0]["TENLOAI"].ToString();
            lbSL.Text = dt.Rows[0]["SOLUONG"].ToString();
            lbGia.Text = String.Format("{0:N0}", dt.Rows[0]["DONGIA"]) + " VND";
            lbSLDaBan.Text = dt.Rows[0]["SOLUONG_DABAN"].ToString();

            imgSP.ImageUrl = "~/Uploads/" + dt.Rows[0]["HINH"].ToString();

            dataAccess.DongKetNoiCSDL();

        }

        protected void btnDongTT_Click(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "UPDATE SANPHAM SET TINHTRANG = 0 WHERE ID_SP = " + idSP;

            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            Response.Redirect("QLSanPham.aspx");

        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "DELETE FROM SANPHAM WHERE ID_SP = " + idSP;

            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            Response.Redirect("QLSanPham.aspx");

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLSanPham.aspx");
        }
    }
}