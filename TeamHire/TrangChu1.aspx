<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="TrangChu1.aspx.cs" Inherits="TeamHire.TrangChu1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section main-banner" id="top" data-section="section1">
        <video autoplay muted loop id="bg-video">
            <source src="assets/images/ahaha.mp4" type="video/mp4" />
        </video>

        <div class="video-overlay header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="caption">
                            <h6>Chào mừng bạn đến với website</h6>
                            <h2>Tuyển dụng và quản lý nhân sự thông minh</h2>
                            <p>
                                Quản lý sự vụ, thủ tục đến Đơn từ online <a rel="nofollow" href="https://templatemo.com/page/1" target="_blank">Đơn từ online</a>. Khởi tạo, phê duyệt đơn từ của nhân sự nhanh chóng ngay trên thiết bị di động

Tự động gửi thông báo cho quản lý khi có đơn cần duyệt và kết quả đến nhân viên khi đơn được duyệt. Dễ dàng kết nối và xử lý theo quyền quản trị và cấp bậc <a rel="nofollow" href="https://www.pexels.com/@pressmaster" target="_blank">quản trị và cấp bậc</a>.
                            </p>
                            <div class="main-button-red">
                                <div><a href="QuanTri.aspx">Tham gia ngay!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="owl-service-item owl-carousel">

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-01.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Tiếp cận đa dạng</h4>
                                <p>Một trang web tuyển dụng nhân sự cho phép bạn tiếp cận và thu hút một lượng lớn ứng viên từ khắp nơi trên thế giới.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-02.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Thời gian và nguồn lực</h4>
                                <p>Sử dụng trang web tuyển dụng nhân sự giúp tiết kiệm thời gian và nguồn lực so với việc tuyển dụng truyền thống.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-03.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Xây dựng thương hiệu</h4>
                                <p>Một trang web tuyển dụng nhân sự cung cấp cho bạn một nền tảng để xây dựng và tăng cường thương hiệu nhà tuyển dụng của bạn.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-02.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Tăng tính tương tác</h4>
                                <p>Một trang web tuyển dụng nhân sự cho phép bạn tương tác trực tiếp với ứng viên thông qua các biểu mẫu trực tuyến.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-03.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Quản lý và phân tích</h4>
                                <p>Một trang web tuyển dụng nhân sự cung cấp các công cụ và chức năng cho phép bạn quản lý và phân tích dữ liệu tuyển dụng.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="upcoming-meetings" id="meetings">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>Tuyển dụng mới nhất</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories">
                        <h4>Tuyển dụng gợi ý</h4>
                        <ul>
                            <li><a href="TuyenDung1.aspx">Ứng tuyển không cần kinh nghiệm</a></li>
                            <li><a href="TuyenDung1.aspx">Tin tuyển dụng ở Đà Nẵng</a></li>
                            <li><a href="TuyenDung1.aspx">Tuyển dụng lương trên 25tr</a></li>
                            <li><a href="TuyenDung1.aspx">Tuyển thực tập sinh IT</a></li>
                            <li><a href="TuyenDung1.aspx">Ứng tuyển quản lý khách sạn</a></li>
                        </ul>
                        <div class="main-button-red">
                            <a href="TuyenDung1.aspx">Tất cả các tin tức ứng tuyển</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">

                    <div class="row">
                        <div class="col-6">
                            <asp:DataList ID="DataList1" runat="server">
                                <ItemTemplate>
                                    <div class="meeting-item">
                                        <div class="thumb">
                                            <div class="price">
                                                <span>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NganhNghe") %>' ForeColor="Black"></asp:Label>
                                                </span>
                                            </div>
                                            <!--<img src="assets/images/meeting-01.jpg" alt="">-->
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("MaTD") %>' ImageUrl='<%# "../assets/images/"+ Eval("Logo") %>' Width="100%" Style="overflow: hidden; border-top-right-radius: 20px; border-top-left-radius: 20px;" OnClick="ImageButton1_Click" />
                                        </div>
                                        <div class="down-content">
                                            <div class="thumb">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenTD") %>' Font-Size="24px" Font-Bold="True" ForeColor="Black"></asp:Label>
                                                <br />

                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("DonGia") %>' Font-Size="14px" ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text=" | " ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("CapBac") %>' Font-Size="14px" ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label8" runat="server" Text=" | " ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("DiaChi") %>' Font-Size="14px" ForeColor="#333333"></asp:Label>

                                                <br />
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("ThongTinCongTy") %>' ForeColor="#333333"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    </div>              
                                </ItemTemplate>
                            </asp:DataList>
                            </div>
                        <div class="col-6">
                            <asp:DataList ID="DataList2" runat="server">
                                <ItemTemplate>
                                    <div class="meeting-item">
                                        <div class="thumb">
                                            <div class="price">
                                                <span>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NganhNghe") %>' ForeColor="Black"></asp:Label>
                                                </span>
                                            </div>
                                            <!--<img src="assets/images/meeting-01.jpg" alt="">-->
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("MaTD") %>' ImageUrl='<%# "../assets/images/"+ Eval("Logo") %>' Width="100%" Style="overflow: hidden; border-top-right-radius: 20px; border-top-left-radius: 20px;" OnClick="ImageButton1_Click" />
                                        </div>
                                        <div class="down-content">
                                            <div class="thumb">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenTD") %>' Font-Size="24px" Font-Bold="True" ForeColor="Black"></asp:Label>
                                                <br />

                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("DonGia") %>' Font-Size="14px" ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text=" | " ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("CapBac") %>' Font-Size="14px" ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label8" runat="server" Text=" | " ForeColor="#333333"></asp:Label>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("DiaChi") %>' Font-Size="14px" ForeColor="#333333"></asp:Label>

                                                <br />
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("ThongTinCongTy") %>' ForeColor="#333333"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    </div>              
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <section class="apply-now" id="apply">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="item">
                                <h3>WORKSPACE của bạn</h3>
                                <p>Gần đây có vẻ chả có thông báo nào, hãy thường xuyên truy cập Workspace để quản lý nhân viên hiệu quả.</p>
                                <div class="main-button-red">
                                    <div><a href="QuanTri.aspx">Tới Workspace</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="item">
                                <h3>Tạo Workspace mới</h3>
                                <p>Nền tảng quản lý và gia tăng trải nghiệm nhân viên hàng đầu Việt Nam. Trải nghiệm ngay.</p>
                                <div class="main-button-yellow">
                                    <div ><a href="QuanTri.aspx">Tạo mới!</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="accordions is-first-expanded">
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>Quản lý Chấm công đơn giản và hiệu quả</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>Tinh gọn toàn bộ quy trình chấm công và tổng hợp công truyền thống <a rel="nofollow" href="https://www.toocss.com/" target="_blank">Too CSS website</a>. Tích hợp đồng bộ dữ liệu với nhiều loại thiết bị chấm công trên thị trường (<a href="https://templatemo.com/contact" target="_parent">Máy chấm công, FaceID, Chấm công GPS</a> ). Thông tin chấm công của nhân viên được cập nhật chính xác theo thời gian thực, đảm bảo tính minh bạch. Số liệu báo cáo được thống kê, trích xuất trực tiếp từ phần mềm ra file Exel với đầy đủ thông tin cần thiết.</p>
                                </div>
                            </div>
                        </article>
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>Quản lý sự vụ, thủ tục đến Đơn từ online</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>
                                        Khởi tạo, phê duyệt đơn từ của nhân sự nhanh chóng ngay trên thiết bị di động.                                       
                                        Tự động gửi thông báo cho quản lý khi có đơn cần duyệt và kết quả đến nhân viên khi đơn được duyệt.<br><br>
                                        Dễ dàng kết nối và xử lý theo quyền quản trị và cấp bậc. 
                                        Đơn từ được lưu trữ trực tuyến, giải phóng doanh nghiệp khỏi giấy tờ, nhập liệu thủ công.
                                    </p>
                                </div>
                            </div>
                        </article>
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>Số hóa hoạt động Quản lý nhân sự</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>
                                        Số hoá và lưu trữ toàn bộ dữ liệu hồ sơ nhân sự, hợp đồng, công lương, quỹ nghỉ phép trên cùng một hệ thống. 

