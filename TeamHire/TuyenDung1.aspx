<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="TuyenDung1.aspx.cs" Inherits="TeamHire.TuyenDung1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="assets/css/tuyendung01.css">
    <link rel="stylesheet" href="assets/css/tuyendung04.css">
        <link rel="stylesheet" href="assets/css/tuyendung-meeting-page.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
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


        <section class="meetings-page">
            <div class="container ie-h-align-center-fix">
                <div class="row">
                    <div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">
                        <div action="Index.aspx" method="get" class="tm-search-form tm-section-pad-2">
                            <div class="form-row ">
                                <div class="form-group tm-form-element tm-form-element-100">
                                    <i class="fa fa-search fa-2x tm-form-element-icon"></i>
                                    <!--<input name="city" type="text" class="form-control" id="inputCity" placeholder="Type your destination...">-->
                                    <asp:TextBox ID="timkiem" runat="server" class="form-control" placeholder="Nhập từ khóa.."></asp:TextBox>
                                </div>
                                <div class="form-group tm-form-element tm-form-element-50">
                                    <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                    <select name="congviec" class="form-control tm-select" id="cv" runat="server">
                                        <option value="0">Công việc</option>
                                    </select>
                                </div>
                                <!--<div class="form-group tm-form-element tm-form-element-2">
                                    <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                    <select name="adult" class="form-control tm-select" id="congviec"  runat="server">
                                        <option value="">Công việc</option>
                                        <option value="1">Phục vụ</option>
                                        <option value="2">Pha chế</option>
                                        <option value="3">Bếp</option>
                                        <option value="4">Kế toán</option>
                                        <option value="5">...</option>
                                    </select>
                                </div>-->
                                 <!--<div class="form-group tm-form-element tm-form-element-50">
                                    <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                    <select name="khuvuc" class="form-control tm-select" id="khuvuc" runat="server">
                                        <option value="">Tỉnh/thành phố</option>
                                    </select>
                                </div>-->
                               <div class="form-group tm-form-element tm-form-element-50">
                                    <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                    <select name="khuvuc" class="form-control tm-select" id="kc" runat="server">
                                        <option value="0">Tỉnh/thành phố</option>
                                        <option value="An Giang">An Giang</option>
                                        <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                        <option value="Bắc Giang">Bắc Giang</option>
                                        <option value="Bắc Kạn">Bắc Kạn</option>
                                        <option value="Bạc Liêu">Bạc Liêu</option>
                                        <option value="Bắc Ninh">Bắc Ninh</option>
                                        <option value="Bến Tre">Bến Tre</option>
                                        <option value="Bình Định">Bình Định</option>
                                        <option value="Bình Dương">Bình Dương</option>
                                        <option value="Bình Phước">Bình Phước</option>
                                        <option value="Bình Thuận">Bình Thuận</option>
                                        <option value="Cà Mau">Cà Mau</option>
                                        <option value="Cần Thơ">Cần Thơ</option>
                                        <option value="Cao Bằng">Cao Bằng</option>
                                        <option value="Đà Nẵng">Đà Nẵng</option>
                                        <option value="Đắk Lắk">Đắk Lắk</option>
                                        <option value="Đắk Nông">Đắk Nông</option>
                                        <option value="Điện Biên">Điện Biên</option>
                                        <option value="Đồng Nai">Đồng Nai</option>
                                        <option value="Đồng Tháp">Đồng Tháp</option>
                                        <option value="Gia Lai">Gia Lai</option>
                                        <option value="Gia Lai">Gia Lai</option>
                                        <option value="Hà Nam">Hà Nam</option>
                                        <option value="Hà Nội">Hà Nội</option>
                                        <option value="Hà Tĩnh">Hà Tĩnh</option>
                                        <option value="Hải Phòng">Hải Phòng</option>
                                        <option value="Hậu Giang">Hậu Giang</option>
                                        <option value="Hòa Bình">Hòa Bình</option>
                                        <option value="Hưng Yên">Hưng Yên</option>
                                        <option value="Khánh Hòa">Khánh Hòa</option>
                                        <option value="Kiên Giang">Kiên Giang</option>
                                        <option value="Kon Tum">Kon Tum</option>
                                        <option value="Lai Châu">Lai Châu</option>
                                        <option value="Lâm Đồng">Lâm Đồng</option>
                                        <option value="Lạng Sơn">Lạng Sơn</option>
                                        <option value="Lào Cai">Lào Cai</option>
                                        <option value="Long An">Long An</option>
                                        <option value="Nam Định">Nam Định</option>
                                        <option value="Nghệ An">Nghệ An</option>
                                        <option value="Ninh Bình">Ninh Bình</option>
                                        <option value="Ninh Thuận">Ninh Thuận</option>
                                        <option value="Phú Thọ">Phú Thọ</option>
                                        <option value="Phú Yên">Phú Yên</option>
                                        <option value="Quảng Bình">Quảng Bình</option>
                                        <option value="Quảng Nam">Quảng Nam</option>
                                        <option value="Quảng Ngãi">Quảng Ngãi</option>
                                        <option value="Quảng Ninh">Quảng Ninh</option>
                                        <option value="Quảng Trị">Quảng Trị</option>
                                        <option value="Sóc Trăng">Sóc Trăng</option>
                                        <option value="Sơn La">Sơn La</option>
                                        <option value="Tây Ninh">Tây Ninh</option>
                                        <option value="hái Bình">hái Bình</option>
                                        <option value="Thái Nguyên">Thái Nguyên</option>
                                        <option value="Thanh Hóa">Thanh Hóa</option>
                                        <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                        <option value="Tiền Giang">Tiền Giang</option>
                                        <option value="TP. Hồ Chí Minh">TP. Hồ Chí Minh</option>
                                        <option value="Trà Vinh">Trà Vinh</option>
                                        <option value="Tuyên Quang">Tuyên Quang</option>
                                        <option value="Vĩnh Long">Vĩnh Long</option>
                                        <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                        <option value="Yên Bái">Yên Bái</option>
                                    </select>
                                </div>
                                
                            </div>
                            <div class="form-row ">                               
                                <div class="form-group tm-form-element tm-form-element-2">
                                    <select name="mucluong" class="form-control tm-select" id="mucluong"  runat="server">
                                        <option value="0">Mức lương</option>
                                        <option value="Thương lượng">Thương lượng</option>
                                        <option value="1">1 triệu</option>
                                        <option value="2">1 - 3 triệu</option>
                                        <option value="3">3 - 5 triệu</option>
                                        <option value="4">5 - 10 triệu</option>
                                        <option value="5">10 - 15 triệu</option>
                                        <option value="6">15 - 25 triệu</option>
                                        <option value="7">trên 25 triệu</option>
                                    </select>
                                    <i class="fa fa-2x fa-euro tm-form-element-icon"></i>
                                </div>
                                <!--<div class="form-group tm-form-element tm-form-element-2">
                                    <select name="capbac" class="form-control tm-select" id="capbac" runat="server">
                                        <option value="0">Cấp bậc</option>
                                    </select>
                                    <i class="fa fa-2x fa-certificate tm-form-element-icon"></i>
                                </div>-->
                                <div class="form-group tm-form-element tm-form-element-2">
                                    <select name="children" class="form-control tm-select" id="capbaac" runat="server">
                                        <option value="0">Cấp bậc</option>
                                        <option value="thực tập">thực tập</option>
                                        <option value="Nhân viên">Nhân viên</option>
                                        <option value="Trưởng nhóm">Trưởng nhóm</option>
                                        <option value="Quản lý">Quản lý</option>
                                        <option value="Giám đốc">Giám đốc</option>
                                    </select>
                                    <i class="fa fa-2x fa-certificate tm-form-element-icon "></i>
                                </div>
                                <div class="form-group tm-form-element tm-form-element-2">
                                    <i class="fa fa-star fa-2x tm-form-element-icon"></i>
                                    <select name="kinhn" class="form-control tm-select" id="kinhn"  runat="server">
                                        <option value="0">Kinh nghiệm</option>
                                        <option value="Chưa có kinh nghiệm">Chưa có kinh nghiệm</option>
                                        <option value="Dưới 1 năm kinh nghiệm">Dưới 1 năm kinh nghiệm</option>
                                        <option value="Dưới 2 năm kinh nghiệm">Dưới 2 năm kinh nghiệm</option>
                                        <option value="Trên 2 năm kinh nghiệm">Trên 2 năm kinh nghiệm</option>
                                        <option value="Hơn 10 năm kinh nghiệm">Hơn 10 năm kinh nghiệm</option>
                                    </select>
                                </div>
                                <div class="form-group tm-form-element tm-form-element-2">
                                    <asp:Button ID="Button1" runat="server" class="btn btn-primary tm-btn-search" Text="Tìm kiếm" OnClick="Button1_Click"/>
                                    <!--<button type="submit" class="btn btn-primary tm-btn-search">Tìm kiếm</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="meetings-page" id="meetings">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="filters">
                                    <ul>
                                        <li data-filter="*" class="active">Tất cả</li>
                                        <li data-filter=".soon">Đáng chú ý</li>
                                        <li data-filter=".imp">Trong tuần này</li>
                                        <li data-filter=".att">Lược xem nhiều</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="row grid">
                                    <asp:DataList ID="DataList1" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-4 all soon">
                                                <div class="meeting-item">
                                                    <div class="thumb">
                                                        <div class="price">
                                                            <span>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NganhNghe") %>'></asp:Label>
                                                            </span>
                                                        </div>
                                                            <!--<img src="assets/images/meeting-01.jpg" alt="">-->
                                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("MaTD") %>' ImageUrl='<%# "../assets/images/"+ Eval("Logo") %>' Width="100%" style="overflow: hidden; border-top-right-radius: 20px; border-top-left-radius: 20px;" OnClick="ImageButton1_Click"/>
                                                    </div>
                                                    <div class="down-content" >
                                                        <div class="thumb">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenTD") %>' Font-Size="24px" Font-Bold="True" ></asp:Label>
                                                            <br />

                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DonGia") %>' Font-Size="14px"></asp:Label>
                                                            <asp:Label ID="Label6" runat="server" Text=" | "></asp:Label>
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("CapBac") %>' Font-Size="14px"></asp:Label>
                                                            <asp:Label ID="Label8" runat="server" Text=" | "></asp:Label>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("DiaChi") %>' Font-Size="14px"></asp:Label>

                                                            <br />
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ThongTinCongTy") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>

                            <div class="pagination">
                                <ul>
                                    <li>
                                        <asp:LinkButton ID="btnTruoc" runat="server" OnClick="btnTruoc_Click" CssClass="prev" Text="&laquo;"></asp:LinkButton>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="btnSau" runat="server" OnClick="btnSau_Click" CssClass="next" Text="&raquo;"></asp:LinkButton>
                                    </li>
                                </ul>
                            </div>

                            <!--<div class="col-lg-12">
              <div class="row grid">
                <div class="col-lg-4 templatemo-item-col all soon">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$14.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-01.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>12</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>New Lecturers Meeting</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all imp">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$22.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-02.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>14</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>Online Teaching Techniques</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all soon">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$24.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-03.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>16</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>Network Teaching Concept</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all att">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$32.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-04.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>18</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>Online Teaching Tools</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all att">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$34.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-02.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>22</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>New Teaching Techniques</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all imp">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$45.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-03.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>24</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>Technology Conference</h4></a>
                      <p>TemplateMo is the best website<br>when it comes to Free CSS.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all imp att">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$52.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-01.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>27</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>Online Teaching Techniques</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all soon imp">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$64.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-02.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>28</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>Instant Lecture Design</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all att soon">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$74.00</span>
                      </div>
                      <a href="meeting-details.html"><img src="assets/images/meeting-03.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>30</span></h6>
                      </div>
                      <a href="meeting-details.html"><h4>Online Social Networking</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>-->

                        </div>
                    </div>
                </div>
            </div>
            
        </section>
    <section class="contact-us" id="contact">

        <div class="footer">
            <p>
                ĐỘI NGŨ PHÁT TRUYỂN WEBSITE TUYỂN DỤNG & QUẢN LÝ NHÂN SỰ 2023
          <br>
                Nhóm: <a href="#" target="_parent" title="free css templates">6</a>
            </p>
        </div>
    </section>
    
    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/isotope.js"></script>
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
