<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="KHTrangChu.aspx.cs" Inherits="shopMobileOnline.admin.TrangDanhSachSP" %>
<%@ MasterType VirtualPath="~/KH/MasterPageKH.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .banner {
            width: 100%;
            z-index: 1;
            height: 80vh;
            position: relative;
            color: white;
            overflow: hidden;
        }
        a:hover{
            text-decoration: none;
        }
        @keyframes zoom {
            from {
                transform: scale(1.5);
            }

            to {
                transform: scale(1);
            }
        }

        .banner img {
            position: absolute;
            z-index: 1;
            width: 100%;
            animation: zoom 10s forwards;
            transition: 3.5s;
            
        }
        .trangchu-desc {
            padding: 50px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .trangchu-desc ul {
            display: flex;
            width: 70%;
            min-width: 500px;
            justify-content: space-between;
            margin-top: 50px
        }
        .trangchu-desc ul li {
            display: flex;
            align-items: center;
            width: 22%;
            border: 1px solid #c7c7c7;
            border-radius: 5px;
            padding: 15px;
        }
        .trangchu-desc ul li i {
            font-size: 30px;
            margin-right: 20px;
        }
            .trangchu-desc ul li p {
                font-size: 14px;
                margin: 0;
            }

        .listsp-container {
            padding-top: 35px;
            
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        h4 {
            text-align: center;
            margin-bottom: 50px;
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
        #btn-xemThem {
            margin: 35px auto;
            text-align: center;
            border: none;
            background: #102a80;
            padding: 10px 20px;
            color: white;
            border-radius: 5px;
            
        }
        #btn-xemThem:hover {
            background: #0f58c4;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner">
            
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ipbanner.jpg" />
        </div>
    <section class ="trangchu-desc">
        <h4>Vì sao nên mua hàng tại DTH Store </h4>
        <ul class="trangchu-desc-content">
            <li>
                <i class="fab fa-apple"></i>
                <p>Hàng chính hãng bảo hành 1 đổi 1</p>
            </li>
            <li>
                <i class="fas fa-sticky-note"></i>
                <p>Hàng hóa luôn nhiều. Cam kết chất lượng</p>
            </li>
            <li>
                <i class="fas fa-piggy-bank"></i>
                <p>Dễ dàng mua sắm. Trả góp 0%. Trả trước 0đ</p>
            </li>
            <li>
                <i class="fas fa-shipping-fast"></i>
                <p>Miễn phí giao hàng toàn quốc. Giao nhanh trong 2h</p>
            </li>
        </ul>
    </section>

    <div class="listsp-container">
     <h4>DANH SÁCH SẢN PHẨM</h4>
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
        <button id="btn-xemThem">Xem thêm</button>

    </div>
</asp:Content>
