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
    public partial class AdminWeb : System.Web.UI.MasterPage
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
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
                        Image1.ImageUrl = ResolveUrl(imagePath);
                        Image2.ImageUrl = ResolveUrl(imagePath);
                    }
                    else
                    {
                        // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                        Image1.ImageUrl = ResolveUrl("~/assets/images/bot_icon.jpg");
                        Image2.ImageUrl = ResolveUrl("~/assets/images/bot_icon.jpg");
                    }
                    // Lấy giá trị của trường "tennguoidung" từ bản ghi đầu tiên
                    string tnv = dt.Rows[0]["tennguoidung"].ToString();
                    string user = dt.Rows[0]["username"].ToString();
                    string mail = dt.Rows[0]["email"].ToString();
                    string pass = dt.Rows[0]["password"].ToString();
                    Label1.Text = tnv;
                    Label2.Text = tnv;
                    Label3.Text = mail;
                }
                }
            else
            {
                Response.Redirect("QuanTri.aspx");
            }
        }
    }
}