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
    public partial class ThongTinTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Lay id kh tu duoi website
                string usernameKH = Request.QueryString.Get("username");


                DataAccess data = new DataAccess();
                data.MoKetNoiCSDL();

                string sql = "SELECT * FROM TAIKHOAN T, LOAITK L WHERE T.ID_LOAITK = L.ID_LOAITK AND TENDANGNHAP = N'" + usernameKH +"'";

                DataTable dt = data.LayBangDuLieu(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    lbTenDangNhap.Text = dt.Rows[0]["TENDANGNHAP"].ToString();
                    lbLoaiTK.Text = "";
                    txtTen.Text = dt.Rows[0]["HOTEN"].ToString();
                    //txtMatKhauCu.Text = dt.Rows[0]["MATKHAU"].ToString();
                    txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                    txtDiaChi.Text = dt.Rows[0]["DIACHI"].ToString();
                    txtSDT.Text = dt.Rows[0]["SDT"].ToString();
                }

                data.DongKetNoiCSDL();

            }
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            string usernameKH = Request.QueryString.Get("username");

            //SqlConnection conn = new SqlConnection(@"C:\USERS\OS\DOWNLOADS\SHOPMOBILEONLINE\SHOPMOBILEONLINE\APP_DATA\SHOPMOBILEONLINE.MDF");
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();
            //Khai báo 3 biến để chứa dữ liệu nhập vào trên form

            string strTen = txtTen.Text;
            string stremail = txtEmail.Text;
            string strsdt = txtSDT.Text;
            string strdiachi = txtDiaChi.Text;
            string strPassCu = txtMatKhauCu.Text;
            string strPassMoi = txtMatKhauMoi.Text;
            string strNhapLai = txtNhapLai.Text;

            string sql = "SELECT * FROM TAIKHOAN WHERE TENDANGNHAP =N'" + usernameKH +"'";
            DataTable dt = dataAccess.LayBangDuLieu(sql);

            string loaiTK = dt.Rows[0]["ID_LOAITK"].ToString();
            string idTK = dt.Rows[0]["ID_TK"].ToString();

            //Khởi tạo 1 đối tượng command để thực thi lệnh Insert
            SqlCommand cmd;

            //cmd.CommandText = "insert into TAIKHOAN" +" (HOTEN, MATKHAU, EMAIL,DIACHI,SDT) VALUES " +" ('" + strUser + "', '" + strPass + "', N'" + stremail + "','" + strdiachi + "','" + strsdt + "')";

            if (strPassCu == "" || strPassCu == null)
            {
                cmd = new SqlCommand();
                cmd.CommandText = "UPDATE TAIKHOAN " +
                    "SET HOTEN=N'" + strTen + "'," +
                    "EMAIL= N'" + stremail + "'," +
                    "DIACHI = N'" + txtDiaChi.Text + "'," +
                    "SDT = '" + txtSDT.Text + "' " +
                    "WHERE TENDANGNHAP = N'" + usernameKH +"'";

                cmd.Connection = dataAccess.getConnection();//Gán connection cho command

                cmd.ExecuteNonQuery();
                lbThongBao.Text = "Cập nhật thành công";

                dataAccess.DongKetNoiCSDL();

                Response.Write("<script>alert(\"Cập nhật thành công\")</script>");

            }
            else if (strPassCu != "" && strPassMoi == "")
            {
                lbThongBao.Text = "Bạn chưa nhập mật khẩu mới";
            }
            else
            {
                cmd = new SqlCommand("CAPNHATTK_DOIMATKHAU", dataAccess.getConnection());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@MATKHAUCU", strPassCu);
                cmd.Parameters.AddWithValue("@HOTEN", strTen);
                cmd.Parameters.AddWithValue("@EMAIL", stremail);
                cmd.Parameters.AddWithValue("@DIACHI", strdiachi);
                cmd.Parameters.AddWithValue("@SDT", strsdt);
                cmd.Parameters.AddWithValue("@MATKHAUMOI", strPassMoi);
                cmd.Parameters.AddWithValue("@ID_TK", int.Parse(idTK));

                cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                int a = cmd.ExecuteNonQuery();

                if (a > 0)
                {
                    lbThongBao.Text = "Cập nhật thành công";

                    dataAccess.DongKetNoiCSDL();

                    Response.Write("<script>alert(\"Cập nhật thành công\")</script>");

                }
                else
                {
                    lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                }

            }
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("KHTrangChu.aspx");
        }
    }
}