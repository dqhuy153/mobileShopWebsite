<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="ADTrangChu.aspx.cs" Inherits="shopMobileOnline.Admin.ADTrangChu" %>
<%@ MasterType VirtualPath="~/Admin/MasterPageAD.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .adtrangchu-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 45px 0;
        }

        

        .section-thongKe {
            width: 60%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px auto 50px;
        }

        .adtrangchu-datHang-container {
            width: 55%;
            box-shadow: rgba(0,0,0,0.15) 0px 2px 8px;
            height: 500px;
            border-radius: 5px;
            overflow: hidden;
            overflow-y: scroll;
            overflow-x:auto;
        }

        .adtrangchu-doanhThu-container {
            width: 35%;
            height: 500px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .adtrangchu-doanhThu-container .section-item-header{
            background: #f19066;
            
        }

        .section-item {
            //border: 1px solid #052f87;
            height: 140px;
            box-shadow: rgba(0,0,0,0.15) 0px 2px 8px;
            border-radius: 5px;
        }

        .section-item-header {
            width: 100%;
            text-align: center;
            font-size: 15px;
            font-weight: bold;
            font-family: Arial, sans-serif;
            background: #2f3542;
            padding: 12px 0;
            color: white;
            //border-radius: 4px;
           

        }
        

        .section-item-number {
            display: flex;
            height: 100px;
            justify-content: center;
            align-items: center
        }
        .section-item-number span {
            font-size: 24px;
            font-family:  Arial, sans-serif;
            color: #052f87;
        }
        /*.adtrangchu-quanLi {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 60%;
            margin: 0 auto;
        }

            .adtrangchu-quanLi li {
                display: block;
                width: 25%;
            }

                .adtrangchu-quanLi li a {
                    display: block;
                    background: #d3e2f9;
                    padding: 15px 15px;
                    border: none;
                    color: #292929;
                    font-size: 14px;
                    font-weight: bold;
                    border-radius: 5px;
                    margin: 0 auto;
                    cursor: pointer;
                    text-align: center;
                    font-family: Arial,sans-serif;
                    box-shadow: rgba(0,0,0,0.15) 0px 2px 4px;
                }

                    .adtrangchu-quanLi li a:hover {
                        background: #052f87;
                        color: white;
                        transition: all 0.2s ease-in;
                    }
            */
        .qldh-container{
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
           padding-bottom: 80px;
           overflow-y: scroll;
           
        }
        .qldh-container h4 {
            margin: 0 auto;
            font-size: 30px;
            font-weight: bold; 
            color: #262626;
        }
        
        .table {
            width: 100%;
            margin: 0 auto;
        }
        .table,
        .table-th,
        .table-tr,
        .table-item {
            border: 1px solid #adc9fa;  
            text-align: left;
            line-height: 1.3;
            color: #333333;
        }
        .table-th{
           padding: 10px;
           text-align: center;
           vertical-align: middle;
           font-weight: bold;
           background: #ffe4da
        }
        .table-td {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            font-family:Arial, sans-serif;
            
        }
        .table-item {
            padding: 10px;
        }
        .table-tr:nth-child(even){
            background: #fff9f9;
        }
        #table-item-tensp a {
            font-weight: bold;
            color: #031a43
        }
        #table-item-tensp a:hover{
            color: #0654a9;
            transition : all 0.1s ease-in;
        }
        .qldh-btnXem {
            color: #052f87;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="adtrangchu-container">
        <section class="section-thongKe">
            <div class="adtrangchu-datHang-container">
                <p class="section-item-header header-choDuyet">Đơn hàng chờ duyệt</p>
                <table class="table" border="1">
                <tr  class="table-tr">
                    <th class="table-th">ID</th>
                    <th class="table-th">Ngày</th>
                    <th class="table-th">Số lượng</th>
                    <th class="table-th">Tổng</th>
                    <th class="table-th"  style="min-width: 80px">Xem</th>
                </tr>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </table>
            </div>
            <div class="adtrangchu-doanhThu-container">
                <div class="section-item doanhthu">
                    <p class="section-item-header">Tổng doanh thu</p>
                    <div class="section-item-number">
                        <asp:Label ID="lbTongDoanhThu" runat="server" Text=""></asp:Label>
                        <table>
                            <tr>
                                <th></th>
                            </tr>
                        </table>
                    </div>

                </div>
                <div class="section-item tongsp-daBan">
                    <p class="section-item-header">Tổng sản phẩm đã bán</p>
                    <div class="section-item-number">
                        <asp:Label ID="lbSPDaBan" runat="server" Text="100000"></asp:Label>

                    </div>
                </div>
                <div class="section-item tongsp-ton">
                    <p class="section-item-header">Tổng sản phẩm tồn</p>
                    <div class="section-item-number">
                        <asp:Label ID="lbSPTon" runat="server" Text="100000"></asp:Label>

                    </div>
                </div>
            </div>
        </section>
        <!--
        <ul class="adtrangchu-quanLi">
            <li>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/QLSanPham.aspx">Quản lí sản phẩm</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/QLTaiKhoanAdmin.aspx">Quản lí tài khoản ADMIN</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/QLTaiKhoanKH.aspx">Quản lí tài khoản KHÁCH HÀNG</asp:HyperLink>
            </li>
        </ul>
        -->
    </div>
</asp:Content>
