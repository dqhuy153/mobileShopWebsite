using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.admin
{
    public partial class TrangDanhSachSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //check xem nguoi dung co dang trong phien dang nhap
            //if (Session["userKH"] == null)
            //{
                //Response.Redirect("KHDangNhap.aspx");
            //}
            //hien thi ten nguoi dung o goc tren phai
            //else
            //{
                //this.Master.AccountName = Session["userKH"].ToString();
            //}

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT ID_SP, ID_NSX, ID_LOAI, TENSP, HINH, SOLUONG, DONGIA, CAST(DONGIA*1.15 AS INT) AS GIAGOC, CAST(DONGIA*0.4 AS INT) AS GIATRATRUOC FROM SANPHAM WHERE TINHTRANG = 1 AND SOLUONG > 0";

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            if(dt != null && dt.Rows.Count >0)
            {
                this.rptItem.DataSource = dt;
                this.rptItem.DataBind();
            }

            dataAccess.DongKetNoiCSDL();
        }
    }
}