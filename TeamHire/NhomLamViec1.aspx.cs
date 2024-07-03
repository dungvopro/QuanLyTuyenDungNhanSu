﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class NhomLamViec1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            BindDataList();
        }
        protected DataTable GetMembers(object maNLV)
        {
            string maNLVString = maNLV.ToString();
            // Truy vấn cơ sở dữ liệu hoặc xử lý logic để lấy danh sách thành viên từ mã nhóm là maNLVString
            string sql = "SELECT NhanVien.HinhAnh FROM NhanVien JOIN ThanhVienNhom ON NhanVien.MaNV = ThanhVienNhom.MaNV WHERE ThanhVienNhom.MaNLV = '" + maNLVString + "'";
            DataTable dtMembers = data.getData(sql);
            return dtMembers;
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
                string sql = "SELECT NhomLamViec.MaNLV, NhomLamViec.TenNLV, NhomLamViec.HinhAnhN, NhomLamViec.NgayTao " +
              "FROM NhomLamViec " +
              "JOIN ThanhVienNhom ON NhomLamViec.MaNLV = ThanhVienNhom.MaNLV " +
              "JOIN NhanVien ON ThanhVienNhom.MaNV = NhanVien.MaNV " +
              "JOIN Workspace ON NhanVien.MaW = Workspace.MaW " +
              "WHERE Workspace.MaW = '" + Request.Cookies["workspacxe"]["Maw"].ToString() + "'" +
              "GROUP BY NhomLamViec.MaNLV, NhomLamViec.TenNLV, NhomLamViec.HinhAnhN, NhomLamViec.NgayTao";
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