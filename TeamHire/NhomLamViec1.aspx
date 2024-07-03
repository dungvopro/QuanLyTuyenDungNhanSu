<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="NhomLamViec1.aspx.cs" Inherits="TeamHire.NhomLamViec1" %>

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
                        <h1>Nhóm làm việc</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="QLThongKe1.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Nhóm làm việc</li>
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

                        <div class="card card-lightblue">
                            <div class="card-header">
                                <h3 class="card-title">Danh sách nhóm làm việc</h3>

                                <div class="breadcrumb-item float-sm-right" style="margin-left: auto; margin-right: 30px;">
                                    <div class="dropdown">
                                        <button class="btn btn-success btn-sm dropdown-toggle" type="button" id="addNewDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-plus-circle"></i>Thêm mới
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="addNewDropdown">
                                            <a class="dropdown-item" href="PhanNhomLamViec1.aspx" style="color: #3c8dbc;">Thêm mới 1 nhóm</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#" style="color: #3c8dbc;">Thêm mới bằng Excel</a>
                                            <a class="dropdown-item" href="#" style="color: #3c8dbc;">Thêm hàng loạt</a>
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
                                                    <th style="width: 15%">Tên nhóm</th>
                                                    <th style="width: 25%">Thành viên nhóm</th>
                                                    <th style="width: 15%">Ngày lập nhóm</th>
                                                    <th style="width: 15%">Tiến độ dự án</th>
                                                    <th></th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <td>
                                                <div>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../assets/images/"+ Eval("HinhAnhN") %>' Style="width: 60px; height: 60px; border-radius: 50%; overflow: hidden; border: 2px solid #A9A9A9; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); margin: 0 auto;" />
                                                </div>
                                                <asp:Label ID="lblTenCLV" runat="server" Text='<%# Eval("TenNLV") %>' Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DataList ID="DataListMembers" runat="server" DataSource='<%# GetMembers(Eval("MaNLV")) %>' RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <%# Container.ItemIndex < 4 ? 
            string.Format("<img src='../assets/images/{0}' style='width: 40px; height: 40px; border-radius: 50%; margin-right: 10px;'>", Eval("HinhAnh")) :
            Container.ItemIndex == 4 ?
            "<img src='../assets/images/ThemAnh.jpg' style='width: 40px; height: 40px; border-radius: 50%; margin-right: 10px;'>" : ""
                                                        %>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NgayTao") %>'></asp:Label>
                                            </td>
                                            <td class="project_progress">
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 1%">
                                                    </div>
                                                </div>
                                                <small>1% Complete
                          </small>
                                            </td>
                                            <td style="display: flex; justify-content: flex-end;">
                                                <div style="display: flex; justify-content: flex-end;">
                                                    <a>
                                                        <asp:Button ID="Button2" runat="server" Text="Giao nhiệm vụ" CssClass="btn btn-primary btn-sm mr-2" CommandName="edit" CommandArgument='<%# Eval("MaNLV") %>' BackColor="#CC99FF" />
                                                    </a>
                                                    <a>
                                                        <asp:Button ID="EditButto" runat="server" Text="Xem chi tiết" CssClass="btn btn-primary btn-sm mr-2" CommandName="edit" CommandArgument='<%# Eval("MaNLV") %>' />
                                                    </a>
                                                    <a>
                                                        <asp:Button ID="Button1" runat="server" Text="Cập nhật" CssClass="btn btn-info btn-sm mr-2" CommandName="edit" CommandArgument='<%# Eval("MaNLV") %>' />
                                                    </a>
                                                    <a>
                                                        <asp:Button ID="DeleteButto" runat="server" Text="Xóa" CssClass="btn btn-danger btn-sm" CommandName="xoa" CommandArgument='<%# Eval("MaNLV") %>' />
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
