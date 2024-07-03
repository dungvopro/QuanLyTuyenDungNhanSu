using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace TeamHire
{
    public partial class BusinessPremium : System.Web.UI.Page
    {
        xuly01 data = new xuly01();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            if (Context.Items["vip"] == null)
                goivopro.SelectedValue = "0";
            else
            {
                string goivip = Context.Items["vip"].ToString();
                if (goivip == "1")
                {
                    goivopro.SelectedValue = "0";
                    Label2.Text = "Gói 1 tháng";
                    Label8.Text = " 1 (tháng)";
                    Label10.Text = " 19.000 vnd";
                    Label14.Text = " 19.000 vnd";
                }
                else
                {
                    goivopro.SelectedValue = "1";
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
                    TextBox1.Text = ten;
                    TextBox2.Text = mail;
                    TextBox3.Text = sdt;
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
        protected void cachtuan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(goivopro.SelectedValue == "0")
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
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        protected void momothanhtoan_click(object sender, EventArgs e)
        {
            string endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
            string partnerCode = "MOMO5RGX20191128";
            string accessKey = "M8brj9K6E22vXoDB";
            string serectkey = "nqQiVSgDMy809JoPF6OzP5OdBUB550Y4";
            string orderInfo = "Thanh toan goi Business Premium";
            string redirectUrl = "http://localhost:60886/BP.aspx";
            string ipnUrl = "http://localhost:60886/TrangChu1.aspx";
            string requestType = "captureWallet";
            string amount;
            string goivip,sotiengd, tieude;
            if (goivopro.SelectedValue == "0")
            {
                amount = "19000";
                goivip = "1";
                sotiengd = "19.000 vnd";
                tieude = "Thanh toan goi 1 thang";
            }
            else
            {
                amount = "99000";
                goivip = "6";
                sotiengd = "90.000 vnd";
                tieude = "Thanh toan goi 6 thang";
            }
            
            string orderId = Guid.NewGuid().ToString();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "accessKey=" + accessKey +
                "&amount=" + amount +
                "&extraData=" + extraData +
                "&ipnUrl=" + ipnUrl +
                "&orderId=" + orderId +
                "&orderInfo=" + orderInfo +
                "&partnerCode=" + partnerCode +
                "&redirectUrl=" + redirectUrl +
                "&requestId=" + requestId +
                "&requestType=" + requestType
                ;

            log.Debug("rawHash = " + rawHash);

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);
            log.Debug("Signature = " + signature);

            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "partnerName", "Test" },
                { "storeId", "MomoTestStore" },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderId },
                { "orderInfo", orderInfo },
                { "redirectUrl", redirectUrl },
                { "ipnUrl", ipnUrl },
                { "lang", "en" },
                { "extraData", extraData },
                { "requestType", requestType },
                { "signature", signature }

            };
            log.Debug("Json request to MoMo: " + message.ToString());
            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

            JObject jmessage = JObject.Parse(responseFromMomo);
            log.Debug("Return from MoMo: " + jmessage.ToString());
            ScriptManager.RegisterStartupScript(this, GetType(), "OpenWindow", "window.open('" + jmessage.GetValue("payUrl").ToString() + "','_blank');", true);

            //string sql = "insert into BusinessPremium values (N'" + Request.Cookies["Login"]["tenDN"].ToString() + "','02/02/2003')";
            //if (data.updateData(sql) > 0)
            //    Label11.Text = "thành công";
            //else
            //    Label11.Text = "thất bại";
            DateTime currentDateTime = DateTime.Now;
            // Hiển thị ngày giờ hiện tại
            string formattedDateTime = currentDateTime.ToString("MM/dd/yyyy");
            string tennguoidung = TextBox1.Text;

            // Chuyển đổi chuỗi thành dạng không dấu
            string tennguoidungKhongDau = RemoveDiacritics(tennguoidung);

            HttpCookie hi = new HttpCookie("BusinessPremium");
            hi["Goi"] = goivip;
            hi["TenGD"] = tennguoidungKhongDau;
            hi["ThoiGianGD"] = formattedDateTime;
            hi["SDTGD"] = TextBox3.Text;
            hi["GmailGD"] = TextBox2.Text;
            hi["tienGD"] = sotiengd;
            hi["TieuDeGD"] = tieude;
            hi.Expires = DateTime.Now.AddDays(1d);
            Response.Cookies.Add(hi);
        }
        public static string RemoveDiacritics(string text)
        {
            string formD = text.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < formD.Length; i++)
            {
                UnicodeCategory uc = CharUnicodeInfo.GetUnicodeCategory(formD[i]);
                if (uc != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(formD[i]);
                }
            }

            return sb.ToString().Normalize(NormalizationForm.FormC);
        }
    }
}