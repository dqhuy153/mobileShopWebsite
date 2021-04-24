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
    public partial class ADDangKi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDangKi_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("INSERT_AD", dataAccess.getConnection());
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
                    Response.Cookies["username"].Value = txtTenDangNhap.Text;
                    Response.Cookies["password"].Value = txtMatKhau.Text;

                    //Thoi gian ghi nho
                    Response.Cookies["username"].Expires = DateTime.Now.AddMinutes(15);
                    Response.Cookies["password"].Expires = DateTime.Now.AddMinutes(15);

                }
                else
                {
                    Response.Cookies["username"].Expires = DateTime.Now;
                    Response.Cookies["password"].Expires = DateTime.Now;
                }

                Response.Redirect("ADTrangChu.aspx");
            }
            else
            {
                lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
            }

        }
    }
}