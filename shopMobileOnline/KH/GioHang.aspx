<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="shopMobileOnline.admin.GioHang" %>

<%@ MasterType VirtualPath="~/KH/MasterPageKH.Master" %>

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
            //position: absolute;
            width: 630px;
            //padding-left: 400px;
            padding-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .text {
            //position: relative;
            width: 100%;
            display: flex;
            justify-content: space-between;
        }

        .back {
            //position: absolute;
            margin-right: 50px;
        }

        .text p {
            //position: absolute;
            //padding-left: 520px;
        }

        .cart {
            //position: absolute;
            width: 650px;
            box-shadow: 0 0 18px rgb(0 0 0 / 12%);
            margin-top: 30px;
            //margin-left: 400px;
            //height: 800px;
        }

        .table {
            //position: relative;
            width: 620px;
            height: 800px;
        }

        .tr-item a {
            color: #333333;
        }

        .left, .left1 {
            height: auto;
            //position: relative;
            width: 500px;
            
        }
        .left a:first-child {
            display: flex;
            padding-top: 10px;
        }
        .img-sp {
            //position: absolute;
            width: 80px;
            margin-right: 10px;
        }

        .btnXoa {
            //position: absolute;
            //top: 97px;
            //left: 41px;
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

        .left h5 {
            //position: absolute;
            //margin-left: 85px;
            //margin-top: 10px;

        }

        .left p {
            //position: absolute;
            //margin-left: 85px;
            //margin-top: 35px;
            font-size: 13px;
        }

        .right {
            //position: relative;
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
            padding-left: 10px;
            padding-top: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', Times, serif;
            color: #e77f67;
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

            .right1 span:first-child {
                color: #333333;
                font-weight: normal;
                padding-top: 30px;
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

        .btnDatHang {
            width: 600px;
            height: 70px;
            border-radius: 5px;
            background-color: #e77f67;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
        }
        .btnLogin {
            width: 600px;
            padding: 20px;
            border-radius: 5px;
            background-color: #20489b;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            color: white;
            display: block;
            text-align: center;
            vertical-align: middle;
        }
        .btnLogin:hover {
            color: white;
            background: #0b2976;
            text-decoration: none;
        }
        .btnDatHang:hover {
            color: white;
            background: tomato;
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

            .ttkh-table input {
                //height: 30px;
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
        .giohang-trong-container{
            display: flex;
            flex-direction: column;
            height: 70vh;
            align-items: center;
            justify-content: center;
        }
        .giohang-trong-container i {
            font-size: 80px;
            color: tomato
        }
        .giohang-trong-container p {
            font-size: 30px;
            margin: 20px;
            color: tomato
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnGioHang" runat="server">
        <div class="Giohang">
            <div class="head-text">
                <div class="text">
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="back" NavigateUrl="~/KH/TrangSPTheoNSX.aspx"><i class="fas fa-chevron-left"></i> Mua thêm sản phẩm</asp:HyperLink>
                    <p>Giỏ hàng của bạn</p>
                </div>
            </div>
            <div class="cart">
                <table id="Table1" class="table">
                    <asp:Repeater ID="rptSP" runat="server">
                        <ItemTemplate>
                            <tr class="tr-item" style="height: 100px;">
                                <td class="left">
                                    <a href="TrangChiTietSP.aspx?idSP=<%# Eval("ID") %>">
                                        <img alt="phone-img" src="../Uploads/<%# Eval("Hinh") %>" class="img-sp" />
                                        <div class="left-head">
                                            <h5><%# Eval("Ten") %></h5>
                                            <p>Thông tin khuyến mãi</p>
                                        </div>
                                    </a>
                                    <asp:LinkButton ID="btnXoaItem" runat="server" CssClass="btnXoa" OnClick="btnXoaItem_Click"><i class="far fa-times-circle"></i></asp:LinkButton>
                                </td>
                                <td class="right">
                                    <p><%# Eval("Gia","{0:n0}") %></p>
                                    <!--<ul>
                                        <li>
                                            <asp:Button ID="btnTru" runat="server" Style="width: 30px; color: blue" Text="-" /></li>
                                        <li>
                                            <asp:TextBox ID="txtSL" runat="server" Style="width: 30px;" Text=""></asp:TextBox></li>
                                        <li>
                                            <asp:Button ID="btnCong" runat="server" Style="width: 30px; color: blue" Text="+" /></li>
                                    </ul>
                                    -->
                                    <asp:Label ID="lbSL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td class="left1">
                            <asp:HyperLink ID="HyperLink3" runat="server" Style="color: #288ad6; margin-left: 10px;"><i class="fas fa-tag"></i> Sử dụng mã giảm giá</asp:HyperLink>
                            <p>Tạm Tính: </p>
                            <h5>Tổng tiền:</h5>
                        </td>
                        <td class="right1">
                            <asp:Label ID="lblTamTinh" runat="server" Text=""></asp:Label>
                            <asp:Label ID="lblTong" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>


                    <tr id="trTT" class="table-row3" runat="server">
                        <td colspan="2">
                            <h6>THÔNG TIN KHÁCH HÀNG</h6>
                            <div class="ttkh-table-container">
                                <asp:Table ID="Table2" runat="server" CssClass="ttkh-table">
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Họ tên (*)</asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Họ tên không được bỏ trống" ControlToValidate="txtTen" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Email</asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" CssClass="txterror" Display="Dynamic"></asp:RegularExpressionValidator>


                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Số điện thoại <span class="dauSao">(*)</span></asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Số điện thoại không được bỏ trống" ControlToValidate="txtSDT" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">Địa chỉ <span class="dauSao">(*)</span></asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Địa chỉ không được bỏ trống" ControlToValidate="txtDiaChi" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </td>
                    </tr>
                    <tr id="trTong" class="table-row4" runat="server">
                        <td class="left2">
                            <h5 style="">Tổng tiền:</h5>
                        </td>
                        <td class="right2">
                            <asp:Label ID="lbTong1" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr id="trMua" class="table-row4" runat="server">
                        <td colspan="2">
                            <asp:Button ID="btnMua" runat="server" Text="Thanh toán và mua hàng" OnClick="btnMua_Click" CssClass="btnDatHang" />
                            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/KH/KHDangNhap.aspx" CssClass="btnLogin">Đăng nhập để tiếp tục</asp:HyperLink>

                        </td>
                    </tr>
                    
                        
                    
                </table>
                 </div>
        </div>

    </asp:Panel>
    <asp:Panel ID="pnGioHangTrong" runat="server">
        <div class="giohang-trong-container">
            <i class="far fa-times-circle"></i>
            <p>Không có sản phẩm nào trong giỏ hàng</p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/KH/KHTrangChu.aspx">VỀ TRANG CHỦ</asp:HyperLink>
        </div>

    </asp:Panel>

</asp:Content>
