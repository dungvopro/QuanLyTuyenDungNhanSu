using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;

namespace TeamHire
{
    public partial class QLLichLamViec1 : System.Web.UI.Page
    {
        private xuly01 data = new xuly01();
        private DateTime startDate;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                startDate = GetStartDateOfWeek();
                List<CalendarRow> currentWeekData = GetWeekData(startDate);
                BindGrid(currentWeekData);
            }
        }

        private DateTime GetStartDateOfWeek()
        {
            DateTime today = DateTime.Today;
            DayOfWeek startOfWeek = DayOfWeek.Monday; // Tuần bắt đầu vào thứ Hai (Monday)
            int diff = (7 + (today.DayOfWeek - startOfWeek)) % 7;
            DateTime startDate = today.AddDays(-1 * diff).Date;

            return startDate;
        }
        protected void btnPreviousWeek_Click(object sender, EventArgs e)
        {
            DateTime today = DateTime.Today;
            DateTime previousWeekStart = GetStartDateOfWeek().AddDays(-7); // Lấy ngày bắt đầu của tuần hiện tại và lùi thêm 7 ngày
            List<CalendarRow> previousWeekData = GetWeekData(previousWeekStart);
            BindGrid(previousWeekData);
        }

        protected void btnNextWeek_Click(object sender, EventArgs e)
        {
            DateTime today = DateTime.Today;
            DateTime nextWeekStart = GetStartDateOfWeek().AddDays(7); // Lấy ngày bắt đầu của tuần hiện tại và tăng thêm 7 ngày
            List<CalendarRow> nextWeekData = GetWeekData(nextWeekStart);
            BindGrid(nextWeekData);
        }
        //}
        //protected void btnPreviousWeek_Click(object sender, EventArgs e)
        //{
        //    startDate = startDate.AddDays(-7); // Di chuyển ngày bắt đầu về tuần trước đó
        //    List<CalendarRow> previousWeekData = GetWeekData(startDate);
        //    BindGrid(previousWeekData);
        //}

        //protected void btnNextWeek_Click(object sender, EventArgs e)
        //{
        //    startDate = startDate.AddDays(7); // Di chuyển ngày bắt đầu tới tuần tiếp theo
        //    List<CalendarRow> nextWeekData = GetWeekData(startDate);
        //    BindGrid(nextWeekData);
        //}

        private List<CalendarRow> GetWeekData(DateTime startDate)
        {
            List<CalendarRow> calendarData = new List<CalendarRow>();

            // Lấy danh sách các ngày trong tuần
            List<DateTime> weekDays = new List<DateTime>();
            for (int i = 0; i < 7; i++)
            {
                DateTime day = startDate.AddDays(i);
                weekDays.Add(day);
            }

            // Lấy dữ liệu từ CSDL
            foreach (DateTime day in weekDays)
            {
                string query = "SELECT CaLamViec.ThoiGianBatDau, CaLamViec.ThoiGianKetThuc " +
                               "FROM CaLamViec " +
                               "INNER JOIN PhanCa ON CaLamViec.MaCLV = PhanCa.MaCLV " +
                               "WHERE PhanCa.NgayLamViec LIKE '%" + day.ToString("MM/dd/yyyy") + "%' and CaLamViec.MaW = '" + Request.Cookies["workspacxe"]["Maw"].ToString() + "'";

                // Sử dụng phương thức getData trong lớp xuly01
                DataTable dt = data.getData(query);

                // Xử lý dữ liệu và thêm vào danh sách calendarData
                CalendarRow row = new CalendarRow
                {
                    Time = "", // Thời gian làm việc (hour) không được lấy từ CSDL, nên để trống
                    Week = GetIso8601WeekOfYear(startDate),
                    Month = startDate.Month,
                    Monday = "",
                    Tuesday = "",
                    Wednesday = "",
                    Thursday = "",
                    Friday = "",
                    Saturday = "",
                    Sunday = ""
                };

                string dayOfWeek = day.DayOfWeek.ToString();
                int dayIndex = (int)day.DayOfWeek;

                // Tạo chuỗi "Thứ X (Ngày/Tháng)"
                string weekDay = "Thứ " + ((int)day.DayOfWeek + 1).ToString() + " (" + day.ToString("d/M") + ")";

                // Gán chuỗi ngày tháng vào ngày tương ứng
                switch (dayIndex)
                {
                    case 1:
                        row.Monday = weekDay;
                        break;
                    case 2:
                        row.Tuesday = weekDay;
                        break;
                    case 3:
                        row.Wednesday = weekDay;
                        break;
                    case 4:
                        row.Thursday = weekDay;
                        break;
                    case 5:
                        row.Friday = weekDay;
                        break;
                    case 6:
                        row.Saturday = weekDay;
                        break;
                    case 0:
                        row.Sunday = weekDay;
                        break;
                }

                foreach (DataRow dataRow in dt.Rows)
                {
                    string startTime = dataRow["ThoiGianBatDau"].ToString();
                    string endTime = dataRow["ThoiGianKetThuc"].ToString();

                    // Chuyển đổi chuỗi startTime và endTime thành đối tượng DateTime
                    DateTime startDateTime = DateTime.Parse(startTime);
                    DateTime endDateTime = DateTime.Parse(endTime);

                    // Lấy giờ và phút từ startDateTime và endDateTime
                    string startHour = startDateTime.ToString("HH");
                    string startMinute = startDateTime.ToString("mm");
                    string endHour = endDateTime.ToString("HH");
                    string endMinute = endDateTime.ToString("mm");

                    // Tạo chuỗi thời gian từ giờ và phút
                    string timeRange = startHour + ":" + startMinute + " - " + endHour + ":" + endMinute;

                    // Gán chuỗi thời gian vào ngày tương ứng
                    switch (dayIndex)
                    {
                        case 1:
                            row.Monday = timeRange + " (" + day.ToString("d/M") + ")";
                            break;
                        case 2:
                            row.Tuesday = timeRange + " (" + day.ToString("d/M") + ")";
                            break;
                        case 3:
                            row.Wednesday = timeRange + " (" + day.ToString("d/M") + ")";
                            break;
                        case 4:
                            row.Thursday = timeRange + " (" + day.ToString("d/M") + ")";
                            break;
                        case 5:
                            row.Friday = timeRange + " (" + day.ToString("d/M") + ")";
                            break;
                        case 6:
                            row.Saturday = timeRange + " (" + day.ToString("d/M") + ")";
                            break;
                        case 0:
                            row.Sunday = timeRange + " (" + day.ToString("d/M") + ")";
                            break;
                    }
                }
                calendarData.Add(row);

            }

            return calendarData;
        }

        private int GetIso8601WeekOfYear(DateTime date)
        {
            DayOfWeek day = CultureInfo.InvariantCulture.Calendar.GetDayOfWeek(date);
            if (day >= DayOfWeek.Monday && day <= DayOfWeek.Wednesday)
            {
                date = date.AddDays(3);
            }

            return CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
        }

        private void BindGrid(List<CalendarRow> weekData)
        {
            GridView1.DataSource = weekData;
            GridView1.DataBind();
        }




        //protected void btnPreviousWeek_Click(object sender, EventArgs e)
        //{
        //    DateTime today = DateTime.Today;
        //    DateTime previousWeekStart = today.AddDays(-7 - (int)today.DayOfWeek); // Tìm ngày đầu tiên của tuần trước đó
        //    List<CalendarRow> previousWeekData = GetWeekData(previousWeekStart);
        //    BindGrid(previousWeekData);
        //}

        //protected void btnNextWeek_Click(object sender, EventArgs e)
        //{
        //    DateTime today = DateTime.Today;
        //    DateTime nextWeekStart = today.AddDays(7 - (int)today.DayOfWeek); // Tìm ngày đầu tiên của tuần tiếp theo
        //    List<CalendarRow> nextWeekData = GetWeekData(nextWeekStart);
        //    BindGrid(nextWeekData);
        //}

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            // Kiểm tra nếu ngày hiện tại nằm trong danh sách sự kiện
            if (e.Day.Date >= DateTime.Today)
            {
                List<Event> events = GetEvents();

                // Kiểm tra xem có sự kiện nào xảy ra trong ngày hiện tại không
                foreach (var ev in events)
                {
                    if (ev.Start.Date == e.Day.Date)
                    {
                        // Tạo một đối tượng Label để hiển thị tiêu đề sự kiện
                        Label lblEvent = new Label();
                        lblEvent.Text = ev.Title;
                        lblEvent.CssClass = "event-title";

                        // Thêm Label vào ô ngày trong Calendar
                        e.Cell.Controls.Add(lblEvent);
                    }
                }
            }
        }

        public List<Event> GetEvents()
        {
            List<Event> events = new List<Event>();

            // Truy vấn CSDL để lấy danh sách sự kiện từ bảng PhanCa
            string query = "SELECT PhanCa.TenPC, PhanCa.NgayLamViec, PhanCa.MaCLV FROM PhanCa,CaLamViec where PhanCa.MaCLV = CaLamViec.MaCLV and CaLamViec.MaW = '" + Request.Cookies["workspacxe"]["Maw"].ToString() + "'";
            DataTable dt = data.getData(query);

            foreach (DataRow row in dt.Rows)
            {
                string title = row["TenPC"].ToString();
                string ngayLamViecString = row["NgayLamViec"].ToString();
                string[] ngayLamViecArray = ngayLamViecString.Split(',');

                foreach (string ngayLamViec in ngayLamViecArray)
                {
                    DateTime start = DateTime.ParseExact(ngayLamViec.Trim(), "MM/dd/yyyy", null);
                    string maCLV = row["MaCLV"].ToString();

                    // Lấy thông tin giờ làm từ bảng CaLamViec dựa vào mã giờ làm (maCLV)
                    string queryCaLamViec = "SELECT ThoiGianBatDau, ThoiGianKetThuc FROM CaLamViec WHERE MaCLV = '" + maCLV + "'";
                    DataTable dtCaLamViec = data.getData(queryCaLamViec);
                    if (dtCaLamViec.Rows.Count > 0)
                    {
                        TimeSpan startTime = TimeSpan.Parse(dtCaLamViec.Rows[0]["ThoiGianBatDau"].ToString());
                        TimeSpan endTime = TimeSpan.Parse(dtCaLamViec.Rows[0]["ThoiGianKetThuc"].ToString());

                        start = start.Date + startTime;
                        DateTime end = start.Date + endTime;

                        // Tạo đối tượng Event và thêm vào danh sách events
                        events.Add(new Event { Title = title, Start = start, End = end });
                    }
                }
            }

            return events;
        }


    }
    public class Event
    {
        public string Title { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
    }
    public class CalendarRow
    {
        public string Time { get; set; }
        public int Week { get; set; }
        public int Month { get; set; }
        public string Monday { get; set; }
        public string Tuesday { get; set; }
        public string Wednesday { get; set; }
        public string Thursday { get; set; }
        public string Friday { get; set; }
        public string Saturday { get; set; }
        public string Sunday { get; set; }
    }
}