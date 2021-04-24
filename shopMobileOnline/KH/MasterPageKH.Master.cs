using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class MasterPageKH : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["userKH"] chứa tên username

            if (Session["userKH"] != null)
            {
                hlUser.NavigateUrl = "ThongTinTaiKhoan.aspx?username=" + Session["userKH"].ToString(); 
                lbAccount.Text = Session["userKH"].ToString();
                hlDangNhap.Style.Add("display", "none");
            }
            else
            {
                hlUser.NavigateUrl = "KHDangNhap.aspx";
                lbDangXuat.Style.Add("display", "none");
            }

            if(Session["cart"] != null)
            {
                DataTable cart = Session["cart"] as DataTable;
                lbSLGioHang.Text = cart.Rows.Count.ToString();
            }
            
            DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "SELECT ID_NSX, TENNSX FROM NHASANXUAT";

                DataTable dt = dataAccess.LayBangDuLieu(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    this.rptNSX.DataSource = dt;
                    this.rptNSX.DataBind();
                }

                dataAccess.DongKetNoiCSDL();
            
            
        }

        protected void btnSearch_Onclick(object sender, EventArgs e)
        {
            Response.Redirect("KHTimKiem.aspx?search=" + txtTimKiem.Text.Trim());
        }
        protected void lbDangXuat_Onclick(object sender, EventArgs e)
        {
            Session["userKH"] = null;
            Session.Clear();
            Response.Cookies.Clear();
            Response.Cache.SetNoStore();
            Response.CacheControl = "no-cache";
            Response.Redirect("KHDangNhap.aspx");
        }

        public string AccountName
        {
            get
            {
                return lbAccount.Text;
            }
            set
            {
                lbAccount.Text = value;
            }
        }
    }
}