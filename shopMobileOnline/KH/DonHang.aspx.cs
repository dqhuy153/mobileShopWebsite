using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class DonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                //check xem nguoi dung co dang trong phien dang nhap
                if (Session["userKH"] != null)

                {
                    dhNotLogin.Style.Add("display", "none");

                    string userKH = Session["userKH"].ToString();

                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    string sql = "SELECT D.ID_DONHANG, NGAYDH, DBO.TTDONHANG(D.ID_DONHANG) AS THONGTIN, DBO.TONG_SOLUONG(D.ID_DONHANG) AS TONGSL, DBO.TONG_DONHANG(D.ID_DONHANG) AS TONGTIEN, DBO.HIENTHI_TRANGTHAI(TRANGTHAI) AS HIENTHI_TRANGTHAI, 'ChiTietDonHang.aspx?idDH=' + CAST(D.ID_DONHANG AS NVARCHAR) AS XEMCT, TRANGTHAI FROM DONHANG D, CTDONHANG CT, TAIKHOAN T WHERE D.ID_DONHANG = CT.ID_DONHANG AND D.ID_TK = T.ID_TK AND TENDANGNHAP = '" + userKH + "' group by  D.ID_DONHANG, NGAYDH, TRANGTHAI order by D.ID_DONHANG DESC";

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
                            table.Append("<td class=\"table-td table-item\"><a href=\"/KH/ChiTietDonHang.aspx?idDH=" + dr["ID_DONHANG"] + "\" class=\"qldh-btnXem\">Chi tiết</a> </td>");
                            if (trangThai == 0)
                            {
                                table.Append("<td class=\"table-td table-item\"><i class=\"fas fa-times-circle x-icon\"></i></td>");
                            }
                            else if (trangThai == 1)
                            {
                                table.Append("<td class=\"table-td table-item\"><a href=\"/KH/ChiTietDonHang.aspx?idDH=" + dr["ID_DONHANG"] + "\" class=\"qldh-btnHuy\">Hủy</a> </td>");
                            }
                            else if (trangThai == 2)
                            {
                                table.Append("<td class=\"table-td table-item\"><i class=\"fas fa-check-circle v-icon\"></i></td>");
                            }
                            table.Append("</tr>");
                        }

                    }
                    Panel1.Controls.Add(new Label { Text = table.ToString() });
                    dataAccess.DongKetNoiCSDL();
                }
                else
                {
                    qldh.Style.Add("display", "none");
                }
            }
        }
    }
}