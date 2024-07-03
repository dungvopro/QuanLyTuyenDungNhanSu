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
    public partial class BP : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            if (Request.Cookies["BusinessPremium"] != null)
            {
                string goivip = Request.Cookies["BusinessPremium"]["Goi"].ToString();
                if (goivip == "1")
                {
                    Label2.Text = "Gói 1 tháng";
                    Label8.Text = " 1 (tháng)";
                    Label10.Text = " 19.000 vnd";
                    Label14.Text = " 19.000 vnd";
                }
                else
                {
                    Label2.Text = "Gói 6 tháng";
                    Label8.Text = " 6 (tháng)";
                    Label10.Text = " 99.000 vnd";
                    Label14.Text = " 99.000 vnd";

                }
            }
            if (Request.Cookies["Login"] != null)
            {
                string q = "select * from TaiKhoan where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                DataTable dt = data.getData(q);
                if (dt.Rows.Count > 0)
                {
                    string imageFileName = dt.Rows[0]["avatar"].ToString();
                    string imagePath = "~/assets/images/" + imageFileName;
                    if (File.Exists(Server.MapPath(imagePath)))
                    {
                        // Gán đường dẫn hình ảnh vào cho ImageUrl
                        Image1.ImageUrl = ResolveUrl(imagePath);
                    }
                    else
                    {
                        // Nếu tập tin không tồn tại, có thể hiển thị một hình ảnh mặc định hoặc thông báo lỗi
                        Image1.ImageUrl = ResolveUrl("~/assets/images/bot_icon.jpg");
                    }
                    string ten = dt.Rows[0]["tennguoidung"].ToString();
                    string mail = dt.Rows[0]["email"].ToString();
                    string sdt = dt.Rows[0]["sodienthoai"].ToString();
                    //TextBox1.Text = ten;
                    //TextBox2.Text = mail;
                    //TextBox3.Text = sdt;
                    Label1.Text = ten;
                }
                string sql1 = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                DataTable wo1 = data.getData(sql1);
                if (wo1.Rows.Count > 0)
                {
                    DateTime ngayHetHan = Convert.ToDateTime(wo1.Rows[0]["Ngayhethan"]);

                    DateTime ngayHienTai = DateTime.Now;
                    TimeSpan thoiGianConLai = ngayHetHan - ngayHienTai;
                    int soNgayConLai = Math.Max(0, (int)thoiGianConLai.TotalDays);
                    Label7.Text = soNgayConLai.ToString();
                }
            }
        }
        protected void tieptucthanhtoan_click(object sender, EventArgs e)
        {
            //string ngayhethan;
            if (Request.Cookies["BusinessPremium"]["Goi"].ToString() == "1")
            {
                if ((int)data.getSingleValue("SELECT COUNT(*) FROM BusinessPremium WHERE username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'") > 0)
                {
                    string q = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                    DataTable dt = data.getData(q);
                    DateTime ngayHienTai = DateTime.Now;
                    DateTime ngayTiepTheo = ngayHienTai.AddDays(30);
                    if (dt.Rows.Count > 0)
                    {
                        string han = dt.Rows[0]["Ngayhethan"].ToString();
                        string mavip = dt.Rows[0]["MaVip"].ToString();
                        DateTime ngayHetHan = DateTime.Parse(han);

                        // Tính ngày tháng năm tiếp theo
                        ngayTiepTheo = ngayHetHan.AddDays(30);
                        string ngayTiepTheoFormatted = ngayTiepTheo.ToString("MM/dd/yyyy");
                        //DateTime ngayHetHan = DateTime.Parse(han);
                        //// Lấy ngày hiện tại
                        //DateTime ngayHienTai = DateTime.Now;
                        //// Tính số ngày còn lại
                        //TimeSpan timeSpan = ngayHetHan - ngayHienTai;
                        //int soNgayConLai = Math.Max(timeSpan.Days, 0);
                        string lulichsu = "insert into LichSuGiaoDich values(N'" + Request.Cookies["BusinessPremium"]["TieuDeGD"].ToString() + "','" + Request.Cookies["BusinessPremium"]["ThoiGianGD"].ToString() + "',N'Thành công',N'" + Request.Cookies["BusinessPremium"]["tienGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["GmailGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["TenGD"].ToString() + "',N'Thanh toán qua MOMO','" + mavip + "')";
                        if (data.updateData(lulichsu) > 0)
                        {
                            Label11.Text = "thành công";
                        }
                        else
                            Label11.Text = "thất bại";

                        string sql = "update BusinessPremium set Ngayhethan = '" + ngayTiepTheoFormatted + "' where MaVIP = '" + mavip + "'";
                        if (data.updateData(sql) > 0)
                        {
                            Label11.Text = ngayTiepTheoFormatted.ToString();
                            Response.Redirect("HoSoCaNhan1.aspx");
                        }
                        else
                            Label11.Text = "thất bại";


                        //string sql = "insert into BusinessPremium values (N'" + Request.Cookies["Login"]["tenDN"].ToString() + "','02/02/2003')";
                        //if (data.updateData(sql) > 0)
                        //    Label11.Text = "thành công";
                        //else
                        //    Label11.Text = "thất bại";

                    }
                }
                else
                {
                    DateTime ngayHienTai = DateTime.Now;
                    DateTime ngayTiepTheo = ngayHienTai.AddMonths(1);
                    string ngayHienTaiFormatted = ngayTiepTheo.ToString("MM/dd/yyyy");

                    string sql = "insert into BusinessPremium values (N'" + Request.Cookies["Login"]["tenDN"].ToString() + "','" + ngayHienTaiFormatted + "')";
                    if (data.updateData(sql) > 0)
                    {
                        Label11.Text = "thành công";
                        string tuyvan = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                        DataTable vantr = data.getData(tuyvan);
                        if (vantr.Rows.Count > 0) {
                            string mavip = vantr.Rows[0]["MaVip"].ToString();
                            string lulichsu = "insert into LichSuGiaoDich values(N'" + Request.Cookies["BusinessPremium"]["TieuDeGD"].ToString() + "','" + Request.Cookies["BusinessPremium"]["ThoiGianGD"].ToString() + "',N'Thành công',N'" + Request.Cookies["BusinessPremium"]["tienGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["GmailGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["TenGD"].ToString() + "',N'Thanh toán qua MOMO','" + mavip + "')";
                            if (data.updateData(lulichsu) > 0)
                            {
                                Label11.Text = "thành công";
                            }
                            else
                                Label11.Text = "thất bại";
                        }
                            Response.Redirect("HoSoCaNhan1.aspx");
                    }
                    else
                        Label11.Text = "thất bại";
                }
            }
            else
            {
                if ((int)data.getSingleValue("SELECT COUNT(*) FROM BusinessPremium WHERE username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'") > 0)
                {
                    string q = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                    DataTable dt = data.getData(q);
                    DateTime ngayHienTai = DateTime.Now;
                    DateTime ngayTiepTheo = ngayHienTai.AddMonths(6);
                    if (dt.Rows.Count > 0)
                    {
                        string han = dt.Rows[0]["Ngayhethan"].ToString();
                        string mavip = dt.Rows[0]["MaVip"].ToString();
                        DateTime ngayHetHan = DateTime.Parse(han);

                        string lulichsu = "insert into LichSuGiaoDich values(N'" + Request.Cookies["BusinessPremium"]["TieuDeGD"].ToString() + "','" + Request.Cookies["BusinessPremium"]["ThoiGianGD"].ToString() + "',N'Thành công',N'" + Request.Cookies["BusinessPremium"]["tienGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["GmailGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["TenGD"].ToString() + "',N'Thanh toán qua MOMO','" + mavip + "')";
                        if (data.updateData(lulichsu) > 0)
                        {
                            Label11.Text = "thành công";
                        }
                        else
                            Label11.Text = "thất bại";

                        ngayTiepTheo = ngayHetHan.AddMonths(6);
                        string ngayTiepTheoFormatted = ngayTiepTheo.ToString("MM/dd/yyyy");
                        string sql = "update BusinessPremium set Ngayhethan = '" + ngayTiepTheoFormatted + "' where MaVIP = '" + mavip + "'";
                        if (data.updateData(sql) > 0)
                        {
                            Label11.Text = ngayTiepTheoFormatted.ToString();
                            Response.Redirect("HoSoCaNhan1.aspx");
                        }
                        else
                            Label11.Text = "thất bại";
                    }
                }
                else
                {
                    DateTime ngayHienTai = DateTime.Now;
                    DateTime ngayTiepTheo = ngayHienTai.AddMonths(6);
                    string ngayHienTaiFormatted = ngayTiepTheo.ToString("MM/dd/yyyy");

                    string sql = "insert into BusinessPremium values (N'" + Request.Cookies["Login"]["tenDN"].ToString() + "','" + ngayHienTaiFormatted + "')";
                    if (data.updateData(sql) > 0)
                    {
                        Label11.Text = "thành công";
                        string tuyvan = "select * from BusinessPremium where username = N'" + Request.Cookies["Login"]["tenDN"].ToString() + "'";
                        DataTable vantr = data.getData(tuyvan);
                        if (vantr.Rows.Count > 0)
                        {
                            string mavip = vantr.Rows[0]["MaVip"].ToString();
                            string lulichsu = "insert into LichSuGiaoDich values(N'" + Request.Cookies["BusinessPremium"]["TieuDeGD"].ToString() + "','" + Request.Cookies["BusinessPremium"]["ThoiGianGD"].ToString() + "',N'Thành công',N'" + Request.Cookies["BusinessPremium"]["tienGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["GmailGD"].ToString() + "',N'" + Request.Cookies["BusinessPremium"]["TenGD"].ToString() + "',N'Thanh toán qua MOMO','" + mavip + "')";
                            if (data.updateData(lulichsu) > 0)
                            {
                                Label11.Text = "thành công";
                            }
                            else
                                Label11.Text = "thất bại";
                        }
                        Response.Redirect("HoSoCaNhan1.aspx");
                    }
                    else
                        Label11.Text = "thất bại";
                }
            }

            //string lulichsu = "insert into LichSuGiaoDich values(N'"+ Request.Cookies["BusinessPremium"]["tienGD"].ToString() + "','"+ Request.Cookies["BusinessPremium"]["ThoiGianGD"].ToString() + "',N'Thành công',N'"+ Request.Cookies["BusinessPremium"]["tienGD"].ToString() + "',N'"+ Request.Cookies["BusinessPremium"]["GmailGD"].ToString() + "',N'"+ Request.Cookies["BusinessPremium"]["TenGD"].ToString() + "',N'Thanh toán qua MOMO','"+ mavip + "')";
            //if (data.updateData(lulichsu) > 0)
            //{
            //    Label11.Text = "thành công";
            //}
            //else
            //    Label11.Text = "thất bại";

        }
    }
}