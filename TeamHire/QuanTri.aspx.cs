using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class QuanTri : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
            {
                bindingData(DataList1, "SELECT * FROM Workspace,TaiKhoan where TaiKhoan.username = Workspace.username and TaiKhoan.username = '" + Request.Cookies["Login"]["tenDN"].ToString() + "'");
                //bindingData(DataList1, "SELECT * FROM Workspace");
            }
        }
        private void bindingData(DataList dataList, string sql)
        {
            dataList.DataSource = null;
            dataList.DataSource = data.getData(sql);
            dataList.DataBind();
        }
        protected void ImageButton1_Click(object sender, EventArgs e)
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
                    // Số ngày còn lại
                    int soNgayConLai = (int)thoiGianConLai.TotalDays;
                    // Tiếp tục xử lý hoặc hiển thị thông tin về số ngày còn lại


                    string maw = ((Button)sender).CommandArgument;
                    string tenw = "Lỗi";
                    string q = "select Workspace.TenW from Workspace where Workspace.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "' and Workspace.MaW = '" + maw + "'";
                    DataTable dt = data.getData(q);
                    if (dt.Rows.Count > 0)
                    {
                        string tenNguoiDung = dt.Rows[0]["TenW"].ToString();

                        tenw = tenNguoiDung;
                    }
                    HttpCookie hi = new HttpCookie("workspacxe");
                    hi["Tenw"] = tenw;
                    hi["Maw"] = maw;
                    hi.Expires = DateTime.Now.AddDays(1d);
                    Response.Cookies.Add(hi);
                    Response.Redirect("QuanLy1.aspx?MaW=" + maw);
                }
            }
        }
        private string GenerateRandomKey(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder sb = new StringBuilder();
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                int randomIndex = random.Next(0, chars.Length);
                sb.Append(chars[randomIndex]);
            }

            return sb.ToString();
        }
        protected void taomoi_click(object sender, EventArgs e)
        {
            string hinhanh="";
            if(txtWorkspaceName.Text == "")
            {
                showThongBao("Vui lòng nhập tên workspace!", Color.Red);
                return;
            }
            //txtWorkspaceName.Text = fileImage2.ToString();
            if (fileImage2.HasFile)
            {
                try
                {
                    hinhanh = System.IO.Path.GetFileName(fileImage2.FileName);
                    string filePath = Server.MapPath("~/assets/images/") + hinhanh;
                    fileImage2.SaveAs(filePath);

                    // Cập nhật đường dẫn hình ảnh cho Image1
                    //Image1.ImageUrl = "~/images/" + hinhanh;
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
            if (Request.Cookies["Login"] != null)
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

                            string keyw = GenerateRandomKey(6);
                            string keyworkspace = "@" + keyw;
                            string sql = "insert into Workspace values (N'" + txtWorkspaceName.Text + "',N'" + hinhanh + "','',N'" + Request.Cookies["Login"]["tenDN"].ToString() + "','" + keyworkspace + "')";
                            if (data.updateData(sql) > 0)
                            {
                                showThongBao("thành công!", Color.Green);

                                string maw="";
                                //string tenw = "Lỗi";
                                string q = "select Workspace.MaW from Workspace where Workspace.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "' and Workspace.TenW = N'" + txtWorkspaceName.Text + "' and KeyWDN = '"+ keyworkspace + "'";
                                DataTable dt = data.getData(q);
                                if (dt.Rows.Count > 0)
                                {
                                    //string tenNguoiDung = dt.Rows[0]["TenW"].ToString();
                                    string ma = dt.Rows[0]["MaW"].ToString();
                                    //tenw = tenNguoiDung;
                                    maw = ma;
                                }
                                HttpCookie hi = new HttpCookie("workspacxe");
                                hi["Tenw"] = txtWorkspaceName.Text;
                                hi["Maw"] = maw;
                                hi.Expires = DateTime.Now.AddDays(1d);
                                Response.Cookies.Add(hi);
                                Response.Redirect("QuanLy1.aspx?MaW=" + maw);
                            }
                            else
                                showThongBao("noo!", Color.Red);

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
            else
            {
                string script = @"
        <script>
        Swal.fire({
            title: 'Bạn chưa đăng nhập!',
            text: 'Vui lòng đăng nhập vào hệ thống.',
            icon: 'warning'
        });
        </script>
    ";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }
        private void showThongBao(string strTB, Color color)
        {
            lbThongBao.Visible = true;
            lbThongBao.Text = strTB;
            lbThongBao.ForeColor = color;
        }
        protected void UploadImage(object sender, EventArgs e)
        {
            //string name = txtName.Value;
            //string description = txtDescription.Value;
            //HttpPostedFile imageFile = fileImage.PostedFile;

            //// Lưu trữ tệp tin hình ảnh vào thư mục trên máy chủ
            //string uploadDirectory = Server.MapPath("~/Uploads/"); // Đường dẫn tới thư mục lưu trữ
            //string fileName = Path.GetFileName(imageFile.FileName); // Tên tệp tin gốc
            //string filePath = Path.Combine(uploadDirectory, fileName); // Đường dẫn tới tệp tin lưu trữ
            //imageFile.SaveAs(filePath);

            //// Lưu thông tin hình ảnh vào CSDL
            //// Thực hiện các thao tác lưu thông tin vào CSDL ở đây

            //// Hiển thị thông báo thành công
            //Response.Write("Hình ảnh đã được tải lên thành công!");
        }
        protected void btnShowAlert_Click(object sender, EventArgs e)
        {
            string script = @"
        <script>
        Swal.fire({
            title: 'Hello!',
            text: 'This is a SweetAlert2 alert.',
            icon: 'success'
        });
        </script>
    ";
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
        }
        protected void btnShowAler_Click(object sender, EventArgs e)
        {
            string script = @"
        <script>
        Swal.fire({
            title: 'Warning!',
            text: 'This is a warning alert.',
            icon: 'warning'
        });
        </script>
    ";
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
        }
        protected void btnShowAle_Click(object sender, EventArgs e)
        {
            string script = @"
        <script>
        Swal.fire({
            title: 'Error!',
            text: 'An error occurred.',
            icon: 'error'
        });
        </script>
    ";
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
        }
    }
}