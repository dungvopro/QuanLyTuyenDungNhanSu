using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class CaDon1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set initial state of the checkbox
                //myCheckBox.Checked = true;
                if (myCheckboxi.Checked)
                {
                    // Checkbox is ON
                    // Perform action for ON state
                    int state = 1; // Set the value to 1

                }
                else
                {
                    // Checkbox is OFF
                    // Perform action for OFF state
                    int state = 0; // Set the value to 0
                }
                radioMinutes.Checked = true;
                radioBlocks.Checked = false;
                TextBox15.Enabled = false;
                //TextBox16.Enabled = false;
                radioMinutes.Enabled = false;
                radioBlocks.Enabled = false;
                TextBox17.Enabled = false;
                TextBox18.Enabled = false;
                //TextBox19.Enabled = false;
                RadioButton1.Enabled = false;
                RadioButton2.Enabled = false;
                TextBox20.Enabled = false;
            }
        }
        protected void myCheckbox_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox3.Checked)
            {
                // Checkbox is ON
                // Perform action for ON state
                myCard.Attributes["class"] = "card card-info clicked";
                TextBox15.Enabled = true;
                //TextBox16.Enabled = true;
                radioMinutes.Enabled = true;
                radioBlocks.Enabled = true;
                if (radioMinutes.Checked)
                {
                    TextBox17.Enabled = false;

                }
                else if (radioBlocks.Checked)
                {
                    TextBox17.Enabled = true;
                }
            }
            else
            {
                // Checkbox is OFF
                // Perform action for OFF state
                myCard.Attributes["class"] = "card card-secondary clicked";
                TextBox15.Enabled = false;
                //TextBox16.Enabled = false;
                radioMinutes.Enabled = false;
                radioBlocks.Enabled = false;
                TextBox17.Enabled = false;
            }
        }
        protected void myChk_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox4.Checked)
            {
                // Checkbox is ON
                // Perform action for ON state
                toiCard.Attributes["class"] = "card card-info clicked";
                TextBox18.Enabled = true;
                //TextBox19.Enabled = true;
                RadioButton1.Enabled = true;
                RadioButton2.Enabled = true;
                if (RadioButton1.Checked)
                {
                    TextBox20.Enabled = false;

                }
                else if (RadioButton2.Checked)
                {
                    TextBox20.Enabled = true;
                }

            }
            else
            {
                // Checkbox is OFF
                // Perform action for OFF state
                toiCard.Attributes["class"] = "card card-secondary clicked";
                TextBox18.Enabled = false;
                //TextBox19.Enabled = false;
                RadioButton1.Enabled = false;
                RadioButton2.Enabled = false;
                TextBox20.Enabled = false;
            }
        }
        protected void mybox_CheckedChanged(object sender, EventArgs e)
        {
            if (myCheckboxi.Checked)
            {
                // Checkbox is ON
                // Perform action for ON state
                int state = 1; // Set the value to 1

            }
            else
            {
                // Checkbox is OFF
                // Perform action for OFF state
                int state = 0; // Set the value to 0
            }
        }
        protected void RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            // Xử lý sự kiện khi RadioButton được chọn

            // Kiểm tra RadioButton nào được chọn và thực hiện các xử lý tương ứng
            if (radioMinutes.Checked)
            {
                // RadioButton "Tính theo số phút" được chọn
                // Thực hiện các xử lý tương ứng
                // ...
                TextBox17.Enabled = false;
                RadioButton1.Checked = true;
                RadioButton2.Checked = false;
            }
            else if (radioBlocks.Checked)
            {
                // RadioButton "Tính theo block" được chọn
                // Thực hiện các xử lý tương ứng
                // ...
                TextBox17.Enabled = true;
                RadioButton1.Checked = false;
                RadioButton2.Checked = true;

            }
        }
        protected void Radio2_CheckedChanged(object sender, EventArgs e)
        {
            // Xử lý sự kiện khi RadioButton được chọn

            // Kiểm tra RadioButton nào được chọn và thực hiện các xử lý tương ứng
            if (RadioButton1.Checked)
            {
                // RadioButton "Tính theo số phút" được chọn
                // Thực hiện các xử lý tương ứng
                // ...
                TextBox20.Enabled = false;
                radioMinutes.Checked = true;
                radioBlocks.Checked = false;
            }
            else if (RadioButton2.Checked)
            {
                // RadioButton "Tính theo block" được chọn
                // Thực hiện các xử lý tương ứng
                // ...
                TextBox20.Enabled = true;
                radioMinutes.Checked = false;
                radioBlocks.Checked = true;
            }
        }
        protected void TextBox20_TextChanged(object sender, EventArgs e)
        {
            TextBox17.Text = TextBox20.Text;
        }

        protected void TextBox17_TextChanged(object sender, EventArgs e)
        {
            TextBox20.Text = TextBox17.Text;
        }
        protected void huy_Click(object sender, EventArgs e)
        {
            Response.Redirect("CaLamViec1.aspx");
        }
        private void kiemtratg(TextBox textBoxBatDau, TextBox textBoxKetThuc, Label label)
        {
            string thoiGianBatDau = textBoxBatDau.Text.Trim();
            string thoiGianKetThuc = textBoxKetThuc.Text.Trim();

            DateTime batDau, ketThuc;
            if (!DateTime.TryParseExact(thoiGianBatDau, "h:mm tt", CultureInfo.InvariantCulture, DateTimeStyles.None, out batDau) ||
                !DateTime.TryParseExact(thoiGianKetThuc, "h:mm tt", CultureInfo.InvariantCulture, DateTimeStyles.None, out ketThuc))
            {
                label.Visible = true;
                label.Text = "Lỗi: Định dạng thời gian không hợp lệ.";
                return;
            }

            if (ketThuc < batDau)
            {
                label.Visible = true;
                label.Text = "Lỗi: Thời gian kết thúc phải lớn hơn hoặc bằng thời gian bắt đầu.";
                return;
            }
            label.Visible = false;
            label.Text = "Thời gian hợp lệ.";
        }
        private void kiemtratrong(TextBox textBoxBatDau, Label label)
        {
            string thoiGianBatDau = textBoxBatDau.Text.Trim();
            if (thoiGianBatDau == "")
            {
                label.Visible = true;
                label.Text = "Lỗi: Vui lòng không để trống";
                return;
            }
            label.Visible = false;
        }
        protected void luu_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text == "")
            {
                Label29.Visible = true;
                Label29.Text = "Vui lòng không để trống";
                TextBox1.Attributes["class"] = "form-control is-invalid";
                return;
            }
            else
            {
                Label29.Visible = false;
                TextBox1.Attributes["class"] = "form-control";
            }
            kiemtratg(TextBox3, TextBox2, Label10);
            kiemtratg(TextBox4, TextBox5, Label11);
            kiemtratg(TextBox6, TextBox7, Label12);

            kiemtratrong(TextBox21, Label17);
            kiemtratrong(TextBox22, Label18);
            int hoatdong, ct = 0;
            string dk = "";
            string tgdm1, tgdm2, tgvs1, tgvs2, bl0ck = "";
            if (myCheckboxi.Checked)
            {
                // Checkbox is ON
                // Perform action for ON state
                hoatdong = 1; // Set the value to 1

            }
            else
            {
                // Checkbox is OFF
                // Perform action for OFF state
                hoatdong = 0; // Set the value to 0
            }
            if (CheckBox2.Checked)
            {
                dk = "Nghỉ cả ca làm việc";
            }
            else if (CheckBox1.Checked)
            {
                dk = "Nghỉ một 1/2 ca làm việc";
            }
            else
            {
                dk = "Không được xin nghỉ";
            }
            if (CheckBox3.Checked)
            {
                tgdm1 = TextBox15.Text;
                kiemtratrong(TextBox15, Label13);
                kiemtratrong(TextBox17, Label15);
                //tgdm2 = TextBox16.Text;
                if (radioMinutes.Checked)
                {
                    ct = 1;
                }
                else if (radioBlocks.Checked)
                {
                    ct = 2;
                    bl0ck = TextBox17.Text;
                }
            }
            else
            {
                tgdm1 = "";
                tgdm2 = "";
            }
            if (CheckBox4.Checked)
            {
                tgvs1 = TextBox18.Text;
                kiemtratrong(TextBox18, Label14);
                kiemtratrong(TextBox20, Label16);
                //tgvs2 = TextBox19.Text;
                if (RadioButton1.Checked)
                {
                    ct = 1;
                }
                else if (RadioButton2.Checked)
                {
                    ct = 2;
                    bl0ck = TextBox20.Text;
                }
            }
            else
            {
                tgvs1 = "";
                tgvs2 = "";
            }
            if (Label10.Visible || Label11.Visible || Label12.Visible || Label13.Visible || Label17.Visible || Label18.Visible || Label14.Visible || Label16.Visible || Label15.Visible)
            {
                // Hiển thị thông báo lỗi và không tiếp tục thực hiện mã
                return;
            }

            string q = "insert into CaLamViec values (N'" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "',N'" + dk + "','" + tgdm1 + "','" + tgvs1 + "','" + ct + "','" + bl0ck + "','" + TextBox21.Text + "','" + TextBox22.Text + "','" + hoatdong + "','" + Request.Cookies["workspacxe"]["Maw"] + "',N'Ca đơn')";
            //string p = "insert into CaLamViec values (N'" + TextBox1.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + TextBox12.Text + "','" + TextBox13.Text + "','" + TextBox14.Text + "',N'" + dk + "','" + tgdm2 + "','" + tgvs2 + "','" + ct + "','" + bl0ck + "','" + TextBox21.Text + "','" + TextBox22.Text + "','" + hoatdong + "','" + Request.Cookies["workspacxe"]["Maw"] + "','CaHanhChinh')";
            if ((int)data.getSingleValue("SELECT COUNT(*) FROM CaLamViec WHERE MaW ='" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = N'" + TextBox1.Text + "'") > 0)
            {
                TextBox1.Attributes["class"] = "form-control is-invalid";
                Label29.Visible = true;
                Label29.Text = "Tên bị trùng*";
                return;
            }
            else
            {
                Label29.Visible = false;
                TextBox1.Attributes["class"] = "form-control";
                if (data.updateData(q) > 0)
                {
                    //if (data.updateData(p) > 0)
                    //{
                    //TextBox8.Text = "thành công";
                    Response.Redirect("CaLamViec1.aspx");
                    //}
                    //else
                    //{
                    //    //TextBox8.Text = "thất bại";
                    //    int haha;
                    //}


                }
                else
                {
                    //TextBox8.Text = "thất bại";
                    int huhu;
                }

            }
        }
    }
}