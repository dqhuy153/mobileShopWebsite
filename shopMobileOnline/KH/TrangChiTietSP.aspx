<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="TrangChiTietSP.aspx.cs" Inherits="shopMobileOnline.admin.TrangChiTietSP" %>

<%@ MasterType VirtualPath="~/KH/MasterPageKH.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .ctsp-header {
            width: 270px;
            margin-left: 250px;
            margin-top: 50px;
            color: #e77f67;
            font-size: 20px;
            font-weight: bold;
        }

        .hr {
            width: 1000px;
            margin-left: 250px;
        }

        h5 {
            margin: 30px auto;
            display: block;
            
        }

        .ctsp-container {
            height: auto;
            margin: 0 auto;
        }

        .ctsp-content-container {
            //position:relative;
            margin-top: 70px;
            margin-left: 220px;
                display: flex;
                padding-bottom: 100px;
        }

        .ctsp-img-container {
            //position: absolute;
            width: 500px;
            text-align: center;
            margin-right: 20px;
        }

            .ctsp-img-container img {
                width: 460px;
                margin-bottom: 25px;
                
            }

        .ctsp-tensp {
            margin-top: 500px;
            color: #e77f67;
            font-weight: bold;
            font-size: 20px;
            
        }

        .ctsp-content {
            //position: absolute;
            margin-left: 20px;
            width: 500px;
        }

        .ctsp-content-item {
        }

        h5 {
            color: #e77f67;
        }

        .ctsp-content-item p {
            font-weight: 600;
            color: #e77f67;
            padding: 5px;
            border-bottom: 1px solid #2f3542;
        }

        .ctsp {
            color: black;
            font-weight: 400;
            padding-left: 10px
        }

        .price {
            color: #e77f67;
            font-weight: bold;
        }

        .ctsp-btns {
            //position: relative;
            margin-top: 35px;
            height: auto;
            margin: 0 auto;
            display: flex;
            width: 70%;
            justify-content: space-between;
        }

        .ctsp-btn-datHang {
            //position: absolute;
            width: 45%;
            height: 50px;
            background-color: #e77f67;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: 500;
            margin: 0 auto;
        }

        .ctsp-btn-LuuHang {
            //position: absolute;
            //margin-left: 230px;
            width: 45%;
            height: 50px;
            background-color: #2f3542;
            border: none;
            border-radius: 5px;
            color: white;
        }
        .item-head {
            margin: 40px auto;
        }
        .item-head p {
            border-bottom: none;
            width: 100px;
        }

        .item-head .item-head-content {
            display: flex;
            align-items: center;
            
        }
        .item-head span{
            display: block
        }
        .chonSL {
            display: flex;
            width: 40%;
            justify-content: space-between;
            margin: 30px auto;
            
        }
        .chonSL p{
            width: 45%;
            font-weight: 500;
        }
        .chonSL-content {
            width:55%;
        }
        .chonSL input {
            width: 100%;
            text-align: center;
        }
        .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ctsp-container">
        <p class="ctsp-header">Trang Chi Tiết Sản Phẩm</p>
        <hr class="hr" />
        <div class="ctsp-container">
            <div class="ctsp-content-container">
                <div class="ctsp-img-container">
                    <asp:Image ID="imgSP" runat="server" />
                    <asp:Label ID="lbTenSP" runat="server" Text="" CssClass="ctsp-tensp"></asp:Label>
                    <div class="chonSL">
                        <p>Số lượng: </p>
                        <div class="chonSL-content">
                            <asp:TextBox ID="txtSL" runat="server" Text="1" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Số lượng không được bỏ trống" ControlToValidate="txtSL" Display="Dynamic" CssClass="txterror"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Số lượng phải lớn hơn 0" ControlToValidate="txtSL" Display="Dynamic" CssClass="txterror" ValueToCompare="1" Operator="GreaterThanEqual"></asp:CompareValidator>

                        </div>
                    
                    </div>
                    <div class="ctsp-btns">
                        
                        <asp:Button ID="btnDatHang" runat="server" Text="Đặt hàng" OnClick="btnDatHang_Click" class="ctsp-btn ctsp-btn-datHang" /> 
                        <asp:Button ID="btnLuu" runat="server" Text="Xem sau (Lưu)" OnClick="btnLuu_Click" class="ctsp-btn ctsp-btn-LuuHang" />
                    </div>
                </div>
                <div class="ctsp-content">

                    <div class="ctsp-main">
                        <asp:Label ID="lbTen1" runat="server" Text="" CssClass="ctsp-tensp"></asp:Label>
                        <div class="ctsp-content-item item-head">

                            <div class="item-head-content">
                                <p>
                                    NSX:
                                </p>
                                <asp:Label ID="lbNSX" runat="server" Text="" CssClass="ctsp"></asp:Label>

                            </div>

                            <div class="item-head-content">

                                <p>
                                    Loại:
                                </p>

                                <asp:Label ID="lbLoai" runat="server" Text="" CssClass="ctsp"></asp:Label>

                            </div>
                            <div class="item-head-content">

                                <p>
                                    Hiện có:
                                </p>
                                <asp:Label ID="lbSL" runat="server" Text="" CssClass="ctsp"></asp:Label>
                            </div>
                            <div class="item-head-content">

                                <p>
                                    Giá:
                                </p>
                                <asp:Label ID="lbGia" runat="server" Text="" CssClass="ctsp price"></asp:Label>
                            </div>

                        </div>
                    </div>
                    <h5>Thông số kỹ thuật</h5>
                    <div class="ctsp-content-item">

                        <p>
                            Màn hình:<asp:Label ID="lbManHinh" runat="server" Text="" CssClass="ctsp"></asp:Label>
                        </p>


                        <p>
                            Camera sau:<asp:Label ID="lbCamSau" runat="server" Text="" CssClass="ctsp"></asp:Label>
                        </p>



                        <p>
                            Camera trước:
                            <asp:Label ID="lbCamTruoc" runat="server" Text="" CssClass="ctsp"></asp:Label>
                        </p>



                        <p>
                            CPU:
                            <asp:Label ID="lbCPU" runat="server" Text="" CssClass="ctsp"></asp:Label>
                        </p>



                        <p>
                            Bộ nhớ:
                            <asp:Label ID="lbBoNho" runat="server" Text="" CssClass="ctsp"></asp:Label>
                        </p>


                        <p>
                            Kết nối:
                            <asp:Label ID="lbKetNoi" runat="server" Text="" CssClass="ctsp"></asp:Label>
                        </p>



                        <p>
                            Pin:
                            <asp:Label ID="lbPin" runat="server" Text="" CssClass="ctsp"></asp:Label>
                        </p>

                    </div>
                    

                </div>

            </div>
        </div>
    </div>
</asp:Content>
