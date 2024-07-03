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
    public partial class QuanLy : System.Web.UI.MasterPage
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
            {
                //Label1.Text = Request.Cookies["workspacxe"]["Tenw"].ToString();
                string q = "select tennguoidung from TaiKhoan where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                DataTable dt = data.getData(q);
                if (dt.Rows.Count > 0)
                {
                    // Lấy giá trị của trường "tennguoidung" từ bản ghi đầu tiên
                    string tenNguoiDung = dt.Rows[0]["tennguoidung"].ToString();

                    // Đưa giá trị lấy được vào cho thuộc tính "Text" của đối tượng "Label"
                    Label2.Text = tenNguoiDung;
                }
                string username = Request.Cookies["Login"]["tenDN"].ToString();
                string query = "SELECT avatar FROM TaiKhoan WHERE username = N'" + username + "'";
                DataTable dtt = data.getData(query);

                if (dtt.Rows.Count > 0)
                {
                    string imageFileName = dtt.Rows[0]["avatar"].ToString();
                    string imagePath = "~/assets/images/" + imageFileName;

                    // Kiểm tra xem tập tin hình ảnh có tồn tại không
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
                }
                else
                {
                    // Nếu không tìm thấy bản ghi trong CSDL, có thể hiển thị hình ảnh mặc định hoặc thông báo lỗi
                    Image1.ImageUrl = "../assets/images/bot_icon.jpg"; // Đường dẫn đến hình ảnh mặc định
                }

                string W = "select * from Workspace where MaW = '"+ Request.Cookies["workspacxe"]["MaW"].ToString() + "'";
                DataTable ww = data.getData(W);
                if (ww.Rows.Count > 0)
                {
                    string tenww = ww.Rows[0]["TenW"].ToString();
                    string imageFileName = ww.Rows[0]["Logo"].ToString();
                    Label1.Text = tenww;
                    string imagePath = "~/assets/images/" + imageFileName;
                    if (File.Exists(Server.MapPath(imagePath)))
                    {
                        // Gán đường dẫn hình ảnh vào cho ImageUrl
                        Image2.ImageUrl = ResolveUrl(imagePath);
                    }
                    else
                    {
                        // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                        Image2.ImageUrl = ResolveUrl("~/assets/images/workspacelogo.jpg");
                    }
                }
                {
                    // Nếu không tìm thấy bản ghi trong CSDL, có thể hiển thị hình ảnh mặc định hoặc thông báo lỗi
                    Image2.ImageUrl = "../assets/images/workspacelogo.jpg"; // Đường dẫn đến hình ảnh mặc định
                }
            }
        }
    }

}
