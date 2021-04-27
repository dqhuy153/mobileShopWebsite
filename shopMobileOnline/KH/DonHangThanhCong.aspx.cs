using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class DonHangThanhCong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["userKH"] == null)
            {
                Response.Redirect("KHDangNhap.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString.Get("idDH") != null)
                {
                    string idDH = Request.QueryString.Get("idDH");
                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    string sql = "SELECT S.ID_SP, TENSP, CT.DONGIA, HINH, CT.SOLUONG, DBO.TONG_DONHANG(D.ID_DONHANG) AS TONGTIEN, DBO.HIENTHI_TRANGTHAI(TRANGTHAI) AS HT_TRANGTHAI, TRANGTHAI FROM DONHANG D, CTDONHANG CT, SANPHAM S WHERE D.ID_DONHANG = CT.ID_DONHANG AND CT.ID_SP = S.ID_SP AND D.ID_DONHANG = " + idDH;

                    DataTable dtDH = dataAccess.LayBangDuLieu(sql);

                    if (dtDH != null && dtDH.Rows.Count > 0)
                    {

                        this.rptSP.DataSource = dtDH;
                        this.rptSP.DataBind();

                        lblTong.Text = String.Format("{0:n0}", int.Parse(dtDH.Rows[0]["TONGTIEN"].ToString()));

                        //foreach(DataRow dr in dtDH.Rows)
                        //{
                        //    foreach(RepeaterItem item in rptSP.Items)
                        //    {
                        //        HyperLink hlDanhGia = (HyperLink)item.FindControl("hlDanhGia");
                        //        string idSP = dr["ID_SP"].ToString();

                        //        if (!String.IsNullOrEmpty(hlDanhGia.NavigateUrl))
                        //        {
                        //            continue;
                        //        }
                        //        else
                        //        {
                        //            hlDanhGia.NavigateUrl = "~/KH/KHDanhGia.aspx?idSP="+idSP;
                        //            break;
                        //        }
                        //    }
                        //}
                    }

                    dataAccess.DongKetNoiCSDL();
                }
            }

        }
        
    }
}