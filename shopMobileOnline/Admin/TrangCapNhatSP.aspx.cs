using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class TrangCapNhatSP : System.Web.UI.Page
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
                //Lay id san pham tu duoi website
                string idSP = Request.QueryString.Get("idSP").ToString();

                //Tao nhanh connection va cac phuong thuc voi connection nho class DataAccess
                DataAccess dataAccess = new DataAccess();

                //sql doc du lieu tu dtb
                string sqlSP = "SELECT [SANPHAM].ID_SP, [SANPHAM].ID_NSX, [SANPHAM].ID_LOAI, TENNSX, TENLOAI, TENSP, MANHINH, CAMERASAU, CAMERATRUOC, CPU, BONHO, KETNOI, PIN,HINH, SOLUONG, DONGIA, SOLUONG_DABAN, TINHTRANG FROM [SANPHAM], [NHASANXUAT], [LOAI] WHERE [SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI AND [SANPHAM].ID_SP = '" + idSP + "'";
                string sqlNSX = "SELECT * FROM NHASANXUAT";
                string sqlLoai = "SELECT * FROM LOAI";

                dataAccess.MoKetNoiCSDL();

                DataTable dtSP = dataAccess.LayBangDuLieu(sqlSP);

                if (dtSP != null && dtSP.Rows.Count > 0)
                {
                    //Set du lieu cho cac field html
                    txtTenSP.Text = dtSP.Rows[0]["TENSP"].ToString();

                    //Tao command de lay du lieu tu dtb
                    SqlCommand cmdNSX = new SqlCommand(sqlNSX, dataAccess.getConnection());
                    SqlCommand cmdLoai = new SqlCommand(sqlLoai, dataAccess.getConnection());

                    //ket noi link anh cho img (ImageUrl="~/Uploads/ip11.jpg") 
                    imgSP.ImageUrl = "~/Uploads/" + dtSP.Rows[0]["HINH"].ToString();

                    //Bind dl tu dtb vao dropdownlist
                    ddlNSX.DataSource = cmdNSX.ExecuteReader();
                    ddlNSX.DataTextField = "TENNSX";
                    ddlNSX.DataValueField = "ID_NSX";
                    ddlNSX.DataBind();

                    //Xet du lieu nhan vao tu QueryString
                    ddlNSX.Items.FindByValue(dtSP.Rows[0]["ID_NSX"].ToString()).Selected = true;
                    cmdNSX.Cancel();

                    //tuong tu voi ddl loai
                    ddlLoai.DataSource = cmdLoai.ExecuteReader();
                    ddlLoai.DataTextField = "TENLOAI";
                    ddlLoai.DataValueField = "ID_LOAI";
                    ddlLoai.DataBind();

                    ddlLoai.Items.FindByValue(dtSP.Rows[0]["ID_LOAI"].ToString()).Selected = true;

                    //fill text tu dtb vao cac textarea
                    txtManHinh.Text = dtSP.Rows[0]["MANHINH"].ToString();
                    txtCamSau.Text = dtSP.Rows[0]["CAMERASAU"].ToString();
                    txtCamTruoc.Text = dtSP.Rows[0]["CAMERATRUOC"].ToString();
                    txtCPU.Text = dtSP.Rows[0]["CPU"].ToString();
                    txtBoNho.Text = dtSP.Rows[0]["BONHO"].ToString();
                    txtKetNoi.Text = dtSP.Rows[0]["KETNOI"].ToString();
                    txtPin.Text = dtSP.Rows[0]["PIN"].ToString();
                    if(dtSP.Rows[0]["HINH"].ToString() != "")
                    {
                        FileUpload1.ToolTip = "Ảnh đã lưu trước đó: " + dtSP.Rows[0]["HINH"].ToString();

                    }

                    //radioList checked
                    rblTinhTrang.Items.FindByValue((dtSP.Rows[0]["TINHTRANG"].Equals(true)) ? 1 + "" : 0 + "").Selected = true;

                    txtSoLuong.Text = dtSP.Rows[0]["SOLUONG"].ToString();
                    txtGia.Text = dtSP.Rows[0]["DONGIA"].ToString();
                    txtSLDaBan.Text = dtSP.Rows[0]["SOLUONG_DABAN"].ToString();
                }

                //dong connection
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void cnsp_btn_CapNhap_Click(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            //khai bao path va file name de luu hinh uploaded
            string path = Server.MapPath("~/Uploads");
            string fileName = "";

            if (FileUpload1.PostedFile != null)
            {
                fileName = Path.GetFileName(FileUpload1.FileName);
            }

            //sql cap nhat dl
            SqlCommand cmd = new SqlCommand();

            //check nguoi dung co cap nhat anh moi khong
            string imgSql = (fileName.Trim() != "") ? "HINH = N'" + fileName.Trim() + "'," : "";

            cmd.CommandText = "UPDATE SANPHAM " +
                "SET TENSP = N'" + txtTenSP.Text.Trim() + "'," +
                "ID_NSX = " + int.Parse(ddlNSX.SelectedValue) + "," +
                "ID_LOAI = " + int.Parse(ddlLoai.SelectedValue) + "," +
                "MANHINH = N'" + txtManHinh.Text.Trim() + "'," +
                "CAMERASAU = N'" + txtCamSau.Text.Trim() + "'," +
                "CAMERATRUOC = N'" + txtCamTruoc.Text.Trim() + "'," +
                "CPU = N'" + txtCPU.Text.Trim() + "'," +
                "BONHO = N'" + txtBoNho.Text.Trim() + "'," +
                "KETNOI = N'" + txtKetNoi.Text.Trim() + "'," +
                "PIN = N'" + txtPin.Text.Trim() + "'," +
                imgSql +
                "SOLUONG = " + int.Parse(txtSoLuong.Text) + "," +
                "DONGIA = " + int.Parse(txtGia.Text) + "," +
                "SOLUONG_DABAN = '" + int.Parse(txtSLDaBan.Text) + "'," +
                "TINHTRANG = " + rblTinhTrang.SelectedValue + " " +
                "WHERE ID_SP = " + int.Parse(idSP);
            
            cmd.Connection = dataAccess.getConnection();

            try
            {
                cmd.ExecuteNonQuery();

                //luu hinh uploaded vao file /Uploads cua project
                if (FileUpload1.PostedFile != null && fileName.Trim() != "")
                {
                    FileUpload1.PostedFile.SaveAs(string.Format("{0}/{1}", path, fileName));
                }

                dataAccess.DongKetNoiCSDL();
                Response.Redirect("QLSanPham.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Đã xảy ra lỗi. Vui lòng thực hiện lại')</script>");
                dataAccess.DongKetNoiCSDL();
            }
         }

        protected void cnsp_btn_Huy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLSanPham.aspx");
        }
    }
}