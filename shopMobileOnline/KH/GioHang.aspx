<%@ Page EnableEventValidation="false" ValidateRequest="false" Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="shopMobileOnline.admin.GioHang" %>

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
        .trTT {
            border-bottom: 1px solid #eee;
        }
        .trTT h6 {
            margin: 25px 0;
        }

        .trThanhToan img {
            width: 25px;
        }
        .trThanhToan-td {
             display: flex;
             width: 509px;
             border: none;
             flex-direction: column;
            

        }
        .trThanhToan h6 {
            padding: 25px 0;
            
        }
        .rbl-container tr td{
            display: flex;
            flex-direction: row;
            border: none;

        }
        .rbl-container tr td input {
            width: 40px;
            height:17px;
            padding-top: 5px;
            display:block;
            margin-top: 3px;
        }
        .trThanhToan td label {
            display: flex;
            align-items: center;
            padding-bottom: 5px;
        } 
        .trThanhToan td label i {
            font-size: 20px;
        }
        .trThanhToan td label p {
            margin-left: 10px;
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
        .lbID {
            display: none;
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
                                            <asp:Label ID="lbID" runat="server" Text="" CssClass="lbID"></asp:Label>
                                        </div>
                                    </a>
                                    <asp:LinkButton ID="btnXoaItem" runat="server" CssClass="btnXoa" OnClick="btnXoaItem_Click" CausesValidation="false"><i class="far fa-times-circle"></i></asp:LinkButton>
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


                    <tr id="trTT" class="trTT" runat="server">
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
                    <tr id="trThanhToan" class="trThanhToan" runat="server">
                        
                        <td colspan="2" class="trThanhToan-td">
                            <h6>PHƯƠNG THỨC THANH TOÁN</h6>
                            <asp:RadioButtonList ID="rblThanhToan" runat="server" CssClass="rbl-container">
                                <asp:ListItem Selected="True">
                                    <i class="fas fa-money-bill-wave"></i>
                                    <p>
                                        Thanh toán bằng tiền mặt
                                    </p>
                                </asp:ListItem>
                                <asp:ListItem>
                                    <i class="fab fa-cc-visa"></i>
                                    <p>
                                        Thanh toán bằng thẻ quốc tế Visa, Master, JCB
                                    </p>
                                </asp:ListItem>
                                <asp:ListItem>
                                    <i class="fas fa-money-check-alt"></i>
                                    <p>
                                        Thanh toán bằng thẻ nội địa
                                    </p>
                                </asp:ListItem>
                                <asp:ListItem>
                                    <img src="../images/momo.png" alt="momo logo" />
                                    <p>
                                        Thanh toán bằng MoMo
                                    </p>
                                </asp:ListItem>
                                <asp:ListItem>
                                    <img src="../images/zalopay.png" alt="momo logo" />
                                    <p>
                                        Thanh toán bằng ZaloPay
                                    </p>
                                </asp:ListItem>

                            </asp:RadioButtonList>                            
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
                            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/KH/KHDangNhap.aspx?t=GH" CssClass="btnLogin">Đăng nhập để tiếp tục</asp:HyperLink>
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
