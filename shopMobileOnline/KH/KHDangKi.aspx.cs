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
    public partial class DangKi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKi_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("INSERT_KH", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@TENDANGNHAP", txtTenDangNhap.Text);
            cmd.Parameters.AddWithValue("@MATKHAU", txtMatKhau.Text);
            cmd.Parameters.AddWithValue("@HOTEN", txtHoTen.Text);
            cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
            cmd.Parameters.AddWithValue("@DIACHI", txtDiaChi.Text);
            cmd.Parameters.AddWithValue("@SDT", txtSDT.Text);
            cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            int a = cmd.ExecuteNonQuery();

            //co the thu int a = cmd.ExecuteNonQuery(); de check so row effected
            if (a > 0)
            {
                lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();

                if (cbGhiNho.Checked)
                {
                    Response.Cookies["usernameKH"].Value = txtTenDangNhap.Text;
                    Response.Cookies["passwordKH"].Value = txtMatKhau.Text;

                    //Thoi gian ghi nho
                    Response.Cookies["usernameKH"].Expires = DateTime.Now.AddMinutes(15);
                    Response.Cookies["passwordKH"].Expires = DateTime.Now.AddMinutes(15);

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
                lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
            }

        }
    }
}