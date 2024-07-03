<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="ChinhSuaNhanVien1.aspx.cs" Inherits="TeamHire.ChinhSuaNhanVien1" %>

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
                        <h1>Chỉnh sửa nhân viên</h1>
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
                                <asp:FileUpload ID="fileUploader" runat="server" onchange="previewImage(this);" />
                                <h3 class="profile-username text-center">
                                    <asp:Label ID="Label2" runat="server" Text="Họ và tên:" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="tennv" runat="server" placeholder="Họ và tên" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                </h3>


                                <asp:Panel ID="panel1" runat="server">
                                    <ul id="ul1" class="list-group list-group-unbordered mb-3" visible="true">
                                        <li class="list-group-item">
                                            <b>Mã nhân viên:</b> <a class="float-right">
                                                <asp:TextBox ID="man1v" runat="server" placeholder="Nhập lại mật khẩu" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;" Enabled="False"></asp:TextBox>
                                            </a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Username:</b> <a class="float-right">
                                                <asp:TextBox ID="User" runat="server" placeholder="Tên đăng nhập" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;" Enabled="False"></asp:TextBox></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Password:</b><a class="float-right">
                                                <div class="password-container">
                                                    <asp:Label ID="pas" runat="server" ForeColor="#333333"></asp:Label>
                                                    <asp:TextBox ID="passst" runat="server" CssClass="password-textbox " TextMode="Password" ForeColor="#333333" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;" Enabled="False"></asp:TextBox>
                                                    <i class="password-toggle fas fa-eye"></i>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </asp:Panel>
                                <asp:Panel ID="panel2" runat="server" Visible="false">
                                    <ul class="list-group list-group-unbordered mb-3">
                                        <li class="list-group-item">
                                            <b>Mật khẩu admin:</b> <a class="float-right">
                                                <asp:TextBox ID="passadmin" runat="server" placeholder="Mật khẩu admin" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                            </a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Mật khẩu mới:</b> <a class="float-right">
                                                <asp:TextBox ID="mkso1" runat="server" placeholder="Mật khẩu mới" TextMode="Password" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Nhập lại mật khẩu:</b><a class="float-right">
                                                    <asp:TextBox ID="mkso2" runat="server" placeholder="Nhập lại mật khẩu" TextMode="Password" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;" ></asp:TextBox>
                                            </a>
                                        </li>
                                    </ul>
                                    <div style="text-align: center;">
                                        <asp:Button ID="Button4" runat="server" Text="Hủy" CssClass="btn btn-secondary" OnClick="huymk_Click" />
                                        <asp:Button ID="Button5" runat="server" Text="Xác nhận" CssClass="btn btn-primary" OnClick="xacnhanmk_Click" OnClientClick="return confirm('Bạn có chắc chắn muốn đổi mật khẩu?');" />
                                    </div>
                                </asp:Panel>
                                <asp:Button ID="Button1" runat="server" Text="Đổi mật khẩu" class="btn btn-primary btn-block" OnClick="Button1_Click" />
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
                                    <asp:TextBox ID="tennganhan" runat="server" placeholder="Ngân hàng" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                </p>

                                <hr>

                                <strong><i class="fas fa-map-marker-alt mr-1"></i>Chi nhánh</strong>

                                <p class="text-muted">
                                    <asp:TextBox ID="ChiNhan" runat="server" placeholder="Chi nhánh" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                </p>

                                <hr>

                                <strong><i class="fas fa-pencil-alt mr-1"></i>Số tài khoản:</strong>

                                <p class="text-muted">
                                    <asp:TextBox ID="stk" runat="server" placeholder="Số tài khoản" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                </p>

                                <hr>

                                <strong><i class="far fa-file-alt mr-1"></i>Ghi chú:</strong>

                                <p class="text-muted">
                                    <asp:TextBox ID="Ghich" runat="server" placeholder="Ghi chú" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
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
                                    <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Thông tin nhân viên</a></li>
                                    <li class="nav-item"><a class="nav-link " href="#timeline" data-toggle="tab">Tình trạng công việc</a></li>
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
                                                        <asp:TextBox ID="sdtt" runat="server" placeholder="Số điện thoại" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                    <div class="col">
                                                        <b>Gmail:</b>
                                                        <asp:TextBox ID="email" runat="server" placeholder="Gmail" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                    <div class="col">
                                                        <b>Địa chỉ:</b>
                                                        <asp:TextBox ID="diach" runat="server" placeholder="Địa chỉ" CssClass="form-control datepicker" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Số CCCD/CMND/Hộ chiếu:</b>
                                                        <asp:TextBox ID="cccd" runat="server" placeholder="Số CCCD/CMND/Hộ chiếu" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                    <div class="col">
                                                        <b>Nơi cấp:</b>
                                                        <asp:TextBox ID="noica" runat="server" placeholder="Nơi cấp" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                    <div class="col">
                                                        <b>Ngày cấp:</b>
                                                        <asp:TextBox ID="ngayca" runat="server" placeholder="Ngày cấp(mm/dd/yyyy)" CssClass="form-control datepicker" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Học vấn:</b>
                                                        <asp:TextBox ID="hocva" runat="server" placeholder="Học vấn" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                    <div class="col">
                                                        <b>Trường học:</b>
                                                        <asp:TextBox ID="truongho" runat="server" placeholder="Trường học" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                    <div class="col">
                                                        <b>Chuyên ngành</b>
                                                        <asp:TextBox ID="chuyennha" runat="server" placeholder="Chuyên ngành" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Giới tính:</b>

                                                        <select name="gioitinh" class="form-control tm-select" id="gioitin" runat="server" style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;">
                                                            <option value="0" disabled selected style="color: #999;">Giới tính</option>
                                                            <option value="Nam">Nam</option>
                                                            <option value="Nữ">Nữ</option>
                                                            <option value="Khác">Khác</option>
                                                        </select>
                                                    </div>
                                                    <div class="col">
                                                        <b>Tình trang hôn nhân:</b>

                                                        <select name="tthn" class="form-control tm-select" id="honnhan" runat="server" style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;">
                                                            <option value="0" disabled selected style="color: #999;">Tình trạng hôn nhân</option>
                                                            <option value="Độc thân">Độc thân</option>
                                                            <option value="Đã kết hôn">Đã kết hôn</option>
                                                            <option value="Ly hôn">Ly hôn</option>
                                                            <option value="Góa">Góa</option>
                                                            <option value="Đang có người iu">Đang có người iu</option>
                                                        </select>
                                                    </div>
                                                    <div class="col">
                                                        <b>Ngày sinh:</b>
                                                        <asp:TextBox ID="ngaysi" runat="server" placeholder="Ngày sinh(mm/dd/yyyy)" CssClass="form-control datepicker" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
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
                                    <div class="tab-pane" id="timeline">
                                        <ul class="list-group list-group-unbordered mb-3">
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Ngày tuyển dụng:</b>
                                                        <asp:TextBox ID="alll" runat="server" placeholder="Ngày tuyển dụng" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Chức vụ:</b>
                                                        <select name="chucvu" class="form-control tm-select" id="Label3" runat="server" style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;">
                                                            <option value="0" disabled selected style="color: #999;">Chức vụ</option>
                                                            <option value="1">CEO/ Founder/ Chủ tịch</option>
                                                            <option value="2">Giám đốc</option>
                                                            <option value="3">Quản lý</option>
                                                            <option value="4">Nhân viên</option>
                                                            <option value="5">Vị trí khác</option>
                                                        </select>
                                                    </div>
                                                    <div class="col">
                                                        <b>Phân quyền:</b>
                                                        <!--<asp:TextBox ID="TextBox6" runat="server" placeholder="Phân quyền" CssClass="form-control datepicker" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>-->
                                                        <asp:TextBox ID="permissionInput" CssClass="form-control" placeholder="Phân quyền" onclick="showCheckboxList()" runat="server"></asp:TextBox>
                                                        <div id="checkboxList" style="display: none;" runat="server">
                                                            <asp:CheckBoxList ID="permissionList" runat="server" Style="color: #888888;">
                                                                <asp:ListItem Text="Quản lý nhân viên" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Quản lý lịch nhân viên" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Thống kê" Value="3"></asp:ListItem>
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                </div>

                                            </li>
                                            <li class="list-group-item">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <b>Trạng thái nhân sự:</b>
                                                        <!--<asp:TextBox ID="TextBox7" runat="server" placeholder="Trạng thái nhân sự" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>-->
                                                        <select name="ttns" class="form-control tm-select" id="Label4" runat="server" style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;">
                                                            <option value="0" disabled selected style="color: #999;">Trạng thái nhân sự</option>
                                                            <option value="Sắp đi làm">Sắp đi làm</option>
                                                            <option value="Đang đi làm">Đang đi làm</option>
                                                            <option value="Nghỉ không lương dài hạn">Nghỉ không lương dài hạn</option>
                                                            <option value="Nghỉ thai sản">Nghỉ thai sản</option>
                                                            <option value="Nghỉ hưu">Nghỉ hưu</option>
                                                        </select>
                                                    </div>
                                                    <div class="col">
                                                        <b>Loại hình nhân sự:</b>
                                                        <!--<asp:TextBox ID="TextBox11" runat="server" placeholder="Loại hình nhân sự" CssClass="form-control" Style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></asp:TextBox>-->
                                                        <select name="lhns" class="form-control tm-select" id="Label5" runat="server" style="border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;">
                                                            <option value="0" disabled selected style="color: #999;">Loại hình nhân sự</option>
                                                            <option value="Chính thức">Chính thức</option>
                                                            <option value="Thử việc">Thử việc</option>
                                                            <option value="Thực tập">Thực tập</option>
                                                            <option value="Cộng tác viên">Cộng tác viên</option>
                                                            <option value="Học việc">Học việc</option>
                                                        </select>
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
                            <asp:Button ID="Button3" runat="server" Text="Quay trở lại" class="btn btn-secondary" OnClick="huycn_Click" />
                            <asp:Button ID="Button2" runat="server" Text="Cập nhật" class="btn btn-primary" OnClick="cn_Click" OnClientClick="return validateForm();" />
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
        <script>
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var image2 = document.getElementById('<%= Image1.ClientID %>');
                    image2.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script>
        function showCheckboxList() {
            var checkboxList = document.getElementById("<%= checkboxList.ClientID %>");
            if (checkboxList.style.display === "none") {
                checkboxList.style.display = "block";
            } else {
                checkboxList.style.display = "none";
            }
        }
    </script>
    <script>
        var passwordTextbox = document.getElementById('<%= passst.ClientID %>');
        var passwordToggle = document.querySelector('.password-toggle');
        var passwordLabel = document.getElementById('<%= pas.ClientID %>');
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
    <%--<script type="text/javascript">
        function validateForm() {
        var textBox = document.getElementById("<%= hoten.ClientID %>");
        var value = textBox.value.trim();
        if (value === "") {
            alert("Vui lòng nhập họ và tên.");
            textBox.focus();
            return false;
        } 

        var usernameTextBox = document.getElementById("<%= username.ClientID %>");
        var usernameValue = usernameTextBox.value.trim();
        if (usernameValue === "") {
            alert("Vui lòng nhập tên đăng nhập.");
            usernameTextBox.focus();
            return false;
        }

        var passTextBox = document.getElementById("<%= pass.ClientID %>");
        var passValue = passTextBox.value.trim();
        if (passValue === "") {
            alert("Vui lòng nhập mật khẩu.");
            passTextBox.focus();
            return false;
        }

        var pass1TextBox = document.getElementById("<%= pass1.ClientID %>");
        var pass1Value = pass1TextBox.value.trim();
        if (pass1Value === "") {
            alert("Vui lòng nhập lại mật khẩu.");
            pass1TextBox.focus();
            return false;
        }

        if (passValue !== pass1Value) {
            alert("Mật khẩu nhập lại không khớp.");
            pass1TextBox.focus();
            return false;
        }

        return true;
    }
</script>--%>
    <script src="AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
</asp:Content>
