<%@ Page Title="" Language="C#" MasterPageFile="~/AdminWeb.Master" AutoEventWireup="true" CodeBehind="ThongKeAdmin1.aspx.cs" Inherits="TeamHire.ThongKeAdmin1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="overview-wrap">
                        <h2 class="title-1">TỔNG QUAN</h2>
                        <button class="au-btn au-btn-icon au-btn--blue">
                            <i class="fa fa-cloud-download-alt"></i>Xuất file excel</button>
                    </div>
                </div>
            </div>
            <div class="row m-t-25">
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c1">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-account-o"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="36px" ForeColor="White"></asp:Label></h2>
                                    <span>Người đăng ký</span>
                                </div>
                            </div>
                            <div class="overview-chart">
                                <canvas id="widgetChart1"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c2">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="fa fa-gem"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <asp:Label ID="Label2" runat="server" Text="10" ForeColor="White" Font-Size="36px"></asp:Label></h2>
                                    <span>Thành viên Vip</span>
                                </div>
                            </div>
                            <div class="overview-chart">
                                <canvas id="widgetChart2"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c3">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-calendar-note"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="36px" ForeColor="White"></asp:Label></h2>
                                    <span>Số bài tuyển dụng</span>
                                </div>
                            </div>
                            <div class="overview-chart">
                                <canvas id="widgetChart3"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c4">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-money"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <asp:Label ID="Label4" runat="server" Text="Label" Font-Size="36px" ForeColor="White"></asp:Label></h2>
                                    <span>Tổng danh thu</span>
                                </div>
                            </div>
                            <div class="overview-chart">
                                <canvas id="widgetChart4"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="au-card recent-report">
                        <div class="au-card-inner">
                            <h3 class="title-2">Biểu đồ doanh thu</h3>
                            <div class="chart-info">
                                <div class="chart-info__left">
                                    <%--                                                <div class="chart-note">
                                                    <span class="dot dot--blue"></span>
                                                    <span>products</span>
                                                </div>
                                                <div class="chart-note mr-0">
                                                    <span class="dot dot--green"></span>
                                                    <span>services</span>
                                                </div>--%>
                                </div>
                                <div class="chart-info__right">
                                    <div class="chart-statis">
                                        <span class="index incre">
                                            <i class="zmdi zmdi-long-arrow-up"></i>25%</span>
                                        <span class="label">2023</span>
                                    </div>
                                    <div class="chart-statis mr-0">
                                        <span class="index decre">
                                            <i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                        <span class="label">2022</span>
                                    </div>
                                </div>
                            </div>
                            <div class="recent-report__chart">
                                <canvas id="bieudodoanhthu"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="au-card chart-percent-card">
                        <div class="au-card-inner">
                            <h3 class="title-2 tm-b-5">Biểu đồ % VIP</h3>
                            <div class="row no-gutters">
                                <div class="col-xl-6">
                                    <div class="chart-note-wrap">
                                        <div class="chart-note mr-0 d-block">
                                            <span class="dot dot--blue"></span>
                                            <span>Thành viên thường</span>
                                        </div>
                                        <div class="chart-note mr-0 d-block">
                                            <span class="dot dot--red"></span>
                                            <span>Thành viên Vip</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="percent-chart">
                                        <canvas id="myChart"></canvas>
                                    </div>

                                </div>
                            </div>
                            <div style="text-align: center; font-style: italic;">
                                <asp:Label ID="Label5" runat="server" Text="Biểu đồ thể hiện % thành viên VIP của Website" ForeColor="Gray"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9">
                    <h2 class="title-1 m-b-25">Thu nhập theo mặt hàng</h2>
                    <div class="table-responsive table--no-card m-b-40">



                        <asp:DataList ID="DataList1" runat="server" Width="100%">
                            <HeaderTemplate>
                                <table class="table table-borderless table-striped">
                                    <tr style="background-color: #333333; color: aliceblue;">
                                        <th style="width: 1%"></th>
                                        <th style="width: 12%">Thời gian</th>
                                        <th style="width: 5%">ID</th>
                                        <th style="width: 25%">Tên giao dịch</th>
                                        <th style="width: 25%">Phương thức thanh toán</th>
                                        <th style="width: 15%">Người giao dịch</th>
                                        <th>số tiền</th>
                                    </tr>
                                    <tr class="spacer">
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <td style="border-bottom: 2px solid #999999;">
                                    <asp:Label runat="server" Text='<%# Eval("NgayGD", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </td>
                                <td style="border-bottom: 2px solid #999999;">
                                    <a>
                                        <asp:Label runat="server" Text='<%# Eval("MaGD") %>'></asp:Label>
                                    </a>
                                    <%--                                                <br />
                                                <small>
                                                    <asp:Label runat="server" Text='<%# Eval("NgayTD", "{0:dd/MM/yyyy}") + "Ngày đăng"%>'></asp:Label>
                                                </small>--%>
                                </td>
                                <td style="border-bottom: 2px solid #999999;">
                                    <asp:Label ID="Label33" runat="server" Text='<%# Eval("TenGD") %>'></asp:Label>
                                </td>
                                <td style="border-bottom: 2px solid #999999;">
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("PTGD") %>'></asp:Label>
                                </td>
                                <td style="border-bottom: 2px solid #999999;">
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("NguoiGD") %>'></asp:Label>
                                </td>
                                <td style="border-bottom: 2px solid #999999;">
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("SoTien") %>'></asp:Label>
                                </td>

                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:DataList>
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
                </div>
                <div class="col-lg-3">
                    <h2 class="title-1 m-b-25">Top người dùng</h2>
                    <div class="au-card au-card--bg-blue au-card-top-countries m-b-40">
                        <div class="au-card-inner">
                            <div class="table-responsive">
                                <asp:DataList ID="DataList2" runat="server">
                                    <ItemTemplate>
                                        <table class="table table-top-countries">
                                            <tr >
                                                <td style="border-bottom: 1px solid #999999;">
                                                    <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("tennguoidung") %>' ForeColor="White" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td style="border-bottom: 1px solid #999999;">
                                                    <asp:Label ID="lblTongSoTien" runat="server" Text='<%# Eval("TongSoTien") + " vnd"%>' ForeColor="White" Style="float: right; margin-left: 30px;"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                        <div class="au-card-title" style="background-image: url('CoolAdmin-master/images/bg-title-01.jpg');">
                            <div class="bg-overlay bg-overlay--blue"></div>
                            <h3>
                                <i class="zmdi zmdi-account-calendar"></i>Đội ngũ phát triển</h3>
                            <button class="au-btn-plus">
                                <i class="zmdi zmdi-plus"></i>
                            </button>
                        </div>
                        <div class="au-task js-list-load">
                            <div class="au-task__title">
                                <p>Nhóm 6 - SE447A - CDIO4</p>
                            </div>
                            <div class="au-task-list js-scrollbar3">
                                <div class="au-task__item au-task__item--danger">
                                    <div class="au-task__item-inner">
                                        <h5 class="task">
                                            <a href="#">Võ Văn Dũng</a>
                                        </h5>
                                        <span class="time">Trưởng nhóm</span>
                                    </div>
                                </div>
                                <div class="au-task__item au-task__item--warning">
                                    <div class="au-task__item-inner">
                                        <h5 class="task">
                                            <a href="#">Phạm Duy Đông</a>
                                        </h5>
                                        <span class="time">Thành viên</span>
                                    </div>
                                </div>
                                <div class="au-task__item au-task__item--primary">
                                    <div class="au-task__item-inner">
                                        <h5 class="task">
                                            <a href="#">Nguyễn Tất Đạt</a>
                                        </h5>
                                        <span class="time">Thành viên</span>
                                    </div>
                                </div>
                                <div class="au-task__item au-task__item--success">
                                    <div class="au-task__item-inner">
                                        <h5 class="task">
                                            <a href="#">Nguyễn Trương Quân</a>
                                        </h5>
                                        <span class="time">Thành viên</span>
                                    </div>
                                </div>
                                <div class="au-task__item au-task__item--danger js-load-item">
                                    <div class="au-task__item-inner">
                                        <h5 class="task">
                                            <a href="#">Phạm Ngọc Pháp</a>
                                        </h5>
                                        <span class="time">Thành viên</span>
                                    </div>
                                </div>
                            </div>
                            <div class="au-task__footer">
                                <button class="au-btn au-btn-load js-load-btn">load more</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                        <div class="au-card-title" style="background-image: url('CoolAdmin-master/images/bg-title-02.jpg');">
                            <div class="bg-overlay bg-overlay--blue"></div>
                            <h3>
                                <i class="zmdi zmdi-comment-text"></i>New Messages</h3>
                            <button class="au-btn-plus">
                                <i class="zmdi zmdi-plus"></i>
                            </button>
                        </div>
                        <div class="au-inbox-wrap js-inbox-wrap">
                            <div class="au-message js-list-load">
                                <div class="au-message__noti">
                                    <p>
                                        Bạn có
                                                    <span>2</span>

                                        tin nhắn mới
                                    </p>
                                </div>
                                <div class="au-message-list">
                                    <div class="au-message__item unread">
                                        <div class="au-message__item-inner">
                                            <div class="au-message__item-text">
                                                <div class="avatar-wrap">
                                                    <div class="avatar">
                                                        <img src="CoolAdmin-master/images/icon/avatar-02.jpg" alt="John Smith">
                                                    </div>
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">Cô bé bán diêm</h5>
                                                    <p>Chú ơi! cho cháu mượn tèn mua diêm đốt nhà đi chú..</p>
                                                </div>
                                            </div>
                                            <div class="au-message__item-time">
                                                <span>12 phút trước</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="au-message__item unread">
                                        <div class="au-message__item-inner">
                                            <div class="au-message__item-text">
                                                <div class="avatar-wrap online">
                                                    <div class="avatar">
                                                        <img src="CoolAdmin-master/images/icon/avatar-03.jpg" alt="Nicholas Martinez">
                                                    </div>
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">Anh IT thất nghiệp</h5>
                                                    <p>Admin thật độc ác, tuyển thực tập sinh nhưng lại yêu cầu 2 năm kinh nghiệm!</p>
                                                </div>
                                            </div>
                                            <div class="au-message__item-time">
                                                <span>11:00 PM</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="au-message__item">
                                        <div class="au-message__item-inner">
                                            <div class="au-message__item-text">
                                                <div class="avatar-wrap online">
                                                    <div class="avatar">
                                                        <img src="CoolAdmin-master/images/icon/avatar-04.jpg" alt="Michelle Sims">
                                                    </div>
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">CoCa có đường không calo</h5>
                                                    <p>Uống Pesi không ad</p>
                                                </div>
                                            </div>
                                            <div class="au-message__item-time">
                                                <span>Yesterday</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="au-message__item">
                                        <div class="au-message__item-inner">
                                            <div class="au-message__item-text">
                                                <div class="avatar-wrap">
                                                    <div class="avatar">
                                                        <img src="CoolAdmin-master/images/icon/avatar-05.jpg" alt="Michelle Sims">
                                                    </div>
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">Lương</h5>
                                                    <p>bạn làm gì có lương đâu mà nhìn</p>
                                                </div>
                                            </div>
                                            <div class="au-message__item-time">
                                                <span>Sunday</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="au-message__item js-load-item">
                                        <div class="au-message__item-inner">
                                            <div class="au-message__item-text">
                                                <div class="avatar-wrap online">
                                                    <div class="avatar">
                                                        <img src="CoolAdmin-master/images/icon/avatar-04.jpg" alt="Michelle Sims">
                                                    </div>
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">Deadling</h5>
                                                    <p>Không có deadling, cuộc đời không có ý nghĩa</p>
                                                </div>
                                            </div>
                                            <div class="au-message__item-time">
                                                <span>Yesterday</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="au-message__item js-load-item">
                                        <div class="au-message__item-inner">
                                            <div class="au-message__item-text">
                                                <div class="avatar-wrap">
                                                    <div class="avatar">
                                                        <img src="CoolAdmin-master/images/icon/avatar-05.jpg" alt="Michelle Sims">
                                                    </div>
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">Michelle Sims</h5>
                                                    <p>Purus feugiat finibus</p>
                                                </div>
                                            </div>
                                            <div class="au-message__item-time">
                                                <span>Sunday</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-message__footer">
                                    <button class="au-btn au-btn-load js-load-btn">load more</button>
                                </div>
                            </div>
                            <div class="au-chat">
                                <div class="au-chat__title">
                                    <div class="au-chat-info">
                                        <div class="avatar-wrap online">
                                            <div class="avatar avatar--small">
                                                <img src="CoolAdmin-master/images/icon/avatar-02.jpg" alt="John Smith">
                                            </div>
                                        </div>
                                        <span class="nick">
                                            <a href="#">John Smith</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="au-chat__content">
                                    <div class="recei-mess-wrap">
                                        <span class="mess-time">12 Min ago</span>
                                        <div class="recei-mess__inner">
                                            <div class="avatar avatar--tiny">
                                                <img src="CoolAdmin-master/images/icon/avatar-02.jpg" alt="John Smith">
                                            </div>
                                            <div class="recei-mess-list">
                                                <div class="recei-mess">Lorem ipsum dolor sit amet, consectetur adipiscing elit non iaculis</div>
                                                <div class="recei-mess">Donec tempor, sapien ac viverra</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="send-mess-wrap">
                                        <span class="mess-time">30 Sec ago</span>
                                        <div class="send-mess__inner">
                                            <div class="send-mess-list">
                                                <div class="send-mess">Lorem ipsum dolor sit amet, consectetur adipiscing elit non iaculis</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-chat-textfield">
                                    <form class="au-form-icon">
                                        <input class="au-input au-input--full au-input--h65" type="text" placeholder="Type a message">
                                        <button class="au-input-icon">
                                            <i class="zmdi zmdi-camera"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var ctx = document.getElementById('myChart').getContext('2d');

        var totalMembers = parseFloat('<%= Label2.Text %>');
        var vipMembers = parseFloat('<%= Label1.Text %>');

        // Định nghĩa gradient màu
        var gradient = ctx.createLinearGradient(0, 0, 400, 0);
        gradient.addColorStop(0, '#FF1493'); // Màu hồng
        gradient.addColorStop(1, '#FFD700'); // Màu vàng

        var data = {
            //labels: ['Thành viên VIP', 'Thành viên thường'],
            datasets: [{
                data: [totalMembers, vipMembers],
                backgroundColor: [gradient, '#4287f5'], // Gradient màu và màu xanh nước biển
                hoverBackgroundColor: [gradient, '#3c6cb5'], // Gradient màu và màu xanh nhạt khi di chuột qua
                borderWidth: 0
            }]
        };

        var options = {
            responsive: true,
            maintainAspectRatio: false,
            cutoutPercentage: 60,
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    fontColor: 'black',
                    fontSize: 14,
                    padding: 20
                }
            },
            tooltips: {
                enabled: true,
                backgroundColor: '#f5f5f5',
                bodyFontColor: '#333',
                titleFontColor: '#333',
                borderColor: '#ddd',
                borderWidth: 1,
                cornerRadius: 4,
                caretSize: 6,
                xPadding: 10,
                yPadding: 10
            }
        };

        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: data,
            options: options
        });
    </script>
    <script>
        var ctx = document.getElementById('bieudodoanhthu').getContext('2d');

        var data = {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
            datasets: [{
                label: 'Doanh thu (VND)',
                data: [19000, 99000, 0, 19000, 38000, 76000, 175000, 374000, 298000, 397000, 416000, 425000], // Thêm dữ liệu doanh thu của các tháng còn lại
                backgroundColor: 'rgba(66, 135, 245, 0.2)', // Màu nền của hình lượng sóng
                borderColor: 'rgba(66, 135, 245, 1)', // Màu viền của hình lượng sóng
                borderWidth: 1
            }]
        };

        var options = {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return value.toLocaleString('vi-VN'); // Định dạng số tiền VND
                        }
                    }
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            var value = context.parsed.y;
                            return value.toLocaleString('vi-VN'); // Định dạng số tiền VND
                        }
                    }
                }
            }
        };

        var myChart = new Chart(ctx, {
            type: 'line',
            data: data,
            options: options
        });
    </script>
</asp:Content>
