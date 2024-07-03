using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class ADTuyenDung1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.Cookies["Login"] != null)
            {
                BindDataList();
            }
            else
            {
                Response.Redirect("QuanTri.aspx");
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
        void BindDataList()
        {
            PagedDataSource objPage = null;
            DataTable dt = null;
            try
            {
                // Kích thước trang
                int pageSize = 10;

                // Truy vấn dữ liệu từ cơ sở dữ liệu
                string sql = "SELECT TuyenDung.Logo, TuyenDung.TenTD, TuyenDung.NgayTD, LoaiTuyenDung.NganhNghe,TaiKhoan.tennguoidung as nguoidangtuyen, TuyenDung.MaTD FROM TuyenDung,LoaiTuyenDung,TaiKhoan WHERE TaiKhoan.username = TuyenDung.username and TuyenDung.MaLTD = LoaiTuyenDung.MaLTD ";
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