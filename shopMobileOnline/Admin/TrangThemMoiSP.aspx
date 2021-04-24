<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="TrangThemMoiSP.aspx.cs" Inherits="shopMobileOnline.Admin.TrangThemMoiSP" %>
<%@ MasterType VirtualPath="~/Admin/MasterPageAD.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tmsp-container {
           display:flex;
           flex-direction: column;
           padding: 35px 0;
        }
        table.tmsp-table {
            width: 50%;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        table.tmsp-table tbody{
            width: 100%;
            display: block;
        }
        table.tmsp-table tbody tr {
            margin: 25px 0;
            display: flex;
            align-items:center;
        }
        table.tmsp-table tbody tr td:first-child {
            width: 25%;
            min-width: 150px;
            font-weight: bold;
        }
        table.tmsp-table tbody tr td:last-child:not(.tmsp-rblTrangThai tbody tr td:last-child) {
            width: 100%;
            display: block;     
        }
        table.tmsp-table tbody tr input,
        table.tmsp-table tbody tr textarea,
        table.tmsp-table tbody tr select {
            display: block;
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px #eeeeee solid;
            background-color: #fffdfd;  
            font-size: 14px;
        }
        table.tmsp-table tbody tr input:hover,
        table.tmsp-table tbody tr input:focus,
        table.tmsp-table tbody tr textarea:hover,
        table.tmsp-table tbody tr textarea:focus,
        table.tmsp-table tbody tr select:hover,
        table.tmsp-table tbody tr select:focus {
            background-color: #f0f7fe;
            transition: all 0.2s ease-in;
        }
        table.tmsp-table tbody tr textarea {
            resize: none;
            height: 100px;
            max-height: 300px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }
        table.tmsp-table tbody tr select{
            width: 104%
        }
        .tmsp-error {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
        }
        .tmsp-table-tensp{
            font-weight: bold;
        }
        .tmsp-rblTrangThai tbody tr td {
            display: flex;
            
        }
        .tmsp-rblTrangThai tbody tr td input {
            margin: 0;
            margin-top: 2px;
            margin-right: 10px;
            width: 10px;
        }
        .tmsp-rblTrangThai tbody tr td label {
            font-weight: normal;

        }
        .tmsp-rblTrangThai tbody tr td:last-child {
            display: flex
        }
        .tmsp-btns{
            margin: 0 auto;
            display: flex;
        }
        .tmsp-btn {
            padding: 8px;
            width: 90px;
            font-size: 13.5px;
            font-weight: 500;
            background: #2768c3;
            color: white;
            outline: none;
            box-shadow: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 10px;
        }
        .tmsp-btn-ThemMoi {
            background: #2768c3; 
        }
        .tmsp-btn-ThemMoi:hover{
            background: #0c2876;
            transition : all 0.2s ease-in;
        }
        .tmsp-btn-Huy {
            background: #726f6f;
        }
        .tmsp-btn-Huy:hover{
            background: #1a1a1a;    
            transition : all 0.2s ease-in;
        }
        .dauSao {
            font-size: 13px;
            color: tomato;
        }
        .validationSumary{
            display: none;
        }
        .edit-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 104%;
        }
        .edit-container i {
            font-size: 20px;
            margin-left: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tmsp-container">
        <h3 style="text-align: center; font-size: 30px; font-weight: bold; color: #262626; margin-bottom: 20px">Thêm sản phẩm mới</h3>
        <asp:Table ID="Table1" runat="server" CssClass="tmsp-table">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Tên sản phẩm <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtTenSP" runat="server" CssClass="tmsp-table-tensp"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên sản phẩm không được trống" ControlToValidate="txtTenSP" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Nhà sản xuất <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <div class="edit-container">
                        <asp:DropDownList ID="ddlNSX" runat="server" ></asp:DropDownList>
                        <!--<i class="far fa-edit"></i>-->
                    </div>
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidator2"
                         runat="server"
                         ControlToValidate="ddlNSX"
                         InitialValue="-1"
                         ErrorMessage="Vui lòng chọn nhà sản xuất"
                         CssClass="tmsp-error"
                         Display="Dynamic"
                         >
                    </asp:RequiredFieldValidator>
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Loại <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <div class="edit-container">
                        <asp:DropDownList ID="ddlLoai" runat="server"></asp:DropDownList>
                        <!--<i class="far fa-edit"></i>-->  
                    </div>
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidator3"
                         runat="server"
                         ControlToValidate="ddlLoai"
                         InitialValue="-1"
                         ErrorMessage="Vui lòng chọn loại sản phẩm"
                         CssClass="tmsp-error"
                         Display="Dynamic"
                         >
                    </asp:RequiredFieldValidator>
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Màn hình
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtManHinh" runat="server" TextMode="MultiLine"></asp:TextBox>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Camera sau
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtCamSau" runat="server" TextMode="MultiLine"></asp:TextBox>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Camera trước
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtCamTruoc" runat="server" TextMode="MultiLine"></asp:TextBox>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    CPU
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtCPU" runat="server" TextMode="MultiLine"></asp:TextBox>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Bộ nhớ
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtBoNho" runat="server" TextMode="MultiLine"></asp:TextBox>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Kết nối
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtKetNoi" runat="server" TextMode="MultiLine"></asp:TextBox>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Pin
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtPin" runat="server" TextMode="MultiLine"></asp:TextBox>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Hình ảnh
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif"/>
                
</asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Số lượng <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtSoLuong" TextMode="Number" runat="server"></asp:TextBox>
                    
<asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Số lượng phải lớn hơn hoặc bằng 0" ControlToValidate="txtSoLuong" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>                
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Số lượng không được trống" ControlToValidate="txtSoLuong" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>       
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Giá tiền <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtGia" TextMode="Number" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Giá tiền không được trống" ControlToValidate="txtGia" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Giá tiền phải lớn hơn hoặc bằng 0" ControlToValidate="txtGia" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Số lượng đã bán
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtSLDaBan" TextMode="Number" runat="server" Text="0"></asp:TextBox>
                    
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Số lượng đã bán phải lớn hơn hoặc bằng 0" ControlToValidate="txtSLDaBan" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Tình trạng
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:RadioButtonList ID="rblTinhTrang" runat="server" RepeatDirection="Horizontal" CssClass="tmsp-rblTrangThai">
                        <asp:ListItem Value="1" Selected="True">Mở</asp:ListItem>
                        <asp:ListItem Value="0">Đóng</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <div class="tmsp-btns">
            <asp:Button ID="tmsp_btn_ThemMoi" CssClass="tmsp-btn tmsp-btn-ThemMoi" runat="server" Text="Lưu" OnClick="tmsp_btn_ThemMoi_Click" />
            <asp:Button ID="tmsp_btn_Huy" CssClass="tmsp-btn tmsp-btn-Huy" runat="server" Text="Hủy" OnClick="tmsp_btn_Huy_Click" CausesValidation="false" />
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" CssClass="validationSumary"/>
    </div>
</asp:Content>
