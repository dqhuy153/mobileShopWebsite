using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class DonHangChoDuyet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            else
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "SELECT ID_DONHANG, NGAYDH, DBO.TONG_SOLUONG(ID_DONHANG) AS TONGSL, DBO.TTDONHANG(ID_DONHANG) AS THONGTIN, DBO.TONG_DONHANG(ID_DONHANG) AS TONGTIEN, DBO.HIENTHI_TRANGTHAI(TRANGTHAI) AS HIENTHI_TRANGTHAI, TRANGTHAI FROM DONHANG WHERE TRANGTHAI = 1 ORDER BY ID_DONHANG DESC";

                DataTable dtDH = dataAccess.LayBangDuLieu(sql);

                StringBuilder table = new StringBuilder();

                if (dtDH != null && dtDH.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtDH.Rows)
                    {
                        int trangThai = int.Parse(dr["TRANGTHAI"].ToString());

                        table.Append("<tr class=\"table-tr\">");

                        table.Append("<td class=\"table-td table-item\">" + dr["ID_DONHANG"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["NGAYDH"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["TONGSL"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["THONGTIN"] + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + String.Format("{0:N0}", int.Parse(dr["TONGTIEN"].ToString())) + "</td>");
                        table.Append("<td class=\"table-td table-item\">" + dr["HIENTHI_TRANGTHAI"] + "</td>");
                        table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/ADChiTietDonHang.aspx?t=1&idDH=" + dr["ID_DONHANG"] + "\" class=\"qldh-btnXem\">Chi tiết</a> </td>");
                        
                    }

                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
                dataAccess.DongKetNoiCSDL();
            }
        }
    }
}