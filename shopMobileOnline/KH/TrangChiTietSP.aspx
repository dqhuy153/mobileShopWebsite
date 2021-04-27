<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="TrangChiTietSP.aspx.cs" Inherits="shopMobileOnline.admin.TrangChiTietSP" %>

<%@ MasterType VirtualPath="~/KH/MasterPageKH.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../fa/dist/css/image-zoom.css"/>
    <script src="../fa/dist/js/image-zoom.min.js"></script>
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
            margin-top: 70px;
            margin-left: 220px;
            display: flex;
            padding-bottom: 100px;
        }

        .ctsp-img-container {
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
            margin-left: 20px;
            width: 500px;
        }

        .ctsp-content-item {
        }

        h5 {
            color: #e77f67;
        }

        .ctsp-main {
            box-shadow: rgba(0,0,0,0.15) 1px 1px 10px;
            padding: 30px;
            border-radius: 10px;
        }

        .ctsp-content-item p {
            font-weight: 600;
            color: #e77f67;
            padding: 5px;
            border-bottom: 1px solid #eee;
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
            margin-top: 35px;
            height: auto;
            margin: 0 auto;
            display: flex;
            width: 70%;
            justify-content: space-between;
        }

        .ctsp-btn-datHang {
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

            .item-head span {
                display: block
            }

        .chonSL {
            display: flex;
            width: 40%;
            justify-content: space-between;
            margin: 30px auto;
        }

            .chonSL p {
                width: 45%;
                font-weight: 500;
            }

        .chonSL-content {
            width: 55%;
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

        .danhGia {
            width: 70%;
            margin: 0 auto;
        }

        .danhGia__header {
            font-size: 20px;
            color: #113da5;
            text-transform: capitalize;
            font-weight: bold;
        }

        .danhGia-container {
            width: 100%;
            margin: 50px auto;
        }
        
        .danhGia__row {
            display: flex;
            box-shadow: rgba(0,0,0,0.1) 2px 2px 10px;
            padding: 30px;
        }
        .danhGia__kh{
            flex-direction: column;
            width: fit-content();
            display: flex;
            align-items: center;
            justify-content: center;
            padding-right: 30px;
        }
        .danhGia_kh-row {
            
            display: flex;
            align-items: center;
        }

            .danhGia_kh-row i {
                font-size: 30px;
                margin-right: 13px;
            }
            .danhGia__kh a i {
                color: tomato;
                font-size: 15px;
                margin-top: 15px;
            }
        .danhGia__content {
            width: 75%;
            padding-left: 20px;
            border-left: 1px solid #eee;
        }

        .danhGia__content-info {
            font-weight: bold;
            font-size: 13px;
            margin-bottom: 15px;
        }

            .danhGia__content-info i {
                font-size: 11px;
            }

        .danhGia_content-text {
            font-size: 16px;
            padding-top: 5px;

        }
        .danhGia_content-text img {
            width: 350px;
            margin-top: 20px;
        }

        .binhLuan {
            width: 70%;
            margin: 0 auto;
            padding-top: 60px;
        }

        .binhLuan__header {
            font-size: 20px;
            color: #113da5;
            text-transform: capitalize;
            font-weight: bold;
        }

        .binhLuan-container {
            width: 100%;
            margin: 20px auto 80px;
        }

        .binhLuan__row {
            display: flex;
            box-shadow: rgba(0,0,0,0.1) 2px 2px 10px;
            padding: 20PX;
            margin-top: 30px;
            margin-bottom: 5px;
            background: #f4f9ff;
        }

        .binhLuan__kh-container {
            width: fit-content();
            align-items: center;
            padding-right: 30px;
        }

        .binhLuan__kh {
            align-items: center;
            display: flex;
            margin-bottom: 10px;
        }

            .binhLuan__kh i {
                font-size: 30px;
                margin-right: 13px;
            }

        .binhLuan__content {
            width: 75%;
            padding-left: 20px;
            border-left: 1px solid #eee;
        }

        .binhLuan__content-info {
            font-weight: bold;
            font-size: 13px;
            margin-bottom: 15px;
        }

            .binhLuan__content-info i {
                font-size: 11px;
            }

        .binhLuan__content-text {
            font-size: 16px;
            padding-top: 10px;
        }

        .traLoi {
            width: 70%;
            margin: 0 auto;
        }

        .traLoi__header {
            font-size: 20px;
            color: #113da5;
            text-transform: capitalize;
            font-weight: bold;
        }

        .traLoi-container {
            width: 100%;
            margin: 50px auto;
        }

        .traLoi__row {
            display: flex;
            border: 1px solid #eee;
            padding: 20px;
            margin-left: auto;
            width: 90%;
        }

        .traLoi__kh-container {
            width: fit-content();
            align-items: center;
            padding-right: 30px;
        }

        .traLoi__kh {
            align-items: center;
            display: flex;
            margin-bottom: 10px;
        }

            .traLoi__kh i {
                font-size: 30px;
                margin-right: 13px;
            }

        .traLoi__content {
            width: 75%;
            padding-left: 20px;
            border-left: 1px solid #eee;
        }

        .traLoi__content-info {
            font-weight: bold;
            font-size: 13px;
            margin-bottom: 15px;
        }

            .traLoi__content-info i {
                font-size: 11px;
            }

        .traLoi__content-text {
            font-size: 16px;
            padding-top: 10px;
        }

        .lbIDBL {
            display: none;
        }
        .binhLuan__input-container {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin: 70px auto;  
        }
        .binhLuan__input {
            display: flex;
            width: 90%;
            align-items: center;
        }
        .binhLuan__input-container p {
            font-weight: bold;
        }
        .binhLuan__input-content {
            width: 100%;
            height: fit-content();
        }
        .binhLuan__input a {
            position: relative;
            top: -14px;
            right: 10px;
            
        }
        .binhLuan__input i {
            font-size: 18px;
        }
        .binhLuan__input textarea {
            width: 95%;
            resize: none;
            height: 120px;
            overflow-y: auto;
            padding: 20px;
        }
        .binhLuan__kh-container a {
            display: block;
            text-align: center;
            color: tomato;
            display: none;
            
        }
        .traLoi__input-container {
            width: 90%;
            display: flex;
            justify-content: space-between;
            margin-left: auto;
            align-items: center;
         }
        .traLoi__input {
            display: flex;
            width: 90%;
            align-items: center;
            margin: 15px 5px;
        }
        .traLoi__input-container p {
            font-weight: bold;
        }
        .traLoi__kh-container a {
            display: block;
            text-align: center;
            color: tomato;
            display: none;
        }
        .traLoi__input-content {
            width: 100%;
            height: fit-content();
        }
        .traLoi__input a {
            margin-right: 5px;
            
        }
        .traLoi__input i {
            font-size: 18px;
        }
        .traLoi__input textarea {
            width: 95%;
            resize: none;
            height: 50px;
            overflow-y: auto;
            padding: 5px;
        }
        .btnXoa {
            display: none;
        }
    </style>
    <script>
        $("body").find("[data-form=image]").find("imgDG").each(function () {
            $(this).imageZoom({ zoom: 200 });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ctsp-container">
        <p class="ctsp-header">Chi Tiết Sản Phẩm</p>
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
        <section class="danhGia">
            <p class="danhGia__header">
                Đánh giá sản phẩm
            </p>
            <hr />
            <div class="danhGia-container">
                <asp:Repeater ID="rptDanhGia" runat="server">
                    <ItemTemplate>
                        <div class="danhGia__row">
                            <div class="danhGia__kh">
                                <div class="danhGia_kh-row">
                                    <i class="fas fa-user-circle"></i>
                                    <p><%# Eval("TENKH") %></p>

                                </div>
                                <asp:Label ID="lbIDDG" runat="server" Text="" CssClass="lbIDBL"></asp:Label>
                                <asp:LinkButton ID="lbtnXoaDG" runat="server" CssClass="btnXoa" OnClick="lbtnXoaDG_Click" CausesValidation="false"><i class="far fa-times-circle"></i></asp:LinkButton>
                            </div>
                            <div class="danhGia__content">
                                <div class="danhGia__content-info">
                                    <p><%# Eval("SAO") %> <i class="fas fa-star"></i></p>
                                    <p><%# Eval("NGAYDG") %></p>
                                </div>
                                <hr />
                                <div class="danhGia_content-text">
                                    <p><%# Eval("NOIDUNG") %></p>
                                    <asp:Image ID="imgDG" runat="server" CssClass="imgDG" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
        <section class="binhLuan">
            <p class="binhLuan__header">
                Bình Luận
            </p>
            <hr />
            <div class="binhLuan__input-container">
                <p>Bình luận: </p>
                <div class="binhLuan__input">
                    <div class="binhLuan__input-content">
                        <asp:TextBox ID="txtBL" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <asp:LinkButton ID="lbtnBL" runat="server" OnClick="lbtnBL_Click"><i class="fas fa-paper-plane"></i></asp:LinkButton>
                    
                </div>
            </div>
            <div class="binhLuan-container">
                <asp:Repeater ID="rptBinhLuan" runat="server">
                    <ItemTemplate>
                        <div class="binhLuan__row">
                            <div class="binhLuan__kh-container">
                                <asp:Label ID="lbIDBL" runat="server" Text="" CssClass="lbIDBL"></asp:Label>
                                <div class="binhLuan__kh">
                                    <i class="fas fa-user-circle"></i>
                                    <p><%# Eval("TENKH") %></p>

                                </div>
                                <div class="binhLuan__content-info">

                                    <p><%# Eval("NGAYBL") %></p>
                                </div>
                                <asp:LinkButton ID="lbtnXoaBL" runat="server" CssClass="btnXoa" OnClick="lbtnXoaBL_Click" CausesValidation="false"><i class="far fa-times-circle"></i></asp:LinkButton>

                            </div>
                            <div class="binhLuan__content">
                                <div class="binhLuan_content-text">
                                    <p><%# Eval("NOIDUNG") %></p>

                                </div>
                            </div>
                        </div>
                        <div class="traLoi__input-container">
                <p>Trả lời: </p>
                <div class="traLoi__input">
                    <div class="traLoi__input-content">
                        <asp:TextBox ID="txtTL" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <asp:LinkButton ID="lbtnTL" runat="server" OnClick="lbtnTL_Click"><i class="fas fa-paper-plane"></i></asp:LinkButton>
                    
                </div>
            </div>
                        <asp:Repeater ID="rptTraLoi" runat="server">
                            <ItemTemplate>
                                <div class="traLoi__row">
                                    <div class="traLoi__kh-container">
                                        <asp:Label ID="lbIDTL" runat="server" Text="" CssClass="lbIDBL"></asp:Label>
                                        <div class="traLoi__kh">
                                            <i class="fas fa-user-circle"></i>
                                            <p><%# Eval("TENKH") %></p>

                                        </div>
                                        <div class="traLoi__content-info">

                                            <p><%# Eval("NGAYTL") %></p>
                                        </div>
                                        <asp:LinkButton ID="lbtnXoaTL" runat="server" CssClass="btnXoa" OnClick="lbtnXoaTL_Click" CausesValidation="false"><i class="far fa-times-circle"></i></asp:LinkButton>
                                        
                                    </div>
                                    <div class="traLoi__content">
                                        <div class="traLoi_content-text">
                                            <p><%# Eval("NOIDUNG") %></p>

                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
    </div>
</asp:Content>
