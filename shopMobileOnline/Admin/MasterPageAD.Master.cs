using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class MasterPageAD : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"] != null)
            {
                lbADName.Text = Session["id"].ToString();
                lbADName1.Text = Session["id"].ToString();

            }
        }
        public string ADName
        {
            get
            {
                return lbADName.Text;
            }
            set
            {
                lbADName.Text = value;
            }
        }
        public string ADName1
        {
            get
            {
                return lbADName1.Text;
            }
            set
            {
                lbADName1.Text = value;
            }
        }

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session.Clear();
            Response.Cookies.Clear();
            Response.Cache.SetNoStore();
            Response.CacheControl = "no-cache";
            Response.Redirect("ADLogin.aspx");
        }
    }
}