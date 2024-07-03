<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="QuanTri.aspx.cs" Inherits="TeamHire.QuanTri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-button {
            display: inline-block;
            background-color: brown;
            color: #fff;
            padding: 9px 22px;
            border-radius: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

            .custom-button:hover {
                background-color: #999;
            }

        #createButton {
            display: inline-block;
            padding: 10px 20px;
            background-color: #F5A425;
            border: 1px solid #ccc;
            transition: background-color 0.3s ease;
        }

            #createButton:hover {
                background-color: orange;
                color: white;
                cursor: pointer;
            }

        #huytaomoi {
            display: inline-block;
            padding: 10px 20px;
            background-color: gray;
            color: white;
            text-decoration: none;
        }

            #huytaomoi:hover {
                background-color: darkgray;
                color: white;
                cursor: pointer;
            }
    </style>
    <style>
        .image-upload {
            text-align: center;
            position: relative;
            width: 150px;
            margin: 0 auto;
        }

            .image-upload input[type="file"] {
                display: none;
            }

            .image-upload label {
                display: block;
                width: 150px;
                height: 150px;
                border-radius: 50%;
                border: 2px dashed #ccc;
                cursor: pointer;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-image: url('assets/images/workspacelogo.jpg');
                transition: border-color 0.3s ease;
            }

                .image-upload label:hover {
                    border-color: #999;
                }

                .image-upload label::after {
                    content: '\f030';
                    font-family: 'Font Awesome 5 Free';
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    font-size: 24px;
                    color: #999;
                    opacity: 0;
                    transition: opacity 0.3s ease;
                }

                .image-upload label:hover::after {
                    opacity: 1;
                }

        .workspace-name {
            text-align: center;
            margin-top: 20px;
        }

            .workspace-name input[type="text"] {
                width: 300px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

                .workspace-name input[type="text"]:focus {
                    border-color: #999;
                }


        .button-container {
            text-align: center;
            margin-top: 20px;
        }

            .button-container .btn-create {
                display: inline-block;
                padding: 10px 20px;
                background: linear-gradient(to right, #ADFF2F, #FFC700);
                color: white;
                border: none;
                border-radius: 50px;
                font-size: 16px;
                cursor: pointer;
                width: 30%;
                transition: background 0.3s ease;
                box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            }

                .button-container .btn-create:hover {
                    background: linear-gradient(to right, #FFC700, #7FFFD4);
                }
    </style>
    <style> /* Custom CSS for Image1 */
    #<%= Image1.ClientID %> {
        display: block;
        width: 150px;
        height: 150px;
        border-radius: 50%;
        border: 2px dashed #ccc;
        cursor: pointer;
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-image: url('assets/images/workspacelogo.jpg');
        transition: border-color 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    #<%= Image1.ClientID %>:hover {
        border-color: #999;
    }

    #<%= Image1.ClientID %>::after {
        content: '\f030';
        font-family: 'Font Awesome 5 Free';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 24px;
        color: #999;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    #<%= Image1.ClientID %>:hover::after {
        opacity: 1;
    }
</style>
<style>
    .image-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    #fileImage2 {
        display: block;
        margin-top: 10px;
    }

    .custom-file-upload {
        display: inline-block;
        padding: 6px 12px;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #f1f1f1;
        font-size: 0; /* Ẩn chữ */
    }

    .custom-file-upload::before {

        font-size: 18px;
        margin-right: 5px;
    }

    .custom-file-upload:hover {
        background-color: #e9e9e9;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="heading-page header-text" id="top" style="background-image: url(../assets/images/nen7.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Giải pháp giúp doanh nghiệp quản lý, lưu trữ dữ liệu chấm công và đơn từ</h6>
                    <h2>Nền tảng Quản lý & gia tăng trải nghiệm nhân sự</h2>
                </div>
            </div>
        </div>
    </section>
    <section class="apply-now" id="apply">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center">
                    <div class="row">
                        <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-12">
                                    <div class="item">
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenW") %>'></asp:Label></h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text="Bạn có 5 thông báo mới! Có 4 tin nhắn được gửi tới đang đợi bạn trả lời"></asp:Label>
                                        </p>
                                        <div class="main-button-red">
                                            <div class="scroll-to-section">
                                                <asp:Button ID="Button1" runat="server" class="custom-button" Text="Tham gia ngay!" CommandArgument='<%# Eval("MaW") %>' OnClick="ImageButton1_Click" />
                                                <!--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click" >Tham gia ngay!</asp:LinkButton>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <!--<div class="col-lg-12">
                            <div class="item">
                                <h3>APPLY FOR BACHELOR DEGREE</h3>
                                <p>You are allowed to use this edu meeting CSS template for your school or university or business. You can feel free to modify or edit this layout.</p>
                                <div class="main-button-red">
                                    <div class="scroll-to-section"><a href="#contact">Join Us Now!</a></div>
                                </div>
                            </div>
                        </div>-->
                        <div class="col-lg-12">
                            <div class="item">
                                <h3>Tạo Workspace mới</h3>
                                <p>Nền tảng quản lý và gia tăng trải nghiệm nhân viên hàng đầu Việt Nam. Trải nghiệm ngay.</p>
                                <div class="main-button-yellow">
                                    <div><a id="createButton">Tạo mới!</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="accordions is-first-expanded">
                        <div id="aa">
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
                                        Tự động gửi thông báo cho quản lý khi có đơn cần duyệt và kết quả đến nhân viên khi đơn được duyệt.<br>
                                            <br>
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
                                            Tính năng gửi lời chúc ngày mới, các ngày lễ và dịp đặc biệt mang đến cho nhân viên trải nghiệm tích cực, hạnh phúc<br>
                                            <br>
                                            Không giới hạn, mực độ, Sau lần thiết lập đầu tiên, số liệu trên hệ thống được tính toán tự động dựa trên chính sách riêng của từng công ty
                                        </p>
                                    </div>
                                </div>
                            </article>

                        </div>
                        <div id="bb" style="display: none;">
                            <div>
                                <div><a style="background-color: rgba(0, 0, 0, 0);" id="huytaomoi"><i class="fa fa-reply" style="color: darkgoldenrod;"> Quay lại</i></a></div>
                            </div>
                            <div style="margin-bottom: 20px; font-weight: bold; font-size: 24px; color: #337ab7; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); transition: color 0.3s, transform 0.3s;">
                                <asp:Label ID="Label3" runat="server" Text="TẠO WORKSPACE MỚI" ForeColor="Black" Font-Bold="True" Font-Size="24px"></asp:Label>
                            </div>
                            <div class="image-container">
    <asp:Image ID="Image1" runat="server" CssClass="image-upload" />
<i class="fa fa-camera" style="color: dimgray; margin-bottom: -30px;"></i>
    <label class="custom-file-upload" style="background-color: rgba(0, 0, 0, 0.3); border:none; z-index: 1; width: 40px; height:40px;">
        <asp:FileUpload ID="fileImage2" runat="server" onchange="displayImage()" />
    </label>
</div>
                                                            
<%--                            <div class="image-upload">

                                <input type="file" id="fileImage" onchange="previewImage()"/>
                                <label for="fileImage"></label>
                            </div>--%>
                            <div class="workspace-name">
                                <asp:TextBox ID="txtWorkspaceName" placeholder="Tên workspace" runat="server"></asp:TextBox>
                            </div>
                            <div style="border-top: 1px solid #ccc; margin: 20px 0;">
                            </div>
                            <div class="button-container">
                                <asp:Button ID="Button2" runat="server" Text="Tạo" CssClass="btn-create" OnClick="taomoi_click"/>
                            </div>

                        </div>
                        <asp:Label ID="lbThongBao" runat="server" Text="" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="contact-us" id="contact">

        <div class="footer">
            <asp:Button ID="btnShowAlert" runat="server" Text="Show Alert" OnClick="btnShowAlert_Click" />
            <asp:Button ID="Button3" runat="server" Text="Show Alert" OnClick="btnShowAler_Click" />
            <asp:Button ID="Button4" runat="server" Text="Show Alert" OnClick="btnShowAle_Click" />
            <p>
                ĐỘI NGŨ PHÁT TRUYỂN WEBSITE TUYỂN DỤNG & QUẢN LÝ NHÂN SỰ 2023
          <br>
                Nhóm: <a href="#" target="_parent" title="free css templates">6</a>
            </p>
        </div>
    </section>
<%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#fileImage').change(function (e) {
                var URL = window.URL || window.webkitURL;
                var file = e.target.files[0];
                var imageURL = URL.createObjectURL(file);
                $('.image-upload label').css('background-image', 'url(' + imageURL + ')');
            });
        });
    </script>--%>
    <script>
        document.getElementById("createButton").addEventListener("click", function () {
            var divAA = document.getElementById("aa");
            var divBB = document.getElementById("bb");

            divAA.style.display = "none";
            divBB.style.display = "block";
        });

        document.getElementById("huytaomoi").addEventListener("click", function () {
            var divAA = document.getElementById("aa");
            var divBB = document.getElementById("bb");

            divAA.style.display = "block";
            divBB.style.display = "none";
        });
    </script>
<script>
    function displayImage() {
        var fileInput = document.getElementById('<%= fileImage2.ClientID %>');
        var imageControl = document.getElementById('<%= Image1.ClientID %>');

        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                imageControl.style.backgroundImage = "url('" + e.target.result + "')";
            };

            reader.readAsDataURL(fileInput.files[0]);
        }
    }
</script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.all.min.js"></script>
</asp:Content>
