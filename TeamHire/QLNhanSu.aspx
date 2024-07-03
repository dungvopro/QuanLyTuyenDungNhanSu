<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLNhanSu.aspx.cs" Inherits="TeamHire.QLNhanSu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Danh sách nhân viên</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a class="btn btn-success btn-sm" href="ThemNhanVien1.aspx">
                                <i class="fas fa-plus-circle"></i>
                                Thêm mới
                            </a></li>
                            <li class="breadcrumb-item active">Có 2 nhân viên trong danh sách</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Projects</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body p-0">
                    <table class="table table-striped projects">
                        <thead>
                            <tr>
                                <th style="width: 10%">Mã Nhân viên
                                </th>
                                <th style="width: 15%">Tên nhân viên
                                </th>
                                <th style="width: 25%">Nhóm làm việc
                                </th>
                                <th style="width: 10%">Vai trò
                                </th>
                                <th style="width: 8%" class="text-center">Trạng thái
                                </th>
                                <th style="width: 20%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:DataList ID="DataList1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td style="width: 10%">
                                            <asp:Label runat="server" Text='<%#"ㅤㅤㅤ#"+ Eval("MaNV") %>'></asp:Label>
                                        </td>
                                        <td style="width: 15%">
                                            <a>
                                                <asp:Label runat="server" Text='<%# Eval("TenNV") %>'></asp:Label>
                                            </a>
                                            <br />
                                            <small>Created 01.01.2019
                                            </small>
                                        </td>
                                        <td style="width: 30%">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <img alt="Avatar" class="img-circle elevation-2" src="../AdminLTE-3.2.0/dist/img/avatar.png" width="40px" height="40px">
                                                </li>
                                                <li class="list-inline-item">
                                                    <img alt="Avatar" class="img-circle elevation-2" src="../AdminLTE-3.2.0/dist/img/avatar2.png" width="40px" height="40px">
                                                </li>
                                                <li class="list-inline-item">
                                                    <img alt="Avatar" class="img-circle elevation-2" src="../AdminLTE-3.2.0/dist/img/avatar3.png" width="40px" height="40px">
                                                </li>
                                                <li class="list-inline-item">
                                                    <img alt="Avatar" class="img-circle elevation-2" src="../AdminLTE-3.2.0/dist/img/avatar4.png" width="40px" height="40px">
                                                </li>
                                            </ul>
                                        </td>
                                        <td style="width: 14%">
                                            <a>
                                                <asp:Label runat="server" Text='<%# Eval("TenCV") %>'></asp:Label>
                                            </a>


                                        </td>
                                        <td class="project-state" style="width: 5%">
                                            <span class="badge badge-success">
                                                <asp:Label runat="server" Text='<%# Eval("TrangThaiNhanSu") %>'></asp:Label>
                                            </span>
                                        </td>
                                        <td class="project-actions text-right" style="width: 25%">
                                            <a class="btn btn-primary btn-sm" href="#">
                                                <i class="fas fa-folder"></i>
                                                <asp:Button ID="ViewButton" runat="server" Text="Chi tiết" CssClass="btn btn-primary btn-sm" CommandName="edit" CommandArgument='<%# Eval("MaNV") %>' OnClick="ViewButton_Click" />
                                            </a>
                                            <a class="btn btn-info btn-sm" href="#">
                                                <i class="fas fa-pencil-alt"></i>
                                                <asp:Button ID="EditButton" runat="server" Text="Chinh sửa" CssClass="btn btn-info btn-sm" CommandName="edit" CommandArgument='<%# Eval("MaNV") %>' OnClick="EditButton_Click" />
                                            </a>
                                            <a class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash"></i>
                                                <asp:Button ID="DeleteButton" runat="server" Text="Xóa" CssClass="btn btn-danger btn-sm" CommandName="edit" CommandArgument='<%# Eval("MaNV") %>' OnClick="DeleteButton_Click" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?');" />
                                            </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:DataList>
                        </tbody>
                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-right">
                                <li class="page-item">
                                    <asp:LinkButton ID="btnTruoc" runat="server" OnClick="btnTruoc_Click" class="page-link" Text="&laquo;"></asp:LinkButton></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <asp:LinkButton ID="btnSau" runat="server" OnClick="btnSau_Click" class="page-link" Text="&raquo;"></asp:LinkButton></li>
                            </ul>
                        </div>
                        <asp:Label ID="lbTB" runat="server" Text=""></asp:Label>

                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

        </section>
        <!-- /.content -->
    </div>
    <!-- Thư viện SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
    function confirmDelete() {
        return Swal.fire({
            title: 'Bạn có chắc chắn muốn xóa?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                return true; // Tiếp tục gửi sự kiện `OnClick` đến máy chủ
            } else {
                return false; // Ngăn chặn sự kiện `OnClick`
            }
        });
    }
</script>
    <script src="AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
</asp:Content>
