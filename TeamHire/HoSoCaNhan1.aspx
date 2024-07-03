<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="HoSoCaNhan1.aspx.cs" Inherits="TeamHire.HoSoCaNhan1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="AdminLTE-3.2.0/plugins/fontawesome-free/css/all.min.css" />
    <style>
        /* Global styles */
        body {
            line-height: 1.6;
            color: #333333;
        }

        /* Profile Image */
        .profile-user-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
        }

        /* Card styles */
        .card {
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #f4f4f4;
            padding: 10px 15px;
            border-bottom: 1px solid #ccc;
        }

        .card-body {
            padding: 15px;
        }

        /* List group styles */
        .list-group {
            margin-bottom: 0;
        }

        .list-group-item {
            padding: 10px 15px;
            border: none;
        }

            .list-group-item b {
                font-weight: bold;
            }

        /* Form styles */
        .form-row {
            margin-bottom: 10px;
        }

            .form-row .col {
                margin-bottom: 10px;
            }

        /* Button styles */
        .btn {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-secondary {
            color: #333333;
            background-color: #f4f4f4;
            border-color: #f4f4f4;
        }

        /* Profile menu */
        .profile-menu {
            padding: 0;
            margin-bottom: 0;
            list-style: none;
        }

            .profile-menu .nav-item {
                display: inline-block;
            }

            .profile-menu .nav-link {
                padding: 10px 15px;
                color: #333333;
                font-weight: bold;
                border: 1px solid #ccc;
                border-bottom: none;
                border-radius: 4px 4px 0 0;
                background-color: #f4f4f4;
            }

                .profile-menu .nav-link.active {
                    background-color: #007bff;
                    color: #fff;
                }

                .profile-menu .nav-link:first-child {
                    border-radius: 4px 0 0 0;
                }

        /* Textarea styles */
        textarea {
            width: 100%;
            height: 200px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 5px;
            outline: none;
        }
    </style>
    <style>
        .card-outline {
            border: none;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        }

        .profile-user-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
        }

        .profile-username {
            margin-top: 10px;
            font-weight: bold;
        }

        .list-group-item {
            border: none;
            padding: 10px 0;
        }

            .list-group-item b {
                font-weight: bold;
            }

        .password-container {
            position: relative;
        }

        .password-textbox {
            display: none;
            margin-top: 5px;
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 5px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .profile-container {
            background-color: #f0f7f9;
            padding: 20px;
            border-radius: 5px;
        }

        .card {
            /* Rest of the CSS code */
            background-size: cover;
            background-position: center;
        }

        .card-body.box-profile h3.profile-username {
            background-color: rgba(255, 255, 255, 0.7);
            padding: 10px;
            border-radius: 4px;
        }

        .transparent-bg {
            background-color: rgba(255, 255, 255, 0.5);
        }
    </style>
    <style>
        .card-primary {
            border-color: #007bff;
        }

        .card-header {
            position: relative;
            background-image: url('./assets/images/anhnenhoso2.jpg');
            background-size: cover;
            background-position: center;
            color: #fff;
            padding: 10px;
        }

        .card-title {
            color: #000;
            font-weight: bold;
        }

        .nav-pills .nav-link {
            color: #000;
            background-color: transparent;
            border-color: transparent;
            padding: 10px 15px;
            border-radius: 5px;
            margin-right: 10px;
            font-weight: bold;
            flex: 1;
            text-align: center;
        }

            .nav-pills .nav-link.active {
                background-color: rgba(128, 128, 128, 0.5);
                color: #000;
            }

        .nav-pills {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 10px;
        }

        .tab-content {
            padding: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
        }

        th {
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e6e6e6;
        }

        td:last-child {
            border-bottom: 1px solid #ccc;
        }

        td.project-actions {
            text-align: right;
        }

            td.project-actions a {
                margin-left: 5px;
            }

        .header-row {
            background-color: dimgray;
            color: #fff;
        }

        .pagination {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .page-item {
            margin-right: 5px;
        }

        .page-link {
            padding: 6px 12px;
            border: 1px solid #ddd;
            border-radius: 3px;
            background-color: #f2f2f2;
            color: #333;
        }

            .page-link:hover {
                background-color: #e6e6e6;
            }
    </style>
    <style>
        .image-container {
            position: relative;
            overflow: hidden;
            height: 60px; /* Điều chỉnh chiều cao mong muốn */
        }

            .image-container img {
                display: block;
                max-width: 100%;
                height: auto;
                transition: opacity 0.3s ease; /* Thời gian và kiểu chuyển tiếp */
            }

            .image-container::after {
                content: "";
                position: absolute;
                top: 0;
                right: 0;
                width: 50%; /* Chiều rộng phần bên phải bị mờ */
                height: 100%;
                background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(192, 192, 192, 1)); /* Gradient mờ từ trong suốt đến màu xám nhạt */
            }
    </style>
    <style>
        .container {
            /*display: flex;*/
            /*align-items: flex-start;
            justify-content: flex-start;*/
        }

        .left-section {
            flex-basis: 30%; /* Điều chỉnh kích thước của phần bên trái */
            margin-right: 20px;
        }

        .right-section {
            flex-grow: 1;
        }

        /* Định dạng các phần tử chữ màu đen */
        .black-text {
            color: black;
        }

        /* Định dạng phần tử FileUpload */
        .file-upload {
            border: 2px solid #333; /* Đổi màu viền thành màu tương phản */
            background-color: #eee; /* Đổi màu nền thành màu nhạt */
            padding: 8px;
            border-radius: 4px;
        }

            .file-upload input[type="file"] {
                color: #333; /* Đổi màu chữ thành màu tương phản */
            }

        .black-text {
            color: black;
            font-weight: bold; /* Chữ đậm hơn */
        }

        /* Định dạng phần tử Label và TextBox */
        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

            .form-row label {
                margin-right: 10px;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Bóng mờ cho chữ Label */
            }

            .form-row input[type="text"] {
                flex-grow: 1;
                padding: 5px;
                border: none; /* Loại bỏ đường viền */
                background-color: transparent; /* Nền trong suốt */
                color: black;
                border-bottom: 3px solid black; /* Đường viền dưới */
            }
    </style>
    <style>
        .right-section {
            display: flex;
            align-items: center;
        }

        .label-text {
            font-weight: bold;
            color: #333;
            margin-right: 10px;
        }

        .form-control {
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 8px;
            font-size: 14px;
            color: #333;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-right: 100px;
        }

        .select-container {
            position: relative;
            margin-right: 10px;
        }

        .select-arrow {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            pointer-events: none;
        }

            .select-arrow::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) rotate(45deg);
                width: 6px;
                height: 6px;
                border-style: solid;
                border-width: 0 2px 2px 0;
                border-color: #999;
            }

            .select-arrow::after {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) rotate(-45deg);
                width: 6px;
                height: 6px;
                border-style: solid;
                border-width: 0 2px 2px 0;
                border-color: #999;
            }

        /* Hover styles for select arrow */
        .select-container:hover .select-arrow::before,
        .select-container:hover .select-arrow::after {
            border-color: #555;
        }

        /* Focus styles for select arrow */
        .select-container:focus-within .select-arrow::before,
        .select-container:focus-within .select-arrow::after {
            border-color: #333;
        }
    </style>
    <style>
        .buttondungvo {
            position: relative;
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background: linear-gradient(45deg, #ff4081, #9c27b0);
            border: none;
            border-radius: 4px;
            overflow: hidden;
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2), 0 6px 20px rgba(156, 39, 176, 0.5);
            animation: pulse 2s ease-in-out infinite;
        }

            .buttondungvo:before {
                content: '';
                position: absolute;
                bottom: -6px;
                left: 0;
                width: 100%;
                height: 6px;
                background-color: #9c27b0;
                opacity: 0.8;
                transition: all 0.3s ease;
                transform: scaleY(0);
            }

            .buttondungvo:hover:before {
                transform: scaleY(1);
            }

            .buttondungvo span {
                position: relative;
                z-index: 1;
            }

            .buttondungvo i {
                margin-right: 5px;
            }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.1);
            }

            100% {
                transform: scale(1);
            }
        }
    </style>
    <style>
        #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
            display: none;
        }

        #cvForm {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            z-index: 10000;
            display: none;
        }

            #cvForm.visible {
                display: block;
            }

            #cvForm h3 {
                margin-top: 0;
            }
    </style>
    <style>
        #cvForm {
            background-color: #f2f2f2;
            padding: 20px;
            text-align: center;
        }

        #submitHeader {
            margin-bottom: 20px;
        }

            #submitHeader h3 {
                color: #f2007a;
                font-family: Arial, sans-serif;
                font-size: 30px;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            }

        .dungvip {
            display: inline-block;
            width: 30%;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            padding: 20px;
            background-color: #ffffff;
            text-align: center;
        }

            .dungvip h4 {
                color: #f2007a;
                font-family: Arial, sans-serif;
                font-size: 20px;
            }

            .dungvip p {
                color: #666666;
                font-family: Arial, sans-serif;
                font-size: 14px;
                margin-bottom: 20px;
            }

            .dungvip button {
                background-color: #f2007a;
                color: #ffffff;
                font-family: Arial, sans-serif;
                font-size: 16px;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

                .dungvip button:hover {
                    background-color: #d4006d;
                }

        #Button30 {
            background-color: #999999;
            color: #ffffff;
            font-family: Arial, sans-serif;
            font-size: 16px;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

            #Button30:hover {
                background-color: #777777;
            }


        .buttondungvip {
            background: linear-gradient(to right, #ff9ce2, #f2007a);
            color: #ffffff;
            font-family: Arial, sans-serif;
            font-size: 16px;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

            .buttondungvip:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            }

            .buttondungvip img {
                vertical-align: middle;
                margin-right: 8px;
            }
    </style>
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
@keyframes colorChange {
    0% {
        background-image: linear-gradient(45deg, #FFD700, #FFA500, #FF69B4, #800080, #8B0000);
    }
    20% {
        background-image: linear-gradient(45deg, #FFA500, #FF69B4, #800080, #8B0000, #FFD700);
    }
    40% {
        background-image: linear-gradient(45deg, #FF69B4, #800080, #8B0000, #FFD700, #FFA500);
    }
    60% {
        background-image: linear-gradient(45deg, #800080, #8B0000, #FFD700, #FFA500, #FF69B4);
    }
    80% {
        background-image: linear-gradient(45deg, #8B0000, #FFD700, #FFA500, #FF69B4, #800080);
    }
    100% {
        background-image: linear-gradient(45deg, #FFD700, #FFA500, #FF69B4, #800080, #8B0000);
    }
}

@keyframes shakeAndColorChange {
    0% {
        transform: rotate(0deg);
    }
    25% {
        transform: rotate(5deg);
    }
    50% {
        transform: rotate(-5deg);
    }
    75% {
        transform: rotate(5deg);
    }
    100% {
        transform: rotate(0deg);
    }
}

.mauvip {
    animation: shakeAndColorChange 2s infinite, colorChange 10s infinite;
    background: linear-gradient(45deg, #FFD700, #FFA500, #FF69B4, #800080, #8B0000);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    animation-timing-function: linear, ease-in-out;

}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="our-facts header-text" id="top" style="background-image: url(../assets/images/hosoxinviecnen7.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Hồ sơ cá nhân</h6>
                    <h2>CV xin việc</h2>
                </div>
                <div>
                    <button id="btnBusinessPremium" class="buttondungvo" onclick="showCvForm(event)">
                        <i class="fas fa-crown" style="margin-right: 5px;"></i>
                        Business Premium
                    </button>
                </div>
            </div>
        </div>
    </section>
    <section class="apply-now" id="apply">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->

            <div id="overlay"></div>

            <div id="cvForm">
                <div id="submitHeader" style="background-color: #FFC0CB; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; font-weight: bold; cursor: pointer;">
                    <h3><i class="fas fa-chess-queen"></i>Business 
            <asp:Label ID="Label29" runat="server" Text="Premium" Font-Bold="True" ForeColor="#333333"></asp:Label>
                    </h3>
                </div>
                <div>
                    <asp:Label ID="Label75" runat="server" Text="Trở thành " ForeColor="#666666"></asp:Label>
                    <asp:Label ID="Label76" runat="server" Text="doanh nghiệp cao cấp " ForeColor="#FF9933"></asp:Label>
                    <asp:Label ID="Label77" runat="server" Text="để được trải nghiệm tốt hơn." ForeColor="#666666"></asp:Label>
                    <br />
                </div>
                <div class="dungvip">
                    <asp:Label ID="Label69" runat="server" Text="Dùng thử trọn đời" Font-Bold="True"></asp:Label>
                    <br />
                    <div style="color: #ff0000; font-weight: bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
                        <asp:Label ID="Label70" runat="server" Text="Miễn phí" Font-Size="25px"></asp:Label>
                    </div>
                    <div style="border-top: 1px dotted #000; margin: 10px 0;">
                    </div>
                    <div style="text-align: left;">
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label78" runat="server" Text="Ứng tuyển vô hạn" Font-Size="12px"></asp:Label>
                        <br />
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label79" runat="server" Text="Thêm CV +1" Font-Size="12px"></asp:Label>
                        <br />
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label80" runat="server" Text="Xem tin tuyển dụng miễn phí" Font-Size="12px"></asp:Label>
                        <br />
                    </div>
                    <br />
                    <asp:Button ID="Package1Button" runat="server" CssClass="buttondungvip" Text="Dùng miễn phí" />
                </div>

                <div class="dungvip">
                    <asp:Label ID="Label71" runat="server" Text="1 tháng" Font-Bold="True"></asp:Label>
                    <br />
                    <div style="color: #ff0000; font-weight: bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
                        <asp:Label ID="Label72" runat="server" Text="19K" Font-Size="25px"></asp:Label>
                        <asp:Label ID="Label81" runat="server" Text=" vnd" Font-Size="13px"></asp:Label>
                    </div>
                    <div style="border-top: 1px dotted #000; margin: 10px 0;">
                    </div>
                    <div style="text-align: left;">
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label82" runat="server" Text="Mở khóa" Font-Size="12px"></asp:Label>
                        <asp:Label ID="Label85" runat="server" Text=" đăng tin tuyển dụng" Font-Size="12px" ForeColor="#FF6600"></asp:Label>
                        <br />
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label83" runat="server" Text="Mở khóa" Font-Size="12px"></asp:Label>
                        <asp:Label ID="Label86" runat="server" Text=" quản lý nhân sự" Font-Size="12px" ForeColor="#FF6600"></asp:Label>
                        <br />
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label84" runat="server" Text="Giấy phép thương mại doanh nghiệp" Font-Size="12px"></asp:Label>
                        <br />
                    </div>
                    <br />
                    <asp:Button ID="Package2Button" runat="server" CssClass="buttondungvip" Text="Đăng ký ngay" OnClick="GoiVip1_click" />
                </div>

                <div class="dungvip">
                    <asp:Label ID="Label73" runat="server" Text="6 tháng" Font-Bold="True"></asp:Label>
                    <div style="color: #ff0000; font-weight: bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
                        <asp:Label ID="Label74" runat="server" Text="99K" Font-Size="25px"></asp:Label>
                        <asp:Label ID="Label87" runat="server" Text=" vnd" Font-Size="13px"></asp:Label>
                    </div>
                    <div style="border-top: 1px dotted #000; margin: 10px 0;">
                    </div>
                    <div style="text-align: left;">
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label88" runat="server" Text="Tặng thêm" Font-Size="12px"></asp:Label>
                        <asp:Label ID="Label89" runat="server" Text=" 1 tháng" Font-Size="12px" ForeColor="#FF6600"></asp:Label>
                        <asp:Label ID="Label93" runat="server" Text="sử dụng" Font-Size="12px"></asp:Label>
                        <br />
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label90" runat="server" Text="Giảm được" Font-Size="12px"></asp:Label>
                        <asp:Label ID="Label91" runat="server" Text=" 15k" Font-Size="12px" ForeColor="#FF6600"></asp:Label>
                        <asp:Label ID="Label94" runat="server" Text=" chi phí" Font-Size="12px"></asp:Label>
                        <br />
                        <i class="fas fa-check-double" style="color: darkgoldenrod; font-size: 12px;"></i>
                        <asp:Label ID="Label92" runat="server" Text="Sử dụng như gói số 2" Font-Size="12px"></asp:Label>
                        <br />
                    </div>
                    <br />
                    <asp:Button ID="Package3Button" runat="server" CssClass="buttondungvip" Text="Đăng ký ngay" OnClick="GoiVip6_click" />
                </div>
                <div>
                    <asp:Button ID="Button30" runat="server" Text="Đóng" OnClientClick="hideCvForm();" Style="background-color: #FF69B4; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; font-weight: bold; cursor: pointer; background-color: #FF4081; /* màu nền khi hover */
  color: #FFF; /* màu chữ khi hover */
  transition: background-color 0.3s ease; /* hiệu ứng chuyển đổi màu nền */" />
                </div>

            </div>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">
                            <!-- Profile Image -->
                            <div class="card card-primary card-outline" style="background-image: url('../assets/images/anhnenhoso2.jpg');">
                                <div class="card-body box-profile">
                                    <div runat="server" id="iconvip">
                <div class="mauvip" style=" float: right; margin-left:-250px; margin-right:100px;">
                    <a href="LichSuGiaoDich1.aspx"><i class="fas fa-2x fa-crown"></i></a>
                </div>
                                        </div>
                                    <div class="text-center">
                                        <%--<img src="../assets/images/avatar1.jpg" alt="Avatar" class="profile-user-img img-fluid img-circle" />--%>
                                        <asp:Image ID="Image2" runat="server" alt="Avatar" class="profile-user-img img-fluid img-circle" />

                                    </div>
                                    <div class="custom-file-upload" style="margin-left: 50%; margin-top: -20px;">
                                        <i class="fa fa-camera"></i>
                                        <asp:FileUpload ID="FileUpload3" runat="server" onchange="previewImage(this)" />
                                    </div>
                                    <div class="col d-flex justify-content-end align-items-center" style="margin-top: -40px;">
                                        <asp:Button ID="Button31" runat="server" Text="Lưu" CssClass="btn transparent-bg ml-2" ForeColor="#0099CC" Font-Size="20px" OnClick="luuavatar_click" />
                                    </div>
                                    <h3 class="text-center" style="margin-bottom: 20px;">
                                        <asp:Label ID="tennv" runat="server" Text="Dũng Võ" Font-Bold="True"></asp:Label>

                                    </h3>
                                    <ul class="list-group list-group-unbordered mb-3" runat="server" id="dangnhap">
                                        <li class="transparent-bg">
                                            <div class="form-row">
                                                <div class="col">
                                                    <b>Tên đăng nhập:</b>
                                                </div>
                                                <div class="col" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);">
                                                    <a class="float-right">
                                                        <asp:Label ID="tendn" runat="server" Text="dungvo" ForeColor="#333333" Font-Size="20px"></asp:Label>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="transparent-bg">
                                            <div class="form-row">
                                                <div class="col">
                                                    <b>Mật khẩu:</b>
                                                </div>
                                                <div class="col" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);">
                                                    <asp:Label ID="Label61" runat="server" Text="********" ForeColor="#333333" Font-Size="20px"></asp:Label>
                                                </div>
                                            </div>


                                            <%--<a class="float-right">
                                                <div class="password-container">
                                                     
                                                    <%--<asp:Label ID="passw" runat="server" ForeColor="#333333"></asp:Label>--%>
                                            <%--<asp:TextBox ID="passst" runat="server" CssClass="password-textbox" TextMode="Password" ForeColor="#333333" Width="100px">******</asp:TextBox>--%>
                                            <%--<i class="password-toggle fas fa-eye"></i>--%>
                                            <%-- </div></a>--%>
                                            
                                        </li>

                                    </ul>
                                    <ul class="list-group list-group-unbordered mb-3" runat="server" id="Ul1" visible="false">
                                        <li class="transparent-bg">
                                            <div class="form-row">
                                                <div class="col">
                                                    <b>Mật khẩu cũ:</b>
                                                </div>
                                                <div class="col" style="display: flex; align-items: center;">
                                                    <asp:TextBox ID="TextBox24" runat="server" ForeColor="#333333" Width="100%" Height="38px" Font-Size="20px" TextMode="Password" BackColor="transparent" BorderStyle="Groove" Style="flex: 1;"></asp:TextBox>
                                                    <i class="fas fa-eye" data-textbox-id="TextBox24" style="margin-left: 5px; cursor: pointer;"></i>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                    <b>Mật khẩu mới:</b>
                                                </div>
                                                <div class="col" style="display: flex; align-items: center;">
                                                    <asp:TextBox ID="TextBox25" runat="server" ForeColor="#333333" Width="100%" Height="38px" Font-Size="20px" TextMode="Password" BackColor="transparent" BorderStyle="Groove" Style="flex: 1;"></asp:TextBox>
                                                    <i class="fas fa-eye" data-textbox-id="TextBox25" style="margin-left: 5px; cursor: pointer;"></i>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                    <b>Nhập lại MK mới:</b>
                                                </div>
                                                <div class="col" style="display: flex; align-items: center;">
                                                    <asp:TextBox ID="TextBox26" runat="server" ForeColor="#333333" Width="100%" Height="38px" Font-Size="20px" TextMode="Password" BackColor="transparent" BorderStyle="Groove" Style="flex: 1;"></asp:TextBox>
                                                    <i class="fas fa-eye" data-textbox-id="TextBox26" style="margin-left: 5px; cursor: pointer;"></i>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div style="display: flex; justify-content: center; border-radius: 20px;">
                                        <asp:Button ID="Button1" runat="server" Text="Đổi mật khẩu" class="btn btn-primary btn-block" Style="display: flex; justify-content: center; border-radius: 20px;" BackColor="#0099CC" OnClick="doimk_click" />
                                        <asp:Button ID="Button27" runat="server" Text="Hủy" class="btn btn-primary btn-block" Style="display: flex; justify-content: center; border-radius: 10px;" BackColor="Silver" Visible="False" BorderColor="#999999" ForeColor="Black" OnClick="huydoimk_click" />
                                        <asp:Button ID="Button28" runat="server" Text="Xác nhận" class="btn btn-primary btn-block" Style="display: flex; justify-content: center; border-radius: 10px;" BackColor="#0099CC" Visible="False" OnClick="xacnhandoimk_click" />
                                    </div>
                                    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="countdownLabel" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="card-header">
                                <h3 class="card-title">Menu</h3>
                            </div>
                            <div>
                                <div class="card-header p-2">
                                    <ul class="nav nav-pills">
                                        <li class="nav-item">
                                            <a id="tab-a" class="nav-link active" href="#activity" data-toggle="tab">Thông tin Cá nhân</a>
                                        </li>
                                        <li class="nav-item">
                                            <a id="tab-b" class="nav-link" href="#timeline" data-toggle="tab">Quản lý tuyển dụng</a>
                                        </li>
                                        <li class="nav-item">
                                            <a id="tab-c" class="nav-link" href="#commte" data-toggle="tab">Tin tức ứng tuyển</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-9">
                            <div class="card-header p-2">
                                <div class="card-header p-2">
                                    <ul class="nav nav-pills">
                                    </ul>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="activity">
                                            <ul class="list-group list-group-unbordered mb-3">
                                                <li class="list-group-item">
                                                    <div style="margin-left: 10px;">
                                                        <asp:Label ID="Label47" runat="server" Text="Tài khoản" Font-Size="30px" Font-Bold="True"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label48" runat="server" Text="Hãy cập nhật thông tin mới nhất." ForeColor="#666666"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label49" runat="server" Text="Thông tin cá nhân dưới đây sẽ tự động điền khi bạn tạo hồ sơ mới." ForeColor="#666666"></asp:Label>
                                                        <asp:Label ID="Label58" runat="server" Text="" Visible="False" Style="margin-right: 20px; float: right;"></asp:Label>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox15" runat="server" Enabled="False" ForeColor="#333333" Height="1px" Style="border-bottom: 1px solid #D3D3D3;"></asp:TextBox>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <asp:Label ID="Label43" runat="server" Text="Họ và tên:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>
                                                            <asp:Label ID="Label57" runat="server" Text=" (Không được để trống) *" ForeColor="Red" Visible="False"></asp:Label>
                                                        </div>
                                                        <div class="col">
                                                            <asp:Label ID="Label44" runat="server" Text="Thỏ Chê Cỏ" Font-Size="20px" Font-Bold="True"></asp:Label>
                                                            <asp:TextBox ID="TextBox20" runat="server" CssClass="form-control" Visible="False" Font-Size="20px"></asp:TextBox>
                                                        </div>
                                                        <div class="col d-flex justify-content-end align-items-center">
                                                            <div runat="server" id="suaten">
                                                                <i class="fas fa-1x fa-pencil-alt blue-icon ml-2"></i>
                                                                <asp:Button ID="Button11" runat="server" Text="Chỉnh sửa" CssClass="btn transparent-bg ml-2" ForeColor="Blue" Font-Size="20px" OnClick="SuaTen_Click" />
                                                            </div>
                                                            <div runat="server" id="Div1" visible="false">
                                                                <asp:Button ID="Button17" runat="server" Text="Hủy" CssClass="btn transparent-bg ml-2" ForeColor="#0066FF" Font-Size="20px" OnClick="Huyten_Click" BackColor="#CCCCCC" />
                                                                <asp:Button ID="Button18" runat="server" Text="Lưu" CssClass="btn transparent-bg ml-2" ForeColor="White" Font-Size="20px" OnClick="Luuten_Click" BackColor="#0066FF" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox13" runat="server" Enabled="False" ForeColor="#333333" Height="1px" Style="border-bottom: 1px solid #D3D3D3;"></asp:TextBox>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <asp:Label ID="Label45" runat="server" Text="Số điện thoại:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>
                                                            <asp:Label ID="Label59" runat="server" Text=" (SDT không đúng định dạng) *" ForeColor="Red" Visible="False"></asp:Label>
                                                        </div>
                                                        <div class="col">
                                                            <asp:Label ID="sodienthoai" runat="server" Font-Size="20px" Font-Bold="True"></asp:Label>
                                                            <asp:TextBox ID="TextBox21" runat="server" CssClass="form-control" Visible="False" Font-Size="20px" onkeypress="return isNumberKey(event)" oninput="limitInputLength(this, 10)"></asp:TextBox>
                                                            <br />
                                                            <asp:Label ID="Label46" runat="server" Text="Số điện thoại này có thể dùng để cung cấp thông tin cho nộp CV tuyển dụng" ForeColor="#666666"></asp:Label>
                                                        </div>
                                                        <div class="col d-flex justify-content-end align-items-center">
                                                            <div runat="server" id="Div2">
                                                                <i class="fas fa-1x fa-pencil-alt blue-icon ml-2"></i>
                                                                <asp:Button ID="Button12" runat="server" Text="Chỉnh sửa" CssClass="btn transparent-bg ml-2" ForeColor="Blue" Font-Size="20px" OnClick="SuaSDT_Click" />
                                                            </div>
                                                            <div runat="server" id="Div3" visible="false">
                                                                <asp:Button ID="Button19" runat="server" Text="Hủy" CssClass="btn transparent-bg ml-2" ForeColor="#0066FF" Font-Size="20px" OnClick="HuySDT_Click" BackColor="#CCCCCC" />
                                                                <asp:Button ID="Button20" runat="server" Text="Lưu" CssClass="btn transparent-bg ml-2" ForeColor="White" Font-Size="20px" OnClick="LuuSDT_Click" BackColor="#0066FF" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox14" runat="server" Enabled="False" ForeColor="#333333" Height="1px" Style="border-bottom: 1px solid #D3D3D3;"></asp:TextBox>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <asp:Label ID="Label50" runat="server" Text="Địa chỉ email:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>
                                                        </div>
                                                        <div class="col">

                                                            <asp:Label ID="gmail" runat="server" Font-Size="20px" Font-Bold="True"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label51" runat="server" Text="Đây là địa chỉ email để đăng nhập. Chúng tôi cũng sẽ gửi thông báo đến địa chỉ này." ForeColor="#666666"></asp:Label>
                                                        </div>
                                                        <div class="col d-flex justify-content-end align-items-center">
                                                            <i class="fas fa-1x fa-pencil-alt blue-icon ml-2"></i>
                                                            <asp:Button ID="Button13" runat="server" Text="Chỉnh sửa" CssClass="btn transparent-bg ml-2" ForeColor="Blue" Font-Size="20px" />

                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox16" runat="server" Enabled="False" ForeColor="#333333" Height="1px" Style="border-bottom: 1px solid #D3D3D3;"></asp:TextBox>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <asp:Label ID="Label52" runat="server" Text="Giới tính:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>

                                                        </div>
                                                        <div class="col">
                                                            <asp:Label ID="gioitinh" runat="server" Font-Size="20px" Font-Bold="True"></asp:Label>
                                                            <div class="form-group tm-form-element tm-form-element-2" runat="server" id="gioti" visible="false">
                                                                <select name="children" class="form-control tm-select" id="Select7" runat="server" style="font-size: 20px;">
                                                                    <option value="Nam">Nam</option>
                                                                    <option value="Nữ">Nữ</option>
                                                                    <option value="Khác">Khác</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col d-flex justify-content-end align-items-center">
                                                            <div runat="server" id="Div4">
                                                                <i class="fas fa-1x fa-pencil-alt blue-icon ml-2"></i>
                                                                <asp:Button ID="Button14" runat="server" Text="Chỉnh sửa" CssClass="btn transparent-bg ml-2" ForeColor="Blue" Font-Size="20px" OnClick="SuaGioiTinh_Click" />
                                                            </div>
                                                            <div runat="server" id="Div5" visible="false">
                                                                <asp:Button ID="Button21" runat="server" Text="Hủy" CssClass="btn transparent-bg ml-2" ForeColor="#0066FF" Font-Size="20px" OnClick="HuyGioiTinh_Click" BackColor="#CCCCCC" />
                                                                <asp:Button ID="Button22" runat="server" Text="Lưu" CssClass="btn transparent-bg ml-2" ForeColor="White" Font-Size="20px" OnClick="LuuGioiTinh_Click" BackColor="#0066FF" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox17" runat="server" Enabled="False" ForeColor="#333333" Height="1px" Style="border-bottom: 1px solid #D3D3D3;"></asp:TextBox>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <asp:Label ID="Label53" runat="server" Text="Ngày sinh:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>
                                                            <asp:Label ID="Label60" runat="server" Text=" (ngày sinh không đúng định dạng) *" ForeColor="Red" Visible="False"></asp:Label>
                                                        </div>
                                                        <div class="col">
                                                            <asp:Label ID="ngaysinh" runat="server" Font-Size="20px" Font-Bold="True"></asp:Label>
                                                            <div class="input-container" style="display: flex; align-items: center;" runat="server" id="ngaysinhh" visible="false">
                                                                <asp:TextBox ID="TextBox22" runat="server" placeholder="Ngày/Tháng/Năm" MaxLength="10"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col d-flex justify-content-end align-items-center">
                                                            <div runat="server" id="Div6">
                                                                <i class="fas fa-1x fa-pencil-alt blue-icon ml-2"></i>
                                                                <asp:Button ID="Button15" runat="server" Text="Chỉnh sửa" CssClass="btn transparent-bg ml-2" ForeColor="Blue" Font-Size="20px" OnClick="SuaNgaySinh_Click" />
                                                            </div>
                                                            <div runat="server" id="Div7" visible="false">
                                                                <asp:Button ID="Button23" runat="server" Text="Hủy" CssClass="btn transparent-bg ml-2" ForeColor="#0066FF" Font-Size="20px" OnClick="HuyNgaySinh_Click" BackColor="#CCCCCC" />
                                                                <asp:Button ID="Button24" runat="server" Text="Lưu" CssClass="btn transparent-bg ml-2" ForeColor="White" Font-Size="20px" OnClick="LuuNgaySinh_Click" BackColor="#0066FF" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox18" runat="server" Enabled="False" ForeColor="#333333" Height="1px" Style="border-bottom: 1px solid #D3D3D3;"></asp:TextBox>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <asp:Label ID="Label54" runat="server" Text="Địa chỉ:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>
                                                        </div>
                                                        <div class="col">
                                                            <asp:Label ID="diachi" runat="server" Font-Size="20px" Font-Bold="True"></asp:Label>
                                                            <asp:TextBox ID="TextBox23" runat="server" CssClass="form-control" Visible="False" Font-Size="20px"></asp:TextBox>
                                                        </div>
                                                        <div class="col d-flex justify-content-end align-items-center">
                                                            <div runat="server" id="Div8">
                                                                <i class="fas fa-1x fa-pencil-alt blue-icon ml-2"></i>
                                                                <asp:Button ID="Button16" runat="server" Text="Chỉnh sửa" CssClass="btn transparent-bg ml-2" ForeColor="Blue" Font-Size="20px" OnClick="SuaDiaChi_Click" />
                                                            </div>
                                                            <div runat="server" id="Div9" visible="false">
                                                                <asp:Button ID="Button25" runat="server" Text="Hủy" CssClass="btn transparent-bg ml-2" ForeColor="#0066FF" Font-Size="20px" OnClick="HuyDiaChi_Click" BackColor="#CCCCCC" />
                                                                <asp:Button ID="Button26" runat="server" Text="Lưu" CssClass="btn transparent-bg ml-2" ForeColor="White" Font-Size="20px" OnClick="LuuDiaChi_Click" BackColor="#0066FF" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox19" runat="server" Enabled="False" ForeColor="#333333" Height="1px" Style="border-bottom: 1px solid #D3D3D3;"></asp:TextBox>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div style="background-color: rgba(0, 128, 0, 0.2); border: 1px solid #98FB98; border-radius: 10px;">
                                                        <div class="form-row">
                                                            <asp:Label ID="Label55" runat="server" Text="Hồ sơ xin việc:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>
                                                        </div>
                                                        <div class="form-row">

                                                            <div class=" col-5" style="margin-left: 15px;">
                                                                <div class="btn btn-success col fileinput-button dz-clickable">
                                                                    <i class="fas fa-2x fa-file-upload"></i>
                                                                    <asp:FileUpload ID="FileUpload2" runat="server" BorderColor="#00CC99" ForeColor="#333333" />
                                                                </div>
                                                                <div>
                                                                    <asp:Label ID="Label65" runat="server" Text="File: doc, docx, xls, pdf ." Font-Size="12px" ForeColor="#666666"></asp:Label>
                                                                    <asp:Label ID="Label66" runat="server" Text="(tối đa 3MB)." Font-Size="12px" ForeColor="#666666"></asp:Label>
                                                                </div>
                                                                <div>
                                                                    <asp:Label ID="Label67" runat="server" Text="Nhà tuyển dụng thường yêu cầu hồ sơ: " Font-Size="12px" ForeColor="#666666"></asp:Label>
                                                                    <asp:Label ID="Label68" runat="server" Text="Tiếng Việt" Font-Size="12px" ForeColor="Red"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class=" col-6">
                                                                <div style="border: 2px dashed white; border-radius: 10px; padding: 10px; display: inline-block;">
                                                                    <i class="fa fa-5x fa-file-alt" style="color: darkgreen;"></i>
                                                                    <asp:Label ID="Label62" runat="server" Text="(File CV xin việc)" Font-Size="20px"></asp:Label>

                                                                </div>
                                                                <div style="border: 2px dashed white; border-radius: 10px; padding: 10px; display: inline-block;">
                                                                    <i class="fa fa-5x fa-file-alt" style="color: darkgreen;"></i>
                                                                    <asp:Label ID="Label63" runat="server" Text="(CV xin việc)" Font-Size="20px"></asp:Label>
                                                                    <i class="fa fa-lock"></i>
                                                                </div>
<%--                                                                <div style="border: 2px dashed white; border-radius: 10px; padding: 10px; display: inline-block;">
                                                                    <i class="fa fa-5x fa-file-alt" style="color: darkgreen;"></i>
                                                                    <asp:Label ID="Label64" runat="server" Text="(CV xin việc)" Font-Size="20px"></asp:Label>
                                                                    <i class="fa fa-lock"></i>
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class=" col-4"></div>
                                                            <div class=" col-7" runat="server" id="filecvhaha">
                                                                <i class="fa fa-download" style="margin-right: -10px; margin-left: 150px; color: #0066FF;"></i>
                                                                <asp:Button ID="Button7" runat="server" CssClass="btn" Text="Tải" ForeColor="#0066FF" Style="background-color: rgba(0, 128, 0, 0);" OnClick="taicvxuong_click" />
                                                                <i class="fa fa-trash" style="margin-right: -10px; color: #990000;"></i>
                                                                <asp:Button ID="Button29" runat="server" CssClass="btn" Text="Xóa" ForeColor="#990000" Style="background-color: rgba(0, 128, 0, 0);" OnClick="xoacvdi_click" />
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <asp:Label ID="Label56" runat="server" Text="Thư xin việc:" Font-Size="20px" Style="margin-left: 10px;"></asp:Label>
                                                        </div>
                                                        <div class="form-row d-flex justify-content-center">
                                                            <textarea id="myTextarea" runat="server" class="form-control" style="width: 70%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                        </div>
                                                        <div style="text-align: right;">
                                                            <i class="fa fa-2x fa-cloud-upload-alt" style="color: darkgreen;"></i>
                                                            <asp:Button ID="Button8" runat="server" Text="Lưu" class="btn transparent-bg" ForeColor="darkgreen" Font-Size="20px" OnClick="luucv_click" Style="background-color: rgba(0, 128, 0, 0.2); margin-right: 10px; margin-bottom: 15px;" />
                                                        </div>
                                                    </div>

                                                </li>

                                            </ul>

                                        </div>
                                        <div class="tab-pane" id="timeline">
                                            <asp:Panel ID="panel1" runat="server">
                                                <ul class="list-group list-group-unbordered mb-3">
                                                    <li class="list-group-item">
                                                        <div class="form-row">
                                                            <div class="col">
                                                                <div style="display: flex; align-items: center;">
                                                                    <div style="flex-grow: 1;">
                                                                        <asp:Label ID="sotintuyendung" runat="server" Text="Số tin tuyển dụng đã đăng: "></asp:Label>
                                                                        <asp:Label ID="sotin" runat="server" Text="21 tin"></asp:Label>
                                                                    </div>
                                                                    <div style="flex-grow: 1;">
                                                                        <asp:Label ID="Label2" runat="server" Text="Số tin tuyển dụng Hiện tại: "></asp:Label>
                                                                        <asp:Label ID="Label3" runat="server" Text="9 tin"></asp:Label>
                                                                    </div>
                                                                    <div style="flex-grow: 1;">
                                                                        <asp:Label ID="sotintuyendunghethan" runat="server" Text="Số tin tuyển dụng hết hạn:"></asp:Label>
                                                                        <asp:Label ID="tinhethan" runat="server" Text="12 tin"></asp:Label>
                                                                    </div>
                                                                    <div class="main-button-yellow" style="margin-bottom: 5px; margin-right: 5px;">
                                                                        <div class="scroll-to-section">
                                                                            <asp:Button ID="Button4" runat="server" CssClass="btn btn-success btn-sm" Text="Thêm Tuyển dụng mới" OnClick="them_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <table>
                                                                        <tr class="header-row">
                                                                            <th style="width: 14%">#</th>
                                                                            <th style="width: 30%">Tên tuyển dụng</th>
                                                                            <th style="width: 15%">Ngành nghề</th>
                                                                            <th style="width: 10%"></th>
                                                                            <th style="width: 8%" class="text-center"></th>
                                                                            <th style="width: 20%"></th>
                                                                        </tr>
                                                                    </table>
                                                                </div>

                                                                <div>
                                                                    <asp:DataList ID="DataList1" runat="server">
                                                                        <ItemTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td style="width: 14%">
                                                                                        <div class="image-container">
                                                                                            <a>
                                                                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../assets/images/"+ Eval("Logo") %>' />
                                                                                            </a>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td style="width: 30%">
                                                                                        <asp:Label runat="server" Text='<%# Eval("TenTD") %>'></asp:Label>
                                                                                    </td>
                                                                                    <td style="width: 15%">
                                                                                        <a>
                                                                                            <asp:Label runat="server" Text='<%# Eval("NganhNghe") %>'></asp:Label>
                                                                                        </a>
                                                                                        <br />
                                                                                        <small>
                                                                                            <asp:Label runat="server" Text='<%# Eval("NgayTD", "{0:dd/MM/yyyy}") + "Ngày đăng"%>'></asp:Label>
                                                                                        </small>
                                                                                    </td>
                                                                                    <td class="project-actions text-right" style="width: 25%">
                                                                                        <a href="#">

                                                                                            <asp:Button ID="ViewButton" runat="server" Text="Chi tiết" CssClass="btn btn-primary btn-sm" CommandName="edit" CommandArgument='<%# Eval("MaTD") %>' OnClick="chitet_Click" />
                                                                                        </a>
                                                                                        <a href="#">

                                                                                            <asp:Button ID="EditButton" runat="server" Text="Chỉnh sửa" CssClass="btn btn-info btn-sm" CommandName="edit" CommandArgument='<%# Eval("MaTD") %>' OnClick="chinhssua_Click" />
                                                                                        </a>
                                                                                        <a>

                                                                                            <asp:Button ID="DeleteButton" runat="server" Text="Xóa" CssClass="btn btn-danger btn-sm" CommandName="xoa" CommandArgument='<%# Eval("MaTD") %>' OnClick="xxoa_Click" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?');" />
                                                                                        </a>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </div>
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
                                                    </li>
                                                </ul>
                                            </asp:Panel>
                                            <asp:Panel ID="panel2" runat="server" Visible="false">
                                                <div class="container">
                                                    <div class="left-section">
                                                        <div class="text-center">
                                                            <div class="row">
                                                                <div class="col-md-6 text-center">
                                                                    <asp:Image ID="Image7" runat="server" Style="width: 370px; height: 217px; object-fit: cover;" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="file-upload" style="margin-bottom: 5px; margin-top: 5px;">
                                                            <asp:FileUpload ID="fileUploader" runat="server" onchange="previewImage3(this);" />
                                                        </div>
                                                        <div class="form-row">
                                                            <asp:Label ID="Label4" runat="server" Text="Tiêu đề: " CssClass="black-text" Font-Size="20px"></asp:Label>
                                                            <asp:TextBox ID="tentuyendung" runat="server" CssClass="black-text"></asp:TextBox>
                                                            <asp:Label ID="Label5" runat="server" Text="(Vui lòi điền tên tiêu đề)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Ngành nghề:</label>
                                                            <asp:Label ID="Label6" runat="server" Text="(Chọn ngành nghề)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <select name="congviec" class="form-control" id="cv" runat="server" cssclass="black-text">
                                                                    <option value="0">Ngành nghề</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Năm kinh nghiệm:</label>
                                                            <asp:Label ID="Label7" runat="server" Text="(Chọn năm kinh nghiệm)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <select name="kinhn" class="form-control" id="kinhn" runat="server">
                                                                    <option value="0">Kinh nghiệm</option>
                                                                    <option value="Chưa có kinh nghiệm">Chưa có kinh nghiệm</option>
                                                                    <option value="Dưới 1 năm kinh nghiệm">Dưới 1 năm kinh nghiệm</option>
                                                                    <option value="Dưới 2 năm kinh nghiệm">Dưới 2 năm kinh nghiệm</option>
                                                                    <option value="Trên 2 năm kinh nghiệm">Trên 2 năm kinh nghiệm</option>
                                                                    <option value="Hơn 10 năm kinh nghiệm">Hơn 10 năm kinh nghiệm</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="capbaac" class="label-text">Cấp bậc:</label>
                                                            <asp:Label ID="Label8" runat="server" Text="(Chọn cấp bậc)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <select name="children" class="form-control" id="capbaac" runat="server">
                                                                    <option value="0">Cấp bậc</option>
                                                                    <option value="thực tập">thực tập</option>
                                                                    <option value="Nhân viên">Nhân viên</option>
                                                                    <option value="Trưởng nhóm">Trưởng nhóm</option>
                                                                    <option value="Quản lý">Quản lý</option>
                                                                    <option value="Giám đốc">Giám đốc</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Mức lương:</label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="mucluon" class="form-control tm-select" runat="server" placeholder="Thương lượng" onkeypress="return isNumberKey(event)"></asp:TextBox><span style="position: absolute; top: 0; right: 5px; color: black;">/Triệu</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Tỉnh/thành phố:</label>
                                                            <asp:Label ID="Label9" runat="server" Text="(Chọn tỉnh thành)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
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
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="capbc" class="label-text">Địa chỉ cụ thể:</label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox1" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox4" runat="server" Enabled="False"></asp:TextBox>
                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Ngày Tuyển Dụng:</label>
                                                            <asp:Label ID="Label11" runat="server" Text="(Nhập ngày tuyển dụng)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox2" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Hạn tuyển dụng:</label>
                                                            <asp:Label ID="Label10" runat="server" Text="(Nhập hạn tuyển dụng)*" ForeColor="#FF3300" Font-Size="14px" Font-Overline="False" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox3" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cc" class="label-text">Giới tính:</label>
                                                            <div class="select-container">
                                                                <select name="children" class="form-control" id="Select3" runat="server">
                                                                    <option value="Nam/Nữ">Nam/Nữ</option>
                                                                    <option value="Nam">Nam</option>
                                                                    <option value="Nữ">Nữ</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Chi tiết công việc:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Tex22" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Yêu cầu kỹ năng:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Textarea1" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Quyền lợi:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Textarea2" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Thông tin liên hệ:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Textarea3" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="capbc" class="label-text">Tên công ty:</label>
                                                            <asp:Label ID="Label12" runat="server" Text="(Nhập tên công ty)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox5" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="text-align: right;">
                                                        <asp:Button ID="Button5" runat="server" Text="Hủy" class="btn btn-secondary" OnClick="huybo_Click" />
                                                        <asp:Button ID="Button6" runat="server" Text="Đăng tin" class="btn btn-primary" OnClientClick="return validateForm();" OnClick="dangtin_Click" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="panel3" runat="server" Visible="false">
                                                <div class="container">
                                                    <div class="left-section">
                                                        <div class="text-center">
                                                            <div class="row">
                                                                <div class="col-md-6 text-center">
                                                                    <asp:Image ID="Image3" runat="server" Style="width: 370px; height: 217px; object-fit: cover;" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="file-upload" style="margin-bottom: 5px; margin-top: 5px;">
                                                            <asp:FileUpload ID="fileUpload1" runat="server" onchange="previewImage2(this);" />
                                                        </div>
                                                        <div class="form-row">
                                                            <asp:Label ID="Label13" runat="server" Text="Tiêu đề: " CssClass="black-text" Font-Size="20px"></asp:Label>
                                                            <asp:TextBox ID="TextBox6" runat="server" CssClass="black-text"></asp:TextBox>
                                                            <asp:Label ID="Label14" runat="server" Text="(Vui lòi điền tên tiêu đề)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Ngành nghề:</label>
                                                            <asp:Label ID="Label15" runat="server" Text="(Chọn ngành nghề)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <select name="congviec" class="form-control" id="Select1" runat="server" cssclass="black-text">
                                                                    <option value="0">Ngành nghề</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Năm kinh nghiệm:</label>
                                                            <asp:Label ID="Label16" runat="server" Text="(Chọn năm kinh nghiệm)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <select name="kinhn" class="form-control" id="Select2" runat="server">
                                                                    <option value="0">Kinh nghiệm</option>
                                                                    <option value="Chưa có kinh nghiệm">Chưa có kinh nghiệm</option>
                                                                    <option value="Dưới 1 năm kinh nghiệm">Dưới 1 năm kinh nghiệm</option>
                                                                    <option value="Dưới 2 năm kinh nghiệm">Dưới 2 năm kinh nghiệm</option>
                                                                    <option value="Trên 2 năm kinh nghiệm">Trên 2 năm kinh nghiệm</option>
                                                                    <option value="Hơn 10 năm kinh nghiệm">Hơn 10 năm kinh nghiệm</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="capbaac" class="label-text">Cấp bậc:</label>
                                                            <asp:Label ID="Label17" runat="server" Text="(Chọn cấp bậc)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <select name="children" class="form-control" id="Select4" runat="server">
                                                                    <option value="0">Cấp bậc</option>
                                                                    <option value="thực tập">thực tập</option>
                                                                    <option value="Nhân viên">Nhân viên</option>
                                                                    <option value="Trưởng nhóm">Trưởng nhóm</option>
                                                                    <option value="Quản lý">Quản lý</option>
                                                                    <option value="Giám đốc">Giám đốc</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Mức lương:</label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox7" class="form-control tm-select" runat="server" placeholder="Thương lượng" onkeypress="return isNumberKey(event)"></asp:TextBox><span style="position: absolute; top: 0; right: 5px; color: black;">/Triệu</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Tỉnh/thành phố:</label>
                                                            <asp:Label ID="Label18" runat="server" Text="(Chọn tỉnh thành)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <select name="khuvuc" class="form-control tm-select" id="Select5" runat="server">
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
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="capbc" class="label-text">Địa chỉ cụ thể:</label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox8" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <asp:TextBox ID="TextBox9" runat="server" Enabled="False"></asp:TextBox>
                                                        <asp:Label ID="Label22" runat="server" Text="">999</asp:Label>
                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Ngày Tuyển Dụng:</label>
                                                            <asp:Label ID="Label19" runat="server" Text="(Nhập ngày tuyển dụng)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox10" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="kinhn" class="label-text">Hạn tuyển dụng:</label>
                                                            <asp:Label ID="Label20" runat="server" Text="(Nhập hạn tuyển dụng)*" ForeColor="#FF3300" Font-Size="14px" Font-Overline="False" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox11" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cc" class="label-text">Giới tính:</label>
                                                            <div class="select-container">
                                                                <select name="children" class="form-control" id="Select6" runat="server">
                                                                    <option value="Nam/Nữ">Nam/Nữ</option>
                                                                    <option value="Nam">Nam</option>
                                                                    <option value="Nữ">Nữ</option>
                                                                </select>
                                                                <div class="select-arrow"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Chi tiết công việc:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Textarea4" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Yêu cầu kỹ năng:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Textarea5" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Quyền lợi:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Textarea6" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="right-section">
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="cv" class="label-text">Thông tin liên hệ:</label>
                                                            <div class="select-container">
                                                                <div class="col">
                                                                    <textarea id="Textarea7" runat="server" class="form-control" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; outline: none;"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group tm-form-element-inline">
                                                            <label for="capbc" class="label-text">Tên công ty:</label>
                                                            <asp:Label ID="Label21" runat="server" Text="(Nhập tên công ty)*" ForeColor="#FF3300" Font-Size="14px" Visible="False"></asp:Label>
                                                            <div class="select-container">
                                                                <asp:TextBox ID="TextBox12" class="form-control tm-select" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="text-align: right;">
                                                        <asp:Button ID="Button2" runat="server" Text="Trở về" class="btn btn-secondary" OnClick="huychinh_Click" />
                                                        <asp:Button ID="Button3" runat="server" Text="Cập nhật" class="btn btn-primary" OnClick="capnhathos_Click" OnClientClick="return validateForm();" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Label ID="lbThongB" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="tab-pane" id="commte">
                                            <ul>
                                                <li>
                                                    <div>
                                                        <div class="col">
                                                            <div class="main-button-yellow" style="margin-bottom: 5px; margin-right: 5px;">
                                                                <div class="scroll-to-section">
                                                                    <asp:Button ID="Button9" runat="server" CssClass="btn btn-success btn-sm" Text="Tin tức ứng tuyển" OnClick="ttut_Click" BackColor="#0066FF" Enabled="False" />

                                                                    <asp:Button ID="Button10" runat="server" CssClass="btn btn-success btn-sm" Text="lịch sử ứng tuyển" OnClick="lsut_Click" BackColor="#999999" OnClientClick="setActiveTab()" />
                                                                </div>
                                                            </div>
                                                            <asp:Panel ID="panel4" runat="server">
                                                                <ul class="list-group list-group-unbordered mb-3">
                                                                    <li class="list-group-item">
                                                                        <div class="form-row">
                                                                            <div class="col">
                                                                                <div style="display: flex; align-items: center;">
                                                                                </div>
                                                                                <div>
                                                                                    <table>
                                                                                        <tr class="header-row">
                                                                                            <th style="width: 20%">#Người ứng tuyển</th>
                                                                                            <th style="width: 20%">Thông tin liên lạc</th>
                                                                                            <th style="width: 20%">Thư tuyển dụng</th>
                                                                                            <th style="width: 20%">File CV xin việc</th>

                                                                                            <th style="width: 20%"></th>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                                <div>
                                                                                    <asp:DataList ID="DataList2" runat="server" OnItemCommand="DataListFiles_ItemCommand">
                                                                                        <ItemTemplate>
                                                                                            <table>
                                                                                                <tr>

                                                                                                    <td style="width: 20%">
                                                                                                        <a>
                                                                                                            <asp:Label runat="server" Text='<%# Eval("tennguoidung") %>' Font-Bold="True"></asp:Label>
                                                                                                        </a>
                                                                                                        <br />
                                                                                                        <small>
                                                                                                            <asp:Label runat="server" Text='<%# Eval("Ngaynop", "{0:dd/MM/yyyy}") + "Ngày gửi"%>' Font-Size="12px" ForeColor="#333333"></asp:Label>
                                                                                                        </small>
                                                                                                    </td>
                                                                                                    <td style="width: 20%">
                                                                                                        <asp:Label ID="Label30" runat="server" Text="Email: " ForeColor="#333333" Font-Size="13px"></asp:Label>
                                                                                                        <asp:Label runat="server" Text='<%# Eval("Gmail") %>' ForeColor="#333333" Font-Size="13px"></asp:Label>
                                                                                                        <br />
                                                                                                        <asp:Label ID="Label31" runat="server" Text="Số điện thoại: " ForeColor="#333333" Font-Size="13px"></asp:Label>
                                                                                                        <asp:Label runat="server" Text='<%# Eval("SDT") %>' ForeColor="#333333" Font-Size="13px"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 20%">
                                                                                                        <div style="width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
                                                                                                            <asp:Label runat="server" Text='<%# Eval("NoiDung") != null && Eval("NoiDung").ToString().Length > 20 ? Eval("NoiDung").ToString().Substring(0, 20) : Eval("NoiDung") %>' Font-Size="12px"></asp:Label>
                                                                                                            <%# Eval("NoiDung") != null && Eval("NoiDung").ToString().Length > 20 ? "<br />" : "" %>
                                                                                                            <asp:Label runat="server" Text='<%# Eval("NoiDung") != null && Eval("NoiDung").ToString().Length > 40 ? Eval("NoiDung").ToString().Substring(20, 20) : "" %>' Font-Size="12px" Visible='<%# Eval("NoiDung") != null && Eval("NoiDung").ToString().Length > 20 %>'></asp:Label>
                                                                                                            <%# Eval("NoiDung") != null && Eval("NoiDung").ToString().Length > 40 ? "<br />" : "" %>
                                                                                                            <asp:Label runat="server" Text='<%# Eval("NoiDung") != null && Eval("NoiDung").ToString().Length > 40 ? Eval("NoiDung").ToString().Substring(40, 20) + "..." : "" %>' Font-Size="12px" Visible='<%# Eval("NoiDung") != null && Eval("NoiDung").ToString().Length > 40 %>'></asp:Label>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                    <td style="width: 20%">
                                                                                                        <div>
                                                                                                            <%--<asp:Label ID="lblFileName" runat="server" Text='<%# Eval("TenFile") %>'></asp:Label>--%>
                                                                                                            <asp:Label ID="Label29" runat="server" Text="File CV("></asp:Label>
                                                                                                            <asp:LinkButton ID="lnkDownload" runat="server" CommandName="Download" CommandArgument='<%# Eval("TenFile") %>'>Tải xuống</asp:LinkButton>
                                                                                                            <asp:Label ID="Label32" runat="server" Text=")"></asp:Label>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                    <td class="project-actions text-right" style="width: 20%">

                                                                                                        <a href="#">

                                                                                                            <asp:Button ID="EditButto" runat="server" Text="Gửi thư" CssClass="btn btn-info btn-sm" CommandName="edit" CommandArgument='<%# Eval("MaDTD") %>' />
                                                                                                        </a>
                                                                                                        <a>

                                                                                                            <asp:Button ID="DeleteButto" runat="server" Text="Xóa" CssClass="btn btn-danger btn-sm" CommandName="xoa" CommandArgument='<%# Eval("MaDTD") %>' OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?');" />
                                                                                                        </a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                </div>
                                                                                <div class="card-footer">
                                                                                    <ul class="pagination pagination-sm m-0 float-right">
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="TbtnTruoc_Click" CssClass="page-link" Text="&laquo;"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="TlnkPage_Click" CssClass="page-link" Text="1" CommandArgument="1"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="TlnkPage_Click" CssClass="page-link" Text="2" CommandArgument="2"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="TlnkPage_Click" CssClass="page-link" Text="3" CommandArgument="3"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="TbtnSau_Click" CssClass="page-link" Text="&raquo;"></asp:LinkButton>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <div>

                                                                            <asp:Label ID="Label23" runat="server" Text="Hoạt động hôm nay:" Font-Bold="True" Font-Size="14px"></asp:Label>
                                                                            <asp:Label ID="Label24" runat="server" Text="Bạn có " Font-Size="12px"></asp:Label>
                                                                            <asp:Label ID="Label25" runat="server" Text="2" Font-Size="12px"></asp:Label>
                                                                            <asp:Label ID="Label26" runat="server" Text=" đơn ứng tuyển mới" Font-Size="12px"></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label28" runat="server" Text="- Bạn có thể tai file CV của ứng cử viên về máy bằng cách click vào tải xuống" Font-Size="12px"></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label33" runat="server" Text="- Bạn cũng có thể gửi gmail trực tiếp tới ứng cử viên máy bằng cách chọn vào gửi thư" Font-Size="12px"></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label27" runat="server" Text="~ Hãy gửi thử trả lời lại những ứng cử viên yêu quý của bạn ♥" Font-Size="12px"></asp:Label>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </asp:Panel>
                                                            <asp:Panel ID="panel5" runat="server" Visible="false">
                                                                <ul class="list-group list-group-unbordered mb-3">
                                                                    <li class="list-group-item">
                                                                        <div class="form-row">
                                                                            <div class="col">
                                                                                <div style="display: flex; align-items: center;">
                                                                                </div>
                                                                                <div>
                                                                                    <table>
                                                                                        <tr class="header-row">
                                                                                            <th style="width: 20%">#Ngành nghề</th>
                                                                                            <th style="width: 20%">Tuyển dụng</th>
                                                                                            <th style="width: 20%">Thời gian tuyển dụng</th>
                                                                                            <th style="width: 20%">Thông tin Công Ty</th>

                                                                                            <th style="width: 20%"></th>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                                <div>
                                                                                    <asp:DataList ID="DataList3" runat="server" OnItemCommand="DataListFiles_ItemCommand">
                                                                                        <ItemTemplate>
                                                                                            <table>
                                                                                                <tr>

                                                                                                    <td style="width: 20%">
                                                                                                        <a>
                                                                                                            <asp:Label runat="server" Text='<%#"Ứng tuyển " + Eval("NganhNghe") %>' Font-Bold="True"></asp:Label>
                                                                                                        </a>

                                                                                                    </td>

                                                                                                    <td style="width: 20%">
                                                                                                        <div>
                                                                                                            <asp:Label runat="server" Text='<%# Eval("TenTD") %>' ForeColor="#333333" Font-Size="12px" Font-Bold="True"></asp:Label>

                                                                                                            <br />
                                                                                                            <small>
                                                                                                                <asp:LinkButton ID="LinkButton11" runat="server" Font-Size="12px">đường dẫn liên kết</asp:LinkButton>
                                                                                                            </small>
                                                                                                        </div>
                                                                                                    </td>

                                                                                                    <td style="width: 20%">
                                                                                                        <asp:Label ID="Label41" runat="server" Text="Ngày ứng tuyển: " ForeColor="#333333" Font-Size="13px"></asp:Label>
                                                                                                        <asp:Label runat="server" Text='<%# Eval("Ngaynop") %>' ForeColor="#333333" Font-Size="12px"></asp:Label>
                                                                                                        <br />
                                                                                                        <asp:Label ID="Label42" runat="server" Text="Hạn ứng tuyển: " ForeColor="#333333" Font-Size="13px"></asp:Label>
                                                                                                        <asp:Label runat="server" Text='<%# Eval("NgayHetHan") %>' ForeColor="#333333" Font-Size="12px"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 20%">

                                                                                                        <asp:Label runat="server" Text='<%# Eval("ThongTinCongTy") %>' ForeColor="#333333" Font-Size="14px"></asp:Label>
                                                                                                        <br />


                                                                                                        <asp:Label ID="Label131" runat="server" Text="Địa chỉ: " ForeColor="#333333" Font-Size="12px"></asp:Label>
                                                                                                        <asp:Label runat="server" Text='<%# Eval("DiaChiCuThe") != null && Eval("DiaChiCuThe").ToString().Length > 20 ? Eval("DiaChiCuThe").ToString().Substring(0, 20) + "..." : Eval("DiaChiCuThe") %>' ForeColor="#333333" Font-Size="12px"></asp:Label>
                                                                                                    </td>

                                                                                                    <td class="project-actions text-right" style="width: 20%">

                                                                                                        <a href="#">

                                                                                                            <asp:Button ID="EditButto" runat="server" Text="Chi tiết" CssClass="btn btn-info btn-sm" CommandName="edit" CommandArgument='<%# Eval("MaDTD") %>' />
                                                                                                        </a>
                                                                                                        <a>

                                                                                                            <asp:Button ID="DeleteButto" runat="server" Text="Xóa" CssClass="btn btn-danger btn-sm" CommandName="xoa" CommandArgument='<%# Eval("MaDTD") %>' OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?');" />
                                                                                                        </a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                </div>
                                                                                <div class="card-footer">
                                                                                    <ul class="pagination pagination-sm m-0 float-right">
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="DbtnTruoc_Click" CssClass="page-link" Text="&laquo;"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton7" runat="server" OnClick="DlnkPage_Click" CssClass="page-link" Text="1" CommandArgument="1"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton8" runat="server" OnClick="DlnkPage_Click" CssClass="page-link" Text="2" CommandArgument="2"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton9" runat="server" OnClick="DlnkPage_Click" CssClass="page-link" Text="3" CommandArgument="3"></asp:LinkButton>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                            <asp:LinkButton ID="LinkButton10" runat="server" OnClick="DbtnSau_Click" CssClass="page-link" Text="&raquo;"></asp:LinkButton>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <div>

                                                                            <asp:Label ID="Label34" runat="server" Text="Hoạt động hôm nay:" Font-Bold="True" Font-Size="14px"></asp:Label>
                                                                            <asp:Label ID="Label35" runat="server" Text="Bạn có " Font-Size="12px"></asp:Label>
                                                                            <asp:Label ID="Label36" runat="server" Text="2" Font-Size="12px"></asp:Label>
                                                                            <asp:Label ID="Label37" runat="server" Text=" đơn ứng tuyển mới" Font-Size="12px"></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label38" runat="server" Text="- Bạn có thể tai file CV của ứng cử viên về máy bằng cách click vào tải xuống" Font-Size="12px"></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label39" runat="server" Text="- Bạn cũng có thể gửi gmail trực tiếp tới ứng cử viên máy bằng cách chọn vào gửi thư" Font-Size="12px"></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label40" runat="server" Text="~ Hãy gửi thử trả lời lại những ứng cử viên yêu quý của bạn ♥" Font-Size="12px"></asp:Label>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-md-9 -->
                    </div>
                    <!-- /.row -->

                    <!-- /.card-body -->
                </div>
                <%--<div style="text-align: right;">
                    <asp:Button ID="Button3" runat="server" Text="Quay trở lại" class="btn btn-secondary" />
                    <asp:Button ID="Button2" runat="server" Text="Chỉnh sửa" class="btn btn-primary" OnClientClick="return validateForm();" />
                </div>--%>
            </section>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            <!-- /.card -->
        </div>

        <!-- /.col -->

        <!-- /.row -->

        <!-- /.container-fluid -->
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
    <!-- /.content -->

    <script type="text/javascript">
        function previewImage2(input) {
            //if (input.files && input.files[0]) {
            //    var reader = new FileReader();
            //    reader.onload = function (e) {
            //        document.getElementById('Image7').src = e.target.result;
            //    };
            //    reader.readAsDataURL(input.files[0]);
            //}
                        if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var image3 = document.getElementById('<%= Image3.ClientID %>');
                    image3.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
                function previewImage3(input) {
            //if (input.files && input.files[0]) {
            //    var reader = new FileReader();
            //    reader.onload = function (e) {
            //        document.getElementById('Image7').src = e.target.result;
            //    };
            //    reader.readAsDataURL(input.files[0]);
            //}
                        if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var image3 = document.getElementById('<%= Image7.ClientID %>');
                    image3.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <%--<script>
        function showCheckboxList() {
            var checkboxList = document.getElementById("<%= checkboxList.ClientID %>");
            if (checkboxList.style.display === "none") {
                checkboxList.style.display = "block";
            } else {
                checkboxList.style.display = "none";
            }
        }
    </script>--%>
    <%--<script>
        var passwordTextbox = document.getElementById('<%= passst.ClientID %>');
        var passwordToggle = document.querySelector('.password-toggle');
        var passwordLabel = document.getElementById('<%= passw.ClientID %>');
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
    </script>--%>
    <script>
        // JavaScript code
        document.addEventListener('DOMContentLoaded', function () {
            var navLinks = document.querySelectorAll('.nav-pills .nav-link');

            navLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    navLinks.forEach(function (link) {
                        link.classList.remove('active');
                    });
                    this.classList.add('active');
                });
            });
        });
    </script>
    <script>
        // Lắng nghe sự kiện khi người dùng nhấp vào các liên kết tab
        document.addEventListener("DOMContentLoaded", function () {
            var tabs = document.querySelectorAll('[data-toggle="tab"]');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].addEventListener("click", switchTab);
            }
        });

        // Hàm xử lý chuyển đổi tab
        function switchTab(event) {
            event.preventDefault();
            var activeTab = event.target.getAttribute("href");
            var tabContent = document.querySelectorAll(".tab-pane");

            // Ẩn tất cả nội dung tab
            for (var i = 0; i < tabContent.length; i++) {
                tabContent[i].style.display = "none";
            }

            // Hiển thị tab được chọn
            document.querySelector(activeTab).style.display = "block";

        }
    </script>
    <script>
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

    </script>
    <script>

        function limitInputLength(input, maxLength) {
            if (input.value.length > maxLength) {
                input.value = input.value.slice(0, maxLength);
            }
        }
    </script>
    <script>
        // Lấy các phần tử TextBox
        var textBox24 = document.getElementById('<%= TextBox24.ClientID %>');
        var textBox25 = document.getElementById('<%= TextBox25.ClientID %>');
        var textBox26 = document.getElementById('<%= TextBox26.ClientID %>');

        // Lấy các icon "mắt"
        var eyeIcon24 = document.querySelector('.form-row i.fas.fa-eye[data-textbox-id="TextBox24"]');
        var eyeIcon25 = document.querySelector('.form-row i.fas.fa-eye[data-textbox-id="TextBox25"]');
        var eyeIcon26 = document.querySelector('.form-row i.fas.fa-eye[data-textbox-id="TextBox26"]');

        // Gắn sự kiện click cho từng icon
        eyeIcon24.addEventListener('click', function () {
            if (textBox24.type === 'password') {
                textBox24.type = 'text';
                eyeIcon24.classList.add('fa-eye-slash');
            } else {
                textBox24.type = 'password';
                eyeIcon24.classList.remove('fa-eye-slash');
            }
        });

        eyeIcon25.addEventListener('click', function () {
            if (textBox25.type === 'password') {
                textBox25.type = 'text';
                eyeIcon25.classList.add('fa-eye-slash');
            } else {
                textBox25.type = 'password';
                eyeIcon25.classList.remove('fa-eye-slash');
            }
        });

        eyeIcon26.addEventListener('click', function () {
            if (textBox26.type === 'password') {
                textBox26.type = 'text';
                eyeIcon26.classList.add('fa-eye-slash');
            } else {
                textBox26.type = 'password';
                eyeIcon26.classList.remove('fa-eye-slash');
            }
        });
    </script>
    <script>
        function showCvForm(event) {
            event.preventDefault(); // Ngăn chặn việc tải lại trang

            var overlay = document.getElementById("overlay");
            var cvForm = document.getElementById("cvForm");
            overlay.style.display = "block";
            cvForm.style.display = "block";
            cvForm.classList.add("visible");

        }

        function hideCvForm() {
            var overlay = document.getElementById("overlay");
            var cvForm = document.getElementById("cvForm");
            overlay.style.display = "none";
            cvForm.style.display = "none";
            cvForm.classList.remove("visible");
        }
    </script>
    <script>
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var image2 = document.getElementById('<%= Image2.ClientID %>');
                    image2.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.all.min.js"></script>
</asp:Content>
