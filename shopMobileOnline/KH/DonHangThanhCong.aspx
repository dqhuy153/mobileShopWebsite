<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="DonHangThanhCong.aspx.cs" Inherits="shopMobileOnline.KH.DonHangThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a:hover{
            text-decoration: none;
        }
        .Giohang {
            display: block;
            width: 100%;
            height: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .head-text {
            width: 630px;
            padding-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .text {
            width: 100%;
            display: flex;
            justify-content: space-between;
        }

        .back {
            margin-right: 50px;
        }

       
        .cart {
            width: 650px;
            box-shadow: 0 0 18px rgb(0 0 0 / 12%);
            margin-top: 30px;
        }

        .table {
            width: 620px;
            height: 800px;
        }

        .tr-item a {
            color: #333333;
        }

        .left, .left1 {
            height: auto;
            width: 500px;
            
        }
        .left a:first-child {
            display: flex;
            padding-top: 10px;
        }
        .img-sp {
            width: 80px;
            margin-right: 10px;
        }

        .btnXoa {
           
            border: none;
            cursor: pointer;
            background: none;
            font-weight: 500;
            display: block;
            margin-left: 33px;
        }

            .btnXoa i {
                color: #e77f67;
                font-size: 15px;
            }

     

        .left p {
            
            font-size: 13px;
        }

        

            .right p {
                color: #e77f67;
                margin-left: 35px;
                padding-top: 15px;
                font-size: 18px;
                text-align: center;
                font-weight: 500;
            }

            .right ul {
                display: flex;
                margin-top: 18px;
                margin-left: 30px;
            }
            .right span {
                display: block;
                float: right;
                margin-top: 10px;
                font-weight: 500;
                font-size: 14px;
                margin-right: 5px;
            }

        .left1 p, .left1 h5 {
            padding-left: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', Times, serif;
            padding-top: 15px;
        }

        .left1 h5 {
            padding-left: 30px;
            padding-top: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', Times, serif;
            color: #e77f67;
            padding-top: 17px;
            font-weight: 600;
        }


        .right1 span {
            padding-top: 10px;
            padding-left: 20px;
            display: block;
            font-size: 18px;
            font-weight: bold;
            color: tomato;
            text-align: center;
        }

            

        .right1 h5 {
            
            padding-left: 40px;
            color: #e77f67;
        }

        .text-box {
            margin-left: 20px;
        }

        .request {
            margin-left: 20px;
            padding-right: 100px;
        }

        #rq1, #rq2 {
            color: red;
        }

        #rq1 {
            margin-right: 90px
        }

        .left2 h5 {
            padding-left: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', Times, serif;
            font-weight: 600;
        }

        .right2 p {
            padding-top: 0px;
            padding-left: 10px;
            color: #e77f67;
            font-weight: bold;
        }

        
        .lbDaGiao {
            width: 600px;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
            background-color: #82b2fa;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
            cursor: not-allowed;
        }
        .ttkh-table {
            width: 100%;
        }

        .ttkh-table {
            border: none;
            padding: 10px 0;
        }

            .ttkh-table tr td:first-child {
                width: 25%;
            }

            .ttkh-table input, .ttkh-table textarea {
                width: 100%;
                resize: none;
                padding: 10px;
                border-radius: 6px;
                border: 1px solid #808080;
            }

           
            .ttkh-table textarea {
                height: 80px;
                overflow-y: scroll;
            }

                .ttkh-table input:hover,
                .ttkh-table textarea:hover,
                .ttkh-table input:focus,
                .ttkh-table textarea:focus {
                    background: #f0fdff;
                }

        .txterror {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
            margin-bottom: 10px;
        }
        .askLogin{
            width: 100%;
            display: block;
            position: absolute;
            background: rgba(232, 163, 73, 0.27);
            z-index: 999;
            width: inherit;
            height: inherit;
            height: 554px;
            bottom: 0px;
        } 
        .askLogin p {
            text-align: center;

        }
        .askLogin a {
            text-align: center;
            color: tomato;
            display: block;
        }
        .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }
        .hlDanhGia {
            text-align: center;
            font-weight: bold;
            color: #1562b6 !important;
            font-size: 14px;
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Giohang">
            <div class="head-text">
                <div class="text">
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="back" NavigateUrl="~/KH/DonHang.aspx"><i class="fas fa-chevron-left"></i> Trở lại trang đơn hàng</asp:HyperLink>
                    <p>Đánh giá đơn hàng</p>
                </div>
            </div>
            <div class="cart">
                <table id="Table1" class="table">
                    <asp:Repeater ID="rptSP" runat="server">
                        <ItemTemplate>
                            <tr class="tr-item" style="height: 100px;">
                                <td class="left">
                                    <a href="KHDanhGia.aspx?idSP=<%# Eval("ID_SP") %>">
                                        <img alt="phone-img" src="../Uploads/<%# Eval("HINH") %>" class="img-sp" />
                                        <div class="left-head">
                                            <h5><%# Eval("TENSP") %></h5>
                                            <p>Xem sản phẩm</p>
                                        </div>
                                    </a>
                                    <%--<asp:HyperLink ID="hlDanhGia" runat="server" CssClass="hlDanhGia">Đánh giá</asp:HyperLink>--%>
                                    <a href="KHDanhGia.aspx?idSP=<%# Eval("ID_SP") %>" class="hlDanhGia">Đánh giá</a>
                                </td>
                                <td class="right">
                                    <p><%# Eval("DONGIA","{0:n0}") %></p>
                                    <span>x <%# Eval("SOLUONG") %></span>
                                    
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td class="left1">
                            
                            <h5>Tổng tiền:</h5>
                        </td>
                        <td class="right1">
                            <asp:Label ID="lblTong" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr id="trHuy" class="table-row4" runat="server">
                        <td colspan="2">
                            <asp:Label ID="lbDaGiaoHang" runat="server" Text="Đơn hàng đã giao thành công" CssClass="lbDaGiao"></asp:Label>
                        </td>
                    </tr>
                    </table>
                </div>
        </div>
</asp:Content>
