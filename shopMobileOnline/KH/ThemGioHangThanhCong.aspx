<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="ThemGioHangThanhCong.aspx.cs" Inherits="shopMobileOnline.KH.ThemGioHangThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a:hover{
            text-decoration: none;
        }
        .listsp-container {
            padding-top: 35px;
            
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .lbThongBao {
            color: #0f58c4;
            font-size: 30px;
            margin: 50px auto;
            display: block;
        }
        h4 {
            text-align: center;
            margin-bottom: 50px;
         }
        .tenNSX{
            text-align: center;
            font-size: 25px;
            text-transform: uppercase;
        }
        .listsp-items {
            display: flex;
            flex-wrap: wrap;
            width: 88%;
            margin: 0 auto;
            justify-content: flex-start;
        }
        .listsp-item {
            width: 25%;
            padding: 30px;
            border: 1px solid #ececec;
            }
        .listsp-item a {
            cursor: pointer;
        }

        .listsp-item:hover img {
            transform: scale(1.1);
            transition: all 0.2s ease-in;
        }

        .listsp-item img {
            height: 250px;
            width: 100%;
            object-fit: cover;
            margin: 15px 0;
        }
        .item-ten {
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 20px;
        }
        .listsp-gia-container {
            display: flex;
            justify-content: space-between
        }
        .item-gia {
            font-size: 18px;
            font-weight: bold;
            color: tomato;
            
        }
        .item-giaGoc{
            font-style: oblique;
            text-decoration: line-through;
            font-size: 14px;
        }
        .item-traTruoc-label {
            background: #dedede;
            padding: 6px 10px;
            font-size: 12px;
            border-radius: 5px;
            font-weight: 500;
            margin-bottom: 7px;
        }
        .item-traTruoc {
            font-size: 16px;
            font-weight: bold;
            color: tomato;
            text-align: center;
        }
        .label-thongtins {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .listsp-item .label-thongtin {
            background: #e77f67;
            padding: 6px 10px;
            font-size: 11px;
            border-radius: 5px;
            font-weight: 500;
            margin-bottom: 7px;
            width: 48%;
            color: white;
            text-align:center;
        }
        .listsp-item .label-thongtin:last-child {
            background: #2f3542
        }
        .btnXemThem {
            margin: 35px auto;
            text-align: center;
            border: none;
            background: #102a80;
            padding: 10px 20px;
            color: white;
            border-radius: 5px;
            
        }
        .btnXemThem:hover {
            background: #0f58c4;
            text-decoration: none;
            color: white;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="listsp-container">
     <h4><b><asp:Label ID="lbThongBao" runat="server" Text="Thêm giỏ hàng thành công!" CssClass="lbThongBao"></asp:Label></b></h4>
     <h4><b style="color: #8c8c8c">Xem thêm sản phẩm khác</b></h4>

    <div class="listsp-items">
        <asp:Repeater ID="rptItem" runat="server">
            <ItemTemplate>
                <div class="listsp-item">
                    <a href="TrangChiTietSP.aspx?idSP=<%# Eval("ID_SP") %>">
                        <img alt="phone-img" src="../Uploads/<%# Eval("HINH") %>" class="listsp-img" />
                        <p class="item-ten">
                         <%# Eval("TENSP") %>
                        </p>
                    </a>
                    <div class="listsp-gia-container">
                        <div>
                            <p class="item-gia">
                                 <%# Eval("DONGIA","{0:n0}") %> <span style="font-size: 16px">&#8363;</span>
                            </p>
                            <p class="item-giaGoc">
                                <%# Eval("GIAGOC","{0:n0}") %> &#8363;
                            </p>

                        </div>
                        <div>
                            <p class="item-traTruoc-label">Hoặc trả trước</p>
                            <p class="item-traTruoc">
                                <%# Eval("GIATRATRUOC","{0:n0}") %> &#8363;

                            </p>
                        </div>
                    </div>
                    <div class="label-thongtins">
                        <p class="label-thongtin">Bảo hành 1 đổi 1</p>
                        <p class="label-thongtin">Trả góp 0% Lãi suất</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
        <!--<a id="btn-xemThem" href="TrangSPTheoNSX.aspx">Xem tất cả sản phẩm</a>-->
         <asp:HyperLink ID="btnXemThem" runat="server" NavigateUrl="~/KH/TrangSPTheoNSX.aspx" CssClass="btnXemThem">Xem tất cả sản phẩm</asp:HyperLink>
         </div>
</asp:Content>
