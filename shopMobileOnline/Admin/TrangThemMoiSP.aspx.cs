using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class TrangThemMoiSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            //hien thi ten nguoi dung o goc tren phai
            else
            {
                this.Master.ADName = Session["id"].ToString();
                this.Master.ADName1 = Session["id"].ToString();

            }
            if (!IsPostBack)
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                //Fill data vao dropdownlist
                string sqlNSX = "SELECT * FROM NHASANXUAT";
                string sqlLoai = "SELECT * FROM LOAI";

                SqlCommand cmdNSX = new SqlCommand(sqlNSX, dataAccess.getConnection());
                SqlCommand cmdLoai = new SqlCommand(sqlLoai, dataAccess.getConnection());

                //Bind dl tu dtb vao dropdownlist
                ddlNSX.DataSource = cmdNSX.ExecuteReader();
                ddlNSX.DataTextField = "TENNSX";
                ddlNSX.DataValueField = "ID_NSX";
                ddlNSX.DataBind();

                ddlNSX.Items.Insert(0, new ListItem("---Chọn nhà sản xuất---", "-1"));

                ddlLoai.DataSource = cmdLoai.ExecuteReader();   
                ddlLoai.DataTextField = "TENLOAI";
                ddlLoai.DataValueField = "ID_LOAI";
                ddlLoai.DataBind();

                ddlLoai.Items.Insert(0, new ListItem("---Chọn loại sản phẩm---", "-1"));

                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void tmsp_btn_ThemMoi_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //khai bao path va file name de luu hinh uploaded
            string path = Server.MapPath("~/Uploads");
            string fileName = "";

            if (FileUpload1.PostedFile != null)
            {
                fileName = Path.GetFileName(FileUpload1.FileName).Trim();
            }

            //sql insert new sp
            string sql = "INSERT INTO SANPHAM(TENSP,ID_NSX,ID_LOAI,MANHINH,CAMERASAU,CAMERATRUOC,CPU,BONHO,KETNOI,PIN,HINH,SOLUONG,DONGIA,SOLUONG_DABAN,TINHTRANG) " +
                "VALUES (N'" + txtTenSP.Text.ToString().Trim() + "'," + int.Parse(ddlNSX.SelectedValue) + "," + int.Parse(ddlLoai.SelectedValue) +
                ",N'" + txtManHinh.Text.ToString().Trim() + "',N'" + txtCamSau.Text.ToString().Trim() + "',N'" + txtCamTruoc.Text.ToString().Trim() + "',N'" + txtCPU.Text.ToString().Trim() + "',N'" + txtBoNho.Text.ToString().Trim() + "',N'" + txtKetNoi.Text.ToString().Trim() + "',N'" + txtPin.Text.ToString().Trim() + "',N'" +
                fileName +
                "'," + int.Parse(txtSoLuong.Text) + "," + int.Parse(txtGia.Text) + "," + int.Parse(txtSLDaBan.Text) + "," + rblTinhTrang.SelectedValue + ")";

            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());
            try
            {
                cmd.ExecuteNonQuery();
                
                //luu hinh uploaded vao file /Uploads cua project
                if (FileUpload1.PostedFile != null)
                {
                    FileUpload1.PostedFile.SaveAs(string.Format("{0}/{1}", path, fileName));
                }

                dataAccess.DongKetNoiCSDL();
                Response.Redirect("QLSanPham.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Bạn chưa upload hình cho sản phẩm. Vui lòng thực hiện lại')</script>");
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void tmsp_btn_Huy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLSanPham.aspx");
            //Response.Write("<script>window.history.back();</script>");
        }
    }
}