using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class CaLamViec1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        int kt;
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
                string sql = "SELECT TenCLV,MIN(MaCLV) AS MaCLV, MIN(ThoiGianBatDau) AS ThoiGianBatDau, MAX(ThoiGianKetThuc) AS ThoiGianKetThuc, MIN(SoCongTinh) AS SoCongTinh, MIN(DieuKienXinNghi) AS DieuKienXinNghi, MIN(Loai) AS Loai, MIN(TrangThaiHoatDong) AS TrangThaiHoatDong FROM CaLamViec WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'GROUP BY TenCLV";
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
        protected void myCheck_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox myCheck = (CheckBox)sender;
            DataListItem dataItem = (DataListItem)myCheck.NamingContainer;
            Label lblTenCLV = (Label)dataItem.FindControl("lblTenCLV"); 

            string CLV = lblTenCLV.Text;
            int kt = myCheck.Checked ? 1 : 0;
            string q = "update CaLamViec set TrangThaiHoatDong = '"+kt+ "' where TenCLV = N'" + CLV + "' and MaW = '"+ Request.Cookies["workspacxe"]["Maw"] + "'";
            if (data.updateData(q) > 0)
                TextBox1.Text = "oke";
            else
                TextBox1.Text = "no oke";
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CheckBox myCheck = (CheckBox)e.Item.FindControl("myCheck");
                DataRowView drv = (DataRowView)e.Item.DataItem;

                int trangThaiHoatDong = Convert.ToInt32(drv["TrangThaiHoatDong"]);

                if (myCheck != null)
                {
                    myCheck.Checked = (trangThaiHoatDong == 1);
                }
            }
        }
    }
}