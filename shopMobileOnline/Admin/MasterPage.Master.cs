using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private DataAccess dataAccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "select * from NHASANXUAT";
            DataTable dataTable = dataAccess.LayBangDuLieu(sql);
           
            this.rptMenu.DataSource = dataTable;
            this.rptMenu.DataBind();
            
            dataAccess.DongKetNoiCSDL();
        }
    }
}