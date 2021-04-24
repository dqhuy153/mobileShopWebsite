using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class TrangSPTheoNSX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            string idNSX = Request.QueryString.Get("idNSX");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "";

            if (idNSX != null)
            {
                sql = "SELECT ID_SP, S.ID_NSX, TENNSX, ID_LOAI, TENSP, HINH, SOLUONG, DONGIA, CAST(DONGIA*1.15 AS INT) AS GIAGOC, CAST(DONGIA*0.4 AS INT) AS GIATRATRUOC FROM SANPHAM S, NHASANXUAT N WHERE TINHTRANG = 1 AND S.ID_NSX = N.ID_NSX AND S.ID_NSX=" + idNSX;
            }
            else
            {
                sql = "SELECT ID_SP, S.ID_NSX, TENNSX, ID_LOAI, TENSP, HINH, SOLUONG, DONGIA, CAST(DONGIA*1.15 AS INT) AS GIAGOC, CAST(DONGIA*0.4 AS INT) AS GIATRATRUOC FROM SANPHAM S, NHASANXUAT N WHERE TINHTRANG = 1 AND S.ID_NSX = N.ID_NSX";
                btnXemThem.Style.Add("Display", "none");
                
            }

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            if (dt != null && dt.Rows.Count > 0)
            {
                if(idNSX != null)
                    lbNSX.Text = dt.Rows[0]["TENNSX"].ToString();
                else
                    lbNSX.Text = "Danh sách sản phẩm";

                this.rptItem.DataSource = dt;
                this.rptItem.DataBind();
                
            }

            dataAccess.DongKetNoiCSDL();
        }
    }
}