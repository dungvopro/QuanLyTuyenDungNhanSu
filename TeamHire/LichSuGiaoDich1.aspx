<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LichSuGiaoDich1.aspx.cs" Inherits="TeamHire.LichSuGiaoDich1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Business Premium</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <%--  <link href="Personal/assets/img/favicon.png" rel="icon"/>--%>
    <link href="Personal/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="Personal/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Personal/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="Personal/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="Personal/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="Personal/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="Personal/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="Personal/assets/css/style.css" rel="stylesheet" />

    <!-- =======================================================
  * Template Name: Personal
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/personal-free-resume-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    <style>
        .dungvip {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
            font-size: 14px;
            background: linear-gradient(to left, #ffd700, #ff69b4);
            color: #fff;
            animation: gradientAnimation 5s linear infinite;
        }

            .dungvip option {
                background-color: #fff;
                color: #000;
            }

                .dungvip option:hover {
                    background-color: #f9f9f9;
                }

        @keyframes gradientAnimation {
            0% {
                background-position: 100% 50%;
            }

            100% {
                background-position: 0% 50%;
            }
        }
    </style>
    <style>
        .gradient-3text {
            background: linear-gradient(to right, #FF00FF, #FFD700);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            font-size: 20px;
        }

        .rounded-im3age {
            border: 2px solid #000; /* Màu và độ rộng của viền */
            border-radius: 50%; /* Tạo hình tròn */ /* Chiều cao của hình ảnh */
            object-fit: cover; /* Đảm bảo hình ảnh không bị méo khi thay đổi kích thước */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header id="header" class="header-top">
            <div class="container">

                <h1><a href="#">
                    <asp:Label ID="Label1" runat="server" Text="Dũng võ"></asp:Label></a>
                    <asp:Image ID="Image1" runat="server" CssClass="rounded-im3age" />
                </h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
                <h2>I'm a passionate <span>graphic designer</span> from New York</h2>

                <nav id="navbar" class="navbar">
                    <ul>
                        <%--<li><a class="nav-link active" href="#header">Home</a></li>
          <li><a class="nav-link" href="#about">About</a></li>
          <li><a class="nav-link" href="#resume">Resume</a></li>
          <li><a class="nav-link" href="#services">Services</a></li>
          <li><a class="nav-link" href="#portfolio">Portfolio</a></li>--%>
                        <li><a class="nav-link" href="HoSoCaNhan1.aspx">Quay trở lại</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <!-- .navbar -->

                <div class="social-links">
                    <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                </div>

            </div>
        </header>
        <!-- End Header -->
        <section id="contact" class="contact section-show">
            <div class="container">

                <div class="section-title">
                    <h2>Lịch sử giao dịch</h2>
                    <p>MOMO</p>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6 d-flex align-items-stretch">
                        <div class="info-box">
                            <i class="bx bx-map"></i>
                            <h3>
                                <asp:Label ID="Label13" runat="server" Text="Business Premium:" class="gradient-3text" Font-Bold="True" Font-Size="22px"></asp:Label>
                                <asp:Label ID="Label16" runat="server" Text=" Còn "></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text="26 "></asp:Label>
                                <asp:Label ID="Label20" runat="server" Text="(ngày) "></asp:Label>
                            </h3>
                            <asp:Label ID="Label23" runat="server" Text="Hạn sử dụng đến hết ngày " ForeColor="#999999"></asp:Label>
                            <asp:Label ID="Label24" runat="server" Text="23/3/2023 " ForeColor="#999999"></asp:Label>
                        </div>
                    </div>

                    <div class="col-md-6 mt-4 mt-md-0 d-flex align-items-stretch">
                        <div class="info-box">
                            <i class="bx bx-crown"></i>
                            <h3>Giao dịch thành công
                                <asp:Label ID="Label21" runat="server" Text="2"></asp:Label>
                                lần</h3>
                            <asp:Label ID="Label22" runat="server" Text="Hiện tại giao dịch nào thất bại bằng 0, cảm ơn bạn đã đóng hóp" ForeColor="#999999"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="php-email-form mt-4">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <div class="section-title">
                                <h2>Lịch sử giao dịch</h2>
                            </div>
                        </div>
                        <%--                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <div class="gradient-3text" style="float: right; margin-right: 10px;">
                                <i class="bx bx-crown"></i>
                                <asp:Label ID="Label2" runat="server" Text="Gói 1 tháng" Font-Bold="True"></asp:Label>
                            </div>
                        </div>--%>
                    </div>
                    <div class="card-body">
                        <div>
                            <asp:DataList ID="DataList1" runat="server" Style="width: 100%">
                                <HeaderTemplate>
                                    <table class="table-hover text-nowrap" style="width: 100%">
                                        <tr>
                                            <th style="width: 1%"></th>
                                            <th style="width: 10%">#</th>
                                            <th style="width: 25%">Tiêu đề</th>
                                            <th style="width: 20%">Người thực hiện</th>
                                            <th style="width: 20%">Trạng thái</th>
                                            <th style="width: 15%">Số tiền</th>

                                            <th></th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <td>
                                        <img src="assets\images\momo.jpg" height="60" width="60" style="filter: brightness(70%); border-radius: 10%;">
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTenCLV" runat="server" Text='<%# Eval("TenGD") %>' Font-Bold="True" ForeColor="#999999"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%# Eval("NguoiGD") %>' ForeColor="#999999"></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Text='<%# Eval("mailGD") %>' ForeColor="#999999" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("TrangThaiGD") %>' ForeColor="#339966"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NgayGD") %>' ForeColor="#999999"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("SoTien") %>' Font-Bold="True" ForeColor="#999999"></asp:Label>
                                    </td>
                                    <td style="display: flex; justify-content: flex-end;">
                                        <div style="display: flex; justify-content: flex-end;">
                                            <a href="#">
                                                <asp:Button ID="EditButto" runat="server" Text="Xem chi tiết" CssClass="btn btn-info btn-sm mr-2" CommandName="edit" CommandArgument='<%# Eval("MaGD") %>' />
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
                            <ul class="pagination pagination-sm m-0 float-right" style="float: right;">
                                <li class="page-item" style="background-color: transparent;">
                                    <asp:LinkButton ID="btnTruoc" runat="server" OnClick="btnTruoc_Click" CssClass="page-link" Text="&laquo;" Style="background-color: transparent;" ForeColor="Silver" Font-Bold="True"></asp:LinkButton>
                                </li>
                                <li class="page-item">
                                    <asp:LinkButton ID="lnkPage1" runat="server" OnClick="lnkPage_Click" CssClass="page-link" Text="1" CommandArgument="1" Style="background-color: transparent;" ForeColor="Silver" Font-Bold="True"></asp:LinkButton>
                                </li>
                                <li class="page-item">
                                    <asp:LinkButton ID="lnkPage2" runat="server" OnClick="lnkPage_Click" CssClass="page-link" Text="2" CommandArgument="2" Style="background-color: transparent;" ForeColor="Silver" Font-Bold="True"></asp:LinkButton>
                                </li>
                                <li class="page-item">
                                    <asp:LinkButton ID="lnkPage3" runat="server" OnClick="lnkPage_Click" CssClass="page-link" Text="3" CommandArgument="3" Style="background-color: transparent;" ForeColor="Silver" Font-Bold="True"></asp:LinkButton>
                                </li>
                                <li class="page-item">
                                    <asp:LinkButton ID="btnSau" runat="server" OnClick="btnSau_Click" CssClass="page-link" Text="&raquo;" Style="background-color: transparent;" ForeColor="Silver" Font-Bold="True"></asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <%--                    <div class="form-group mt-3">
                        <asp:Label ID="Label5" runat="server" Text="Thời gian " ForeColor="#999999"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="Business Premium" class="gradient-3text"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text=" còn lại của bạn là: " ForeColor="#999999"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text=" 12 " ForeColor="#999999"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text="(ngày) +" ForeColor="#999999"></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text=" 1 (tháng)" class="gradient-3text"></asp:Label>
                    </div>--%>
                    <%--                    <div class="row">
                        <div class="col-6">
                            <div class="form-group mt-3">
                                <div style="text-align: left;">
                                    <i class="bx bx-check-double" style="color: darkgoldenrod; font-size: 16px;"></i>
                                    <asp:Label ID="Label82" runat="server" Text="Mở khóa" Font-Size="16px" ForeColor="#999999"></asp:Label>
                                    <asp:Label ID="Label85" runat="server" Text=" đăng tin tuyển dụng" Font-Size="16px" ForeColor="#FF6600"></asp:Label>
                                    <br />
                                    <i class="bx bx-check-double" style="color: darkgoldenrod; font-size: 16px;"></i>
                                    <asp:Label ID="Label83" runat="server" Text="Mở khóa" Font-Size="16px" ForeColor="#999999"></asp:Label>
                                    <asp:Label ID="Label86" runat="server" Text=" quản lý nhân sự" Font-Size="16px" ForeColor="#FF6600"></asp:Label>
                                    <br />
                                    <i class="bx bx-check-double" style="color: darkgoldenrod; font-size: 16px;"></i>
                                    <asp:Label ID="Label84" runat="server" Text="Giấy phép thương mại doanh nghiệp" Font-Size="16px" ForeColor="#999999"></asp:Label>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group mt-3">
                                <div class="row">
                                    <div class="col-5"></div>
                                    <div class="col-4">
                                        <div style="text-align: left;">

                                            <asp:Label ID="Label15" runat="server" Text="Giá gói:" Font-Size="16px" ForeColor="#999999"></asp:Label>

                                            <br />

                                            <asp:Label ID="Label17" runat="server" Text="Phí thanh toán:" Font-Size="16px" ForeColor="#999999"></asp:Label>

                                            <br />

                                            <asp:Label ID="Label19" runat="server" Text="Tổng thanh toán:" Font-Size="16px" ForeColor="#999999" Font-Bold="True"></asp:Label>

                                            <br />
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div style="text-align: right;">


                                            <asp:Label ID="Label10" runat="server" Text=" 19.000 vnd" Font-Size="16px" ForeColor="#999999"></asp:Label>
                                            <br />


                                            <asp:Label ID="Label12" runat="server" Text=" 0 vnd" Font-Size="16px" ForeColor="#999999"></asp:Label>
                                            <br />


                                            <asp:Label ID="Label14" runat="server" Text=" 19.000 vnd" Font-Size="16px" ForeColor="#999999" Font-Bold="True"></asp:Label>
                                            <br />
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>--%>
                    <%--                    <div style="text-align: center;">
                        <i class="bx bx-check-shield" style="color: #33CC33; font-size: 16px;"></i>
                        <asp:Label ID="Label9" runat="server" Text="Thanh toán an toàn" Font-Size="16px" ForeColor="#999999"></asp:Label>
                    </div>--%>
                    <%--<div class="my-3">
                        <div class="loading">Loading</div>
                        <div class="error-message"></div>
                        <div class="sent-message">Your message has been sent. Thank you!</div>
                    </div>--%>
                    <%--                    <div class="text-center">
                        <asp:Button ID="Button1" runat="server" Text="Xác nhận" Style="background: linear-gradient(to right, #ff69b4, #ffd700); color: white; border: none; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; border-radius: 4px; transition-duration: 0.4s; cursor: pointer;" />
                    </div>--%>
                    <div style="text-align: left;">
                        <asp:Label ID="Label11" runat="server" Text="Đồng ý với điều khoản dịch vụ." Font-Size="16px" ForeColor="#999999"></asp:Label>
                    </div>
                </div>
            </div>
            <div id="paymentForm" runat="server">
                <div id="paypalButton"></div>
            </div>


        </section>

        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/personal-free-resume-bootstrap-template/ -->
            Designed by <a href="https://www.facebook.com/dung.vovan.980/">DungVo</a>
        </div>
    </form>
    <script src="Personal/assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="Personal/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="Personal/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="Personal/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="Personal/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="Personal/assets/vendor/waypoints/noframework.waypoints.js"></script>
    <script src="Personal/assets/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script src="Personal/assets/js/main.js"></script>
</body>

</html>
