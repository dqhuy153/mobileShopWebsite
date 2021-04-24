using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class KHTimKiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            string strSearch = Request.QueryString.Get("search");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "";

            if (strSearch != null)
            {
                sql = "SELECT ID_SP, S.ID_NSX, TENNSX, L.ID_LOAI, TENSP, HINH, SOLUONG, DONGIA, CAST(DONGIA*1.15 AS INT) AS GIAGOC, CAST(DONGIA*0.4 AS INT) AS GIATRATRUOC  FROM SANPHAM S, LOAI L, NHASANXUAT N WHERE (S.ID_NSX = N.ID_NSX AND S.ID_LOAI = L.ID_LOAI AND TENSP LIKE '%" + strSearch + "%') OR (S.ID_NSX = N.ID_NSX AND S.ID_LOAI = L.ID_LOAI AND TENNSX LIKE '%" + strSearch + "%') OR (S.ID_NSX = N.ID_NSX AND S.ID_LOAI = L.ID_LOAI AND TENLOAI LIKE '%" + strSearch + "%')"; 
            }
            else
            {
                sql = "SELECT ID_SP, S.ID_NSX, TENNSX, L.ID_LOAI, TENSP, HINH, SOLUONG, DONGIA, CAST(DONGIA*1.15 AS INT) AS GIAGOC, CAST(DONGIA*0.4 AS INT) AS GIATRATRUOC FROM SANPHAM S, NHASANXUAT N WHERE TINHTRANG = 1 AND S.ID_NSX = N.ID_NSX";
                btnXemThem.Style.Add("Display", "none");

            }

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            if (dt != null && dt.Rows.Count > 0)
            {
                if (strSearch != null)
                    lbSearch.Text = "Kết quả tìm kiếm cho: " + strSearch;
                else
                    lbSearch.Text = "Danh sách sản phẩm";

                this.rptItem.DataSource = dt;
                this.rptItem.DataBind();

            }
            else
            {
                lbSearch.Text = "Không tìm thấy sản phẩm";
            }

            dataAccess.DongKetNoiCSDL();
        }
    }
}