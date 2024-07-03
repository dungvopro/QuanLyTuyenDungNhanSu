using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Timers;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class HoSoCaNhan1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        string hinhanh, hinh = "01";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
            {
                BindDataList();
                tuyenDataList();
                TextBox2.Text = DateTime.Now.ToString("MM/dd/yyyy");
                string q1 = "SELECT NganhNghe FROM LoaiTuyenDung";
                DataTable dtt = data.getData(q1);
                foreach (DataRow row in dtt.Rows)
                {
                    string maLTD = row["NganhNghe"].ToString();
                    cv.Items.Add(maLTD);
                }
                Image7.ImageUrl = ResolveUrl("~/assets/images/anhTD.png");
                showtaikhoan();
                donDataList();
                iconVip();
            }
            else
            {
                Response.Redirect("QuanTri.aspx");
            }

        }
        void showtaikhoan()
        {
            string q = "select * from TaiKhoan where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
            DataTable dt = data.getData(q);
            if (dt.Rows.Count > 0)
            {
                string imageFileName = dt.Rows[0]["avatar"].ToString();
                string imagePath = "~/assets/images/" + imageFileName;
                if (File.Exists(Server.MapPath(imagePath)))
                {
                    // Gán đường dẫn hình ảnh vào cho ImageUrl
                    Image2.ImageUrl = ResolveUrl(imagePath);
                }
                else
                {
                    // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                    Image2.ImageUrl = ResolveUrl("~/assets/images/bot_icon.jpg");
                }
                // Lấy giá trị của trường "tennguoidung" từ bản ghi đầu tiên
                string tnv = dt.Rows[0]["tennguoidung"].ToString();
                string user = dt.Rows[0]["username"].ToString();
                string pass = dt.Rows[0]["password"].ToString();
                string sdt = dt.Rows[0]["sodienthoai"].ToString();
                string diach = dt.Rows[0]["diachi"].ToString();
                string mail = dt.Rows[0]["email"].ToString();
                string ns = dt.Rows[0]["ngaysinh"].ToString();
                string gt = dt.Rows[0]["gioitinh"].ToString();
                string cv = dt.Rows[0]["filecv"].ToString();
                string thuv = dt.Rows[0]["thucv"].ToString();
                tennv.Text = tnv;
                Label44.Text = tnv;
                TextBox20.Text = tnv;
                tendn.Text = user;
                //passst.Text = pass;
                gmail.Text = mail;
                sodienthoai.Text = sdt;
                TextBox21.Text = sdt;
                diachi.Text = diach;
                TextBox23.Text = diach;
                gioitinh.Text = gt;
                if (ns != "")
                {
                    DateTime ngayc = DateTime.Parse(ns);
                    ngaysinh.Text = ngayc.ToString("dd/MM/yyyy");
                }
                //Label62.Text = cv;
                if(cv != "")
                {
                    filecvhaha.Visible = true;
                }
                else
                {
                    filecvhaha.Visible = false;
                    
                }
                
                if (cv.Length > 11)
                {
                    cv = cv.Substring(0, 11) + "...";
                }

                Label62.Text = cv;
                myTextarea.Value = thuv;
                if(cv == "")
                {
                    Label62.Text = "(File CV xin việc)";
                }
            }
        }
        //VIP to giàu :3
        //protected void VIP_Click(object sender, EventArgs e)
        //{
        //    overlay.Visible = false;
        //    cvForm.Visible = true;
        //}
        //Thông tin cá nhân :<
        private void thehien(string strTB, Color color)
        {
            Label58.Visible = true;
            Label58.Text = strTB;
            Label58.ForeColor = color;
        }
        protected void SuaTen_Click(object sender, EventArgs e)
        {
            Label44.Visible = false;
            TextBox20.Visible = true;
            suaten.Visible = false;
            Div1.Visible = true;
        }
        protected void Huyten_Click(object sender, EventArgs e)
        {
            Label44.Visible = true;
            TextBox20.Visible = false;
            suaten.Visible = true;
            Div1.Visible = false;
        }
        protected void Luuten_Click(object sender, EventArgs e)
        {
            if(TextBox20.Text == "")
            {
                Label57.Visible = true;
                return;
            }
            else
            {
                Label57.Visible = false;
            }
            string q = "update TaiKhoan set tennguoidung = N'"+ TextBox20.Text + "' where username = '"+ Request.Cookies["Login"]["tenDN"].ToString() + "'";
            if (data.updateData(q) > 0)
            {
                thehien("Cập nhật tên cá nhân thành công!", Color.Green);
                Label44.Visible = true;
                TextBox20.Visible = false;
                suaten.Visible = true;
                Div1.Visible = false;
                showtaikhoan();
            }
            else
                thehien("Cập nhật tên cá nhân thất bại!", Color.Red);
        }
        //sdt
        protected void SuaSDT_Click(object sender, EventArgs e)
        {
            sodienthoai.Visible = false;
            TextBox21.Visible = true;
            Div2.Visible = false;
            Div3.Visible = true;
        }
        protected void HuySDT_Click(object sender, EventArgs e)
        {
            sodienthoai.Visible = true;
            TextBox21.Visible = false;
            Div2.Visible = true;
            Div3.Visible = false;
        }
        protected void LuuSDT_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox21.Text) && TextBox21.Text.Length < 10)
            {
                Label59.Visible = true;
                return;
            }
            else
            {
                Label59.Visible = false;
            }
            string q = "update TaiKhoan set sodienthoai = N'" + TextBox21.Text + "' where username = '" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
            if (data.updateData(q) > 0)
            {
                thehien("Cập nhật số điên thoại thành công!", Color.Green);
                sodienthoai.Visible = true;
                TextBox21.Visible = false;
                Div2.Visible = true;
                Div3.Visible = false;
                showtaikhoan();
            }
            else
                thehien("Cập nhật số điên thoạin thất bại!", Color.Red);
        }
        //giới tính
        protected void SuaGioiTinh_Click(object sender, EventArgs e)
        {
            gioitinh.Visible = false;
            gioti.Visible = true;
            Div4.Visible = false;
            Div5.Visible = true;
        }
        protected void HuyGioiTinh_Click(object sender, EventArgs e)
        {
            gioitinh.Visible = true;
            gioti.Visible = false;
            Div4.Visible = true;
            Div5.Visible = false;
        }
        protected void LuuGioiTinh_Click(object sender, EventArgs e)
        {
            string q = "update TaiKhoan set gioitinh = N'" + Select7.Value + "' where username = '" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
            if (data.updateData(q) > 0)
            {
                thehien("Cập nhật số điên thoại thành công!", Color.Green);
                gioitinh.Visible = true;
                gioti.Visible = false;
                Div4.Visible = true;
                Div5.Visible = false;
                showtaikhoan();
            }
            else
                thehien("Cập nhật số điện thoại thất bại!", Color.Red);
        }
        //ngaysinh
        protected void SuaNgaySinh_Click(object sender, EventArgs e)
        {
            ngaysinh.Visible = false;
            ngaysinhh.Visible = true;
            Div6.Visible = false;
            Div7.Visible = true;
        }
        protected void HuyNgaySinh_Click(object sender, EventArgs e)
        {
            ngaysinh.Visible = true;
            ngaysinhh.Visible = false;
            Div6.Visible = true;
            Div7.Visible = false;
        }
        protected void LuuNgaySinh_Click(object sender, EventArgs e)
        {
            string dateOfBirthText = TextBox22.Text;
            DateTime dateOfBirth;

            if (DateTime.TryParseExact(dateOfBirthText, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dateOfBirth))
            {
                DateTime currentDate = DateTime.Now.Date;

                if (dateOfBirth > currentDate)
                {
                    Label60.Visible = true;
                    Label60.Text = " (Ngày sinh không thể vược qua ngày hiện tại) *";
                    // Ngày sinh vượt qua ngày hiện tại
                    // Gửi thông báo lỗi cho người dùng hoặc thực hiện xử lý khác tùy theo yêu cầu của bạn
                }
                else
                {
                    Label60.Visible = false;
                    string ngaythangsinh = dateOfBirth.ToString("MM/dd/yyyy");
                    string q = "update TaiKhoan set ngaysinh = '" + ngaythangsinh + "' where username = '" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                    if (data.updateData(q) > 0)
                    {
                        thehien("Cập nhật ngày sinh thành công!", Color.Green);
                        ngaysinh.Visible = true;
                        ngaysinhh.Visible = false;
                        Div6.Visible = true;
                        Div7.Visible = false;
                        showtaikhoan();
                    }
                    else
                        thehien("Cập nhật ngày sinh thất bại!", Color.Red);
                }
            }
            else
            {
                Label60.Visible = true;
                Label60.Text = " (Ngày sinh không đúng định dạng) *";
                // Ngày sinh không có định dạng hợp lệ
                // Gửi thông báo lỗi cho người dùng hoặc thực hiện xử lý khác tùy theo yêu cầu của bạn
            }
        }
        //diachi
        protected void SuaDiaChi_Click(object sender, EventArgs e)
        {
            diachi.Visible = false;
            TextBox23.Visible = true;
            Div8.Visible = false;
            Div9.Visible = true;
        }
        protected void HuyDiaChi_Click(object sender, EventArgs e)
        {
            diachi.Visible = true;
            TextBox23.Visible = false;
            Div8.Visible = true;
            Div9.Visible = false;
        }
        protected void LuuDiaChi_Click(object sender, EventArgs e)
        {
            string q = "update TaiKhoan set diachi = N'" + TextBox23.Text + "' where username = '" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
            if (data.updateData(q) > 0)
            {
                thehien("Cập nhật địa chỉ thành công!", Color.Green);
                diachi.Visible = true;
                TextBox23.Visible = false;
                Div8.Visible = true;
                Div9.Visible = false;
                showtaikhoan();
            }
            else
                thehien("Cập nhật địa chỉ thất bại!", Color.Red);
        }
        //doimk
        protected void doimk_click(object sender, EventArgs e)
        {
            Button1.Visible = false;
            Button27.Visible = true;
            Button28.Visible = true;
            dangnhap.Visible = false;
            Ul1.Visible = true;
        }
        protected void huydoimk_click(object sender, EventArgs e)
        {
            Button1.Visible = true;
            Button27.Visible = false;
            Button28.Visible = false;
            dangnhap.Visible = true;
            Ul1.Visible = false;
        }
        private void mkThongBao(string strTB, Color color)
        {
            lbThongBao.Visible = true;
            lbThongBao.Text = strTB;
            lbThongBao.ForeColor = color;
        }
        private int countdownSeconds = 20;
        private bool isPasswordChangeBlocked = false;
        private System.Timers.Timer countdownTimer;

        private void BlockPasswordChange()
        {
            isPasswordChangeBlocked = true;
            countdownTimer = new System.Timers.Timer(1000); // 1 giây
            countdownTimer.Elapsed += CountdownTimerElapsed;
            countdownTimer.Start();
            Button1.Enabled = false; // Block button đổi mật khẩu
            //UpdateCountdownLabel();
            mkThongBao("Đổi mật khẩu thất bại! Bạn đã bị cấm đổi mật khẩu trong " + countdownSeconds + " giây.", Color.Red);
        }

        private void CountdownTimerElapsed(object sender, ElapsedEventArgs e)
        {
            countdownSeconds--;
            if (countdownSeconds <= 0)
            {
                countdownTimer.Stop();
                countdownTimer.Dispose();
                isPasswordChangeBlocked = false;
                Button1.Enabled = true; // Mở khóa button đổi mật khẩu
                mkThongBao("", Color.Red); // Xóa thông báo trên Label
            }
            else
            {
                UpdateCountdownLabel();
            }
        }

        private void UpdateCountdownLabel()
        {
            countdownLabel.Text = "Cấm đổi mật khẩu trong " + countdownSeconds + " giây.";
        }
        protected void xacnhandoimk_click(object sender, EventArgs e)
        {
            int c = 0;
            string matKhau = TextBox24.Text.ToString().Trim();
            if (TextBox25.Text == "")
            {
                mkThongBao("không được bỏ trống mật khẩu mới!", Color.Red);
            }
            else if ((int)data.getSingleValue("SELECT COUNT(*) FROM TaiKhoan WHERE username='" + Request.Cookies["Login"]["tenDN"].ToString() + "' AND password='" + matKhau + "'") == 1)
            {
                if (TextBox25.Text != TextBox26.Text)
                {
                    mkThongBao("Mật khẩu xác thực không trùng!", Color.Red);
                }
                else
                {
                    if (data.updateData("update TaiKhoan set password = '" + TextBox25.Text + "' where username='" + Request.Cookies["Login"]["tenDN"].ToString() + "'") > 0)
                    {
                        Button1.Visible = true;
                        Button27.Visible = false;
                        Button28.Visible = false;
                        dangnhap.Visible = true;
                        Ul1.Visible = false;
                        mkThongBao("Đổi mật khẩu thành công!", Color.Green);
                        showtaikhoan();
                    }
                    else
                    {
                        mkThongBao("Đổi mật khẩu thất bại!", Color.Red);
                        
                    }
                }
            }
            else
            {
                mkThongBao("Mật khẩu admin không chính xác!", Color.Red);
                c++;
                if(c >= 3) {
                    BlockPasswordChange();
                    Button1.Visible = true;
                    Button27.Visible = false;
                    Button28.Visible = false;
                    dangnhap.Visible = true;
                    Ul1.Visible = false;
                }
                
            }


        }
        //luu cv
        protected void luucv_click(object sender, EventArgs e)
        {
            string fileName;
            if (FileUpload2.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload2.FileName.ToLower());
                bool isValidFileType = (fileExtension == ".doc" || fileExtension == ".docx" || fileExtension == ".xls" || fileExtension == ".pdf");

                // Kiểm tra kích thước tệp tin
                bool isFileSizeValid = (FileUpload2.PostedFile.ContentLength <= (3 * 1024 * 1024)); // 3MB

                if (isValidFileType && isFileSizeValid)
                {
                    fileName = Path.GetFileName(FileUpload2.FileName);
                    string filePath = Server.MapPath("~/assets/fileCV/") + fileName;
                    FileUpload2.SaveAs(filePath);

                    // Hiển thị thông báo thành công
                    //Label45.Visible = false;
                    //TextBox2.Text = "02";
                    Label65.ForeColor = System.Drawing.ColorTranslator.FromHtml("#666666");
                    Label66.ForeColor = System.Drawing.ColorTranslator.FromHtml("#666666");
                    Label65.Font.Underline = false;
                    Label66.Font.Underline = false;
                    string qq = "update TaiKhoan set filecv = N'"+ fileName + "', thucv = N'"+ myTextarea.Value + "' where username='" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                    if (data.updateData(qq) > 0)
                    {
                        thehien("Tải file lên thành công!", Color.Green);
                        showtaikhoan();
                    }
                    else
                        thehien("Tải file lên thất bại!", Color.Red);
                }
                else
                {
                    if (!isValidFileType)
                    {
                        Label65.ForeColor = System.Drawing.Color.Red;
                        Label65.Font.Underline = true;
                        //Label45.Visible = true;
                        //TextBox2.Text = "";
                        return;
                    }
                    else if (!isFileSizeValid)
                    {
                        Label66.ForeColor = System.Drawing.Color.Red;
                        Label66.Font.Underline = true;
                        //Label45.Visible = true;
                        //TextBox2.Text = "";
                        return;
                    }
                }
            }
            else
            {
                // Hiển thị thông báo lỗi
                //StatusLabel.Visible = true;
                //StatusLabel.Text = "Vui lòng chọn một tệp tin để tải lên.";
                //Label45.Visible = true;
                //TextBox2.Text = "";
                string qq2 = "update TaiKhoan set thucv = N'" + myTextarea.Value + "' where username='" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                if (data.updateData(qq2) > 0)
                {
                    thehien("Cập nhật thư xin việc thành công!", Color.Green);
                    showtaikhoan();
                }
                else
                    thehien("Cập nhật thư xin việc thất bại!", Color.Red);
            }
        }
        protected void taicvxuong_click(object sender, EventArgs e)
        {
            string q = "select filecv from TaiKhoan where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
            DataTable dt = data.getData(q);
            if (dt.Rows.Count > 0)
            {
                string fileName = dt.Rows[0]["filecv"].ToString();
                string filePath = "~/assets/fileCV/" + fileName;

                // Tải file về máy
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
            }
            
        }
        protected void xoacvdi_click(object sender, EventArgs e)
        {
            string q = "select filecv from TaiKhoan where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
            DataTable dt = data.getData(q);

            if (dt.Rows.Count > 0)
            {
                string fileName = dt.Rows[0]["filecv"].ToString();
                string filePath = "~/assets/fileCV/" + fileName;

                // Xóa tệp tin
                File.Delete(Server.MapPath(filePath));

                // Xóa tên tệp tin trong cơ sở dữ liệu
                string deleteQuery = "update TaiKhoan set filecv = '' where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                if (data.updateData(deleteQuery) > 0)
                {
                    thehien("xóa file xin việc thành công!", Color.Green);
                    showtaikhoan();
                }
                else
                    thehien("xóa file xin việc thất bại!", Color.Red);

                // Hiển thị thông báo xóa thành công hoặc thất bại
            }
            else
            {
                // Hiển thị thông báo không tìm thấy tệp tin
                thehien("không tìm thấy file xin việc!", Color.Red);
            }
        }
        //QL tuyển dụng
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                    return 0;
                else
                    return Convert.ToInt32(ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        void BindDataList()
        {
            PagedDataSource objPage = null;
            DataTable dt = null;
            try
            {
                // Kích thước trang
                int pageSize = 6;

                // Truy vấn dữ liệu từ cơ sở dữ liệu
                string sql = "SELECT * FROM TuyenDung,LoaiTuyenDung,TaiKhoan WHERE TaiKhoan.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "' and TaiKhoan.username = TuyenDung.username and TuyenDung.MaLTD = LoaiTuyenDung.MaLTD ";
                dt = data.getData(sql);

                // Thiết lập đối tượng PagedDataSource
                objPage = new PagedDataSource();
                objPage.DataSource = dt.DefaultView;
                objPage.AllowPaging = true;
                objPage.PageSize = pageSize;
                objPage.CurrentPageIndex = CurrentPage;
                btnSau.Enabled = !objPage.IsLastPage;
                btnTruoc.Enabled = !objPage.IsFirstPage;

                // Thiết lập nguồn dữ liệu cho DataList và hiển thị dữ liệu phân trang
                DataList1.DataSource = objPage;
                DataList1.DataBind();

                // Kiểm tra và chọn trang hiện tại
                if (CurrentPage >= 1 && CurrentPage <= objPage.PageCount)
                {
                    ((LinkButton)DataList1.FindControl("lnkPage" + CurrentPage)).CssClass = "page-link active";
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                if (dt != null)
                {
                    dt.Dispose();
                }
            }
        }
        void tabB()
        {
            string script = @"<script>
                        var tabContent = document.querySelector('.tab-pane.active');
                        tabContent.classList.remove('active');
                        var commteDiv = document.getElementById('timeline');
                        commteDiv.classList.add('active');
                        </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "SetActiveTab1", script);

            string script2 = @"<script>
                        window.onload = function() {
                        var tabs = document.querySelectorAll('.nav-link');
                        tabs.forEach(function(tab) {
                        tab.classList.remove('active');
                        });
                        var tabC = document.getElementById('tab-b');
                        tabC.classList.add('active');
                        };
                        </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "SetActiveTab2", script2);
        }
        protected void btnSau_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataList();
            tabB();
        }

        protected void btnTruoc_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataList();
            tabB();
        }

        protected void lnkPage_Click(object sender, EventArgs e)
        {
            CurrentPage = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            BindDataList();
            tabB();
        }
        protected void them_Click(object sender, EventArgs e)
        {
            if ((int)data.getSingleValue("SELECT COUNT(*) FROM BusinessPremium WHERE username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'") > 0)
            {
                string qh2 = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                DataTable dth2 = data.getData(qh2);
                DateTime ngayHienTai = DateTime.Now;

                if (dth2.Rows.Count > 0)
                {
                    string han = dth2.Rows[0]["Ngayhethan"].ToString();
                    DateTime ngayHetHan = DateTime.Parse(han);
                    TimeSpan thoiGianConLai = ngayHetHan - ngayHienTai;

                    if (thoiGianConLai.TotalDays <= 0)
                    {
                        // Thông báo ngày đã hết hạn
                        string script = @"
            <script>
            Swal.fire({
                title: 'Cảnh báo!',
                text: 'Bạn đã hết hạn sử dụng BusinessPremium.',
                icon: 'warning'
            });
            </script>
        ";
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
                    }
                    else
                    {
                        panel1.Visible = false;
                        panel2.Visible = true;
                        tabB();
                    }
                }
            }
            else
            {
                string script = @"
            <script>
            Swal.fire({
                title: 'Cảnh báo!',
                text: 'Bạn chưa đăng ký sử dụng BusinessPremium.',
                icon: 'warning'
            });
            </script>
        ";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }
        protected void huybo_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            panel2.Visible = false;
            tabB();
        }
        private void showThongBao(string strTB, Color color)
        {
            lbThongB.Visible = true;
            lbThongB.Text = strTB;
            lbThongB.ForeColor = color;
        }
        protected void dangtin_Click(object sender, EventArgs e)
        {
            //panel1.Visible = true;
            //panel2.Visible = false;
            string donga, loaitd = "1";
            if (tentuyendung.Text == "")
            {
                Label5.Visible = true;
            }
            if (tentuyendung.Text != "")
            {
                Label5.Visible = false;
            }
            if (cv.Value == "0")
            {
                Label6.Visible = true;
            }
            if (cv.Value != "0")
            {
                Label6.Visible = false;
            }
            if (kinhn.Value == "0")
            {
                Label7.Visible = true;
            }
            if (kinhn.Value != "0")
            {
                Label7.Visible = false;
            }
            if (capbaac.Value == "0")
            {
                Label8.Visible = true;
            }
            if (capbaac.Value != "0")
            {
                Label8.Visible = false;
            }
            if (kc.Value == "0")
            {
                Label9.Visible = true;
            }
            if (kc.Value != "0")
            {
                Label9.Visible = false;
            }
            if (TextBox2.Text == "")
            {
                Label11.Visible = true;
            }
            if (TextBox2.Text != "")
            {
                Label11.Visible = false;
            }
            if (TextBox3.Text == "")
            {
                Label10.Visible = true;
            }
            if (TextBox3.Text != "")
            {
                Label10.Visible = false;
            }
            if (TextBox5.Text == "")
            {
                Label12.Visible = true;
            }
            if (TextBox5.Text != "")
            {
                Label12.Visible = false;
            }
            if (tentuyendung.Text != "" && cv.Value != "0" && kinhn.Value != "0" && capbaac.Value != "0" && kc.Value != "0" && TextBox2.Text != "" && TextBox3.Text != "" && TextBox5.Text != "")
            {
                if (cv.Value == "Pha chế") loaitd = "1";
                if (cv.Value == "Phục vụ") loaitd = "2";
                if (cv.Value == "An ninh") loaitd = "3";
                if (cv.Value == "Bảo vệ") loaitd = "4";
                if (cv.Value == "Bán hàng") loaitd = "5";
                if (cv.Value == "Báo chí") loaitd = "6";
                if (cv.Value == "Bảo hiểm") loaitd = "7";
                if (cv.Value == "Bảo trì") loaitd = "8";
                if (cv.Value == "Bất động sản") loaitd = "9";
                if (cv.Value == "Biên phiên dịch") loaitd = "10";
                if (cv.Value == "Công nghệ thông tin") loaitd = "11";
                if (cv.Value == "Dầu khí") loaitd = "12";
                if (cv.Value == "Dệt may") loaitd = "13";
                if (cv.Value == "Dịch vụ khách hàng") loaitd = "14";
                if (cv.Value == "Điện lạnh") loaitd = "15";
                if (cv.Value == "Du lịch") loaitd = "16";
                if (cv.Value == "Dược") loaitd = "17";
                if (cv.Value == "Điện") loaitd = "18";
                if (cv.Value == "Đồ gỗ") loaitd = "19";
                if (cv.Value == "Giáo dục") loaitd = "20";
                if (cv.Value == "Kế toán") loaitd = "21";
                if (cv.Value == "Khách sạn") loaitd = "22";
                if (cv.Value == "Kiến trúc") loaitd = "23";
                if (cv.Value == "Kỹ Thuật") loaitd = "24";
                if (cv.Value == "Lao động") loaitd = "25";
                if (cv.Value == "Nhân sự") loaitd = "26";
                if (cv.Value == "Thư ký") loaitd = "27";
                if (cv.Value == "Tiếp thị") loaitd = "28";
                if (cv.Value == "Tư vấn") loaitd = "29";
                if (cv.Value == "Viễn thông") loaitd = "30";
                if (cv.Value == "Xây dựng") loaitd = "31";
                if (cv.Value == "Khác") loaitd = "32";
                if (fileUploader.HasFile)
                {
                    try
                    {
                        hinhanh = System.IO.Path.GetFileName(fileUploader.FileName);
                        string filePath = Server.MapPath("~/assets/images/") + hinhanh;
                        fileUploader.SaveAs(filePath);
                    }
                    catch (Exception ex)
                    {
                        showThongBao("error: " + ex.Message.ToString(), Color.Red);
                    }
                }
                else
                {
                    showThongBao("you have not specified a file.", Color.Red);
                }

                donga = "Thương lượng";
                if (mucluon.Text != "")
                {
                    donga = mucluon.Text + "tr/tháng";
                }
                string sql = "insert into TuyenDung values (N'" + tentuyendung.Text + "',N'" + donga + "',N'" + kinhn.Value + "',N'" + kc.Value + "','" + TextBox2.Text + "','" + TextBox3.Text + "',N'" + Select3.Value + "',N'" + Textarea1.Value + "',N'" + Tex22.Value + "',N'" + Textarea3.Value + "',N'" + TextBox5.Text + "','" + hinhanh + "',N'" + Textarea2.Value + "',N'" + capbaac.Value + "','" + loaitd + "',N'" + TextBox1.Text + "','" + Request.Cookies["Login"]["tenDN"].ToString() + "')";
                string sql1 = "insert into TuyenDung(TenTD,MaLTD) values (N'" + tentuyendung.Text + "','" + loaitd + "')";
                if (data.updateData(sql) > 0)
                    showThongBao("Đăng tuyển dụng thành công!", Color.Green);
                else
                    showThongBao("Đăng tuyển dụng thất bại!", Color.Red);
            }
            tabB();
        }
        protected void xxoa_Click(object sender, EventArgs e)
        {
            string sql = "delete TuyenDung where MaTD = '" + ((Button)sender).CommandArgument + "'";
            //int a = data.updateData(sql);
            if (data.updateData(sql) == 1)
            {
                BindDataList();
                showThongBao("Xoá thành công", Color.Green);
            }
            else
            {
                showThongBao("xóa thất bại!", Color.Red);
            }
            tabB();
        }
        protected void chitet_Click(object sender, EventArgs e)
        {
            string mabds = ((Button)sender).CommandArgument;
            Response.Redirect("ChiTietTuyenDung1.aspx?MaTD=" + mabds);
        }
        protected void chinhssua_Click(object sender, EventArgs e)
        {
            string maw = ((Button)sender).CommandArgument;

            panel1.Visible = false;
            panel2.Visible = false;
            panel3.Visible = true;
            string q1 = "SELECT NganhNghe FROM LoaiTuyenDung";
            DataTable dtt = data.getData(q1);
            foreach (DataRow row in dtt.Rows)
            {
                string maLTD = row["NganhNghe"].ToString();
                Select1.Items.Add(maLTD);
            }
            string q2 = "select * from TuyenDung,LoaiTuyenDung where TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TuyenDung.MaTD = '" + maw + "'";
            DataTable dt2 = data.getData(q2);
            if (dt2.Rows.Count > 0)
            {
                string imageFileNam = dt2.Rows[0]["Logo"].ToString();
                string imagePat = "~/assets/images/" + imageFileNam;
                if (File.Exists(Server.MapPath(imagePat)))
                {
                    // Gán đường dẫn hình ảnh vào cho ImageUrl
                    Image3.ImageUrl = ResolveUrl(imagePat);
                }
                else
                {
                    // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                    Image3.ImageUrl = ResolveUrl("~/assets/images/anhTD.jpg");
                }
                string tdt = dt2.Rows[0]["TenTD"].ToString();
                string tdt1 = dt2.Rows[0]["DonGia"].ToString();
                string tdt2 = dt2.Rows[0]["NamKinhNghiem"].ToString();
                string tdt3 = dt2.Rows[0]["DiaChi"].ToString();
                string tdt4 = dt2.Rows[0]["NgayTD"].ToString();
                string tdt5 = dt2.Rows[0]["NgayHetHan"].ToString();
                string tdt6 = dt2.Rows[0]["GioiTinh"].ToString();
                string tdt7 = dt2.Rows[0]["KyNangYeuCau"].ToString();
                string tdt8 = dt2.Rows[0]["ChiTietCongViec"].ToString();
                string tdt9 = dt2.Rows[0]["ThongTinLienHe"].ToString();
                string tdt10 = dt2.Rows[0]["ThongTinCongTy"].ToString();
                string tdt11 = dt2.Rows[0]["QuyenLoi"].ToString();
                string tdt12 = dt2.Rows[0]["NganhNghe"].ToString();
                string tdt13 = dt2.Rows[0]["CapBac"].ToString();
                string tdt14 = dt2.Rows[0]["DiaChiCuThe"].ToString();
                string maa = dt2.Rows[0]["MaTD"].ToString();
                Label22.Text = maa;
                TextBox6.Text = tdt;
                Select1.Value = tdt12;
                Select2.Value = tdt2;
                Select4.Value = tdt13;
                TextBox7.Text = tdt1;
                Select5.Value = tdt3;
                TextBox8.Text = tdt14;
                DateTime ngayTD = DateTime.Parse(tdt4);
                string ngayThangNam = ngayTD.ToString("MM/dd/yyyy");
                TextBox10.Text = ngayThangNam;
                DateTime ngayHH = DateTime.Parse(tdt5);
                string nga = ngayHH.ToString("MM/dd/yyyy");
                TextBox11.Text = nga;
                Select6.Value = tdt6;
                Textarea4.Value = tdt8;
                Textarea5.Value = tdt7;
                Textarea6.Value = tdt11;
                Textarea7.Value = tdt9;
                TextBox12.Text = tdt10;
            }
            tabB();

        }
        protected void huychinh_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            panel2.Visible = false;
            panel3.Visible = false;
            tabB();
        }
        protected void capnhathos_Click(object sender, EventArgs e)
        {
            string donga,hinhabc="", lod = "1";
            if (fileUpload1.HasFile)
            {
                try
                {
                    hinhabc = System.IO.Path.GetFileName(fileUpload1.FileName);
                    string filePath = Server.MapPath("~/assets/images/") + hinhabc;
                    fileUpload1.SaveAs(filePath);
                }
                catch (Exception ex)
                {
                    showThongBao("error: " + ex.Message.ToString(), Color.Red);
                }
            }
            else
            {
                showThongBao("you have not specified a file.", Color.Red);
            }
            if (TextBox6.Text == "")
            {
                Label14.Visible = true;
            }
            if (TextBox6.Text != "")
            {
                Label14.Visible = false;
            }
            if (Select1.Value == "0")
            {
                Label15.Visible = true;
            }
            if (Select1.Value != "0")
            {
                Label15.Visible = false;
            }
            if (Select2.Value == "0")
            {
                Label16.Visible = true;
            }
            if (Select2.Value != "0")
            {
                Label16.Visible = false;
            }
            if (Select4.Value == "0")
            {
                Label17.Visible = true;
            }
            if (Select4.Value != "0")
            {
                Label17.Visible = false;
            }
            if (Select5.Value == "0")
            {
                Label18.Visible = true;
            }
            if (Select5.Value != "0")
            {
                Label18.Visible = false;
            }
            if (TextBox10.Text == "")
            {
                Label19.Visible = true;
            }
            if (TextBox10.Text != "")
            {
                Label19.Visible = false;
            }
            if (TextBox11.Text == "")
            {
                Label20.Visible = true;
            }
            if (TextBox11.Text != "")
            {
                Label20.Visible = false;
            }
            if (TextBox12.Text == "")
            {
                Label21.Visible = true;
            }
            if (TextBox12.Text != "")
            {
                Label21.Visible = false;
            }
            if (Select1.Value == "Pha chế") lod = "1";
            if (Select1.Value == "Phục vụ") lod = "2";
            if (Select1.Value == "An ninh") lod = "3";
            if (Select1.Value == "Bảo vệ") lod = "4";
            if (Select1.Value == "Bán hàng") lod = "5";
            if (Select1.Value == "Báo chí") lod = "6";
            if (Select1.Value == "Bảo hiểm") lod = "7";
            if (Select1.Value == "Bảo trì") lod = "8";
            if (Select1.Value == "Bất động sản") lod = "9";
            if (Select1.Value == "Biên phiên dịch") lod = "10";
            if (Select1.Value == "Công nghệ thông tin") lod = "11";
            if (Select1.Value == "Dầu khí") lod = "12";
            if (Select1.Value == "Dệt may") lod = "13";
            if (Select1.Value == "Dịch vụ khách hàng") lod = "14";
            if (Select1.Value == "Điện lạnh") lod = "15";
            if (Select1.Value == "Du lịch") lod = "16";
            if (Select1.Value == "Dược") lod = "17";
            if (Select1.Value == "Điện") lod = "18";
            if (Select1.Value == "Đồ gỗ") lod = "19";
            if (Select1.Value == "Giáo dục") lod = "20";
            if (Select1.Value == "Kế toán") lod = "21";
            if (Select1.Value == "Khách sạn") lod = "22";
            if (Select1.Value == "Kiến trúc") lod = "23";
            if (Select1.Value == "Kỹ Thuật") lod = "24";
            if (Select1.Value == "Lao động") lod = "25";
            if (Select1.Value == "Nhân sự") lod = "26";
            if (Select1.Value == "Thư ký") lod = "27";
            if (Select1.Value == "Tiếp thị") lod = "28";
            if (Select1.Value == "Tư vấn") lod = "29";
            if (Select1.Value == "Viễn thông") lod = "30";
            if (Select1.Value == "Xây dựng") lod = "31";
            if (Select1.Value == "Khác") lod = "32";
            if (TextBox6.Text != "" && Select1.Value != "0" && Select2.Value != "0" && Select4.Value != "0" && Select5.Value != "0" && TextBox10.Text != "" && TextBox11.Text != "" && TextBox12.Text != "")
            {
                string q = "update TuyenDung set TenTD = N'" + TextBox6.Text + "'";
                if (hinhabc != "")
                {
                    q += ",Logo = N'" + hinhabc + "'";
                }
                if (TextBox7.Text == "")
                {

                }
                donga = "Thương lượng";
                if (TextBox7.Text == "Thương lượng")
                {
                    donga = "Thương lượng";
                }
                else if (TextBox7.Text != "")
                {
                    string textBoxValue = TextBox7.Text;
                    string numericValue = Regex.Replace(textBoxValue, "[^0-9]", "");
                    donga = numericValue + "tr/tháng";
                }
                q += ",DonGia = N'" + donga + "',NamKinhNghiem = N'" + Select2.Value + "',DiaChi = N'" + Select5.Value + "',NgayTD = '" + TextBox10.Text + "',NgayHetHan = '" + TextBox11.Text + "',GioiTinh = '" + Select6.Value + "',KyNangYeuCau = N'" + Textarea5.Value + "',ChiTietCongViec = N'" + Textarea4.Value + "',ThongTinLienHe = N'" + Textarea7.Value + "',ThongTinCongTy = N'" + TextBox12.Text + "',QuyenLoi = N'" + Textarea6.Value + "',CapBac = N'" + Select4.Value + "',MaLTD = N'" + lod + "',DiaChiCuThe = N'" + TextBox8.Text + "' where MaTD = '" + Label22.Text + "'";
                if (data.updateData(q) > 0)
                {
                    BindDataList();
                    showThongBao("Cập nhật thành công!", Color.Green);
                }
                else
                    showThongBao("Cập nhật thất bại!", Color.Red);

                tabB();
            }
        }
        private int CurrentPageD
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                    return 0;
                else
                    return Convert.ToInt32(ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        void donDataList()
        {
            PagedDataSource objPage = null;
            DataTable dt = null;
            try
            {
                // Kích thước trang
                int pageSize = 6;

                // Truy vấn dữ liệu từ cơ sở dữ liệu
                string sqlQ = "SELECT * FROM DonTuyenDung,TaiKhoan WHERE TaiKhoan.username = DonTuyenDung.username and NguoiNhan = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                dt = data.getData(sqlQ);

                // Thiết lập đối tượng PagedDataSource
                objPage = new PagedDataSource();
                objPage.DataSource = dt.DefaultView;
                objPage.AllowPaging = true;
                objPage.PageSize = pageSize;
                objPage.CurrentPageIndex = CurrentPageD;
                btnSau.Enabled = !objPage.IsLastPage;
                btnTruoc.Enabled = !objPage.IsFirstPage;

                // Thiết lập nguồn dữ liệu cho DataList và hiển thị dữ liệu phân trang
                DataList2.DataSource = objPage;
                DataList2.DataBind();

                // Kiểm tra và chọn trang hiện tại
                if (CurrentPageD >= 1 && CurrentPageD <= objPage.PageCount)
                {
                    ((LinkButton)DataList2.FindControl("lnkPage" + CurrentPageD)).CssClass = "page-link active";
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                if (dt != null)
                {
                    dt.Dispose();
                }
            }
        }
        void tabC()
        {
            string script = @"<script>
                        var tabContent = document.querySelector('.tab-pane.active');
                        tabContent.classList.remove('active');
                        var commteDiv = document.getElementById('commte');
                        commteDiv.classList.add('active');
                        </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "SetActiveTab1", script);

            string script2 = @"<script>
                        window.onload = function() {
                        var tabs = document.querySelectorAll('.nav-link');
                        tabs.forEach(function(tab) {
                        tab.classList.remove('active');
                        });
                        var tabC = document.getElementById('tab-c');
                        tabC.classList.add('active');
                        };
                        </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "SetActiveTab2", script2);
        }
        protected void DbtnSau_Click(object sender, EventArgs e)
        {
            CurrentPageD += 1;
            donDataList();
            tabC();
        }

        protected void DbtnTruoc_Click(object sender, EventArgs e)
        {
            CurrentPageD -= 1;
            donDataList();
            tabC();
        }

        protected void DlnkPage_Click(object sender, EventArgs e)
        {
            CurrentPageD = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            donDataList();
            tabC();
        }
        protected void DataListFiles_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                string fileName = e.CommandArgument.ToString();
                string filePath = "~/assets/fileCV/" + fileName;

                // Tải file về máy
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
            }
        }
        protected void ttut_Click(object sender, EventArgs e)
        {
            panel4.Visible = true;
            panel5.Visible = false;
            Button9.BackColor = Color.FromArgb(0, 102, 255);
            Button10.BackColor = Color.FromArgb(153, 153, 153);
            Button9.Enabled = false;
            Button10.Enabled = true;
            tabC();

        }
        protected void lsut_Click(object sender, EventArgs e)
        {
            panel4.Visible = false;
            panel5.Visible = true;
            Button10.BackColor = Color.FromArgb(0, 102, 255);
            Button9.BackColor = Color.FromArgb(153, 153, 153);
            Button10.Enabled = false;
            Button9.Enabled = true;
            tabC();

        }
        private int CurrentPageT
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                    return 0;
                else
                    return Convert.ToInt32(ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        void tuyenDataList()
        {
            PagedDataSource objPage = null;
            DataTable dt = null;
            try
            {
                // Kích thước trang
                int pageSize = 6;

                // Truy vấn dữ liệu từ cơ sở dữ liệu
                string sqlQ = "SELECT * FROM DonTuyenDung,TuyenDung,LoaiTuyenDung WHERE TuyenDung.MaTD = DonTuyenDung.MaTD and TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and DonTuyenDung.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                dt = data.getData(sqlQ);

                // Thiết lập đối tượng PagedDataSource
                objPage = new PagedDataSource();
                objPage.DataSource = dt.DefaultView;
                objPage.AllowPaging = true;
                objPage.PageSize = pageSize;
                objPage.CurrentPageIndex = CurrentPageT;
                btnSau.Enabled = !objPage.IsLastPage;
                btnTruoc.Enabled = !objPage.IsFirstPage;

                // Thiết lập nguồn dữ liệu cho DataList và hiển thị dữ liệu phân trang
                DataList3.DataSource = objPage;
                DataList3.DataBind();

                // Kiểm tra và chọn trang hiện tại
                if (CurrentPageT >= 1 && CurrentPageT <= objPage.PageCount)
                {
                    ((LinkButton)DataList3.FindControl("lnkPage" + CurrentPageT)).CssClass = "page-link active";
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                if (dt != null)
                {
                    dt.Dispose();
                }
            }
        }
        protected void TbtnSau_Click(object sender, EventArgs e)
        {
            CurrentPageT += 1;
            tuyenDataList();
            tabC();
        }

        protected void TbtnTruoc_Click(object sender, EventArgs e)
        {
            CurrentPageT -= 1;
            tuyenDataList();
            tabC();
        }

        protected void TlnkPage_Click(object sender, EventArgs e)
        {
            CurrentPageT = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            tuyenDataList();
            tabC();
        }
        protected void luuavatar_click(object sender, EventArgs e)
        {
            string hinhanh2 = "";
            //txtWorkspaceName.Text = fileImage2.ToString();
            if (FileUpload3.HasFile)
            {
                try
                {
                    hinhanh2 = System.IO.Path.GetFileName(FileUpload3.FileName);
                    string filePath = Server.MapPath("~/assets/images/") + hinhanh2;
                    FileUpload3.SaveAs(filePath);

                    string sql = "update TaiKhoan set avatar = N'" + hinhanh2 + "' where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                    if (data.updateData(sql) > 0) {
                        mkThongBao("Cập nhật thành công!", Color.Green);
                        showtaikhoan();
                            }
                    else
                        mkThongBao("Cập nhật thất bại!", Color.Red);
                }
                catch (Exception ex)
                {
                    mkThongBao("error: " + ex.Message.ToString(), Color.Red);
                }
            }
            else
            {
                mkThongBao("you have not specified a file.", Color.Red);
            }
        }
        protected void GoiVip1_click(object sender, EventArgs e)
        {
            string goivip = "1";
            Context.Items["vip"] = goivip;
            Server.Transfer("BusinessPremium.aspx");
        }
        protected void GoiVip6_click(object sender, EventArgs e)
        {
            string goivip = "6";
            Context.Items["vip"] = goivip;
            Server.Transfer("BusinessPremium.aspx");
        }
        void cachbaohethanVIP()
        {
            string script = @"
        <script>
        Swal.fire({
            title: 'Warning!',
            text: 'Bạn đã hết hạn sử dụng BusinessPremium.',
            icon: 'warning'
        });
        </script>
    ";
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
        }
        void cachchuadangkyVIP()
        {
            string script = @"
        <script>
        Swal.fire({
            title: 'Warning!',
            text: 'Bạn chưa đăng ký sử dụng BusinessPremium.',
            icon: 'warning'
        });
        </script>
    ";
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
        }
        void iconVip()
        {
            if ((int)data.getSingleValue("SELECT COUNT(*) FROM BusinessPremium WHERE username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'") > 0)
            {
                string qh2 = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                DataTable dth2 = data.getData(qh2);
                DateTime ngayHienTai = DateTime.Now;

                if (dth2.Rows.Count > 0)
                {
                    string han = dth2.Rows[0]["Ngayhethan"].ToString();
                    DateTime ngayHetHan = DateTime.Parse(han);
                    TimeSpan thoiGianConLai = ngayHetHan - ngayHienTai;

                    if (thoiGianConLai.TotalDays <= 0)
                    {
                        // Thông báo ngày đã hết hạn
                        iconvip.Visible = false;
                    }
                    else
                    {
                        iconvip.Visible = true;
                    }
                }
            }
            else
            {
                iconvip.Visible = false;
            }
        }
    }
}