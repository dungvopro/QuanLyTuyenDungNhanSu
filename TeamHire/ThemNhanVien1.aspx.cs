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
    public partial class ThemNhanVien1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            Image1.ImageUrl = "~/assets/images/bot_icon.jpg";
            fileUploader.Attributes["onchange"] = "previewImage(this);";
            ngaytd.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
        private void bindingData(DataList dataList, string sql)
        {
            dataList.DataSource = null;
            dataList.DataSource = data.getData(sql);
            dataList.DataBind();
        }
        string hinhanh, user;
        protected void fileUploader_TextChanged(object sender, EventArgs e)
        {
            if (fileUploader.HasFile)
            {
                try
                {
                    // Tạo một đường dẫn tạm thời cho hình ảnh
                    string hinhanh = System.IO.Path.GetFileName(fileUploader.FileName);
                    string temporaryPath = "~/assets/temp/" + hinhanh;
                    fileUploader.SaveAs(Server.MapPath(temporaryPath));

                    // Cập nhật đường dẫn hình ảnh tạm thời cho Image1
                    Image1.ImageUrl = temporaryPath;
                }
                catch (Exception ex)
                {
                    showThongBao("error: " + ex.Message.ToString(), Color.Red);
                }
            }
            else
            {
                showThongBao("you have not specified a file.", Color.Red);
            }
        }

        protected void them_Click(object sender, EventArgs e)
        {
            string permissionInputValue = Request.Form["permission-input"];
            bool permissionViewChecked = Request.Form["permission-view"] == "on";
            bool permissionUpdateChecked = Request.Form["permission-update"] == "on";
            bool permissionDeleteChecked = Request.Form["permission-delete"] == "on";
            string GioiTinh = gioitinh.Value;
            string ChucVu = chucvu.Value;
            string TTHN = tthn.Value;
            string TTNS = ttns.Value;
            string LHNS = lhns.Value;
            if (ChucVu == "0")
            {
                ChucVu = "4";
            }
            if (GioiTinh == "0")
            {
                GioiTinh = "";
            }
            if (TTHN == "0")
            {
                TTHN = "";
            }
            if (TTNS == "0")
            {
                TTNS = "";
            }
            if (LHNS == "0")
            {
                LHNS = "";
            }
            //string PhanQuyen = permission.Value;
            HttpCookie myCookie = Request.Cookies["Login"];
            if (myCookie != null)
            {
                user = myCookie["tenDN"];
            }
            if (fileUploader.HasFile)
            {
                try
                {
                    hinhanh = System.IO.Path.GetFileName(fileUploader.FileName);
                    string filePath = Server.MapPath("~/assets/images/") + hinhanh;
                    fileUploader.SaveAs(filePath);

                    // Cập nhật đường dẫn hình ảnh cho Image1
                    //Image1.ImageUrl = "~/images/" + hinhanh;
                }
                catch (Exception ex)
                {
                    showThongBao("error: " + ex.Message.ToString(), Color.Red);
                }
            }
            else
            {
                showThongBao("you have not specified a file.", Color.Red);
            }
            string phanQuyen = string.Empty;

            if (permissionList.Items[0].Selected)
            {
                phanQuyen += "Quản lý nhân viên, ";
            }

            if (permissionList.Items[1].Selected)
            {
                phanQuyen += "Quản lý lịch nhân viên, ";
            }

            if (permissionList.Items[2].Selected)
            {
                phanQuyen += "Thống kê, ";
            }

            // Xóa dấu phẩy và khoảng trắng cuối cùng
            phanQuyen = phanQuyen.TrimEnd(',', ' ');

            string key, tendnnv;
            string tra = "select KeyWDN from Workspace where MaW = '"+ Request.Cookies["workspacxe"]["Maw"].ToString() + "'";
            DataTable ww = data.getData(tra);
            if (ww.Rows.Count > 0)
            {
                key = ww.Rows[0]["KeyWDN"].ToString();
                tendnnv = username.Text + key;



                string sql = "insert into NhanVien values (N'" + hoten.Text + "','" + ngaysinh.Text + "',N'" + GioiTinh + "',N'" + ChucVu + "','" + Request.Cookies["workspacxe"]["Maw"].ToString() + "',CURRENT_TIMESTAMP,N'" + DiaChi.Text + "','" + sdt.Text + "',N'" + gmail.Text + "',N'" + phanQuyen + "',N'" + cmnd.Text + "',N'" + noicap.Text + "',N'" + ngaycap.Text + "',N'" + hocbvan.Text + "',N'" + chuyennganh.Text + "',N'" + TTHN + "',N'" + sotaikhoan.Text + "',N'" + tennganhang.Text + "',N'" + chinhanh.Text + "',N'" + TTNS + "',N'" + LHNS + "',N'" + myTextarea.Value + "',N'" + hinhanh + "',N'" + ghichu.Text + "',N'" + truonghoc.Text + "','" + tendnnv + "','" + pass.Text + "')";
                string sql1 = "insert into NhanVien(TenNV,GioiTinh) values (N'" + hoten.Text + "',N'" + GioiTinh + "')";


                if ((int)data.getSingleValue("select count(*) from TaiKhoan where username='" + user + "'") == 1)
                {
                    if (data.updateData(sql) > 0)
                        showThongBao("thêm thành công!", Color.Green);
                    else
                        showThongBao("Username đã được sử dụng!", Color.Red);
                }
                else showThongBao(user, Color.Red);
            }
        }

        protected void huy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLNhanSu.aspx");
        }
        private void showThongBao(string strTB, Color color)
        {
            lbThongBao.Visible = true;
            lbThongBao.Text = strTB;
            lbThongBao.ForeColor = color;
        }
    }
}