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
    public partial class ChiTietDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                        int trangThai = int.Parse(dtDH.Rows[0]["TRANGTHAI"].ToString());

                        this.rptSP.DataSource = dtDH;
                        this.rptSP.DataBind();

                        lblTong.Text = String.Format("{0:n0}", int.Parse(dtDH.Rows[0]["TONGTIEN"].ToString()));

                        if (trangThai == 0)
                        {
                            lbDaGiaoHang.Style.Add("display", "none");
                            btnHuy.Style.Add("display", "none");
                        }
                        else if (trangThai == 1)
                        {
                            lbDaGiaoHang.Style.Add("display", "none");
                            lbDaHuy.Style.Add("display", "none");
                        }
                        else if (trangThai == 2)
                        {
                            btnHuy.Style.Add("display", "none");
                            lbDaHuy.Style.Add("display", "none");
                        }
                    }

                    dataAccess.DongKetNoiCSDL();
                }
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            if(Request.QueryString.Get("idDH") != null)
            {
                string idDH = Request.QueryString.Get("idDH");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "UPDATE DONHANG SET TRANGTHAI = 0 WHERE ID_DONHANG = " + idDH;

                SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

                cmd.ExecuteNonQuery();

                Response.Redirect("DonHang.aspx");
                dataAccess.DongKetNoiCSDL();
            }

        }
    }
}