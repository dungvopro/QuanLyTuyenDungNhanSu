using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class TrangChu : System.Web.UI.MasterPage
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
            {
                //bindingData(DataList2, "select * from TaiKhoan where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'");
                string q = "select tennguoidung from TaiKhoan where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                DataTable dt = data.getData(q);
                if (dt.Rows.Count > 0)
                {
                    // Lấy giá trị của trường "tennguoidung" từ bản ghi đầu tiên
                    string tenNguoiDung = dt.Rows[0]["tennguoidung"].ToString();

                    // Đưa giá trị lấy được vào cho thuộc tính "Text" của đối tượng "Label"
                    Label32.Text = tenNguoiDung;
                }
                thoat.Visible = true;
            }
            else
            {
                thoat.Visible = false;
            }
        }
        bool isAuthenticated = false;

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string tenDN = username.Text.ToString().Trim();
            string matKhau = password.Text.ToString().Trim();
            if ((int)data.getSingleValue("SELECT COUNT(*) FROM TaiKhoan WHERE username='" + tenDN + "' AND password='" + matKhau + "'") == 1)
            {
                isAuthenticated = true; // Đã đăng nhập thành công
                HttpCookie myCcookie = new HttpCookie("Login");
                myCcookie["tenDN"] = tenDN;
                myCcookie.Expires = DateTime.Now.AddDays(1d);
                Response.Cookies.Add(myCcookie);

                if ((int)data.getSingleValue("SELECT phanQuyen FROM TAIKHOAN WHERE username='" + tenDN + "' AND password='" + matKhau + "'") == 99)
                {
                    Response.Redirect("ThongKeAdmin1.aspx");
                }
                else
                {
                    Response.Redirect("TuyenDung1.aspx");
                }
            }
            else
            {
                thongbao.Visible = true;
                thongbao.Text = "Sai tên đăng nhập hoặc mật khẩu!";
                thongbao.ForeColor = System.Drawing.Color.Red;
                isAuthenticated = false; // Đăng nhập thất bại
            }
        }
        protected void btn_thoat(object sender, EventArgs e)
        {
            HttpCookie myCcookie = Request.Cookies["Login"];
            if (myCcookie != null)
            {
                myCcookie.Expires = DateTime.Now.AddDays(-1d); // end time cookies -> clear cookies
                Response.Cookies.Add(myCcookie);
                Response.Redirect("TrangChu1.aspx");
            }
            Response.Redirect("TrangChu1.aspx");
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (isAuthenticated)
            {
                Response.Redirect("TrangChu1.aspx");
            }
        }
    }
}