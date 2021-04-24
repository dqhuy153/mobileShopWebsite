using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.KH
{
    public partial class ThemGioHangThanhCong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP");
            string slSP = Request.QueryString.Get("sl");

            if (!Page.IsPostBack)
            {

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                string sqlAll = "SELECT ID_SP, ID_NSX, ID_LOAI, TENSP, HINH, SOLUONG, DONGIA, CAST(DONGIA*1.15 AS INT) AS GIAGOC, CAST(DONGIA*0.4 AS INT) AS GIATRATRUOC FROM SANPHAM WHERE TINHTRANG = 1 AND SOLUONG > 0";

                DataTable dtAll = dataAccess.LayBangDuLieu(sqlAll);

                if (dtAll != null && dtAll.Rows.Count > 0)
                {
                    this.rptItem.DataSource = dtAll;
                    this.rptItem.DataBind();
                }

                //mo ket noi du lieu (goi class DataAccess, xem file dataAccess de hieu, cai nay giong java)
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoServerCaching();
                HttpContext.Current.Response.Cache.SetNoStore();


                //viet cau lenh sql de lay thong tin san pham
                string sql = "SELECT * FROM SANPHAM S, LOAI L, NHASANXUAT N WHERE ID_SP =" + idSP + " AND S.ID_LOAI = L.ID_LOAI AND S.ID_NSX = N.ID_NSX";

                //luu du lieu da goi vao data table
                DataTable dt = dataAccess.LayBangDuLieu(sql);

                //dat du lieu cho cac lable da tao o trang aspx

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
                if (!String.IsNullOrEmpty(Request.QueryString["action"]))
                {
                    if (Request.QueryString["action"] == "add")
                    {
                        
                        int soLuongConLai = int.Parse(dt.Rows[0]["SOLUONG"].ToString());
                        int soLuongDatHang = int.Parse(slSP);


                        if (soLuongDatHang > soLuongConLai)
                        {
                            Response.Write($"<script>alert(\"Bạn chỉ được phép đặt {soLuongConLai} sản phẩm\")</script>");
                        }
                        else
                        {
                            bool isExisted = false;
                            foreach (DataRow dr in cart.Rows)
                            {
                                if (dr["ID"].ToString() == idSP)
                                {
                                    dr["SoLuong"] = int.Parse(dr["SoLuong"].ToString()) + soLuongDatHang;
                                    isExisted = true;
                                    break;
                                }
                            }
                            if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                            {
                                DataRow dr = cart.NewRow();
                                dr["ID"] = dt.Rows[0]["ID_SP"].ToString();
                                dr["Hinh"] = dt.Rows[0]["HINH"].ToString();
                                dr["Ten"] = dt.Rows[0]["TENSP"].ToString();
                                dr["Gia"] = int.Parse(dt.Rows[0]["DONGIA"].ToString());
                                dr["SoLuong"] = soLuongDatHang;
                                cart.Rows.Add(dr);
                            }
                            //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                            Session["cart"] = cart;
                        }
                    }

                    //dong ket noi
                    dataAccess.DongKetNoiCSDL();
                }
            }
        }
    }
}