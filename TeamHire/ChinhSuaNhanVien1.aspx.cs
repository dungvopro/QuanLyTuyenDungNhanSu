using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class ChinhSuaNhanVien1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        string ny;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
            {
                ny = Request.QueryString["MaNV"];
                if (ny == null)
                {
                    Response.Redirect("QLNhanSu.aspx");
                }
                else
                {
                    string q = "select * from NhanVien where MaNV = N'" + ny + "'";
                    DataTable dt = data.getData(q);
                    if (dt.Rows.Count > 0)
                    {
                        string imageFileName = dt.Rows[0]["HinhAnh"].ToString();
                        string imagePath = "~/assets/images/" + imageFileName;
                        if (File.Exists(Server.MapPath(imagePath)))
                        {
                            // Gán đường dẫn hình ảnh vào cho ImageUrl
                            Image1.ImageUrl = ResolveUrl(imagePath);
                        }
                        else
                        {
                            // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                            Image1.ImageUrl = ResolveUrl("~/assets/images/bot_icon.jpg");
                        }
                        // Lấy giá trị của trường "tennguoidung" từ bản ghi đầu tiên
                        string tnv = dt.Rows[0]["TenNV"].ToString();
                        string user = dt.Rows[0]["Username"].ToString();
                        string pass = dt.Rows[0]["Password"].ToString();

                        string tnh = dt.Rows[0]["TenNganHang"].ToString();
                        string cn = dt.Rows[0]["ChiNhanh"].ToString();
                        string stknh = dt.Rows[0]["SoTaiKhoanNganHang"].ToString();
                        string gc = dt.Rows[0]["GhiChu"].ToString();

                        string sd = dt.Rows[0]["SDT"].ToString();
                        string mail = dt.Rows[0]["Email"].ToString();
                        string diachyu = dt.Rows[0]["DiaChi"].ToString();
                        string ddd = dt.Rows[0]["CMND"].ToString();
                        string capnoi = dt.Rows[0]["NoiCap"].ToString();
                        string capngay = dt.Rows[0]["NgayCap"].ToString();

                        string vanhoc = dt.Rows[0]["HocVan"].ToString();
                        string hoctruong = dt.Rows[0]["TruongHoc"].ToString();
                        string nganhchuyen = dt.Rows[0]["ChuyenNganh"].ToString();

                        string tinhgioi = dt.Rows[0]["GioiTinh"].ToString();
                        string nhanhon = dt.Rows[0]["TinhTrangHonNhan"].ToString();
                        string sinhngay = dt.Rows[0]["NgaySinh"].ToString();
                        string tamo = dt.Rows[0]["MoTa"].ToString();
                        string quyen = dt.Rows[0]["PhanQuyen"].ToString();
                        string chv = dt.Rows[0]["MaCV"].ToString();
                        string ttns = dt.Rows[0]["TrangThaiNhanSu"].ToString();
                        string lhns = dt.Rows[0]["LoaiHinhNhanSu"].ToString();
                        string ngaytd = dt.Rows[0]["NgayTuyenDung"].ToString();
                        // Đưa giá trị lấy được vào cho thuộc tính "Text" của đối tượng "Label"
                        tennv.Text = tnv;
                        User.Text = user;
                        man1v.Text = ny;
                        pas.Text = pass;
                        tennganhan.Text = tnh;
                        ChiNhan.Text = cn;
                        stk.Text = stknh;
                        Ghich.Text = gc;
                        sdtt.Text = sd;
                        email.Text = mail;
                        diach.Text = diachyu;
                        cccd.Text = ddd;
                        noica.Text = capnoi;
                        DateTime ngayc = DateTime.Parse(capngay);
                        ngayca.Text = ngayc.ToString("MM/dd/yyyy");
                        //ngayca.Text = capngay;
                        hocva.Text = vanhoc;
                        truongho.Text = hoctruong;
                        chuyennha.Text = nganhchuyen;
                        gioitin.Value = tinhgioi;
                        honnhan.Value = nhanhon;
                        DateTime ngaySinh = DateTime.Parse(sinhngay);
                        ngaysi.Text = ngaySinh.ToString("MM/dd/yyyy");
                        //ngaysi.Text = sinhngay;
                        myTextarea.Value = tamo;
                        //Label6.Text = quyen;
                        Label3.Value = chv;
                        Label4.Value = ttns;
                        Label5.Value = lhns;
                        //alll.Text = ngaytd;
                        DateTime ntd = DateTime.Parse(ngaytd);
                        alll.Text = ntd.ToString("MM/dd/yyyy");

                        // Kiểm tra giá trị của phanQuyen và tích vào các checkbox tương ứng
                        if (quyen.Contains("Quản lý nhân viên"))
                        {
                            permissionList.Items[0].Selected = true;
                        }

                        if (quyen.Contains("Quản lý lịch nhân viên"))
                        {
                            permissionList.Items[1].Selected = true;
                        }
                        if (quyen.Contains("Thống kê"))
                        {
                            permissionList.Items[2].Selected = true;
                        }
                    }
                }
            }
            
        }
        private void showThongBao(string strTB, Color color)
        {
            lbThongBao.Visible = true;
            lbThongBao.Text = strTB;
            lbThongBao.ForeColor = color;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            panel1.Visible = false;
            panel2.Visible = true;
            Button1.Visible = false;
        }
        protected void huymk_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            panel2.Visible = false;
            Button1.Visible = true;
        }
        protected void xacnhanmk_Click(object sender, EventArgs e)
        {
            
            string matKhau = passadmin.Text.ToString().Trim();
            ny = Request.QueryString["MaNV"];
            if (mkso1.Text == "")
            {
                showThongBao("không được bỏ trống mật khẩu mới!", Color.Red);
            }
            else if ((int)data.getSingleValue("SELECT COUNT(*) FROM TaiKhoan WHERE username='" + Request.Cookies["Login"]["tenDN"].ToString() + "' AND password='" + matKhau + "'") == 1)
            {
                if (mkso1.Text != mkso2.Text)
                {
                    showThongBao("Mật khẩu xác thực không trùng!", Color.Red);
                }
                else
                {
                    if (data.updateData("update NhanVien set Password = '" + mkso1.Text + "' where MaNV = '" + ny + "'") > 0)
                    {
                        panel1.Visible = true;
                        panel2.Visible = false;
                        Button1.Visible = true;
                        Response.Redirect(Request.RawUrl);
                        showThongBao("Đổi mật khẩu thành công!", Color.Green);

                        
                    }
                    else
                    {
                        showThongBao("Đổi mật khẩu thất bại!", Color.Red);
                    }
                }
            }
            else
            {
                showThongBao("Mật khẩu admin không chính xác!", Color.Red);
            }
        }
        protected void huycn_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLNhanSu.aspx");
        }
        protected void cn_Click(object sender, EventArgs e)
        {
            string permissionInputValue = Request.Form["permission-input"];
            bool permissionViewChecked = Request.Form["permission-view"] == "on";
            bool permissionUpdateChecked = Request.Form["permission-update"] == "on";
            bool permissionDeleteChecked = Request.Form["permission-delete"] == "on";
            string GioiTinh = gioitin.Value;
            string ChucVu = Label3.Value;
            string TTHN = honnhan.Value;
            string TTNS = Label4.Value;
            string LHNS = Label5.Value;
            string hinhanh = "", user;
            ny = Request.QueryString["MaNV"];
            if (ChucVu == "0")
            {
                ChucVu = "4";
            }
            if (GioiTinh == "0")
            {
                GioiTinh = "";
            }
            if (TTHN == "0")
            {
                TTHN = "";
            }
            if (TTNS == "0")
            {
                TTNS = "";
            }
            if (LHNS == "0")
            {
                LHNS = "";
            }
            //string PhanQuyen = permission.Value;
            HttpCookie myCookie = Request.Cookies["Login"];
            if (myCookie != null)
            {
                user = myCookie["tenDN"];
            }
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
            string phanQuyen = string.Empty;

            if (permissionList.Items[0].Selected)
            {
                phanQuyen += "Quản lý nhân viên, ";
            }

            if (permissionList.Items[1].Selected)
            {
                phanQuyen += "Quản lý lịch nhân viên, ";
            }

            if (permissionList.Items[2].Selected)
            {
                phanQuyen += "Thống kê, ";
            }

            // Xóa dấu phẩy và khoảng trắng cuối cùng
            phanQuyen = phanQuyen.TrimEnd(',', ' ');
            string sql = "update NhanVien set TenNV = N'" + tennv.Text + "',NgaySinh = '" + ngaysi.Text + "',GioiTinh = N'" + GioiTinh + "',MaCV = '" + ChucVu + "',MaW = '" + Request.Cookies["workspacxe"]["Maw"].ToString() + "',NgayTuyenDung = N'"+ alll.Text + "',DiaChi = N'" + diach.Text + "',SDT = '" + sdtt.Text + "',Email = N'" + email.Text + "',PhanQuyen = N'" + phanQuyen + "',CMND = '" + cccd.Text + "',NoiCap = N'" + noica.Text + "',NgayCap = '" + ngayca.Text + "',HocVan = N'" + hocva.Text + "',ChuyenNganh = N'" + chuyennha.Text + "',TinhTrangHonNhan = N'" + TTHN + "',SoTaiKhoanNganHang = N'" + stk.Text + "',TenNganHang = N'" + tennganhan.Text + "',ChiNhanh = N'" + ChiNhan.Text + "',TrangThaiNhanSu = N'" + TTNS + "',LoaiHinhNhanSu = N'" + LHNS + "',MoTa = N'" + myTextarea.Value + "',HinhAnh = N'" + hinhanh + "',GhiChu = N'" + Ghich.Text + "',TruongHoc = N'" + truongho.Text + "' where MaNV = '"+ ny + "'";
            string sql1 = "update  NhanVien set TenNV = N'" + tennv.Text + "',NgaySinh = '" + ngaysi.Text + "' where MaNV = '"+ ny + "'";
                if (data.updateData(sql) > 0)
                    showThongBao("thêm thành công!", Color.Green);
                else
                    showThongBao("thêm thất bại!", Color.Red);
        }

    }
}
