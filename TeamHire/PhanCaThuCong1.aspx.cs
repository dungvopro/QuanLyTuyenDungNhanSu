using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class PhanCaThuCong1 : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            Label5.Text = DateTime.Now.ToString("MM/dd/yyyy");
            // Lấy danh sách các giá trị đã chọn
            // Cách 1: Sử dụng Request.Form

            string q = "SELECT TenNV, MaNV FROM NhanVien WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
            DataTable dt = data.getData(q);
            foreach (DataRow row1 in dt.Rows)
            {
                string tenNV = row1["TenNV"].ToString();
                string maNV = row1["MaNV"].ToString();
                ListItem item = new ListItem(tenNV, maNV);
                ListBox2.Items.Add(item);
            }
            string q2 = "SELECT TenCV FROM NhanVien,ChucVu Where NhanVien.MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and NhanVien.MaCV = ChucVu.MaCV GROUP BY TenCV";
            DataTable dt2 = data.getData(q2);
            foreach (DataRow row2 in dt2.Rows)
            {
                string tencv = row2["TenCV"].ToString();
                ListBox3.Items.Add(tencv);
            }
            string q3 = "SELECT TenCLV FROM CaLamViec Where CaLamViec.MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TrangThaiHoatDong = '1' GROUP BY TenCLV";
            DataTable dt3 = data.getData(q3);
            foreach (DataRow row3 in dt3.Rows)
            {
                string tencv = row3["TenCLV"].ToString();
                dungchungca.Items.Add(tencv);
            }
            // Cách 2: Truy cập trực tiếp vào phần tử <select>

        }
        protected void toanct_Click(object sender, EventArgs e)
        {
            ListBox1.Visible = false;
            ListBox1.ClearSelection();
            ListBox2.Visible = false;
            ListBox2.ClearSelection();
            ListBox3.Visible = false;
            ListBox3.ClearSelection();
            Button1.Attributes["class"] = "btn btn-info";
            Button2.Attributes["class"] = "btn btn-outline-info";
            Button3.Attributes["class"] = "btn btn-outline-info";
            Button4.Attributes["class"] = "btn btn-outline-info";
            Label24.Text = "Toàn công ty";
        }
        protected void nhomct_Click(object sender, EventArgs e)
        {
            ListBox1.Visible = true;
            ListBox2.Visible = false;
            ListBox2.ClearSelection();
            ListBox3.Visible = false;
            ListBox3.ClearSelection();
            Button1.Attributes["class"] = "btn btn-outline-info";
            Button2.Attributes["class"] = "btn btn-info";
            Button3.Attributes["class"] = "btn btn-outline-info";
            Button4.Attributes["class"] = "btn btn-outline-info";
            Label24.Text = "Nhóm này chưa phát triển";
        }
        protected void nhanvien_Click(object sender, EventArgs e)
        {
            ListBox1.Visible = false;
            ListBox1.ClearSelection();
            ListBox2.Visible = true;
            ListBox3.Visible = false;
            ListBox3.ClearSelection();
            Button1.Attributes["class"] = "btn btn-outline-info";
            Button2.Attributes["class"] = "btn btn-outline-info";
            Button4.Attributes["class"] = "btn btn-info";
            Button3.Attributes["class"] = "btn btn-outline-info";
            Label24.Text = "Nhân viên cụ thể";
        }
        protected void vitri_Click(object sender, EventArgs e)
        {
            ListBox1.Visible = false;
            ListBox1.ClearSelection();
            ListBox2.Visible = false;
            ListBox2.ClearSelection();
            ListBox3.Visible = true;
            Button1.Attributes["class"] = "btn btn-outline-info";
            Button2.Attributes["class"] = "btn btn-outline-info";
            Button3.Attributes["class"] = "btn btn-info";
            Button4.Attributes["class"] = "btn btn-outline-info";
            Label24.Text = "Vị trí công việc";
        }
        protected void tg1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tg11.SelectedItem.Value == "Tuần")
            {
                tuan11.Visible = true;
                thang11.Visible = false;
                thang1.ClearSelection();
                cachthang11.Visible = false;
                dongpham.Visible = true;
                Div1.Visible = false;
                Label15.Text = "Hàng tuần,";
                Label16.Visible = true;
                Label17.Visible = false;
            }
            else if (tg11.SelectedItem.Value == "Tháng")
            {
                tuan11.Visible = false;
                cachtuan11.Visible = false;
                tuan1.ClearSelection();
                thang11.Visible = true;
                dongpham.Visible = false;
                Div1.Visible = true;
                Label15.Text = "Hàng tháng,";
                Label16.Visible = false;
                Label17.Visible = true;
            }
        }
        protected void tuan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tuan1.SelectedItem.Value == "Hàng tuần")
            {
                cachtuan11.Visible = false;
                cachtuan1.ClearSelection();
                Label15.Text = "Hàng tuần,";
            }
            else if (tuan1.SelectedItem.Value == "Cách tuần")
            {
                cachtuan11.Visible = true;
                Label15.Text = "Cách 1 tuần,";
            }
        }
        protected void cachtuan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cachtuan1.SelectedItem.Value == "1 Tuần")
            {
                cachtuan11.Visible = true;
                Label15.Text = "Cách 1 tuần,";
            }
            else if (cachtuan1.SelectedItem.Value == "2 Tuần")
            {
                cachtuan11.Visible = true;
                Label15.Text = "Cách 2 tuần,";
            }
            else if (cachtuan1.SelectedItem.Value == "3 Tuần")
            {
                cachtuan11.Visible = true;
                Label15.Text = "Cách 3 tuần,";
            }
        }
        protected void thang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (thang1.SelectedItem.Value == "Hàng tháng")
            {
                cachthang11.Visible = false;
                cachthang1.ClearSelection();
                Label15.Text = "Hàng tháng,";
            }
            else if (thang1.SelectedItem.Value == "Cách tháng")
            {
                cachthang11.Visible = true;
                Label15.Text = "Cách 1 tháng,";
            }
        }
        protected void cachthang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cachthang1.SelectedItem.Value == "1 Tháng")
            {
                cachthang11.Visible = true;
                Label15.Text = "Cách 1 tháng,";
            }
            else if (cachthang1.SelectedItem.Value == "2 Tháng")
            {
                cachthang11.Visible = true;
                Label15.Text = "Cách 2 tháng,";
            }
            else if (cachthang1.SelectedItem.Value == "3 Tháng")
            {
                cachthang11.Visible = true;
                Label15.Text = "Cách 3 tháng,";
            }
        }
        protected void CheckBox_Click(object sender, EventArgs e)
        {
            // Tạo chuỗi ngày đã chọn
            string selectedDays = "";

            if (CheckBox1.Checked)
                selectedDays += "Thứ 2, ";
            if (CheckBox2.Checked)
                selectedDays += "Thứ 3, ";
            if (CheckBox3.Checked)
                selectedDays += "Thứ 4, ";
            if (CheckBox4.Checked)
                selectedDays += "Thứ 5, ";
            if (CheckBox5.Checked)
                selectedDays += "Thứ 6, ";
            if (CheckBox6.Checked)
                selectedDays += "Thứ 7, ";
            if (CheckBox7.Checked)
                selectedDays += "Chủ nhật, ";

            // Xóa dấu phẩy và khoảng trắng cuối cùng nếu có
            selectedDays = selectedDays.TrimEnd(',', ' ');

            // Gán chuỗi ngày đã chọn vào thuộc tính Text của Label
            Label16.Text = selectedDays;
        }
        protected void ListBox30_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<string> selectedDays = new List<string>();

            foreach (ListItem item in ListBox4.Items)
            {
                if (item.Selected)
                {
                    selectedDays.Add(item.Text);
                }
            }

            Label17.Text = string.Join(", ", selectedDays);
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

            }
            else if (RadioButton2.Checked)
            {
                // RadioButton "Tính theo block" được chọn
                // Thực hiện các xử lý tương ứng
                // ...

            }
        }
        void TinhNgayApDung()
        {
            bool isValidFormat = false;
            DateTime startDate;
            DateTime endDate;
            if (!string.IsNullOrEmpty(TextBox3.Text))
            {
                string[] dateRange = TextBox3.Text.Split('-');

                if (dateRange.Length == 2)
                {
                    if (DateTime.TryParseExact(dateRange[0].Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate)
                        && DateTime.TryParseExact(dateRange[1].Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate))
                    {
                        isValidFormat = true;
                    }
                }
            }
            if (isValidFormat)
            {

                Label25.Visible = false;
                int tuandinhmenh = 1, thangdinhmenh = 1;
                string timeRange = TextBox3.Text;
                string SoCachTuan = Label15.Text;
                switch (SoCachTuan)
                {
                    case "Cách 1 tuần,":
                        tuandinhmenh = 1;
                        break;
                    case "Cách 2 tuần,":
                        tuandinhmenh = 2;
                        break;
                    case "Cách 3 tuần,":
                        tuandinhmenh = 3;
                        break;
                    case "Hàng tuần,":
                        tuandinhmenh = 1;
                        break;
                    case "Cách 1 tháng,":
                        thangdinhmenh = 1;
                        break;
                    case "Cách 2 tháng,":
                        thangdinhmenh = 2;
                        break;
                    case "Cách 3 tháng,":
                        thangdinhmenh = 3;
                        break;
                    default:
                        thangdinhmenh = 1;
                        break;
                }
                string[] timeParts = timeRange.Split(new string[] { " - " }, StringSplitOptions.None);
                string startTime = timeParts[0];
                string endTime = timeParts[1];
                //TextBox2.Text = startTime;
                string labelValue = Label17.Text; // Lấy nội dung của Label17

                string[] values = labelValue.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); // Tách chuỗi thành mảng các giá trị con

                List<int> conmemayList = new List<int>();

                foreach (string value in values)
                {
                    // Xóa các khoảng trắng và chữ "Ngày " từ giá trị
                    string dayValue = value.Trim().Replace("Ngày ", "");

                    if (int.TryParse(dayValue, out int day))
                    {
                        conmemayList.Add(day);
                    }
                }
                string daysOfWeek = Label16.Text;

                DateTime startDateTime = DateTime.ParseExact(startTime, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                DateTime endDateTime = DateTime.ParseExact(endTime, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (SoCachTuan == "Cách 1 tuần," || SoCachTuan == "Cách 2 tuần," || SoCachTuan == "Cách 3 tuần," || SoCachTuan == "Hàng tuần,")
                {
                    int[] repeatDays = GetRepeatDaysOfWeek(daysOfWeek);
                    //tuandinhmenh = 3; // Cách nhau 2 tuần

                    List<DateTime> repeatedDates = GetRepeatedBiWeeklyDates(startDateTime, endDateTime, repeatDays, tuandinhmenh);

                    TextBox4.Text = string.Join(", ", repeatedDates.Select(date => date.ToString("MM/dd/yyyy")));
                }
                else
                {
                    int[] conmemay = conmemayList.ToArray(); // Chuyển đổi List sang mảng số nguyên

                    List<DateTime> selectedDates = GetMonthlyRepeatedDates(startDateTime, endDateTime, thangdinhmenh, conmemay);

                    string dateList = string.Join(", ", selectedDates.Select(date => date.ToString("MM/dd/yyyy")));

                    TextBox4.Text = dateList;
                }
            }
            else
            {
                // Hiển thị thông báo lỗi trong Label
                Label25.Visible = true;
                Label25.Text = "Định dạng ngày không hợp lệ. Vui lòng nhập theo định dạng tháng/ngày/năm - tháng/ngày/năm.";
            }
            }

        public static int[] GetRepeatDaysOfWeek(string daysOfWeek)
        {
            string[] days = daysOfWeek.Split(new[] { ", " }, StringSplitOptions.RemoveEmptyEntries);

            Dictionary<string, int> dayMapping = new Dictionary<string, int>()
            {
                { "Chủ nhật", 0 },
                { "Thứ 2", 1 },
                { "Thứ 3", 2 },
                { "Thứ 4", 3 },
                { "Thứ 5", 4 },
                { "Thứ 6", 5 },
                { "Thứ 7", 6 }
            };

            int[] repeatDays = days.Select(day => dayMapping[day]).ToArray();

            return repeatDays;
        }

        public static List<DateTime> GetRepeatedBiWeeklyDates(DateTime startDate, DateTime endDate, int[] repeatDays, int tuandinhmenh)
        {
            List<DateTime> repeatedDates = new List<DateTime>();

            DateTime currentDate = startDate;
            int currentInterval = 0;
            while (currentDate <= endDate)
            {
                if (Array.IndexOf(repeatDays, (int)currentDate.DayOfWeek) != -1 && currentInterval % tuandinhmenh == 0)
                {
                    repeatedDates.Add(currentDate.Date);
                }
                currentDate = currentDate.AddDays(1);
                if (currentDate.DayOfWeek == DayOfWeek.Sunday)
                {
                    currentInterval++;
                }
            }

            return repeatedDates;
        }
        public static List<DateTime> GetMonthlyRepeatedDates(DateTime startDate, DateTime endDate, int intervalMonths, params int[] dates)
        {
            List<DateTime> selectedDates = new List<DateTime>();

            DateTime currentDate = startDate;
            DateTime nextDate = startDate.AddMonths(intervalMonths);

            while (currentDate <= endDate)
            {
                int currentMonth = currentDate.Month;
                int currentYear = currentDate.Year;

                foreach (int day in dates)
                {
                    DateTime dateToCheck = new DateTime(currentYear, currentMonth, day);

                    if (dateToCheck >= startDate && dateToCheck <= endDate)
                    {
                        selectedDates.Add(dateToCheck);
                    }
                }

                currentDate = currentDate.AddMonths(intervalMonths);
                nextDate = nextDate.AddMonths(intervalMonths);
            }

            return selectedDates;
        }




        protected void Listdungchungca_SelectedIndexChanged(object sender, EventArgs e)
        {
            //TextBox5.Text = "";
            Label23.Text = "";
            TextBox2.Text = "ok";
            List<string> checkcachung = new List<string>();
            checkCaDaPhan();
            foreach (ListItem item in dungchungca.Items)
            {
                if (item.Selected)
                {
                    checkcachung.Add(item.Text);
                }
            }
            
            string huhu = string.Join("", checkcachung);
            Label19.Text = string.Join(", ", checkcachung);
            //TextBox5.Text = checkcachung.ToString();
            string[] tenArr = Label19.Text.Split(',');
            foreach (string ten in tenArr)
            {
                string s1 = "select MaCLV from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = N'" + ten.Trim() + "'";
                DataTable dt2 = data.getData(s1);
                foreach (DataRow row2 in dt2.Rows)
                {
                    string maCLV = row2["MaCLV"].ToString();
                    string s12 = "select ThoiGianBatDau, ThoiGianKetThuc from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and MaCLV = '" + maCLV + "'";
                    DataTable dt3 = data.getData(s12);

                    List<TimeSpan> thoiGianBatDauList = new List<TimeSpan>();
                    List<TimeSpan> thoiGianKetThucList = new List<TimeSpan>();

                    foreach (DataRow row3 in dt3.Rows)
                    {
                        TimeSpan thoiGianBatDau = TimeSpan.Parse(row3["ThoiGianBatDau"].ToString());
                        TimeSpan thoiGianKetThuc = TimeSpan.Parse(row3["ThoiGianKetThuc"].ToString());

                        thoiGianBatDauList.Add(thoiGianBatDau);
                        thoiGianKetThucList.Add(thoiGianKetThuc);
                    }

                    // Kiểm tra trùng lặp giữa Tên A và các Tên khác
                    for (int i = 0; i < tenArr.Length; i++)
                    {
                        if (i != Array.IndexOf(tenArr, ten)) // Bỏ qua so sánh với chính Tên A
                        {
                            string tenKhac = tenArr[i];

                            string s2 = "select MaCLV from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = N'" + tenKhac.Trim() + "'";
                            DataTable dt4 = data.getData(s2);

                            foreach (DataRow row4 in dt4.Rows)
                            {
                                string maCLVKhac = row4["MaCLV"].ToString();

                                string s22 = "select ThoiGianBatDau, ThoiGianKetThuc from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and MaCLV = '" + maCLVKhac + "'";
                                DataTable dt5 = data.getData(s22);

                                foreach (DataRow row5 in dt5.Rows)
                                {
                                    TimeSpan thoiGianBatDauKhac = TimeSpan.Parse(row5["ThoiGianBatDau"].ToString());
                                    TimeSpan thoiGianKetThucKhac = TimeSpan.Parse(row5["ThoiGianKetThuc"].ToString());

                                    // Kiểm tra trùng lặp giữa Tên A và Tên B/C
                                    bool trungLap = KiemTraTrungLap(thoiGianBatDauList, thoiGianKetThucList, thoiGianBatDauKhac, thoiGianKetThucKhac);
                                    if (trungLap)
                                    {
                                        // Thực hiện xử lý khi có trùng lặp
                                        string tenTrungLap = ten;
                                        string tenKhacTrungLap = tenKhac;
                                        TimeSpan thoiGianBatDauTrungLap = thoiGianBatDauKhac;
                                        TimeSpan thoiGianKetThucTrungLap = thoiGianKetThucKhac;
                                        string thoiGianBatDauFormatted = thoiGianBatDauTrungLap.ToString("hh\\:mm");
                                        string thoiGianKetThucFormatted = thoiGianKetThucTrungLap.ToString("hh\\:mm");
                                        // Hiển thị thông tin trong TextBox
                                        Label23.Text = $"Ca [{tenTrungLap}] và [{tenKhacTrungLap}] bị cấn thời gian ({thoiGianBatDauFormatted} - {thoiGianKetThucFormatted}).";
                                        TextBox2.Text = "no";
                                        // ...
                                    }
                                }
                            }
                        }
                    }
                }
            }


        }
        bool KiemTraTrungLap(List<TimeSpan> thoiGianBatDauList, List<TimeSpan> thoiGianKetThucList, TimeSpan thoiGianBatDauKhac, TimeSpan thoiGianKetThucKhac)
        {
            for (int i = 0; i < thoiGianBatDauList.Count; i++)
            {
                TimeSpan thoiGianBatDau = thoiGianBatDauList[i];
                TimeSpan thoiGianKetThuc = thoiGianKetThucList[i];

                if (thoiGianBatDauKhac < thoiGianKetThuc && thoiGianKetThucKhac > thoiGianBatDau)
                {
                    // Có trùng lặp
                    return true;
                }
            }

            // Không có trùng lặp
            return false;
        }
        protected void ketthucroi(object sender, EventArgs e)
        {

            bool isValidFormat = false;
            DateTime startDate;
            DateTime endDate;
            if (!string.IsNullOrEmpty(TextBox3.Text))
            {
                string[] dateRange = TextBox3.Text.Split('-');

                if (dateRange.Length == 2)
                {
                    if (DateTime.TryParseExact(dateRange[0].Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate)
                        && DateTime.TryParseExact(dateRange[1].Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate))
                    {
                        isValidFormat = true;
                    }
                }
            }
            if (isValidFormat)
            {
                Label25.Visible = false;
                string timeRange = TextBox3.Text;
                string[] timeParts = timeRange.Split(new string[] { " - " }, StringSplitOptions.None);
                string startTime = timeParts[0];
                string endTime = timeParts[1];
                TinhNgayApDung();
                if (Label24.Text == "Toàn công ty")
                {
                    if (TextBox1.Text == "")
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
                    if ((int)data.getSingleValue("SELECT COUNT(*) FROM PhanCa,CaLamViec WHERE PhanCa.MaCLV = CaLamViec.MaCLV and CaLamViec.MaW ='" + Request.Cookies["workspacxe"]["Maw"] + "' and PhanCa.TenPC = N'" + TextBox1.Text + "'") > 0)
                    {
                        Label29.Visible = true;
                        TextBox1.Attributes["class"] = "form-control is-invalid";
                        return;
                    }
                    else
                    {
                        TextBox1.Attributes["class"] = "form-control";
                        Label29.Visible = false;
                    }
                    if (dungchungca.GetSelectedIndices().Length == 0)
                    {
                        Label28.Visible = true;
                        return;
                    }
                    else
                    {
                        Label28.Visible = false;
                    }

                    List<string> checkcachung = new List<string>();

                    foreach (ListItem item in dungchungca.Items)
                    {
                        if (item.Selected)
                        {
                            checkcachung.Add(item.Text);
                        }
                    }
                    //TextBox5.Text = "";
                    string huhu = string.Join("", checkcachung);
                    Label19.Text = string.Join(", ", checkcachung);

                    string[] tenArr = Label19.Text.Split(',');
                    foreach (string ten in tenArr)
                    {
                        string s1 = "SELECT MaCLV FROM CaLamViec WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' AND TenCLV = N'" + ten.Trim() + "'";
                        DataTable dt2 = data.getData(s1);
                        foreach (DataRow row2 in dt2.Rows)
                        {
                            string maCLV = row2["MaCLV"].ToString();


                            string nv = "select MaNV from NhanVien where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";

                            DataTable dt = data.getData(nv);

                            foreach (DataRow row1 in dt.Rows)
                            {
                                string maNV = row1["MaNV"].ToString();
                                string ketthucthoi = "INSERT INTO PhanCa VALUES (N'" + TextBox1.Text + "','" + maNV + "','" + startTime + "','" + endTime + "',N'" + TextBox4.Text + "','" + maCLV + "',N'Toàn công ty')";
                                if (TextBox2.Text == "ok")
                                {
                                    if (data.updateData(ketthucthoi) > 0)
                                    {
                                        Label21.Text = "Thành công";
                                        Response.Redirect("PhanCaLamViec1.aspx");
                                    }
                                    else
                                    {
                                        Label21.Text = "Thất bại";
                                    }
                                }
                                else if (TextBox2.Text == "no")
                                {
                                    Label20.Text = "Lịch không thể lưu!";
                                }
                            }
                        }
                    }
                }
                else if (Label24.Text == "Vị trí công việc")
                {
                    if (TextBox1.Text == "")
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
                    if ((int)data.getSingleValue("SELECT COUNT(*) FROM PhanCa,CaLamViec WHERE PhanCa.MaCLV = CaLamViec.MaCLV and CaLamViec.MaW ='" + Request.Cookies["workspacxe"]["Maw"] + "' and PhanCa.TenPC = N'" + TextBox1.Text + "'") > 0)
                    {
                        Label29.Visible = true;
                        TextBox1.Attributes["class"] = "form-control is-invalid";
                        return;
                    }
                    else
                    {
                        TextBox1.Attributes["class"] = "form-control";
                        Label29.Visible = false;
                    }
                    if (ListBox3.GetSelectedIndices().Length == 0)
                    {
                        Label27.Visible = true;
                        return;

                    }
                    else
                    {
                        Label27.Visible = false;
                    }
                    if (dungchungca.GetSelectedIndices().Length == 0)
                    {
                        Label28.Visible = true;
                        return;
                    }
                    else
                    {
                        Label28.Visible = false;
                    }

                    List<string> checkcachung = new List<string>();
                    string doituong = "";
                    foreach (ListItem selectedItem in ListBox3.Items)
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
                    foreach (ListItem item in dungchungca.Items)
                    {
                        if (item.Selected)
                        {
                            checkcachung.Add(item.Text);
                        }
                    }
                    //TextBox5.Text = "";
                    string huhu = string.Join("", checkcachung);
                    Label19.Text = string.Join(", ", checkcachung);

                    string[] tenArr = Label19.Text.Split(',');
                    foreach (string ten in tenArr)
                    {
                        string s1 = "SELECT MaCLV FROM CaLamViec WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' AND TenCLV = N'" + ten.Trim() + "'";
                        DataTable dt2 = data.getData(s1);
                        foreach (DataRow row2 in dt2.Rows)
                        {
                            string maCLV = row2["MaCLV"].ToString();



                            string vitri = "";
                            
                            foreach (ListItem item in ListBox3.Items)
                            {
                                if (item.Selected)
                                {
                                    // Lấy giá trị của ListItem được chọn và thêm vào chuỗi vitri
                                    vitri += "N'" + item.Value.Replace("'", "''") + "',";
                                    //doituong += "N'" + item.Value.Replace("'", "''") + "',";
                                }
                            }

                            // Loại bỏ dấu phẩy cuối cùng nếu có
                            if (vitri.EndsWith(","))
                            {
                                vitri = vitri.TrimEnd(',');
                            }

                            string nv = "SELECT MaNV FROM NhanVien INNER JOIN ChucVu ON NhanVien.MaCV = ChucVu.MaCV WHERE ChucVu.TenCV IN (" + vitri + ") AND NhanVien.MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                            string nv2 = "SELECT MaCV FROM ChucVu WHERE TenCV IN (" + vitri + ")";

                            DataTable dt = data.getData(nv);

                            foreach (DataRow row1 in dt.Rows)
                            {
                                string maNV = row1["MaNV"].ToString();
                                string ketthucthoi = "INSERT INTO PhanCa VALUES (N'" + TextBox1.Text + "','" + maNV + "','" + startTime + "','" + endTime + "',N'" + TextBox4.Text + "','" + maCLV + "',N'"+ doituong + "')";
                                if (TextBox2.Text == "ok")
                                {
                                    if (data.updateData(ketthucthoi) > 0)
                                    {
                                        Label21.Text = "Thành công";
                                        Response.Redirect("PhanCaLamViec1.aspx");
                                    }
                                    else
                                    {
                                        Label21.Text = "Thất bại";
                                    }
                                }
                                else if (TextBox2.Text == "no")
                                {
                                    Label20.Text = "Lịch không thể lưu!";
                                }
                            }
                        }
                    }
                }
                else if (Label24.Text == "Nhân viên cụ thể")
                {
                    if (TextBox1.Text == "")
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
                    if ((int)data.getSingleValue("SELECT COUNT(*) FROM PhanCa,CaLamViec WHERE PhanCa.MaCLV = CaLamViec.MaCLV and CaLamViec.MaW ='" + Request.Cookies["workspacxe"]["Maw"] + "' and PhanCa.TenPC = N'" + TextBox1.Text + "'") > 0)
                    {
                        Label29.Visible = true;
                        TextBox1.Attributes["class"] = "form-control is-invalid";
                        return;
                    }
                    else
                    {
                        TextBox1.Attributes["class"] = "form-control";
                        Label29.Visible = false;
                    }



                    if (ListBox2.GetSelectedIndices().Length == 0)
                    {
                        Label27.Visible = true;
                        return;
                    }
                    else
                    {
                        Label27.Visible = false;
                    }
                    if (dungchungca.GetSelectedIndices().Length == 0)
                    {
                        Label28.Visible = true;
                        return;
                    }
                    else
                    {
                        Label28.Visible = false;
                    }

                    
                    List<string> checkcachung = new List<string>();

                    foreach (ListItem item in dungchungca.Items)
                    {
                        if (item.Selected)
                        {
                            checkcachung.Add(item.Text);
                        }
                    }
                    //TextBox5.Text = "";
                    string huhu = string.Join("", checkcachung);
                    Label19.Text = string.Join(", ", checkcachung);

                    string[] tenArr = Label19.Text.Split(',');
                    foreach (string ten in tenArr)
                    {
                        string s1 = "SELECT MaCLV FROM CaLamViec WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' AND TenCLV = N'" + ten.Trim() + "'";
                        DataTable dt2 = data.getData(s1);
                        foreach (DataRow row2 in dt2.Rows)
                        {
                            string maCLV = row2["MaCLV"].ToString();

                            string nvct = "";
                            foreach (ListItem item in ListBox2.Items)
                            {
                                if (item.Selected)
                                {
                                    // Lấy giá trị của ListItem được chọn và thêm vào chuỗi nvct
                                    nvct += "'" + item.Value.Replace("'", "''") + "',";
                                    
                                }
                            }
                            if (nvct.EndsWith(","))
                            {
                                nvct = nvct.TrimEnd(',');
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

                            string nv = "SELECT MaNV FROM NhanVien WHERE MaNV IN (" + nvct + ") AND MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                            DataTable dt = data.getData(nv);

                            foreach (DataRow row1 in dt.Rows)
                            {
                                string maNV = row1["MaNV"].ToString();
                                //doituong += maNV;
                                string ketthucthoi = "INSERT INTO PhanCa VALUES (N'" + TextBox1.Text + "','" + maNV + "','" + startTime + "','" + endTime + "',N'" + TextBox4.Text + "','" + maCLV + "',N'"+ doituong + "')";
                                if (TextBox2.Text == "ok")
                                {
                                    
                                        if (data.updateData(ketthucthoi) > 0)
                                        {
                                            Label21.Text = "Thành công";
                                        Response.Redirect("PhanCaLamViec1.aspx");
                                    }
                                        else
                                        {
                                            Label21.Text = "Thất bại";
                                        }
                                    
                                }else if(TextBox2.Text == "no")
                                {
                                    Label20.Text = "Lịch không thể lưu!";
                                }
                            }
                        }
                    }
                }
                else
                {
                    Label4.Text = "Lỗi kìa you";
                }
                //string aa = "2";
                //string ketthucthoi = "insert into PhanCa values (N'" + TextBox1.Text + "','" + aa + "','" + startTime + "','" + endTime + "',N'oke','27')";
                //if (data.updateData(ketthucthoi) > 0)
                //{
                //    Label21.Text = "Thanh cong";
                //}
                //else
                //{
                //    Label21.Text = "that bai";
                //}
            }
            else
            {
                // Hiển thị thông báo lỗi trong Label
                Label25.Visible = true;
                Label25.Text = "Định dạng ngày không hợp lệ. Vui lòng nhập theo định dạng tháng/ngày/năm - tháng/ngày/năm.";
            }


        }
        //private bool IsTimeOverlapping(string thoiGianBatDau, string thoiGianKetThuc, string maNV)
        //{
        //    string formattedNgayLamViec = GetFormattedNgayLamViec();

        //    string query = "SELECT MaCLV FROM PhanCa WHERE MaNV = '" + maNV + "' AND NgayLamViec IN (" + formattedNgayLamViec + ")";
        //    DataTable phanCaTable = data.getData(query);

        //    foreach (DataRow row in phanCaTable.Rows)
        //    {
        //        string maCLV = row["MaCLV"].ToString();
        //        ListBox5.Items.Add(maCLV);
        //        string query2 = "SELECT ThoiGianBatDau, ThoiGianKetThuc FROM CaLamViec WHERE MaCLV = '" + maCLV + "'";
        //        DataTable caLamViecTable = data.getData(query2);
        //        if (caLamViecTable.Rows.Count > 0)
        //        {
        //            string caLamViecThoiGianBatDau = caLamViecTable.Rows[0]["ThoiGianBatDau"].ToString();
        //            string caLamViecThoiGianKetThuc = caLamViecTable.Rows[0]["ThoiGianKetThuc"].ToString();

        //            // Chuyển đổi thời gian thành đối tượng DateTime
        //            DateTime batDau = DateTime.ParseExact(thoiGianBatDau, "MM/dd/yyyy", CultureInfo.InvariantCulture);
        //            DateTime ketThuc = DateTime.ParseExact(thoiGianKetThuc, "MM/dd/yyyy", CultureInfo.InvariantCulture);
        //            DateTime caLamViecBatDau = DateTime.ParseExact(caLamViecThoiGianBatDau, "MM/dd/yyyy", CultureInfo.InvariantCulture);
        //            DateTime caLamViecKetThuc = DateTime.ParseExact(caLamViecThoiGianKetThuc, "MM/dd/yyyy", CultureInfo.InvariantCulture);

        //            // Kiểm tra sự trùng lặp thời gian
        //            if ((batDau >= caLamViecBatDau && batDau <= caLamViecKetThuc) || (ketThuc >= caLamViecBatDau && ketThuc <= caLamViecKetThuc))
        //            {
        //                return true; // Có sự trùng lặp thời gian
        //            }
        //        }
        //    }

        //    return false; // Không có sự trùng lặp thời gian
        //}

        //private string GetFormattedNgayLamViec()
        //{
        //    string NgayDangChon = TextBox4.Text;
        //    string[] ngayDangChonArr = NgayDangChon.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

        //    List<string> formattedNgayLamViecList = new List<string>();
        //    foreach (string ngay in ngayDangChonArr)
        //    {
        //        formattedNgayLamViecList.Add(ngay.Trim());
        //    }

        //    string formattedNgayLamViec = "'" + string.Join("','", formattedNgayLamViecList) + "'";
        //    return formattedNgayLamViec;
        //}
        void checkCaDaPhan()
        {
            if (Label24.Text == "Toàn công ty")
            {
                TinhNgayApDung();
                Label26.Text = "";
                TextBox2.Text = "ok";
                string nv = "SELECT MaNV FROM NhanVien WHERE MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                DataTable dt = data.getData(nv);
                string NgayDangChon = TextBox4.Text; // dữ liệu của TextBox4 chứa 10/04/2023, 10/05/2023, 10/06/2023, 10/07/2023
                Dictionary<string, List<DateTime>> nhanVienNgayLamViec = new Dictionary<string, List<DateTime>>(); // Lưu trữ ngày làm việc của từng nhân viên

                foreach (DataRow row1 in dt.Rows)
                {
                    string maNV = row1["MaNV"].ToString(); // Mã nhân viên

                    string maphanca = "SELECT NgayLamViec FROM PhanCa WHERE MaNV = '" + maNV + "'";
                    DataTable nc = data.getData(maphanca);
                    foreach (DataRow row2 in nc.Rows)
                    {
                        string ngaylv = row2["NgayLamViec"].ToString();  // Ví dụ: "10/02/2023, 10/03/2023, 10/06/2023, 10/07/2023"
                        List<DateTime> ngayLamViecList = new List<DateTime>();

                        string[] ngayLamViecArr = ngaylv.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string ngay in ngayLamViecArr)
                        {
                            DateTime ngayLamViec;
                            if (DateTime.TryParseExact(ngay.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out ngayLamViec))
                            {
                                ngayLamViecList.Add(ngayLamViec);
                            }
                        }

                        // So sánh các ngày làm việc của nhân viên với ngày/tháng/năm trong TextBox4
                        string[] ngayDangChonArr = NgayDangChon.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string ngayChon in ngayDangChonArr)
                        {
                            DateTime ngayChonDT;
                            if (DateTime.TryParseExact(ngayChon.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out ngayChonDT))
                            {
                                if (ngayLamViecList.Contains(ngayChonDT))
                                {
                                    // Có sự trùng lặp
                                    // Thực hiện các hành động cần thiết khi có sự trùng lặp
                                    // Ví dụ: ListBox5.Items.Add(ngayChon);
                                    Label26.Text = "Có lẽ bạn bị cấn thời gian với lịch cũ của các nhân viên";
                                    TextBox2.Text = "no";
                                    //string[] tenArr = Label19.Text.Split(',');
                                    //foreach (string ten in tenArr)
                                    //{
                                    //    string s1 = "select MaCLV from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = N'" + ten.Trim() + "'";
                                    //    DataTable dt2 = data.getData(s1);
                                    //    foreach (DataRow row4 in dt2.Rows)
                                    //    {
                                    //        string maCaLamViec = row4["MaCLV"].ToString();

                                    //        string query = "SELECT * FROM CaLamViec WHERE MaCLV = '" + maCaLamViec + "' and MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                                    //        DataTable caLamViecTable = data.getData(query);
                                    //        if (caLamViecTable.Rows.Count > 0)
                                    //        {
                                    //            string thoiGianBatDau = caLamViecTable.Rows[0]["ThoiGianBatDau"].ToString();
                                    //            string thoiGianKetThuc = caLamViecTable.Rows[0]["ThoiGianKetThuc"].ToString();

                                    //            // Kiểm tra sự trùng lặp thời gian
                                    //            if (IsTimeOverlapping(thoiGianBatDau, thoiGianKetThuc, maNV))
                                    //            {
                                    //                TextBox6.Text = "huhu";
                                    //            }
                                    //        }
                                    //    }
                                    //}
                                }
                            }
                        }
                    }
                }
            }

            else if (Label24.Text == "Vị trí công việc")
            {
                string vitri = "";
                foreach (ListItem item in ListBox3.Items)
                {
                    if (item.Selected)
                    {
                        // Lấy giá trị của ListItem được chọn và thêm vào chuỗi vitri
                        vitri += "N'" + item.Value.Replace("'", "''") + "',";
                    }
                }

                // Loại bỏ dấu phẩy cuối cùng nếu có
                if (vitri.EndsWith(","))
                {
                    vitri = vitri.TrimEnd(',');
                }

                string nv = "SELECT MaNV FROM NhanVien INNER JOIN ChucVu ON NhanVien.MaCV = ChucVu.MaCV WHERE ChucVu.TenCV IN (" + vitri + ") AND NhanVien.MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                TinhNgayApDung();
                Label26.Text = "";
                TextBox2.Text = "ok";
                DataTable dt = data.getData(nv);
                string NgayDangChon = TextBox4.Text; // dữ liệu của TextBox4 chứa 10/04/2023, 10/05/2023, 10/06/2023, 10/07/2023
                Dictionary<string, List<DateTime>> nhanVienNgayLamViec = new Dictionary<string, List<DateTime>>(); // Lưu trữ ngày làm việc của từng nhân viên

                foreach (DataRow row1 in dt.Rows)
                {
                    string maNV = row1["MaNV"].ToString(); // Mã nhân viên

                    string maphanca = "SELECT NgayLamViec FROM PhanCa WHERE MaNV = '" + maNV + "'";
                    DataTable nc = data.getData(maphanca);
                    foreach (DataRow row2 in nc.Rows)
                    {
                        string ngaylv = row2["NgayLamViec"].ToString();  // Ví dụ: "10/02/2023, 10/03/2023, 10/06/2023, 10/07/2023"
                        List<DateTime> ngayLamViecList = new List<DateTime>();

                        string[] ngayLamViecArr = ngaylv.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string ngay in ngayLamViecArr)
                        {
                            DateTime ngayLamViec;
                            if (DateTime.TryParseExact(ngay.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out ngayLamViec))
                            {
                                ngayLamViecList.Add(ngayLamViec);
                            }
                        }

                        // So sánh các ngày làm việc của nhân viên với ngày/tháng/năm trong TextBox4
                        string[] ngayDangChonArr = NgayDangChon.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string ngayChon in ngayDangChonArr)
                        {
                            DateTime ngayChonDT;
                            if (DateTime.TryParseExact(ngayChon.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out ngayChonDT))
                            {
                                if (ngayLamViecList.Contains(ngayChonDT))
                                {
                                    // Có sự trùng lặp
                                    // Thực hiện các hành động cần thiết khi có sự trùng lặp
                                    // Ví dụ: ListBox5.Items.Add(ngayChon);
                                    Label26.Text = "Có lẽ bạn bị cấn thời gian với lịch cũ của các nhân viên";
                                    TextBox2.Text = "no";
                                    //string[] tenArr = Label19.Text.Split(',');
                                    //foreach (string ten in tenArr)
                                    //{
                                    //    string s1 = "select MaCLV from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = N'" + ten.Trim() + "'";
                                    //    DataTable dt2 = data.getData(s1);
                                    //    foreach (DataRow row4 in dt2.Rows)
                                    //    {
                                    //        string maCaLamViec = row4["MaCLV"].ToString();

                                    //        string query = "SELECT * FROM CaLamViec WHERE MaCLV = '" + maCaLamViec + "' and MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                                    //        DataTable caLamViecTable = data.getData(query);
                                    //        if (caLamViecTable.Rows.Count > 0)
                                    //        {
                                    //            string thoiGianBatDau = caLamViecTable.Rows[0]["ThoiGianBatDau"].ToString();
                                    //            string thoiGianKetThuc = caLamViecTable.Rows[0]["ThoiGianKetThuc"].ToString();

                                    //            // Kiểm tra sự trùng lặp thời gian
                                    //            if (IsTimeOverlapping(thoiGianBatDau, thoiGianKetThuc, maNV))
                                    //            {
                                    //                TextBox6.Text = "huhu";
                                    //            }
                                    //        }
                                    //    }
                                    //}
                                }
                            }
                        }
                    }
                }
            }
            else if (Label24.Text == "Nhân viên cụ thể")
            {
                string nvct = "";
                foreach (ListItem item in ListBox2.Items)
                {
                    if (item.Selected)
                    {
                        // Lấy giá trị của ListItem được chọn và thêm vào chuỗi nvct
                        nvct += "'" + item.Value.Replace("'", "''") + "',";
                    }
                }
                if (nvct.EndsWith(","))
                {
                    nvct = nvct.TrimEnd(',');
                }

                string nv = "SELECT MaNV FROM NhanVien WHERE MaNV IN (" + nvct + ") AND MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                //DataTable dt = data.getData(nv);

                //Dictionary<string, List<DateTime>> nhanVienNgayLamViec = new Dictionary<string, List<DateTime>>(); // Lưu trữ ngày làm việc của từng nhân viên

                //foreach (DataRow row1 in dt.Rows)
                //{
                //    string maNV = row1["MaNV"].ToString(); // Mã nhân viên

                //    string maphanca = "SELECT NgayLamViec,MaCLV FROM PhanCa WHERE MaNV = '" + maNV + "'";
                //    DataTable nc = data.getData(maphanca);
                //    foreach (DataRow row2 in nc.Rows)
                //    {
                //        string ngaylv = row2["NgayLamViec"].ToString();  // Ví dụ: "10/02/2023, 10/03/2023, 10/06/2023, 10/07/2023"
                //        string calv = row2["MaCLV"].ToString(); //Mã ca làm việc

                //        string giolv = "select ThoiGianBatDau,ThoiGianKetThuc from CaLamViec where MaCLV = '" + calv + "'";
                //        DataTable gio = data.getData(giolv);
                //        foreach (DataRow row3 in gio.Rows)
                //        {
                //            string thoigianbd = row3["ThoiGianBatDau"].ToString(); //vd: 07:00:00
                //            string thoigiankt = row3["ThoiGianKetThuc"].ToString(); //vd: 11:00:00
                //            TimeSpan batDau = TimeSpan.Parse(thoigianbd);
                //            TimeSpan ketThuc = TimeSpan.Parse(thoigiankt);


                //            string[] values = ngaylv.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); // Tách chuỗi thành mảng các giá trị con
                //            List<DateTime> ngayLamViecList = new List<DateTime>();

                //            foreach (string value in values)
                //            {
                //                // Xóa các khoảng trắng và chữ "Ngày " từ giá trị
                //                string dayValue = value.Trim().Replace(", ", "");

                //                if (DateTime.TryParseExact(dayValue, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime ngay))
                //                {
                //                    ngayLamViecList.Add(ngay); // Thêm ngày làm việc vào danh sách
                //                }
                //            }

                //            // Kiểm tra sự trùng lặp ngày làm việc
                //            foreach (KeyValuePair<string, List<DateTime>> pair in nhanVienNgayLamViec)
                //            {
                //                if (pair.Key != maNV && pair.Value.Intersect(ngayLamViecList).Any())
                //                {
                //                    // Có sự trùng lặp ngày làm việc giữa hai nhân viên
                //                    // Thực hiện các hành động cần thiết, ví dụ: thông báo lỗi, xử lý trùng lặp, vv.
                //                    //Label26.Text = "Trùng ngày rồi";
                //                    List<DateTime> trungLapNgay = pair.Value.Intersect(ngayLamViecList).ToList();

                //                    foreach (DateTime ngayTrungLap in trungLapNgay)
                //                    {
                //                        // Kiểm tra thời gian cắn nhau
                //                        DateTime gioBatDau = ngayTrungLap.Date + batDau; // Kết hợp ngày và thời gian bắt đầu
                //                        DateTime gioKetThuc = ngayTrungLap.Date + ketThuc; // Kết hợp ngày và thời gian kết thúc

                //                        if (gioBatDau <= gioKetThuc)
                //                        {
                //                            // Có thời gian cắn nhau
                //                            string maNVTrungLap = pair.Key; // Mã nhân viên bị trùng lặp
                //                            string thoiGianCan = gioBatDau.ToString("MM/dd/yyyy HH:mm") + " - " + gioKetThuc.ToString("MM/dd/yyyy HH:mm");
                //                            string qqs = "select TenNV from NhanVien where MaNV = '" + maNVTrungLap + "'";
                //                            DataTable ssq = data.getData(qqs);
                //                            foreach (DataRow row5 in ssq.Rows)
                //                            {
                //                                string tennv = row5["TenNV"].ToString();
                //                                Label26.Text = "Cấn lịch! Tên nhân viên: " + tennv + ", Thời gian cấn: " + thoiGianCan;
                //                            }

                //                        }
                //                    }
                //                }
                //            }


                //            // Lưu trữ danh sách ngày làm việc của nhân viên
                //            nhanVienNgayLamViec[maNV] = ngayLamViecList;
                //        }
                //    }
                //}
                TinhNgayApDung();
                Label26.Text = "";
                TextBox2.Text = "ok";
                DataTable dt = data.getData(nv);
                string NgayDangChon = TextBox4.Text; // dữ liệu của TextBox4 chứa 10/04/2023, 10/05/2023, 10/06/2023, 10/07/2023
                Dictionary<string, List<DateTime>> nhanVienNgayLamViec = new Dictionary<string, List<DateTime>>(); // Lưu trữ ngày làm việc của từng nhân viên

                foreach (DataRow row1 in dt.Rows)
                {
                    string maNV = row1["MaNV"].ToString(); // Mã nhân viên

                    string maphanca = "SELECT NgayLamViec FROM PhanCa WHERE MaNV = '" + maNV + "'";
                    DataTable nc = data.getData(maphanca);
                    foreach (DataRow row2 in nc.Rows)
                    {
                        string ngaylv = row2["NgayLamViec"].ToString();  // Ví dụ: "10/02/2023, 10/03/2023, 10/06/2023, 10/07/2023"
                        List<DateTime> ngayLamViecList = new List<DateTime>();

                        string[] ngayLamViecArr = ngaylv.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string ngay in ngayLamViecArr)
                        {
                            DateTime ngayLamViec;
                            if (DateTime.TryParseExact(ngay.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out ngayLamViec))
                            {
                                ngayLamViecList.Add(ngayLamViec);
                            }
                        }

                        // So sánh các ngày làm việc của nhân viên với ngày/tháng/năm trong TextBox4
                        string[] ngayDangChonArr = NgayDangChon.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string ngayChon in ngayDangChonArr)
                        {
                            DateTime ngayChonDT;
                            if (DateTime.TryParseExact(ngayChon.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out ngayChonDT))
                            {
                                if (ngayLamViecList.Contains(ngayChonDT))
                                {
                                    // Có sự trùng lặp
                                    // Thực hiện các hành động cần thiết khi có sự trùng lặp
                                    // Ví dụ: ListBox5.Items.Add(ngayChon);
                                    Label26.Text = "Có lẽ bạn bị cấn thời gian với lịch cũ của các nhân viên";
                                    TextBox2.Text = "no";
                                    //string[] tenArr = Label19.Text.Split(',');
                                    //foreach (string ten in tenArr)
                                    //{
                                    //    string s1 = "select MaCLV from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = N'" + ten.Trim() + "'";
                                    //    DataTable dt2 = data.getData(s1);
                                    //    foreach (DataRow row4 in dt2.Rows)
                                    //    {
                                    //        string maCaLamViec = row4["MaCLV"].ToString();

                                    //        string query = "SELECT * FROM CaLamViec WHERE MaCLV = '" + maCaLamViec + "' and MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "'";
                                    //        DataTable caLamViecTable = data.getData(query);
                                    //        if (caLamViecTable.Rows.Count > 0)
                                    //        {
                                    //            string thoiGianBatDau = caLamViecTable.Rows[0]["ThoiGianBatDau"].ToString();
                                    //            string thoiGianKetThuc = caLamViecTable.Rows[0]["ThoiGianKetThuc"].ToString();

                                    //            // Kiểm tra sự trùng lặp thời gian
                                    //            if (IsTimeOverlapping(thoiGianBatDau, thoiGianKetThuc, maNV))
                                    //            {
                                    //                TextBox6.Text = "huhu";
                                    //            }
                                    //        }
                                    //    }
                                    //}
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                Label4.Text = "Lỗi kìa you";
            }


            //string nv = "";
            //string ls = "select NgayLamViec from PhanCa,NhanVien where PhanCa.MaNV = NhanVien.MaNV and NhanVien.MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and NhanVien.MaNV = '"+nv+"'";
        }
        //protected void test_Click(object sender, EventArgs e)
        //{
        //    TextBox2.Text = string.Empty; // Xóa nội dung hiện tại của TextBox

        //    foreach (ListItem item in ListBox2.Items)
        //    {
        //        if (item.Selected)
        //        {
        //            TextBox2.Text += item.Text + ", ";
        //        }
        //    }
        //string s1 = "select MaCLV from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = '"+ huhu + "'";
        //DataTable dt2 = data.getData(s1);
        //foreach (DataRow row2 in dt2.Rows)
        //{
        //    string huhuhuhu = row2["MaCLV"].ToString();
        //    ListBox5.Items.Add(huhuhuhu);
        //}
        //string q3 = "SELECT ThoiGianBatDau,ThoiGianKetThuc FROM CaLamViec Where CaLamViec.MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and TenCLV = '" + huhu + "'";
        //DataTable dt = data.getData(q3);
        //    if (dt.Rows.Count > 0)
        //    {
        //        string tgbd = dt.Rows[0]["ThoiGianBatDau"].ToString();
        //string tgkt = dt.Rows[0]["ThoiGianKetThuc"].ToString();
        //Label20.Text = tgbd;
        //        Label21.Text = tgkt;
        //string s12 = "select ThoiGianBatDau,ThoiGianKetThuc from CaLamViec where MaW = '" + Request.Cookies["workspacxe"]["Maw"] + "' and MaCLV = '" +  + "'";
        //    }
        //}
        protected void quaylai_click(object sender, EventArgs e)
        {
            Response.Redirect("PhanCaLamViec1.aspx");
        }
    }
}