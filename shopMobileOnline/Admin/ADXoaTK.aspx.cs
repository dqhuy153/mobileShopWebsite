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
    public partial class TrangXoaTKKH : System.Web.UI.Page
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

            string id = Request.QueryString.Get("id");
            if (!IsPostBack)
            {

                DataAccess data = new DataAccess();
                data.MoKetNoiCSDL();

                string sql = "SELECT * FROM TAIKHOAN T, LOAITK L WHERE T.ID_LOAITK = L.ID_LOAITK AND ID_TK = " + id;

                DataTable dt = data.LayBangDuLieu(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    lbTenDangNhap.Text = dt.Rows[0]["TENDANGNHAP"].ToString();
                    lbLoaiTK.Text = dt.Rows[0]["TENLOAITK"].ToString();
                    txtTen.Text = dt.Rows[0]["HOTEN"].ToString();
                    txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                    txtDiaChi.Text = dt.Rows[0]["DIACHI"].ToString();
                    txtSDT.Text = dt.Rows[0]["SDT"].ToString();
                }
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString.Get("id");

            //SqlConnection conn = new SqlConnection(@"C:\USERS\OS\DOWNLOADS\SHOPMOBILEONLINE\SHOPMOBILEONLINE\APP_DATA\SHOPMOBILEONLINE.MDF");
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();
            string sql = "SELECT * FROM TAIKHOAN WHERE ID_TK =" + id;
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            string loaiTK = dt.Rows[0]["ID_LOAITK"].ToString();

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DELETE TAIKHOAN " +
                "WHERE ID_TK =" + id;
            cmd.Connection = dataAccess.getConnection();//Gán connection cho command

            cmd.ExecuteNonQuery();
            lbThongBao.Text = "Xóa thành công";

            dataAccess.DongKetNoiCSDL();
            //Cap nhat xong ve trang ql tk
            if (int.Parse(loaiTK) == 1)
            {
                Response.Redirect("QLTaiKhoanAdmin.aspx");
            }
            if (int.Parse(loaiTK) == 2)
            {
                Response.Redirect("QLTaiKhoanKH.aspx");
            }
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString.Get("id");
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();
            string sql = "SELECT * FROM TAIKHOAN WHERE ID_TK =" + id;
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            string loaiTK = dt.Rows[0]["ID_LOAITK"].ToString();
            if (int.Parse(loaiTK) == 1)
            {
                Response.Redirect("QLTaiKhoanAdmin.aspx");
            }
            if (int.Parse(loaiTK) == 2)
            {
                Response.Redirect("QLTaiKhoanKH.aspx");
            }
            dataAccess.DongKetNoiCSDL();
        }
    }
}