using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class QuanLy1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        string matd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            matd = Request.QueryString["MaW"];
            if (matd == null)
            {
                Response.Redirect("QLThongKe1.aspx");
            }
            else
            {
                //DataList1.DataSource = data.getData("SELECT * FROM TuyenDung,LoaiTuyenDung WHERE TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TuyenDung.MaTD='" + matd + "'");
                //bindingData(DataList1, "SELECT * FROM TuyenDung, LoaiTuyenDung WHERE TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TuyenDung.MaTD = '" + matd + "'");
            }
        }
        private void bindingData(DataList dataList, string sql)
        {
            dataList.DataSource = null;
            dataList.DataSource = data.getData(sql);
            dataList.DataBind();
        }
    }
}