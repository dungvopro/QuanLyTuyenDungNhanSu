using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace TeamHire
{
    public partial class TuyenDung : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            //bindingData(DataList1, "SELECT * FROM TuyenDung,LoaiTuyenDung where TuyenDung.MaLTD = LoaiTuyenDung.MaLTD");
            BindDataList();
            string q = "SELECT NganhNghe FROM LoaiTuyenDung";
            DataTable dt = data.getData(q);
            foreach (DataRow row in dt.Rows)
            {
                string maLTD = row["NganhNghe"].ToString();
                cv.Items.Add(maLTD);
            }
            //string q1 = "SELECT CapBac FROM TuyenDung group by CapBac";
            //DataTable dt1 = data.getData(q1);
            //foreach (DataRow row in dt1.Rows)
            //{
            //    string maLTD = row["CapBac"].ToString();
            //    capbac.Items.Add(maLTD);
            //}
            //string q2 = "SELECT DonGia FROM TuyenDung group by DonGia";
            //DataTable dt2 = data.getData(q2);
            //foreach (DataRow row in dt2.Rows)
            //{
            //    string maLTD = row["DonGia"].ToString();
            //    mucluong.Items.Add(maLTD);
            //}
            //string q3 = "SELECT NamKinhNghiem FROM TuyenDung group by NamKinhNghiem";
            //DataTable dt3 = data.getData(q3);
            //foreach (DataRow row in dt3.Rows)
            //{
            //    string maLTD = row["NamKinhNghiem"].ToString();
            //    kinhn.Items.Add(maLTD);
            //}
            //string q4 = "SELECT DiaChi FROM TuyenDung group by DiaChi";
            //DataTable dt4 = data.getData(q4);
            //foreach (DataRow row in dt4.Rows)
            //{
            //    string maLTD = row["DiaChi"].ToString();
            //    khuvuc.Items.Add(maLTD);
            //}
        }
        private void bindingData(DataList dataList, string sql)
        {
            dataList.DataSource = null;
            dataList.DataSource = data.getData(sql);
            dataList.DataBind();
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
            string congviec = cv.Value;
            string khuvuc = kc.Value;
            string mucluon = mucluong.Value;
            string capBac = capbaac.Value;
            string kinhnghiem = kinhn.Value;
            string searchTerm = timkiem.Text.Trim();
            try
            {
                // Kích thước trang
                int pageSize = 6;

                // Truy vấn dữ liệu từ cơ sở dữ liệu
                string sql = "SELECT * FROM TuyenDung,LoaiTuyenDung where TuyenDung.MaLTD = LoaiTuyenDung.MaLTD ";
                if (capBac != "0")
                {
                    sql += "and TuyenDung.CapBac = N'" + capBac + "'";
                }
                if (kinhnghiem != "0")
                {
                    sql += "and TuyenDung.NamKinhNghiem = N'" + kinhnghiem + "'";
                }
                if (mucluon != "0")
                {
                    switch (mucluon)
                    {
                        case "1":
                            sql += "AND TuyenDung.DonGia = N'1tr/tháng'";
                            break;
                        case "2":
                            sql += "AND (TuyenDung.DonGia = N'1tr/tháng' or TuyenDung.DonGia = N'2tr/tháng' or TuyenDung.DonGia = N'3tr/tháng')";
                            break;
                        case "3":
                            sql += "AND (TuyenDung.DonGia = N'3tr/tháng' or TuyenDung.DonGia = N'4tr/tháng' or TuyenDung.DonGia = N'5tr/tháng')";
                            break;
                        case "4":
                            sql += "AND (TuyenDung.DonGia = N'5tr/tháng' or TuyenDung.DonGia = N'6tr/tháng' or TuyenDung.DonGia = N'7tr/tháng' or TuyenDung.DonGia = N'8tr/tháng' or TuyenDung.DonGia = N'9tr/tháng' or TuyenDung.DonGia = N'10tr/tháng')";
                            break;
                        case "5":
                            sql += "AND (TuyenDung.DonGia = N'10tr/tháng' or TuyenDung.DonGia = N'11tr/tháng' or TuyenDung.DonGia = N'12tr/tháng' or TuyenDung.DonGia = N'13tr/tháng' or TuyenDung.DonGia = N'14tr/tháng' or TuyenDung.DonGia = N'15tr/tháng')";
                            break;
                        case "6":
                            sql += "AND (TuyenDung.DonGia = N'15tr/tháng' or TuyenDung.DonGia = N'16tr/tháng' or TuyenDung.DonGia = N'25tr/tháng' or TuyenDung.DonGia = N'17tr/tháng' or TuyenDung.DonGia = N'19tr/tháng' or TuyenDung.DonGia = N'20tr/tháng' or TuyenDung.DonGia = N'21tr/tháng' or TuyenDung.DonGia = N'22tr/tháng' or TuyenDung.DonGia = N'23tr/tháng' or TuyenDung.DonGia = N'24tr/tháng' or TuyenDung.DonGia = N'18tr/tháng')";
                            break;
                        case "7":
                            sql += "AND TuyenDung.DonGia <> N'1tr/tháng' and TuyenDung.DonGia <> N'2tr/tháng' and TuyenDung.DonGia <> N'3tr/tháng' and TuyenDung.DonGia <> N'4tr/tháng' and TuyenDung.DonGia <> N'5tr/tháng' and TuyenDung.DonGia <> N'6tr/tháng' and TuyenDung.DonGia <> N'7tr/tháng' and TuyenDung.DonGia <> N'8tr/tháng' and TuyenDung.DonGia <> N'9tr/tháng' and TuyenDung.DonGia <> N'10tr/tháng' and TuyenDung.DonGia <> N'11tr/tháng' and TuyenDung.DonGia <> N'12tr/tháng' and TuyenDung.DonGia <> N'13tr/tháng' and TuyenDung.DonGia <> N'14tr/tháng' and TuyenDung.DonGia <> N'15tr/tháng' and TuyenDung.DonGia <> N'16tr/tháng' and TuyenDung.DonGia <> N'17tr/tháng' and TuyenDung.DonGia <> N'18tr/tháng' and TuyenDung.DonGia <> N'19tr/tháng' and TuyenDung.DonGia <> N'20tr/tháng' and TuyenDung.DonGia <> N'21tr/tháng' and TuyenDung.DonGia <> N'22tr/tháng' and TuyenDung.DonGia <> N'23tr/tháng' and TuyenDung.DonGia <> N'24tr/tháng' and TuyenDung.DonGia <> N'25tr/tháng' and TuyenDung.DonGia <> N'Thương lượng'";
                            break;
                        default:
                            sql += "AND TuyenDung.DonGia = N'Thương lượng'";
                            break;
                    }                       
                }
                if (congviec != "0")
                {
                    sql += "and LoaiTuyenDung.NganhNghe = N'" + congviec + "'";
                }
                if (khuvuc != "0")
                {
                    sql += "and TuyenDung.DiaChi = N'" + khuvuc + "'";
                }
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    sql += " and TuyenDung.TenTD LIKE N'%" + searchTerm + "%'";
                }
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            //string capBac = capbaac.Value; // lấy giá trị được chọn trong ListBox1
            //string q = "SELECT * FROM TuyenDung WHERE CapBac = '" + capBac + "'";
            //bindingData(DataList1, "SELECT * FROM TuyenDung,LoaiTuyenDung where TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TuyenDung.CapBac = N'" + capBac + "'");
            //string sql = "SELECT * FROM TuyenDung,LoaiTuyenDung where TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and CapBac = '" + capBac + "'";
            //dt = data.getData(sql);
            BindDataList();
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string mabds = ((ImageButton)sender).CommandArgument;
            Response.Redirect("ChoTietTuyenDung.aspx?MaTD=" + mabds);
        }
    }
}