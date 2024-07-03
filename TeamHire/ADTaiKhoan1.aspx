<%@ Page Title="" Language="C#" MasterPageFile="~/AdminWeb.Master" AutoEventWireup="true" CodeBehind="ADTaiKhoan1.aspx.cs" Inherits="TeamHire.ADTaiKhoan1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section__content section__content--p30">
        <div class="container-fluid">


            <div class="row">
                <div class="col-md-12">
                    <!-- DATA TABLE -->
                    <h3 class="title-5 m-b-35">Danh sách tài khoản</h3>
                    <div class="table-data__tool">
                        <div class="table-data__tool-left">
                            <div class="rs-select2--light rs-select2--md">
                                <select class="js-select2" name="property">
                                    <option selected="selected">All Properties</option>
                                    <option value="">Option 1</option>
                                    <option value="">Option 2</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                            <div class="rs-select2--light rs-select2--sm">
                                <select class="js-select2" name="time">
                                    <option selected="selected">Today</option>
                                    <option value="">3 Days</option>
                                    <option value="">1 Week</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                            <button class="au-btn-filter">
                                <i class="zmdi zmdi-filter-list"></i>filters</button>
                        </div>
                        <div class="table-data__tool-right">
                            <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                <i class="zmdi zmdi-plus"></i>add item</button>
                            <div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
                                <select class="js-select2" name="type">
                                    <option selected="selected">Export</option>
                                    <option value="">Option 1</option>
                                    <option value="">Option 2</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive table-responsive-data2">
                        <div>
                            <div class="card-body">
                                <div>
                                    <asp:DataList ID="DataList1" runat="server" Style="width: 100%">
                                        <HeaderTemplate>
                                            <table class="table table-data2 table-hover text-nowrap" style="width: 100%">
                                                <tr>
                                                    <th style="width: 1%"></th>
                                                    <th style="width: 20%; text-align: center;">Tên người dùng</th>
                                                    <th style="width: 25%">Thông tin liên hệ</th>
                                                    <th style="width: 15%">Business Premium</th>
                                                    <th style="width: 15%">Giới tính</th>
                                                    <th></th>
                                                </tr>
                                                <tr class="spacer">
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <td style="border-bottom: 2px solid #999999;">
                                                <div style="text-align: center;">
                                                    <div style="width: 60px; height: 60px; border-radius: 50%; overflow: hidden; border: 2px solid #A9A9A9; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); margin: 0 auto;">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../assets/images/"+ Eval("avatar") %>' />
                                                    </div>
                                                    <asp:Label ID="lblTenCLV" runat="server" Text='<%# Eval("tennguoidung") %>' Font-Bold="True"></asp:Label>
                                                </div>
                                            </td>
                                            <td style="border-bottom: 2px solid #999999;">
                                                <asp:Label ID="Label1" runat="server" Text="Gmail: "></asp:Label>
                                                <asp:Label runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                <br />
                                                                                                <asp:Label ID="Label4" runat="server" Text="SDT: "></asp:Label>
                                                <asp:Label runat="server" Text='<%# Eval("sodienthoai") %>'>không có</asp:Label>
                                                                                                <br />
                                                                                                <asp:Label ID="Label5" runat="server" Text="Địa chỉ: "></asp:Label>
                                                <asp:Label runat="server" Text='<%# Eval("diachi") %>'>không có</asp:Label>
                                            </td>
                                            <td style="border-bottom: 2px solid #999999;">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("LoaiDanhNghiep") %>'></asp:Label>
                                            </td>
                                                                                        <td style="border-bottom: 2px solid #999999;">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("gioitinh") %>'></asp:Label>
                                            </td>
                                            <td style="border-bottom: 2px solid #999999;">
                                                <%--                                                    <div style="display: flex; justify-content: flex-end;">
                                                        <a href="#">
                                                            <asp:Button ID="EditButto" runat="server" Text="Xem chi tiết" CssClass="btn btn-info btn-sm mr-2" CommandName="edit" CommandArgument='<%# Eval("MaPC") %>' />
                                                        </a>
                                                        <a>

                                                            <asp:Button ID="DeleteButto" runat="server" Text="Xóa" CssClass="btn btn-danger btn-sm" CommandName="xoa" CommandArgument='<%# Eval("MaPC") %>' />
                                                        </a>
                                                    </div>--%>
                                                <div class="table-data-feature">
                                                    <div class="item" style="position: relative;" data-toggle="tooltip" data-placement="top" title="Nâng cấp vip">
                                                        <i class="zmdi zmdi-mail-send"></i>
                                                        <asp:Button ID="Button3" runat="server" Text="" CssClass="btn item" CommandName="edit" CommandArgument='<%# Eval("username") %>' Style="position: relative; z-index: 1; background-color: rgba(0, 0, 0, 0);" />
                                                    </div>
                                                    <div class="item" style="position: relative;" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa">
                                                        <i class="zmdi zmdi-edit"></i>
                                                        <asp:Button ID="Button1" runat="server" Text="" CssClass="btn item" CommandName="edit" CommandArgument='<%# Eval("username") %>' Style="position: relative; z-index: 1; background-color: rgba(0, 0, 0, 0);" />
                                                    </div>
                                                    <div class="item" style="position: relative;"  data-toggle="tooltip" data-placement="top" title="Xóa">
                                                        <i class="zmdi zmdi-delete"></i>
                                                        <asp:Button ID="DeleteButto" runat="server" Text="" CssClass="btn item" CommandName="xoa" CommandArgument='<%# Eval("username") %>' Style="position: relative; z-index: 1; background-color: rgba(0, 0, 0, 0);" />
                                                    </div>

                                                    <div class="item" style="position: relative;"  data-toggle="tooltip" data-placement="top" title="Xem chi tiết">
                                                        <i class="zmdi zmdi-more"></i>
                                                        <asp:Button ID="Button2" runat="server" Text="" CssClass="btn item" CommandName="xoa" CommandArgument='<%# Eval("username") %>' Style="position: relative; z-index: 1; background-color: rgba(0, 0, 0, 0);" />
                                                    </div>
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
                            <%--<thead>
                                            <tr>
                                                <th>
                                                    <label class="au-checkbox">
                                                        <input type="checkbox">
                                                        <span class="au-checkmark"></span>
                                                    </label>
                                                </th>
                                                <th>name</th>
                                                <th>email</th>
                                                <th>description</th>
                                                <th>date</th>
                                                <th>status</th>
                                                <th>price</th>
                                                <th></th>
                                            </tr>
                                        </thead>--%>
                            <%--<tbody>
                                            <tr class="tr-shadow">
                                                <td>
                                                    <label class="au-checkbox">
                                                        <input type="checkbox">
                                                        <span class="au-checkmark"></span>
                                                    </label>
                                                </td>
                                                <td>Lori Lynch</td>
                                                <td>
                                                    <span class="block-email">lori@example.com</span>
                                                </td>
                                                <td class="desc">Samsung S8 Black</td>
                                                <td>2018-09-27 02:12</td>
                                                <td>
                                                    <span class="status--process">Processed</span>
                                                </td>
                                                <td>$679.00</td>
                                                <td>
                                                    <div class="table-data-feature">
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                            <i class="zmdi zmdi-mail-send"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                            <i class="zmdi zmdi-edit"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="More">
                                                            <i class="zmdi zmdi-more"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="spacer"></tr>
                                            <tr class="tr-shadow">
                                                <td>
                                                    <label class="au-checkbox">
                                                        <input type="checkbox">
                                                        <span class="au-checkmark"></span>
                                                    </label>
                                                </td>
                                                <td>Lori Lynch</td>
                                                <td>
                                                    <span class="block-email">john@example.com</span>
                                                </td>
                                                <td class="desc">iPhone X 64Gb Grey</td>
                                                <td>2018-09-29 05:57</td>
                                                <td>
                                                    <span class="status--process">Processed</span>
                                                </td>
                                                <td>$999.00</td>
                                                <td>
                                                    <div class="table-data-feature">
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                            <i class="zmdi zmdi-mail-send"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                            <i class="zmdi zmdi-edit"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="More">
                                                            <i class="zmdi zmdi-more"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="spacer"></tr>
                                            <tr class="tr-shadow">
                                                <td>
                                                    <label class="au-checkbox">
                                                        <input type="checkbox">
                                                        <span class="au-checkmark"></span>
                                                    </label>
                                                </td>
                                                <td>Lori Lynch</td>
                                                <td>
                                                    <span class="block-email">lyn@example.com</span>
                                                </td>
                                                <td class="desc">iPhone X 256Gb Black</td>
                                                <td>2018-09-25 19:03</td>
                                                <td>
                                                    <span class="status--denied">Denied</span>
                                                </td>
                                                <td>$1199.00</td>
                                                <td>
                                                    <div class="table-data-feature">
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                            <i class="zmdi zmdi-mail-send"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                            <i class="zmdi zmdi-edit"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="More">
                                                            <i class="zmdi zmdi-more"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="spacer"></tr>
                                            <tr class="tr-shadow">
                                                <td>
                                                    <label class="au-checkbox">
                                                        <input type="checkbox">
                                                        <span class="au-checkmark"></span>
                                                    </label>
                                                </td>
                                                <td>Lori Lynch</td>
                                                <td>
                                                    <span class="block-email">doe@example.com</span>
                                                </td>
                                                <td class="desc">Camera C430W 4k</td>
                                                <td>2018-09-24 19:10</td>
                                                <td>
                                                    <span class="status--process">Processed</span>
                                                </td>
                                                <td>$699.00</td>
                                                <td>
                                                    <div class="table-data-feature">
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                            <i class="zmdi zmdi-mail-send"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                            <i class="zmdi zmdi-edit"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="More">
                                                            <i class="zmdi zmdi-more"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>--%>
                        </div>
                    </div>
                    <!-- END DATA TABLE -->
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>Đội ngũ phát triển phần mềm. Nhóm 6 SE 447 A <a href="#">Khoan CNTT</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
