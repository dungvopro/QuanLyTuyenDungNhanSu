using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TeamHire
{
    public partial class ADTaiKhoan1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
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
                string sql = "SELECT COALESCE(TaiKhoan.diachi, '...') as diachi,COALESCE(TaiKhoan.sodienthoai, 'Không có') as sodienthoai,COALESCE(TaiKhoan.gioitinh, 'chưa xác đinh') as gioitinh, TaiKhoan.username, TaiKhoan.avatar, TaiKhoan.tennguoidung, TaiKhoan.email," +
                    " CASE WHEN BusinessPremium.MaVIP IS NULL THEN 'Không' ELSE 'Khách hàng VIP' END AS LoaiDanhNghiep" +
                    //"SUM(CASE WHEN TD.MaTD IS NOT NULL THEN 1 ELSE 0 END) AS SoBaiDangTuyen" +
                    " FROM TaiKhoan LEFT JOIN BusinessPremium ON TaiKhoan.username = BusinessPremium.username LEFT JOIN TuyenDung ON TaiKhoan.username = TuyenDung.username where TaiKhoan.username <> N'admin'" +
                    " GROUP BY TaiKhoan.diachi,TaiKhoan.sodienthoai,TaiKhoan.avatar,TaiKhoan.gioitinh, TaiKhoan.tennguoidung,TaiKhoan.username, TaiKhoan.email, BusinessPremium.MaVIP " +
                    "";
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