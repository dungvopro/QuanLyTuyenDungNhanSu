using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class QLNhanSu : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        string matd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            matd = Request.Cookies["workspacxe"]["Maw"].ToString();
            if (matd == null)
            {
                Response.Redirect("QuanTri.aspx");
            }
            else
            {
                BindDataList();
                //DataList1.DataSource = data.getData("SELECT * FROM TuyenDung,LoaiTuyenDung WHERE TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TuyenDung.MaTD='" + matd + "'");
                //bindingData(DataList1, "SELECT * FROM NhanVien,Workspace,ChucVu WHERE Workspace.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "' and Workspace.MaW = NhanVien.MaW and NhanVien.MaCV = ChucVu.MaCV and Workspace.MaW = '" + matd + "'");
            }

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
            try
            {
                // Kích thước trang
                int pageSize = 10;

                // Truy vấn dữ liệu từ cơ sở dữ liệu
                string sql = "SELECT* FROM NhanVien,Workspace,ChucVu WHERE Workspace.username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "' and Workspace.MaW = NhanVien.MaW and NhanVien.MaCV = ChucVu.MaCV and Workspace.MaW = '" + Request.Cookies["workspacxe"]["Maw"].ToString() + "'";
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

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string haha = ((Button)sender).CommandArgument;
            if ((int)data.getSingleValue("SELECT COUNT(*) FROM ThanhVienNhom WHERE MaNV = N'" + haha + "'") > 0)
            {
                string q99 = "delete ThanhVienNhom where MaNV = '" + haha + "'";
                if (data.updateData(q99) > 0)
                {
                    if ((int)data.getSingleValue("SELECT COUNT(*) FROM PhanCa WHERE MaNV = N'" + haha + "'") > 0)
                    {
                        string q1 = "delete PhanCa where MaNV = '" + haha + "'";
                        if (data.updateData(q1) > 0)
                        {
                            string sql = "delete NhanVien where MaNV = '" + haha + "'";
                            if (data.updateData(sql) > 0)
                            {
                                BindDataList();
                                showThongBao("Xoá NV thành công", Color.Green);
                            }
                            else
                            {
                                showThongBao("xóa NV thất bại!", Color.Red);
                            }
                        }
                        else
                        {
                            showThongBao("xóa PC thất bại!", Color.Red);
                        }
                    }
                    else
                    {
                        string sql = "delete NhanVien where MaNV = '" + haha + "'";
                        if (data.updateData(sql) > 0)
                        {
                            BindDataList();
                            showThongBao("Xoá NV thành công", Color.Green);
                        }
                        else
                        {
                            showThongBao("xóa NV thất bại!", Color.Red);
                        }
                    }
                }
                else
                {
                    showThongBao("xóa Nhom thất bại!", Color.Red);
                }
            }
            else
            {


                if ((int)data.getSingleValue("SELECT COUNT(*) FROM PhanCa WHERE MaNV = N'" + haha + "'") > 0)
                {
                    string q1 = "delete PhanCa where MaNV = '" + haha + "'";
                    if (data.updateData(q1) > 0)
                    {
                        string sql = "delete NhanVien where MaNV = '" + haha + "'";
                        if (data.updateData(sql) > 0)
                        {
                            BindDataList();
                            showThongBao("Xoá NV thành công", Color.Green);
                        }
                        else
                        {
                            showThongBao("xóa NV thất bại!", Color.Red);
                        }
                    }
                    else
                    {
                        showThongBao("xóa PC thất bại!", Color.Red);
                    }
                }
                else
                {
                    string sql = "delete NhanVien where MaNV = '" + haha + "'";
                    if (data.updateData(sql) > 0)
                    {
                        BindDataList();
                        showThongBao("Xoá NV thành công", Color.Green);
                    }
                    else
                    {
                        showThongBao("xóa NV thất bại!", Color.Red);
                    }
                }
            }
        }
        private void showThongBao(string strTB, Color color)
        {
            lbTB.Visible = true;
            lbTB.Text = strTB;
            lbTB.ForeColor = color;
        }
        protected void EditButton_Click(object sender, EventArgs e)
        {
            string haha = ((Button)sender).CommandArgument;
            Response.Redirect("ChinhSuaNhanVien1.aspx?MaNV=" + haha);

        }
        protected void ViewButton_Click(object sender, EventArgs e)
        {
            string huhu = ((Button)sender).CommandArgument;
            Response.Redirect("ChiTietNhanVien1.aspx?MaNV=" + huhu);

        }
    }
}