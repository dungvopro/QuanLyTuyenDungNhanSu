<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy1.aspx.cs" Inherits="TeamHire.DangKy1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Official Signup Form Flat Responsive widget Template :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- fonts -->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet" />
    <!-- /fonts -->
    <!-- css -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
    <link rel="stylesheet" href="assets/css/dangky02.css" />
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
</head>
<body>

    <h1 class="w3ls">Chào mừng bạn đến với TeamHire</h1>
    <div class="content-w3ls">
        <div class="content-agile1">
            <h2 class="agileits1">TEAMHIRE</h2>
            <p class="agileits2">Website tuyển dụng & quản lý nhân sự</p>
        </div>
        <div class="content-agile2">
            <form id="form1" action="#" method="post" runat="server">
                <asp:Panel ID="panel1" runat="server">
                    <div class="form-control w3layouts">
                        <asp:TextBox ID="firstname" runat="server" placeholder="Họ và tên" title="Vui lòng nhập tên của bạn" required=""></asp:TextBox>
                    </div>

                    <div class="form-control w3layouts">
                        <asp:TextBox ID="email" runat="server" name="email" placeholder="mail@example.com" title="Vui lòng nhập email" required=""></asp:TextBox>
                    </div>

                    <div class="form-control agileinfo">
                        <asp:TextBox ID="password1" runat="server" TextMode="Password" class="lock" name="password" placeholder="Nhập mật khẩu" required=""></asp:TextBox>
                    </div>

                    <div class="form-control agileinfo">
                        <asp:TextBox ID="password2" runat="server" TextMode="Password" class="lock" name="confirm-password" placeholder="Nhập lại mật khẩu" required=""></asp:TextBox>
                    </div>

                    <div style="text-align: center;">
                        <asp:Button ID="quayla" runat="server" Text="Trở lại" Style="background-color: #ccc; color: #fff; border: none; padding: 10px 20px; font-size: 14px; border-radius: 4px; cursor: pointer; display: inline-block;" OnClick="quaylai_Click" OnClientClick="clearTextFields();" />
                        <asp:Button ID="submi" runat="server" Text="Đăng ký" class="register" Style="background-color: #007bff; color: #fff; border: none; padding: 10px 20px; font-size: 14px; border-radius: 4px; cursor: pointer; display: inline-block;" OnClick="dangky_Click" />

                    </div>
                </asp:Panel>
                <asp:Panel ID="panel2" runat="server" Visible="false">
                    <div style="text-align: center;">
                        <asp:Label ID="Label1" runat="server" Text="Vui lòng nhập mã xác nhận" Style="color: #FFF; font-size: 24px; font-weight: bold; margin-bottom: 20px;"></asp:Label>
                    </div>
                    <div style="text-align: center;">
    <i class="fa fa-clock-o" style="color: white;"></i>
    <span id="remainingTime" style="color: white;">5:00</span>
    <br />
