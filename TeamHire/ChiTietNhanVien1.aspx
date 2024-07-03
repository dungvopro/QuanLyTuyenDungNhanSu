<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="ChiTietNhanVien1.aspx.cs" Inherits="TeamHire.ChiTietNhanVien1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .password-container {
            position: relative;
        }

        .password-textbox {
            border: none;
            background-color: transparent;
            font-family: inherit;
            font-size: inherit;
            color: inherit;
            outline: none;
            padding: 0;
            margin: 0;
        }

        .password-toggle {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
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
                        <h1>Hồ sơ nhân viên</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Hồ sơ nhân viên</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <asp:Image ID="Image1" runat="server" class="profile-user-img img-fluid img-circle" />
                                </div>

                                <h3 class="profile-username text-center">
                                    <asp:Label ID="tennv" runat="server" Text="Dũng Võ" Font-Bold="True"></asp:Label>
                                </h3>



                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>Mã nhân viên:</b> <a class="float-right">
                                            <asp:Label ID="Manv" runat="server" Text="dungvo" ForeColor="#333333"></asp:Label>
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Username:</b> <a class="float-right">
                                            <asp:Label ID="User" runat="server" Text="dungvo" ForeColor="#333333"></asp:Label>
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Password:</b><a class="float-right">
                                        <div class="password-container">
                                            <asp:Label ID="passw" runat="server" ForeColor="#333333" ></asp:Label>
                                            <asp:TextBox ID="passst" runat="server" CssClass="password-textbox " TextMode="Password" ForeColor="#333333" Width="100px"></asp:TextBox>
                                            <i class="password-toggle fas fa-eye"></i>
                                        </div></a>
                                    </li>
                                </ul>
                                <asp:Button ID="Button1" runat="server" Text="Đổi mật khẩu" class="btn btn-primary btn-block" />
                                <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                        <!-- About Me Box -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Thông tin ngân hàng</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <strong><i class="fas fa-book mr-1"></i>Ngân hàng:</strong>

                                <p class="text-muted">
                                    <asp:Label ID="tennganhan" runat="server" Text="dungvo" ForeColor="#333333"></asp:Label>
                                </p>

                                <hr>

                                <strong><i class="fas fa-map-marker-alt mr-1"></i>Chi nhánh</strong>

                                <p class="text-muted">
                                    <asp:Label ID="ChiNhan" runat="server" Text="dungvo" ForeColor="#333333"></asp:Label>
                                </p>

                                <hr>

                                <strong><i class="fas fa-pencil-alt mr-1"></i>Số tài khoản:</strong>

                                <p class="text-muted">
                                    <asp:Label ID="stk" runat="server" Text="dungvo" ForeColor="#333333"></asp:Label>
                                </p>

                                <hr>

                                <strong><i class="far fa-file-alt mr-1"></i>Ghi chú:</strong>

                                <p class="text-muted">
                                    <asp:Label ID="Ghich" runat="server" ForeColor="#333333"></asp:Label>
                                </p>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Thông tin chi tiết</a></li>
                                </ul>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="active tab-pane" id="activity">
                                        <ul class="list-group list-group-unbordered mb-3">
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Số điện thoại:</b>
                                                        <asp:Label ID="sdtt" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Gmail:</b>
                                                        <asp:Label ID="email" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Địa chỉ:</b>
                                                        <asp:Label ID="diach" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Số CCCD/CMND/Hộ chiếu:</b>
                                                        <asp:Label ID="cccd" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Nơi cấp:</b>
                                                        <asp:Label ID="noica" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Ngày cấp:</b>
                                                        <asp:Label ID="ngayca" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Học vấn:</b>
                                                        <asp:Label ID="hocva" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Trường học:</b>
                                                        <asp:Label ID="truongho" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Chuyên ngành</b>
                                                        <asp:Label ID="chuyennha" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Giới tính:</b>
                                                        <asp:Label ID="gioitin" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Tình trang hôn nhân:</b>
                                                        <asp:Label ID="honnhan" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Ngày sinh:</b>
                                                        <asp:Label ID="ngaysi" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Ngày tuyển dụng:</b>
                                                        <asp:Label ID="Label2" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                
                                                <div class="col">
                                                        <b>Phân quyền:</b>
                                                        <!--<asp:TextBox ID="TextBox6" runat="server" placeholder="Phân quyền" CssClass="form-control datepicker" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>-->
                                                        <asp:Label ID="Label6" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Chức vụ:</b>
                                                        <asp:Label ID="Label3" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Trạng thái nhân sự:</b>
                                                        <!--<asp:TextBox ID="TextBox7" runat="server" placeholder="Trạng thái nhân sự" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>-->
                                                        <asp:Label ID="Label4" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                    <div class="col">
                                                        <b>Loại hình nhân sự:</b>
                                                        <!--<asp:TextBox ID="TextBox11" runat="server" placeholder="Loại hình nhân sự" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>-->
                                                        <asp:Label ID="Label5" runat="server" ForeColor="#333333"></asp:Label>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Mô tả:</b>
                                                        <textarea id="myTextarea" runat="server" class="form-control" style="width: 100%; height: 200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                </div>
                            </div>

                            <!-- /.card-body -->
                        </div>
                        <div style="text-align: right;">
                            <asp:Button ID="Button3" runat="server" Text="Quay trở lại" class="btn btn-secondary"  OnClick="quaylai_Click"/>
                            <asp:Button ID="Button2" runat="server" Text="Chỉnh sửa" class="btn btn-primary" OnClick="chinhsua_Click" OnClientClick="return validateForm();" />
                        </div>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <!-- /.card -->
                    </div>

                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <script type="text/javascript">
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('Image1').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <%--<script>
        function showCheckboxList() {
            var checkboxList = document.getElementById("<%= checkboxList.ClientID %>");
            if (checkboxList.style.display === "none") {
                checkboxList.style.display = "block";
            } else {
                checkboxList.style.display = "none";
            }
        }
    </script>--%>
   <script>
    var passwordTextbox = document.getElementById('<%= passst.ClientID %>');
    var passwordToggle = document.querySelector('.password-toggle');
    var passwordLabel = document.getElementById('<%= passw.ClientID %>');
       passwordLabel.style.visibility = 'hidden';
       passwordTextbox.value = passwordLabel.textContent;
    passwordToggle.addEventListener('click', function () {
        if (passwordTextbox.type === 'password') {
            passwordTextbox.type = 'text';
            passwordToggle.classList.remove('fa-eye');
            passwordToggle.classList.add('fa-eye-slash');
            passwordLabel.style.display = 'none';
            passwordLabel.style.visibility = 'hidden';
        } else {
            passwordTextbox.type = 'password';
            passwordToggle.classList.remove('fa-eye-slash');
            passwordToggle.classList.add('fa-eye');
            passwordLabel.style.display = 'none';
            passwordLabel.style.visibility = 'hidden';
        }
    });
</script>
    <script src="AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
</asp:Content>
