<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="KHDanhGia.aspx.cs" Inherits="shopMobileOnline.KH.KHDanhGia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .danhGiaSP-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 35px 0;
        }

        .danhGiaSP-header {
            font-size: 22px;
            color: #2768c3;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .danhGiaSP-content-container {
            display: flex;
            align-items: center;
            justify-content:space-around;
            width: 60%;
        }
        .danhGiaSP-img-container{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items:center;
            width: 40%;
        }

            .danhGiaSP-content-container img {
                height: 300px;
                object-fit: cover;
            }

        .danhGiaSP-content {
            margin-left: 25px;
            display: flex;
        }

            .danhGiaSP-content span {
                font-weight: normal;
            }

        .danhGiaSP-tensp {
            display: block;
            font-size: 20px;
            font-weight: bold;
            color: #0a368b;
            max-width: 300px;
            text-align: center;
            line-height: 1.3;
            margin-top: 13px;
        }

        .danhGiaSP-content p {
            font-weight: bold;
            margin: 5px 0;
            width: 100px;
        }

        .danhGiaSP-content-item {
            display: flex;
            align-items: center;
            
        }
        
        .danhGiaSP-btn {
            padding: 10px 15px;
            min-width: 85px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            
        }
        .danhGiaSP-btn-xoa {
            background: tomato;
            color: white;
            margin-right: 10px;
        }
        .danhGiaSP-btn-xoa:hover{
            background: #cc330d;
            transition: all 0.2s ease-in;
        }
        .danhGiaSP-btn-huy {
            background: #726f6f;
            color: white;
            margin-right: 30px;
        }
        .danhGiaSP-btn-huy:hover{
            background: #1a1a1a;
            transition: all 0.2s ease-in;
        }
    
        .danhGiaSP-right {
            width: 50%;
        }
        .danhGiaSP-btns {
            margin: 20px 0;     
        }
        .danhGiaSP-main-sao, .danhGiaSP-main-text, .danhGiaSP-hinhUpload{
            display: flex;
            margin: 30px 0;
        }
        .danhGiaSP-main-text, .danhGiaSP-hinhUpload{
            justify-content: space-between;
        }
        .danhGiaSP-main-text p , .danhGiaSP-hinhUpload p{
            font-weight: bold;
            margin-right: 10px;
        }
        .danhGiaSP-hinhUpload input {
            width: 75%;
        }
        .txtDanhGia {
            width: 75%;
            height: 150px;
            overflow-y: auto;
            padding: 10px;
        }
        .danhGiaSP-main-sao p{
            display: block;
            width: 25%;
            text-align: center;
        }
        .danhGiaSP-main-sao input {
            text-align: center;
            font-weight: bold;
            padding: 5px;
        }
        .danhGiaSP-btns {
            width: 100%;
            margin: 0 auto;
            justify-content: center;
            display: flex;
            margin: 50px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="danhGiaSP-container">
        <p class="danhGiaSP-header">Bạn có hài lòng với sản phẩm?</p>
        <div class="danhGiaSP-content-container">
            <div class="danhGiaSP-img-container">
                <asp:Image ID="imgSP" runat="server" />
                <asp:Label ID="lbTenSP" runat="server" Text="" CssClass="danhGiaSP-tensp"></asp:Label>
            </div>
            <div class="danhGiaSP-right">
                <div class="danhGiaSP-main">
                    <div class="danhGiaSP-main-text">
                        <p>Nội dung:</p>
                        <asp:TextBox ID="txtDanhGia" runat="server" TextMode="MultiLine" CssClass="txtDanhGia"></asp:TextBox>
                    </div>
                    <div class="danhGiaSP-main-sao">
                        <p><i class="fas fa-star"></i></p>
                        <%--<asp:TextBox ID="txtSao" runat="server" TextMode="Number"></asp:TextBox>--%>
                        <input id="txtSao" type="number" min="1" max="5" value="5" runat="server" class="txtSao"/>
                    </div>
                </div>
                <div class="danhGiaSP-hinhUpload">
                    <p>Hình ảnh:</p>
                    <asp:FileUpload ID="FileUploadHinh" runat="server" accept=".jpg, .png, .jpeg, .gif, .tiff"/>
                </div>
                <div class="danhGiaSP-btns">
                    <asp:Button ID="btnDanhGia" runat="server" Text="Đánh giá" OnClick="btnDanhGia_Click" class="danhGiaSP-btn danhGiaSP-btn-xoa"/>
                    <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" class="danhGiaSP-btn danhGiaSP-btn-huy"/>
                </div>
            </div>
                
            </div>
       
    </div>

</asp:Content>
