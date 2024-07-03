<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLLichLamViec1.aspx.cs" Inherits="TeamHire.QLLichLamViec1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.custom-calendar {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  border: 1px solid #ccc;
  padding: 10px;
}

.custom-calendar .DayHeader {
  text-align: center;
  background-color: #ddd;
  color: #333;
  font-weight: bold;
}

.custom-calendar .OtherMonth {
  color: #999;
}

.custom-calendar .Today {
  background-color: #ffc107;
  color: #fff;
  font-weight: bold;
}

.custom-calendar .Selected {
  background-color: #007bff;
  color: #fff;
}

.custom-calendar .ViewSelector {
  text-align: center;
  margin-bottom: 10px;
}

.custom-calendar .ViewSelector button {
  padding: 5px 10px;
  margin: 0 5px;
  background-color: #007bff;
  color: #fff;
  border: none;
  cursor: pointer;
}

.custom-calendar .ViewSelector button.active {
  background-color: #ffc107;
  color: #333;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
    <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Kết quả phân ca</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="QLThongKe1.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Nhóm làm việc</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
         <section class="content">
            <div >
<%--            <div class="calendar-header">Lịch làm việc</div>
            <div class="calendar-weekdays">
                <div class="calendar-weekday">Chủ nhật</div>
                <div class="calendar-weekday">Thứ hai</div>
                <div class="calendar-weekday">Thứ ba</div>
                <div class="calendar-weekday">Thứ tư</div>
                <div class="calendar-weekday">Thứ năm</div>
                <div class="calendar-weekday">Thứ sáu</div>
                <div class="calendar-weekday">Thứ bảy</div>
            </div>--%>
            <div >
                <asp:Calendar ID="Calendar1" runat="server" CssClass="table table-bordered" OnDayRender="Calendar1_DayRender" DayHeaderStyle-BackColor="#CCCCFF" ForeColor="Black" Font-Bold="True" BackColor="White">
                </asp:Calendar>
<div class="row">
                <div class="col">
                    <asp:Button ID="btnPreviousWeek" runat="server" Text="Tuần trước" OnClick="btnPreviousWeek_Click" />
<asp:Button ID="btnNextWeek" runat="server" Text="Tuần sau" OnClick="btnNextWeek_Click" />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered calendar-grid">
                        <Columns>
                            <asp:BoundField DataField="Time" HeaderText="Thời gian" />
                            <asp:BoundField DataField="Monday" HeaderText="Thứ 2" />
                            <asp:BoundField DataField="Tuesday" HeaderText="Thứ 3" />
                            <asp:BoundField DataField="Wednesday" HeaderText="Thứ 4" />
                            <asp:BoundField DataField="Thursday" HeaderText="Thứ 5" />
                            <asp:BoundField DataField="Friday" HeaderText="Thứ 6" />
                            <asp:BoundField DataField="Saturday" HeaderText="Thứ 7" />
                            <asp:BoundField DataField="Sunday" HeaderText="Chủ nhật" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            </div>

             </section>
         </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  function changeView(view) {
    // Gửi yêu cầu AJAX để cập nhật giao diện
    $.ajax({
      type: "POST",
      url: "QLLichLamViec1.aspx/ChangeView",
      data: JSON.stringify({ view: view }),
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (response) {
        // Cập nhật giao diện dựa trên kết quả trả về từ máy chủ
        if (view === 'day') {
          // Hiển thị đối tượng Calendar
          $('#<%= Calendar1.ClientID %>').show();
          $('#btnDay').addClass('active');
          $('#btnMonth').removeClass('active');
          $('#btnYear').removeClass('active');
        } else if (view === 'month') {
          // Ẩn đối tượng Calendar
          $('#<%= Calendar1.ClientID %>').hide();
          $('#btnDay').removeClass('active');
          $('#btnMonth').addClass('active');
          $('#btnYear').removeClass('active');
        } else if (view === 'year') {
          // Ẩn đối tượng Calendar
          $('#<%= Calendar1.ClientID %>').hide();
          $('#btnDay').removeClass('active');
          $('#btnMonth').removeClass('active');
          $('#btnYear').addClass('active');
        }
      }
    });
  }
</script>
       <script src="AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
</asp:Content>
