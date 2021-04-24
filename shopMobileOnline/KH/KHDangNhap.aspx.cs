using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class KHDangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["usernameKH"] != null && Request.Cookies["passwordKH"] != null)
                {
                    txtTenDangNhap.Text = Request.Cookies["usernameKH"].Value;
                    txtMatKhau.Attributes["value"] = Request.Cookies["passwordKH"].Value;

                    cbGhiNho.Checked = true;
                }

            }
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //thuc thi proc nho sqlcommand cmd
            SqlCommand cmd = new SqlCommand("KiemTraDangNhapKH", dataAccess.getConnection());
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
            if (dt.Rows.Count > 0)
            {
                //Ghi nho dang nhap
                if (cbGhiNho.Checked)
                {
                    //Dung cookies
                    Response.Cookies["usernameKH"].Value = txtTenDangNhap.Text;
                    Response.Cookies["passwordKH"].Value = txtMatKhau.Text;

                    //Thoi gian ghi nho
                    Response.Cookies["usernameKH"].Expires = DateTime.Now.AddMinutes(60);
                    Response.Cookies["passwordKH"].Expires = DateTime.Now.AddMinutes(60);

                }
                else
                {
                    Response.Cookies["usernameKH"].Expires = DateTime.Now;
                    Response.Cookies["passwordKH"].Expires = DateTime.Now;
                }

                Session["userKH"] = txtTenDangNhap.Text;
                Response.Redirect("KHTrangChu.aspx");
                Session.RemoveAll();
            }
            else
            {
                lbThongBao.Text = "Sai tên đăng nhập hoặc mật khẩu";
            }

        }
    }
}