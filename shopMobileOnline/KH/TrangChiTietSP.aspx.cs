using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.admin
{
    public partial class TrangChiTietSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP");

            if (!Page.IsPostBack)
            {
                //mo ket noi du lieu (goi class DataAccess, xem file dataAccess de hieu, cai nay giong java)
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoServerCaching();
                HttpContext.Current.Response.Cache.SetNoStore();
                
                //set text cho binh luan neu co cookie
                if (Request.Cookies["BL" + idSP] != null)
                {
                    string a = Request.Cookies["BL" + idSP].Value.ToString();
                    txtBL.Text = Request.Cookies["BL" + idSP].Value.ToString();
                }

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                //viet cau lenh sql de lay thong tin san pham
                string sql = "SELECT * FROM SANPHAM S, LOAI L, NHASANXUAT N WHERE ID_SP =" + idSP + " AND S.ID_LOAI = L.ID_LOAI AND S.ID_NSX = N.ID_NSX";

                //luu du lieu da goi vao data table
                DataTable dt = dataAccess.LayBangDuLieu(sql);

                //dat du lieu cho cac lable da tao o trang aspx
                lbTenSP.Text = dt.Rows[0]["TENSP"].ToString();
                lbTen1.Text = dt.Rows[0]["TENSP"].ToString();
                lbNSX.Text = dt.Rows[0]["TENNSX"].ToString();
                lbLoai.Text = dt.Rows[0]["TENLOAI"].ToString();
                lbSL.Text = dt.Rows[0]["SOLUONG"].ToString();
                lbGia.Text = String.Format("{0:N0}", dt.Rows[0]["DONGIA"]) + " VND";
                lbManHinh.Text = dt.Rows[0]["MANHINH"].ToString();
                lbCamSau.Text = dt.Rows[0]["CAMERASAU"].ToString();
                lbCamTruoc.Text = dt.Rows[0]["CAMERATRUOC"].ToString();
                lbCPU.Text = dt.Rows[0]["CPU"].ToString();
                lbBoNho.Text = dt.Rows[0]["BONHO"].ToString();
                lbKetNoi.Text = dt.Rows[0]["KETNOI"].ToString();
                lbPin.Text = dt.Rows[0]["PIN"].ToString();

                imgSP.ImageUrl = "~/Uploads/" + dt.Rows[0]["HINH"].ToString();

                //hien thi danh gia
                this.updateUIDanhGia();

                //hien thi binh luan
                this.updateUIComment();

                DataTable cart = new DataTable();
                if (Session["cart"] == null)
                {
                    //Nếu chưa có giỏ hàng, tạo giỏ hàng thông qua DataTable với 4 cột chính
                    cart.Columns.Add("ID");
                    cart.Columns.Add("Hinh");
                    cart.Columns.Add("Ten");
                    cart.Columns.Add("Gia");
                    cart.Columns.Add("SoLuong");

                    //Sau khi tạo xong thì lưu lại vào session
                    Session["cart"] = cart;
                }
                else
                {
                    //Lấy thông tin giỏ hàng từ Session["cart"]
                    cart = Session["cart"] as DataTable;
                }    
            }
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            //Khi click vao thi san pham se duoc them vao trang gio hang
            string idSP = Request.QueryString.Get("idSP");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT * FROM SANPHAM WHERE ID_SP = " + idSP;

            DataTable dt = dataAccess.LayBangDuLieu(sql);
            int soLuongConLai = int.Parse(dt.Rows[0]["SOLUONG"].ToString());

            if (int.Parse(txtSL.Text) > soLuongConLai)
            {
                Response.Write($"<script>alert(\"Bạn chỉ được phép đặt {soLuongConLai} sản phẩm\")</script>");
            }
            else
            {
                Response.Redirect("ThemGioHangThanhCong.aspx?action=add&idSP="+idSP+"&sl="+txtSL.Text);
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            //Khi click vao thi san pham se duoc luu vao bang LUU
        }
        protected void lbtnBL_Click(object sender, EventArgs e)
        {
            //neu kh chua dang nhap thi chuyen den trang dang nhap va giu lai cmt truoc
            if (Session["userKH"] == null)
            {
                Response.Cookies["BL" + Request.QueryString.Get("idSP")].Value = txtBL.Text;
                Response.Cookies["BL" + Request.QueryString.Get("idSP")].Expires = DateTime.Now.AddMinutes(15);
                Response.Redirect("KHDangNhap.aspx?idSP="+ Request.QueryString.Get("idSP"));

            }
            else
            {
                if (String.IsNullOrEmpty(txtBL.Text))
                {
                    Response.Write("<script>alert(\"Bạn chưa nhập bình luận\")</script>");
                }
                else
                {
                    string userKH = Session["userKH"].ToString();
                    if (Request.QueryString.Get("idSP") != null)
                    {
                        string idSP = Request.QueryString.Get("idSP");
                        DataAccess dataAccess = new DataAccess();
                        dataAccess.MoKetNoiCSDL();

                        SqlCommand cmd = new SqlCommand("INSERT_BL", dataAccess.getConnection());
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ID_SP", int.Parse(idSP));
                        cmd.Parameters.AddWithValue("@TENDANGNHAP", userKH);
                        cmd.Parameters.AddWithValue("@NOIDUNG", txtBL.Text);

                        cmd.ExecuteNonQuery();

                        //update ui: hien thi binh luan
                        this.updateUIComment();
                    }
                }
            }
        }
        protected void lbtnTL_Click(object sender, EventArgs e)
        {
            LinkButton lbtnTL = (LinkButton)sender;

            RepeaterItem ritem = (RepeaterItem)lbtnTL.NamingContainer;

            Label lbID_BL = (Label)ritem.FindControl("lbIDBL");
            TextBox txtTL = (TextBox)ritem.FindControl("txtTL");

            string id_BL = lbID_BL.Text;

            //neu kh chua dang nhap thi chuyen den trang dang nhap va giu lai cmt truoc
            if (Session["userKH"] == null)
            {
                Response.Cookies["TL" + Request.QueryString.Get("idSP")].Value = txtTL.Text;
                Response.Cookies["TL" + Request.QueryString.Get("idSP")].Expires = DateTime.Now.AddMinutes(15);
                Response.Redirect("KHDangNhap.aspx?idSP=" + Request.QueryString.Get("idSP"));

            }
            else
            {
                if (String.IsNullOrEmpty(txtTL.Text))
                {
                    Response.Write("<script>alert(\"Bạn chưa nhập bình luận\")</script>");
                }
                else
                {
                    string userKH = Session["userKH"].ToString();
                    if (Request.QueryString.Get("idSP") != null)
                    {
                        string idSP = Request.QueryString.Get("idSP");
                        DataAccess dataAccess = new DataAccess();
                        dataAccess.MoKetNoiCSDL();

                        SqlCommand cmd = new SqlCommand("INSERT_TLBL", dataAccess.getConnection());
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ID_BL", int.Parse(id_BL));
                        cmd.Parameters.AddWithValue("@TENDANGNHAP", userKH);
                        cmd.Parameters.AddWithValue("@NOIDUNG", txtTL.Text);

                        cmd.ExecuteNonQuery();

                        //update ui: hien thi binh luan
                        this.updateUIComment();
                    }
                }
            }
        }
        protected void lbtnXoaDG_Click(object sender, EventArgs e)
        {
            if (Session["userKH"] != null && Request.QueryString.Get("idSP") != null)
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();
                //Lay id binh luan
                LinkButton lbtnXoaDG = (LinkButton)sender;
                RepeaterItem ritem = (RepeaterItem)lbtnXoaDG.NamingContainer;

                Label lbIDDG = (Label)ritem.FindControl("lbIDDG");
                string idDG = lbIDDG.Text;

                string sqlXoaDG = "DELETE FROM DANHGIA WHERE ID_DANHGIA = " + idDG;
                SqlCommand cmd = new SqlCommand(sqlXoaDG, dataAccess.getConnection());

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                this.updateUIDanhGia();
            }

        }
        protected void lbtnXoaBL_Click(object sender, EventArgs e)
        {
            if (Session["userKH"] != null && Request.QueryString.Get("idSP") != null)
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();
                //Lay id binh luan
                LinkButton lbtnBL = (LinkButton)sender;
                RepeaterItem ritem = (RepeaterItem)lbtnBL.NamingContainer;

                Label lbIDBL = (Label)ritem.FindControl("lbIDBL");
                string idBL = lbIDBL.Text;

                string sqlXoaBL = "DELETE FROM BINHLUAN WHERE ID_BL = " + idBL;
                SqlCommand cmd = new SqlCommand(sqlXoaBL, dataAccess.getConnection());

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                this.updateUIComment();
            }
            
        }
        protected void lbtnXoaTL_Click(object sender, EventArgs e)
        {
            if (Session["userKH"] != null && Request.QueryString.Get("idSP") != null)
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();
                //Lay id binh luan
                LinkButton lbtnTL = (LinkButton)sender;
                RepeaterItem ritem = (RepeaterItem)lbtnTL.NamingContainer;

                Label lbIDTL = (Label)ritem.FindControl("lbIDTL");
                string idTL = lbIDTL.Text;

                string sqlXoaTL = "DELETE FROM TLBINHLUAN WHERE ID_TL = " + idTL;
                SqlCommand cmd = new SqlCommand(sqlXoaTL, dataAccess.getConnection());

                cmd.ExecuteNonQuery();

                dataAccess.DongKetNoiCSDL();
                this.updateUIComment();
            }
        }
        public void updateUIDanhGia()
        {
            string idSP = Request.QueryString.Get("idSP");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlDanhGia = "SELECT ID_DANHGIA, SAO, HINH,  CONVERT(VARCHAR(10), NGAYDG, 103) AS NGAYDG, NOIDUNG, CASE WHEN HOTEN = NULL THEN TENDANGNHAP ELSE HOTEN END AS TENKH FROM DANHGIA D, TAIKHOAN T WHERE D.ID_TK = T.ID_TK AND ID_SP =" + idSP;

            DataTable dtDanhGia = dataAccess.LayBangDuLieu(sqlDanhGia);

            rptDanhGia.DataSource = dtDanhGia;
            rptDanhGia.DataBind();

            foreach (DataRow dr in dtDanhGia.Rows)
            {

                //check danh gia co hinh ko
                bool isCheck = false;
                foreach (RepeaterItem ritem in rptDanhGia.Items)
                {
                    if (!isCheck)
                    {
                        Image imgDG = (Image)ritem.FindControl("imgDG");


                        if (dr["HINH"] != null && dr["HINH"].ToString().Trim() != "")
                        {
                            imgDG.ImageUrl = "~/Uploads/" + dr["HINH"].ToString();
                            isCheck = true;
                            break;
                        }
                    }
                    else
                    {
                        continue;
                    }
                }

                //check id cho binh luan va hien thi nut xoa binh luan cho user dang dang nhap
                foreach (RepeaterItem ritemDG in rptDanhGia.Items)
                {
                    Label lbIDDG = (Label)ritemDG.FindControl("lbIDDG");
                    LinkButton lbtnXoaDG = (LinkButton)ritemDG.FindControl("lbtnXoaDG");

                    string idDG = dr["ID_DANHGIA"].ToString();

                    if (!String.IsNullOrEmpty(lbIDDG.Text))
                    {
                        continue;
                    }
                    else
                    {
                        //LinkButton lbtnDG
                        lbIDDG.Text = dr["ID_DANHGIA"].ToString();

                        if (Session["userKH"] != null && Request.QueryString.Get("idSP") != null)
                        {
                            string userKH = Session["userKH"].ToString();
                            string sqlCheckKH_DG = "SELECT * FROM DANHGIA DG, TAIKHOAN TK WHERE DG.ID_TK = TK.ID_TK AND TENDANGNHAP = N'" + userKH + "' AND ID_DANHGIA = " + idDG;

                            DataTable dtKH_DG = dataAccess.LayBangDuLieu(sqlCheckKH_DG);
                            if (dtKH_DG.Rows.Count > 0)
                            {
                                lbtnXoaDG.Style.Add("display", "block");
                            }
                        }

                        break;
                    }

                }
            }
        }

        public void updateUIComment()
        {
            string idSP = Request.QueryString.Get("idSP");

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlBL = "SELECT ID_BL, NOIDUNG, CONVERT(VARCHAR(10), NGAYBL, 103) AS NGAYBL, CASE WHEN HOTEN = NULL THEN TENDANGNHAP ELSE HOTEN END AS TENKH FROM BINHLUAN B, TAIKHOAN T WHERE B.ID_TK = T.ID_TK AND ID_SP = " + idSP;
            DataTable dtBL = dataAccess.LayBangDuLieu(sqlBL);

            rptBinhLuan.DataSource = dtBL;
            rptBinhLuan.DataBind();

            dataAccess.DongKetNoiCSDL();

            //hien thi binh luan
            foreach (DataRow dr in dtBL.Rows)
            {
                foreach (RepeaterItem item in rptBinhLuan.Items)
                {
                    Label lbIDBL = (Label)item.FindControl("lbIDBL");
                    LinkButton lbtnXoaBL = (LinkButton)item.FindControl("lbtnXoaBL");

                    string idBL = dr["ID_BL"].ToString();
              
                    if (!String.IsNullOrEmpty(lbIDBL.Text))
                    {
                        continue;
                    }
                    else
                    {
                        //LinkButton lbtnBL
                        lbIDBL.Text = dr["ID_BL"].ToString();

                        //hien thi tra loi binh luan cua tung binh luan
                        string sqlTL = "SELECT ID_TL, TL.NOIDUNG, CONVERT(VARCHAR(10), NGAYTL, 103) AS NGAYTL, CASE WHEN HOTEN = NULL THEN TENDANGNHAP ELSE HOTEN END AS TENKH FROM BINHLUAN B, TLBINHLUAN TL, TAIKHOAN T WHERE B.ID_BL = TL.ID_BL AND TL.ID_TK = T.ID_TK AND ID_SP = '" + idSP + "' AND B.ID_BL = '" + dr["ID_BL"].ToString() + "'";
                        DataTable dtTL = dataAccess.LayBangDuLieu(sqlTL);

                        if (dtTL != null && dtTL.Rows.Count > 0)
                        {
                            Repeater rptTraLoi = (Repeater)item.FindControl("rptTraLoi");
                            rptTraLoi.DataSource = dtTL;
                            rptTraLoi.DataBind();

                            foreach (DataRow drTL in dtTL.Rows)
                            {
                                foreach (RepeaterItem ritemTL in rptTraLoi.Items)
                                {
                                    Label lbIDTL = (Label)ritemTL.FindControl("lbIDTL");
                                    LinkButton lbtnXoaTL = (LinkButton)ritemTL.FindControl("lbtnXoaTL");

                                    string idTL = drTL["ID_TL"].ToString();

                                    if (!String.IsNullOrEmpty(lbIDTL.Text))
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        //LinkButton lbtnTL
                                        lbIDTL.Text = drTL["ID_TL"].ToString();

                                        if (Session["userKH"] != null && Request.QueryString.Get("idSP") != null)
                                        {
                                            string userKH = Session["userKH"].ToString();
                                            string sqlCheckKH_TL = "SELECT * FROM TLBINHLUAN TL, TAIKHOAN TK WHERE TL.ID_TK = TK.ID_TK AND TENDANGNHAP = N'" + userKH + "' AND ID_TL = " + idTL;

                                            DataTable dtKH_TL = dataAccess.LayBangDuLieu(sqlCheckKH_TL);
                                            if (dtKH_TL.Rows.Count > 0)
                                            {
                                                lbtnXoaTL.Style.Add("display", "block");
                                            }
                                        }

                                        break;
                                    }
                                    
                                }
                            }
                            
                        }
                        //Hien thi nut xoa comment cho cac comment cua user dang nhap hien tai 
                        if (Session["userKH"] != null && Request.QueryString.Get("idSP") != null)
                        {
                            string userKH = Session["userKH"].ToString();
                            string sqlCheckKH_BL = "SELECT * FROM BINHLUAN B, TAIKHOAN T WHERE B.ID_TK = T.ID_TK AND TENDANGNHAP = N'" + userKH + "' AND ID_BL = " + idBL;

                            DataTable dtKH_BL = dataAccess.LayBangDuLieu(sqlCheckKH_BL);
                            if (dtKH_BL.Rows.Count > 0)
                            {
                                lbtnXoaBL.Style.Add("display", "block");
                            }
                        }

                        break;

                    }
                }
                dataAccess.DongKetNoiCSDL();

            }
        }
    }
}
