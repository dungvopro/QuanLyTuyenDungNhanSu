using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class DangKy1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        string b = "99";
        int dem = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }
        protected void quaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu1.aspx");

        }
        private void showThongBao(string strTB, Color color)
        {
            thongbao.Visible = true;
            thongbao.Text = strTB;
            thongbao.ForeColor = color;
        }
        protected void dangky_Click(object sender, EventArgs e)
        {
            string mail = email.Text;
            if (!Regex.IsMatch(mail, @"^[a-zA-Z0-9.-]+@gmail\.com$"))
            {
                showThongBao("Vui lòng nhập định dạng email hợp lệ", Color.Red);
                return;
            }
            if ((int)data.getSingleValue("SELECT COUNT(*) FROM TaiKhoan WHERE email='" + mail + "'") == 1)
            {          
                showThongBao("gmail này đã được sử dụng", Color.Red);
                return;
            }
            //int atIndex = mail.IndexOf("@");
            //string tenDN = mail.Substring(0, atIndex);


            else
            {
                //showThongBao("Đăng ký tài khoản thất bại!", Color.Red);
                HttpCookie pas = new HttpCookie("dangky");
                pas["passw"] = password1.Text;
                pas.Expires = DateTime.Now.AddDays(1d);
                Response.Cookies.Add(pas);

                panel1.Visible = false;
                panel2.Visible = true;
                panel3.Visible = false;
                panel4.Visible = false;
                panel5.Visible = true;
                string recipientEmail = email.Text; // Địa chỉ email của người nhận
                string subject = "Mã xác nhận kick hoạt tài khoản TeamHire"; // Tiêu đề email
                Random random = new Random();
                int randomNumber = random.Next(100000, 999999);
                
                // Kết hợp kết quả số ngẫu nhiên với câu string
                string body = "Mã xác nhận của bạn là: " + randomNumber.ToString();
                string input = randomNumber.ToString();

                // Loại bỏ các ký tự không phải số
                string output = new string(input.Where(char.IsDigit).ToArray());
                // Gán kết quả vào nhãn (label)
                maggggg.Text = output;
                
                b = password1.Text;
                try
                {
                    // Khởi tạo đối tượng SmtpClient
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    smtpClient.EnableSsl = true;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential("duc09092001@gmail.com", "nkugzranrlvlcvde");

                    // Tạo đối tượng MailMessage
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress("duc09092001@gmail.com");
                    mailMessage.To.Add(recipientEmail);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;

                    // Gửi email
                    smtpClient.Send(mailMessage);
                    showThongBao("Email đã được gửi thành công", Color.Green);                
                    // Xử lý sau khi gửi thành công
                    //Response.Write("Email đã được gửi thành công.");
                }
                catch (Exception ex)
                {
                    // Xử lý khi gửi thất bại
                    Response.Write("Gửi email thất bại. Lỗi: " + ex.Message);
                }
            }

            
        }
        protected void xacthuc_Click(object sender, EventArgs e)
        {
            string chuoi = digit1.Value + digit2.Value + digit3.Value + digit4.Value + digit5.Value + digit6.Value;
            Label2.Text = chuoi;
            if (chuoi == maggggg.Text)
            {
                panel1.Visible = false;
                panel2.Visible = false;
                panel3.Visible = true;
                panel4.Visible = false;
                panel5.Visible = false;
                if ((int)data.updateData("INSERT INTO TaiKhoan(username,password,tennguoidung,phanquyen,email) VALUES(N'" + email.Text + "','" + Request.Cookies["dangky"]["passw"].ToString() + "',N'" + firstname.Text + "','1',N'" + email.Text + "')") == 1)
                {
                    showThongBao("Đăng ký tài khoản thành công!", Color.Green);
                    //Response.Redirect("TrangChu1.aspx");
                }
                //showThongBao("Đúng mã", Color.Green);
            }
            else
            {
                dem = dem+1;
                Label4.Text = dem.ToString();
                if (dem >= 3)
                {
                    showThongBao("Bạn nên kiểm tra lại Gmail của mình", Color.Green);
                    panel1.Visible = true;
                    panel2.Visible = false;
                    panel3.Visible = false;
                    panel4.Visible = true;
                    panel5.Visible = false;
                    return;
                }
                else
                {
                    showThongBao("Sai mã", Color.Green);
                    digit1.Value = "";
                    digit2.Value = "";
                    digit3.Value = "";
                    digit4.Value = "";
                    digit5.Value = "";
                    digit6.Value = "";
                }
                
            }
        }
        protected void tieptuc_Click(object sender, EventArgs e)
        {
            string tenDN = email.Text;
            HttpCookie myCcookie = new HttpCookie("Login");
            myCcookie["tenDN"] = tenDN;
            myCcookie.Expires = DateTime.Now.AddDays(1d);
            Response.Cookies.Add(myCcookie);
            Response.Redirect("HoSoCaNhan1.aspx");
        }

    }
}