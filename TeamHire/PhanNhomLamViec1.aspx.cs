using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class PhanNhomLamViec1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            TextBox3.Text = DateTime.Now.ToString("MM/dd/yyyy HH:mm");
            Image1.ImageUrl = "~/assets/images/nhomavatar.jpg";

            string q = "SELECT TenNV, MaNV FROM NhanVien WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
            DataTable dt = data.getData(q);
            foreach (DataRow row1 in dt.Rows)
            {
                string tenNV = row1["TenNV"].ToString();
                string maNV = row1["MaNV"].ToString();
                if ((int)data.getSingleValue("SELECT COUNT(*) FROM ThanhVienNhom WHERE MaNV = '" + maNV + "'") > 0)
                {

                }
                else
                {
                    ListItem item = new ListItem(tenNV, maNV);
                    ListBox1.Items.Add(item);
                }
            }
        }
        protected void truongnhom_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem.Value != "")
            {
                ListBox2.Enabled = true;
                ListBox2.Items.Clear();
                
                string truongnhom = ListBox1.SelectedValue;
                string q = "SELECT TenNV, MaNV FROM NhanVien WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and MaNV <> '" + truongnhom + "'";
                DataTable dt = data.getData(q);
                foreach (DataRow row1 in dt.Rows)
                {
                    string tenNV = row1["TenNV"].ToString();
                    string maNV = row1["MaNV"].ToString();
                    if ((int)data.getSingleValue("SELECT COUNT(*) FROM ThanhVienNhom WHERE MaNV = '" + maNV + "'") > 0)
                    {

                    }
                    else
                    {
                        ListItem item = new ListItem(tenNV, maNV);
                        ListBox2.Items.Add(item);
                    }
                    
                }
            }
            else
            {
                ListBox2.Enabled = false;
            }
        }
        protected void themnhom_click(object sender, EventArgs e)
        {
            if (ListBox1.GetSelectedIndices().Length == 0)
            {
                Label3.Visible = true;
                return;
            }
            if (ListBox2.GetSelectedIndices().Length == 0)
            {
                Label4.Visible = true;
                return;
            }
            string doituong = "";
            foreach (ListItem selectedItem in ListBox2.Items)
            {
                if (selectedItem.Selected)
                {
                    doituong += selectedItem.Text + ", ";
                }
            }
            // Xóa dấu phẩy và khoảng trắng cuối cùng nếu có
            if (!string.IsNullOrEmpty(doituong))
            {
                doituong = doituong.TrimEnd(',', ' ');
            }
            string hinhanh = "";
            //txtWorkspaceName.Text = fileImage2.ToString();
            if (FileUpload3.HasFile)
            {
                try
                {
                    hinhanh = System.IO.Path.GetFileName(FileUpload3.FileName);
                    string filePath = Server.MapPath("~/assets/images/") + hinhanh;
                    FileUpload3.SaveAs(filePath);

                    // Cập nhật đường dẫn hình ảnh cho Image1
                    //Image1.ImageUrl = "~/images/" + hinhanh;
                }
                catch (Exception ex)
                {
                }
            }
            else
            {
            }
            Random random = new Random();
            string randomString = "";
            for (int i = 0; i < 10; i++)
            {
                int randomNumber = random.Next(0, 10);
                randomString += randomNumber.ToString();
            }
            string currentDateTime = DateTime.Now.ToString("MM/dd/yyyy HH:mm");
            string sql = "INSERT INTO NhomLamViec(TenNLV, MoTa, HinhAnhN, NgayTao) VALUES (N'"+ TextBox1.Text + "', N'"+ randomString + "', '"+ hinhanh + "','"+ TextBox3.Text + "')";
            if (data.updateData(sql) > 0)
            {
                

                string timnhom = "select MaNLV from NhomLamViec where MoTa = N'"+ randomString + "'";
                DataTable result = data.getData(timnhom);
                if (result.Rows.Count > 0)
                {
                    string maNLV = result.Rows[0]["MaNLV"].ToString();
                    string truongN = "INSERT INTO ThanhVienNhom(MaNV,MaNLV,NgayThem,ViTri) VALUES('" + ListBox1.SelectedValue + "','" + maNLV + "','" + currentDateTime + "',N'Trưởng nhóm')";
                    data.updateData(truongN);
                    foreach (ListItem item in ListBox2.Items)
                    {
                        if (item.Selected)
                        {
                            string tv = "INSERT INTO ThanhVienNhom(MaNV,MaNLV,NgayThem,ViTri) VALUES('" + item.Value + "','"+ maNLV + "','" + currentDateTime + "',N'Thành viên')";
                            data.updateData(tv); // Gọi phương thức hoặc lớp để thực hiện truy vấn và cập nhật dữ liệu vào cơ sở dữ liệu
                        }
                    }
                }
                string capnhat = "update NhomLamViec set MoTa = N'"+ myTextarea.Value + "' where MoTa = N'"+ randomString + "'";
                data.updateData(capnhat);
                Response.Redirect("NhomLamViec1.aspx");
            }
            else
            {

            }
                
        }
    }
}