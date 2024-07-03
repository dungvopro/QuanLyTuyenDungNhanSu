using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class ChiTietNhanVien1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        string ctnv;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
            {
                ctnv = Request.QueryString["MaNV"];
                if (ctnv == null)
                {
                    Response.Redirect("QLNhanSu.aspx");
                }
                else
                {
                    string q = "select * from NhanVien where MaNV = N'" + ctnv + "'";
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
                        Manv.Text = ctnv;
                        passw.Text = pass;
                        tennganhan.Text = tnh;
                        ChiNhan.Text = cn;
                        stk.Text = stknh;
                        Ghich.Text = gc;
                        sdtt.Text = sd;
                        email.Text = mail;
                        diach.Text = diachyu;
                        cccd.Text = ddd;
                        noica.Text = capnoi;
                        ngayca.Text = capngay;
                        hocva.Text = vanhoc;
                        truongho.Text = hoctruong;
                        chuyennha.Text = nganhchuyen;
                        gioitin.Text = tinhgioi;
                        honnhan.Text = nhanhon;
                        ngaysi.Text = sinhngay;
                        myTextarea.Value = tamo;
                        Label6.Text = quyen;
                        if(chv == "1")
                        {
                            Label3.Text = "CEO/ Founder/ Chủ tịch";
                        }
                        else if (chv == "2")
                        {
                            Label3.Text = "Giám đốc";
                        }
                        else if (chv == "3")
                        {
                            Label3.Text = "Quản lý";
                        }
                        else if (chv == "4")
                        {
                            Label3.Text = "Nhân viên";
                        }
                        else if (chv == "5")
                        {
                            Label3.Text = "Vị trí khác";
                        }
                        Label4.Text = ttns;
                        Label5.Text = lhns;
                        Label2.Text = ngaytd;
                    }
                    //string username = Request.Cookies["Login"]["tenDN"].ToString();
                    //string query = "SELECT avatar FROM TaiKhoan WHERE username = N'" + username + "'";
                    //DataTable dtt = data.getData(query);

                    //if (dtt.Rows.Count > 0)
                    //{
                    //    string imageFileName = dtt.Rows[0]["avatar"].ToString();
                    //    string imagePath = "~/assets/images/" + imageFileName;

                    //    // Kiểm tra xem tập tin hình ảnh có tồn tại không
                    //    if (File.Exists(Server.MapPath(imagePath)))
                    //    {
                    //        // Gán đường dẫn hình ảnh vào cho ImageUrl
                    //        Image1.ImageUrl = ResolveUrl(imagePath);
                    //    }
                    //    else
                    //    {
                    //        // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                    //        Image1.ImageUrl = ResolveUrl("~/assets/images/bot_icon.jpg");
                    //    }
                    //}
                    //else
                    //{
                    //    // Nếu không tìm thấy bản ghi trong CSDL, có thể hiển thị hình ảnh mặc định hoặc thông báo lỗi
                    //    Image1.ImageUrl = "../assets/images/bot_icon.jpg"; // Đường dẫn đến hình ảnh mặc định
                    //}
                }
            }
        }
        protected void quaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLNhanSu.aspx");

        }
        protected void chinhsua_Click(object sender, EventArgs e)
        {
            string huhu = Manv.Text;
            Response.Redirect("ChinhSuaNhanVien1.aspx?MaNV=" + huhu);

        }
    }
}