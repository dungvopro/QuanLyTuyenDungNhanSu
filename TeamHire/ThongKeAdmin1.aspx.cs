using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class ThongKeAdmin1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string q = "select count(*) from TaiKhoan";
            DataTable dt = data.getData(q);
            if (dt.Rows.Count > 0)
            {
                int totalCount = Convert.ToInt32(dt.Rows[0][0]);
                Label1.Text = totalCount.ToString();
            }

            if ((int)data.getSingleValue("SELECT COUNT(*) FROM BusinessPremium") > 0)
            {
                string qh2 = "SELECT * FROM BusinessPremium";
                DataTable dth2 = data.getData(qh2);
                DateTime ngayHienTai = DateTime.Now;

                if (dth2.Rows.Count > 0)
                {
                    string han = dth2.Rows[0]["Ngayhethan"].ToString();
                    DateTime ngayHetHan = DateTime.Parse(han);
                    TimeSpan thoiGianConLai = ngayHetHan - ngayHienTai;

                    if (thoiGianConLai.TotalDays <= 0)
                    {
                        // Hết hạn sử dụng
                    }
                    else
                    {
                        int soNguoiDangKy = dth2.Rows.Count;
                        Label2.Text = soNguoiDangKy.ToString();
                    }
                }
            }
            string q3 = "select count(*) from TuyenDung";
            DataTable dt3 = data.getData(q3);
            if (dt3.Rows.Count > 0)
            {
                int tuyendg = Convert.ToInt32(dt3.Rows[0][0]);
                Label3.Text = tuyendg.ToString();
            }
            string q4 = "SELECT sum(CAST(REPLACE(REPLACE(SoTien, '.', ''), ' vnd', '') AS INT)) FROM LichSuGiaoDich";
            DataTable dt4 = data.getData(q4);
            if (dt4.Rows.Count > 0)
            {
                int tongTien = Convert.ToInt32(dt4.Rows[0][0]);
                string formattedTongTien = string.Format("{0:#,##0}", tongTien);
                Label4.Text = formattedTongTien + " vnd";
            }
            BindDataList();
            top();

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
                string sql = "SELECT * FROM LichSuGiaoDich";
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
        void top()
        {
            string sqlQuery = "SELECT TOP 10 TaiKhoan.tennguoidung,SUM(CAST(REPLACE(REPLACE(LichSuGiaoDich.SoTien, '.', ''), ' vnd', '') AS INT)) AS TongSoTien " +
                    "FROM LichSuGiaoDich " +
                    "INNER JOIN BusinessPremium ON BusinessPremium.MaVIP = LichSuGiaoDich.MaVIP " +
                    "INNER JOIN TaiKhoan ON TaiKhoan.username = BusinessPremium.username " +
                    "GROUP BY TaiKhoan.username,TaiKhoan.tennguoidung " +
                    "ORDER BY TongSoTien DESC" +
                    //"LIMIT 10" +
                    "";

            DataTable result = data.getData(sqlQuery);

            DataList2.DataSource = result;
            DataList2.DataBind();
        }
    }
}