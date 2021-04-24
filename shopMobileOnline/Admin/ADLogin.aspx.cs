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
    public partial class ADLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.Cookies["username"] != null && Request.Cookies["password"] != null)
                {
                    txtTenDangNhap.Text = Request.Cookies["username"].Value;
                    txtMatKhau.Attributes["value"] = Request.Cookies["password"].Value;

                    cbGhiNho.Checked = true;
                }
                
            }
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //thuc thi proc nho sqlcommand cmd
            SqlCommand cmd = new SqlCommand("KiemTraDangNhapAdmin", dataAccess.getConnection());
            cmd.Parameters.AddWithValue("TENDANGNHAP", txtTenDangNhap.Text);
            cmd.Parameters.AddWithValue("MATKHAU", txtMatKhau.Text);
            cmd.CommandType = CommandType.StoredProcedure;

            //show data lay duoc trong datatable
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            //lay ket qua trong dt de doi chieu
            if(dt.Rows.Count > 0)
            {
                //Ghi nho dang nhap
                if(cbGhiNho.Checked)
                {
                    //Dung cookies
                    Response.Cookies["username"].Value = txtTenDangNhap.Text;
                    Response.Cookies["password"].Value = txtMatKhau.Text;

                    //Thoi gian ghi nho
                    Response.Cookies["username"].Expires = DateTime.Now.AddMinutes(60);
                    Response.Cookies["password"].Expires = DateTime.Now.AddMinutes(60);

                }
                else
                {
                    Response.Cookies["username"].Expires = DateTime.Now;
                    Response.Cookies["password"].Expires = DateTime.Now;
                }
               


                Session["id"] = txtTenDangNhap.Text;
                Response.Redirect("ADTrangChu.aspx");
                Session.RemoveAll();
            }
            else
            {
                lbThongBao.Text = "Sai tên đăng nhập hoặc mật khẩu";
            }

        }
        protected void btnDangKi_Click(object sender, EventArgs e)
        {
           
        }

    }
}