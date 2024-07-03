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
    public partial class ChiTietTuyenDung1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        string matd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            matd = Request.QueryString["MaTD"];
            if (matd == null)
            {
                Response.Redirect("TuyenDung1.aspx");
            }
            else
            {
                A1.Visible = false;
                //DataList1.DataSource = data.getData("SELECT * FROM TuyenDung,LoaiTuyenDung WHERE TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TuyenDung.MaTD='" + matd + "'");
                string q2 = "select * from TuyenDung,LoaiTuyenDung,TaiKhoan where TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TaiKhoan.username = TuyenDung.username and TuyenDung.MaTD = '" + matd + "'";
                DataTable dt2 = data.getData(q2);
                if (dt2.Rows.Count > 0)
                {
                    string tdt12 = dt2.Rows[0]["NganhNghe"].ToString();
                    string td432 = dt2.Rows[0]["username"].ToString();
                    Label29.Text = tdt12;
                    Label48.Text = td432;
                }
                if (Request.Cookies["Login"] == null)
                {
                    nopdon.Visible = false;
                    A1.Visible = true;
                    Label49.Visible = true;
                }
                if (Request.Cookies["Login"] != null)
                {
                    
                    string q3 = "select * from TaiKhoan where username = '" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                    DataTable dt3 = data.getData(q3);
                    if (dt3.Rows.Count > 0)
                    {
                        string tgd = dt3.Rows[0]["tennguoidung"].ToString();
                        string mail = dt3.Rows[0]["email"].ToString();
                        string sdt = dt3.Rows[0]["sodienthoai"].ToString();
                        Label32.Text = tgd;
                        Label33.Text = mail;
                        if (sdt == "")
                        {
                            TextBox1.Text = "0";
                        }
                        else
                        {
                            TextBox1.Text = sdt;
                        }
                    }
                    if (Request.Cookies["Login"]["tenDN"].ToString() == Label48.Text)
                    {
                        nopdon.Visible = false;
                    }
                    else
                    {
                        nopdon.Visible = true;
                    }
                }
                
                    bindingData(DataList1, "SELECT * FROM TuyenDung, LoaiTuyenDung WHERE TuyenDung.MaLTD = LoaiTuyenDung.MaLTD and TuyenDung.MaTD = '" + matd + "'");



            }
        }
        private void bindingData(DataList dataList, string sql)
        {
            dataList.DataSource = null;
            dataList.DataSource = data.getData(sql);
            dataList.DataBind();
        }
        protected void nopdontd_Click(object sender, EventArgs e)
        {
            string fileName;
            matd = Request.QueryString["MaTD"];
            if (TextBox1.Text == "")
            {
                Label44.Visible = true;
                Label44.Text = "( không được bỏ trống )*";
            }
            if (TextBox1.Text != "")
            {
                Label44.Visible = false;
            }
            if (FileUpload1.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload1.FileName.ToLower());
                bool isValidFileType = (fileExtension == ".doc" || fileExtension == ".docx" || fileExtension == ".xls" || fileExtension == ".pdf");

                // Kiểm tra kích thước tệp tin
                bool isFileSizeValid = (FileUpload1.PostedFile.ContentLength <= (3 * 1024 * 1024)); // 3MB

                if (isValidFileType && isFileSizeValid)
                {
                    fileName = Path.GetFileName(FileUpload1.FileName);
                    string filePath = Server.MapPath("~/assets/fileCV/") + fileName;
                    FileUpload1.SaveAs(filePath);

                    // Hiển thị thông báo thành công
                    Label45.Visible = false;
                    TextBox2.Text = "02";
                    Label35.ForeColor = System.Drawing.ColorTranslator.FromHtml("#666666");
                    Label46.ForeColor = System.Drawing.ColorTranslator.FromHtml("#666666");
                    Label35.Font.Underline = false;
                    Label46.Font.Underline = false;
                    string qq = "insert into DonTuyenDung values ('" + TextBox1.Text + "',N'" + myTextarea.Value + "',N'" + fileName + "',N'" + Label48.Text + "',N'"+ Request.Cookies["Login"]["tenDN"].ToString() + "','"+ Request.Cookies["Login"]["tenDN"].ToString() + "',current_timestamp,'"+ matd + "')";
                    if (data.updateData(qq) > 0)
                        Div1.Style["display"] = "block";
                    else
                        Div1.Style["display"] = "none";
                }
                else
                {
                    if (!isValidFileType)
                    {
                        Label35.ForeColor = System.Drawing.Color.Red;
                        Label35.Font.Underline = true;
                        Label45.Visible = true;
                        TextBox2.Text = "";
                    }
                    else if (!isFileSizeValid)
                    {
                        Label46.ForeColor = System.Drawing.Color.Red;
                        Label46.Font.Underline = true;
                        Label45.Visible = true;
                        TextBox2.Text = "";
                    }
                }
            }
            else
            {
                    // Hiển thị thông báo lỗi
                    //StatusLabel.Visible = true;
                    //StatusLabel.Text = "Vui lòng chọn một tệp tin để tải lên.";
                    Label45.Visible = true;
                    TextBox2.Text = "";

            }
            
            
            //Div1.Style["display"] = "block";
        }
        protected void huyy_Click(object sender, EventArgs e)
        {
            TextBox2.Text = "02";
            TextBox1.Text = "0";
        }

        }
}