</div>
                    <div class="form-control w3layouts" style="text-align: center;">
                        <div>
                            <input type="text" id="digit1" runat="server" maxlength="1" oninput="nextInput(this, 'digit2')" onkeypress="return isNumberKey(event)" style="color: #FFF; border: none; border-bottom: 2px solid #FFF; background-color: transparent; font-size: 16px; width: 30px; margin-right: 5px; text-align: center;" />
                            <input type="text" id="digit2" runat="server" maxlength="1" oninput="nextInput(this, 'digit3')" onkeypress="return isNumberKey(event)" style="color: #FFF; border: none; border-bottom: 2px solid #FFF; background-color: transparent; font-size: 16px; width: 30px; margin-right: 5px; text-align: center;" />
                            <input type="text" id="digit3" runat="server" maxlength="1" oninput="nextInput(this, 'digit4')" onkeypress="return isNumberKey(event)" style="color: #FFF; border: none; border-bottom: 2px solid #FFF; background-color: transparent; font-size: 16px; width: 30px; margin-right: 5px; text-align: center;" />
                            <input type="text" id="digit4" runat="server" maxlength="1" oninput="nextInput(this, 'digit5')" onkeypress="return isNumberKey(event)" style="color: #FFF; border: none; border-bottom: 2px solid #FFF; background-color: transparent; font-size: 16px; width: 30px; margin-right: 5px; text-align: center;" />
                            <input type="text" id="digit5" runat="server" maxlength="1" oninput="nextInput(this, 'digit6')" onkeypress="return isNumberKey(event)" style="color: #FFF; border: none; border-bottom: 2px solid #FFF; background-color: transparent; font-size: 16px; width: 30px; margin-right: 5px; text-align: center;" />
                            <input type="text" id="digit6" runat="server" maxlength="1" oninput="nextInput(this, 'digit6')" onkeypress="return isNumberKey(event)" style="color: #FFF; border: none; border-bottom: 2px solid #FFF; background-color: transparent; font-size: 16px; width: 30px; margin-right: 5px; text-align: center;" />
                        </div>
                        <br />
                    </div>
                    <div style="text-align: center; margin-top: 20px;">
                        <asp:Button ID="huy" runat="server" Text="Hủy" CssClass="button" OnClick="quaylai_Click" OnClientClick="clearTextFields();" Style="background-color: #CCC; color: #FFF; border: none; padding: 10px 20px; font-size: 14px; border-radius: 4px; cursor: pointer; display: inline-block; margin-right: 10px;" />
                        <asp:Button ID="xacthuc" runat="server" Text="Xác thực" CssClass="button register" OnClick="xacthuc_Click" Style="background-color: #007BFF; color: #FFF; border: none; padding: 10px 20px; font-size: 14px; border-radius: 4px; cursor: pointer; display: inline-block;" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="panel3" runat="server" Visible="false">
                    <div style="text-align: center;">
                        <asp:Label ID="Label3" runat="server" Text="Chúc mừng bạn đăng ký thành công!" Style="color: #FFF; font-size: 24px; font-weight: bold; margin-bottom: 20px;"></asp:Label>
                        <br />
                        <br />
                        <img src="assets/images/tichxanh.png" alt="" style="width: 25%;" />
                    </div>
                    <div style="text-align: center; margin-top: 20px;">
                        <asp:Button ID="tt" runat="server" Text="Tiếp tục" CssClass="button register" OnClick="tieptuc_Click" Style="background-color: #007BFF; color: #FFF; border: none; padding: 10px 20px; font-size: 14px; border-radius: 4px; cursor: pointer; display: inline-block;" />
                    </div>
                </asp:Panel>
                <div style="text-align: center;">
                    <asp:Label ID="thongbao" runat="server" Text=""></asp:Label>
                </div>
            
            <script>
                function nextInput(currentInput, nextInputId) {
                    if (currentInput.value.length === 1) {
                        document.getElementById(nextInputId).focus();
                    }
                }

                function isNumberKey(evt) {
                    var charCode = (evt.which) ? evt.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                        return false;
                    }
                    return true;
                }

                function validateCode() {
                    var code = "";
                    for (var i = 1; i <= 6; i++) {
                        var digit = document.getElementById("digit" + i).value;
                        code += digit;
                    }
                    // Do something with the code (validate or submit)
                }
            </script>

            <script type="text/javascript">
                window.onload = function () {
                    document.getElementById("password1").onchange = validatePassword;
                    document.getElementById("password2").onchange = validatePassword;
                }
                function validatePassword() {
                    var pass2 = document.getElementById("password2").value;
                    var pass1 = document.getElementById("password1").value;
                    if (pass1 != pass2)
                        document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                    else
                        document.getElementById("password2").setCustomValidity('');
                    //empty string means no validation error
                }
            </script>
            <script>
                function clearTextFields() {
                    document.getElementById('<%= firstname.ClientID %>').value = ' ';
                    document.getElementById('<%= email.ClientID %>').value = ' ';
                    document.getElementById('<%= password1.ClientID %>').value = ' ';
                    document.getElementById('<%= password2.ClientID %>').value = ' ';
                }
            </script>
                <script>
    // Hàm tính toán và cập nhật giá trị đồng hồ đếm ngược
    function updateRemainingTime() {
        var remainingTime = document.getElementById("remainingTime").innerHTML;
        var timeParts = remainingTime.split(":");
        var minutes = parseInt(timeParts[0]);
        var seconds = parseInt(timeParts[1]);

        if (minutes === 0 && seconds === 0) {
            clearInterval(intervalId);
            return;
        }

        if (seconds === 0) {
            minutes--;
            seconds = 59;
        } else {
            seconds--;
        }

        var formattedTime = minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');
        document.getElementById("remainingTime").innerHTML = formattedTime;
    }

    // Cập nhật giá trị đồng hồ đếm ngược mỗi giây
    var intervalId = setInterval(updateRemainingTime, 1000);
</script>
                
            <asp:Panel ID="panel4" runat="server">
            <p class="wthree w3l">
                Bạn có muốn 
    <a href="TuyenDung1.aspx" style="color: white; text-decoration: underline;">khôi phục</a> tài khoản không?
            </p>
                 </asp:Panel>
            <asp:Panel ID="panel5" runat="server" Visible="false">
            <p class="wthree w3l">
                Bạn có muốn 
   <asp:LinkButton ID="LinkButton991" runat="server" style="color: white; text-decoration: underline;" OnClick="dangky_Click">gửi lại</asp:LinkButton> mã xác nhận không?
            </p>
                 </asp:Panel>
            <ul class="social-agileinfo wthree2">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
            </ul>
                </form>
        </div>
        <div class="clear">
            <asp:Label ID="maggggg" runat="server" Text="" ForeColor="#CC0000" Visible="False"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="" ForeColor="White" Visible="False"></asp:Label>
        </div>

    </div>
    <p class="copyright w3l">© 2017 Official Signup Form. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">W3layouts</a></p>
    <asp:Label ID="Label4" runat="server" Text="hello"></asp:Label>
    <script>
    // Lấy tham chiếu đến các phần tử TextBox và Label
    var textBox = document.getElementById('<%= password1.ClientID %>');
    var label = document.getElementById('<%= Label4.ClientID %>');

    // Gán giá trị từ TextBox vào Label khi TextBox thay đổi
    textBox.addEventListener('input', function() {
        label.innerText = textBox.value;
    });
</script>
</body>
</html>
