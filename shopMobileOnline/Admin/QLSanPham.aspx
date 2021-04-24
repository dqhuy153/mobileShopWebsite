<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="shopMobileOnline.Admin.QLSanPham" %>
<%@ MasterType VirtualPath="~/Admin/MasterPageAD.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .qlsp-container{
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            padding: 35px 0;
        }
        .qlsp-header {
             display: flex;
             justify-content: center;
             align-items: center;
             margin-bottom: 30px;
        }
        .qlsp-btnThemMoi-container {
            position: absolute;
            right: 40px;
            background: #031a43;
            padding: 11px 13px;
            border-radius: 5px;
        }

        .qlsp-btnThemMoi-container:hover {
            background: #155e98;
            transition : all 0.2s ease-in;
        }

        .qlsp-btnThemMoi-container a {
            display: flex;
            align-items: center;
        }
        .qlsp-btnThemMoi-container i,
        .qlsp-btnThemMoi-container span {
            display: block;
            color: white;
            
        }
        .qlsp-btnThemMoi-container i {
            font-size: 12px;
        }
        .qlsp-btnThemMoi-container span{
            font-size: 16px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-left: 10px;
        }
        .qlsp-table,
        .qlsp-column,
        .qlsp-row,
        .qlsp-item {
            border: 1px solid #adc9fa;  
            text-align: left;
            line-height: 1.3;
            color: #333333;
        }
        .qlsp-column{
           padding: 10px;
           text-align: center;
           vertical-align: middle;
           font-weight: bold;
           background: #ffe4da
        }
        .qlsp-item {
            padding: 10px;
        }
        .qlsp-row:nth-child(even){
            background: #fff9f9;
        }
        #qlsp-item-tensp a {
            font-weight: bold;
            color: #031a43
        }
        #qlsp-item-tensp a:hover{
            color: #0654a9;
            transition : all 0.1s ease-in;
        }
        .qlsp-btnCapNhat {
            color: #0654a9;
            font-weight: bold;
            font-size: 14px;
        }
        .qlsp-btnCapNhat:hover{
            color: #0094ff;
        }
        .qlsp-btnXoa {
            color: tomato;
            font-weight: bold;
            font-size: 14px;
        }
        .qlsp-btnXoa:hover{
            color: #f62d2d;
        }
        
  
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="qlsp-container">
        <div class="qlsp-header">
            <h3 style="text-align: center; font-size: 30px; font-weight: bold; color: #262626;">Danh sách sản phẩm</h3>
            <div class="qlsp-btnThemMoi-container">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/TrangThemMoiSP.aspx">
                    <i class="fas fa-plus"></i>
                    <span>Thêm mới</span>
                </asp:HyperLink>
            </div>
        </div>
        <table class="qlsp-table">
            <thead>
                <tr>
                    <th class="qlsp-column" style="min-width: 10px" >ID</th>
                    <th class="qlsp-column" style="min-width: 85px" >Sản phẩm</th>
                    <th class="qlsp-column" style="min-width: 30px" >NSX</th>   
                    <th class="qlsp-column" style="min-width: 30px" >Loại</th>
                    <th class="qlsp-column" style="min-width: 80px">Màn hình</th>
                    <th class="qlsp-column" style="min-width: 80px">Camera</th>
                    
                    <th class="qlsp-column" style="min-width: 80px">CPU</th>
                    <th class="qlsp-column" style="min-width: 80px">Bộ nhớ</th>
                    <th class="qlsp-column" style="min-width: 60px">Pin</th>
                    <th class="qlsp-column" style="min-width: 10px">Số lượng</th>
                    <th class="qlsp-column" style="min-width: 40px">Giá</th>
                    <th class="qlsp-column" style="min-width: 10px">Đã bán</th>
                    <th class="qlsp-column" style="min-width: 20px">Tình trạng</th>
                    <th class="qlsp-column" style="min-width: 30px">Cập nhật</th>
                    <th class="qlsp-column" style="min-width: 30px">Xóa</th>
                </tr>
            </thead>
            <tbody>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>   
        <div class="qlsp-btnThemMoi-container" style="margin: 30px auto 0px;position: initial;width: 95px;">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/TrangThemMoiSP.aspx">
                    <i class="fas fa-plus"></i>
                    <span>Thêm mới</span>
                </asp:HyperLink>
            </div>
    </div>
</asp:Content>
