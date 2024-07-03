<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ChiTietTuyenDung1.aspx.cs" Inherits="TeamHire.ChiTietTuyenDung1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-button {
            display: inline-block;
            background-color: #ccc;
            color: #fff;
            padding: 9px 22px;
            border-radius: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

            .custom-button:hover {
                background-color: #999;
            }
    </style>
    <style>
        /* CSS cho giao diện nộp CV */
        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        #cvForm {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            z-index: 9999;
            color: black;
        }

            #cvForm input[type="text"],
            #cvForm select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            #cvForm select {
                background-color: #c0ddf6;
            }

            #cvForm button {
                background-color: #c0ddf6;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

        #submitHeader {
            text-align: center;
        }

            #submitHeader h3 {
                display: inline-block;
                position: relative;
            }

                #submitHeader h3:after {
                    content: "";
                    position: absolute;
                    bottom: -5px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 90%;
                    height: 2px;
                    background-color: #0077b6;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ***** Header Area End ***** -->

    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Tìm việc làm nhanh 24h</h6>
                    <h2>Việc làm mới nhất trên toàn quốc</h2>
                </div>
            </div>
        </div>
    </section>
    <div>
        <!-- Giao diện nộp CV -->
        <div id="overlay"></div>
        <div id="cvForm">
            <div id="submitHeader">
                <h3>Nộp đơn
                    <asp:Label ID="Label29" runat="server" Text="xin việc" Font-Bold="True" ForeColor="#333333"></asp:Label></h3>
            </div>
            <div>
                <br />
                <asp:Label ID="Label32" runat="server" Text="Thỏ Chê Cỏ" Font-Italic="True" Font-Bold="True"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label33" runat="server" Text="dungvopro@gmail.com" Font-Size="12px" ForeColor="#666666"></asp:Label>
            </div>
            <div>
                <br />
                <asp:Label ID="Label34" runat="server" Text="Hồ sơ xin việc*" Font-Bold="True"></asp:Label>
                <asp:Label ID="Label45" runat="server" Text="(Vui lòng thêm CV)*" ForeColor="Red" Font-Size="14px" Visible="False"></asp:Label>
                <select id="fileCV" name="fileCV" onchange="selectFile()">
                    <option value="">Chọn hồ sơ</option>
                    <option value="maytinh">Từ máy tính</option>
                    <option value="careerlink">Tạo mới ở canva</option>
                </select>
                <a id="fileCVXuatTuMayTinh" style="display: none;">
                    <asp:FileUpload ID="FileUpload1" runat="server" /></a>

                <input type="file" id="fileCVXuatTuCareerlink" style="display: none;" />
                <li class="breadcrumb-item"><a class="btn btn-success btn-sm" id="fffffffdd" href="https://www.canva.com/" style="display: none;">
                    <i class="fas fa-plus-circle"></i>
                    Thêm mới
                </a></li>
            </div>
            <div>
                <asp:Label ID="Label35" runat="server" Text="File: doc, docx, xls, pdf ." Font-Size="12px" ForeColor="#666666"></asp:Label>
                <asp:Label ID="Label46" runat="server" Text="(tối đa 3MB)." Font-Size="12px" ForeColor="#666666"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label36" runat="server" Text="Nhà tuyển dụng yêu cầu hồ sơ: " Font-Size="12px" ForeColor="#666666"></asp:Label>
                <asp:Label ID="Label37" runat="server" Text="Tiếng Việt" Font-Size="12px" ForeColor="Red"></asp:Label>
            </div>
            <div>
                <br />
                <asp:Label ID="Label38" runat="server" Text="Số điện thoại*" Font-Bold="True"></asp:Label>
                <asp:Label ID="Label44" runat="server" Text="" ForeColor="Red" Font-Size="14px" Visible="False"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server">0</asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label39" runat="server" Text="Nhà tuyển dụng có thể liên hệ với bạn qua số điện thoại này." Font-Size="12px" ForeColor="#666666"></asp:Label>
            </div>
            <div>
                <br />
                <asp:Label ID="Label40" runat="server" Text="Thư xin việc" Font-Bold="True"></asp:Label>
                <asp:Label ID="Label41" runat="server" Text=" (Không bắt buộc)" Font-Size="12px" ForeColor="#666666"></asp:Label>
            </div>
            <div>
                <textarea id="myTextarea" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
            </div>
            <div>
                <asp:Label ID="Label42" runat="server" Text="Lưu ý: Ứng viên nên lựa chọn ứng tuyển bằng CV Online & viết thêm" Font-Size="12px" ForeColor="#666666"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label43" runat="server" Text="mong muốn tại phần thư giới thiệu để được Nhà tuyển dụng xem CV sớm hơn." Font-Size="12px" ForeColor="#666666"></asp:Label>
            </div>
            <asp:Button ID="Button1" OnClick="nopdontd_Click" runat="server" Text="Nộp đơn" Style="padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; float: right; background-color: #A12C2f; color: #FFFFFF; font-weight: bold;" />
            <%-- <button type="button" id="btnNoptDon" OnClick="nopdontd_Click" runat="server" style="float: right; background-color: #A12C2f; color: #FFFFFF; font-weight: bold;">Nộp đơn</button>--%>
            <%--<button onclick="HideCVForm()" style="float: right; background-color: #808080;">Hủy</button>--%>
            <asp:Button ID="Button2" OnClick="huyy_Click" runat="server" style="padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; float: right; background-color: #808080;" Text="Hủy" ForeColor="White" />
        </div>
    </div>
    <div id="Div1" runat="server" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.7); border-radius: 10px; z-index: 999;">
        <div id="successMessage" runat="server" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #ffffff; padding: 20px; border-radius: 40px; z-index: 1000;">
            <h2 style="color: #008000;"><i class="fa fa-check-circle fa-3x" style="color: #008000;"></i>Nộp đơn thành công</h2>
            <span id="closeButton" style="position: absolute; top: 10px; right: 10px; cursor: pointer;">&times;</span>
        </div>
    </div>
    <section class="meetings-page" id="meetings">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:DataList ID="DataList1" runat="server" Width="100%">
                                <ItemTemplate>
                                    <div class="meeting-single-item">
                                        <div class="thumb">
                                            <div class="price">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NganhNghe") %>'></asp:Label>
                                            </div>
                                            <div class="date">
                                                <h6>
                                                    <asp:Label ID="LabelMonth" runat="server" Text='<%# (DateTime.Now - Convert.ToDateTime(Eval("NgayTD"))).TotalDays.ToString("N0") %>'>
                                                    </asp:Label><span><asp:Label ID="LabelDay" runat="server" Text="ngày"></asp:Label></span></h6>
                                            </div>
                                            <!--<img src="assets/images/single-meeting.jpg" alt="">-->

                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../assets/images/"+ Eval("Logo") %>' Width="100%" Height="400px" Style="object-fit: cover; object-position: center;" />

                                        </div>
                                        <div class="down-content">
                                            <div style="display: flex; align-items: center;">
                                                <div style="flex: 1;">
                                                    <a href="meeting-details.html">
                                                        <h4>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenTD") %>'></asp:Label>
                                                        </h4>
                                                    </a>
                                                    <p>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ThongTinCongTy") %>'></asp:Label>
                                                    </p>
                                                </div>
                                                <div style="display: flex; flex-direction: column;">
                                                    <h6>
                                                        <i class="fa fa-map-marker tm-form-element-icon" style="color: black;"></i>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("DiaChi") %>' Style="opacity: 0.5;" ForeColor="#333333"></asp:Label>
                                                    </h6>
                                                    <h6>
                                                        <i class="fa fa-dollar tm-form-element-icon" style="color: dodgerblue;"></i>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("DonGia") %>' ForeColor="#0066FF"></asp:Label>
                                                    </h6>
                                                    <h6>
                                                        <i class="fa fa-star tm-form-element-icon" style="color: black;"></i>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("NamKinhNghiem") %>' Style="opacity: 0.5;" ForeColor="#333333"></asp:Label>
                                                    </h6>
                                                    <h6>
                                                        <i class="fa fa-calendar tm-form-element-icon" style="color: black;"></i>
                                                        <asp:Label ID="Label8" runat="server" Text="Ngày hết hạn:" Style="opacity: 0.5;" ForeColor="#333333"></asp:Label>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Convert.ToDateTime(Eval("NgayTD")).ToString("dd/MM") %>' ForeColor="Black"></asp:Label>
                                                    </h6>
                                                </div>
                                            </div>

                                            <p class="description">


                                                <asp:Label ID="Label9" runat="server" Text="Mô tả công việc" Font-Bold="True" Font-Size="18px"></asp:Label><br />
                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("ChiTietCongViec") %>' Style="white-space: pre-wrap;"></asp:Label>


                                            </p>
                                            <p class="row">


                                                <asp:Label ID="Label11" runat="server" Text="Kinh nghiệm / Kỹ năng chi tiết" Font-Bold="True" Font-Size="18px"></asp:Label><br />
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("KyNangYeuCau") %>' Style="white-space: pre-wrap;"></asp:Label>


                                            </p>
                                            <p class="description">


                                                <asp:Label ID="Label13" runat="server" Text="Phúc lợi" Font-Bold="True" Font-Size="18px"></asp:Label><br />
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("QuyenLoi") %>' Style="white-space: pre-wrap;"></asp:Label>


                                            </p>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="hours">
                                                        <h5>Người đăng</h5>
                                                        <p>
                                                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("username") %>'></asp:Label><br>
                                                            Saturday- Sunday: 09:00 AM
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="location">
                                                        <h5>Mô tả</h5>
                                                        <p>
                                                            <asp:Label ID="Label16" runat="server" Text="Ngành nghề: "></asp:Label>
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("NganhNghe") %>'></asp:Label>
                                                            <br>
                                                            <asp:Label ID="Label17" runat="server" Text="Cấp bậc: "></asp:Label>
                                                            <asp:Label ID="Label18" runat="server" Text='<%# Eval("CapBac") %>'></asp:Label>
                                                            <br>
                                                            <asp:Label ID="Label19" runat="server" Text="Giới tính: "></asp:Label>
                                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("GioiTinh") %>'></asp:Label>
                                                            <br>
                                                            <asp:Label ID="Label21" runat="server" Text="Ngày tuyển dụng: "></asp:Label>
                                                            <asp:Label ID="Label22" runat="server" Text='<%# Convert.ToDateTime(Eval("NgayTD")).ToString("dd/MM") %>'></asp:Label>
                                                            <asp:Label ID="Label23" runat="server" Text=" | Ngày hết hạn: "></asp:Label>
                                                            <asp:Label ID="Label24" runat="server" Text='<%# Convert.ToDateTime(Eval("NgayHetHan")).ToString("dd/MM") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label25" runat="server" Text='<%# "Số ngày còn lại: " + (Convert.ToDateTime(Eval("NgayHetHan")) - DateTime.Now).TotalDays.ToString("N0") + " Ngày" %>'></asp:Label>

                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="book now">
                                                        <h5>Thông tin liên hệ</h5>
                                                        <p>
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("ThongTinLienHe") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label30" runat="server" Text="Công ty: "></asp:Label>
                                                            <asp:Label ID="Label27" runat="server" Text='<%# Eval("ThongTinCongTy") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label31" runat="server" Text="Vị trí cụ thể: "></asp:Label>
                                                            <asp:Label ID="Label28" runat="server" Text='<%# Eval("DiaChiCuThe") %>'></asp:Label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="share">
                                                        <h5>Share:</h5>
                                                        <ul>
                                                            <li><a href="#">Facebook</a>,</li>
                                                            <li><a href="#">Twitter</a>,</li>
                                                            <li><a href="#">Linkedin</a>,</li>
                                                            <li><a href="#">Behance</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>

                            </asp:DataList>
                        </div>
                        <div class="col-lg-12" style="display: flex; justify-content: center;">
                            <div style="margin-right: -30px; margin-top: 30px;">
                                <a href="TuyenDung1.aspx" class="custom-button">Quay lại . .</a>
                            </div>
                            <div class="main-button-red">
                                <a id="nopdon" runat="server" href="#" onclick="ShowCVForm()">Nộp đơn</a>
                            </div>
                            <div class="main-button-red">
                                <a id="A1" runat="server" OnClick="I1_Click">Nộp đơn</a>
                            </div>
                            
                        </div>
                        <asp:Label ID="Label49" runat="server" Text="(Cần đăng nhập *)" style="display: flex; justify-content: center;" Visible="False" Font-Size="13px"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>
                <asp:TextBox ID="TextBox2" runat="server" Width="1px" Height="1px">01</asp:TextBox>
                <asp:Label ID="Label48" runat="server" Text="" ></asp:Label>
          <br>
                Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a>
            </p>
        </div>
    </section>

    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript">
        var textBoxValue = document.getElementById("<%= TextBox1.ClientID %>").value;
        var textBoxValue2 = document.getElementById("<%= TextBox2.ClientID %>").value;
        var fileUploadValue = document.getElementById("<%= FileUpload1.ClientID %>").value;

        if (textBoxValue.trim() === '' || textBoxValue2.trim() === '') {
            var overlay = document.getElementById("overlay");
            var cvForm = document.getElementById("cvForm");
            overlay.style.display = "block";
            cvForm.style.display = "block";

        }
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var overl = document.getElementById('<%= Div1.ClientID %>');
<%--        var successMessage = document.getElementById('<%= successMessage.ClientID %>');
        var closeButton = successMessage.querySelector('#closeButton');--%>

            overl.addEventListener('click', function (event) {
                if (event.target === overl) {
                    // Ẩn giao diện "Nộp đơn thành công"
                    overl.style.display = 'none';
                    window.location.href = "TuyenDung1.aspx";
                }
            });
        });
    </script>
    <script>
        function ShowCVForm() {
            var overlay = document.getElementById("overlay");
            var cvForm = document.getElementById("cvForm");

            overlay.style.display = "block";
            cvForm.style.display = "block";

        }

        function HideCVForm() {
            var overlay = document.getElementById("overlay");
            var cvForm = document.getElementById("cvForm");

            overlay.style.display = "none";
            cvForm.style.display = "none";
        }
        function selectFile() {
            var selectedValue = document.getElementById("fileCV").value;
            var fileCVXuatTuMayTinh = document.getElementById("fileCVXuatTuMayTinh");
            var fileCVXuatTuCareerlink = document.getElementById("fileCVXuatTuCareerlink");
            var hyperLink = document.getElementById("fffffffdd");

            // Ẩn tất cả các input file
            fileCVXuatTuMayTinh.style.display = "none";
            fileCVXuatTuCareerlink.style.display = "none";
            hyperLink.style.display = "none";
            // Hiển thị input file tương ứng với giá trị đã chọn
            if (selectedValue === "maytinh") {
                fileCVXuatTuMayTinh.style.display = "block";
            } else if (selectedValue === "careerlink") {
                hyperLink.style.display = "block";
            }
        }

    </script>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
            var
                direction = section.replace(/#/, ''),
                reqSection = $('.section').filter('[data-section="' + direction + '"]'),
                reqSectionPos = reqSection.offset().top - 0;

            if (isAnimate) {
                $('body, html').animate({
                    scrollTop: reqSectionPos
                },
                    800);
            } else {
                $('body, html').scrollTop(reqSectionPos);
            }

        };

        var checkSection = function checkSection() {
            $('.section').each(function () {
                var
                    $this = $(this),
                    topEdge = $this.offset().top - 80,
                    bottomEdge = topEdge + $this.height(),
                    wScroll = $(window).scrollTop();
                if (topEdge < wScroll && bottomEdge > wScroll) {
                    var
                        currentId = $this.data('section'),
                        reqLink = $('a').filter('[href*=\\#' + currentId + ']');
                    reqLink.closest('li').addClass('active').
                        siblings().removeClass('active');
                }
            });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
            e.preventDefault();
            showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
            checkSection();
        });
    </script>
</asp:Content>
