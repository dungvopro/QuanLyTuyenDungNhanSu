<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="CaLamViec1.aspx.cs" Inherits="TeamHire.CaLamViec1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-button {
            display: inline-block;
            vertical-align: middle;
            position: relative;
            width: 60px;
            height: 30px;
            background-color: #ccc;
            border-radius: 15px;
            cursor: pointer;
            overflow: hidden;
        }

            .custom-button input[type="checkbox"] {
                position: absolute;
                opacity: 0;
                width: 0;
                height: 0;
            }

        .button-slider {
            position: absolute;
            top: 2px;
            left: 2px;
            width: 26px;
            height: 26px;
            background-color: #fff;
            border-radius: 50%;
            transition: transform 0.3s, background-color 0.3s;
        }

        .custom-button input:checked + .button-slider {
            transform: translateX(30px);
            background-color: #2196F3;
        }

        .button-label {
            position: absolute;
            top: 50%;
            left: 4px;
            transform: translateY(-50%);
            color: #fff;
            font-size: 12px;
            font-weight: bold;
            transition: opacity 0.3s;
        }

        .custom-button input:checked + .button-slider + .button-label.on {
            opacity: 1;
            left: 35px; /* Tăng giá trị left để đưa nhãn vào vị trí hiển thị */
        }

        .custom-button input:checked + .button-slider + .button-label.off {
            opacity: 0;
            left: -24px; /* Giảm giá trị left để ẩn nhãn */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Ca làm việc</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">ca làm việc</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div>
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Danh sách ca làm việc</h3>

                                <div class="breadcrumb-item float-sm-right" style="margin-left: auto; margin-right: 30px;">
                                    <div class="dropdown">
                                        <button class="btn btn-success btn-sm dropdown-toggle" type="button" id="addNewDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-plus-circle"></i>Thêm Ca mới
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="addNewDropdown">
                                            <a class="dropdown-item" href="CaHanhChinh1.aspx">Ca hành chính</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="CaDon1.aspx">Ca đơn</a>
                                            <a class="dropdown-item" href="#">Ca nâng cao</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">

                                <div>
                                    <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound" Style="width: 100%">
                                        <HeaderTemplate>
                                            <table class="table table-hover text-nowrap" style="width: 100%">
                                                <tr>
                                                    <th style="width: 10%">Trạng thái</th>
                                                    <th style="width: 15%">Tên ca làm việc</th>
                                                    <th style="width: 15%">Giờ làm việc</th>
                                                    <th style="width: 10%">Số công</th>
                                                    <th style="width: 20%">Điều kiện xin nghỉ</th>
                                                    <th style="width: 10%">Loại ca</th>
                                                    <th></th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <label class="custom-button">
                                                        <asp:CheckBox ID="myCheck" runat="server" OnCheckedChanged="myCheck_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                                                        <span class="button-slider"></span>
                                                        <span class="button-label on">ON</span>
                                                        <span class="button-label on" style="color: #CCCCCC">OFF</span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblTenCLV" runat="server" Text='<%# Eval("TenCLV") %>' Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# ((TimeSpan)Eval("ThoiGianBatDau")).ToString("hh\\:mm") %>'></asp:Label>
                                                    <asp:Label ID="Label1" runat="server" Text=" - "></asp:Label>
                                                    <asp:Label runat="server" Text='<%# ((TimeSpan)Eval("ThoiGianKetThuc")).ToString("hh\\:mm") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# Eval("SoCongTinh") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# Eval("DieuKienXinNghi") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# Eval("Loai") %>'></asp:Label>
                                                </td>
                                                <td style="display: flex; justify-content: flex-end;">
                                                    <div style="display: flex; justify-content: flex-end;">
                                                        <a href="#">

                                                            <asp:Button ID="EditButto" runat="server" Text="Xem chi tiết" CssClass="btn btn-info btn-sm mr-2" CommandName="edit" CommandArgument='<%# Eval("MaCLV") %>' />
                                                        </a>
                                                        <a>

                                                            <asp:Button ID="DeleteButto" runat="server" Text="Chỉnh sửa" CssClass="btn btn-danger btn-sm" CommandName="xoa" CommandArgument='<%# Eval("MaCLV") %>' />
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:DataList>
                                </div>

                                <div class="card-footer">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item">
                                            <asp:LinkButton ID="btnTruoc" runat="server" OnClick="btnTruoc_Click" CssClass="page-link" Text="&laquo;"></asp:LinkButton>
                                        </li>
                                        <li class="page-item">
                                            <asp:LinkButton ID="lnkPage1" runat="server" OnClick="lnkPage_Click" CssClass="page-link" Text="1" CommandArgument="1"></asp:LinkButton>
                                        </li>
                                        <li class="page-item">
                                            <asp:LinkButton ID="lnkPage2" runat="server" OnClick="lnkPage_Click" CssClass="page-link" Text="2" CommandArgument="2"></asp:LinkButton>
                                        </li>
                                        <li class="page-item">
                                            <asp:LinkButton ID="lnkPage3" runat="server" OnClick="lnkPage_Click" CssClass="page-link" Text="3" CommandArgument="3"></asp:LinkButton>
                                        </li>
                                        <li class="page-item">
                                            <asp:LinkButton ID="btnSau" runat="server" OnClick="btnSau_Click" CssClass="page-link" Text="&raquo;"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
    </div>
    <script src="AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
</asp:Content>
