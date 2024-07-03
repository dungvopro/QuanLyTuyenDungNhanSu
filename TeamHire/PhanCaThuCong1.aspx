<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="PhanCaThuCong1.aspx.cs" Inherits="TeamHire.PhanCaThuCong1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="AdminLTE-3.2.0/plugins/select2/css/select2.min.css" />
    <link rel="stylesheet" href="AdminLTE-3.2.0/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="AdminLTE-3.2.0/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css" />
    <!-- BS Stepper -->

    <!-- dropzonejs -->
    <link rel="stylesheet" href="AdminLTE-3.2.0/plugins/dropzone/min/dropzone.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="AdminLTE-3.2.0/dist/css/adminlte.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Phân ca thủ công</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">phân ca làm việc</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-default">
                            <div class="card-header">
                                <h3 class="card-title text-info">Đối tượng áp dụng</h3>

                                <div class="card-tools">
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <h5>Tiêu đề *</h5>

                                    <div class="col-12 col-sm-6">
                                        <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label29" runat="server" Text=" Tên bị trùng *" ForeColor="Red" Visible="False"></asp:Label>
                                </div>
                                <div class="row">
                                    <div>
                                        <div class="dropdown-divider"></div>
                                        <asp:Label ID="Label1" runat="server" Text="Áp dụng" ForeColor="#333333"></asp:Label>
                                        <asp:Label ID="Label27" runat="server" Text=" Vui lòng chọn đối tượng áp dụng *" ForeColor="Red" Visible="False"></asp:Label>
                                        <div class="form-group">
                                            <br />
                                            <asp:Button ID="Button1" class="btn btn-info" OnClick="toanct_Click" runat="server" Text="Toàn công ty" />
                                            <asp:Button ID="Button2" class="btn btn-outline-info" OnClick="nhomct_Click" runat="server" Text="Nhóm làm việc" />
                                            <asp:Button ID="Button3" class="btn btn-outline-info" OnClick="vitri_Click" runat="server" Text="Vị trí công việc" />
                                            <asp:Button ID="Button4" class="btn btn-outline-info" OnClick="nhanvien_Click" runat="server" Text="Nhân viên cụ thể" />
                                        </div>
                                        <div class="form-group">
                                            <div class="select2-info">
                                                <asp:ListBox ID="ListBox1" class="select2" runat="server" data-placeholder="Chọn nhóm làm việc" SelectionMode="Multiple" data-dropdown-css-class="select2-info" Style="width: 100%;" Visible="False">
                                                    <asp:ListItem Text="Nhóm 1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Nhóm 2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Nhóm 3" Value="3"></asp:ListItem>
                                                </asp:ListBox>
                                                <asp:ListBox ID="ListBox2" class="select2" runat="server" data-placeholder="Chọn nhân viên" SelectionMode="Multiple" data-dropdown-css-class="select2-info" Style="width: 100%;" Visible="False"></asp:ListBox>
                                                <asp:ListBox ID="ListBox3" class="select2" runat="server" data-placeholder="Chọn vị trí" SelectionMode="Multiple" data-dropdown-css-class="select2-info" Style="width: 100%;" Visible="False"></asp:ListBox>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label22" runat="server" Text="Mô tả " ForeColor="#333333"></asp:Label>
                                        <asp:Label ID="Label24" runat="server" Text="Toàn công ty" ForeColor="#333333"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text="- Có thể chọn nhiều đơn vị trong một đối tượng" ForeColor="#333333"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="- Không thể chọn nhiều đối tượng cùng 1 lúc" ForeColor="#333333"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="- Đối tượng áp dụng có thể là toàn công ty, nhóm làm việc, vị trí công việc, hoặc là nhân viên cụ thể" ForeColor="#333333"></asp:Label>
                                        <br />
                                        <!-- /.form-group -->

                                        <!-- /.form-group -->
                                    </div>
                                    <!-- /.col -->

                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->


                                <!-- /.row -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                            </div>
                        </div>
                        <div class="card card-default">
                            <div class="card-header">
                                <h3 class="card-title text-info">Ca áp dụng</h3>

                                <div class="card-tools">
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <br />
                                    <div class="icheck-info d-inline ml-2">
                                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="r2" Text="Dùng chung ca cho các ngày đã chọn" Checked="true" AutoPostBack="true" OnCheckedChanged="Radio2_CheckedChanged" />
                                    </div>
                                    <div class="icheck-info  d-inline ml-3">
                                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="r2" Text="Cài đặt ca cho từng ngày" AutoPostBack="true" OnCheckedChanged="Radio2_CheckedChanged" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-9">
                                        <div class="dropdown-divider"></div>
                                        <asp:Label ID="Label18" runat="server" Text="Chọn ca áp dụng" ForeColor="#333333"></asp:Label>
                                        <div class="form-group">
                                            <div class="select2-info">
                                                <asp:ListBox ID="dungchungca" class="select2" runat="server" data-placeholder="Chọn ca" SelectionMode="Multiple" data-dropdown-css-class="select2-info" Style="width: 100%;" OnSelectedIndexChanged="Listdungchungca_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label28" runat="server" Text=" Vui lòng chọn ca áp dụng *" ForeColor="Red" Visible="False"></asp:Label>
                                        <asp:Label ID="Label23" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label26" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label19" runat="server" Text="" ForeColor="#333333"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label20" runat="server" Text="" ForeColor="#333333"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label21" runat="server" Text="" ForeColor="#333333"></asp:Label>
                                        <br />
                                        <!-- /.form-group -->

                                        <!-- /.form-group -->
                                    </div>
                                    <!-- /.col -->

                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->


                                <!-- /.row -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-info">
                            <div class="card-header">
                                <h3 class="card-title">Ca thời gian</h3>
                            </div>
                            <div class="card-body">
                                <!-- Date -->
                                <div class="info-box bg-info">
                                    <span class="info-box-icon"><i class="far fa-calendar-alt"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text">Khoảng ngày áp dụng</span>
                                        <span class="info-box-number">
                                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></span>

                                        <div class="progress">
                                            <div class="progress-bar" style="width: 70%"></div>
                                        </div>
                                        <span class="progress-description">Chọn một khoảng thời gian từ ngày bắt đầu đến ngày kết thúc, hoặc không có thời hạn kết thúc.
                                        </span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>

                                <!-- /.form group -->
                                <!-- Date range -->
                                <div class="form-group">
                                    <label>Khoản ngày áp dụng:</label>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="reservation">
                                                <i class="far fa-calendar-alt"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="TextBox3" class="form-control float-right" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label25" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
                                    <!-- /.input group -->
                                </div>

                                <!-- /.form group -->

                                <!-- Date and time range -->

                                <!-- /.form group -->

                                <!-- Date and time range -->
                                <div class="form-group">
                                    <label>Cài đặt chế độ lặp lại:</label>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-3">
                                            <asp:Label ID="Label6" runat="server" Text="Chọn thời gian lặp lại"></asp:Label>
                                            <asp:DropDownList ID="tg11" class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="tg1_SelectedIndexChanged">
                                                <asp:ListItem Value="Tuần">Tuần</asp:ListItem>
                                                <asp:ListItem Value="Tháng">Tháng</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3" runat="server" id="tuan11">
                                            <asp:Label ID="Label7" runat="server" Text="Phương thức lặp lại"></asp:Label>
                                            <asp:DropDownList class="form-control" runat="server" ID="tuan1" AutoPostBack="True" OnSelectedIndexChanged="tuan_SelectedIndexChanged">
                                                <asp:ListItem Value="Hàng tuần">Hàng tuần</asp:ListItem>
                                                <asp:ListItem Value="Cách tuần">Cách tuần</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3" runat="server" id="cachtuan11" visible="false">
                                            <asp:Label ID="Label8" runat="server" Text="Chu kỳ lặp lại"></asp:Label>
                                            <asp:DropDownList class="form-control" runat="server" ID="cachtuan1" AutoPostBack="True" OnSelectedIndexChanged="cachtuan_SelectedIndexChanged">
                                                <asp:ListItem Value="1 Tuần">1 Tuần</asp:ListItem>
                                                <asp:ListItem Value="2 Tuần">2 Tuần</asp:ListItem>
                                                <asp:ListItem Value="3 Tuần">3 Tuần</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3" runat="server" id="thang11" visible="false">
                                            <asp:Label ID="Label9" runat="server" Text="Phương thức lặp lại"></asp:Label>
                                            <asp:DropDownList class="form-control" runat="server" ID="thang1" AutoPostBack="True" OnSelectedIndexChanged="thang_SelectedIndexChanged">
                                                <asp:ListItem Value="Hàng tháng">Hàng tháng</asp:ListItem>
                                                <asp:ListItem Value="Cách tháng">Cách tháng</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3" runat="server" id="cachthang11" visible="false">
                                            <asp:Label ID="Label10" runat="server" Text="Chu kỳ lặp lại"></asp:Label>
                                            <asp:DropDownList class="form-control" runat="server" ID="cachthang1" AutoPostBack="True" OnSelectedIndexChanged="cachthang_SelectedIndexChanged">
                                                <asp:ListItem Value="1 Tháng">1 Tháng</asp:ListItem>
                                                <asp:ListItem Value="2 Tháng">2 Tháng</asp:ListItem>
                                                <asp:ListItem Value="3 Tháng">3 Tháng</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12" runat="server" id="dongpham">
                                            <br />
                                            <asp:Label ID="Label11" runat="server" Text="Chọn ngày áp dụng"></asp:Label>
                                            <div class="card-body">
                                                <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox_Click" class="icheck-info d-inline" AutoPostBack="true" Text="Thứ 2" />
                                                <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckBox_Click" class="icheck-info d-inline" Text="Thứ 3" AutoPostBack="true" />
                                                <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged="CheckBox_Click" class="icheck-info d-inline" Text="Thứ 4" AutoPostBack="true" />
                                                <asp:CheckBox ID="CheckBox4" runat="server" OnCheckedChanged="CheckBox_Click" class="icheck-info d-inline" Text="Thứ 5" AutoPostBack="true" />
                                                <asp:CheckBox ID="CheckBox5" runat="server" OnCheckedChanged="CheckBox_Click" class="icheck-info d-inline" Text="Thứ 6" AutoPostBack="true" />
                                                <asp:CheckBox ID="CheckBox6" runat="server" OnCheckedChanged="CheckBox_Click" class="icheck-info d-inline" Text="Thứ 7" AutoPostBack="true" />
                                                <asp:CheckBox ID="CheckBox7" runat="server" OnCheckedChanged="CheckBox_Click" class="icheck-info d-inline" Text="Chủ nhật" AutoPostBack="true" />
                                            </div>
                                        </div>
                                        <div class="col-md-12" runat="server" id="Div1" visible="False">
                                            <br />
                                            <asp:Label ID="Label12" runat="server" Text="Chọn ngày áp dụng"></asp:Label>
                                            <asp:ListBox ID="ListBox4" class="select2" runat="server" data-placeholder="Chọn ngày trong tháng" SelectionMode="Multiple" data-dropdown-css-class="select2-info" Style="width: 100%;" OnSelectedIndexChanged="ListBox30_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="Ngày 1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 6" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 7" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 8" Value="8"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 9" Value="9"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 10" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 11" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 12" Value="12"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 13" Value="13"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 14" Value="14"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 15" Value="15"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 16" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 17" Value="17"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 18" Value="18"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 19" Value="19"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 20" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 21" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 22" Value="22"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 23" Value="23"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 24" Value="24"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 25" Value="25"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 26" Value="26"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 27" Value="27"></asp:ListItem>
                                                <asp:ListItem Text="Ngày 28" Value="28"></asp:ListItem>
                                            </asp:ListBox>
                                        </div>
                                        <div class="col-md-12 ">
                                            <br />
                                            <asp:Label ID="Label14" runat="server" Text="Mô tả"></asp:Label><br />
                                            <asp:Label ID="Label15" runat="server" Text="Hàng tuần," ForeColor="#333333"></asp:Label>
                                            <asp:Label ID="Label13" runat="server" Text=" các ca làm việc được phân sẽ lặp lại 1 lần vào ngày" ForeColor="#333333"></asp:Label>
                                            <asp:Label ID="Label16" runat="server" Text="" ForeColor="#333333"></asp:Label>
                                            <asp:Label ID="Label17" runat="server" Text="" ForeColor="#333333"></asp:Label>
                                        </div>

                                    </div>
                                    <div>
                                    </div>
                                </div>
                                <!-- /.form group -->
                            </div>
                            <div class="card-footer">
                                <asp:TextBox ID="TextBox2" runat="server" Enabled="False" Width="1px" Height="1px">ok</asp:TextBox>
                                <asp:TextBox ID="TextBox4" runat="server" Enabled="False" Width="1px" Height="1px"></asp:TextBox>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div style="display: flex; justify-content: flex-end;">
                            <asp:Button ID="Button7" class="btn bg-gradient-secondary ml-2" runat="server" Text="Hủy bỏ" OnClick="quaylai_click"/>
                            <asp:Button ID="Button8" class="btn bg-gradient-info btn-lg ml-2" runat="server" Text="Lưu" OnClick="ketthucroi"/>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <script src="AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="AdminLTE-3.2.0/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Select2 -->
    <script src="AdminLTE-3.2.0/plugins/select2/js/select2.full.min.js"></script>
    <!-- Bootstrap4 Duallistbox -->
    <script src="AdminLTE-3.2.0/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
    <!-- InputMask -->


    <script>
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
            //Date range picker
            $('#reservation').daterangepicker()
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({
                timePicker: true,
                timePickerIncrement: 30,
                locale: {
                    format: 'MM/DD/YYYY hh:mm A'
                }
            })
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
                }
            )
        })

        $(function () {
            // ...
            $('#reservation').daterangepicker({
                // ...
            }, function (start, end) {
                // Gán giá trị của khoảng ngày đã chọn vào TextBox3
                $('#<%= TextBox3.ClientID %>').val(start.format('MM/DD/YYYY') + ' - ' + end.format('MM/DD/YYYY'));
                });
            // ...
        });
    </script>
</asp:Content>
