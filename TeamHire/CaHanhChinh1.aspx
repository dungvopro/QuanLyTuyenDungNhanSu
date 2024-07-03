<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="CaHanhChinh1.aspx.cs" Inherits="TeamHire.CaHanhChinh1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css" />

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
                        <h1>Thêm ca hành chính</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Ca hành chính</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">

                <div class="card card-default">
                    <div class="card-header">
                        <label class="card-title mr-2" style="font-size: 16px">Trạng thái hoạt động: </label>
                        <label class="custom-button">
                            <asp:CheckBox ID="myCheckboxi" runat="server" OnCheckedChanged="mybox_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                            <span class="button-slider"></span>
                            <span class="button-label on">ON</span>
                            <span class="button-label on" style="color: #CCCCCC">OFF</span>
                        </label>
                        <div class="card-tools">
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <label style="font-size: 18px">Tiêu đề *</label>

                            <div class="col-12 col-sm-6">
                                
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="Label29" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="dropdown-divider"></div>
                                    <asp:Label ID="Label1" runat="server" Text="Giờ làm việc buổi sáng" ForeColor="#333333"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:Label ID="Label2" runat="server" CssClass="mr-2" Text="Từ:"></asp:Label>
                                        <div class="input-group timepicker mr-3" id="timepicker" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox3" class="form-control datetimepicker-input " data-target="#timepicker" runat="server" Width="100px">7:00 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>

                                        <asp:Label ID="Label3" runat="server" CssClass="mr-2" Text="Đến:"></asp:Label>
                                        <div class="input-group timepicker" id="timepicker2" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox2" class="form-control datetimepicker-input" data-target="#timepicker2" runat="server" Width="100px">11:00 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker2" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label30" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="dropdown-divider"></div>
                                    <asp:Label ID="Label4" runat="server" Text="Giờ Check in buổi sáng hợp lệ" ForeColor="#333333"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:Label ID="Label5" runat="server" CssClass="mr-2" Text="Từ:"></asp:Label>
                                        <div class="input-group timepicker mr-3" id="timepicker3" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox4" class="form-control datetimepicker-input " data-target="#timepicker3" runat="server" Width="100px">6:45 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker3" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>

                                        <asp:Label ID="Label6" runat="server" CssClass="mr-2" Text="Đến:"></asp:Label>
                                        <div class="input-group timepicker" id="timepicker4" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox5" class="form-control datetimepicker-input" data-target="#timepicker4" runat="server" Width="100px">7:30 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker4" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label31" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="dropdown-divider"></div>
                                    <asp:Label ID="Label7" runat="server" Text="Giờ Check out buổi sáng hợp lệ" ForeColor="#333333"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:Label ID="Label8" runat="server" CssClass="mr-2" Text="Từ:"></asp:Label>
                                        <div class="input-group timepicker mr-3" id="timepicker5" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox6" class="form-control datetimepicker-input " data-target="#timepicker5" runat="server" Width="100px">10:45 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker5" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>

                                        <asp:Label ID="Label9" runat="server" CssClass="mr-2" Text="Đến:"></asp:Label>
                                        <div class="input-group timepicker" id="timepicker6" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox7" class="form-control datetimepicker-input" data-target="#timepicker6" runat="server" Width="100px">11:30 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker6" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label32" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            <!-- /.col -->

                            <!-- /.col -->
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="dropdown-divider"></div>
                                    <asp:Label ID="Label10" runat="server" Text="Giờ làm việc buổi chiều" ForeColor="#333333"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:Label ID="Label11" runat="server" CssClass="mr-2" Text="Từ:"></asp:Label>
                                        <div class="input-group timepicker mr-3" id="timepicker7" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox9" class="form-control datetimepicker-input " data-target="#timepicker7" runat="server" Width="100px">13:00 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker7" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>

                                        <asp:Label ID="Label12" runat="server" CssClass="mr-2" Text="Đến:"></asp:Label>
                                        <div class="input-group timepicker" id="timepicker8" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox10" class="form-control datetimepicker-input" data-target="#timepicker8" runat="server" Width="100px">17:00 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker8" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label33" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="dropdown-divider"></div>
                                    <asp:Label ID="Label13" runat="server" Text="Giờ Check in buổi chiều hợp lệ" ForeColor="#333333"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:Label ID="Label14" runat="server" CssClass="mr-2" Text="Từ:"></asp:Label>
                                        <div class="input-group timepicker mr-3" id="timepicker9" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox11" class="form-control datetimepicker-input " data-target="#timepicker9" runat="server" Width="100px">12:45 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker9" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>

                                        <asp:Label ID="Label15" runat="server" CssClass="mr-2" Text="Đến:"></asp:Label>
                                        <div class="input-group timepicker" id="timepicker10" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox12" class="form-control datetimepicker-input" data-target="#timepicker10" runat="server" Width="100px">17:30 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker10" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label34" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="dropdown-divider"></div>
                                    <asp:Label ID="Label16" runat="server" Text="Giờ Check out buổi chiều hợp lệ" ForeColor="#333333"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:Label ID="Label17" runat="server" CssClass="mr-2" Text="Từ:"></asp:Label>
                                        <div class="input-group timepicker mr-3" id="timepicker11" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox13" class="form-control datetimepicker-input " data-target="#timepicker11" runat="server" Width="100px">10:45 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker11" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>

                                        <asp:Label ID="Label18" runat="server" CssClass="mr-2" Text="Đến:"></asp:Label>
                                        <div class="input-group timepicker" id="timepicker12" data-target-input="nearest">
                                            <asp:TextBox ID="TextBox14" class="form-control datetimepicker-input" data-target="#timepicker12" runat="server" Width="100px">17:30 AM</asp:TextBox>
                                            <div class="input-group-append" data-target="#timepicker12" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-clock"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label35" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            <!-- /.col -->

                            <!-- /.col -->
                        </div>
                        <!-- /.row -->


                        <div class="row">
                            <div class="col-md-3">
                                <div class="card card-primary collapsed-card">
                                    <div class="card-header">
                                        <h3 class="card-title">Thiết lập điều kiện xin nghỉ</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                        <!-- /.card-tools -->
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <asp:CheckBox ID="CheckBox2" runat="server"  GroupName="r5"  class="icheck-primary d-inline" Text="Nghỉ cả ca làm việc" />
                                        <asp:CheckBox ID="CheckBox1" runat="server"  GroupName="r5"  class="icheck-primary d-inline" Text="Nghỉ một 1/2 ca làm việc" />
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->

                            <!-- /.col -->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card card-secondary" runat="server" id="myCard">
                                    <div class="card-header">
                                        <h3 class="card-title">Số phút đi muộn
                                        </h3>
                                        <div class="card-tools" style="height: 20px">
                                            <label class="custom-button" style="transform: scale(0.7);">
                                                <asp:CheckBox ID="CheckBox3" OnCheckedChanged="myCheckbox_CheckedChanged" runat="server" AutoPostBack="true"></asp:CheckBox>
                                                <span class="button-slider"></span>
                                                <span class="button-label on">ON</span>
                                                <span class="button-label on" style="color: #CCCCCC">OFF</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-inline">
                                            <asp:Label ID="Label19" runat="server" CssClass="mr-2" Text="Thời gian tính đi muộn buổi sáng từ:"></asp:Label>
                                            <div class="input-group timepicker mr-3" id="timepicker13" data-target-input="nearest">
                                                <asp:TextBox ID="TextBox15" class="form-control datetimepicker-input " data-target="#timepicker13" runat="server" Width="150px" Height="38px">7:15 AM</asp:TextBox>
                                                <div class="input-group-append" data-target="#timepicker13" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="far fa-clock"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label36" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                        <br />
                                        <div class="form-inline">
                                            <asp:Label ID="Label20" runat="server" CssClass="mr-2" Text="Thời gian tính đi muộn buổi chiều từ:"></asp:Label>
                                            <div class="input-group timepicker mr-3" id="timepicker14" data-target-input="nearest">
                                                <asp:TextBox ID="TextBox16" class="form-control datetimepicker-input " data-target="#timepicker14" runat="server" Width="150px" Height="38px">13:15 AM</asp:TextBox>
                                                <div class="input-group-append" data-target="#timepicker14" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="far fa-clock"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label37" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                        <div class="form-group clearfix">
                                            <div class="icheck-info ">
                                                <asp:RadioButton ID="radioMinutes" runat="server" GroupName="r1" Text="Tính theo số phút" Checked="true" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
                                            </div>
                                            <div class="icheck-info  d-inline ">
                                                <asp:RadioButton ID="radioBlocks" runat="server" GroupName="r1" Text="Tính theo block" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
                                            </div>
                                            <div class="input-group" style="width: 150px; margin-left: 28px">
                                                <asp:TextBox ID="TextBox17" class="form-control" runat="server" onTextChanged="TextBox17_TextChanged" onkeypress="return isNumberKey(event)" Width="91px" MaxLength="2" Height="38px" Enabled="False">10</asp:TextBox>
                                                <span class="input-group-append">
                                                    <label class="btn btn-secondary">Phút</label>
                                                </span>
                                            </div>
                                            <asp:Label ID="Label38" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                            <asp:Label ID="Label21" runat="server" Text="Số phút bạn nhập sẽ được tính là 1 Block." ForeColor="#333333" Font-Size="14px"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label22" runat="server" Text="VD: 10 phút = 1 Block" ForeColor="#333333" Font-Size="14px"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="card card-secondary" runat="server" id="toiCard">
                                    <div class="card-header">
                                        <h3 class="card-title">Số phút về sớm
                                        </h3>
                                        <div class="card-tools" style="height: 20px">
                                            <label class="custom-button" style="transform: scale(0.7);">
                                                <asp:CheckBox ID="CheckBox4" OnCheckedChanged="myChk_CheckedChanged" runat="server" AutoPostBack="true"></asp:CheckBox>
                                                <span class="button-slider"></span>
                                                <span class="button-label on">ON</span>
                                                <span class="button-label on" style="color: #CCCCCC">OFF</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-inline">
                                            <asp:Label ID="Label23" runat="server" CssClass="mr-2" Text="Thời gian tính về sớm buổi sáng đến:"></asp:Label>
                                            <div class="input-group timepicker mr-3" id="timepicker15" data-target-input="nearest">
                                                <asp:TextBox ID="TextBox18" class="form-control datetimepicker-input " data-target="#timepicker15" runat="server" Width="150px" Height="38px">11:45 AM</asp:TextBox>
                                                <div class="input-group-append" data-target="#timepicker15" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="far fa-clock"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label39" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                        <br />
                                        <div class="form-inline">
                                            <asp:Label ID="Label24" runat="server" CssClass="mr-2" Text="Thời gian tính về sớm buổi chiều đến:"></asp:Label>
                                            <div class="input-group timepicker mr-3" id="timepicker16" data-target-input="nearest">
                                                <asp:TextBox ID="TextBox19" class="form-control datetimepicker-input " data-target="#timepicker16" runat="server" Width="150px" Height="38px">17:15 AM</asp:TextBox>
                                                <div class="input-group-append" data-target="#timepicker16" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="far fa-clock"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label40" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                        <div class="form-group clearfix">
                                            <div class="icheck-info ">
                                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="r2" Text="Tính theo số phút" Checked="true" AutoPostBack="true" OnCheckedChanged="Radio2_CheckedChanged" />
                                            </div>
                                            <div class="icheck-info  d-inline ">
                                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="r2" Text="Tính theo block" AutoPostBack="true" OnCheckedChanged="Radio2_CheckedChanged" />
                                            </div>
                                            <div class="input-group" style="width: 150px; margin-left: 28px">
                                                <asp:TextBox ID="TextBox20" class="form-control" runat="server" onTextChanged="TextBox20_TextChanged" onkeypress="return isNumberKey(event)" Width="91px" MaxLength="2" Height="38px" Enabled="False">10</asp:TextBox>
                                                <span class="input-group-append">
                                                    <label class="btn btn-secondary">Phút</label>
                                                </span>
                                            </div>
                                            <asp:Label ID="Label41" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                                            <asp:Label ID="Label25" runat="server" Text="Số phút bạn nhập sẽ được tính là 1 Block." ForeColor="#333333" Font-Size="14px"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label26" runat="server" Text="VD: 10 phút = 1 Block" ForeColor="#333333" Font-Size="14px"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->
                        <div class="dropdown-divider"></div>
                        <asp:Label ID="Label27" runat="server" Text="Số công ghi nhận" ForeColor="#333333"></asp:Label>
                        <div style="padding-left: 20px;">
                            <asp:TextBox ID="TextBox21" class="form-control" runat="server" onkeypress="return isNumberKey(event)" Width="91px" MaxLength="6" Height="38px">1</asp:TextBox>
                        </div>
                        <asp:Label ID="Label42" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Label ID="Label28" runat="server" Text="Số công ghi nhận nếu quên Check out" ForeColor="#333333"></asp:Label>
                        <div style="padding-left: 20px;">
                            <asp:TextBox ID="TextBox22" class="form-control" runat="server" onkeypress="return isNumberKey(event)" Width="91px" MaxLength="6" Height="38px">0.5</asp:TextBox>
                        </div>
                        <asp:Label ID="Label43" runat="server" Text="Tên bị trùng*" Visible="False" ForeColor="Red"></asp:Label>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div style="display: flex; justify-content: flex-end;">
                            <asp:Button ID="Button1" class="btn bg-gradient-secondary ml-2" runat="server" Text="Hủy bỏ" OnClick="huy_Click"/>
                            <asp:Button ID="Button2" class="btn bg-gradient-primary ml-2" runat="server" Text="Lưu" OnClick="luu_Click"/>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js"></script>
    <script>
        $(function () {
            function initializeDateTimePicker(id) {
                $(id).datetimepicker({
                    format: 'LT',
                    ignoreReadonly: true,
                    allowInputToggle: true
                });
            }

            initializeDateTimePicker('#timepicker');
            initializeDateTimePicker('#timepicker2');
            initializeDateTimePicker('#timepicker4');
            initializeDateTimePicker('#timepicker3');
            initializeDateTimePicker('#timepicker5');
            initializeDateTimePicker('#timepicker6');
            initializeDateTimePicker('#timepicker7');
            initializeDateTimePicker('#timepicker8');
            initializeDateTimePicker('#timepicker9');
            initializeDateTimePicker('#timepicker10');
            initializeDateTimePicker('#timepicker11');
            initializeDateTimePicker('#timepicker12');

            initializeDateTimePicker('#timepicker13');
            initializeDateTimePicker('#timepicker14');
            initializeDateTimePicker('#timepicker15');
            initializeDateTimePicker('#timepicker16');
        });
    </script>
    <script>
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <script>
        const checkBox = document.getElementById('CheckBox11');

        checkBox.addEventListener('change', function () {
            if (this.checked) {
                this.nextElementSibling.nextElementSibling.textContent = 'On';
            } else {
                this.nextElementSibling.nextElementSibling.textContent = 'Off';
            }
        });
    </script>
    <!-- date-range-picker -->

</asp:Content>
