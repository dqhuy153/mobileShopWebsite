<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="KHDangNhap.aspx.cs" Inherits="shopMobileOnline.KH.KHDangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        

        .khdangnhap-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            padding: 70px 0;
            
        }

        .content-container {
            box-shadow: rgba(0,0,0,0.2) 0px 6px 10px;
            width: 50%;
            max-width: 500px;
            border-radius: 0 0 6px 6px;
        }

        .content-header {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 17px;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
            
        }

            .content-header p {
                width: 50%;
                text-align: center;
                margin: 0;
                padding: 15px 0;
            }

            .content-header a {
                display: block;
                width: 50%;
                text-decoration: none;
                background: #f7faff;
                box-shadow: rgba(0,0,0,0.2) 2px -2px 5px inset;
                height: 100%;
                text-align: center;
                padding: 15px 0;
                color: #171717;
            }

        .content-body {
            padding: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
            
        }
        .content-body .img {
            font-size: 100px;
            text-align: center;
            display: block;
            color: #2f3542;
            justify-content: center;
        }
        .content-body-header p{
            text-align: center;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
            font-weight: bold;
            margin: 15px;
        }
        .content-body-items {
            width: 60%;
            margin: 0px auto 20px;
           
        }
        .content-item {
            display: flex;
            align-items: center;
        }
        .content-txt {
            margin: 10px;
         }
        .content-item i{
            margin-right: 8px;
            width: 8%;
        }
        .content-item div {
            width: 92%
        }
        .content-txt input{
            width: 100%;
            padding: 7px;
        }
        .content-txt input:focus
         {
            background: #fffaf7;
            transition: all 0.2s ease-in;
           border: 1.1px solid #aaaaaa;
        }
        .content-checkbox{
            margin-left: 10px;

        }
        .content-checkbox input {
            margin-right: 8px;
            display: block;
            width: 15px;
            height: 15px;
        }
        .content-checkbox p {
            font-size: 14px;
        }
        .btnDangNhap {
            background: #e77f67;
            padding: 10px 15px;
            border: none;
            color: white;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            margin: 0 auto;
            cursor: pointer;
        }
            .btnDangNhap:hover {
                background: tomato;
                transition: all 0.2s ease-in;
            }
        .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }
        #lbThongBao {
            text-align: center;
        }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khdangnhap-container">
            <!--<p style="text-align: center; font-size: 30px; font-weight: bold; color: #262626; margin-bottom: 20px">Đăng nhập dành cho Admin</p>
            -->
            <div class="content-container">
                <div class="content-header">
                    <p>Đăng nhập</p>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="KHDangKi.aspx">Đăng ký</asp:HyperLink>
                </div>
                <div class="content-body">
                    <div class="content-body-header">
                        <i class="fas fa-user-circle img"></i>
                        <p>CUSTOMER</p>
                    </div>
                    <div class="content-body-items">
                        <div class="content-item content-txt">
                            <i class="fas fa-user"></i>
                            <div>
                                <asp:TextBox ID="txtTenDangNhap" runat="server" placeholder="Tên đăng nhập"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập" ControlToValidate="txtTenDangNhap" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="content-item content-txt">
                            <i class="fas fa-lock"></i>
                            <div>
                                <asp:TextBox ID="txtMatKhau" runat="server" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu" ControlToValidate="txtMatKhau" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="content-item content-checkbox">
                            <asp:CheckBox ID="cbGhiNho" runat="server" />
                            <p>Ghi nhớ đăng nhập</p>
                        </div>
                    <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
                    </div>
                    <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập " OnClick="btnDangNhap_Click" CssClass="btnDangNhap" />
                </div>

            </div>
        </div>
</asp:Content>
