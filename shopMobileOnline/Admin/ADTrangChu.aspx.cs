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
    public partial class ADTrangChu : System.Web.UI.Page
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

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //thong ke
            string sql = "SELECT SUM(SOLUONG_DABAN * DONGIA) AS TONGDOANHTHU, SUM(SOLUONG_DABAN) AS TONGDABAN, SUM(SOLUONG) AS TONGTON FROM SANPHAM";

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            if (dt.Rows.Count > 0 && dt != null)
            {
                lbTongDoanhThu.Text = String.Format("{0:n0}", dt.Rows[0]["TONGDOANHTHU"]);
                lbSPDaBan.Text = String.Format("{0:n0}", dt.Rows[0]["TONGDABAN"]);
                lbSPTon.Text = String.Format("{0:n0}", dt.Rows[0]["TONGTON"]);
            }

            //don hang cho duyet
            string sqlDHChoDuyet = "SELECT ID_DONHANG, NGAYDH, DBO.TONG_SOLUONG(ID_DONHANG) AS TONGSL, DBO.TONG_DONHANG(ID_DONHANG) AS TONGTIEN FROM DONHANG WHERE TRANGTHAI = 1 ORDER BY ID_DONHANG DESC";

            DataTable dtDHChoDuyet = dataAccess.LayBangDuLieu(sqlDHChoDuyet);

            StringBuilder table = new StringBuilder();

            if (dtDHChoDuyet != null && dtDHChoDuyet.Rows.Count > 0)
            {
                foreach (DataRow dr in dtDHChoDuyet.Rows)
                {
                    table.Append("<tr class=\"table-tr\">");

                    table.Append("<td class=\"table-td table-item\">" + dr["ID_DONHANG"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["NGAYDH"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["TONGSL"] + "</td>");
                   
                    table.Append("<td class=\"table-td table-item\">" + String.Format("{0:N0}", int.Parse(dr["TONGTIEN"].ToString())) + "</td>");
        
                    table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/ADChiTietDonHang.aspx?t=3&idDH=" + dr["ID_DONHANG"] + "\" class=\"qldh-btnXem\">Xem</a> </td>");
                }

                Panel1.Controls.Add(new Label{ Text = table.ToString()});

                dataAccess.DongKetNoiCSDL();
            }
        }
    }
}