<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="PhanCaLamViec1.aspx.cs" Inherits="TeamHire.PhanCaLamViec1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
<%--        <div class="preloader flex-column justify-content-center align-items-center">
                    <img class="animation__shake" src="AdminLTE-3.2.0/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
                </div>--%>

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Phân ca công việc</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Ca làm việc</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Phân ca công việc</h3>

                                <div class="breadcrumb-item float-sm-right" style="margin-left: auto; margin-right: 30px;">
                                    <div class="dropdown">
                                        <button class="btn btn-success btn-sm dropdown-toggle" type="button" id="addNewDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-plus-circle"></i>Thêm mới
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="addNewDropdown">
                                            <a class="dropdown-item" href="PhanCaThuCong1.aspx">Thêm mới thủ công</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Thêm mới bằng Excel</a>
                                            <a class="dropdown-item" href="#">Thêm hàng loạt</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div>
                                    <asp:DataList ID="DataList1" runat="server" Style="width: 100%">
                                        <HeaderTemplate>
                                            <table class="table table-hover text-nowrap" style="width: 100%">
                                                <tr>
                                                    <th style="width: 1%">#</th>
                                                    <th style="width: 15%"> Tiêu đề</th>
                                                    <th style="width: 25%">Đối tượng áp dụng</th>
                                                    <th style="width: 15%">Thời gian áp dụng</th>
                                       
                                                    <th></th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            
                                                <td>
                                                    <asp:Label ID="lblTenCLV" runat="server" Text='<%# Eval("TenPC") %>' Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# Eval("DoiTuongApDung") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NgayBatDau") %>'></asp:Label>
                                                    <asp:Label ID="Label1" runat="server" Text=" - "></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("NgayKetThuc") %>'></asp:Label>
                                                </td>

                                                <td style="display: flex; justify-content: flex-end;">
                                                    <div style="display: flex; justify-content: flex-end;">
                                                        <a href="#">
                                                            <asp:Button ID="EditButto" runat="server" Text="Xem chi tiết" CssClass="btn btn-info btn-sm mr-2" CommandName="edit" CommandArgument='<%# Eval("MaPC") %>' />
                                                        </a>
                                                        <a>

                                                            <asp:Button ID="DeleteButto" runat="server" Text="Xóa" CssClass="btn btn-danger btn-sm" CommandName="xoa" CommandArgument='<%# Eval("MaPC") %>' />
                                                        </a>
                                                    </div>
                                                </td>
                                            
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
