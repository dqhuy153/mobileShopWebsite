using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class DanhSachTK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            

            StringBuilder table = new StringBuilder();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select ID_TK, TENDANGNHAP, MATKHAU, HOTEN, EMAIL, DIACHI, SDT, 'ADCapNhatTK.aspx?id=' + CAST(ID_TK AS NVARCHAR) AS CAPNHAT, 'ADXoaTK.aspx?id=' + CAST(ID_TK AS NVARCHAR) AS XOA from [TAIKHOAN] where ID_LOAITK=1";
            cmd.Connection = dataAccess.getConnection();
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    table.Append("<tr class=\"table-tr\">");
                    table.Append("<td class=\"table-td table-item\">" + rd[0] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[1] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[2] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[3] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[4] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[5] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[6] + "</td>");
                    table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/" + rd[7] + "\" class=\"qltk-btnCapNhat\">Cập nhật</a> </td>");
                    table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/" + rd[8] + "\" class=\"qltk-btnXoa\">Xóa</a> </td>");

                    table.Append("</tr>");
                }

            }
            table.Append("</table>");
            PlaceHolder2.Controls.Add(new Literal { Text = table.ToString() });
            rd.Close();
        }
    }
}