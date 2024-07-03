<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="PhanNhomLamViec1.aspx.cs" Inherits="TeamHire.PhanNhomLamViec1" %>

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
    <style>
                .custom-file-upload {
            position: relative;
            display: inline-block;
            cursor: pointer;
            overflow: hidden;
            width: 24px;
            height: 24px;
            background-color: #f1f1f1;
            border-radius: 50%;
            padding: 0;
            text-align: center;
        }

            .custom-file-upload input[type="file"] {
                font-size: 100px;
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
                cursor: pointer;
                width: 100%;
                height: 100%;
            }

        .profile-user-img {
            border: 5px solid #cccccc;
            border-radius: 50%;
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
                        <h1>Thêm nhóm làm việc</h1>
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
                        <div class="card card-purple">
                            <div class="card-header">
                                <h3 class="card-title text-default">Nhóm làm việc</h3>

                                <div class="card-tools">
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                
                                <div class=" col-9">
                                    <h5>Tên nhóm *</h5>
                                    <div>
                                        <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                                    </div>                                   
                                    <asp:Label ID="Label24" runat="server" Text="- Nhóm làm việc phải lớn hơn 2 người" ForeColor="#333333"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text="- Nhóm làm việc luôn phải có 1 trưởng nhóm" ForeColor="#333333"></asp:Label>
                                </div>
                                    <div class="col-3">
                                    <div class="text-center">
                                        <asp:Image ID="Image1" class="profile-user-img img-fluid img-circle" runat="server" />
                                                                            <div class="custom-file-upload" style="margin-left: 50%; margin-top: -20px;">
                                        <i class="fa fa-camera"></i>
                                        <asp:FileUpload ID="FileUpload3" runat="server" onchange="previewImage(this)" />
                                    </div>
                                    </div>
                                        <div style="display: flex; justify-content: center; align-items: center;">
    <asp:Label ID="Label1" runat="server" Text="Ảnh nhóm"></asp:Label>
</div>
                                </div>
                                </div>
                                <!-- /.row -->


                                <!-- /.row -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                            </div>
                        </div>
                        <div class="card card-purple">
                            <div class="card-header">
                                <h3 class="card-title text-default">Nhân viên áp dụng</h3>

                                <div class="card-tools">
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div>
                                    <label>Chọn nhóm trưởng:</label>
                                    <asp:Label ID="Label3" runat="server" Text="(Vui lòng chọn nhóm trưởng*)" ForeColor="Red" Visible="False"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="select2-info">
                                        <asp:ListBox ID="ListBox1" class="select2" runat="server" data-placeholder="Chọn trưởng nhóm" data-dropdown-css-class="select2-info" Style="width: 100%;" OnSelectedIndexChanged="truongnhom_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
                                    </div>
                                </div>
                                <div>
                                    <label>Thêm thành viên:</label>
                                    <asp:Label ID="Label4" runat="server" Text="(Vui lòng chọn thành viên*)" ForeColor="Red" Visible="False"></asp:Label>
                                </div>
                                <div>
                                    <div class="form-group">
                                        <div class="select2-info">
                                            <asp:ListBox ID="ListBox2" class="select2" runat="server" data-placeholder="Chọn nhân viên" SelectionMode="Multiple" data-dropdown-css-class="select2-info" Style="width: 100%;" Enabled="False"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

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
                        <div class="card card-purple">
                            <div class="card-header">
                                <h3 class="card-title">Thông tin nhóm</h3>
                            </div>
                            <div class="card-body">
                                <!-- Date -->
                                <div class="info-box bg-purple">
                                    <span class="info-box-icon"><i class="fas fa-comments"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text">Tương tác</span>
                                        <span class="info-box-number">41,410</span>

                                        <div class="progress">
                                            <div class="progress-bar" style="width: 70%"></div>
                                        </div>
                                        <span class="progress-description">Tăng 70% hiệu suất làm việc
                </span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>

                                <!-- /.form group -->
                                <!-- Date range -->
                                <div class="form-group">
                                    <label>Ngày tạo:</label>
                                    <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
                                        <asp:TextBox ID="TextBox3" runat="server" class="form-control datetimepicker-input" data-target="#reservationdatetime"></asp:TextBox>
                                        <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- /.form group -->

                                <!-- Date and time range -->

                                <!-- /.form group -->

                                <!-- Date and time range -->
                                <div class="form-group">
                                    <label>Mô tả:</label>
                                    <br />
                                    <textarea id="myTextarea" runat="server" class="form-control" style="width: 100%; height: 200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>

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
                            <asp:Button ID="Button7" class="btn bg-gradient-secondary ml-2" runat="server" Text="Hủy bỏ" />
                            <asp:Button ID="Button8" class="btn bg-gradient-purple btn-lg ml-2" runat="server" Text="Lưu" onclick="themnhom_click"/>
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

<%--        $(function () {
            // ...
            $('#reservation').daterangepicker({
                // ...
            }, function (start, end) {
                // Gán giá trị của khoảng ngày đã chọn vào TextBox3
                $('#<%= TextBox3.ClientID %>').val(start.format('MM/DD/YYYY') + ' - ' + end.format('MM/DD/YYYY'));
                });
            // ...
        });--%>
</script>
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
</asp:Content>
