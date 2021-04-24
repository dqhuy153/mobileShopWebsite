<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="TrangCapNhatSP.aspx.cs" Inherits="shopMobileOnline.Admin.TrangCapNhatSP" %>
<%@ MasterType VirtualPath="~/Admin/MasterPageAD.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cnsp-container {
            display: flex;
            flex-direction: column;
            padding: 40px 0;
        }
        .cndl-table-container{
            display: flex;
            width: 50%;
            margin: 0 auto;
        }
        .cndl-table-container img {
            height: 200px;
            object-fit: cover;
            position: absolute;
            right: 80px;
        }
        @media only screen and (max-width: 1100px) {
            .cndl-table-container img {
                display: none
            }
        }
        table.cnsp-table {
            width: 100%;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            table.cnsp-table tbody {
                width: 100%;
                display: block;
            }

                table.cnsp-table tbody tr {
                    margin: 25px 0;
                    display: flex;
                    align-items: center;
                }

                    table.cnsp-table tbody tr td:first-child {
                        width: 25%;
                        min-width: 150px;
                        font-weight: bold;
                    }

                    table.cnsp-table tbody tr td:last-child:not(.cnsp-rblTrangThai tbody tr td:last-child) {
                        width: 100%;
                        display: block;
                    }

                    table.cnsp-table tbody tr input,
                    table.cnsp-table tbody tr textarea,
                    table.cnsp-table tbody tr select {
                        display: block;
                        width: 100%;
                        padding: 10px;
                        border-radius: 4px;
                        border: 1px #eeeeee solid;
                        background-color: #fffdfd;
                        font-size: 14px;
                    }

                        table.cnsp-table tbody tr input:hover,
                        table.cnsp-table tbody tr input:focus,
                        table.cnsp-table tbody tr textarea:hover,
                        table.cnsp-table tbody tr textarea:focus,
                        table.cnsp-table tbody tr select:hover,
                        table.cnsp-table tbody tr select:focus {
                            background-color: #f0f7fe;
                            transition: all 0.2s ease-in;
                        }

                    table.cnsp-table tbody tr textarea {
                        resize: none;
                        height: 100px;
                        max-height: 300px;
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                    }

                    table.cnsp-table tbody tr select {
                        width: 104%
                    }

        .cnsp-error {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
        }

        .cnsp-table-tensp {
            font-weight: bold;
        }

        .cnsp-rblTrangThai tbody tr td {
            display: flex;
        }

            .cnsp-rblTrangThai tbody tr td input {
                margin: 0;
                margin-top: 2px;
                margin-right: 10px;
                width: 10px;
            }

            .cnsp-rblTrangThai tbody tr td label {
                font-weight: normal;
            }

            .cnsp-rblTrangThai tbody tr td:last-child {
                display: flex
            }

        .cnsp-btns {
            margin: 0 auto;
            display: flex;
        }

        .cnsp-btn {
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

        .cnsp-btn-CapNhat {
            background: #2768c3;
        }

            .cnsp-btn-CapNhat:hover {
                background: #0c2876;
                transition: all 0.2s ease-in;
            }

        .cnsp-btn-Huy {
            background: #726f6f;
        }

            .cnsp-btn-Huy:hover {
                background: #1a1a1a;
                transition: all 0.2s ease-in;
            }


        .dauSao {
            font-size: 13px;
            color: tomato;
        }
        .validationSumary{
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cnsp-container">
        <h3 style="text-align: center; font-size: 30px; font-weight: bold; color: #262626; margin-bottom: 20px">Cập nhật sản phẩm</h3>
        <div class="cndl-table-container">

        <asp:Table ID="Table1" runat="server" CssClass="cnsp-table">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Tên sản phẩm <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtTenSP" runat="server" CssClass="cnsp-table-tensp"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên sản phẩm không được trống" ControlToValidate="txtTenSP" CssClass="cnsp-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Nhà sản xuất <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:DropDownList ID="ddlNSX" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="ddlNSX"
                        ErrorMessage="Vui lòng chọn nhà sản xuất"
                        CssClass="cnsp-error"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Loại <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:DropDownList ID="ddlLoai" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="ddlLoai"
                        ErrorMessage="Vui lòng chọn loại sản phẩm"
                        CssClass="cnsp-error"
                        Display="Dynamic">
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
                    <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif" />

                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Số lượng <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtSoLuong" TextMode="Number" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Số lượng không được trống" ControlToValidate="txtSoLuong" CssClass="cnsp-error" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Số lượng phải lớn hơn hoặc bằng 0" ControlToValidate="txtSoLuong" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Giá tiền <span class="dauSao">(*)</span>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtGia" TextMode="Number" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Giá tiền không được trống" ControlToValidate="txtGia" CssClass="cnsp-error" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Giá tiền phải lớn hơn hoặc bằng 0" ControlToValidate="txtGia" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Số lượng đã bán
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtSLDaBan" TextMode="Number" runat="server"></asp:TextBox>

                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Số lượng đã bán phải lớn hơn hoặc bằng 0" ControlToValidate="txtSLDaBan" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="cnsp-error" Display="Dynamic"></asp:CompareValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    Tình trạng
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:RadioButtonList ID="rblTinhTrang" runat="server" RepeatDirection="Horizontal" CssClass="cnsp-rblTrangThai">
                        <asp:ListItem Value="1">Mở</asp:ListItem>
                        <asp:ListItem Value="0">Đóng</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
            <asp:Image ID="imgSP" runat="server" />    
        </div>
        <div class="cnsp-btns">
            <asp:Button ID="cnsp_btn_CapNhap" CssClass="cnsp-btn cnsp-btn-CapNhat" runat="server" Text="Cập nhật" OnClick="cnsp_btn_CapNhap_Click" />
            <asp:Button ID="cnsp_btn_Huy" CssClass="cnsp-btn cnsp-btn-Huy" runat="server" Text="Hủy" OnClick="cnsp_btn_Huy_Click" />
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" CssClass="validationSumary"/>

        
    </div>
</asp:Content>