Thông tin nhân viên được tổng hợp đa chiều, tiện cho việc theo dõi và nắm bắt nguồn lực của tổ chức. 

Doanh nghiệp chủ động triển khai phương án xây dựng lộ trình phát triển cho từng nhân viên.
                                    </p>
                                </div>
                            </div>
                        </article>
                        <article class="accordion last-accordion">
                            <div class="accordion-head">
                                <span>Xây dựng trải nghiệm, nâng cao</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>
                                        Phiên bản nâng cấp giúp tối ưu hóa Triển khai các chương trình truyền thông nội bộ<br>
                                        <br>
                                        Tính năng gửi lời chúc ngày mới, các ngày lễ và dịp đặc biệt mang đến cho nhân viên trải nghiệm tích cực, hạnh phúc<br><br>
                                        Không giới hạn, mực độ, Sau lần thiết lập đầu tiên, số liệu trên hệ thống được tính toán tự động dựa trên chính sách riêng của từng công ty
                                    </p>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="our-courses" id="courses">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>Top Công ty Công nghệ hàng đầu</h2>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="owl-courses-item owl-carousel">
                        <div class="item">
                            <img src="assets/images/trangchu1.jpg" alt="Course One">
                            <div class="down-content">
                                <h4>FPT Software - tập đoàn hàng đầu Việt Nam</h4>
                                
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/trangchu3.jpg" alt="Course Two">
                            <div class="down-content">
                                <h4>VNPT – Tập đoàn Bưu chính Viễn thông</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/trangchu4.jpg" alt="">
                            <div class="down-content">
                                <h4>Bkav – Môi trường làm việc lý tưởng</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-04.jpg" alt="">
                            <div class="down-content">
                                <h4>Công Ty Phần Mềm Enclave ở Đà Nẵng</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-01.jpg" alt="">
                            <div class="down-content">
                                <h4>Công ty Cổ phần Giải pháp phần mềm Hanel</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-02.jpg" alt="">
                            <div class="down-content">
                                <h4>Công ty TNHH công nghệ và giải pháp Omega</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-03.jpg" alt="">
                            <div class="down-content">
                                <h4>Công ty CP công nghệ TINH VÂN – chi nhánh Hà Nội</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-04.jpg" alt="">
                            <div class="down-content">
                                <h4>Công ty Cổ Phần Fujinet Systems</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                     
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-01.jpg" alt="">
                            <div class="down-content">
                                <h4>Công ty CP xuất khẩu phần mềm Tinh Vân</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                      
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-02.jpg" alt="">
                            <div class="down-content">
                                <h4>Công ty TNHH Phần Mềm FPT ở Hồ Chí Minh</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                     
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-03.jpg" alt="">
                            <div class="down-content">
                                <h4>Công ty Global CyberSoft Việt Nam</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-04.jpg" alt="">
                            <div class="down-content">
                                <h4>Tập đoàn công nghệ hàng đầu tại Việt Nam</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="our-facts">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>Một vài sự thật về web tuyển dụng </h2>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-12">
                                    <div class="count-area-content percentage">
                                        <div class="count-digit">94</div>
                                        <div class="count-title">Tìm được công việc</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">126</div>
                                        <div class="count-title">Doanh nghiệp cao cấp</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-12">
                                    <div class="count-area-content new-students">
                                        <div class="count-digit">2345</div>
                                        <div class="count-title">Thành viên mới</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">32092</div>
                                        <div class="count-title">Tin tuyển dụng</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 align-self-center">
                    <div class="video">
                        <a href="https://www.youtube.com/watch?v=HndV87XpkWg" target="_blank">
                            <img src="assets/images/play-icon.png" alt=""></a>
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
