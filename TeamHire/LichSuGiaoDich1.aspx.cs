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
    public partial class LichSuGiaoDich1 : System.Web.UI.Page
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
                    }
                    else
                    {
                        // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                        Image1.ImageUrl = ResolveUrl("~/assets/images/bot_icon.jpg");
                    }
                    string ten = dt.Rows[0]["tennguoidung"].ToString();
                    string mail = dt.Rows[0]["email"].ToString();
                    string sdt = dt.Rows[0]["sodienthoai"].ToString();
                    //TextBox1.Text = ten;
                    //TextBox2.Text = mail;
                    //TextBox3.Text = sdt;
                    Label1.Text = ten;
                }
                //ngày hết hạn và số ngày còn lại
                string sql1 = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                DataTable wo1 = data.getData(sql1);
                if (wo1.Rows.Count > 0)
                {
                    DateTime ngayHetHan = Convert.ToDateTime(wo1.Rows[0]["Ngayhethan"]);
                    string ngayHetHanFormatted = ngayHetHan.ToString("dd/MM/yyyy");
                    Label24.Text = ngayHetHanFormatted;
                    DateTime ngayHienTai = DateTime.Now;
                    TimeSpan thoiGianConLai = ngayHetHan - ngayHienTai;
                    int soNgayConLai = Math.Max(0, (int)thoiGianConLai.TotalDays);
                    Label18.Text = soNgayConLai.ToString();
                }

                //số lần thanh toán thành công
                string sql2 = "SELECT COUNT(MaGD) FROM BusinessPremium, LichSuGiaoDich WHERE BusinessPremium.MaVIP = LichSuGiaoDich.MaVIP AND BusinessPremium.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                int countMaGD = 0;
                DataTable wo2 = data.getData(sql2);
                if (wo2.Rows.Count > 0)
                {
                    countMaGD = Convert.ToInt32(wo2.Rows[0][0]);
                    Label21.Text = countMaGD.ToString();
                }
            }
            BindDataList();
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
                string sql = "SELECT * FROM BusinessPremium,LichSuGiaoDich WHERE BusinessPremium.MaVIP = LichSuGiaoDich.MaVIP and BusinessPremium.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
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
        protected void btnSau_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataList();
        }

        protected void btnTruoc_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataList();
        }

        protected void lnkPage_Click(object sender, EventArgs e)
        {
            CurrentPage = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            BindDataList();
        }
    }
}