using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.admin
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoServerCaching();
                HttpContext.Current.Response.Cache.SetNoStore();
                //neu co san pham trong gio hang
                if (Session["cart"] != null)
                {

                    //an trang gio hang trong
                    pnGioHangTrong.Style.Add("display", "none");
                    
            
                    DataTable cart = Session["cart"] as DataTable;

                    //du lieu KH
                    //neu kh da dang nhap
                    if (Session["userKH"] != null)
                    {
                        //hien thi nut mua hang neu kh da dang nhap, an nut login
                        //trMua.Style.Add("display", "none");
                        hlLogin.Style.Add("display", "none");

                        string usernameKH = Session["userKH"].ToString();
           

                        DataAccess dataAccess = new DataAccess();
                        dataAccess.MoKetNoiCSDL();

                        string sql = "SELECT * FROM TAIKHOAN, LOAITK WHERE TAIKHOAN.ID_LOAITK = LOAITK.ID_LOAITK AND TENDANGNHAP = N'" + usernameKH + "'";
                        DataTable dt = dataAccess.LayBangDuLieu(sql);

                        if (dt != null && dt.Rows.Count > 0)
                        {
                            txtTen.Text = dt.Rows[0]["HOTEN"].ToString();
                            //txtMatKhauCu.Text = dt.Rows[0]["MATKHAU"].ToString();
                            txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                            txtDiaChi.Text = dt.Rows[0]["DIACHI"].ToString();
                            txtSDT.Text = dt.Rows[0]["SDT"].ToString();
                        }

                        if (cart != null && cart.Rows.Count > 0)
                        {
                            this.rptSP.DataSource = cart;
                            this.rptSP.DataBind();

                            int tongTien = 0;

                            StringBuilder sb = new StringBuilder();

                            foreach (DataRow dr in cart.Rows)
                            {
                                foreach (RepeaterItem item in rptSP.Items)
                                {
                                    Label lbSL = (Label)item.FindControl("lbSL");
                                    if (!String.IsNullOrEmpty(lbSL.Text))
                                    {
                                        break;
                                    }
                                    else
                                    {
                                        lbSL.Text = "x " + dr["SoLuong"].ToString();

                                    }
                                }

                                tongTien += (int.Parse(dr["Gia"].ToString()) * int.Parse(dr["SoLuong"].ToString()));

                            }

                            lblTamTinh.Text = String.Format("{0:n0}", int.Parse(tongTien.ToString()));
                            lblTong.Text = String.Format("{0:n0}", int.Parse(tongTien.ToString()));
                            lbTong1.Text = String.Format("{0:n0}", int.Parse(tongTien.ToString()));


                            //Ket noi string html vao trang asp
                           
                        }

                    }
                    else
                    {
                        //lbThongBao.Text = "Bạn phải đăng nhập để tiến hành thanh toán";
                        trTT.Style.Add("display", "none");
                        trTong.Style.Add("display", "none");
                        btnMua.Style.Add("display", "none");

                        if (cart != null && cart.Rows.Count > 0)
                        {
                            this.rptSP.DataSource = cart;
                            this.rptSP.DataBind();

                            
                            int tongTien = 0;

                            foreach (DataRow dr in cart.Rows)
                            {

                                foreach (RepeaterItem item in rptSP.Items)
                                {
                                    Label lbSL = (Label)item.FindControl("lbSL");
                                    if (!String.IsNullOrEmpty(lbSL.Text))
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        lbSL.Text = "x " + dr["SoLuong"].ToString();
                                        break;
                                    }
                                }

                                tongTien += (int.Parse(dr["Gia"].ToString()) * int.Parse(dr["SoLuong"].ToString()));
                                
                                    
                                
                            }

                            lblTamTinh.Text = String.Format("{0:n0}", int.Parse(tongTien.ToString())); 
                            lblTong.Text = String.Format("{0:n0}", int.Parse(tongTien.ToString()));

                            //Ket noi string html vao trang asp
                            
                        }
                    }


                }
                else //neu ko co san pham trong gio hang
                {
                    //an trang gio hang
                    pnGioHang.Style.Add("display", "none");
                    
                }
            }
        }

        protected void btnMua_Click(object sender, EventArgs e)
        {
            if (Session["userKH"] != null)
            {
                string userKH = Session["userKH"].ToString();

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sqlKH = "SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = N'" + userKH + "'";
                DataTable dtKH = dataAccess.LayBangDuLieu(sqlKH);

                SqlCommand cmdDonHang = new SqlCommand("INSERT_DONHANG", dataAccess.getConnection());

                cmdDonHang.CommandType = CommandType.StoredProcedure;
                
                cmdDonHang.Parameters.AddWithValue("@ID_TK", int.Parse(dtKH.Rows[0]["ID_TK"].ToString()));
                cmdDonHang.Parameters.AddWithValue("@DIACHI", txtDiaChi.Text);
                cmdDonHang.Parameters.AddWithValue("@SDT", txtSDT.Text);
                cmdDonHang.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                cmdDonHang.Parameters.AddWithValue("@THONGTIN_CHITIET", "Thông tin dự phòng: Họ tên: "+ dtKH.Rows[0]["HOTEN"].ToString() + ", Dia chi: " + dtKH.Rows[0]["DIACHI"].ToString() +", SDT: " + dtKH.Rows[0]["SDT"].ToString() + ", Email: " + dtKH.Rows[0]["EMAIL"].ToString());

                cmdDonHang.ExecuteNonQuery();

                if (Session["cart"] != null)
                {
                    //an trang gio hang trong
                    DataTable cart = Session["cart"] as DataTable;

                    

                    if(cart != null && cart.Rows.Count > 0)
                    {
                        foreach(DataRow dr in cart.Rows)
                        {
                            using (SqlCommand cmdCTDonHang = new SqlCommand("INSERT_CTDONHANG_THEODH"))
                            {
                                cmdCTDonHang.CommandType = CommandType.StoredProcedure;
                                cmdCTDonHang.Parameters.AddWithValue("@ID_SP", dr["ID"]);
                                cmdCTDonHang.Parameters.AddWithValue("@SOLUONG", dr["SoLuong"]);
                                cmdCTDonHang.Parameters.AddWithValue("@DONGIA", dr["Gia"]);

                                cmdCTDonHang.Connection = dataAccess.getConnection();
                                
                                if (dataAccess.getConnection().State == ConnectionState.Closed)
                                    dataAccess.getConnection().Open();
                                cmdCTDonHang.ExecuteNonQuery();

                                dataAccess.DongKetNoiCSDL();
                            }
                            
                        }
                    }
                 }

                Response.Redirect("DonHang.aspx");
            }
            
        }

        protected void btnXoaItem_Click(object sender, EventArgs e)
        {

        }
    }
}