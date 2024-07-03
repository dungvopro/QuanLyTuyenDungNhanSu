using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class TrangChu1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            BindDataList();
        }
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                    return 0;
                else
                    return Convert.ToInt16(ViewState["CurrentPage"]);
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
                int pageSize = 2;
                string sql = "SELECT * FROM TuyenDung,LoaiTuyenDung where TuyenDung.MaLTD = LoaiTuyenDung.MaLTD ";
                dt = data.getData(sql);

                // Thiết lập đối tượng PagedDataSource
                objPage = new PagedDataSource();
                objPage.DataSource = dt.DefaultView;
                objPage.AllowPaging = true;
                objPage.PageSize = pageSize;
                objPage.CurrentPageIndex = CurrentPage;

                // Gán dữ liệu cho DataList1
                DataList1.DataSource = objPage;
                DataList1.DataBind();

                // Thiết lập chỉ mục của objPage để hiển thị hai mục sau
                objPage.CurrentPageIndex = CurrentPage + 1;

                // Gán dữ liệu cho DataList2
                DataList2.DataSource = objPage;
                DataList2.DataBind();
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
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string mabds = ((ImageButton)sender).CommandArgument;
            Response.Redirect("ChiTietTuyenDung1.aspx?MaTD=" + mabds);
        }
    }
}