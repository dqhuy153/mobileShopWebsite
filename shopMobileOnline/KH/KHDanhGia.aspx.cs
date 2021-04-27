using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class KHDanhGia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["userKH"] == null)
            {
                Response.Redirect("KHDangNhap.aspx");
            }

            string idSP = Request.QueryString.Get("idSP").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT TENSP, HINH FROM SANPHAM S, LOAI L, NHASANXUAT N WHERE ID_SP =" + idSP;

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            lbTenSP.Text = dt.Rows[0]["TENSP"].ToString();
          

            imgSP.ImageUrl = "~/Uploads/" + dt.Rows[0]["HINH"].ToString();

            dataAccess.DongKetNoiCSDL();
        }

        protected void btnDanhGia_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtSao.Value))
            {
                Response.Write("<script>alert(\"Bạn phải đánh giá số sao cho sản phẩm!\")</script>");
            }
            else
            {
                if (Request.QueryString.Get("idSP") != null && Session["userKH"] != null)
                {
                    string idSP = Request.QueryString.Get("idSP").ToString();
                    string userKH = Session["userKH"].ToString();

                    DataAccess dataAccess = new DataAccess();
                    dataAccess.MoKetNoiCSDL();

                    string path = Server.MapPath("~/Uploads");
                    string fileName = "";

                    if (FileUploadHinh.PostedFile != null)
                    {
                        fileName = Path.GetFileName(FileUploadHinh.FileName).Trim();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT_DANHGIA", dataAccess.getConnection());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID_SP", int.Parse(idSP));
                    cmd.Parameters.AddWithValue("@TENDANGNHAP", userKH);
                    cmd.Parameters.AddWithValue("@NOIDUNG", txtDanhGia.Text);
                    cmd.Parameters.AddWithValue("@SAO", int.Parse(txtSao.Value));
                    cmd.Parameters.AddWithValue("@HINH", fileName);

                    cmd.ExecuteNonQuery();

                    dataAccess.DongKetNoiCSDL();

                    if(FileUploadHinh.PostedFile != null && fileName != "")
                    {
                        FileUploadHinh.PostedFile.SaveAs(string.Format("{0}/{1}", path, fileName));
                    }

                    Response.Redirect("TrangChiTietSP.aspx?idSP="+idSP);
                }
            }
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("DonHang.aspx");
        }
    }
}