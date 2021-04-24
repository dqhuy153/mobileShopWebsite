using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class ADChiTietDonHang : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
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
                        int trangThai = int.Parse(dtDH.Rows[0]["TRANGTHAI"].ToString());

                        this.rptSP.DataSource = dtDH;
                        this.rptSP.DataBind();

                        lblTong.Text = String.Format("{0:n0}", int.Parse(dtDH.Rows[0]["TONGTIEN"].ToString())) + " vnd";

                        if (trangThai == 0)
                        {
                            
                            lbDaGiao.Style.Add("display", "none");
                            
                            btnHuy.Style.Add("display", "none");
                        }
                        else if (trangThai == 1)
                        {
                            btnCho.Style.Add("display", "none");
                            lbDaGiao.Style.Add("display", "none");
                        }
                        else if (trangThai == 2)
                        {
                            btnDuyet.Style.Add("display", "none");
                            btnHuy.Style.Add("display", "none");
                            btnCho.Style.Add("display", "none");
                        }
                    }

                    string sqlKH = "SELECT HOTEN, DH.EMAIL, DH.SDT, DH.DIACHI FROM TAIKHOAN TK, DONHANG DH WHERE TK.ID_TK = DH.ID_TK AND ID_DONHANG=" + idDH;
                    DataTable dt = dataAccess.LayBangDuLieu(sqlKH);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        txtTen.Text = dt.Rows[0]["HOTEN"].ToString();
                        //txtMatKhauCu.Text = dt.Rows[0]["MATKHAU"].ToString();
                        txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                        txtDiaChi.Text = dt.Rows[0]["DIACHI"].ToString();
                        txtSDT.Text = dt.Rows[0]["SDT"].ToString();
                    }
                    dataAccess.DongKetNoiCSDL();
                }
            }
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("idDH") != null && Request.QueryString.Get("t")!= null)
            {
                int trangTruoc = int.Parse(Request.QueryString.Get("t"));
                string idDH = Request.QueryString.Get("idDH");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "UPDATE DONHANG SET TRANGTHAI = 0 WHERE ID_DONHANG = " + idDH;

                SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                if (trangTruoc == 0)
                {
                    Response.Redirect("DonHangDaHuy.aspx");

                }
                if (trangTruoc == 1)
                {
                    Response.Redirect("DonHangChoDuyet.aspx");
                }
                if (trangTruoc == 2)
                {
                    Response.Redirect("DonHangThanhCong.aspx");
                }
                if (trangTruoc == 3)
                {
                    Response.Redirect("ADTrangChu.aspx");
                }
            }

        }

        protected void btnCho_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("idDH") != null && Request.QueryString.Get("t") != null)
            {
                int trangTruoc = int.Parse(Request.QueryString.Get("t"));
                string idDH = Request.QueryString.Get("idDH");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sql = "UPDATE DONHANG SET TRANGTHAI = 1 WHERE ID_DONHANG = " + idDH;

                SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                if(trangTruoc == 0)
                {
                    Response.Redirect("DonHangDaHuy.aspx");

                }
                if(trangTruoc == 1)
                {
                    Response.Redirect("DonHangChoDuyet.aspx");
                }
                if(trangTruoc == 2)
                {
                    Response.Redirect("DonHangThanhCong.aspx");
                }
                if (trangTruoc == 3)
                {
                    Response.Redirect("ADTrangChu.aspx");
                }
            }
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("idDH") != null && Request.QueryString.Get("t") != null)
            {
                int trangTruoc = int.Parse(Request.QueryString.Get("t"));
                string idDH = Request.QueryString.Get("idDH");
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand("DUYET_DONHANG", dataAccess.getConnection());

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID_DONHANG", int.Parse(idDH));

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                if (trangTruoc == 0)
                {
                    Response.Redirect("DonHangDaHuy.aspx");

                }
                if (trangTruoc == 1)
                {
                    Response.Redirect("DonHangChoDuyet.aspx");
                }
                if (trangTruoc == 2)
                {
                    Response.Redirect("DonHangThanhCong.aspx");
                }
                if (trangTruoc == 3)
                {
                    Response.Redirect("ADTrangChu.aspx");
                }
            }
        }
    }
}